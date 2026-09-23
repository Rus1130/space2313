{{# written 22 sept, 2026 #}}
typewriter: {
    charDelay: 50
    newlineDelay: 500
    textColor: #ffffff
    backgroundColor: #000000
    wordWrap: 50
    customDelays: {
    }
}
[speed 1]
[mixin "repeat"]
    [repeat <Number:1>][unscramble <String:1> 100 800] [repeat end]
[mixin end]

[mixin "repeat no space"]
    [repeat <Number:1>][unscramble <String:1> 100 800][repeat end]
[mixin end]

[@use "repeat" 200 "HAPPY"][removelast 3000 instant][accuracy 0.99]
[@use "repeat" 200 "HELIX"][removelast 3000 instant][accuracy 0.98]
[@use "repeat" 300 "OUR"][removelast 3000 instant][accuracy 0.96]
[@use "repeat" 120 "PANOPTICON"][removelast 3000 instant][accuracy 0.92]
[@use "repeat" 200 "SEEN"][removelast 3000 instant][accuracy 0.89]
[@use "repeat" 100 "WE"][accuracy 0.85]
[@use "repeat" 50 "LIVE"][accuracy 0.82]
[@use "repeat" 100 "WE"][accuracy 0.79]
[@use "repeat" 50 "LIVE"][accuracy 0.75]
[@use "repeat" 100 "WE"][accuracy 0.68]
[@use "repeat" 50 "LIVE"][removelast 3000 instant][accuracy 0.63]
[@use "repeat" 1000 "YES"]

[sleep 1000][linebreak]
[sleep 700][function "end"]
