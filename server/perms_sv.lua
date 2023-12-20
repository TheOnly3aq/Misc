RegisterServerEvent("misc.getIsAllowed")
AddEventHandler("misc.getIsAllowed", function()
    local source = source
    if IsPlayerAceAllowed(source, "developer.stuff") then
        TriggerClientEvent("misc.returnIsAllowed", source, true)
    else
        TriggerClientEvent("misc.returnIsAllowed", source, false)
    end
end)
