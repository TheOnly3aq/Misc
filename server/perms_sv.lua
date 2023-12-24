RegisterServerEvent("misc.getIsAllowed")
AddEventHandler("misc.getIsAllowed", function()
    local source = source
    if IsPlayerAceAllowed(source, Misc_Config.Permission) then
        TriggerClientEvent("misc.returnIsAllowed", source, true)
    else
        TriggerClientEvent("misc.returnIsAllowed", source, false)
    end
end)
