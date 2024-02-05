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
            TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "You are not in a vehicle!")
        end
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Fuel level set to " .. fuelLevel)
    else
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Unauthorized use! This incident will be reported!")
        print("Unautoized use of the 'randomtrain' commmand by " .. source)
    end
end, false)

local function IsNearChargeStation()
    local ped = PlayerPedId()
    local pedLocation = GetEntityCoords(ped, 0)
    for _, item in pairs(Charge_Config.Locations) do
        local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, pedLocation["x"], pedLocation["y"],
            pedLocation["z"], true)
        if distance <= item.r then
            return true
        end
    end
end

local isCharging = false

RegisterCommand("charge", function(source)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local vehiclecheck = IsPedInAnyVehicle(PlayerPedId(), true)
    local fuelLevel = Charge_Config.Level
    local vehicleoil = GetVehicleOilLevel(vehicle)
    if vehiclecheck then
        if vehicleoil == 0.0000 then
            if IsNearChargeStation() then
                if not isCharging then
                    isCharging = true
                    TriggerEvent("chatMessage", "CHARGER", { 0, 0, 255 },
                        "Your electric vehicle is charging... " .. Charge_Config.Timeout .. " Seconds remaining")
                    TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                    Citizen.Wait((1000 * Charge_Config.Timeout))
                    if IsNearChargeStation() then
                        SetFuel(vehicle, fuelLevel)
                        TriggerEvent("chatMessage", "CHARGER", { 0, 0, 255 },
                            "Your electric vehicle is fully charged! You can now get back in!")
                        isCharging = false
                    else
                        TriggerEvent("chatMessage", "CHARGER", { 255, 0, 0 },
                            "You drove away from the charging station! Your vehicle has not been charged.")
                        isCharging = false
                    end
                else
                    TriggerEvent("chatMessage", "CHARGER", { 0, 0, 255 }, "Your electric vehicle is already charging!")
                end
            else
                TriggerEvent("chatMessage", "CHARGER", { 0, 0, 255 }, "You're not near a charging station!")
            end
        else
            TriggerEvent("chatMessage", "CHARGER", { 0, 0, 255 }, "You are not in an electric vehicle!")
        end
    else
        TriggerEvent("chatMessage", "CHARGER", { 0, 0, 255 }, "You are not in a vehicle!")
    end
end, false)
