local ESX = exports["es_extended"]:getSharedObject()

-- call back
ESX.RegisterServerCallback('esx-fishing:server:FishingRodInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.FishingGrod).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-fishing:server:FishBaitInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.FishBait).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:MoneyCashBuyFishBaitInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.MoneyCash).count >= 1000 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-fishing:server:MoneyCashBuyFishingGrodInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.MoneyCash).count >= 2500 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:BlackTunaInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.BlackFinTuna).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:YellowTunaInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.YellowFinTuna).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:weapon_pistol50Info', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.weapon_pistol50).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:FloridaPompanoInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.FloridaPompano).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:HorsEyeJackInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.HorsEyeJack).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:LaneSanapperInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.LaneSanapper).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:MuttonSnapperInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.MuttonSnapper).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-fishing:server:PigFishInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.PigFish).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-fishing:server:SilverPerchInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.SilverPerch).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-fishing:server:StripedBassInfo', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.StripedBass).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

--- Remove wormBait
RegisterNetEvent('esx-fishing:server:removeFishingBaitLost')
AddEventHandler('esx-fishing:server:removeFishingBaitLost', function()
	local src = source
    local Player = ESX.GetPlayerFromId(src)
    Player.removeInventoryItem(Config.FishBait, 1)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Désolé, votre appât pour poisson est perdu !', 'Poisson', 'center-right', 'error')
end)


--- Buy Fishgrod 
RegisterNetEvent('esx-fishing:server:BuyItemFishingGrodRewards')
AddEventHandler('esx-fishing:server:BuyItemFishingGrodRewards', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    Player.removeMoney(Config.FishingGrodPrice)
    Player.addInventoryItem(Config.FishingGrod, 1)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez achetez une canne à pêche', 'Canne à pêche', 'center-right', 'success')
end)

--- Buy Fishbait
RegisterNetEvent('esx-fishing:server:BuyItemFishBaitRewards')
AddEventHandler('esx-fishing:server:BuyItemFishBaitRewards', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    Player.removeMoney(Config.FishBaitPrice)
    Player.addInventoryItem(Config.FishBait, 10)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez achetez des appats à poissons', 'appats à poissons', 'center-right', 'success')
end)

--Fishing Rewards
RegisterNetEvent('esx-fishing:server:FishingReward')
AddEventHandler('esx-fishing:server:FishingReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local luck = math.random(1, 100)
    local amountReceived = 1
    if luck >= 95 and luck <= 100 then
        Player.addInventoryItem(Config.BlackFinTuna, amountReceived)  
        ESX.GetItemLabel(Config.BlackFinTuna)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un BlackFin Tuna', 'Poisson', 'center-right', 'success')
    elseif luck >= 90 and luck <= 95 then
        Player.addInventoryItem(Config.YellowFinTuna, amountReceived)  
        ESX.GetItemLabel(Config.YellowFinTuna)
        TriggerClientEvent('esx-fishing:client:notify', src, ' Vous avez pecher un YellowFin Tuna', 'Poisson', 'center-right', 'success')
    elseif luck >= 80 and luck <= 90 then
        Player.addInventoryItem(Config.weapon_pistol50, amountReceived)  
        ESX.GetItemLabel(Config.weapon_pistol50)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un weapon_pistol50', 'Poisson', 'center-right', 'success')
    elseif luck >= 70 and luck <= 80 then
        Player.addInventoryItem(Config.FloridaPompano, amountReceived)  
        ESX.GetItemLabel(Config.FloridaPompano)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Florida Pompano', 'Poisson', 'center-right', 'success')
    elseif luck >= 60 and luck <= 70 then
        Player.addInventoryItem(Config.LaneSanapper, amountReceived)  
        ESX.GetItemLabel(Config.LaneSanapper)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Lane Snapper', 'Poisson', 'center-right', 'success')
    elseif luck >= 50 and luck <= 60 then
        Player.addInventoryItem(Config.MuttonSnapper, amountReceived)  
        ESX.GetItemLabel(Config.MuttonSnapper)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Mutton Snapper', 'Poisson', 'center-right', 'success')
    elseif luck >= 40 and luck <= 50 then
        Player.addInventoryItem(Config.PigFish, amountReceived)  
        ESX.GetItemLabel(Config.PigFish)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Pig Fish', 'Poisson', 'center-right', 'success')
    elseif luck >= 30 and luck <= 40 then
        Player.addInventoryItem(Config.SilverPerch, amountReceived)  
        ESX.GetItemLabel(Config.SilverPerch)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Silver Perch', 'Poisson', 'center-right', 'success')
    elseif luck >= 20 and luck <= 30 then
        Player.addInventoryItem(Config.HorsEyeJack, amountReceived)  
        ESX.GetItemLabel(Config.HorsEyeJack)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Hors Eye Jack', 'Poisson', 'center-right', 'success')
    elseif luck >= 10 and luck <= 20 then
        Player.addInventoryItem(Config.StripedBass, amountReceived)  
        ESX.GetItemLabel(Config.StripedBass)
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous avez pecher un Striped Bass', 'Poisson', 'center-right', 'success')
    elseif luck >= 0 and luck <= 10 then
        TriggerClientEvent('esx-fishing:client:notify', src, 'Vous n\'avez rien Vous avez pecher un', 'Poisson', 'center-right', 'eroor')
    end
end)

