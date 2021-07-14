local laptopOpen = false

RegisterCommand('laptop', function(source)
    setDisplay(true)
end)

RegisterNUICallback('login', function(data)
    if (data.password == '1234')
    then
        SendNUIMessage({
            type="ui",
            status=laptopOpen
        })
    end
end)

-- Disable controls while in the laptop
Citizen.CreateThread(function()
    while laptopOpen do
        Citizen.Wait(0)

        DisableControlAction(0, 1, laptopOpen);
        DisableControlAction(0, 2, laptopOpen);
        DisableControlAction(0, 142, laptopOpen);
        DisableControlAction(0, 18, laptopOpen);
        DisableControlAction(0, 322, laptopOpen);
        DisableControlAction(0, 106, laptopOpen);
    end
end)

function setDisplay(bool)
    laptopOpen = bool
    SetNuiFocus(bool, bool)

    SendNUIMessage({
        type = "ui",
        open = bool
    })
end
