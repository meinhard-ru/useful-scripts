script_name("wiretapping")
script_author("Isus_Christos")

local sampev = require('lib.samp.events')

local isActive = false
local currentMode = false

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    userNotification('������ ������� ��������. /wire - ���������. /wire_mode - ��������� ������ ������.')

    sampRegisterChatCommand("wire", function()
        isActive = not isActive
        if isActive then
            userNotification('�������� ��������� ������ ��������.')
        else
            userNotification('�������� ��������� ������ ���������.')
        end
    end)

    sampRegisterChatCommand("wire_mode", function()
        currentMode = not currentMode
        if currentMode then
            userNotification('�������� ��������� ������ � ����� (/fs).')
        else
            userNotification('�������� ��������� ������ � ����� (/rb).')
        end
    end)
end

function sampev.onServerMessage(color, message)
    if isActive and message:find('%[�������%] .+%<.+lvl%>: .+') then
        lua_thread.create(function()
            wait(400)
            local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed)))
            local wireNick, wireText = message:match('%[�������%] (.+)%<.+lvl%>: (.+)')
            if currentMode and wireNick ~= nick then
                sampSendChat("/fs [wt]: "..wireText)
            elseif not currentMode and wireNick ~= nick then
                sampSendChat("/rb [wt]: "..wireText)
            end
        end)
    end
end


function userNotification(userNotificationText)
    sampAddChatMessage("[wiretapping] {FFFFFF}"..userNotificationText, 0xDC143C)
end