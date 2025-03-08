script_name('equest_updater')
script_author('Isus_Christos')

local sampev = require('lib.samp.events')
local isActive = false

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    userNotification('������ ���������� � ������� ���� ���������� �������.')

    while true do
        wait(40000)
        if time == (os.date('!%H:%M', os.time() + (offset or 3) * 60 * 60)) then
            lua_thread.create(function() 
                isActive = true
                sampSendChat('/equest')
                wait(1000)
                isActive = false
            end)
        end
    end
end

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
    if title:find('���������� �������:')  then
        time = title:match('���������� �������: .+ (.+)')

        if isActive then
            if time == (os.date('!%H:%M', os.time() + (offset or 3) * 60 * 60)) then
                userNotification('������ ����������, ������ ����� �� ���������!')
                return false
            end
            return false
        end
    end
end

function sampev.onSendSpawn()
    if time == nil then
        lua_thread.create(function()
            isActive = true
            wait(1000)
            sampSendChat('/equest')
            wait(700)
            userNotification('���������� ������� � '..time..'.')
            isActive = false
        end)
    end
end

function userNotification(userNotificationText)
    sampAddChatMessage("[equest_updater] {FFFFFF}"..userNotificationText, 0xCCFF33)
end