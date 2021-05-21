ESX = nil

Citizen.CreateThread(function()
     while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)     

Config              = {}
Config.DrawDistance = 100
Config.Size         = {x = 1.5, y = 1.5, z = 1.5}
Config.Color        = {r = 255, g = 0, b = 0}
Config.Type         = 29

local position = {
    {x = -468.54, y = -29.27, z = 45.76},
}  

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < Config.DrawDistance) then
                DrawMarker(Config.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
     for k in pairs(position) do
        local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)
        SetBlipSprite(blip, 304)
        SetBlipColour(blip, 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Magasin glaces")
        EndTextCommandSetBlipName(blip)
    end
end)

RMenu.Add('glace', 'main', RageUI.CreateMenu("Glace Artisanales", "Nos séléctions"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('glace', 'main'), true, true, true, function()

            RageUI.Button("Glace à la ~r~Fraise", "Pour acheter une glace à la ~r~Fraise", {RightLabel = "~g~20$"}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                TriggerServerEvent('mojitoo:GlaceFraise')
            end
        end)

            RageUI.Button("Glace à la ~y~Vanille", "Pour acheter une glace à la ~y~Vanille", {RightLabel = "~g~20$"}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                TriggerServerEvent('mojitoo:GlaceVanille')
            end
        end)

        RageUI.Button("Glace à la ~g~Menthe", "Pour acheter une glace à la ~g~Menthe", {RightLabel = "~g~20$"}, true, function(Hovered, Active, Selected)
               if (Selected) then   
               TriggerServerEvent('mojitoo:GlaceMenthe')
            end
        end)

        RageUI.Button("Glace au ~o~Chocolat", "Pour acheter une glace au ~o~Chocolat", {RightLabel = "~g~20$"}, true, function(Hovered, Active, Selected)
               if (Selected) then   
               TriggerServerEvent('mojitoo:GlaceChocolat')
            end
        end)

        end, function()
        end)
            Citizen.Wait(0)
        end
    end) 

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then
                    ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour acheter une ~r~Glace")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('glace', 'main'), not RageUI.Visible(RMenu:Get('glace', 'main')))
                    end   
                end
            end
        end
    end)


    Citizen.CreateThread(function()
        local hash = GetHashKey("s_m_y_mime")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVMALE", "s_m_y_mime",-465.85,-29.73,44.76, 97.38, false, true) -- Position du ped
        SetBlockingOfNonTemporaryEvents(ped, true) -- Fiat en sorte que le ped ne réagisse à rien (n'aura pas peur si il y a des tirs etc...)
        FreezeEntityPosition(ped, true) -- Freeze le ped
        SetEntityInvincible(ped, true) -- Le rend invincible 
    end)

------------ BY Mojitoo ------------    

