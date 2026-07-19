// get file arguments
const fs = require('fs');
const path = require('path');
const name = process.argv.slice(2).join(' ');

if(!name) {
    console.error("Please provide a name for the new project.");
    process.exit(1);
}

const nameNormalized = name.replaceAll(" ", "-").replaceAll("---", "-").toLowerCase();

let day = new Date().getDate();
let month = new Date().getMonth() + 1;

const months = ["jan", "feb", "mar", "apr", "may", "june", "july", "aug", "sept", "oct", "nov", "dec"];

let year = new Date().getFullYear();
const date = `${day} ${months[month-1]}, ${year}`;

let metaTitle = `<meta property="og:title"       content="${name}"`
let metaDesc  = `<meta property="og:description" content=""`
let metaURL   = `<meta property="og:url"         content="https://rus1130.github.io/space2313/${nameNormalized}/"`

// find the longest of the three strings, and pad the others with spaces to match
let maxLength = Math.max(metaTitle.length, metaDesc.length, metaURL.length);
metaTitle = metaTitle.padEnd(maxLength, ' ') + " />";
metaDesc  = metaDesc.padEnd(maxLength, ' ') + " />";
metaURL   = metaURL.padEnd(maxLength, ' ') + " />";


const HTML_TEMPLATE = 
`<!-- written ${date} -->
<head>
    <link rel="stylesheet" href="./src/css.css">
    ${metaTitle}
    ${metaDesc}
    ${metaURL}
    <title>${name}</title>
</head>
<body>
</body>
<script type="module">
    import { SuperType } from 'https://rus1130.github.io/supertype/index.js';

    const tw = new SuperType(document.body, {
        "end": function() {
            const returnButton = document.createElement("div");
            returnButton.classList.add("button");
            returnButton.id = "return";
            returnButton.textContent = "▌< Return";
            returnButton.onclick = () => {
                location.href = 'https://rus1130.github.io/space2313/';
            };
            tw.target.appendChild(returnButton);
        }
    })

    await tw.load("./src/${nameNormalized}.st").then(() => {
        tw.start();
    })

    document.body.addEventListener("keydown", (e) => {
        if(e.key === " ") {
            tw.paused() ? tw.resume() : tw.pause();
        }

        if(e.key === "i"){
            tw.header.instant = !tw.header.instant;
        }
    });
</script>`

const txt_TEMPLATE = 
`{{# written ${date} #}}
typewriter: {
    charDelay: 50
    newlineDelay: 500
    textColor: #ffffff
    backgroundColor: #000000
    customDelays: {
        ",": 350
        ".": 600
    }
}
`

fs.writeFileSync(path.join(`${nameNormalized}.html`), HTML_TEMPLATE.replaceAll("\n", "\r\n"));
fs.writeFileSync(path.join('src', `${nameNormalized}.st`), txt_TEMPLATE.replaceAll("\n", "\r\n"));

let homepage = fs.readFileSync(path.join('index.html'), 'utf8');
let insertIndex = homepage.indexOf('<!-- -- INSERT POINT -- -->') - 4;
let newLink = `    <!-- <div class="button" onclick="location.href = './${nameNormalized}'">▌${name}</div> -->`;

homepage = homepage.slice(0, insertIndex) + newLink + '\r\n' + homepage.slice(insertIndex);
fs.writeFileSync(path.join('index.html'), homepage);