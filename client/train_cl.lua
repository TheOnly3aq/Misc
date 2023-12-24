local allowedToUse = false
Citizen.CreateThread(function()
    TriggerServerEvent("misc.getIsAllowed")
end)

RegisterNetEvent("misc.returnIsAllowed")
AddEventHandler("misc.returnIsAllowed", function(isAllowed)
    allowedToUse = isAllowed
end)

SetRandomTrains(true)


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

RegisterCommand("randomtrain", function(source, args, rawCommand)
    if allowedToUse then
        if args[1] == "on" then
            SetTrainTrackSpawnFrequency(0, 120000) 
            SetTrainTrackSpawnFrequency(3, 120000) 
            SwitchTrainTrack(0, true)
            SwitchTrainTrack(3, true)
            SetRandomTrains(true)
            TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Turned random trains on!")
        elseif args[1] == "off" then
            SetRandomTrains(false)
            TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Turned random trains off!")
        else
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Please use ON or OFF")
        end
    else
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Unauthorized use! This incident will be reported!")
    end
end, false)


