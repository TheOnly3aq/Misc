lib.addCommand("goto", {
    help = "Admin command, teleport to a player.",
    restricted = "group.staff",
    params = {
        {
            name = "target",
            type = "playerId",
            help = "Target player's server id"
        }
    }
}, function(source, args, raw)
    if args.target == source then return end
    local target = GetPlayerPed(args.target)
    local coords = GetEntityCoords(target)
    local ped = GetPlayerPed(source)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
end)

lib.addCommand("bring", {
    help = "Admin command, teleport a player to you.",
    restricted = "group.staff",
    params = {
        {
            name = "target",
            type = "playerId",
            help = "Target player's server id"
        }
    }
}, function(source, args, raw)
    if args.target == source then return end
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local targetPed = GetPlayerPed(args.target)
    SetEntityCoords(targetPed, coords.x, coords.y, coords.z)
end)