--- Sell Stone Fish
---Sell weapon_pistol50 Fish
RegisterNetEvent('esx-fishing:server:weapon_pistol50SellReward')
AddEventHandler('esx-fishing:server:weapon_pistol50SellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.weapon_pistol50)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.weapon_pistol50, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'weapon_pistol50 vendu', 'Poisson', 'center-right', 'success')
end)

---Sell Florida Pompano Fish
RegisterNetEvent('esx-fishing:server:FloridaPompanoSellReward')
AddEventHandler('esx-fishing:server:FloridaPompanoSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.FloridaPompano)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.FloridaPompano, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Florida Pompano vendu', 'Poisson', 'center-right', 'success')
end)

---Sell  HorsEye Jack Fish
RegisterNetEvent('esx-fishing:server:HorsEyeJackSellReward')
AddEventHandler('esx-fishing:server:HorsEyeJackSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.HorsEyeJack)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.HorsEyeJack, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'HorsEye Jack vendu', 'Poisson', 'center-right', 'success')
end)

---Sell  Lane Sanapper  Fish
RegisterNetEvent('esx-fishing:server:LaneSanapperSellReward')
AddEventHandler('esx-fishing:server:LaneSanapperSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.LaneSanapper)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.LaneSanapper, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Lane Sanapper vendu', 'Poisson', 'center-right', 'success')
end)

---Sell  Mutton Snapper  Fish
RegisterNetEvent('esx-fishing:server:MuttonSnapperSellReward')
AddEventHandler('esx-fishing:server:MuttonSnapperSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.MuttonSnapper)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.MuttonSnapper, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Mutton Snapper vendu', 'Poisson', 'center-right', 'success')
end)

---Sell Pig Fish  Fish
RegisterNetEvent('esx-fishing:server:PigFishSellReward')
AddEventHandler('esx-fishing:server:PigFishSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.PigFish)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.PigFish, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'PigFish vendu', 'Poisson', 'center-right', 'success')
end)

---Sell Silver Perch  Fish
RegisterNetEvent('esx-fishing:server:SilverPerchSellReward')
AddEventHandler('esx-fishing:server:SilverPerchSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.SilverPerch)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.SilverPerch, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Silver Perch vendu', 'Poisson', 'center-right', 'success')
end)

---Sell Striped Bass  Fish
RegisterNetEvent('esx-fishing:server:StripedBassSellReward')
AddEventHandler('esx-fishing:server:StripedBassSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.StripedBass)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StoneFishPrice
            Player.removeInventoryItem(Config.StripedBass, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'Striped Bass vendu', 'Poisson', 'center-right', 'success')
end)


---- Sell Tuna Fish
---Sell BlackFin Tuna
RegisterNetEvent('esx-fishing:server:BlackFinTunaSellReward')
AddEventHandler('esx-fishing:server:BlackFinTunaSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.BlackFinTuna)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.TunaPrice
            Player.removeInventoryItem(Config.BlackFinTuna, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'BlackFin Tuna vendu', 'Poisson', 'center-right', 'success')
end)
---Sell YellowFin Tuna
RegisterNetEvent('esx-fishing:server:YellowFinTunaSellReward')
AddEventHandler('esx-fishing:server:YellowFinTunaSellReward', function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    local amountResources = 0
    while true do
        local itemData = Player.getInventoryItem(Config.YellowFinTuna)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.TunaPrice
            Player.removeInventoryItem(Config.YellowFinTuna, itemData.count)
        else
            break
        end
    end
    Player.addMoney(price)
    TriggerClientEvent('esx-fishing:client:notify', src, 'YellowFin Tuna vendu', 'Poisson', 'center-right', 'success')
end)