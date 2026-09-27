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


[page "normal"]
    Normal posters[newline]
    [function "image" "src/images/s23_slash.png" 248 350 1][tab 1]
    [function "image" "src/images/s23_accel.png" 248 350 1][tab 1]
    [function "image" "src/images/s23_slash_accel.png" 248 350 1]
    [gopage "chromatic" "next"]
    [$page "leave" keep]
[page end]

[page "chromatic"]
    Chromatic shift[newline]
    [function "set image channel shift" "r" 100]
    [function "image" "src/images/s23_slash.png" 248 350 1][tab 1]
    [function "set image channel shift" "g" 10]
    [function "image" "src/images/s23_accel.png" 248 350 1][tab 1]
    [function "set image channel shift" "b" 10]
    [function "image" "src/images/s23_slash_accel.png" 248 350 1]
    [gopage "hue rotate" "next"]
    [$page "leave" keep]
[page end]

[page "hue rotate"]
    Hue rotation in blocks; cant control the exact colors but i can control the seed that the rng uses[newline]
    [function "set image hue rotate" 90 10]
    [function "image" "src/images/s23_slash.png" 248 350 1][tab 1]
    [function "set image hue rotate" 180 10]
    [function "image" "src/images/s23_accel.png" 248 350 1][tab 1]
    [function "set image hue rotate" 270 10]
    [function "image" "src/images/s23_slash_accel.png" 248 350 1]
    [gopage "wave" "next"]
    [$page "leave" keep]
[page end]

[page "wave"]
    Wave distortion[newline]
    [function "set image wave distort" 10 0.1]
    [function "image" "src/images/s23_slash.png" 248 350 1][tab 1]
    [function "set image wave distort" 1 10]
    [function "image" "src/images/s23_accel.png" 248 350 1][tab 1]
    [function "set image wave distort" 10 1]
    [function "image" "src/images/s23_slash_accel.png" 248 350 1]
    [$page "leave" keep]
[page end]

[$page "normal"]

[page "leave"]
    [function "end"]
[page end]
