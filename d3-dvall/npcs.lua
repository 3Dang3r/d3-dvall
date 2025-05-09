Citizen.CreateThread(function()
    local enableSpawns = false

 
    Citizen.CreateThread(function()
        while true do
            enableSpawns = true
            Wait(30000) 
            enableSpawns = false
            Wait(600000 - 30000) 
        end
    end)

 
    while true do
        if enableSpawns then
    
            SetPedDensityMultiplierThisFrame(0.7)
            SetScenarioPedDensityMultiplierThisFrame(0.7, 0.7)
            SetVehicleDensityMultiplierThisFrame(0.7)
            SetRandomVehicleDensityMultiplierThisFrame(0.7)
            SetParkedVehicleDensityMultiplierThisFrame(0.5)

     
            SetScenarioTypeEnabled("WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN", true)
            SetScenarioTypeEnabled("WORLD_VEHICLE_PARK_PARALLEL", true)
            SetScenarioTypeEnabled("WORLD_VEHICLE_DRIVE_SOLO", true)
            SetScenarioTypeEnabled("WORLD_VEHICLE_DRIVE_PASSENGERS", true)
            SetScenarioTypeEnabled("WORLD_VEHICLE_BIKE_OFF_ROAD_RACE", true)

       
            SetGarbageTrucks(true)
            SetRandomBoats(true)
            SetCreateRandomCops(true)
            SetCreateRandomCopsNotOnScenarios(true)
            SetCreateRandomCopsOnScenarios(true)
        else
            
            SetPedDensityMultiplierThisFrame(0.0)
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)

            SetScenarioTypeEnabled("WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN", false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_PARK_PARALLEL", false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_DRIVE_SOLO", false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_DRIVE_PASSENGERS", false)
            SetScenarioTypeEnabled("WORLD_VEHICLE_BIKE_OFF_ROAD_RACE", false)

            SetGarbageTrucks(false)
            SetRandomBoats(false)
            SetCreateRandomCops(false)
            SetCreateRandomCopsNotOnScenarios(false)
            SetCreateRandomCopsOnScenarios(false)
        end

        Wait(0)
    end
end)
