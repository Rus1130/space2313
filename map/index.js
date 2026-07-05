function addOverlay(path) {
    const overlay = two.makeRectangle(WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    overlay.fill = new Two.Texture(path);
    overlay.noStroke();
    OVERLAYS.set(path, overlay);
}

function removeOverlay(path) {
    const overlay = OVERLAYS.get(path);
    if (overlay) {
        two.remove(overlay);
        OVERLAYS.delete(path);
    }
}

function getLabelOffset(radius, size, pos = "tr") {
    const scaledRadius = radius * CITY_SCALE;
    const gap = 2;

    const top = pos.includes("t");
    const bottom = pos.includes("b");
    const left = pos.includes("l");
    const right = pos.includes("r");

    const horizontalGap = scaledRadius + gap;
    const verticalGap = scaledRadius + gap + size * 0.35;

    let dx = 0, dy = 0, alignment = "center";

    if (left) { dx = -horizontalGap; alignment = "right"; }
    else if (right) { dx = horizontalGap; alignment = "left"; }

    if (top) dy = -verticalGap;
    else if (bottom) dy = verticalGap;

    return { dx, dy, alignment };
}

// cache decoded image data so re-running addCities on the same path is free
const IMAGE_DATA_CACHE = new Map();

function getImageData(path, callback) {
    if (IMAGE_DATA_CACHE.has(path)) {
        callback(IMAGE_DATA_CACHE.get(path));
        return;
    }

    const img = new Image();
    img.onload = () => {
        const canvas = document.createElement("canvas");
        canvas.width = img.width;
        canvas.height = img.height;

        const ctx = canvas.getContext("2d", { willReadFrequently: true });
        ctx.imageSmoothingEnabled = false;
        ctx.drawImage(img, 0, 0);

        console.log(ctx)

        const result = {
            width: img.width,
            height: img.height,
            data: ctx.getImageData(0, 0, img.width, img.height).data,
        };

        IMAGE_DATA_CACHE.set(path, result);
        callback(result);
    };
    img.src = path;
}

// builds a boolean-ish Uint8Array mask of white pixels, indexed by y*width+x
function findWhiteMask({ width, height, data }) {
    const mask = new Uint8Array(width * height);
    for (let y = 0; y < height; y++) {
        const rowOffset = y * width;
        for (let x = 0; x < width; x++) {
            const i = (rowOffset + x) * 4;
            if (
                data[i] === 255 &&
                data[i + 1] === 255 &&
                data[i + 2] === 255 &&
                data[i + 3] > 0
            ) {
                mask[rowOffset + x] = 1;
            }
        }
    }
    return mask;
}

// flood fill over the mask using flat indices, O(n) total instead of O(n^2)
function findBlocks(mask, width, height) {
    const visited = new Uint8Array(mask.length);
    const blocks = [];

    for (let idx = 0; idx < mask.length; idx++) {
        if (!mask[idx] || visited[idx]) continue;

        const block = [];
        const stack = [idx];
        visited[idx] = 1;

        while (stack.length > 0) {
            const cur = stack.pop();
            const x = cur % width;
            const y = (cur - x) / width;
            block.push({ x, y });

            // 4-connected neighbors, bounds-checked
            if (x > 0 && mask[cur - 1] && !visited[cur - 1]) {
                visited[cur - 1] = 1;
                stack.push(cur - 1);
            }
            if (x < width - 1 && mask[cur + 1] && !visited[cur + 1]) {
                visited[cur + 1] = 1;
                stack.push(cur + 1);
            }
            if (y > 0 && mask[cur - width] && !visited[cur - width]) {
                visited[cur - width] = 1;
                stack.push(cur - width);
            }
            if (y < height - 1 && mask[cur + width] && !visited[cur + width]) {
                visited[cur + width] = 1;
                stack.push(cur + width);
            }
        }


        blocks.push(block);
    }

    const sortedBlocks = blocks.sort((a, b) => a.length - b.length);

    return sortedBlocks;
}

function addCities(path, cityLabels = []) {
    getImageData(path, (imgData) => {
        const mask = findWhiteMask(imgData);
        const blocks = findBlocks(mask, imgData.width, imgData.height);

        let i = 0;
        for (const block of blocks) {
            let sumX = 0, sumY = 0;
            for (const pixel of block) {
                sumX += pixel.x;
                sumY += pixel.y;
            }
            const x = sumX / block.length;
            const y = sumY / block.length;

            const radius = Math.sqrt(block.length);

            const labelObject = cityLabels[i];

            const type = labelObject?.type;

            if (type === "capital") {
                const city = two.makeStar(x, y, radius * 1.5, radius * 3, 5);
                city.fill = "white";
                city.stroke = "black";
                city.id = `${path}-capital-${i}`;
                city.scale = CITY_SCALE;

            } else if (type === "subcapital") {
                const city = two.makeStar(x, y, radius * 1.3, radius * 2.5, 3);
                city.fill = "white";
                city.stroke = "black";
                city.id = `${path}-capital-${i}`;
                city.scale = CITY_SCALE;
            } else {
                const city = two.makeCircle(x, y, radius);
                city.fill = "white";
                city.stroke = "black";
                city.id = `${path}-city-${i}`;
                city.scale = CITY_SCALE;
            }

            if (CITY_DEBUG) {
                const text = two.makeText(i, x + (radius * CITY_SCALE + 4), y);
                text.fill = "white";
                text.size = 12;
            }

            if (labelObject) {
                const size = labelObject.type === "capital" ? 24 : 
                            labelObject.type === "subcapital" ? 16 : 12;


                const position = labelObject.pos || "r";

                const yOffset = labelObject.y || 0;
                const xOffset = labelObject.x || 0;

                const contrast = labelObject.contrast || false;

                const { dx, dy, alignment } = getLabelOffset(radius, size, position);
                const label = two.makeText(labelObject.name, x + dx + xOffset, y + dy + yOffset);

                label.size = size;
                label.translation.y += yOffset;
                label.id = `${path}-city-label-${i}`;
                label.alignment = alignment;

                let type = labelObject.type || "default";

                if (type === "default") {
                    if(contrast) label.fill = "rgb(170, 170, 255)";
                    else label.fill = "black";
                } else if (type === "capital") {
                    label.fill = "rgb(170, 170, 255)";
                    label.stroke = "black";
                    label.linewidth = 1;
                } else if (type === "subcapital") {
                    // label.fill = "rgb(170, 170, 255)";
                    // label.stroke = "black";
                    // label.linewidth = 1;
                    if(contrast) {
                        label.fill = "rgb(170, 170, 255)";
                        label.stroke = "black";
                        label.linewidth = 0.6;
                    } else label.fill = "black";
                }
            }

            i++;
        }
    });
}