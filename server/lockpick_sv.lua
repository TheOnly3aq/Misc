AddEventHandler('entityCreated', function(entity)
    if not DoesEntityExist(entity) then return end 

    local entityType = GetEntityType(entity)

    if entityType ~= 2 then return end

    if GetEntityPopulationType(entity) > 5 then return end
    if math.random() > 0.5 then return end
    SetVehicleDoorsLocked(entity, 2)
end)