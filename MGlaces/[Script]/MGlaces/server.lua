ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('mojitoo:GlaceChocolat')
AddEventHandler('mojitoo:GlaceChocolat', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('glacechoco', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('mojitoo:GlaceFraise')
AddEventHandler('mojitoo:GlaceFraise', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('glacefraise', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('mojitoo:GlaceMenthe')
AddEventHandler('mojitoo:GlaceMenthe', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('glacementhe', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('mojitoo:GlaceVanille')
AddEventHandler('mojitoo:GlaceVanille', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('glacevanille', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

------------ BY Ayko#6666 ------------   
