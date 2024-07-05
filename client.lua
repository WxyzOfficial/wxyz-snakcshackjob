local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, recipe in ipairs(Config.CookingRecipes) do
            if IsPlayerNearLocation(playerCoords, recipe.processingLocation) then
                DrawText3D(recipe.processingLocation.x, recipe.processingLocation.y, recipe.processingLocation.z, "[Press ~b~E~w~] to Cook " .. recipe.itemName)
                
                if IsControlJustPressed(0, 38) then
                    QBCore.Functions.Progressbar("cook_item", "Cooking " .. recipe.itemName, 15000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
                        anim = "coke_cut_v5_coccutter",
                        flags = 49,
                    }, {}, {}, function() -- Done
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('itemProcessing:cookItem', recipe.itemName)
                    end, function() -- Cancel
                        ClearPedTasks(PlayerPedId())
                        QBCore.Functions.Notify("Cooking canceled", "error")
                    end)
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)

    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

function IsPlayerNearLocation(playerCoords, locationCoords)
    local distance = #(playerCoords - locationCoords)
    return distance < 2.0
end

RegisterNetEvent('itemProcessing:cookResult')
AddEventHandler('itemProcessing:cookResult', function(result)
    if result == "success" then
        QBCore.Functions.Notify("Done Cooking", "success")
    elseif result == "insufficient" then
        QBCore.Functions.Notify("You don't have the ingredients", "error")
    elseif result == "not_near_location" then
        QBCore.Functions.Notify("You are not near the Cooking location", "error")
    end
end)