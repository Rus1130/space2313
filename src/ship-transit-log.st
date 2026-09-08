{{# written 7 july, 2026 #}}
typewriter: {
    charDelay: 25
    newlineDelay: 100
    textColor: #ffffff
    backgroundColor: #000000
    customDelays: {
        ",": 350
        ".": 600
    }
}

[sleep 1000]
preflight diagnostics check[speed 10 override]...[speeddefault][newline]
loading diagnostics program[speed 10 override].[sleep 400].[sleep 400].[sleep 1000][speeddefault][newline]
diagnostics program loaded. running[speed 10 override][sleep 400].[sleep 400].[sleep 400].[sleep 1000][speeddefault][linebreak]

[mixin "green"]
    [color #339900]<String>[color reset]
[mixin end]
[mixin "yellow"]
    [color #FFCC00]<String>[color reset]
[mixin end]
[mixin "red"]
    [color #CC3300]<String>[color reset]
[mixin end]

[mixin "line ok"]
    [tab <Number>]<String>.[sleep <Number>][repeat "." <Number>][@use "green" "OK"][newline]
[mixin end]
[mixin "line many error"]
    [tab <Number>]<String>.[sleep <Number>][repeat "." <Number>][@use "red" "ERROR"] [@use "red" "<Number>"][newline]
[mixin end]
[mixin "line nok"]
    [tab <Number>]<String>.[sleep <Number>][repeat "." <Number>][newline]
[mixin end]

[mixin "line many ok"]
    [tab <Number>]<String>.[sleep <Number>][repeat "." <Number>][@use "green" "OK"] [@use "green" "<Number>"][newline]
[mixin end]

[mixin "half line ok"]
[tab <Number>]<String> [@use "green" "OK"][newline]
[mixin end]
[mixin "half line warning"]
    [tab <Number>]<String> [@use "yellow" "WARNING"][newline]
[mixin end]
[mixin "half line error"]
    [tab <Number>]<String> [@use "red" "ERROR"][newline]
[mixin end]

[mixin "start"]
    [$start][$instant][speed 7 override]
[mixin end]

[speed 7 override]
v1.26.3 ==============================[linebreak]
FLIGHT =====================[newline]
[@use "line ok" 7 "DRIVE" 2000 15]
[@use "line many ok" 7 "MAIN ENGINE" 2000 9 4]
[@use "line many ok" 7 "SECONDARY ENGINE" 2000 4 8]
[@use "line ok" 7 "INERTIAL DAMPENER" 150 3]
[@use "line ok" 7 "FUEL PRESSURE" 50 7]
[@use "line ok" 7 "COOLANT PRESSURE" 50 4]
[@use "line ok" 7 "IGNITION SYSTEMS" 50 4]
[@use "line ok" 7 "TECHNETIUM INJECTOR" 750 1]
[@use "line ok" 7 "ENGINE TEMPERATURE" 10 2]
[@use "line many ok" 7 "GYROSCOPE" 200 11 4]
[newline]
FLIGHT 100%
[linebreak]

ELECTRICAL ===================[newline]
[@use "line ok" 11 "PRIMARY REACTOR" 2000 3]
[@use "line ok" 11 "SECONDARY REACTOR" 1000 1]
[@use "line ok" 11 "BATTERY" 150 11]
[@use "line nok" 11 "CURRENT DRAW" 10 6]
[@use "half line ok" 26 "1\-4" 5]
[@use "half line warning" 28 "5" 7]
[@use "half line ok" 28 "6" 7]
[@use "line ok" 11 "CURRENT DRAW" 10 6]
[newline]
ELECTRICAL 88.89%
[linebreak]

NAVIGATION =======================[newline]
[tab 11]IPN CONNECTION[sleep 250].[sleep 250].[sleep 250].[sleep 137].[@use "green" "OK"][newline]

[@use "line many ok" 11 "NAVIGATIONAL COMPUTER" 1200 1 2]
[@use "line ok" 11 "DOCKING COMPUTER" 600 6]
[@use "line many ok" 11 "IMU" 1000 19 2]
[@use "line many ok" 11 "OPTICAL SENSOR" 160 8 32]
[@use "line nok" 11 "LIDAR SENSOR" 192 10 32]
[@use "half line ok" 29 "1\-10" 5]
[@use "half line error" 31 "11" 7]
[@use "half line ok" 28 "12\-32" 5]
[@use "line many ok" 11 "RADAR SENSOR" 192 10 32]
[@use "line many error" 11 "RMC" 400 19 2]
[newline]
NAVIGATION 97.12%
[linebreak]



STRUCTURE =========================[newline]
[@use "line ok" 10 "OGANESSON CONTAINMENT" 4000 3]
[@use "line ok" 10 "TECHNETIUM CONTAINMENT" 4000 2]
[@use "line ok" 10 "HULL STRESS" 2500 13]
[@use "line ok" 10 "MICROFRACTURE DETECTION" 2250 1]
[@use "line ok" 10 "AIRLOCK" 220 17]
[@use "line nok" 10 "RADIATOR" 80 16]
[@use "half line warning" 33 "1" 7]
[@use "half line ok" 31 "2\-4" 5]
[@use "half line warning" 33 "5" 7]
[@use "half line ok" 31 "6\-8" 5]
[newline]
STRUCTURE 84.62%
[linebreak]

LIFE SUPPORT =====================[newline]
[@use "line ok" 13 "RADIATION SHIELDING" 500 1]
[@use "line ok" 13 "THERMAL SHIELDING" 500 3]
[@use "line many ok" 13 "SCRUBBER" 1200 12 6]
[@use "line ok" 13 "CLIMATE CONTROL" 550 5]
[@use "line ok" 13 "FIRE SUPPRESSION" 500 4]
[@use "line many ok" 13 "WATER RECYCLER" 1240 6 2]
[@use "line many ok" 13 "WASTE RECYCLER" 1240 6 2]
[@use "line many ok" 13 "AIR RECYCLER" 1200 8 3]
[newline]
LIFE SUPPORT 100%
[linebreak]

COMMUNICATIONS =====================[newline]
[@use "line ok" 15 "SHIP REGISTRATION" 20 3]
[@use "line ok" 15 "INTERNAL NETWORK" 722 4]
[@use "line ok" 15 "RADIO" 420 15]
[@use "line ok" 15 "IPN BEACON" 250 10]
[@use "line ok" 15 "ENCRYPTION HARDWARE" 490 1]
[@use "line ok" 15 "EMERGENCY BEACON" 880 4]
[newline]
COMMUNICATIONS 100%
[sleep 1200]
[linebreak]========================================[newline]
[speed 25 override]
SUMMARY[linebreak]
[sleep 1000]
[tab 2]WARNING[sleep 800][newline]
[tab 4]BATTERY...5[newline]
[tab 4]RADIATOR..1,5[sleep 900][linebreak]
[sleep 1000]
[tab 2]ERROR[sleep 800][newline]
[tab 4]LIDAR SENSOR..11[newline]
[tab 4]RMC...........1\-2 [@use "red" "[ALL]"][sleep 900][linebreak]
[sleep 800]
OVERALL..................[newline][sleep 500]
SOME SYSTEMS OFFLINE.[sleep 900] WILL NOT MAJORLY IMPACT SHIP PERFORMANCE.[sleep 900] RECOMMENDED ACTION:[sleep 700] NO ACTION REQUIRED.[sleep 1500]
[speeddefault]
[linebreak]
[gopage "2" "PROCEED TO LAUNCH >"]


[page "2"]
[page end]