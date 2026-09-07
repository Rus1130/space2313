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

[mixin "line ok"]
    [tab <Number>]<String>.[sleep <Number>][repeat "." <Number>][@use "green" "OK"][newline]
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

[mixin "start"]
    [$start][$instant][speed 3 override]
[mixin end]

{{# [$start][$instant] #}}
[speed 3 override]

v1.26.3 ==============================[linebreak]
[@use "start"]
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



ELECTRICAL =========================[newline]
[@use "line ok" 11 "PRIMARY REACTOR" 2000 9]
[@use "line ok" 11 "SECONDARY REACTOR" 1000 7]
[@use "line ok" 11 "BATTERY" 150 17]
[@use "line ok" 11 "CURRENT DRAW" 10 12]
[@use "half line ok" 32 "1\-4" 5]
[@use "half line warning" 34 "5" 7]
[@use "half line ok" 34 "6" 7]

{{# 
[tab 11]PRIMARY REACTOR.[sleep 2000].........[color #339900]OK[resetcolor][newline]
[tab 11]SECONDARY REACTOR.[sleep 1000].......[color #339900]OK[resetcolor][newline]
[tab 11]BATTERY.[sleep 150].................[newline]
[tab 32]1\-4[color #339900] OK[resetcolor][newline]
[tab 34]5[color #FFCC00] WARNING[resetcolor][newline]
[tab 34]6[color #339900] OK[resetcolor][newline]
[tab 11]CURRENT DRAW.[sleep 10]............[color #339900]OK[resetcolor][newline]
[newline]
ELECTRICAL 88.89%
[linebreak]

[$instant off][sleep 10000000000000000000]

NAVIGATION =========================[newline]
[tab 11]IPN CONNECTION[sleep 250].[sleep 250].[sleep 250].[sleep 250].[sleep 250].[sleep 250].[sleep 137].[color #339900]OK[resetcolor][newline]
[tab 11]NAVIGATIONAL COMPUTER.[sleep 1200]...[color #339900]OK 2[resetcolor][newline]
[tab 11]DOCKING COMPUTER.[sleep 600]........[color #339900]OK[resetcolor][newline]
[tab 11]IMU.[sleep 1000].....................[color #339900]OK 2[resetcolor][newline]
[tab 11]OPTICAL SENSOR.[sleep 160]..........[color #339900]OK 32[resetcolor][newline]
[tab 11]LIDAR SENSOR.[sleep 192]............[newline]
[tab 31]1\-10[color #339900] OK[resetcolor][newline]
[tab 33]11[color #CC3300] ERROR[resetcolor][newline]
[tab 30]12\-32[color #339900] OK[resetcolor][newline]
[tab 11]RADAR SENSOR.[sleep 192]............[color #339900]OK 32[resetcolor][newline]
[tab 11]RMC.[sleep 400].....................[color #CC3300]ERROR 2[resetcolor][newline]
[newline]
NAVIGATION 97.12%
[linebreak]

STRUCTURE =========================[newline]
[tab 10]OGANESSON CONTAINMENT.[sleep 4000]...[color #339900]OK[resetcolor][newline]
[tab 10]TECHNETIUM CONTAINMENT.[sleep 4000]..[color #339900]OK[resetcolor][newline]
[tab 10]HULL STRESS.[sleep 2500].............[color #339900]OK[resetcolor][newline]
[tab 10]MICROFRACTURE DETECTION.[sleep 2250].[color #339900]OK[resetcolor][newline]
[tab 10]AIRLOCK.[sleep 220].................[color #339900]OK[resetcolor][newline]
[tab 10]RADIATOR.[sleep 80]................[newline]
[tab 33]1[color #FFCC00] WARNING[resetcolor][newline]
[tab 31]2\-4[color #339900] OK[resetcolor][newline]
[tab 33]5[color #FFCC00] WARNING[resetcolor][newline]
[tab 31]6\-8[color #339900] OK[resetcolor][newline]
[newline]
STRUCTURE 84.62%
[linebreak]

LIFE SUPPORT =========================[newline]
[tab 13]RADIATION SHIELDING.[sleep 500].....[color #339900]OK[resetcolor][newline]
[tab 13]THERMAL SHIELDING.[sleep 500].......[color #339900]OK[resetcolor][newline]
[tab 13]SCRUBBER.[sleep 1200]................[color #339900]OK 6[resetcolor][newline]
[tab 13]CLIMATE CONTROL.[sleep 550].........[color #339900]OK[resetcolor][newline]
[tab 13]FIRE SUPPRESSION.[sleep 500]........[color #339900]OK[resetcolor][newline]
[tab 13]WATER RECYCLER.[sleep 1240]..........[color #339900]OK 2[resetcolor][newline]
[tab 13]WASTE RECYCLER.[sleep 1240]..........[color #339900]OK 2[resetcolor][newline]
[tab 13]AIR RECYCLER.[sleep 1200]............[color #339900]OK 3[resetcolor][newline]
[newline]
LIFE SUPPORT 100%
[linebreak]

COMMUNICATIONS =========================[newline]
[tab 15]SHIP REGISTRATION.[sleep 20].......[color #339900]OK[resetcolor][newline]
[tab 15]INTERNAL NETWORK.[sleep 722]........[color #339900]OK[resetcolor][newline]
[tab 15]RADIO.[sleep 420]...................[color #339900]OK[resetcolor][newline]
[tab 15]IPN BEACON.[sleep 250]..............[color #339900]OK[resetcolor][newline]
[tab 15]ENCRYPTION HARDWARE.[sleep 490].....[color #339900]OK[resetcolor][newline]
[tab 15]EMERGENCY BEACON.[sleep 880]........[color #339900]OK[resetcolor][newline]
[newline]
COMMUNICATIONS 100%
[sleep 1200]
[linebreak]========================================[newline]
[speed 25 1]
SUMMARY[linebreak]
[sleep 1000]
[tab 2]WARNING[sleep 800][newline]
[tab 4]BATTERY..............5[newline]
[tab 4]RADIATOR.............1,5[sleep 900][linebreak]
[sleep 1000]
[tab 2]ERROR[sleep 800][newline]
[tab 4]LIDAR SENSOR.........11[newline]
[tab 4]RMC..................1\-2 [color #cc3300]\[ALL\][resetcolor][sleep 900][linebreak]
[sleep 800]
OVERALL..................[newline][sleep 500]
SOME SYSTEMS OFFLINE.[sleep 900] WILL NOT MAJORLY IMPACT SHIP PERFORMANCE.[sleep 900] RECOMMENDED ACTION:[sleep 700] NO ACTION REQUIRED.[sleep 1500]
[speeddefault]
[linebreak] #}}
{{# [speed 40 1]PROCEED TO LAUNCH.[speeddefault][sleep 2000][linebreak] #}}