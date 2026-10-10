{{# written 27 sept, 2026 #}}
typewriter: {
    charDelay: 1
    newlineDelay: 500
    textColor: #ffffff
    backgroundColor: #000000
    customDelays: {
        ",": 350
        ".": 600
    }
    instant: true
}

[mixin "slash"]
    [function "image" "https://rus1130.github.io/space2313/images/s23_slash.png" 248 350 1]
[mixin end]
[mixin "accel"]
    [function "image" "https://rus1130.github.io/space2313/images/s23_accel.png" 248 350 1]
[mixin end]
[mixin "slash accel"]
    [function "image" "https://rus1130.github.io/space2313/images/s23_slash_accel.png" 248 350 1]
[mixin end]


[page "normal"]
    Normal posters[newline]
    [@use "slash"][tab 1]
    [@use "accel"][tab 1]
    [@use "slash accel"]
    [gopage "chromatic" "next"]
    [function "end"]
[page end]

[page "chromatic"]
    Chromatic shift[newline]
    [function "set image channel shift" "r" 100]
    [@use "slash"][tab 1]
    [function "set image channel shift" "g" 10]
    [@use "accel"][tab 1]
    [function "set image channel shift" "b" 10]
    [@use "slash accel"]
    [gopage "hue rotate" "next"]
    [function "end"]
[page end]

[page "hue rotate"]
    Hue rotation in blocks; cannot control exact colors and where they appear, but the seed that the random number generator can[newline]
    [function "set image hue rotate" 90 10]
    [@use "slash"][tab 1]
    [function "set image hue rotate" 180 10]
    [@use "accel"][tab 1]
    [function "set image hue rotate" 270 10]
    [@use "slash accel"]
    [gopage "wave" "next"]
    [function "end"]
[page end]

[page "wave"]
    Wave distortion[newline]
    [function "set image wave distort" 10 0.1]
    [@use "slash"][tab 1]
    [function "set image wave distort" 1 10]
    [@use "accel"][tab 1]
    [function "set image wave distort" 10 1]
    [@use "slash accel"]
    [function "end"]
[page end]

[$page "normal"]
