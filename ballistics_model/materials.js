const materials = {
    "Tungsten Alloy": {
        // General
        rho: 19300,                 // kg/m³

        // Thermal
        specificHeat: 134,          // J/kg/K
        thermalConductivity: 173,   // W/m/K
        meltingPoint: 3422,         // °C
        boilingPoint: 5555,         // °C
        latentFusion: 192000,       // J/kg
        latentVaporization: 4.48e6, // J/kg

        // Mechanical
        youngsModulus: 411e9,       // Pa
        poissonRatio: 0.28,
        yieldStrength: 900e6,       // Pa
        tensileStrength: 1100e6,    // Pa
        hardness: 8.5,              // Mohs

        // Optical @1070nm
        n: 3.55,
        k: 3.81
    },

    "Silicon Carbide": {
        rho: 3210,
        specificHeat: 750,
        thermalConductivity: 120,
        meltingPoint: 2730,
        boilingPoint: null,
        latentFusion: 350000,
        latentVaporization: null,

        youngsModulus: 450e9,
        poissonRatio: 0.19,
        yieldStrength: null,
        tensileStrength: 400e6,
        hardness: 9.5,

        n: 2.63,
        k: 0.02
    },

    "Boron Carbide": {
        rho: 2520,
        specificHeat: 750,
        thermalConductivity: 30,
        meltingPoint: 2350,
        boilingPoint: null,
        latentFusion: 300000,
        latentVaporization: null,

        youngsModulus: 460e9,
        poissonRatio: 0.17,
        yieldStrength: null,
        tensileStrength: 350e6,
        hardness: 9.5,

        n: 2.10,
        k: 0.03
    },

    "Hafnium Carbide": {
        rho: 12600,
        specificHeat: 250,
        thermalConductivity: 20,
        meltingPoint: 3890,
        boilingPoint: null,
        latentFusion: 400000,
        latentVaporization: null,

        youngsModulus: 500e9,
        poissonRatio: 0.18,
        yieldStrength: null,
        tensileStrength: 500e6,
        hardness: 9.0,

        n: 2.70,
        k: 0.10
    },

    "Carbon Composite": {
        rho: 1800,
        specificHeat: 710,
        thermalConductivity: 30,
        meltingPoint: 3650,
        boilingPoint: null,
        latentFusion: 500000,
        latentVaporization: null,

        youngsModulus: 150e9,
        poissonRatio: 0.20,
        yieldStrength: 600e6,
        tensileStrength: 1000e6,
        hardness: 2,

        n: 2.00,
        k: 1.10
    },

    "Titanium Alloy": {
        rho: 4430,
        specificHeat: 520,
        thermalConductivity: 6.7,
        meltingPoint: 1668,
        boilingPoint: 3287,
        latentFusion: 295000,
        latentVaporization: 8.9e6,

        youngsModulus: 116e9,
        poissonRatio: 0.34,
        yieldStrength: 880e6,
        tensileStrength: 950e6,
        hardness: 6,

        n: 3.46,
        k: 3.31
    },

    "Steel": {
        rho: 7850,
        specificHeat: 500,
        thermalConductivity: 45,
        meltingPoint: 1500,
        boilingPoint: 2860,
        latentFusion: 272000,
        latentVaporization: 6.3e6,

        youngsModulus: 200e9,
        poissonRatio: 0.30,
        yieldStrength: 350e6,
        tensileStrength: 550e6,
        hardness: 4,

        n: 2.85,
        k: 3.15
    }
};