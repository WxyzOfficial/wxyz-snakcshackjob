local blipCoords = vector3(4904.51, -4941.87, 3.38)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(blipCoords)

    -- Set blip properties
    SetBlipSprite(blip, 93)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Snack Shack") 
    EndTextCommandSetBlipName(blip)
end)
