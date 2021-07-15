local laptopOpen = false
local isLoggedIn = false

RegisterCommand('laptop', function(source)
    chat("Opening", {255, 0, 0})
    setDisplay(not laptopOpen)
    chat("Opened", {255, 0, 0})
end)

RegisterNUICallback('login', function(data)
    if (data.password == '1234')
    then
        isLoggedIn = true
        SendNUIMessage({
            e="login",
            status=isLoggedIn
        })
    else
        SendNUIMessage({
            e="login-error",
            error="Invalid Password"
        })
    end
end)

RegisterNUICallback('logout', function(data)
    isLoggedIn = false
    laptopOpen = false

    setDisplay(false);
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
        e = "open-laptop",
        open = bool
    })
end

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end