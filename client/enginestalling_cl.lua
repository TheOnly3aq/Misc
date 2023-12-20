
local engineStalled = false
local lastVehicleHealth = 0
local dizzyEffectActive = false
local dizzyEffectTimer = 0

function ClearScreenEffects()
    ClearTimecycleModifier()
    StopGameplayCamShaking(true)
end

RegisterNetEvent("carEngineStalling:checkStalling")
AddEventHandler("carEngineStalling:checkStalling", function(vehicle)
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        local currentHealth = GetVehicleBodyHealth(vehicle)
        local healthDifference = lastVehicleHealth - currentHealth

        if healthDifference > Stall_Config.MinHealthDifference then
            TriggerEvent("carEngineStalling:stallEngineAndDizzy", vehicle)
        end

        lastVehicleHealth = currentHealth
    end
end)

RegisterNetEvent("carEngineStalling:stallEngineAndDizzy")
AddEventHandler("carEngineStalling:stallEngineAndDizzy", function(vehicle)
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleEngineOn(vehicle, false, false, true)

        SetTimeout(Stall_Config.StallingDuration * 1000, function()
            SetVehicleEngineOn(vehicle, true, false, true)

            engineStalled = false
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        if playerPed and IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
                local currentHealth = GetVehicleBodyHealth(vehicle)

                if lastVehicleHealth == 0 then
                    lastVehicleHealth = currentHealth
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        if playerPed and IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
                local currentHealth = GetVehicleBodyHealth(vehicle)
                local healthDifference = lastVehicleHealth - currentHealth

                if healthDifference > Stall_Config.MinHealthDifference then
                    TriggerEvent("carEngineStalling:checkStalling", vehicle)
                end

                lastVehicleHealth = currentHealth
            end
        end
    end
end)
