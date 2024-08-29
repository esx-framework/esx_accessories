RegisterServerEvent('esx_accessories:pay')
AddEventHandler('esx_accessories:pay', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(Config.Price, "Accessory Purchase")
	TriggerClientEvent('esx:showNotification', source, TranslateCap('you_paid', ESX.Math.GroupDigits(Config.Price)))
end)

RegisterServerEvent('esx_accessories:save')
AddEventHandler('esx_accessories:save', function(skin, accessory)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
        local accessories = store.get('accessories')

        if accessories == nil then
            accessories = {}
        end

        local itemSkin = {}
        local item1 = string.lower(accessory) .. '_1'
        local item2 = string.lower(accessory) .. '_2'
        itemSkin[item1] = skin[item1]
        itemSkin[item2] = skin[item2]

        accessories[string.lower(accessory)] = itemSkin
        store.set('accessories', accessories)
    end)
end)

ESX.RegisterServerCallback('esx_accessories:get', function(source, cb, accessory)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
        local accessories = store.get('accessories')
        if accessories == nil then
            accessories = {}
        end

        local accessoryData = accessories[string.lower(accessory)]
        local hasAccessory = accessoryData ~= nil
        local skin = accessoryData or {}

        cb(hasAccessory, skin)
    end)
end)

ESX.RegisterServerCallback('esx_accessories:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getMoney() >= Config.Price)
end)
