function updateCamera() {
    world.translation.set(
        two.width / 2 - camera.x * camera.zoom,
        two.height / 2 - camera.y * camera.zoom
    );

    world.scale = camera.zoom;
}

window.addEventListener("wheel", e => {
    e.preventDefault();

    const factor = e.deltaY > 0 ? 0.9 : 1.1;

    camera.zoom *= factor;
    camera.zoom = Math.max(0.02, Math.min(100, camera.zoom));

    // go through the orbits, and resize the orbit lines based on the new zoom level
    for(const [planet, orbit] of Object.entries(orbits)) {
        orbit.orbit.linewidth = 1 / camera.zoom;
        orbit.planet.radius = PLANET_RADIUS * (1/camera.zoom)
    }

    updateCamera();
}, { passive: false });

let dragging = false;
let lastX = 0;
let lastY = 0;

window.addEventListener("mousedown", e => {
    // Middle mouse button
    if (e.button === 1) {
        e.preventDefault();

        camera.x = 0;
        camera.y = 0;
        camera.zoom = 1;

        updateCamera();
        return;
    }

    // Left mouse drag
    if (e.button === 0) {
        dragging = true;
        lastX = e.clientX;
        lastY = e.clientY;
    }
});

window.addEventListener("mouseup", () => {
    dragging = false;
});

window.addEventListener("mousemove", e => {
    if (!dragging) return;

    camera.x -= (e.clientX - lastX) / camera.zoom;
    camera.y -= (e.clientY - lastY) / camera.zoom;

    lastX = e.clientX;
    lastY = e.clientY;

    updateCamera();
});

// if space is pressed, toggle paused 
window.addEventListener("keydown", e => {
    if (e.code === "Space") {
        camera.paused = !camera.paused;
    }
});

window.addEventListener("resize", updateCamera);
updateCamera();