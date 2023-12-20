local allowedToUse = false
Citizen.CreateThread(function()
    TriggerServerEvent("misc.getIsAllowed")
end)

RegisterNetEvent("misc.returnIsAllowed")
AddEventHandler("misc.returnIsAllowed", function(isAllowed)
    allowedToUse = isAllowed
end)

local FUEL_DECOR = "_ANDY_FUEL_DECORE_"

function SetFuel(vehicle, fuel)
    if type(fuel) == "number" and fuel >= 0 and fuel <= 100 then
        SetVehicleFuelLevel(vehicle, fuel)
        DecorSetFloat(vehicle, FUEL_DECOR, fuel)
    end
end

RegisterCommand("setfuel", function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local fuelLevel = tonumber(args[1])

    if allowedToUse then
        if vehicle and fuelLevel then
            SetFuel(vehicle, fuelLevel)
        else
            TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Unauthorized use! This incident will be reported!")
        end
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Fuel level set to " .. fuelLevel)
    else
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "No permission!")
    end
end, false)
