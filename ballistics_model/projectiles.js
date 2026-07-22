const projectiles = {

    "20mm AP": {
        type: "Autocannon",

        caliber: 20,            // mm
        length: 120,            // mm
        projectileMass: 0.24,   // kg

        muzzleVelocity: 1450,   // m/s

        material: "Tungsten Alloy",

        explosiveMass: 0,
        dragCoefficient: 0.22
    },

    "40mm AP": {
        type: "Autocannon",

        caliber: 40,
        length: 250,
        projectileMass: 1.1,

        muzzleVelocity: 1250,

        material: "Tungsten Alloy",

        explosiveMass: 0,
        dragCoefficient: 0.18
    },

    "120mm APFSDS": {
        type: "Artillery",

        caliber: 120,
        penetratorDiameter: 25,
        length: 850,

        projectileMass: 8.4,

        muzzleVelocity: 1800,

        material: "Tungsten Alloy",

        explosiveMass: 0,
        dragCoefficient: 0.08
    },

    "155mm HE": {
        type: "Artillery",

        caliber: 155,
        length: 800,

        projectileMass: 45,

        muzzleVelocity: 930,

        material: "Steel",

        explosiveMass: 11.2,
        dragCoefficient: 0.30
    },

    "Heavy Missile": {

        type: "Missile",

        diameter: 300,
        length: 3500,

        launchMass: 420,

        cruiseVelocity: 850,

        fuelMass: 110,

        warheadMass: 90,

        warheadMaterial: "Steel",

        explosiveMass: 60
    }
};