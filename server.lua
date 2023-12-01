local Modules = require('Modules.shared.math')

MySQL.ready(function ()
    local Data = exports.oxmysql:query_async('SELECT * FROM shops')
    local Table = {}
    for k, v in pairs(Data) do
        local ShopValues = {}
        for i = 1, v.max do
            table.insert(ShopValues, {string.format('%s', tostring(i))})
        end
        table.insert(Table, {
            label = string.format("%s - $%s", v.label, Modules.Format(v.price)),
            description = string.format("Press To Purchase %s For %s", v.label, Modules.Format(v.price)),
            icon = v.icon,
            values = ShopValues,
            args = {
                label = v.label,
                price = v.price,
                max = v.max,
                spawn = v.spawn
            }
        })
    end
    GlobalState:set('ShopData', Table, true)
end)

AddStateBagChangeHandler('ShopPurchase','',function(player,state,Type)
    local user = tonumber(player:match(':(%d+)'))
    local XP = ESX.GetPlayerFromId(user)
    local XPL = XP.getIdentifier()
    local XCash = XP.getMoney()
    local XPrice = Type.data.Price
    if XPrice > XCash then
        TriggerClientEvent('esx:showNotification', user, 'To Broke For This')
    else
        XP.removeMoney(XPrice)
        TriggerClientEvent('esx:showNotification', user, 'Sucessfully Bought Item.')
        XP.addInventoryItem(Type.data.Spawn,Type.data.Count)
    end
end)