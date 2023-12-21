local allowedToUse = false
Citizen.CreateThread(function()
    TriggerServerEvent("misc.getIsAllowed")
end)

RegisterNetEvent("misc.returnIsAllowed")
AddEventHandler("misc.returnIsAllowed", function(isAllowed)
    allowedToUse = isAllowed
end)

function loadTrainModels()
    local trainsAndCarriages = {
        'freight', 'metrotrain', 'freightcont1', 'freightcar',
        'freightcar2', 'freightcont2', 'tankercar', 'freightgrain'
    }

    for _, vehicleName in ipairs(trainsAndCarriages) do
        local modelHashKey = joaat(vehicleName)
        RequestModel(modelHashKey)
        while not HasModelLoaded(modelHashKey) do
            Citizen.Wait(500)
        end
    end
end

loadTrainModels()

RegisterCommand("train", function(source, args, rawCommand)
    if allowedToUse then
        if #args < 1 then
            TriggerEvent('chat:addMessage', {
                args = {
                    'Error, provide a variation id, you can find those in trains.xml. Variations range from 0 to 26.'
                }
            })
            return
        end

        local playerCoords = GetEntityCoords(PlayerPedId())
        CreateMissionTrain(
            tonumber(args[1]),
            playerCoords.x, playerCoords.y, playerCoords.z,
            true,
            true,
            true
        )
    else
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Unauthorized use! This incident will be reported!")
    end
end, false)
