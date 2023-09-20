QBCore = exports['Core']:GetCoreObject()

QBCore.Commands.Add('adddimesion, Locale('add_dimension_help'), {
    {name = 'playerId', help = Locale('add_dimension_player')},
    {name = 'dimension', help = Locale('add_dimension_dimension')}
}, true, function(source, args)
    local playerId, dimension = tonumber(args[1]), tonumber(args[2])
    local xPlayer, xTarget = QBCore.Functions.GetPlayer(source), QBCore.Functions.GetPlayer(playerId)
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

QBCore.Commands.Add('getdimension', Locale('get_dimension_help'), {
    {name = 'playerId', help = Locale('get_dimension_player')}
}, true, function(source, args)
    local playerId = tonumber(args[1])
    local xTarget = QBCore.Functions.GetPlayer(playerId)
    if playerId and xTarget then
        TriggerClientEvent('QBCore:Notify', source, Locale('get_dimension_notification', GetPlayerName(playerId), GetPlayerRoutingBucket(playerId)), 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, Locale('get_dimension_error_notplayerid'), 'error')
    end
end, 'admin')
