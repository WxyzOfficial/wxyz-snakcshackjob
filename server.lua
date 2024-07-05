local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('itemProcessing:cookItem')
AddEventHandler('itemProcessing:cookItem', function(itemName)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    if xPlayer ~= nil and xPlayer.PlayerData.job.name == 'snack' then
        local recipe = FindCookingRecipe(itemName)

        if recipe then
            local playerCoords = GetEntityCoords(GetPlayerPed(src))
            local processingLocation = recipe.processingLocation
            if IsPlayerNearLocation(playerCoords, processingLocation) then
                local hasRequiredItems = true
                for _, requiredItem in ipairs(recipe.requiredItems) do
                    local item = xPlayer.Functions.GetItemByName(requiredItem.itemName)
                    if not item or item.amount < requiredItem.amount then
                        hasRequiredItems = false
                        break
                    end
                end

                if hasRequiredItems then
                    for _, requiredItem in ipairs(recipe.requiredItems) do
                        xPlayer.Functions.RemoveItem(requiredItem.itemName, requiredItem.amount)
                    end

                    xPlayer.Functions.AddItem(itemName, 1)
                    TriggerClientEvent('itemProcessing:cookResult', src, "success")
                else
                    TriggerClientEvent('itemProcessing:cookResult', src, "insufficient")
                end
            else
                TriggerClientEvent('itemProcessing:cookResult', src, "not_near_location")
            end
        else
            print("Recipe not found for item: " .. itemName)
        end
    else
        print(("Player %s attempted to Cook without the 'snack' job!"):format(src))
    end
end)

function FindCookingRecipe(itemName)
    for _, recipe in ipairs(Config.CookingRecipes) do
        if recipe.itemName == itemName then
            return recipe
        end
    end
    return nil
end

function IsPlayerNearLocation(playerCoords, locationCoords)
    local distance = #(playerCoords - locationCoords)
    return distance < 2.0
end