local Modules = require('Modules.shared.math')

local function Confirm(Data,amount)
    local Total = Modules.Multiply(amount,Data.price)
    local Formated = Modules.Format(Total)
    local input = lib.inputDialog('Dialog title', {
        {type = 'input', default=Data.label, icon='hand', disabled=true, label = 'Label', description = 'Label Of Item(s) Purchasing', required = true, min = 4, max = 16},
        {type = 'input', default=amount, icon='hand', disabled=true, label = 'Label', description = 'Amount Of Item(s) Purchasing', required = true, min = 4, max = 16},
        {type = 'input', icon='money-bill', default=Formated, disabled=true, label = 'Total Price', description = 'Total Price For Item(s) Purchasing', required = true, min = 4, max = 16},
      })
      if not input then return end
      LocalPlayer.state:set('ShopPurchase', {Ran = math.random(1,300), data = {
        Price = Total,
        Label = Data.label,
        Count = amount,
        Spawn = Data.spawn
      }},true)
end

local function Init()
    if next(GlobalState.ShopData) == nil then
        TriggerEvent('esx:showNotification', 'No Data Found')
        return end
    lib.registerMenu({
        id = 'Menu',
        title = 'Shops',
        position = 'top-right',
        onClose = function(keyPressed)
        end,
        options = GlobalState.ShopData
    }, function(selected, scrollIndex, args)
        Confirm(args,selected)
    end)
    lib.showMenu('Menu')
end

for _, v in pairs(Usage.Locations) do
    local zone = lib.points.new({
        coords = v.Coords,
        distance = 2,
    })
    function zone:onEnter()
        TriggerEvent('esx:showNotification', string.format("Press %s To Open %s",'E',v.label))
    end

    function zone:onExit()
        lib.hideMenu()
    end

    function zone:nearby()
        DrawMarker(v.Type, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 1.1, 1.1,1.1,
        0.5, v.Color.r, v.Color.g, v.Color.b, 255, false, true, 2, true, false,
        false, false)
        if IsControlJustReleased(0, 38) then
            return Init()
        end
    end
end