lib.addCommand('adddimesion', {
    help = 'Set the dimension of a player',
    params = {
        {
            name = 'playerId',
            help = 'Player,
        },
        {
            name = 'dimension',
            help = 'dimension',
        },
        restricted = 'group.admin'
}, true, function(source, args)
    local playerId, dimension = tonumber(args[1]), tonumber(args[2])
    local xPlayer, xTarget = exports.qbx_core:GetPlayer(source), exports.qbx_core:GetPlayer(playerId)
    if playerId and xTarget then
        if dimension then
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(playerId))

            if vehicle ~= 0 then
                SetEntityRoutingBucket(vehicle, dimension)
            end

            SetPlayerRoutingBucket(playerId, dimension)
            TriggerClientEvent('QBCore:Notify', source, Locale('add_dimension_notification', GetPlayerName(playerId), dimension), 'success')
        else
            TriggerClientEvent('QBCore:Notify', source, Locale('add_dimension_error_notdimension'), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Locale('add_dimension_error_notplayerid'), 'error')
    end
end, 'admin')

lib.addCommand('getdimension', {
    help = 'Set the dimension of a player',
    params = {
        {
            name = 'playerId',
            help = 'Player,
        },
    restricted = 'group.admin'
}, true, function(source, args)
    local playerId = tonumber(args[1])
    local xTarget = exports.qbx_core:GetPlayer(playerId)
    if playerId and xTarget then
        TriggerClientEvent('QBCore:Notify', source, Locale('get_dimension_notification', GetPlayerName(playerId), GetPlayerRoutingBucket(playerId)), 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, Locale('get_dimension_error_notplayerid'), 'error')
    end
end, 'admin')
