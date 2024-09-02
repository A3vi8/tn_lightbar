-- Initialize ESX object
ESX = exports["es_extended"]:getSharedObject()

-- Table to store vehicle lightbars information
local lightbarCars = {}

-- Register usable item if specified in config
if Config.Item then
    ESX.RegisterUsableItem('lightbar', function(playerId)
        TriggerClientEvent('lightbar:lightbar:itemUse', playerId)
    end)
end

-- Register a vehicle with a lightbar
RegisterServerEvent('lightbar:addLightbar')
AddEventHandler('lightbar:addLightbar', function(hostVehPlate, lightbarNetworkID, hvp)
    local found = false
    for k, v in pairs(lightbarCars) do 
        if v.LP == hostVehPlate then
            table.insert(v.lights, lightbarNetworkID)
            found = true
            break
        end
    end
    if not found then
        table.insert(lightbarCars, {
            hostVehiclePointer = hvp,
            LP = hostVehPlate,
            lights = {lightbarNetworkID},
            lightStatus = false,
            sirenStatus = false
        })
    end
end)

-- Toggle vehicle lights
RegisterServerEvent('lightbar:toggleLights2')
AddEventHandler('lightbar:toggleLights2', function(hostVehPlate)
    for k, v in pairs(lightbarCars) do 
        if v.LP == hostVehPlate then
            TriggerClientEvent("lightbar:clientToggleLights", source, v.lights, v.lightStatus, v.hostVehiclePointer) 
            v.lightStatus = not v.lightStatus
            break
        end
    end
end)

-- Toggle vehicle siren
RegisterServerEvent("lightbar:ToggleSound1Server")
AddEventHandler("lightbar:ToggleSound1Server", function(plate)
    for k, v in pairs(lightbarCars) do 
        if v.LP == plate then
            v.sirenStatus = not v.sirenStatus
            TriggerClientEvent("lightbar:sound1Client", source, source, v.sirenStatus)
            break
        end
    end
end)

-- Return all vehicle plates with lightbars
RegisterServerEvent('lightbar:returnLightBarVehiclePlates')
AddEventHandler('lightbar:returnLightBarVehiclePlates', function()
    local plates = {}
    for k, v in pairs(lightbarCars) do 
        table.insert(plates, v.LP)
    end
    TriggerClientEvent("lightbar:sendLightBarVehiclePlates", source, plates) 
end)

-- Return lightbars for a specific vehicle and remove the vehicle from the list
RegisterServerEvent('lightbar:returnLightbarsForMainVeh')
AddEventHandler('lightbar:returnLightbarsForMainVeh', function(mainVehPlate)
    local plates = {}
    for k, v in pairs(lightbarCars) do 
        if v.LP == mainVehPlate then
            plates = v.lights
            lightbarCars[k] = nil -- Remove the vehicle from the table
            break
        end
    end
    TriggerClientEvent("lightbar:updateLightbarArray", source, plates) 
end)
