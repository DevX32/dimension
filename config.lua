print('^2DevX^7-^2Dimension ^2Dimension Script by ^1DevX32^7')
Config = {
    Locale = 'en'
}
Locales = {
    ['en'] = {
        ['add_dimension_help'] = 'Set the dimension of a player',
        ['add_dimension_player'] = 'Player',
        ['add_dimension_bucket'] = 'Dimension',
        ['add_dimension_notification'] = 'You have changed the dimension of %s to %s',
        ['add_dimension_error_notdimension'] = 'You must enter a valid dimension',
        ['add_dimension_error_notplayerid'] = 'You must enter a valid PlayerId',
        
        ['get_dimension_help'] = 'Get the dimension of a player',
        ['get_dimension_player'] = 'Player',
        ['get_dimension_notification'] = 'The dimension of %s is %s',
        ['get_dimension_error_notplayerid'] = 'You must enter a valid PlayerId',
    }
}

function Locale(type, ...)
    if Locales[Config.Locale][type] then
        return Locales[Config.Locale][type]:format(...)
    else
        return 'Locale not found'
    end
end
