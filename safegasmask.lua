script_name("safegasmask")
script_author("Isus_Christos")

local sampev = require('lib.samp.events')

local isDead = false
local isActive = true
local isActiveSafe = false
local isGasmask = false

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    userNotification('Да защитит тебя безопасный противогаз! /sgm - деактивировать скрипт.')

    sampRegisterChatCommand("sgm", function()
        isActive = not isActive
        if isActive then
            userNotification('Скрипт вновь работает, противогаз сохраняется.')
        else
            userNotification('Скрипт теперь не работает. Противогаз не сохраняется.')
        end
    end)

    while true do
        wait(0)
        onUserDeath()
    end
end

function onUserDeath()
    if isCharDead(PLAYER_PED) and not isDead and isActive then
        lua_thread.create(function()
            isActiveSafe = true
            isDead = true
            sampSendChat('/i')
            wait(400)
            if isGasmask then
                userNotification('Противогаз уже в инвентаре, сохранять не требуется.')
            elseif not isGasmask then
                sampSendChat('/gasmask')
                userNotification('Противогаз успешно снят и сохранен после смерти.')
            end
            isGasmask = false
            wait(5000)
            isActiveSafe = false
        end)
    elseif not isCharDead(PLAYER_PED) and isDead then
        isDead = false
    end
end

function sampev.onShowTextDraw(id, data)
    if isActiveSafe then
        if data.modelId == 19472 then 
            isGasmask = true
        end
        return false
    end
end

function userNotification(userNotificationText)
    sampAddChatMessage("[safegasmask] {FFFFFF}"..userNotificationText, 0x9966CC)
end