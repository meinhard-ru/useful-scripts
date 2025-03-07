script_name("new_commonpoi")
script_description("")
script_version_number(1)
script_version("1.0")

require 'lib.sampfuncs'
local sampev = require 'lib.samp.events'
local ffi = require("ffi")
local v = require "vkeys"
local SquareList = {"А", "Б", "В", "Г", "Д", "Ж", "З", "И", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Я"}
local marker = nil
local scriptMode = true

function main()
    while not isSampfuncsLoaded() do
        wait(1000)
    end
	while not isSampAvailable() do wait(100) end

	userNotification('Скрипт успешно загружен. Убрать метку - /rub. Сменить режим - /cpoi_mode')
	
	sampRegisterChatCommand('rub',
	function()
		removeUserBlip()
	end)

	sampRegisterChatCommand('cpoi_mode', function()
		scriptMode = not scriptMode
		if scriptMode then
			userNotification('Теперь отправляет в сквад (/fs).')
		else
			userNotification('Теперь отправляет в рацию (/rb).')
		end
	end)

	while true do
		wait(0)
		if isKeyJustPressed(v.VK_4) and isNotWriting() then
			resX, resY = convert3DCoordsToScreen(get_crosshair_position())
			targetX, targetY, targetZ = convertScreenCoordsToWorld3D(resX, resY, 3600)
			originX, originY, originZ = getActiveCameraCoordinates()
			result, colPoint = processLineOfSight(originX, originY, originZ, targetX, targetY, targetZ, true, true, false, true, true, true, true, true)
			if result then
				sendBlipInChat(colPoint.pos[1], colPoint.pos[2], colPoint.pos[3])
				--sampSendChat(string.format("/fs Установил метку в %s. | CPOIX%sY%sZ%sE", getKv(round(colPoint.pos[1]), round(colPoint.pos[2])), round(colPoint.pos[1]), round(colPoint.pos[2]), round(colPoint.pos[3])))
			end
		end
	end
end

function onScriptTerminate(script, quitGame) 
	if script == thisScript() then
		removeUserBlip()
	end
end

function removeUserBlip()
	deleteCheckpoint(marker)
    removeWaypoint()
	addOneOffSound(0, 0, 0, 1149)
end

function sendBlipInChat(x, y, z)
	if scriptMode then
		sampSendChat(string.format("/fs Установил метку в %s. | CPOIX%sY%sZ%sE", getKv(round(x), round(y)), round(x), round(y), round(z)))
		userNotification('Метка отправлена в сквад. (/fs)')
	else
		sampSendChat(string.format("/rb Установил метку в %s. | CPOIX%sY%sZ%sE", getKv(round(x), round(y)), round(x), round(y), round(z)))
		userNotification('Метка отправлена в рацию. (/rb)')
	end
end

function isNotWriting()
	if not sampIsChatInputActive() and not sampIsDialogActive()	 then return true end
	return false
end

function sampev.onServerMessage(color, text)
	if string.match(text, "^.+%[.*%]% {FFFFFF%}(.*)%[(.*)%]: .+ | CPOIX(.+)Y(.+)Z(.+)E$") then
		local nick, id, x, y, z = string.match(text, "^.+%[.*%]% {FFFFFF%}(.+)%[(.*)%]: .+ | CPOIX(.+)Y(.+)Z(.+)E$")
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		setMarker(1, x, y, z, 3, 0x95f74aFF)
		sampAddChatMessage(string.format("Выставлена метка в квадрат %s. [%s - ID %s]", getKv(x, y), nick, id), 0xe01b1b)
		return false

	elseif string.match(text, "^.+%s(.+)%[(%d+)%].+%(%(.+CPOIX(%d+)Y(%d+)Z(%d+).+%)%)") then
		local nick, id, x, y, z = string.match(text, "^.+%s(.+)%[(%d+)%].+%(%(.+CPOIX(%d+)Y(%d+)Z(%d+).+%)%)")
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		setMarker(1, x, y, z, 3, 0x95f74aFF)
		sampAddChatMessage(string.format("Выставлена метка в квадрат %s. [%s - ID %s]", getKv(x, y), nick, id), 0xe01b1b)
		return false
	end
end

function sampev.onSendMapMarker(pos)
	if pos ~= nil then
		sendBlipInChat(pos.x, pos.y, pos.z)
		return false
	end
end

function getKv(x, y) 
	Square = SquareList[math.ceil((y * - 1 + 3000) / 250)] .. "-" .. math.ceil((x + 3000) / 250) .. "-" .. getUli(x, y)
	return Square
end

function getUli(x, y)
	local y1 = (y * - 1 + 3000)
	local x1 = (x + 3000)
	local x2 = math.ceil((x + 3000) / 250)
	local y2 = math.ceil((y * - 1 + 3000) / 250)
	local xu = x1-(x2*250-250)
	local yu = y1-(y2*250-250)
	local xu1 = xu/250
	local yu1 = yu/250
	local xup, yup
	if xu1 < 0.33 then xup = 1
	elseif xu1 > 0.33 and xu1 < 0.66 then xup = 2
	elseif xu1 > 0.66 then xup = 3
	end
	if yu1 < 0.33 then yup = 1
	elseif yu1 > 0.33 and yu1 < 0.66 then yup = 2
	elseif yu1 > 0.66 then yup = 3
	end
	local uli = 0
	if yup == 1 then uli = xup
	elseif yup == 2 then
		if xup == 1 then uli = 8
		elseif xup == 2 then uli = 9
		elseif xup == 3 then uli = 4
		end
	elseif yup == 3 then
		if xup == 1 then uli = 7
		elseif xup == 2 then uli = 6
		elseif xup == 3 then uli = 5
		end
	end
	return uli
end

function get_crosshair_position()
    local vec_out = ffi.new("float[3]")
    local tmp_vec = ffi.new("float[3]")
    ffi.cast(
        "void (__thiscall*)(void*, float, float, float, float, float*, float*)",
        0x514970
    )(
        ffi.cast("void*", 0xB6F028),
        15.0,
        tmp_vec[0], tmp_vec[1], tmp_vec[2],
        tmp_vec,
        vec_out
    )
    return vec_out[0], vec_out[1], vec_out[2]
end

function round(number)
  return number - (number % 1)
end

function setMarker(type, x, y, z, radius, color)
    deleteCheckpoint(marker)
    marker = createCheckpoint(type, x, y, z, 1, 1, 1, radius)
	addOneOffSound(0, 0, 0, 1190)
	removeWaypoint()
	placeWaypoint(x, y, z)
    lua_thread.create(function()
    repeat
        wait(0)
        local x1, y1, z1 = getCharCoordinates(PLAYER_PED)
		local result, posX, posY, posZ = getTargetBlipCoordinates()
        until getDistanceBetweenCoords3d(x, y, z, x1, y1, z1) < radius or result == false
        removeUserBlip()
    end)
end

function userNotification(userNotificationText)
    sampAddChatMessage("[new_commonpoi] {FFFFFF}"..userNotificationText, 0xFF7F50)
end