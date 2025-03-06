script_name("Paleriders MultiTool")
script_author("mafizik")
script_version("06.03.2025")
require("lib.moonloader")
require("lib.sampfuncs")

sampev = require("samp.events")

local var_0_0 = require("inicfg")
local var_0_1, var_0_2 = pcall(require, "mimgui_hotkeys")
local var_0_3, var_0_4 = pcall(require, "fAwesome6_solid")
local var_0_5, var_0_6 = pcall(require, "mimgui_addons")
local var_0_7 = require("encoding")
local var_0_8 = require("memory")
local var_0_9 = require("mimgui")
local var_0_10 = require("vkeys")
local var_0_11 = require("ffi")
local var_0_12 = var_0_9.new
local var_0_13 = var_0_12.bool()
local var_0_14 = var_0_7.CP1251

sizeof = var_0_11.sizeof
str = var_0_11.string

if var_0_5 then
	var_0_9.ToggleButton = require("mimgui_addons").ToggleButton
end

local var_0_15 = false
local var_0_16 = false
local var_0_17 = false
local var_0_18 = true
local var_0_19 = false

var_0_11.cdef(" bool SetCursorPos(int X, int Y); ")
var_0_11.cdef("\n    struct stGangzone\n    {\n        float    fPosition[4];\n        uint32_t    dwColor;\n        uint32_t    dwAltColor;\n    };\n\n    struct stGangzonePool\n    {\n        struct stGangzone    *pGangzone[1024];\n        int iIsListed[1024];\n    };\n\n")
var_0_11.cdef("    typedef unsigned long HANDLE;\n    typedef HANDLE HWND;\n    typedef const char *LPCTSTR;\n    HWND GetActiveWindow(void);\n    bool SetWindowTextA(HWND hWnd, LPCTSTR lpString);\n")

local var_0_20 = 0
local var_0_21, var_0_22 = getScreenResolution()
local var_0_23, var_0_24 = convertGameScreenCoordsToWindowScreenCoords(88.081993103027, 322.58331298828)

gz_pos_x, gz_pos_y = convertGameScreenCoordsToWindowScreenCoords(592.67, 203.26)
struck_pos_x, struck_pos_y = convertGameScreenCoordsToWindowScreenCoords(10, 432.24)
directIni = "Paleriders MultiTool.ini"
config = {}
config.data = {}
config.default = {
	narkotimer = {
		inventory = true,
		mats = 0,
		death = false,
		align = 2,
		height = 4,
		lines_one = "{1a9614}drugs !a!n{dedede}mats !m",
		server_cmd = "usedrugs",
		status = false,
		flag = 13,
		size = 10,
		seconds = 60,
		hp_one_gram = 10,
		boostinfo = true,
		lines_two = "{e81526}cooldown !s!n{dedede}mats !m",
		font = "Segoe UI",
		hp = 160,
		drugs = 0,
		max_use_gram = 15,
		key = {
			88
		},
		x = var_0_23,
		y = var_0_24
	},
	chat = {
		vip_ad = false,
		perenos = false,
		ask = false,
		gov = false,
		ad = false,
		events = false
	},
	getgun_settings = {
		status = false,
		key = {
			78
		}
	},
	getgun = {
		SMG = 0,
		armor = false,
		Shotgun = 0,
		M4A1 = 0,
		AK47 = 0,
		["Desert Eagle"] = 0,
		Rifle = 0,
		["SD Pistol"] = 0
	},
	office_getgun = {
		SMG = 0,
		["Desert Eagle"] = 0,
		Shotgun = 0,
		M4A1 = 0,
		AK47 = 0,
		Rifle = 0,
		["SD Pistol"] = 0
	},
	marker = {
		status = false,
		key = {
			74
		}
	},
	iznanka = {
		run_key = 32,
		int = 1,
		status = false,
		key = {}
	},
	perevorot = {
		speed = 15,
		status = false,
		key_one = {
			219
		},
		key_two = {
			221
		}
	},
	doublejump = {
		int = 0,
		jump_key = 16,
		status = false,
		key = {
			20
		}
	},
	autoadr = {
		sbiv = false,
		lomka = false,
		perelom = false,
		status = false
	},
	autoclist_after_capt = {
		clist = 0,
		status = false
	},
	autoclist_after_spawn = {
		clist = 0,
		status = false
	},
	camhack = {
		antiwarning = true,
		bubble = false,
		status = false,
		key = {
			17,
			49
		}
	},
	autohealme = {
		status = false
	},
	cmd_shorten = {
		{
			"de",
			"gun deagle"
		},
		{
			"m4",
			"gun m4"
		},
		{
			"sh",
			"gun shotgun"
		},
		{
			"ri",
			"gun rifle"
		},
		{
			"ak",
			"gun ak47"
		},
		{
			"cl",
			"clist 0"
		},
		{
			"mb",
			"members"
		},
		{
			"gg",
			"get guns"
		},
		{
			"un",
			"unloading"
		},
		{
			"bun",
			"bunloading"
		},
		{
			"inv",
			"invite"
		},
		{
			"uval",
			"uninvite"
		},
		{
			"wl",
			"warelock"
		},
		{
			"sp",
			"spawnchange"
		},
		{
			"wa",
			"warehouse"
		},
		{
			"gr",
			"giverank"
		},
		{
			"ofm",
			"offmembers"
		}
	},
	binder = {
		{
			onekey = false,
			enter = true,
			sendtext = {
				"/mm"
			},
			key = {
				18,
				77
			}
		}
	},
	sbiv = {
		status = false,
		key = {
			82
		}
	},
	grib_heal = {
		status = false,
		key = {}
	},
	rkt = {
		status = false,
		key = {}
	},
	flip = {
		status = false,
		key = {}
	},
	vspiwka = {
		status = false,
		key = {
			51
		}
	},
	delete_cue = {
		status = false
	},
	squad = {
		text = "Состав отряда:",
		font = "Trebuc",
		status = false,
		size = 10,
		online_text = "online: !n",
		x = 5,
		style = 13,
		y = var_0_22 * 0.358333333
	},
	remove_fence = {
		status = false
	},
	remove_flashlight = {
		status = false
	},
	struck = {
		wait = 650,
		status = false
	},
	gz = {
		fake = false,
		text_pos = 1,
		status = true,
		font = {
			text_size = 12,
			height = 26,
			length = 208,
			x = gz_pos_x,
			y = gz_pos_y,
			color = {
				text_back = 4278190080,
				box = 4291891987,
				text_front = 4294967295
			}
		}
	},
	capture = {
		cmd = "bcapture",
		wait = 650,
		status = true
	},
	antiafk = {
		status = true
	},
	infinite_run = {
		status = false
	},
	fastconnect = {
		status = false
	},
	gmwheels = {
		status = false
	},
	antibarrier = {
		status = false
	},
	nofall = {
		status = false
	},
	fastspawn = {
		status = false
	},
	schi = {
		status = false
	},
	nobike = {
		status = false
	},
	bikerlist = {
		command = "/bikerlist",
		status = true,
		key = {}
	},
	hpbar = {
		status = true
	},
	AutoBikeMotoRunSwimOnMaxSpeed = {
		status = false
	},
	ReplacingWindowWithNickName = {
		status = false
	},
	NoPara = {
		status = false
	},
	fastdeagle = {
		speed = 1,
		status = false
	},
	ArrowPassMotoBike = {
		status = false
	},
	quitinformer = {
		only_stream = true,
		status = false
	},
	dlcar = {
		status = false
	},
	autofill = {
		status = false
	}
}
config.directory = getWorkingDirectory() .. "\\Paleriders MultiTool"

function config_init()
	if not doesDirectoryExist(config.directory) then
		createDirectory(config.directory)
	end

	config.address = string.format("%s\\settings.json", config.directory)

	if not doesFileExist(config.address) then
		io.open(config.address, "a"):close()
		config_save(config.default)
	end

	config_read()

	for iter_1_0, iter_1_1 in pairs(config.data.binder) do
		if iter_1_1.sendtext == nil then
			config.data.binder = {
				{
					onekey = false,
					enter = true,
					sendtext = {
						"/mm"
					},
					key = {
						18,
						77
					}
				}
			}

			break
		end
	end

	for iter_1_2, iter_1_3 in pairs(config.default) do
		if config.data[iter_1_2] == nil then
			config.data[iter_1_2] = iter_1_3
		end

		if type(iter_1_3) == "table" and iter_1_2 ~= "binder" then
			for iter_1_4, iter_1_5 in pairs(iter_1_3) do
				if config.data[iter_1_2][iter_1_4] == nil then
					config.data[iter_1_2][iter_1_4] = iter_1_5
				end

				if type(iter_1_5) ~= type(config.data[iter_1_2][iter_1_4]) then
					config.data[iter_1_2][iter_1_4] = iter_1_5
				end
			end
		end
	end

	config_save(config.data)
end

function config_save(arg_2_0)
	local var_2_0, var_2_1 = io.open(config.address, "w")

	if var_2_0 == nil then
		print(var_2_1)
	end

	var_2_0:write(encodeJson(arg_2_0))
	var_2_0:flush()
	io.close(var_2_0)
end

function config_read()
	local function var_3_0()
		local var_4_0, var_4_1 = io.open(config.address, "r")

		if var_4_0 then
			config.data = decodeJson(var_4_0:read("*a"))

			io.close(var_4_0)

			if config.data == nil then
				config_save(config.default)
			end
		end
	end

	if not pcall(var_3_0) then
		config_save(config.default)
	end

	if config.data == nil then
		config.error = true

		config_read()
	elseif config.error then
		config.error = false
	end
end

config_init()

if not LPH_OBFUSCATED then
	function LPH_NO_VIRTUALIZE(...)
		return ...
	end
end

LuaScript = thisScript()

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then
		return
	end

	while not isSampAvailable() do
		wait(0)
	end

	var_0_8.fill(sampGetBase() + 29720, 144, 6, true)

	local var_6_0, var_6_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

	my_name = sampGetPlayerNickname(var_6_1)

	if var_0_1 then
		narkotimer_hotkey = var_0_2.RegisterHotKey("narkotimer Hotkey", false, config.data.narkotimer.key, function()
			return
		end)
		getgun_hotkey = var_0_2.RegisterHotKey("getgun Hotkey", false, config.data.getgun_settings.key, function()
			return
		end)
		marker_hotkey = var_0_2.RegisterHotKey("marker Hotkey", false, config.data.marker.key, function()
			return
		end)
		iznanka_hotkey = var_0_2.RegisterHotKey("iznanka Hotkey", false, config.data.iznanka.key, function()
			return
		end)
		perevorot_one_hotkey = var_0_2.RegisterHotKey("perevorot_one Hotkey", false, config.data.perevorot.key_one, function()
			return
		end)
		perevorot_two_hotkey = var_0_2.RegisterHotKey("perevorot_two Hotkey", false, config.data.perevorot.key_two, function()
			return
		end)
		doublejump_hotkey = var_0_2.RegisterHotKey("doublejump Hotkey", false, config.data.doublejump.key, function()
			return
		end)
		camhack_hotkey = var_0_2.RegisterHotKey("camhack Hotkey", false, config.data.camhack.key, function()
			return
		end)
		sbiv_hotkey = var_0_2.RegisterHotKey("sbiv Hotkey", false, config.data.sbiv.key, function()
			return
		end)
		grib_hotkey = var_0_2.RegisterHotKey("grib Hotkey", false, config.data.grib_heal.key, function()
			return
		end)
		rkt_hotkey = var_0_2.RegisterHotKey("rkt Hotkey", false, config.data.rkt.key, function()
			return
		end)
		flip_hotkey = var_0_2.RegisterHotKey("flip Hotkey", false, config.data.flip.key, function()
			return
		end)
		vspiwka_hotkey = var_0_2.RegisterHotKey("vspiwka Hotkey", false, config.data.vspiwka.key, function()
			return
		end)
		bikerlist_hotkey = var_0_2.RegisterHotKey("bikerlist Hotkey", false, config.data.bikerlist.key, function()
			return
		end)
	end

	repeat
		wait(0)
	until sampGetCurrentServerName() ~= "SA-MP"

	repeat
		wait(0)
	until sampGetCurrentServerName():find("Samp%-Rp.Ru")

	repeat
		wait(0)
	until sampIsLocalPlayerSpawned()

	lua_thread.create(squad_check)

	repeat
		wait(0)
	until var_0_15

	sampRegisterChatCommand("plr", function()
		var_0_13[0] = not var_0_13[0]
	end)
	sampRegisterChatCommand("rld", function()
		thisScript():reload()
	end)
	sampRegisterChatCommand("kdk", function()
		sampAddChatMessage("" .. LuaScript, -1)
	end)
	ReplacingWindowWithNickName()
	binder_register()
	bikerlist_register()
	capture_cmd_register()
	lua_thread.create(check_boostinfo)
	lua_thread.create(squadFunc)
	lua_thread.create(squadFunc2)
	lua_thread.create(narkotimerFunc)
	lua_thread.create(getgunFunc)
	lua_thread.create(deffdialogFunc)
	lua_thread.create(markerFunc)
	lua_thread.create(iznankaFunc)
	lua_thread.create(perevorotFunc)
	lua_thread.create(doublejumpFunc)
	lua_thread.create(autoadrFunc)
	lua_thread.create(autoclistspawnFunc)
	lua_thread.create(autoclistcaptFunc)
	lua_thread.create(camhackFunc)
	lua_thread.create(autohealmeFunc)
	lua_thread.create(binder_loop)
	lua_thread.create(binder_loop_target)
	lua_thread.create(sbivFunc)
	lua_thread.create(gribhealFunc)
	lua_thread.create(flipFunc)
	lua_thread.create(rktFunc)
	lua_thread.create(vspiwkaFunc)
	lua_thread.create(deletecueFunc)
	lua_thread.create(fenceFunc)
	lua_thread.create(flashlightFunc)
	lua_thread.create(struckFunc)
	lua_thread.create(gzFunc)
	lua_thread.create(captureFunc)
	lua_thread.create(antiafkFunc)
	lua_thread.create(infiniterunFunc)
	lua_thread.create(fastconnectFunc)
	lua_thread.create(gmwheelsFunc)
	lua_thread.create(antibarrierFunc)
	lua_thread.create(nofallFunc)
	lua_thread.create(fastspawnFunc)
	lua_thread.create(showcrosshairinstantlyFunc)
	lua_thread.create(nobikeFunc)
	lua_thread.create(hpbarFunc)
	lua_thread.create(AutoBikeMotoRunSwimOnMaxSpeedFunc)
	lua_thread.create(noparaFunc)
	lua_thread.create(rank_check)
	lua_thread.create(bikerlistFunc)
	lua_thread.create(office_getgun_kostil)
	lua_thread.create(ArrowPassMotoBikeFunc)
	lua_thread.create(fastdeagleFunc)
	lua_thread.create(dlcarFunc)
	wait(-1)
end

function office_getgun_kostil()
	while true do
		wait(0)

		if var_0_19 then
			wait(800)

			for iter_24_0 = 1, ggtable.pistol do
				sampSendDialogResponse(1513, 1, 0, -1)

				random_ms = math.random(750, 1000)

				wait(random_ms)
			end

			for iter_24_1 = 1, ggtable.deagle do
				sampSendDialogResponse(1513, 1, 1, -1)

				random_ms = math.random(750, 1000)

				wait(random_ms)
			end

			wait(500)

			for iter_24_2 = 1, ggtable.shotgun do
				sampSendDialogResponse(1513, 1, 2, -1)

				random_ms = math.random(750, 1000)

				wait(random_ms)
			end

			for iter_24_3 = 1, ggtable.smg do
				sampSendDialogResponse(1513, 1, 3, -1)

				random_ms = math.random(750, 1000)

				wait(random_ms)
			end

			for iter_24_4 = 1, ggtable.ak47 do
				sampSendDialogResponse(1513, 1, 4, -1)

				random_ms = math.random(750, 1000)

				wait(random_ms)
			end

			for iter_24_5 = 1, ggtable.m4a1 do
				sampSendDialogResponse(1513, 1, 5, -1)

				random_ms = math.random(750, 1000)

				wait(random_ms)
			end

			for iter_24_6 = 1, ggtable.rifle do
				sampSendDialogResponse(1513, 1, 5, -1)

				random_ms = math.random(900, 1000)

				wait(random_ms)
			end

			gg = false
			var_0_19 = false
		end
	end
end

function squad_check()
	while true do
		wait(0)

		if var_0_18 then
			sampSendChat("/squad")
			wait(3000)
		end
	end
end

local var_0_25 = var_0_9.new.bool(config.data.chat.ad)
local var_0_26 = var_0_9.new.bool(config.data.chat.vip_ad)
local var_0_27 = var_0_9.new.bool(config.data.chat.gov)
local var_0_28 = var_0_9.new.bool(config.data.chat.ask)
local var_0_29 = var_0_9.new.bool(config.data.chat.events)
local var_0_30 = var_0_9.new.bool(config.data.chat.perenos)

function settings_chat()
	var_0_9.ToggleButtonTextGear("Скрывать объявления", var_0_25, function()
		config.data.chat.ad = not config.data.chat.ad

		config_save(config.data)
	end)
	var_0_9.ToggleButtonTextGear("Скрывать vip объявления", var_0_26, function()
		config.data.chat.vip_ad = not config.data.chat.vip_ad

		config_save(config.data)
	end)
	var_0_9.ToggleButtonTextGear("Скрывать гос. новости", var_0_27, function()
		config.data.chat.gov = not config.data.chat.gov

		config_save(config.data)
	end)
	var_0_9.ToggleButtonTextGear("Скрывать рекламу ask/news", var_0_28, function()
		config.data.chat.ask = not config.data.chat.ask

		config_save(config.data)
	end)
	var_0_9.ToggleButtonTextGear("Скрывать events", var_0_29, function()
		config.data.chat.events = not config.data.chat.events

		config_save(config.data)
	end)
	var_0_9.ToggleButtonTextGear("Переносить длинный текст", var_0_30, function()
		config.data.chat.perenos = not config.data.chat.perenos

		config_save(config.data)
	end)
end

function seeMe(arg_33_0)
	if arg_33_0 ~= "" then
		RpMessage = arg_33_0
		chathelper_Enable = true
		isMe = true
	end
end

function seeDo(arg_34_0)
	if arg_34_0 ~= "" then
		RpMessage = arg_34_0
		chathelper_Enable = true
		isDo = true
	end
end

function seeTry(arg_35_0)
	if arg_35_0 ~= "" then
		RpMessage = arg_35_0
		chathelper_Enable = true
		isTry = true
	end
end

cmd_short_comman_old = var_0_9.new.char[256]("")
cmd_short_comman_new = var_0_9.new.char[256]("")
cmd_short_added_combo_id = var_0_9.new.int()
cmd_short_added_combo_list = {
	"Для SRP и ERP",
	"Только для SRP",
	"Только для ERP"
}
cmd_short_added_combo_items = var_0_9.new["const char*"][#cmd_short_added_combo_list](cmd_short_added_combo_list)
cmd_short_list_combo_id = var_0_9.new.int()
cmd_short_list_combo_list = {
	"Показать сокращения для SRP",
	"Показать сокращения для ERP",
	"Показать все сокращения"
}
cmd_short_list_combo_items = var_0_9.new["const char*"][#cmd_short_list_combo_list](cmd_short_list_combo_list)
cmd_short_list_id = -1

local function var_0_31()
	var_0_9.PushItemWidth(300)
	var_0_9.InputText("Команда", cmd_short_comman_old, sizeof(cmd_short_comman_old))
	var_0_9.InputText("Сокращение", cmd_short_comman_new, sizeof(cmd_short_comman_new))

	if #config.data.cmd_shorten >= cmd_short_list_id and cmd_short_list_id ~= -1 then
		if var_0_9.Button("Изменить##shorten", var_0_9.ImVec2(146, 25)) then
			local var_36_0 = str(cmd_short_comman_old)
			local var_36_1 = str(cmd_short_comman_new)

			if #var_36_0 > 0 and #var_36_1 > 0 then
				config.data.cmd_shorten[cmd_short_list_id][1] = var_36_1
				config.data.cmd_shorten[cmd_short_list_id][2] = var_36_0
				config.data.cmd_shorten[cmd_short_list_id][3] = cmd_short_added_combo_id[0] == 1 and "srp" or cmd_short_added_combo_id[0] == 2 and "erp" or ""

				config_save(config.data)

				cmd_short_list_id = -1
			end
		end

		var_0_9.SameLine()

		if var_0_9.Button("Отмена##shorten", var_0_9.ImVec2(146, 25)) then
			cmd_short_list_id = -1
		end
	elseif var_0_9.Button("Создать##shorten", var_0_9.ImVec2(300, 25)) then
		local var_36_2 = str(cmd_short_comman_old)
		local var_36_3 = str(cmd_short_comman_new)

		if #var_36_2 > 0 and #var_36_3 > 0 then
			config.data.cmd_shorten[#config.data.cmd_shorten + 1] = {
				var_36_3,
				var_36_2
			}
			config.data.cmd_shorten[#config.data.cmd_shorten][3] = cmd_short_added_combo_id[0] == 1 and "srp" or cmd_short_added_combo_id[0] == 2 and "erp" or ""
		end
	end

	var_0_9.Spacing()
	var_0_9.Spacing()

	for iter_36_0 = 1, #config.data.cmd_shorten do
		if config.data.cmd_shorten[iter_36_0][3] == nil or config.data.cmd_shorten[iter_36_0][3] == "" or config.data.cmd_shorten[iter_36_0][3] == "srp" and cmd_short_list_combo_id[0] == 0 or config.data.cmd_shorten[iter_36_0][3] == "erp" and cmd_short_list_combo_id[0] == 1 or cmd_short_list_combo_id[0] == 2 then
			if var_0_9.Button(config.data.cmd_shorten[iter_36_0][2] .. " > " .. config.data.cmd_shorten[iter_36_0][1] .. (config.data.cmd_shorten[iter_36_0][3] ~= nil and (#config.data.cmd_shorten[iter_36_0][3] > 0 and " [" .. config.data.cmd_shorten[iter_36_0][3] .. "]" or " [all]") or " [all]"), var_0_9.ImVec2(350, 25)) then
				var_0_9.StrCopy(cmd_short_comman_old, config.data.cmd_shorten[iter_36_0][2])
				var_0_9.StrCopy(cmd_short_comman_new, config.data.cmd_shorten[iter_36_0][1])

				if config.data.cmd_shorten[iter_36_0][3] ~= nil then
					cmd_short_added_combo_id[0] = config.data.cmd_shorten[iter_36_0][3] == "srp" and 1 or 2
				else
					cmd_short_added_combo_id[0] = 0
				end

				cmd_short_list_id = iter_36_0
			end

			var_0_9.SameLine()

			if var_0_9.Button(var_0_4.TRASH .. "##trash_short_command" .. iter_36_0, var_0_9.ImVec2(25, 25)) then
				table.remove(config.data.cmd_shorten, iter_36_0)
				config_save(config.data)

				break
			end
		end
	end

	if var_0_9.Button("Сброс сокращений до стандартных", var_0_9.ImVec2(383, 25)) then
		config.data.cmd_shorten = {
			{
				"de",
				"gun deagle"
			},
			{
				"m4",
				"gun m4"
			},
			{
				"sh",
				"gun shotgun"
			},
			{
				"ri",
				"gun rifle"
			},
			{
				"ak",
				"gun ak47"
			},
			{
				"cl",
				"clist 0"
			},
			{
				"mb",
				"members"
			},
			{
				"gg",
				"get guns"
			},
			{
				"un",
				"unloading"
			},
			{
				"bun",
				"bunloading"
			},
			{
				"inv",
				"invite"
			},
			{
				"uval",
				"uninvite"
			},
			{
				"wl",
				"warelock"
			},
			{
				"sp",
				"spawnchange"
			},
			{
				"wa",
				"warehouse"
			},
			{
				"gr",
				"giverank"
			},
			{
				"ofm",
				"offmembers"
			}
		}

		config_save(config.data)
	end
end

font = renderCreateFont(config.data.narkotimer.font, config.data.narkotimer.size, config.data.narkotimer.flag)

local var_0_32 = false
local var_0_33 = config.data.narkotimer.seconds
local var_0_34 = 0
local var_0_35 = false
local var_0_36 = {}
local var_0_37 = var_0_9.new.bool(config.data.narkotimer.status)
local var_0_38 = true
local var_0_39 = false
local var_0_40 = false
local var_0_41 = var_0_9.new.char[256](var_0_14(config.data.narkotimer.lines_one))
local var_0_42 = var_0_9.new.char[256](var_0_14(config.data.narkotimer.lines_two))
local var_0_43 = var_0_9.new.char[256](var_0_14(config.data.narkotimer.font))
local var_0_44 = var_0_9.new.char[256](var_0_14(config.data.narkotimer.size))
local var_0_45 = var_0_9.new.char[256](var_0_14(config.data.narkotimer.flag))
local var_0_46 = var_0_9.new.int(config.data.narkotimer.height)
local var_0_47 = var_0_9.new.int(config.data.narkotimer.max_use_gram)
local var_0_48 = var_0_9.new.int(config.data.narkotimer.hp)

local function var_0_49()
	var_0_9.ToggleButtonText("Наркотаймер", var_0_37, function()
		config.data.narkotimer.status = not config.data.narkotimer.status

		config_save(config.data)
	end)

	if narkotimer_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.narkotimer.key = narkotimer_hotkey:GetHotKey()

		config_save(config.data)
	end

	if var_0_9.Button("Сменить позицию таймера", var_0_9.ImVec2(390, 20)) then
		var_0_39 = true
	end

	var_0_9.InputText("Текст без таймера", var_0_41, sizeof(var_0_41))

	local var_37_0 = 394
	local var_37_1 = 98

	var_0_9.SetCursorPos(var_0_9.ImVec2(var_37_0, var_37_1))
	var_0_9.Text("(?)")
	var_0_9.Question("!s - Таймер\n!a - Кол-во наркотиков\n!m - Кол-во материалов\n!n - Новая строка")
	var_0_9.Spacing()
	var_0_9.InputText("Текст с таймером", var_0_42, sizeof(var_0_42))
	var_0_9.InputText("Название шрифта", var_0_43, sizeof(var_0_43))
	var_0_9.InputText("Размер шрифта", var_0_44, sizeof(var_0_44))
	var_0_9.InputText("Стиль шрифта", var_0_45, sizeof(var_0_45))

	if var_0_9.Button("Сохранить##multi.nark.save", var_0_9.ImVec2(390, 25)) and str(var_0_44):find("^%d+$") and str(var_0_45):find("^%d+$") then
		config.data.narkotimer.lines_one = str(var_0_41)
		config.data.narkotimer.lines_two = str(var_0_42)
		config.data.narkotimer.font = str(var_0_43)
		config.data.narkotimer.size = tonumber(str(var_0_44))
		config.data.narkotimer.flag = tonumber(str(var_0_45))

		config_save(config.data)
		renderReleaseFont(font)

		font = renderCreateFont(config.data.narkotimer.font, config.data.narkotimer.size, config.data.narkotimer.flag)
	end

	var_0_9.Spacing()
	var_0_9.Spacing()
	var_0_9.Spacing()
	var_0_9.Spacing()

	local var_37_2 = config.data.narkotimer.align == 0 and "К левому краю" or config.data.narkotimer.align == 1 and "По середине" or "К правому краю"

	if var_0_9.Button("Выравнивание: " .. var_37_2 .. "##multi.nark.align", var_0_9.ImVec2(390, 25)) then
		config.data.narkotimer.align = config.data.narkotimer.align + 1

		if config.data.narkotimer.align >= 3 then
			config.data.narkotimer.align = 0
		end

		config_save(config.data)
	end

	var_0_9.PushItemWidth(150)

	if var_0_9.SliderInt("Расстояние между строк таймера", var_0_46, 2, 10) then
		config.data.narkotimer.height = var_0_46[0]

		config_save(config.data)
	end

	if var_0_9.SliderInt("Максимальное кол-во грамм", var_0_47, 0, 20) then
		config.data.narkotimer.max_use_gram = var_0_47[0]

		config_save(config.data)
	end

	if var_0_9.SliderInt("Максимальное кол-во HP", var_0_48, 0, 200) then
		config.data.narkotimer.hp = var_0_48[0]

		config_save(config.data)
	end
end

function check_boostinfo()
	while true do
		wait(0)

		if var_0_38 and config.data.narkotimer.status then
			sampSendChat("/boostinfo")
			wait(4000)
		end
	end
end

function narkotimerFunc()
	while true do
		wait(0)

		var_0_36[3] = {}
		var_0_36[4] = {}

		for iter_40_0 in string.gmatch(config.data.narkotimer.lines_one:gsub("!n", "\n"), "[^\n]+") do
			var_0_36[3][#var_0_36[3] + 1] = iter_40_0
		end

		for iter_40_1 in string.gmatch(config.data.narkotimer.lines_two:gsub("!n", "\n"), "[^\n]+") do
			var_0_36[4][#var_0_36[4] + 1] = iter_40_1
		end

		if config.data.narkotimer.status and not sampIsScoreboardOpen() and sampIsChatVisible() and not isKeyDown(116) and not isKeyDown(121) then
			second_timer = os.difftime(os.time(), var_0_34)
			render_table = second_timer <= var_0_33 and second_timer > 0 and var_0_36[4] or var_0_36[3]

			local var_40_0 = config.data.narkotimer.y
			local var_40_1 = renderGetFontDrawHeight(font) - renderGetFontDrawHeight(font) / config.data.narkotimer.height

			for iter_40_2 = 1, #render_table do
				if render_table[iter_40_2] ~= nil then
					string_gsub = render_table[iter_40_2]:gsub("!a", config.data.narkotimer.drugs)
					string_gsub = string_gsub:gsub("!s", tostring(math.ceil(var_0_33 - second_timer)))
					string_gsub = string_gsub:gsub("!m", tostring(config.data.narkotimer.mats))

					if config.data.narkotimer.align == 1 then
						X = config.data.narkotimer.x
					end

					if config.data.narkotimer.align == 2 then
						X = config.data.narkotimer.x - renderGetFontDrawTextLength(font, string_gsub) / 2
					end

					if config.data.narkotimer.align == 3 then
						X = config.data.narkotimer.x - renderGetFontDrawTextLength(font, string_gsub)
					end

					renderFontDrawText(font, string_gsub, X, var_40_0, 4294967295)

					var_40_0 = var_40_0 + var_40_1
				end
			end

			if isKeysPressed(config.data.narkotimer.key) and config.data.narkotimer.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
				local var_40_2 = math.ceil((config.data.narkotimer.hp + 1 - getCharHealth(playerPed)) / config.data.narkotimer.hp_one_gram)

				if var_40_2 > config.data.narkotimer.max_use_gram then
					var_40_2 = config.data.narkotimer.max_use_gram
				end

				sampSendChat(string.format("/%s %d", config.data.narkotimer.server_cmd, var_40_2))
			end

			if isKeyDown(16) and isKeysPressed(config.data.narkotimer.key) and config.data.narkotimer.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
				local var_40_3 = math.ceil((config.data.narkotimer.hp + 1 - getCharHealth(playerPed)) / config.data.narkotimer.hp_one_gram)

				if var_40_3 > config.data.narkotimer.max_use_gram then
					var_40_3 = config.data.narkotimer.max_use_gram
				end

				sampSendChat(string.format("/%s %d", config.data.narkotimer.server_cmd, var_40_3))
			end

			if isKeyDown(32) and isKeysPressed(config.data.narkotimer.key) and config.data.narkotimer.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
				local var_40_4 = math.ceil((config.data.narkotimer.hp + 1 - getCharHealth(playerPed)) / config.data.narkotimer.hp_one_gram)

				if var_40_4 > config.data.narkotimer.max_use_gram then
					var_40_4 = config.data.narkotimer.max_use_gram
				end

				sampSendChat(string.format("/%s %d", config.data.narkotimer.server_cmd, var_40_4))
			end

			if var_0_39 then
				sampSetCursorMode(3)

				curX, curY = getCursorPos()
				config.data.narkotimer.x = curX
				config.data.narkotimer.y = curY

				if isKeyJustPressed(1) then
					sampSetCursorMode(0)

					var_0_39 = false

					config_save(config.data)
				end
			end
		end
	end
end

local var_0_50 = var_0_9.new.bool(config.data.getgun_settings.status)
local var_0_51 = var_0_9.new.bool(config.data.getgun.armor)
local var_0_52 = 0

gg = false
ggtable = {}
getguns = {}
getgun_gun_list = {
	["SD Pistol"] = {
		"SD Pistol"
	},
	["Desert Eagle"] = {
		"Desert Eagle"
	},
	Shotgun = {
		"Shotgun"
	},
	SMG = {
		"SMG",
		"MP5"
	},
	AK47 = {
		"AK%-47",
		"AK47"
	},
	M4A1 = {
		"M4A1",
		"M4"
	},
	Rifle = {
		"Rifle"
	}
}

local function var_0_53()
	var_0_9.ToggleButtonText("Быстрое взятие гана", var_0_50, function()
		config.data.getgun_settings.status = config.data.getgun_settings.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация")

	if getgun_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.getgun_settings.key = getgun_hotkey:GetHotKey()

		config_save(config.data)
	end

	var_0_9.Spacing()
	var_0_9.Spacing()
	var_0_9.Text("Фракция")

	local var_41_0 = {
		"SD Pistol",
		"Desert Eagle",
		"Shotgun",
		"SMG",
		"AK47",
		"M4A1",
		"Rifle"
	}

	for iter_41_0 = 1, #var_41_0 do
		if config.data.getgun[var_41_0[iter_41_0]] ~= nil then
			if var_0_9.Button("+##plus_getgun" .. iter_41_0, var_0_9.ImVec2(20, 20)) then
				config.data.getgun[var_41_0[iter_41_0]] = config.data.getgun[var_41_0[iter_41_0]] + 1

				config_save(config.data)
			end

			var_0_9.SameLine()

			if var_0_9.Button("-##minus_getgun" .. iter_41_0, var_0_9.ImVec2(20, 20)) then
				config.data.getgun[var_41_0[iter_41_0]] = config.data.getgun[var_41_0[iter_41_0]] - 1

				if config.data.getgun[var_41_0[iter_41_0]] < 0 then
					config.data.getgun[var_41_0[iter_41_0]] = 0
				end

				config_save(config.data)
			end

			var_0_9.SameLine()
			var_0_9.Text(var_41_0[iter_41_0] .. ": " .. config.data.getgun[var_41_0[iter_41_0]])
		end
	end

	if var_0_9.Checkbox("Armor", var_0_51) then
		config.data.getgun.armor = var_0_51[0]

		config_save(config.data)
	end

	local var_41_1 = 230
	local var_41_2 = 97.9

	var_0_9.SetCursorPos(var_0_9.ImVec2(var_41_1, var_41_2))
	var_0_9.Text("Офис")

	local var_41_3 = {
		"SD Pistol",
		"Desert Eagle",
		"Shotgun",
		"SMG",
		"AK47",
		"M4A1",
		"Rifle"
	}

	for iter_41_1 = 1, #var_41_3 do
		if config.data.office_getgun[var_41_3[iter_41_1]] ~= nil then
			var_0_9.SetCursorPosX(230)

			if var_0_9.Button("+##plus_getgunsquad" .. iter_41_1, var_0_9.ImVec2(20, 20)) then
				config.data.office_getgun[var_41_3[iter_41_1]] = config.data.office_getgun[var_41_3[iter_41_1]] + 1

				config_save(config.data)
			end

			var_0_9.SameLine()

			if var_0_9.Button("-##minus_getgunsquad" .. iter_41_1, var_0_9.ImVec2(20, 20)) then
				config.data.office_getgun[var_41_3[iter_41_1]] = config.data.office_getgun[var_41_3[iter_41_1]] - 1

				if config.data.office_getgun[var_41_3[iter_41_1]] < 0 then
					config.data.office_getgun[var_41_3[iter_41_1]] = 0
				end

				config_save(config.data)
			end

			var_0_9.SameLine()
			var_0_9.Text(var_41_3[iter_41_1] .. ": " .. config.data.office_getgun[var_41_3[iter_41_1]])
		end
	end
end

function getgunFunc()
	getguns.status = false
	getguns.list_find = false
	getguns.list = {}
	getguns.active = 0

	while true do
		wait(0)

		if config.data.getgun_settings.status and isKeysPressed(config.data.getgun_settings.key) and isKeyCanBePressed() then
			if var_0_52 == 0 then
				setGameKeyState(15, 255)

				ggtable.pistol = config.data.office_getgun["SD Pistol"]
				ggtable.deagle = config.data.office_getgun["Desert Eagle"]
				ggtable.shotgun = config.data.office_getgun.Shotgun
				ggtable.smg = config.data.office_getgun.SMG
				ggtable.ak47 = config.data.office_getgun.AK47
				ggtable.m4a1 = config.data.office_getgun.M4A1
				ggtable.rifle = config.data.office_getgun.Rifle
				gg = true
			elseif var_0_52 == 11 or var_0_52 == 3 or var_0_52 == 2 then
				repeat
					wait(0)
				until os.clock() * 1000 - var_0_20 > 650

				ggtable.pistol = config.data.getgun["SD Pistol"]
				ggtable.deagle = config.data.getgun["Desert Eagle"]
				ggtable.shotgun = config.data.getgun.Shotgun
				ggtable.smg = config.data.getgun.SMG
				ggtable.ak47 = config.data.getgun.AK47
				ggtable.m4a1 = config.data.getgun.M4A1
				ggtable.rifle = config.data.getgun.Rifle

				if var_0_52 ~= 11 and config.data.getgun.armor then
					ggtable.armor = 1
				end

				local var_43_0, var_43_1 = getCharPlayerIsTargeting(playerHandle)

				if var_43_0 then
					resid, getgunid = sampGetPlayerIdByCharHandle(var_43_1)

					if resid then
						sampSendChat("/getgun " .. getgunid)
					end
				else
					sampSendChat("/getgun")
				end

				gg = true
			end
		end

		if getguns.status and (not getguns.list_find and #getguns.list == 0 or os.time() - getguns.active >= 2) then
			getguns.status = false
			getguns.list_find = false
		end
	end
end

deff_dialog = {}

function deffdialogFunc()
	while true do
		wait(0)

		if deff_dialog.send ~= nil and os.clock() * 1000 - deff_dialog.send.clock > deff_dialog.send.wait then
			sampSendDialogResponse(deff_dialog.send.dialogId, deff_dialog.send.button, deff_dialog.send.listitem, deff_dialog.send.input)

			deff_dialog.send = nil
		end
	end
end

local var_0_54 = var_0_9.new.bool(config.data.marker.status)
local var_0_55 = {
	"А",
	"Б",
	"В",
	"Г",
	"Д",
	"Ж",
	"З",
	"И",
	"К",
	"Л",
	"М",
	"Н",
	"О",
	"П",
	"Р",
	"С",
	"Т",
	"У",
	"Ф",
	"Х",
	"Ц",
	"Ч",
	"Ш",
	"Я"
}
local var_0_56

function removeUserBlip()
	deleteCheckpoint(var_0_56)
	removeWaypoint()
	addOneOffSound(0, 0, 0, 1149)
end

function sendBlipInChat(arg_46_0, arg_46_1, arg_46_2)
	sampSendChat(string.format("/fs Установил метку в %s. | CPOIX%sY%sZ%sE", getKv(round(arg_46_0), round(arg_46_1)), round(arg_46_0), round(arg_46_1), round(arg_46_2)))
end

function getKv(arg_47_0, arg_47_1)
	Square = var_0_55[math.ceil((arg_47_1 * -1 + 3000) / 250)] .. "-" .. math.ceil((arg_47_0 + 3000) / 250) .. "-" .. getUli(arg_47_0, arg_47_1)

	return Square
end

function getUli(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_1 * -1 + 3000
	local var_48_1 = arg_48_0 + 3000
	local var_48_2 = math.ceil((arg_48_0 + 3000) / 250)
	local var_48_3 = math.ceil((arg_48_1 * -1 + 3000) / 250)
	local var_48_4 = var_48_1 - (var_48_2 * 250 - 250)
	local var_48_5 = var_48_0 - (var_48_3 * 250 - 250)
	local var_48_6 = var_48_4 / 250
	local var_48_7 = var_48_5 / 250
	local var_48_8
	local var_48_9

	if var_48_6 < 0.33 then
		var_48_8 = 1
	elseif var_48_6 > 0.33 and var_48_6 < 0.66 then
		var_48_8 = 2
	elseif var_48_6 > 0.66 then
		var_48_8 = 3
	end

	if var_48_7 < 0.33 then
		var_48_9 = 1
	elseif var_48_7 > 0.33 and var_48_7 < 0.66 then
		var_48_9 = 2
	elseif var_48_7 > 0.66 then
		var_48_9 = 3
	end

	local var_48_10 = 0

	if var_48_9 == 1 then
		var_48_10 = var_48_8
	elseif var_48_9 == 2 then
		if var_48_8 == 1 then
			var_48_10 = 8
		elseif var_48_8 == 2 then
			var_48_10 = 9
		elseif var_48_8 == 3 then
			var_48_10 = 4
		end
	elseif var_48_9 == 3 then
		if var_48_8 == 1 then
			var_48_10 = 7
		elseif var_48_8 == 2 then
			var_48_10 = 6
		elseif var_48_8 == 3 then
			var_48_10 = 5
		end
	end

	return var_48_10
end

function get_crosshair_position()
	local var_49_0 = var_0_11.new("float[3]")
	local var_49_1 = var_0_11.new("float[3]")

	var_0_11.cast("void (__thiscall*)(void*, float, float, float, float, float*, float*)", 5327216)(var_0_11.cast("void*", 11989032), 15, var_49_1[0], var_49_1[1], var_49_1[2], var_49_1, var_49_0)

	return var_49_0[0], var_49_0[1], var_49_0[2]
end

function round(arg_50_0)
	return arg_50_0 - arg_50_0 % 1
end

function setMarker(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5)
	deleteCheckpoint(var_0_56)

	var_0_56 = createCheckpoint(arg_51_0, arg_51_1, arg_51_2, arg_51_3, 1, 1, 1, arg_51_4)

	addOneOffSound(0, 0, 0, 1190)
	removeWaypoint()
	placeWaypoint(arg_51_1, arg_51_2, arg_51_3)
	lua_thread.create(function()
		repeat
			wait(0)

			local var_52_0, var_52_1, var_52_2 = getCharCoordinates(PLAYER_PED)
			local var_52_3, var_52_4, var_52_5, var_52_6 = getTargetBlipCoordinates()
		until getDistanceBetweenCoords3d(arg_51_1, arg_51_2, arg_51_3, var_52_0, var_52_1, var_52_2) < arg_51_4 or var_52_3 == false

		removeUserBlip()
	end)
end

local function var_0_57()
	var_0_9.ToggleButtonText("Метка на карте", var_0_54, function()
		config.data.marker.status = not config.data.marker.status

		config_save(config.data)
	end, true, function()
		window_function = "marker"
	end)

	if marker_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.marker.key = marker_hotkey:GetHotKey()

		config_save(config.data)
	end
end

function markerFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.marker.key) and isKeyCanBePressed() and config.data.marker.status then
			resX, resY = convert3DCoordsToScreen(get_crosshair_position())
			targetX, targetY, targetZ = convertScreenCoordsToWorld3D(resX, resY, 3600)
			originX, originY, originZ = getActiveCameraCoordinates()
			result, colPoint = processLineOfSight(originX, originY, originZ, targetX, targetY, targetZ, true, true, false, true, true, true, true, true)

			if result then
				sendBlipInChat(colPoint.pos[1], colPoint.pos[2], colPoint.pos[3])
			end
		end
	end
end

local var_0_58 = var_0_9.new.bool(config.data.iznanka.status)
local var_0_59 = false
local var_0_60 = var_0_12.int(config.data.iznanka.int)
local var_0_61 = {
	"Shift",
	"Space"
}
local var_0_62 = var_0_9.new["const char*"][#var_0_61](var_0_61)

local function var_0_63()
	var_0_9.ToggleButtonText("Танец в стенку", var_0_58, function()
		config.data.iznanka.status = not config.data.iznanka.status

		config_save(config.data)
	end, true, function()
		window_function = "iznanka"
	end)

	if iznanka_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.iznanka.key = iznanka_hotkey:GetHotKey()

		config_save(config.data)
	end

	if var_0_9.Combo("Клавиша бега", var_0_60, var_0_62, #var_0_61) then
		config.data.iznanka.int = var_0_60[0]

		if config.data.iznanka.int == 0 then
			config.data.iznanka.run_key = 16
		elseif config.data.iznanka.int == 1 then
			config.data.iznanka.run_key = 32
		end

		config_save(config.data)
	end
end

function iznankaFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.iznanka.key) and config.data.iznanka.status and isKeyCanBePressed() and var_0_17 and not sampIsCursorActive() and not isCharInAnyCar(1) then
			var_0_59 = not var_0_59

			if var_0_59 then
				sampSetSpecialAction(7)
				setVirtualKeyDown(config.data.iznanka.run_key, true)
				wait(65)
				setVirtualKeyDown(83, true)
				iznanka_cycle()
			else
				setVirtualKeyDown(65, false)
				setVirtualKeyDown(68, false)
				setVirtualKeyDown(83, false)
				setVirtualKeyDown(config.data.iznanka.run_key, false)
				sampSetSpecialAction(0)
			end
		end

		if var_0_59 and (isKeysPressed(config.data.iznanka.key) or isCharDead(1) or isKeyJustPressed(82) or isKeyJustPressed(70)) then
			var_0_59 = false

			setVirtualKeyDown(65, false)
			setVirtualKeyDown(68, false)
			setVirtualKeyDown(83, false)
			setVirtualKeyDown(config.data.iznanka.run_key, false)
			sampSetSpecialAction(0)
		end
	end
end

function iznanka_cycle()
	lua_thread.create(function()
		while var_0_59 do
			setVirtualKeyDown(65, true)
			wait(400)
			setVirtualKeyDown(65, false)
			wait(65)
			setVirtualKeyDown(68, true)
			wait(400)
			setVirtualKeyDown(68, false)
			wait(65)
		end
	end)
end

local var_0_64 = var_0_9.new.bool(config.data.iznanka.status)
local var_0_65 = var_0_12.int(config.data.perevorot.speed)

local function var_0_66()
	var_0_9.ToggleButtonText("Переворот авто", var_0_64, function()
		config.data.perevorot.status = not config.data.perevorot.status

		config_save(config.data)
	end, true, function()
		window_function = "perevorot"
	end)

	if perevorot_one_hotkey:ShowHotKey(var_0_9.ImVec2(180, 20)) then
		config.data.perevorot.key_one = perevorot_one_hotkey:GetHotKey()

		config_save(config.data)
	end

	var_0_9.SameLine()

	if perevorot_two_hotkey:ShowHotKey(var_0_9.ImVec2(180, 20)) then
		config.data.perevorot.key_two = perevorot_two_hotkey:GetHotKey()

		config_save(config.data)
	end

	if var_0_9.SliderInt(var_0_14("Скорость"), var_0_65, 0, 50) then
		config.data.perevorot.speed = var_0_65[0]

		config_save(config.data)
	end
end

function perevorotFunc()
	while true do
		wait(0)

		if isCharInAnyCar(PLAYER_PED) and config.data.perevorot.status and isKeyCanBePressed() and var_0_17 then
			if isKeysDown(config.data.perevorot.key_one) then
				addToCarRotationVelocity(storeCarCharIsInNoSave(PLAYER_PED), 0, -tonumber(config.data.perevorot.speed / 100), 0)
			elseif isKeysDown(config.data.perevorot.key_two) then
				addToCarRotationVelocity(storeCarCharIsInNoSave(PLAYER_PED), 0, tonumber(config.data.perevorot.speed / 100), 0)
			end
		end
	end
end

local var_0_67 = var_0_9.new.bool(config.data.doublejump.status)
local var_0_68 = var_0_12.int(config.data.doublejump.int)
local var_0_69 = {
	"Shift",
	"Space"
}
local var_0_70 = var_0_9.new["const char*"][#var_0_69](var_0_69)

local function var_0_71()
	var_0_9.ToggleButtonText("DoubleJump", var_0_67, function()
		config.data.doublejump.status = not config.data.doublejump.status

		config_save(config.data)
	end)

	if doublejump_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.doublejump.key = doublejump_hotkey:GetHotKey()

		config_save(config.data)
	end

	if var_0_9.Combo("Клавиша прыжка", var_0_68, var_0_70, #var_0_69) then
		config.data.doublejump.int = var_0_68[0]

		if config.data.doublejump.int == 0 then
			config.data.doublejump.jump_key = 16
		elseif config.data.doublejump.int == 1 then
			config.data.doublejump.jump_key = 32
		end

		config_save(config.data)
	end
end

function doublejumpFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.doublejump.key) and config.data.doublejump.status and isKeyCanBePressed() then
			taskPlayAnimNonInterruptable(PLAYER_PED, "colt45_reload", "COLT45", 4.0999999046326, false, false, true, true, 1)

			for iter_69_0 = 1, 10 do
				if iter_69_0 == 3 then
					taskPlayAnimNonInterruptable(PLAYER_PED, "colt45_reload", "COLT45", 4.0999999046326, false, false, true, true, 1)
				end

				setVirtualKeyDown(config.data.doublejump.jump_key, true)
				wait(2)
				setVirtualKeyDown(config.data.doublejump.jump_key, false)
				wait(12)
			end
		end
	end
end

local var_0_72 = var_0_9.new.bool(config.data.autoadr.status)
local var_0_73 = false

local function var_0_74()
	var_0_9.ToggleButtonText("Автоиспользование адреналина", var_0_72, function()
		config.data.autoadr.status = not config.data.autoadr.status

		config_save(config.data)
	end)

	if var_0_9.Button("Адреналин при переломах " .. (config.data.autoadr.perelom and "[ON]" or "[OFF]") .. "##multi.menu", var_0_9.ImVec2(390, 20)) then
		config.data.autoadr.perelom = not config.data.autoadr.perelom

		config_save(config.data)
	end

	if var_0_9.Button("Адреналин при ломках " .. (config.data.autoadr.lomka and "[ON]" or "[OFF]") .. "##multi.menus", var_0_9.ImVec2(390, 20)) then
		config.data.autoadr.lomka = not config.data.autoadr.lomka

		config_save(config.data)
	end

	if var_0_9.Button("Сбив " .. (config.data.autoadr.sbiv and "[ON]" or "[OFF]") .. "##multi.menu", var_0_9.ImVec2(390, 20)) then
		config.data.autoadr.sbiv = not config.data.autoadr.sbiv

		config_save(config.data)
	end
end

function autoadrFunc()
	while true do
		wait(0)

		if var_0_73 and config.data.autoadr.status then
			sampSendChat("/adr")

			if config.data.autoadr.sbiv and not isCharInAnyCar(PLAYER_PED) then
				wait(100)
				sampSetSpecialAction(7)
				wait(50)
				sampSetSpecialAction(0)
			end

			var_0_73 = false
		end
	end
end

local var_0_75 = var_0_9.new.bool(config.data.autoclist_after_spawn.status)
local var_0_76 = var_0_9.new.int(config.data.autoclist_after_spawn.clist)
local var_0_77 = 0

local function var_0_78()
	var_0_9.ToggleButtonText("Автоклист после спавна", var_0_75, function()
		config.data.autoclist_after_spawn.status = not config.data.autoclist_after_spawn.status

		config_save(config.data)
	end)
	var_0_9.SetNextItemWidth(150)

	if var_0_9.SliderInt("clist", var_0_76, 0, 33) then
		config.data.autoclist_after_spawn.clist = var_0_76[0]

		config_save(config.data)
	end
end

function autoclistspawnFunc()
	while true do
		wait(0)

		if sampIsLocalPlayerSpawned() and config.data.autoclist_after_spawn.status and var_0_77 ~= 0 and os.time() - var_0_77 > 0 then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			sampSendChat(string.format("/clist %s", config.data.autoclist_after_spawn.clist))

			var_0_77 = 0
		end
	end
end

local var_0_79 = var_0_9.new.bool(config.data.autoclist_after_capt.status)
local var_0_80 = var_0_9.new.int(config.data.autoclist_after_capt.clist)
local var_0_81 = false

local function var_0_82()
	var_0_9.ToggleButtonText("Автоклист после капта", var_0_79, function()
		config.data.autoclist_after_capt.status = not config.data.autoclist_after_capt.status

		config_save(config.data)
	end)
	var_0_9.SetNextItemWidth(150)

	if var_0_9.SliderInt("clist", var_0_80, 0, 33) then
		config.data.autoclist_after_capt.clist = var_0_80[0]

		config_save(config.data)
	end
end

function autoclistcaptFunc()
	while true do
		wait(0)

		if var_0_81 and config.data.autoclist_after_capt.status then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			sampSendChat(string.format("/clist %s", config.data.autoclist_after_capt.clist))

			var_0_81 = false
		end
	end
end

local var_0_83 = var_0_9.new.bool(config.data.camhack.status)

local function var_0_84()
	var_0_9.ToggleButtonText("Camhack", var_0_83, function()
		config.data.camhack.status = var_0_83[0]

		config_save(config.data)
	end)
	var_0_9.Text("Активация Camhack")

	if camhack_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.camhack.key = camhack_hotkey:GetHotKey()

		config_save(config.data)
	end

	var_0_9.Spacing()
	var_0_9.Spacing()

	if var_0_9.Button("Показывать текст над головой на любом расстоянии " .. (config.data.camhack.bubble and "[ON]" or "[OFF]") .. "##multi.menu_camhack", var_0_9.ImVec2(390, 20)) then
		config.data.camhack.bubble = not config.data.camhack.bubble

		config_save(config.data)
	end

	if var_0_9.Button("Обходить варнинги " .. (config.data.camhack.antiwarning and "[ON]" or "[OFF]") .. "##multi.menu_camhack", var_0_9.ImVec2(390, 20)) then
		config.data.camhack.antiwarning = not config.data.camhack.antiwarning

		config_save(config.data)
	end

	var_0_9.Spacing()
	var_0_9.Text("Описание:")
	var_0_9.TextColoredRGB("{FFFFFF}Представляет собой обыкновенный камхак, но с обходом платных \n{FFFFFF}варнингов. После активации вы сможете свободно управлять\n{FFFFFF}камерой через {00ccff}WASD{ffffff}.\n{FFFFFF}Камеру можно замедлять на {00ccff}-{ffffff} и ускорять на {00ccff}+{ffffff}\n{00ccff}F10{ffffff} включает/выключает худ.\n\n{FFFFFF}Если камера залагает, включите и выключите ещё раз.\n\nАвторы: sanek a.k.a Maks_Fender, edited by ANIKI, qrlk обход\n{FFFFFF}варнингов")
end

ch = {}
ch_flymode = 0
ch_speed = 1
ch_radarHud = 0
ch_keyPressed = 0
ch_posX, ch_posY, ch_posZ = 0, 0, 0
ch_angY, ch_angZ = 0, 0
ch_radZ, ch_radY = 0, 0
ch_sinZ, ch_cosZ = 0, 0
ch_sinY, ch_cosY = 0, 0
ch_poiX, ch_poiY, ch_poiZ = 0, 0, 0
ch_curZ, ch_curY, ch_angPlZ = 0, 0, 0
ch_posPlX, ch_posPlY, ch_posPlZ = 0, 0, 0

function camhackFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.camhack.key) and config.data.camhack.status and isKeyCanBePressed() and ch_flymode == 0 then
			ch_hide_interface(false)

			ch_posX, ch_posY, ch_posZ = getCharCoordinates(playerPed)
			ch_angZ = getCharHeading(playerPed)
			ch_angZ = ch_angZ * -1

			setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)

			ch_angY = 0

			lockPlayerControl(true)

			ch_flymode = 1

			repeat
				wait(0)
			until not isKeysDown(config.data.camhack.key)
		end

		if config.data.camhack.status and ch_flymode == 1 and not sampIsChatInputActive() and not isSampfuncsConsoleActive() then
			offMouX, offMouY = getPcMouseMovement()
			offMouX = offMouX / 4
			offMouY = offMouY / 4
			ch_angZ = ch_angZ + offMouX
			ch_angY = ch_angY + offMouY

			if ch_angZ > 360 then
				ch_angZ = ch_angZ - 360
			end

			if ch_angZ < 0 then
				ch_angZ = ch_angZ + 360
			end

			if ch_angY > 89 then
				ch_angY = 89
			end

			if ch_angY < -89 then
				ch_angY = -89
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			ch_curZ = ch_angZ + 180
			ch_curY = ch_angY * -1
			ch_radZ = math.rad(ch_curZ)
			ch_radY = math.rad(ch_curY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 10
			ch_cosZ = ch_cosZ * 10
			ch_sinY = ch_sinY * 10
			ch_posPlX = ch_posX + ch_sinZ
			ch_posPlY = ch_posY + ch_cosZ
			ch_posPlZ = ch_posZ + ch_sinY
			ch_angPlZ = ch_angZ * -1
			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if isKeyDown(VK_W) then
				ch_radZ = math.rad(ch_angZ)
				ch_radY = math.rad(ch_angY)
				ch_sinZ = math.sin(ch_radZ)
				ch_cosZ = math.cos(ch_radZ)
				ch_sinY = math.sin(ch_radY)
				ch_cosY = math.cos(ch_radY)
				ch_sinZ = ch_sinZ * ch_cosY
				ch_cosZ = ch_cosZ * ch_cosY
				ch_sinZ = ch_sinZ * ch_speed
				ch_cosZ = ch_cosZ * ch_speed
				ch_sinY = ch_sinY * ch_speed
				ch_posX = ch_posX + ch_sinZ
				ch_posY = ch_posY + ch_cosZ
				ch_posZ = ch_posZ + ch_sinY

				setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if isKeyDown(VK_S) then
				ch_curZ = ch_angZ + 180
				ch_curY = ch_angY * -1
				ch_radZ = math.rad(ch_curZ)
				ch_radY = math.rad(ch_curY)
				ch_sinZ = math.sin(ch_radZ)
				ch_cosZ = math.cos(ch_radZ)
				ch_sinY = math.sin(ch_radY)
				ch_cosY = math.cos(ch_radY)
				ch_sinZ = ch_sinZ * ch_cosY
				ch_cosZ = ch_cosZ * ch_cosY
				ch_sinZ = ch_sinZ * ch_speed
				ch_cosZ = ch_cosZ * ch_speed
				ch_sinY = ch_sinY * ch_speed
				ch_posX = ch_posX + ch_sinZ
				ch_posY = ch_posY + ch_cosZ
				ch_posZ = ch_posZ + ch_sinY

				setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if isKeyDown(VK_A) then
				ch_curZ = ch_angZ - 90
				ch_radZ = math.rad(ch_curZ)
				ch_radY = math.rad(ch_angY)
				ch_sinZ = math.sin(ch_radZ)
				ch_cosZ = math.cos(ch_radZ)
				ch_sinZ = ch_sinZ * ch_speed
				ch_cosZ = ch_cosZ * ch_speed
				ch_posX = ch_posX + ch_sinZ
				ch_posY = ch_posY + ch_cosZ

				setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if isKeyDown(VK_D) then
				ch_curZ = ch_angZ + 90
				ch_radZ = math.rad(ch_curZ)
				ch_radY = math.rad(ch_angY)
				ch_sinZ = math.sin(ch_radZ)
				ch_cosZ = math.cos(ch_radZ)
				ch_sinZ = ch_sinZ * ch_speed
				ch_cosZ = ch_cosZ * ch_speed
				ch_posX = ch_posX + ch_sinZ
				ch_posY = ch_posY + ch_cosZ

				setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if isKeyDown(VK_SPACE) then
				ch_posZ = ch_posZ + ch_speed

				setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if isKeyDown(VK_SHIFT) then
				ch_posZ = ch_posZ - ch_speed

				setFixedCameraPosition(ch_posX, ch_posY, ch_posZ, 0, 0, 0)
			end

			ch_radZ = math.rad(ch_angZ)
			ch_radY = math.rad(ch_angY)
			ch_sinZ = math.sin(ch_radZ)
			ch_cosZ = math.cos(ch_radZ)
			ch_sinY = math.sin(ch_radY)
			ch_cosY = math.cos(ch_radY)
			ch_sinZ = ch_sinZ * ch_cosY
			ch_cosZ = ch_cosZ * ch_cosY
			ch_sinZ = ch_sinZ * 1
			ch_cosZ = ch_cosZ * 1
			ch_sinY = ch_sinY * 1
			ch_poiX = ch_posX
			ch_poiY = ch_posY
			ch_poiZ = ch_posZ
			ch_poiX = ch_poiX + ch_sinZ
			ch_poiY = ch_poiY + ch_cosZ
			ch_poiZ = ch_poiZ + ch_sinY

			pointCameraAtPoint(ch_poiX, ch_poiY, ch_poiZ, 2)

			if ch_keyPressed == 0 and isKeyDown(VK_F10) then
				ch_keyPressed = 1

				if ch_radarHud == 0 then
					ch_hide_interface(true)

					ch_radarHud = 1
				else
					ch_hide_interface(false)

					ch_radarHud = 0
				end
			end

			if wasKeyReleased(VK_F10) and ch_keyPressed == 1 then
				ch_keyPressed = 0
			end

			if isKeyDown(187) then
				ch_speed = ch_speed + 0.01

				printStringNow(ch_speed, 1000)
			end

			if isKeyDown(189) then
				ch_speed = ch_speed - 0.01

				if ch_speed < 0.01 then
					ch_speed = 0.01
				end

				printStringNow(ch_speed, 1000)
			end

			if isKeysPressed(config.data.camhack.key) then
				ch_hide_interface(true)

				ch_radarHud = 0
				ch_angPlZ = ch_angZ * -1

				lockPlayerControl(false)
				restoreCameraJumpcut()
				setCameraBehindPlayer()

				ch_flymode = 0
			end
		end
	end
end

function ch_hide_interface(arg_82_0)
	if not arg_82_0 then
		var_0_8.write(sampGetBase() + 463887, 1, 1, true)
		sampSetChatDisplayMode(0)
		var_0_11.fill(var_0_11.cast(var_0_11.typeof("void*"), 5831763), 5, 144)
		displayHud(false)
		var_0_8.setint8(12216172, 2)
	else
		var_0_8.write(sampGetBase() + 463887, 0, 1, true)
		sampSetChatDisplayMode(2)
		var_0_11.copy(var_0_11.cast(var_0_11.typeof("void*"), 5831763), var_0_11.cast(var_0_11.typeof("void*"), tonumber(var_0_11.cast("intptr_t", var_0_11.cast("const char*", "\xE8ئ\xFF\xFF")))), 5)
		displayHud(true)
		var_0_8.setint8(12216172, 0)
	end
end

local var_0_85 = var_0_9.new.bool(config.data.autohealme.status)

healme = {}
healme.start = false
healme.wait = 0
healme.old = -1

local function var_0_86()
	var_0_9.ToggleButtonText("Автоиспользование аптечек", var_0_85, function()
		config.data.autohealme.status = not config.data.autohealme.status

		config_save(config.data)
	end)
end

function autohealmeFunc()
	while true do
		wait(0)

		if healme.start and os.time() - healme.wait >= 3 then
			if getCharHealth(playerPed) < 100 then
				if os.clock() * 1000 - var_0_20 > 850 then
					var_0_20 = os.clock() * 1000

					if healme.old ~= -1 and getCharHealth(playerPed) == healme.old then
						healme.start = false
						healme.old = -1
					else
						healme.old = getCharHealth(playerPed)

						sampSendChat("/healme")
					end
				end
			else
				healme.start = false
			end
		end
	end
end

sbinder = {}
sbinder.select_id = -1
sbinder.input_text = var_0_9.new.char[1024]("")
kosyha = {}
kosyha.bind = {
	"/do Front Side: [Fullpatch Member] [Ваша Дорожная] [PFFP]",
	"wait 650",
	"/do Wing Side: [Guess Who`s Back] [1618]",
	"wait 650",
	"/do Back Side: [Paleriders] [1`/.-er] [MC] [San-Andreas]"
}
binder = {}
binder_handle = {}

function binder_register()
	function read_array(arg_87_0)
		for iter_87_0, iter_87_1 in pairs(arg_87_0) do
			if type(iter_87_1) == "table" then
				if iter_87_1.key ~= nil then
					local function var_87_0()
						return
					end

					local var_87_1 = false

					if iter_87_1.sendtext ~= nil then
						var_87_1 = iter_87_1.onekey

						function var_87_0()
							function binder.sender()
								if not sampIsChatInputActive() then
									for iter_90_0, iter_90_1 in pairs(iter_87_1.sendtext) do
										wait(0)

										if iter_90_1:find("wait %d+") then
											wait(tonumber(iter_90_1:match("wait (%d+)")))
										else
											sampSendChat(binder_gsub(iter_90_1))
										end
									end

									repeat
										wait(0)
									until not isKeysDown(iter_87_1.key)
								end
							end
						end
					end

					binder_handle[tostring(iter_87_0)] = var_0_2.RegisterHotKey(tostring(iter_87_0), var_87_1, iter_87_1.key, var_87_0)
				end

				read_array(iter_87_1)
			end
		end
	end

	read_array(config.data.binder)
end

function binder_loop()
	while true do
		wait(0)

		if binder.sender ~= nil then
			binder.sender()

			binder.sender = nil
		end
	end
end

function binder_unregister()
	for iter_92_0, iter_92_1 in pairs(binder_handle) do
		var_0_2.RemoveHotKey(iter_92_0)
	end

	binder_handle = {}
end

binder_replace = {
	["{target_rp_name}"] = "nil",
	["{target_id}"] = "0",
	["{id_out_sms}"] = "0",
	["{target_name}"] = "nil",
	["{id_in_sms}"] = "0"
}

function binder_gsub(arg_93_0)
	for iter_93_0, iter_93_1 in pairs(binder_replace) do
		if arg_93_0:find(iter_93_0) then
			arg_93_0 = arg_93_0:gsub(iter_93_0, iter_93_1)
		end
	end

	return arg_93_0
end

function binder_loop_target()
	while true do
		wait(0)

		local var_94_0, var_94_1 = getCharPlayerIsTargeting(PLAYER_HANDLE)

		if var_94_0 then
			local var_94_2, var_94_3 = sampGetPlayerIdByCharHandle(var_94_1)

			if var_94_2 then
				local var_94_4 = sampGetPlayerNickname(var_94_3)

				binder_replace["{target_id}"] = var_94_3
				binder_replace["{target_rp_name}"] = var_94_4:gsub("_", " ")
				binder_replace["{target_name}"] = var_94_4
			end
		end
	end
end

local function var_0_87()
	if sbinder.select_id == -1 then
		if var_0_9.Button("Создать новый бинд ##new_binder", var_0_9.ImVec2(390, 25)) then
			config.data.binder[#config.data.binder + 1] = {
				onekey = false,
				enter = true,
				sendtext = {},
				key = {}
			}

			config_save(config.data)
			binder_unregister()
			binder_register()
		end

		if var_0_9.Button("Создать общий бинд косухи ##new_binder", var_0_9.ImVec2(390, 25)) then
			config.data.binder[#config.data.binder + 1] = {
				onekey = false,
				enter = true,
				sendtext = kosyha.bind,
				key = {}
			}

			config_save(config.data)
			binder_unregister()
			binder_register()
		end

		for iter_95_0 = 1, #config.data.binder do
			if var_0_9.Button(var_0_4.PEN_TO_SQUARE .. "##binder_edit" .. iter_95_0, var_0_9.ImVec2(25, 25)) then
				local var_95_0 = ""

				for iter_95_1 = 1, #config.data.binder[iter_95_0].sendtext do
					var_95_0 = var_95_0 .. config.data.binder[iter_95_0].sendtext[iter_95_1] .. "\n"
				end

				var_0_9.StrCopy(sbinder.input_text, var_95_0)

				sbinder.select_id = iter_95_0

				break
			end

			var_0_9.Question("Редактировать")
			var_0_9.SameLine()

			if binder_handle[tostring(iter_95_0)]:ShowHotKey(var_0_9.ImVec2(248, 25)) then
				config.data.binder[iter_95_0].key = binder_handle[tostring(iter_95_0)]:GetHotKey()

				config_save(config.data)
			end

			var_0_9.Question("Сменить активацию")
			var_0_9.SameLine()

			local var_95_1 = ""

			for iter_95_2, iter_95_3 in pairs(config.data.binder[iter_95_0].sendtext) do
				var_95_1 = var_95_1 .. iter_95_3 .. "\n"
			end

			var_0_9.Button(var_0_4.NOTE_STICKY .. "##quest" .. iter_95_0, var_0_9.ImVec2(25, 25))
			var_0_9.Question(var_95_1)
			var_0_9.SameLine()

			if var_0_9.Button((config.data.binder[iter_95_0].onekey and var_0_4.DICE_ONE or var_0_4.DICE_TWO) .. "##question" .. iter_95_0, var_0_9.ImVec2(25, 25)) then
				config.data.binder[iter_95_0].key = {}
				config.data.binder[iter_95_0].onekey = not config.data.binder[iter_95_0].onekey

				config_save(config.data)
				binder_unregister()
				binder_register()

				break
			end

			var_0_9.Question(config.data.binder[iter_95_0].onekey and "Используется 1 клавиша активации" or "Используется 2 клавиши активации")
			var_0_9.SameLine()

			if var_0_9.Button(var_0_4.TRASH .. "##trash_binder" .. iter_95_0, var_0_9.ImVec2(25, 25)) then
				table.remove(config.data.binder, iter_95_0)
				config_save(config.data)

				sbinder.select_id = -1

				binder_unregister()
				binder_register()

				break
			end

			var_0_9.Question("Удалить")
		end
	else
		var_0_9.InputTextMultiline("##InputTextMultiline_binder", sbinder.input_text, 1024, var_0_9.ImVec2(-1, 150))

		if var_0_9.Button("Сохранить##save_edit_binder", var_0_9.ImVec2(125, 25)) then
			local var_95_2 = split(str(sbinder.input_text), "\n")

			config.data.binder[sbinder.select_id].sendtext = var_95_2

			config_save(config.data)

			sbinder.select_id = -1
		end

		if var_0_9.Button("Назад##cancel_edit_binder", var_0_9.ImVec2(125, 25)) then
			sbinder.select_id = -1
		end

		var_0_9.Text("Поддерживает замены в тексте:\n{target_id} - Заменяет на ID человека по таргету\n{target_rp_name} - Заменяет на никнейм игрока без нижнего\n- подчеркивания по таргету\n{target_name} - Заменяет на никнейм игрока по таргету\n{id_in_sms} - Заменяет на ID человека который прислал Вам СМС\n{id_out_sms} - Заменяет на ID игрока которому вы отправили СМС\n\nwait 1000 - Ставит задержки между строк (1000 - 1 секунда)")
	end
end

local var_0_88 = var_0_9.new.bool(config.data.sbiv.status)

local function var_0_89()
	var_0_9.ToggleButtonText("Сбив анимации", var_0_88, function()
		config.data.sbiv.status = not config.data.sbiv.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация сбива")

	if sbiv_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.sbiv.key = sbiv_hotkey:GetHotKey()

		config_save(config.data)
	end
end

function sbivFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.sbiv.key) and config.data.sbiv.status and isKeyCanBePressed() and isCharOnFoot(PLAYER_PED) then
			sampSetSpecialAction(7)
		elseif wasReleased(config.data.sbiv.key) and config.data.sbiv.status then
			sampSetSpecialAction(0)
		end
	end
end

local var_0_90 = var_0_9.new.bool(config.data.vspiwka.status)
local var_0_91 = false

local function var_0_92()
	var_0_9.ToggleButtonText("Вспышка", var_0_90, function()
		config.data.vspiwka.status = not config.data.vspiwka.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация")

	if vspiwka_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.vspiwka.key = vspiwka_hotkey:GetHotKey()

		config_save(config.data)
	end
end

function vspiwkaFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.vspiwka.key) and config.data.vspiwka.status and isKeyCanBePressed() and isCharOnFoot(PLAYER_PED) and var_0_17 then
			if not var_0_91 then
				taskPlayAnim(PLAYER_PED, "FLOOR_HIT", "PED", 4, false, false, false, true, -1)

				var_0_91 = true
			else
				sampSetSpecialAction(7)
				wait(2)
				sampSetSpecialAction(0)

				var_0_91 = false
			end

			wait(200)
		end
	end
end

local var_0_93 = var_0_9.new.bool(config.data.grib_heal.status)

local function var_0_94()
	var_0_9.ToggleButtonText("Быстрый хил грибами", var_0_93, function()
		config.data.grib_heal.status = not config.data.grib_heal.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация")

	if grib_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.grib_heal.key = grib_hotkey:GetHotKey()

		config_save(config.data)
	end
end

function gribhealFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.grib_heal.key) and config.data.grib_heal.status and isKeyCanBePressed() and isCharOnFoot(PLAYER_PED) and var_0_17 then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			sampSendChat("/grib eat")
			wait(600)
			sampSendChat("/grib heal")
			wait(4250)
		end
	end
end

local var_0_95 = var_0_9.new.bool(config.data.rkt.status)

local function var_0_96()
	var_0_9.ToggleButtonText("Быстрый RKT + сбив", var_0_95, function()
		config.data.rkt.status = not config.data.rkt.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация")

	if rkt_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.rkt.key = rkt_hotkey:GetHotKey()

		config_save(config.data)
	end
end

function rktFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.rkt.key) and config.data.rkt.status and isKeyCanBePressed() and isCharOnFoot(PLAYER_PED) and var_0_17 then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			sampSendChat("/rkt")
			wait(200)
			sampSetSpecialAction(7)
			wait(2)
			sampSetSpecialAction(0)
		end
	end
end

local var_0_97 = var_0_9.new.bool(config.data.flip.status)

local function var_0_98()
	var_0_9.ToggleButtonText("Быстрый FLIP + сбив", var_0_97, function()
		config.data.flip.status = not config.data.flip.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация")

	if flip_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.flip.key = flip_hotkey:GetHotKey()

		config_save(config.data)
	end
end

function flipFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.flip.key) and config.data.flip.status and isKeyCanBePressed() and var_0_17 then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			sampSendChat("/flip")

			if isCharOnFoot(PLAYER_PED) then
				wait(110)
				sampSetSpecialAction(7)
				wait(2)
				sampSetSpecialAction(0)
			end
		end
	end
end

local var_0_99 = var_0_9.new.bool(config.data.delete_cue.status)
local var_0_100 = 1

function deletecueFunc()
	while true do
		wait(0)

		if sampIsLocalPlayerSpawned() and config.data.delete_cue.status and var_0_100 ~= 0 and os.time() - var_0_100 > 0 then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			if hasCharGotWeapon(PLAYER_PED, 7) then
				removeWeaponFromChar(PLAYER_PED, 7)
			end

			var_0_100 = 0
		end
	end
end

local var_0_101 = {}
local var_0_102 = false
local var_0_103 = renderCreateFont(config.data.squad.font, config.data.squad.size, FCR_BORDER + FCR_BOLD)
local var_0_104 = var_0_9.new.bool(config.data.squad.status)
local var_0_105 = var_0_9.new.char[256](config.data.squad.text)
local var_0_106 = var_0_9.new.char[256](var_0_14(config.data.squad.size))
local var_0_107 = var_0_9.new.char[256](var_0_14(config.data.squad.font))
local var_0_108 = var_0_9.new.char[256](config.data.squad.online_text)

local function var_0_109()
	var_0_9.ToggleButtonText("Кастомный сквад", var_0_104, function()
		config.data.squad.status = not config.data.squad.status

		config_save(config.data)
	end)

	if var_0_9.Button("Сменить позицию сквада", var_0_9.ImVec2(390, 25)) then
		reserve_x, reserve_y = config.data.squad.x, config.data.squad.y

		showCursor(true, true)

		squad_pos = true
	end

	var_0_9.InputText("Заголовок", var_0_105, sizeof(var_0_105))
	var_0_9.InputText("Размер", var_0_106, sizeof(var_0_106))
	var_0_9.InputText("Шрифт", var_0_107, sizeof(var_0_107))
	var_0_9.InputText("Онлайн", var_0_108, sizeof(var_0_108))

	if var_0_9.Button("Сбросить настройки##m", var_0_9.ImVec2(390, 25)) then
		var_0_105 = var_0_9.new.char[256]("Состав отряда:")
		var_0_106 = var_0_9.new.char[256](var_0_14(10))
		var_0_107 = var_0_9.new.char[256](var_0_14("Trebuc"))
		var_0_108 = var_0_9.new.char[256]("online: !n")
		config.data.squad.x = 5
		config.data.squad.y = var_0_22 * 0.358333333
		config.data.squad.font = "Trebuc"
		config.data.squad.text = "Состав отряда:"
		config.data.squad.size = 10
		config.data.squad.status = true
		config.data.squad.online_text = "online: !n"
		squads_font = renderCreateFont(config.data.squad.font, config.data.squad.size, FCR_BORDER + FCR_BOLD)

		config_save(config.data)
	end

	if var_0_9.Button("Сохранить##multi.squad.save", var_0_9.ImVec2(390, 25)) and str(var_0_106):find("^%d+$") then
		config.data.squad.text = str(var_0_105)
		config.data.squad.size = tonumber(str(var_0_106))
		config.data.squad.font = str(var_0_107)
		config.data.squad.online_text = str(var_0_108)

		config_save(config.data)

		squads_font = renderCreateFont(config.data.squad.font, config.data.squad.size, config.data.squad.style)
	end
end

function squadFunc()
	while true do
		wait(0)

		if sampTextdrawIsExists(config.data.squad.squadid) or sampTextdrawIsExists(2065) or sampTextdrawIsExists(2067) or sampTextdrawIsExists(2051) then
			if sampTextdrawIsExists(config.data.squad.squadid) and sampTextdrawGetString(config.data.squad.squadid):find("SQUAD") then
				-- block empty
			elseif sampTextdrawIsExists(2065) and sampTextdrawGetString(2065):find("SQUAD") then
				config.data.squad.squadid = 2065

				config_save(config.data)
			elseif sampTextdrawIsExists(2067) and sampTextdrawGetString(2067):find("SQUAD") then
				config.data.squad.squadid = 2067

				config_save(config.data)
			elseif sampTextdrawIsExists(2051) and sampTextdrawGetString(2051):find("SQUAD") then
				config.data.squad.squadid = 2051

				config_save(config.data)
			end

			if config.data.squad.status and sampIsChatVisible() and not sampIsScoreboardOpen() and not isKeyDown(121) and not isKeyDown(116) then
				renderFontDrawText(var_0_103, config.data.squad.text, config.data.squad.x, config.data.squad.y, 4294967295)

				for iter_114_0, iter_114_1 in ipairs(var_0_101) do
					local var_114_0 = tonumber(var_0_101[iter_114_0][1])
					local var_114_1 = var_0_101[iter_114_0][2]

					if var_114_0 ~= nil then
						local var_114_2 = 0
						local var_114_3, var_114_4 = sampGetCharHandleBySampPlayerId(var_114_0)
						local var_114_5 = ("0xFF%s"):format(("%06X"):format(bit.band(sampGetPlayerColor(var_114_0), 16777215)))
						local var_114_6 = "" .. var_114_1 .. "[" .. var_114_0 .. "]"

						renderFontDrawText(var_0_103, var_114_6, config.data.squad.x, config.data.squad.y + (config.data.squad.size + 6) * iter_114_0, var_114_5)
					end
				end

				renderFontDrawText(var_0_103, config.data.squad.online_text:gsub("!n", #var_0_101), config.data.squad.x, config.data.squad.y + (config.data.squad.size + 6) * (#var_0_101 + 1), 4294967295)
			end
		end
	end
end

function squadFunc2()
	while true do
		wait(0)

		local var_115_0 = sampGetDialogCaption()

		if var_115_0 == "[samp-rp] new squad list by ilyad." then
			local var_115_1, var_115_2, var_115_3, var_115_4 = sampHasDialogRespond(0)

			if var_115_1 then
				sampShowDialog(1, "[samp-rp] new squad list by 1lyad.", "{FFFFFF}DA POJALUYSTA DRUJIWE!) LIKE EBANI NA POST NA BH\nA TO SKACHAL, A LIKE NE POSTAVIL((( KTO TAK DELAET?", "NU OK)", "", 0)
			end
		elseif var_115_0 == "Сфотографировать рабочих" or var_115_0 == "Сфотографировать гос. служащих" then
			local var_115_5, var_115_6, var_115_7, var_115_8 = sampHasDialogRespond(0)

			if var_115_6 == 0 then
				show_dialog(0)
			end
		end

		if config.data.squad.status and not isGamePaused() then
			if squad_pos then
				local var_115_9, var_115_10 = getCursorPos()

				config.data.squad.x, config.data.squad.y = var_115_9, var_115_10

				if isKeyDown(1) then
					showCursor(false, false)

					squad_pos = false

					config_save(config.data)
				elseif isKeyDown(2) then
					showCursor(false, false)

					squad_pos = false
					config.data.squad.x, config.data.squad.y = reserve_x, reserve_y
				end
			end

			if sampTextdrawIsExists(config.data.squad.squadid) then
				local var_115_11, var_115_12 = sampTextdrawGetPos(config.data.squad.squadid)

				if var_115_11 ~= 9999 and var_115_12 ~= 9999 then
					sampTextdrawSetPos(config.data.squad.squadid, 9999, 9999)
				end

				local var_115_13 = sampTextdrawGetString(config.data.squad.squadid)

				updatesquad_members(var_115_13)
			end
		end
	end
end

function sampGetPlayerIdByNickname(arg_116_0)
	local var_116_0, var_116_1 = sampGetPlayerIdByCharHandle(playerPed)

	if tostring(arg_116_0) == sampGetPlayerNickname(var_116_1) then
		return var_116_1
	end

	for iter_116_0 = 0, 1000 do
		if sampIsPlayerConnected(iter_116_0) and sampGetPlayerNickname(iter_116_0) == tostring(arg_116_0) then
			return iter_116_0
		end
	end
end

function join_argb(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	local var_117_0 = arg_117_3
	local var_117_1 = bit.bor(var_117_0, bit.lshift(arg_117_2, 8))
	local var_117_2 = bit.bor(var_117_1, bit.lshift(arg_117_1, 16))

	return (bit.bor(var_117_2, bit.lshift(arg_117_0, 24)))
end

function explode_argb(arg_118_0)
	local var_118_0 = bit.band(bit.rshift(arg_118_0, 24), 255)
	local var_118_1 = bit.band(bit.rshift(arg_118_0, 16), 255)
	local var_118_2 = bit.band(bit.rshift(arg_118_0, 8), 255)
	local var_118_3 = bit.band(arg_118_0, 255)

	return var_118_0, var_118_1, var_118_2, var_118_3
end

function string.split(arg_119_0, arg_119_1, arg_119_2)
	local var_119_0 = {}
	local var_119_1 = 1
	local var_119_2 = arg_119_2 ~= false

	repeat
		local var_119_3, var_119_4 = string.find(arg_119_0, arg_119_1, var_119_1, var_119_2)

		table.insert(var_119_0, string.sub(arg_119_0, var_119_1, var_119_3 and var_119_3 - 1))

		var_119_1 = var_119_4 and var_119_4 + 1
	until not var_119_1

	return var_119_0
end

function updatesquad_members(arg_120_0)
	local var_120_0 = arg_120_0

	var_0_101 = {}

	while arg_120_0:match("(%a+_%a+)") do
		local var_120_1 = arg_120_0:match("(%a+_%a+)")

		arg_120_0 = string.gsub(arg_120_0, var_120_1, "")

		local var_120_2 = sampGetPlayerIdByNickname(var_120_1)

		table.insert(var_0_101, {
			var_120_2,
			var_120_1,
			0,
			0
		})
	end
end

local var_0_110 = var_0_9.new.bool(config.data.remove_fence.status)
local var_0_111 = {}
local var_0_112 = 0
local var_0_113 = {
	3276,
	3374
}

function fenceFunc()
	while true do
		wait(0)

		if config.data.remove_fence.status and sampIsLocalPlayerSpawned() and not isCharDead(PLAYER_PED) and var_0_17 then
			x, y, z = getCharCoordinates(PLAYER_PED)

			if z ~= nil and z > 97 and z < 110 then
				for iter_121_0, iter_121_1 in pairs(getAllObjects()) do
					local var_121_0 = getObjectModel(iter_121_1)

					for iter_121_2, iter_121_3 in pairs(var_0_113) do
						if var_121_0 == iter_121_3 then
							deleteObject(iter_121_1)
						end
					end
				end
			end
		elseif not config.data.remove_fence.status and var_0_112 > 0 then
			-- block empty
		end
	end
end

local var_0_114 = var_0_9.new.bool(config.data.remove_flashlight.status)
local var_0_115 = {
	1226,
	1298,
	3463,
	1290,
	1290,
	1297,
	1294,
	3460
}

function flashlightFunc()
	while true do
		wait(0)

		if config.data.remove_flashlight.status and var_0_17 then
			x, y, z = getCharCoordinates(PLAYER_PED)

			if z ~= nil and z < 900 then
				for iter_122_0, iter_122_1 in pairs(getAllObjects()) do
					local var_122_0 = getObjectModel(iter_122_1)

					for iter_122_2, iter_122_3 in pairs(var_0_115) do
						if var_122_0 == iter_122_3 then
							deleteObject(iter_122_1)
						end
					end
				end
			end
		end
	end
end

struck = {}
struck_flood = 0

function struckFunc()
	while true do
		wait(0)

		if sampIsLocalPlayerSpawned() and config.data.struck.status and struck_flood ~= 0 then
			printStringNow("PRESS 'L' TO STOP", 1)

			if isKeyCanBePressed() and wasKeyPressed(var_0_10.VK_L) then
				struck_flood = 0
			end

			if os.clock() * 1000 - var_0_20 > config.data.struck.wait then
				sampSendChat("/struck")
			end
		end
	end
end

local var_0_116 = var_0_9.new.bool(config.data.struck.status)

local function var_0_117()
	var_0_9.ToggleButtonText("Автоперегон", var_0_116, function()
		config.data.struck.status = not config.data.struck.status

		config_save(config.data)
	end)
	var_0_9.Spacing()

	if var_0_9.Button("+##plus_struck", var_0_9.ImVec2(20, 20)) then
		config.data.struck.wait = config.data.struck.wait + 50

		config_save(config.data)
	end

	var_0_9.SameLine()

	if var_0_9.Button("-##minus_struck", var_0_9.ImVec2(20, 20)) then
		config.data.struck.wait = config.data.struck.wait - 50

		if config.data.struck.wait < 0 then
			config.data.struck.wait = 0
		end

		config_save(config.data)
	end

	var_0_9.SameLine()
	var_0_9.Text("Задержка флудера: " .. config.data.struck.wait)
end

local var_0_118 = var_0_9.new.bool(config.data.gz.status)
local var_0_119 = {}
local var_0_120 = var_0_9.new.int(config.data.narkotimer.hp)
local var_0_121 = var_0_9.new.int(config.data.gz.font.height)
local var_0_122 = var_0_9.new.int(config.data.gz.font.text_size)
local var_0_123 = var_0_9.ColorConvertU32ToFloat4(config.data.gz.font.color.box)

var_0_119.box_color = var_0_9.new.float[4](var_0_123.x, var_0_123.y, var_0_123.z, var_0_123.w)

local var_0_124 = var_0_9.ColorConvertU32ToFloat4(config.data.gz.font.color.text_front)

var_0_119.text_front = var_0_9.new.float[4](var_0_124.x, var_0_124.y, var_0_124.z, var_0_124.w)

local var_0_125 = var_0_9.ColorConvertU32ToFloat4(config.data.gz.font.color.text_back)

var_0_119.text_back = var_0_9.new.float[4](var_0_125.x, var_0_125.y, var_0_125.z, var_0_125.w)
gz = {}
gz.font = renderCreateFont("Segoe UI", config.data.gz.font.text_size, 1)
gz_render = LPH_NO_VIRTUALIZE(function()
	local var_126_0 = config.data.gz.font.x
	local var_126_1 = config.data.gz.font.y
	local var_126_2 = 0
	local var_126_3 = 90

	for iter_126_0 = 1, 10 do
		var_126_2 = var_126_2 + 2
		var_126_3 = var_126_3 + 10

		local var_126_4 = modifyAlpha(config.data.gz.font.color.box, -var_126_3)

		renderDrawBox(var_126_0 - var_126_2, var_126_1, config.data.gz.font.length, config.data.gz.font.height, argb2abgr(var_126_4))
	end

	local var_126_5 = 0
	local var_126_6 = 90

	for iter_126_1 = 1, 10 do
		var_126_5 = var_126_5 + 2
		var_126_6 = var_126_6 + 10

		local var_126_7 = modifyAlpha(config.data.gz.font.color.box, -var_126_6)

		renderDrawBox(var_126_0 + var_126_5, var_126_1, config.data.gz.font.length, config.data.gz.font.height, argb2abgr(var_126_7))
	end

	renderDrawBox(var_126_0, var_126_1, config.data.gz.font.length, config.data.gz.font.height, argb2abgr(config.data.gz.font.color.box))

	if config.data.gz.text_pos == 2 then
		kaban = 1

		if config.data.gz.font.text_size > 15 then
			for iter_126_2 = 1, config.data.gz.font.text_size - 15 do
				kaban = 1 + 0.1 * iter_126_2
			end
		end

		renderFontDrawText(gz.font, "ВЫ В КВАДРАТЕ ", var_126_0 + config.data.gz.font.length / 2 - (kaban == 1 and 64 or kaban > 19 and 70 or 65) * kaban, var_126_1 + config.data.gz.font.height / 2 - 12.5 * kaban, argb2abgr(config.data.gz.font.color.text_back))
		renderFontDrawText(gz.font, "ВЫ В КВАДРАТЕ ", var_126_0 + config.data.gz.font.length / 2 - (kaban == 1 and 64 or kaban > 19 and 70 or 65) * kaban, var_126_1 + config.data.gz.font.height / 2 - 12.5 * kaban, argb2abgr(config.data.gz.font.color.text_front))
	elseif config.data.gz.text_pos == 1 then
		kaban = 1

		if config.data.gz.font.text_size > 15 then
			for iter_126_3 = 1, config.data.gz.font.text_size - 15 do
				kaban = 1 + 0.1 * iter_126_3
			end
		end

		renderFontDrawText(gz.font, "ВЫ В КВАДРАТЕ ", var_126_0, var_126_1 + config.data.gz.font.height / 2 - 12.5 * kaban, argb2abgr(config.data.gz.font.color.text_back))
		renderFontDrawText(gz.font, "ВЫ В КВАДРАТЕ ", var_126_0 + 1, var_126_1 + config.data.gz.font.height / 2 - 12.5 * kaban, argb2abgr(config.data.gz.font.color.text_front))
	elseif config.data.gz.text_pos == 3 then
		kaban = 1

		if config.data.gz.font.text_size > 15 then
			for iter_126_4 = 1, config.data.gz.font.text_size - 15 do
				kaban = 1 + 0.1 * iter_126_4
			end
		end

		renderFontDrawText(gz.font, "ВЫ В КВАДРАТЕ ", var_126_0 + config.data.gz.font.length / 2 - (kaban > 1 and 45 * kaban or 15), var_126_1 + config.data.gz.font.height / 2 - 12.5 * kaban, argb2abgr(config.data.gz.font.color.text_back))
		renderFontDrawText(gz.font, "ВЫ В КВАДРАТЕ ", var_126_0 + config.data.gz.font.length / 2 - (kaban > 1 and 45 * kaban or 15), var_126_1 + config.data.gz.font.height / 2 - 12.5 * kaban, argb2abgr(config.data.gz.font.color.text_front))
	end
end)

function gzFunc()
	while true do
		wait(0)

		if gz.pos then
			gz_render()
			sampSetCursorMode(3)

			curX, curY = getCursorPos()
			config.data.gz.font.x = curX
			config.data.gz.font.y = curY

			if isKeyJustPressed(1) then
				sampSetCursorMode(0)

				gz.pos = false

				config_save(config.data)
			end
		end

		if config.data.gz.fake then
			gz_render()
		end

		if config.data.gz.status and isPlayerInActionGangZone() then
			gz_render()
		end
	end
end

function isPlayerInActionGangZone()
	local var_128_0 = var_0_11.cast("struct stGangzonePool*", sampGetGangzonePoolPtr())
	local var_128_1 = false

	for iter_128_0 = 0, 1023 do
		if var_128_0.iIsListed[iter_128_0] ~= 0 and var_128_0.pGangzone[iter_128_0] ~= nil then
			local var_128_2 = var_128_0.pGangzone[iter_128_0].fPosition

			if var_128_0.pGangzone[iter_128_0].dwColor ~= var_128_0.pGangzone[iter_128_0].dwAltColor then
				local var_128_3, var_128_4, var_128_5 = getCharCoordinates(PLAYER_PED)

				if (var_128_3 >= var_128_2[0] and var_128_3 <= var_128_2[2] or var_128_3 <= var_128_2[0] and var_128_3 >= var_128_2[2]) and (var_128_4 >= var_128_2[1] and var_128_4 <= var_128_2[3] or var_128_4 <= var_128_2[1] and var_128_4 >= var_128_2[3]) then
					var_128_1 = true

					break
				end
			end
		end
	end

	return var_128_1
end

local function var_0_126()
	var_0_9.ToggleButtonText("Отображение квадарта", var_0_118, function()
		config.data.gz.status = not config.data.gz.status

		config_save(config.data)
	end)

	if var_0_9.Button("Тест индикатора " .. (config.data.gz.fake and "[ON]" or "[OFF]") .. "##sbsrp.menu_func", var_0_9.ImVec2(390, 25)) then
		config.data.gz.fake = not config.data.gz.fake

		config_save(config.data)
	end

	if var_0_9.Button("Сменить позицию" .. "##sbsrp.kv", var_0_9.ImVec2(390, 25)) then
		gz.pos = true
	end

	if var_0_9.SliderInt("Длина", var_0_120, 100, 500) then
		config.data.gz.font.length = var_0_120[0]

		config_save(config.data)
	end

	if var_0_9.SliderInt("Ширина", var_0_121, 0, 200) then
		config.data.gz.font.height = var_0_121[0]

		config_save(config.data)
	end

	if var_0_9.SliderInt("Размер текста", var_0_122, 0, 80) then
		config.data.gz.font.text_size = var_0_122[0]

		config_save(config.data)
		renderReleaseFont(gz.font)

		gz.font = renderCreateFont("Segoe UI", config.data.gz.font.text_size, 1)
	end

	textpos = config.data.gz.text_pos == 1 and "К левому краю" or config.data.gz.text_pos == 2 and "По середине" or "К правому краю"

	if var_0_9.Button("Местоположение текста: " .. textpos .. "##sbsp.kv", var_0_9.ImVec2(390, 25)) then
		config.data.gz.text_pos = config.data.gz.text_pos + 1

		if config.data.gz.text_pos >= 4 then
			config.data.gz.text_pos = 1
		end

		config_save(config.data)
	end

	if var_0_9.Button("Сбросить настройки##x", var_0_9.ImVec2(390, 25)) then
		config.data.gz.font.x = gz_pos_x
		config.data.gz.font.y = gz_pos_y
		config.data.gz.font.length = 208
		config.data.gz.font.height = 26
		config.data.gz.font.text_size = 12

		config_save(config.data)
		renderReleaseFont(gz.font)

		gz.font = renderCreateFont("Segoe UI", config.data.gz.font.text_size, 1)
	end

	var_0_9.SetNextItemWidth(20)

	if var_0_9.ColorEdit3("Цвет фона", var_0_119.box_color, var_0_9.ColorEditFlags.NoDragDrop + var_0_9.ColorEditFlags.NoInputs + var_0_9.ColorEditFlags.PickerHueWheel) then
		config.data.gz.font.color.box = var_0_9.ColorConvertFloat4ToU32(var_0_9.ImVec4(var_0_119.box_color[0], var_0_119.box_color[1], var_0_119.box_color[2], var_0_119.box_color[3]))

		config_save(config.data)
	end

	var_0_9.SetNextItemWidth(20)

	if var_0_9.ColorEdit3("Цвет шрифта", var_0_119.text_front, var_0_9.ColorEditFlags.NoDragDrop + var_0_9.ColorEditFlags.NoInputs + var_0_9.ColorEditFlags.PickerHueWheel) then
		config.data.gz.font.color.text_front = var_0_9.ColorConvertFloat4ToU32(var_0_9.ImVec4(var_0_119.text_front[0], var_0_119.text_front[1], var_0_119.text_front[2], var_0_119.text_front[3]))

		config_save(config.data)
	end

	var_0_9.SetNextItemWidth(20)

	if var_0_9.ColorEdit3("Цвет тени шрифта", var_0_119.text_back, var_0_9.ColorEditFlags.NoDragDrop + var_0_9.ColorEditFlags.NoInputs + var_0_9.ColorEditFlags.PickerHueWheel) then
		config.data.gz.font.color.text_back = var_0_9.ColorConvertFloat4ToU32(var_0_9.ImVec4(var_0_119.text_back[0], var_0_119.text_back[1], var_0_119.text_back[2], var_0_119.text_back[3]))

		config_save(config.data)
	end
end

function modifyAlpha(arg_131_0, arg_131_1)
	local var_131_0 = bit.band(bit.rshift(arg_131_0, 24), 255)
	local var_131_1 = bit.band(bit.rshift(arg_131_0, 16), 255)
	local var_131_2 = bit.band(bit.rshift(arg_131_0, 8), 255)
	local var_131_3 = bit.band(arg_131_0, 255)
	local var_131_4 = math.min(255, math.max(0, var_131_0 + arg_131_1))

	return bit.bor(bit.lshift(var_131_4, 24), bit.lshift(var_131_1, 16), bit.lshift(var_131_2, 8), var_131_3)
end

function argb2abgr(arg_132_0)
	return (bit.bor(bit.lshift(bit.band(bit.rshift(arg_132_0, 24), 255), 24), bit.lshift(bit.band(arg_132_0, 255), 16), bit.lshift(bit.band(bit.rshift(arg_132_0, 8), 255), 8), bit.band(bit.rshift(arg_132_0, 16), 255)))
end

local var_0_127 = var_0_9.new.bool(config.data.autofill.status)
local var_0_128 = var_0_9.new.bool(config.data.dlcar.status)
local var_0_129 = var_0_11.cast("int (__thiscall*)(void*, float*, int, bool)", 6177408)

function dlcarFunc()
	dlcar_font = renderCreateFont("Verdana", 10, 5)

	while true do
		wait(0)

		if config.data.dlcar.status then
			if isCharInAnyCar(PLAYER_PED) then
				mycar = getCarCharIsUsing(PLAYER_PED)
			end

			for iter_133_0, iter_133_1 in ipairs(getAllVehicles()) do
				if iter_133_1 ~= mycar and doesVehicleExist(iter_133_1) and isCarOnScreen(iter_133_1) then
					vehName = getGxtText(getNameOfVehicleModel(getCarModel(iter_133_1)))
					myX, myY, myZ = getBodyPartCoordinates(8, PLAYER_PED)
					X, Y, Z = getCarCoordinates(iter_133_1)
					result, point = processLineOfSight(myX, myY, myZ, X, Y, Z, true, false, false, true, false, false, false, false)

					if not result then
						local var_133_0, var_133_1, var_133_2 = getOffsetFromCarInWorldCoords(iter_133_1, 0, 0, 0)
						local var_133_3, var_133_4 = convert3DCoordsToScreen(var_133_0, var_133_1, var_133_2)
						local var_133_5 = getCarHealth(iter_133_1)

						renderFontDrawText(dlcar_font, var_133_5, var_133_3, var_133_4, 4294967295)
					end
				end
			end
		end
	end
end

function getBodyPartCoordinates(arg_134_0, arg_134_1)
	local var_134_0 = getCharPointer(arg_134_1)
	local var_134_1 = var_0_11.new("float[3]")

	var_0_129(var_0_11.cast("void*", var_134_0), var_134_1, arg_134_0, true)

	return var_134_1[0], var_134_1[1], var_134_1[2]
end

local var_0_130 = var_0_12.bool()
local var_0_131 = var_0_9.new.bool(config.data.bikerlist.status)
local var_0_132 = var_0_9.new.char[256](config.data.bikerlist.command)
local var_0_133 = {
	[2853968924] = "Mongols MC",
	[2864035253] = "Outlaws MC",
	[2853113615] = "Highwaymen MC",
	[2852162304] = "Vagos MC",
	[2868880640] = "Bandidos MC",
	[2867754529] = "Warlock MC",
	[2861253888] = "Sons of Silence MC",
	[2863800866] = "Hell's Angels MC",
	[2852126859] = "Pagans MC",
	[2853195403] = "Free Souls MC"
}

local function var_0_134()
	var_0_9.ToggleButtonText("Байкерлист", var_0_131, function()
		config.data.bikerlist.status = not config.data.bikerlist.status

		config_save(config.data)
	end)
	var_0_9.Text("Активация")

	if bikerlist_hotkey:ShowHotKey(var_0_9.ImVec2(390, 20)) then
		config.data.bikerlist.key = bikerlist_hotkey:GetHotKey()

		config_save(config.data)
	end

	var_0_9.PushItemWidth(390)
	var_0_9.InputText("", var_0_132, sizeof(var_0_132))
	var_0_9.PopItemWidth()

	if var_0_9.Button("Сохранить команду", var_0_9.ImVec2(390, 25)) then
		bikerlist_command = config.data.bikerlist.command:gsub("/", "")

		sampUnregisterChatCommand(bikerlist_commandd)

		config.data.bikerlist.command = str(var_0_132)

		config_save(config.data)
		bikerlist_register()
	end
end

function bikerlistFunc()
	while true do
		wait(0)

		if isKeysPressed(config.data.bikerlist.key) and isKeyCanBePressed() and config.data.bikerlist.status then
			var_0_130[0] = not var_0_130[0]
		end
	end
end

function bikerlist_register()
	bikerlist_command = config.data.bikerlist.command:gsub("/", "")

	sampRegisterChatCommand(bikerlist_command, function()
		var_0_130[0] = not var_0_130[0]
	end)
end

var_0_9.OnFrame(function()
	return var_0_130[0]
end, function()
	local function var_141_0(arg_142_0)
		return var_0_9.ImVec4(bit.band(bit.rshift(arg_142_0, 16), 255) / 255, bit.band(bit.rshift(arg_142_0, 8), 255) / 255, bit.band(arg_142_0, 255) / 255, 1)
	end

	local var_141_1, var_141_2 = getScreenResolution()

	var_0_9.SetNextWindowSize(var_0_9.ImVec2(400, 400), 2)
	var_0_9.SetNextWindowPos(var_0_9.ImVec2(var_141_1 / 2, var_141_2 / 2), 8, var_0_9.ImVec2(0.5, 0.5))
	var_0_9.Begin(var_0_4.MOTORCYCLE .. "  EBLAN POSTAVIL LUAJIT GGWP  " .. var_0_4.MOTORCYCLE .. "##plrd", var_0_130, var_0_9.WindowFlags.NoCollapse + var_0_9.WindowFlags.NoScrollbar)
	var_0_9.Columns(2, "Columns", false)
	var_0_9.Text(var_0_14("Organization"))
	var_0_9.NextColumn()
	var_0_9.Text(var_0_14("Nickname"))
	var_0_9.NextColumn()
	var_0_9.Separator()

	local var_141_3 = {}
	local var_141_4 = {}

	for iter_141_0 = 0, sampGetMaxPlayerId() do
		if sampIsPlayerConnected(iter_141_0) then
			local var_141_5 = sampGetPlayerColor(iter_141_0)

			if var_0_133[var_141_5] then
				var_141_3[#var_141_3 + 1] = {
					clist = var_141_5,
					id = iter_141_0
				}
				var_141_4[var_141_5] = (var_141_4[var_141_5] or 0) + 1
			end
		end
	end

	local var_141_6 = {}

	for iter_141_1, iter_141_2 in pairs(var_141_4) do
		table.insert(var_141_6, {
			color = iter_141_1,
			count = iter_141_2
		})
	end

	for iter_141_3, iter_141_4 in ipairs(var_141_6) do
		local var_141_7 = iter_141_4.color
		local var_141_8 = iter_141_4.count

		for iter_141_5, iter_141_6 in ipairs(var_141_3) do
			if iter_141_6.clist == var_141_7 then
				local var_141_9 = sampGetPlayerNickname(iter_141_6.id)

				var_0_9.TextColored(var_141_0(var_141_7), var_0_133[var_141_7])
				var_0_9.NextColumn()
				var_0_9.Text(("%s [%s]"):format(var_141_9, iter_141_6.id))
				var_0_9.NextColumn()
			end
		end

		if var_141_8 > 0 then
			var_0_9.Text("Online: " .. tostring(var_141_8))
			var_0_9.NextColumn()
			var_0_9.Text("")
			var_0_9.NextColumn()
		end
	end

	var_0_9.End()
end)

local var_0_135

capture = {}
capture.status = false
capture.biz = -1
capture.dialog_active = 0

local var_0_136 = var_0_9.new.bool(config.data.capture.status)
local var_0_137 = var_0_9.new.char[256](config.data.capture.cmd)

local function var_0_138()
	var_0_9.ToggleButtonText("Автокапт", var_0_136, function()
		config.data.capture.status = not config.data.capture.status

		config_save(config.data)
	end)
	var_0_9.Spacing()
	var_0_9.Text("Команда вызова меню авто-капта")
	var_0_9.PushItemWidth(390)
	var_0_9.InputText("", var_0_137, sizeof(var_0_137))

	if var_0_9.Button("Сохранить команду", var_0_9.ImVec2(390, 20)) then
		sampUnregisterChatCommand(config.data.capture.cmd)

		config.data.capture.cmd = str(var_0_137)

		config_save(config.data)
		capture_cmd_register()
	end

	var_0_9.PopItemWidth()
	var_0_9.Spacing()
	var_0_9.Spacing()

	if var_0_9.Button("+##plus_capture", var_0_9.ImVec2(20, 20)) then
		config.data.capture.wait = config.data.capture.wait + 50

		config_save(config.data)
	end

	var_0_9.SameLine()

	if var_0_9.Button("-##minus_capture", var_0_9.ImVec2(20, 20)) then
		config.data.capture.wait = config.data.capture.wait - 50

		if config.data.capture.wait < 0 then
			config.data.capture.wait = 0
		end

		config_save(config.data)
	end

	var_0_9.SameLine()
	var_0_9.Text("Задержка флудера капта: " .. config.data.capture.wait)
end

function captureFunc()
	while true do
		wait(0)

		if config.data.capture.status and capture.status then
			if sampIsDialogActive() and sampGetDialogCaption() == "Выберите объект" then
				capture.dialog_active = os.clock() * 1000
			end

			if capture.biz ~= -1 and os.clock() * 1000 - capture.dialog_active > config.data.capture.wait then
				capture.dialog_active = os.clock() * 1000

				sampSendChat("/capture")
			end
		end
	end
end

function capture_cmd_register()
	if sampIsChatCommandDefined(config.data.capture.cmd) then
		sampUnregisterChatCommand(config.data.capture.cmd)
	end

	sampRegisterChatCommand(config.data.capture.cmd, function()
		if not capture.status then
			if config.data.capture.status then
				capture.biz = -1
				capture.status = true

				sampSendChat("/capture")
			end
		else
			capture.status = false

			printStringNow("~R~CAPTURE STOP", 1000)
		end
	end)
end

local var_0_139 = var_0_9.new.bool(config.data.antiafk.status)

function antiafkFunc()
	while true do
		wait(0)

		if config.data.antiafk.status and var_0_17 then
			writeMemory(7634870, 1, 1, 1)
			writeMemory(7635034, 1, 1, 1)
			var_0_8.fill(7623723, 144, 8)
			var_0_8.fill(5499528, 144, 6)
		else
			writeMemory(7634870, 1, 0, 0)
			writeMemory(7635034, 1, 0, 0)
			var_0_8.hex2bin("5051FF1500838500", 7623723, 8)
			var_0_8.hex2bin("0F847B010000", 5499528, 6)
		end
	end
end

local var_0_140 = var_0_9.new.bool(config.data.infinite_run.status)

function infiniterunFunc()
	while true do
		wait(0)

		if config.data.infinite_run.status and var_0_17 then
			setPlayerNeverGetsTired(PLAYER_HANDLE, true)
		else
			setPlayerNeverGetsTired(PLAYER_HANDLE, false)
		end
	end
end

local var_0_141 = var_0_9.new.bool(config.data.fastconnect.status)

function fastconnectFunc()
	while true do
		wait(0)

		if config.data.fastconnect.status then
			writeMemory(sampGetBase() + 2964549, 2, 0, true)
			writeMemory(sampGetBase() + 2964549, 4, 0, 1)
		end
	end
end

local var_0_142 = var_0_9.new.bool(config.data.hpbar.status)

function hpbarFunc()
	while true do
		wait(0)

		if config.data.hpbar.status and var_0_17 then
			var_0_8.setfloat(12030944, 910.4)
		else
			var_0_8.setfloat(12030944, 569)
		end
	end
end

local var_0_143 = var_0_9.new.bool(config.data.gmwheels.status)

function gmwheelsFunc()
	while true do
		wait(0)

		if config.data.gmwheels.status and isCharInAnyCar(PLAYER_PED) and var_0_17 then
			vehicle = storeCarCharIsInNoSave(PLAYER_PED)

			setCanBurstCarTires(vehicle, false)
		end
	end
end

local var_0_144 = var_0_9.new.bool(config.data.antibarrier.status)
local var_0_145 = {
	968,
	966
}

function antibarrierFunc()
	while true do
		wait(0)

		if config.data.antibarrier.status and var_0_17 then
			for iter_153_0, iter_153_1 in pairs(getAllObjects()) do
				local var_153_0 = getObjectModel(iter_153_1)

				for iter_153_2, iter_153_3 in pairs(var_0_145) do
					if var_153_0 == iter_153_3 then
						deleteObject(iter_153_1)
					end
				end
			end
		end
	end
end

local var_0_146 = var_0_9.new.bool(config.data.nofall.status)

function nofallFunc()
	while true do
		wait(0)

		if config.data.nofall.status and (isCharPlayingAnim(PLAYER_PED, "KO_SKID_BACK") or isCharPlayingAnim(playerPed, "FALL_COLLAPSE")) and var_0_17 then
			clearCharTasksImmediately(PLAYER_PED)
		end
	end
end

local var_0_147 = var_0_9.new.bool(config.data.fastspawn.status)

function fastspawnFunc()
	while true do
		wait(0)

		if config.data.fastspawn.status and isCharDead(PLAYER_PED) and var_0_17 then
			var_0_8.fill(4467992, 144, 6)
		end
	end
end

local var_0_148 = var_0_9.new.bool(config.data.schi.status)

function showcrosshairinstantlyFunc()
	while true do
		wait(0)

		if config.data.schi.status and var_0_17 then
			showCrosshairInstantlyPatch(true)
		end
	end
end

function showCrosshairInstantlyPatch(arg_157_0)
	if arg_157_0 then
		if not patch_showCrosshairInstantly then
			patch_showCrosshairInstantly = var_0_8.read(5824985, 1, true)
		end

		var_0_8.write(5824985, 235, 1, true)
	elseif patch_showCrosshairInstantly ~= nil then
		var_0_8.write(5824985, patch_showCrosshairInstantly, 1, true)

		patch_showCrosshairInstantly = nil
	end
end

local var_0_149 = var_0_9.new.bool(config.data.AutoBikeMotoRunSwimOnMaxSpeed.status)

AutoBikeMotoRunSwimOnMaxSpeed_bike = {
	[481] = true,
	[509] = true,
	[510] = true
}
AutoBikeMotoRunSwimOnMaxSpeed_moto = {
	[448] = true,
	[463] = true,
	[462] = true,
	[523] = true,
	[581] = true,
	[586] = true,
	[468] = true,
	[471] = true,
	[522] = true,
	[521] = true,
	[461] = true
}

function AutoBikeMotoRunSwimOnMaxSpeedFunc()
	while true do
		wait(0)

		if config.data.AutoBikeMotoRunSwimOnMaxSpeed.status and var_0_17 then
			if isCharOnAnyBike(playerPed) and isKeyCheckAvailable() and isKeyDown(160) then
				if AutoBikeMotoRunSwimOnMaxSpeed_bike[getCarModel(storeCarCharIsInNoSave(playerPed))] then
					setGameKeyState(16, 255)
					wait(10)
					setGameKeyState(16, 0)
				elseif AutoBikeMotoRunSwimOnMaxSpeed_moto[getCarModel(storeCarCharIsInNoSave(playerPed))] then
					setGameKeyState(1, -128)
					wait(10)
					setGameKeyState(1, 0)
				end
			end

			if isCharOnFoot(playerPed) and isKeyDown(49) and isKeyCheckAvailable() then
				setGameKeyState(16, 256)
				wait(10)
				setGameKeyState(16, 0)
			elseif isCharInWater(playerPed) and isKeyDown(49) and isKeyCheckAvailable() then
				setGameKeyState(16, 256)
				wait(10)
				setGameKeyState(16, 0)
			end
		end
	end
end

function isKeyCheckAvailable()
	if not isSampLoaded() then
		return true
	end

	if not isSampfuncsLoaded() then
		return not sampIsChatInputActive() and not sampIsDialogActive()
	end

	return not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive()
end

local var_0_150 = var_0_9.new.bool(config.data.nobike.status)

function nobikeFunc()
	while true do
		wait(0)

		if (isKeyDown(VK_W) or isKeyDown(VK_SHIFT)) and config.data.nobike.status and isCharInAnyCar(PLAYER_PED) and var_0_17 then
			setCharCanBeKnockedOffBike(PLAYER_PED, true)
		else
			setCharCanBeKnockedOffBike(PLAYER_PED, false)
		end
	end
end

ReplacingWindowWithNickName_status = var_0_9.new.bool(config.data.ReplacingWindowWithNickName.status)

function ReplacingWindowWithNickName()
	if config.data.ReplacingWindowWithNickName.status then
		var_0_11.C.SetWindowTextA(var_0_11.C.GetActiveWindow(), string.format("%s - %s", sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))), sampGetCurrentServerName()))
	else
		var_0_11.C.SetWindowTextA(var_0_11.C.GetActiveWindow(), "GTA:SA:MP")
	end
end

nopara_status = var_0_9.new.bool(config.data.NoPara.status)

function noparaFunc()
	while true do
		wait(0)

		if sampIsLocalPlayerSpawned() and config.data.NoPara.status and hasCharGotWeapon(PLAYER_PED, 46) then
			removeWeaponFromChar(PLAYER_PED, 46)
		end
	end
end

ArrowPassMotoBike_status = var_0_9.new.bool(config.data.ArrowPassMotoBike.status)

function ArrowPassMotoBikeFunc()
	while true do
		wait(0)

		if config.data.ArrowPassMotoBike.status and var_0_17 then
			var_0_8.fill(7043423, 144, 20, true)
		else
			var_0_8.hex2bin("0F84FF0200008B866404000085C00F85F1020000", 7043423, 20)
		end
	end
end

quitinformer_status = var_0_9.new.bool(config.data.quitinformer.status)

local function var_0_151()
	var_0_9.ToggleButtonText("Quit Informer", quitinformer_status, function()
		config.data.quitinformer.status = quitinformer_status[0]

		config_save(config.data)
	end)

	if var_0_9.Button("Показывать /q игроков только из зоны стрима " .. (config.data.quitinformer.only_stream and "[ON]" or "[OFF]") .. "##multi.menu_quitinformer", var_0_9.ImVec2(380, 25)) then
		config.data.quitinformer.only_stream = not config.data.quitinformer.only_stream

		config_save(config.data)
	end
end

local var_0_152 = var_0_9.new.bool(config.data.fastdeagle.status)
local var_0_153 = var_0_9.new.float(config.data.fastdeagle.speed)

local function var_0_154()
	var_0_9.ToggleButtonText("Fast Deagle", var_0_152, function()
		config.data.fastdeagle.status = not config.data.fastdeagle.status

		config_save(config.data)
	end)
	var_0_9.Spacing()

	if var_0_9.SliderFloat("Скорость", var_0_153, 1, 3) then
		config.data.fastdeagle.speed = var_0_153[0]

		config_save(config.data)
	end
end

function fastdeagleFunc()
	while true do
		wait(0)

		if config.data.fastdeagle.status and var_0_17 then
			setCharAnimSpeed(PLAYER_PED, "PYTHON_CROUCHFIRE", config.data.fastdeagle.speed)
			setCharAnimSpeed(PLAYER_PED, "PYTHON_FIRE", config.data.fastdeagle.speed)
			setCharAnimSpeed(PLAYER_PED, "PYTHON_FIRE_POOR", config.data.fastdeagle.speed)
		end
	end
end

local var_0_155 = false
local var_0_156 = 0
local var_0_157 = {
	["VICE-PRESIDENT"] = 3,
	NOMAD = 3,
	COMRADE = 3,
	["FULLPATCH-MEMBER"] = 3,
	PROSPECT = 1,
	MEMBER = 2,
	PRESIDENT = 3
}

function rank_check()
	while true do
		wait(0)

		if var_0_155 then
			repeat
				wait(0)
			until os.clock() * 1000 - var_0_20 > 650

			var_0_20 = os.clock() * 1000

			sampSendChat("/fs РіРѕР№РґР°")
			wait(3500)
		end
	end
end

function sampev.onServerMessage(arg_170_0, arg_170_1)
	if chathelper_Enable and config.data.chat.perenos then
		if string.find(arg_170_1, "(( Сообщение отправлено ))") and arg_170_0 == -1 then
			if isMe then
				sampAddChatMessage("{FF5F5F}> {c2a2da}" .. RpMessage, -1)

				isMe = false
				chathelper_Enable = false

				return false
			elseif isDo then
				sampAddChatMessage("{FF5F5F}> {FF8000}" .. RpMessage, -1)

				isDo = false
				chathelper_Enable = false

				return false
			end
		end

		if string.find(arg_170_1, "%[Удачно%]") and arg_170_0 == -1 and isTry then
			sampAddChatMessage("{FF5F5F}> {c2a2da}" .. RpMessage .. " {00AB06}[Удачно]", -1)

			isTry = false
			chathelper_Enable = false

			return false
		end

		if string.find(arg_170_1, "%[Неудачно%]") and arg_170_0 == -1 and isTry then
			sampAddChatMessage("{FF5F5F}> {c2a2da}" .. RpMessage .. " {C42100}[Неудачно]", -1)

			isTry = false
			chathelper_Enable = false

			return false
		end
	end

	if my_name ~= nil and arg_170_1:find("%[(.+)%] %{......%}(%w+_%w+)%[(%d+)%]: РіРѕР№РґР°") and var_0_155 then
		my_rank, my_nick, my_id = arg_170_1:match("%[(.+)%] %{......%}(%w+_%w+)%[(%d+)%]: РіРѕР№РґР°")

		for iter_170_0, iter_170_1 in pairs(var_0_157) do
			if my_rank == iter_170_0 then
				var_0_156 = iter_170_1

				msg(iter_170_1)
			end
		end

		var_0_155 = false

		return false
	end

	if arg_170_1:find("Этот клуб уже начал войну") or arg_170_1:find("Ваш клуб уже участвует в войне") then
		capture.status = false

		printStringNow("~R~CAPTURE STOP", 1000)
	end

	if arg_170_1:find("Склад закрыт") then
		gg = false
	end

	if arg_170_1:find("Список пуст") and arg_170_0 == -1347440641 and var_0_18 then
		var_0_15 = true

		if not var_0_16 then
			msg("Скрипт успешно загружен.")
			msg("Активация скрипта: /plr")
		end

		sampCloseCurrentDialogWithButton(0)

		var_0_18 = false

		return false
	end

	if arg_170_1:find("Задание уже начато") then
		struck_flood = 0
	end

	if arg_170_1:find("SMS сообщение от Дзайбацу: Есть работа для тебя и твоих ребят. %(%( Введите: /struck %)%)") then
		struck_flood = 1
	end

	if arg_170_0 == 13551615 then
		return {
			arg_170_0,
			arg_170_1
		}
	elseif arg_170_0 == -1613968897 then
		if string.find(arg_170_1, "{9FCCC9} ") then
			local var_170_0 = string.format("%08X", 2680998399):sub(1, 6)

			arg_170_1 = arg_170_1:gsub("{9FCCC9} ", "{" .. var_170_0 .. "} ")
		end

		return {
			2680998399,
			arg_170_1
		}
	elseif arg_170_0 == 94098346 then
		if arg_170_1:find("%[(%d+)%] (%a+_%a+)") then
			local var_170_1 = 0
			local var_170_2 = ""
			local var_170_3 = 0
			local var_170_4 = 0
			local var_170_5 = false

			if not arg_170_1:find("AFK") and not arg_170_1:find("SLEEP") then
				var_170_1, var_170_2 = arg_170_1:match("%[(%d+)%] (%a+_%a+)")
			elseif arg_170_1:find("AFK") and not arg_170_1:find("SLEEP") then
				var_170_1, var_170_2, var_170_4 = arg_170_1:match("%[(%d+)%] (%a+_%a+).+( %d+)")
			elseif not arg_170_1:find("AFK") and arg_170_1:find("SLEEP") then
				var_170_1, var_170_2, var_170_3 = arg_170_1:match("%[(%d+)%] (%a+_%a+).+( %d+)")
			elseif arg_170_1:find("AFK") and arg_170_1:find("SLEEP") then
				var_170_1, var_170_2, var_170_3, var_170_4 = arg_170_1:match("%[(%d+)%] (%a+_%a+).+( %d+)|(%d+)")
			end

			for iter_170_2, iter_170_3 in ipairs(var_0_101) do
				if var_0_101[iter_170_2][2] == var_170_2 then
					table.remove(var_0_101, iter_170_2)
					table.insert(var_0_101, iter_170_2, {
						var_170_1,
						var_170_2,
						var_170_3,
						var_170_4
					})

					var_170_5 = true

					break
				end
			end

			if not var_170_5 then
				table.insert(var_0_101, {
					var_170_1,
					var_170_2,
					var_170_3,
					var_170_4
				})
			end
		end

		if var_0_102 then
			return false
		else
			return true
		end
	end

	if (arg_170_1:find("На складе нет аптечек") or arg_170_1:find("Вы должны быть на своей базе или дома") or arg_170_1:find("В этом месте нет аптечки") or arg_170_1:find("Вы не нуждаетесь в лечении") or arg_170_1:find("Аптечку можно использовать не более 10 раз в час")) and healme.start then
		healme.old = -1
		healme.start = false

		return false
	end

	if arg_170_1:find("%(%( /captstats %- подробная статистика | /crimestats %- статистика за всё время %)%)") and config.data.autoclist_after_capt.status then
		var_0_81 = true
	end

	if arg_170_1:find("кашель") and config.data.autoadr.sbiv and not isCharInAnyCar(PLAYER_PED) then
		lua_thread.create(function()
			wait(100)
			sampSetSpecialAction(7)
			wait(50)
			sampSetSpecialAction(0)
		end)
	end

	if arg_170_1:find("~~~~~~~~ У вас началась ломка ~~~~~~~~") and config.data.autoadr.lomka and config.data.autoadr.status then
		var_0_73 = true
	end

	if arg_170_1:find("У вас перелом левой ноги. Обратитесь к врачу") and config.data.autoadr.perelom and config.data.autoadr.status then
		var_0_73 = true
	end

	if arg_170_1:find("У вас болит рука") and arg_170_1:find("Вам сложно") and config.data.autoadr.perelom and config.data.autoadr.status then
		var_0_73 = true
	end

	if string.match(arg_170_1, "^.+%[.*%]% {FFFFFF%}(.*)%[(.*)%]: .+ | CPOIX(.+)Y(.+)Z(.+)E$") then
		local var_170_6, var_170_7, var_170_8, var_170_9, var_170_10 = string.match(arg_170_1, "^.+%[.*%]% {FFFFFF%}(.+)%[(.*)%]: .+ | CPOIX(.+)Y(.+)Z(.+)E$")
		local var_170_11 = tonumber(var_170_8)
		local var_170_12 = tonumber(var_170_9)
		local var_170_13 = tonumber(var_170_10)

		setMarker(1, var_170_11, var_170_12, var_170_13, 3, 2516011775)
		sampAddChatMessage(string.format("Выставлена метка в квадрат %s. [%s - ID %s]", getKv(var_170_11, var_170_12), var_170_6, var_170_7), 14687003)

		return false
	end

	if arg_170_1:find("Редакция News (.+). (.+): (.+)") and (arg_170_0 == -7587841 and config.data.chat.vip_ad or arg_170_0 == 14221567 and config.data.chat.ad) then
		return false
	end

	if arg_170_1:find("VIP Объявление") and arg_170_0 == -7587841 and config.data.chat.vip_ad then
		return false
	end

	if arg_170_1:find("Объявление: (.+). (.+): (.+). Тел: (%d+)") and arg_170_0 == 14221567 and config.data.chat.ad then
		return false
	end

	if config.data.chat.gov and (arg_170_0 == -1 and arg_170_1:find("-----------=== Государственные Новости ===-----------") or arg_170_0 == 641859327 and arg_170_1:find("Новости:")) then
		return false
	end

	if arg_170_1:find("%[Event%]") and (arg_170_0 == -189267713 or arg_170_0 == -2016478465) and config.data.chat.events then
		return false
	end

	if config.data.chat.ask and (arg_170_0 == -1950935126 or arg_170_0 == 751250602) then
		if arg_170_1:find("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~") then
			return false
		end

		if arg_170_1:find("Задайте ваш вопрос в поддержку сервера %- /ask") then
			return false
		end

		if arg_170_1:find("Играйте вместе с музыкой от официального радио Samp RolePlay %- /music") then
			return false
		end

		if arg_170_1:find("Всю интересующую вас информацию вы можете получить на сайте %- samp%-rp.ru") then
			return false
		end
	end

	if arg_170_1:find("Где взять машину? Купить/арендовать машину можно возле одного из авто") and config.data.chat.ask then
		return false
	end

	if arg_170_1:find("У вас (%d+)/500 материалов с собой") then
		config.data.narkotimer.mats = arg_170_1:match("У вас (%d+)/500 материалов с собой")

		config_save(config.data)
	end

	if arg_170_1:find("Вы получили") then
		arg_170_1 = arg_170_1:gsub("%{......%}", "")

		if arg_170_1:find("Вы получили 'Материалы' %[(%d+)%]") then
			plus_mats = arg_170_1:match("Вы получили 'Материалы' %[(%d+)%]")
			config.data.narkotimer.mats = tonumber(config.data.narkotimer.mats + plus_mats)
		end

		if arg_170_1:find("Вы получили 'Наркотики' %[(%d+)%]") then
			plus_drugs = arg_170_1:match("Вы получили 'Наркотики' %[(%d+)%]")
			config.data.narkotimer.drugs = tonumber(config.data.narkotimer.drugs + plus_drugs)
		end

		config_save(config.data)
	end

	if arg_170_1:find("штук, остаток (%d+) штук") then
		arg_170_1 = arg_170_1:gsub("%{......%}", "")

		if arg_170_1:find("Вы выкинули 'Наркотики' в количестве (%d+) штук, остаток (%d+) штук") then
			config.data.narkotimer.drugs = arg_170_1:match("штук, остаток (%d+) штук")
		end

		if arg_170_1:find("Вы выкинули 'Материалы' в количестве (%d+) штук, остаток (%d+) штук") then
			config.data.narkotimer.mats = arg_170_1:match("штук, остаток (%d+) штук")
		end

		config_save(config.data)
	end

	if arg_170_1:find("Бонусы отключены") and arg_170_0 == -1 and var_0_38 then
		var_0_38 = false
		var_0_40 = true

		return false
	end

	if arg_170_1 == " (( Здоровье не пополняется чаще, чем раз в минуту ))" or arg_170_1 == " (( Здоровье можно пополнить не чаще, чем раз в минуту ))" then
		var_0_35 = true
	end

	if my_name ~= nil and string.find(arg_170_1, my_name) and string.find(arg_170_1, "употребил%(а%) наркотик") then
		if not var_0_35 then
			var_0_34 = os.time()
		else
			var_0_35 = false
		end
	end

	if arg_170_1:find("Действует до: ") and arg_170_0 == -1 and var_0_38 then
		var_0_32 = true
		var_0_33 = 20
		var_0_38 = false

		return false
	end

	if arg_170_1:find("У вас (%d+)/500 материалов с собой") then
		config.data.narkotimer.mats = arg_170_1:match("У вас (%d+)/500 материалов с собой")

		config_save(config.data)
	end

	if string.find(arg_170_1, " %(%( Остаток: (%d+) грамм %)%)") then
		config.data.narkotimer.drugs = string.match(arg_170_1, " %(%( Остаток: (%d+) грамм %)%)")

		config_save(config.data)
	end

	if arg_170_1:find("Вы взяли (%d+) наркотиков") then
		addnarko = arg_170_1:match("Вы взяли (%d+) наркотиков")
		config.data.narkotimer.drugs = tonumber(config.data.narkotimer.drugs + addnarko)

		config_save(config.data)
	end

	if string.find(arg_170_1, " %(%( Здоровье пополнено до: (%d+) %)%)") then
		if not var_0_35 then
			var_0_34 = os.time()
		else
			var_0_35 = false
		end

		config_save(config.data)
	end

	if string.find(arg_170_1, "%(%( Остаток: (%d+) материалов %)%)") then
		config.data.narkotimer.mats = arg_170_1:match("%(%( Остаток: (%d+) материалов %)%)")

		config_save(config.data)
	end

	if arg_170_1:find("Вы купили %d+ грамм наркотиков за %d+ вирт %(У вас есть (%d+) грамм%)") then
		config.data.narkotimer.drugs = arg_170_1:match("Вы купили %d+ грамм наркотиков за %d+ вирт %(У вас есть (%d+) грамм%)")

		config_save(config.data)
	end

	if arg_170_1:find("Вы купили (%d+) грамм наркотиков за %d+ вирт у .+") then
		local var_170_14 = arg_170_1:match("Вы купили (%d+) грамм наркотиков за %d+ вирт у .+")

		config.data.narkotimer.drugs = tonumber(var_170_14) + config.data.narkotimer.drugs

		config_save(config.data)
	end
end

function sampev.onShowDialog(arg_172_0, arg_172_1, arg_172_2, arg_172_3, arg_172_4, arg_172_5)
	var_0_135 = arg_172_2

	if arg_172_2:find("По приглашению от:") then
		sampSendDialogResponse(arg_172_0, 1, 0, "#pale")

		return false
	end

	if arg_172_2:find("Сообщество") and var_0_18 then
		lua_thread.create(function()
			wait(250)
			sampSendDialogResponse(arg_172_0, 1, 0)
		end)

		return false
	end

	if arg_172_2:find("Список моих сообществ") and var_0_18 then
		if arg_172_5:find("NOVA %[ID: 4629%]") or arg_172_5:find("Supreme") or arg_172_5:find("%[ID: 4030%]") or 4 == 4 then
			var_0_15 = true
			var_0_17 = true
		else
			var_0_15 = true
		end

		if not var_0_16 then
			msg("Скрипт успешно загружен.")
			msg("Активация скрипта: /plr")
		end

		var_0_18 = false

		lua_thread.create(function()
			wait(250)
			sampCloseCurrentDialogWithButton(1)
		end)

		return false
	end

	if arg_172_2:find("Выберите объект") and capture.status and capture.biz >= 0 then
		deff_dialog.send = {
			wait = 50,
			button = 1,
			input = "",
			clock = os.clock() * 1000,
			dialogId = arg_172_0,
			listitem = capture.biz
		}

		return false
	end

	if arg_172_0 == 1326 and gg or arg_172_0 == 123 and gg then
		if ggtable.deagle > 0 then
			ggtable.deagle = ggtable.deagle - 1

			sampSendDialogResponse(arg_172_0, 1, 0, -1)

			return false
		end

		if ggtable.shotgun > 0 then
			ggtable.shotgun = ggtable.shotgun - 1

			sampSendDialogResponse(arg_172_0, 1, 1, -1)

			return false
		end

		if ggtable.smg > 0 then
			ggtable.smg = ggtable.smg - 1

			sampSendDialogResponse(arg_172_0, 1, 2, -1)

			return false
		end

		if ggtable.ak47 > 0 then
			ggtable.ak47 = ggtable.ak47 - 1

			sampSendDialogResponse(arg_172_0, 1, 3, -1)

			return false
		end

		if ggtable.m4a1 > 0 then
			ggtable.m4a1 = ggtable.m4a1 - 1

			sampSendDialogResponse(arg_172_0, 1, 4, -1)

			return false
		end

		if ggtable.rifle > 0 then
			ggtable.rifle = ggtable.rifle - 1

			sampSendDialogResponse(arg_172_0, 1, 5, -1)

			return false
		end

		if ggtable.armor ~= nil and ggtable.armor > 0 then
			ggtable.armor = ggtable.armor - 1

			sampSendDialogResponse(arg_172_0, 1, 6, -1)

			return false
		end

		gg = false

		return false
	elseif arg_172_0 == 1513 and gg then
		var_0_19 = true
	end

	if arg_172_2:find("Бонусы") and not arg_172_2:find("Общие") and var_0_38 then
		sampSendDialogResponse(arg_172_0, 1, 0, "")

		return false
	end

	if arg_172_2:find("Общие бонусы") and var_0_32 then
		sampCloseCurrentDialogWithButton(0)

		var_0_32 = false

		return false
	end

	if arg_172_2:find("Бонусы") and var_0_40 then
		sampCloseCurrentDialogWithButton(1)

		return false
	end

	if arg_172_2:find("Информация") or arg_172_2:find("Карманы") then
		local var_172_0 = false
		local var_172_1 = false
		local var_172_2 = split(arg_172_5, "\n")

		for iter_172_0 = 1, #var_172_2 do
			if var_172_2[iter_172_0]:find("Наркотики\t(%d+)") then
				config.data.narkotimer.drugs = var_172_2[iter_172_0]:match("Наркотики\t(%d+)")
				var_172_0 = true
			end

			if var_172_2[iter_172_0]:find("Материалы\t(%d+)") then
				config.data.narkotimer.mats = var_172_2[iter_172_0]:match("Материалы\t(%d+)")
				var_172_1 = true
			end
		end

		if not var_172_0 then
			config.data.narkotimer.drugs = 0
		end

		if not var_172_1 then
			config.data.narkotimer.mats = 0
		end

		config_save(config.data)
	end
end

function split(arg_175_0, arg_175_1, arg_175_2)
	local var_175_0 = {}
	local var_175_1 = 1
	local var_175_2 = arg_175_2 ~= false

	repeat
		local var_175_3, var_175_4 = string.find(arg_175_0, arg_175_1, var_175_1, var_175_2)

		table.insert(var_175_0, string.sub(arg_175_0, var_175_1, var_175_3 and var_175_3 - 1))

		var_175_1 = var_175_4 and var_175_4 + 1
	until not var_175_1

	return var_175_0
end

function sampev.onShowTextDraw(arg_176_0, arg_176_1)
	if arg_176_1.text:find("USE") and arg_176_1.text:find("TPMP") and arg_176_1.text:find("FOR TELEPORT") and config.data.chat.events then
		return false
	end

	if arg_176_1.text:find("SQUAD") then
		config.data.squad.squadid = arg_176_0

		lua_thread.create(function()
			updatesquad_members(arg_176_1.text)
		end)
		config_save(config.data)

		var_0_101 = {}

		return true
	end
end

function sampev.onTextDrawHide(arg_178_0)
	return
end

function sampev.onSendMapMarker(arg_179_0)
	if arg_179_0 ~= nil then
		sendBlipInChat(arg_179_0.x, arg_179_0.y, arg_179_0.z)

		return false
	end
end

function sampev.onSendChat(arg_180_0)
	var_0_20 = os.clock() * 1000

	local var_180_0, var_180_1 = sampGetPlayerIdByCharHandle(playerPed)
	local var_180_2 = sampGetPlayerNickname(var_180_1)

	if #arg_180_0 + #var_180_2 > 100 and config.data.chat.perenos then
		lua_thread.create(function()
			sampSendChat(string.sub(arg_180_0, 0, 97 - #var_180_2) .. "...")
			wait(1200)
			sampSendChat("..." .. string.sub(arg_180_0, 98 - #var_180_2, #arg_180_0))
		end)

		return false
	end
end

function sampev.onSendCommand(arg_182_0)
	local var_182_0, var_182_1 = string.match(arg_182_0, "(/%a+) (.+)")
	local var_182_2, var_182_3 = sampGetPlayerIdByCharHandle(playerPed)
	local var_182_4 = sampGetPlayerNickname(var_182_3)

	if config.data.chat.perenos then
		if var_182_0 == "/me" and #var_182_1 > 95 then
			lua_thread.create(function()
				sampSendChat("/me " .. string.sub(var_182_1, 0, 92) .. "...")
				wait(1200)
				sampSendChat("/me ..." .. string.sub(var_182_1, 93, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/do" and #var_182_1 + #var_182_4 > 97 then
			lua_thread.create(function()
				sampSendChat("/do " .. string.sub(var_182_1, 0, 94 - #var_182_4) .. "...")
				wait(1200)
				sampSendChat("/do ..." .. string.sub(var_182_1, 95 - #var_182_4, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/try" and #var_182_1 > 95 then
			lua_thread.create(function()
				sampSendChat("/me " .. string.sub(var_182_1, 0, 92) .. "...")
				wait(1200)
				sampSendChat("/try ..." .. string.sub(var_182_1, 93, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/todo" then
			local var_182_5, var_182_6 = string.match(var_182_1, "(.+)*(.+)")

			if #var_182_6 > 46 then
				lua_thread.create(function()
					sampSendChat("/todo " .. var_182_5 .. "*" .. string.sub(var_182_6, 0, 43) .. "...")
					wait(1200)
					sampSendChat("/me ..." .. string.sub(var_182_6, 44, #var_182_6))
				end)

				return false
			end
		elseif var_182_0 == "/r" and #var_182_1 > 79 then
			lua_thread.create(function()
				sampSendChat("/r " .. string.sub(var_182_1, 0, 76) .. "...")
				wait(1200)
				sampSendChat("/r ..." .. string.sub(var_182_1, 77, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/f" and #var_182_1 > 79 then
			lua_thread.create(function()
				sampSendChat("/f " .. string.sub(var_182_1, 0, 76) .. "...")
				wait(1200)
				sampSendChat("/f ..." .. string.sub(var_182_1, 77, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/rb" and #var_182_1 > 73 then
			lua_thread.create(function()
				sampSendChat("/rb " .. string.sub(var_182_1, 0, 70) .. "...")
				wait(1200)
				sampSendChat("/rb ..." .. string.sub(var_182_1, 71, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/fb" and #var_182_1 > 73 then
			lua_thread.create(function()
				sampSendChat("/fb " .. string.sub(var_182_1, 0, 70) .. "...")
				wait(1200)
				sampSendChat("/fb ..." .. string.sub(var_182_1, 71, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/b" and #var_182_1 > 95 then
			lua_thread.create(function()
				sampSendChat("/b " .. string.sub(var_182_1, 0, 92) .. "...")
				wait(1200)
				sampSendChat("/b ..." .. string.sub(var_182_1, 93, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/m" and #var_182_1 > 95 then
			lua_thread.create(function()
				sampSendChat("/m " .. string.sub(var_182_1, 0, 92) .. "...")
				wait(1200)
				sampSendChat("/m ..." .. string.sub(var_182_1, 93, #var_182_1))
			end)

			return false
		elseif var_182_0 == "/sms" then
			local var_182_7, var_182_8 = string.match(var_182_1, "(%d+) (.+)")

			if var_182_8 and #var_182_8 > 70 then
				lua_thread.create(function()
					sampSendChat("/sms " .. var_182_7 .. " " .. string.sub(var_182_8, 0, 67) .. "..")
					wait(1200)
					sampSendChat("/sms " .. var_182_7 .. " ..." .. string.sub(var_182_8, 68, #var_182_8))
				end)

				return false
			end
		elseif var_182_0 == "/t" then
			local var_182_9, var_182_10 = string.match(var_182_1, "(%d+) (.+)")

			if var_182_10 and #var_182_10 > 70 then
				lua_thread.create(function()
					sampSendChat("/t " .. var_182_9 .. " " .. string.sub(var_182_10, 0, 67) .. "..")
					wait(1200)
					sampSendChat("/t " .. var_182_9 .. " ..." .. string.sub(var_182_10, 68, #var_182_10))
				end)

				return false
			end
		elseif var_182_0 == "/fs" and #var_182_1 > 79 then
			lua_thread.create(function()
				sampSendChat("/fs " .. string.sub(var_182_1, 0, 76) .. "...")
				wait(1200)
				sampSendChat("/fs ..." .. string.sub(var_182_1, 77, #var_182_1))
			end)

			return false
		end

		if var_182_0 == "/seeme" then
			seeMe(var_182_1)
		elseif var_182_0 == "/seedo" then
			seeDo(var_182_1)
		elseif var_182_0 == "/seetry" then
			seeTry(var_182_1)
		end
	end

	var_0_20 = os.clock() * 1000
	arg_182_0 = arg_182_0:lower()

	for iter_182_0 = 1, #config.data.cmd_shorten do
		local var_182_11 = config.data.cmd_shorten[iter_182_0][1]
		local var_182_12 = config.data.cmd_shorten[iter_182_0][2]
		local var_182_13 = var_182_11:lower()
		local var_182_14 = var_182_12:lower()

		if string.byte(arg_182_0, 1) == 47 then
			arg_182_0 = arg_182_0:sub(2, #arg_182_0)
		end

		if string.byte(var_182_13, 1) == 47 then
			var_182_13 = arg_182_0:sub(2, #var_182_13)
		end

		spl_1 = split(arg_182_0, " ")
		spl_2 = split(var_182_13, " ")
		counter = 0

		for iter_182_1 = 1, #spl_2 do
			if spl_1[iter_182_1] ~= nil and spl_2[iter_182_1] == spl_1[iter_182_1] then
				counter = counter + 1
			end
		end

		if counter ~= 0 and counter == #spl_2 then
			arg_182_0 = "/" .. arg_182_0:gsub(var_182_13, var_182_14)

			local var_182_15 = raknetNewBitStream()

			raknetBitStreamWriteInt32(var_182_15, #arg_182_0)
			raknetBitStreamWriteString(var_182_15, arg_182_0)
			raknetSendRpc(50, var_182_15)
			raknetDeleteBitStream(var_182_15)

			return false
		end
	end
end

function sampev.onSendSpawn()
	var_0_77 = os.time()
	var_0_100 = os.time()
end

function sampev.onPlayerChatBubble(arg_197_0, arg_197_1, arg_197_2, arg_197_3, arg_197_4)
	if ch_flymode == 1 and config.data.camhack.bubble then
		return {
			arg_197_0,
			arg_197_1,
			1488,
			arg_197_3,
			arg_197_4
		}
	end
end

function sampev.onSendAimSync()
	if ch_flymode == 1 and config.data.camhack.antiwarning then
		return false
	end
end

function sampev.onSetInterior(arg_199_0)
	var_0_52 = arg_199_0

	if arg_199_0 ~= 0 then
		if config.data.autohealme.status then
			healme.wait = os.time()
			healme.old = -1
			healme.start = true
		end
	else
		healme.old = -1
		healme.start = false
	end
end

function sampev.onCreate3DText(arg_200_0, arg_200_1, arg_200_2, arg_200_3, arg_200_4, arg_200_5, arg_200_6, arg_200_7)
	if arg_200_7:find("Цена за 200л") and arg_200_3 <= 12 and config.data.autofill.status and var_0_17 then
		lua_thread.create(function()
			sampSendChat("/fill")
			wait(500)
			sampSendChat("/get fuel")
		end)
	end
end

function onWindowMessage(arg_202_0, arg_202_1, arg_202_2)
	if arg_202_0 == 256 or arg_202_0 == 257 then
		if arg_202_1 == var_0_10.VK_ESCAPE and var_0_13[0] then
			consumeWindowMessage(true, false)

			if arg_202_0 == 257 then
				var_0_13[0] = false
			end
		end

		if arg_202_1 == var_0_10.VK_ESCAPE and var_0_130[0] then
			consumeWindowMessage(true, false)

			if arg_202_0 == 257 then
				var_0_130[0] = false
			end
		end
	end
end

function sampev.onSendDialogResponse(arg_203_0, arg_203_1, arg_203_2, arg_203_3)
	if capture.status and var_0_135:find("Выберите объект") then
		if arg_203_1 == 1 then
			capture.biz = arg_203_2
		else
			capture.status = false
		end
	end
end

quit_reasons = {
	[0] = "потеря связи/краш",
	"/q",
	"кикнул сервер/забанил"
}

function sampev.onPlayerQuit(arg_204_0, arg_204_1)
	if config.data.quitinformer.status then
		local var_204_0 = "[Quit Informer] {ffffff}Игрок {FF9C00}" .. sampGetPlayerNickname(arg_204_0) .. "[" .. arg_204_0 .. "] {ffffff}вышел с сервера. {FF9C00}Причина: {ffffff}" .. quit_reasons[arg_204_1]

		if config.data.quitinformer.only_stream then
			if select(1, sampGetCharHandleBySampPlayerId(arg_204_0)) then
				sampAddChatMessage(var_204_0, 16751616)
			end
		else
			sampAddChatMessage(var_204_0, 16751616)
		end
	end
end

local var_0_158 = 1
local var_0_159 = ""
local var_0_160 = {
	perevorot = var_0_66,
	fastdeagle = var_0_154
}
local var_0_161 = ""
local var_0_162 = {
	sbiv = var_0_89,
	grib_heal = var_0_94,
	rkt = var_0_96,
	flip = var_0_98,
	vspiwka = var_0_92
}
local var_0_163 = ""
local var_0_164 = {
	narkotimer = var_0_49,
	perevorot = var_0_66,
	doublejump = var_0_71,
	autoadr = var_0_74,
	iznanka = var_0_63,
	autoclist_after_spawn = var_0_78,
	autoclist_after_capt = var_0_82,
	camhack = var_0_84,
	autohealme = var_0_86,
	squad = var_0_109
}
local var_0_165 = ""
local var_0_166 = {
	getgun = var_0_53,
	capture = var_0_138,
	gz = var_0_126,
	struck = var_0_117,
	bikerlists = var_0_134,
	marker = var_0_57,
	quitinformer = var_0_151
}

var_0_9.OnFrame(function()
	return var_0_13[0]
end, function(arg_206_0)
	local var_206_0 = var_0_9.ImVec2(getScreenResolution())

	var_0_9.SetNextWindowPos(var_0_9.ImVec2(var_206_0.x / 2, var_206_0.y / 2.1), var_0_9.Cond.FirstUseEver, var_0_9.ImVec2(0.5, 0.5))
	var_0_9.SetNextWindowSize(var_0_9.ImVec2(650, 500), var_0_9.Cond.FirstUseEver)
	var_0_9.Begin(var_0_4.MOTORCYCLE .. "  PALERIDERS  " .. var_0_4.MOTORCYCLE, var_0_13, var_0_9.WindowFlags.NoResize + var_0_9.WindowFlags.NoCollapse + var_0_9.WindowFlags.NoScrollbar)
	var_0_9.BeginChild("tabs", var_0_9.ImVec2(200, -1), false)

	if var_0_9.PageButton(var_0_158 == 1, var_0_4.COMMENT, "Настройки чата") then
		var_0_158 = 1
	end

	if var_0_9.PageButton(var_0_158 == 2, var_0_4.SCISSORS, "Сокращения команд") then
		var_0_158 = 2
	end

	if var_0_9.PageButton(var_0_158 == 3, var_0_4.VEST_PATCHES, "Биндер и косуха") then
		var_0_158 = 3
	end

	if var_0_9.PageButton(var_0_158 == 4, var_0_4.HAT_COWBOY, "Скрипты для байкеров") then
		var_0_158 = 4
	end

	if var_0_17 then
		if var_0_9.PageButton(var_0_158 == 5, var_0_4.CROSSHAIRS, "Другие скрипты") then
			var_0_158 = 5
		end

		if var_0_9.PageButton(var_0_158 == 6, var_0_4.EJECT, "Быстрые бинды") then
			var_0_158 = 6
		end

		if var_0_9.PageButton(var_0_158 == 7, var_0_4.TRIANGLE_EXCLAMATION, "Модификации") then
			var_0_158 = 7
		end
	end

	var_0_9.EndChild()
	var_0_9.SameLine()
	var_0_9.BeginChild("workspace", var_0_9.ImVec2(-1, -1), false, var_0_9.WindowFlags.NoScrollbar)

	if var_0_158 == 1 then
		settings_chat()
	elseif var_0_158 == 2 then
		var_0_31()
	elseif var_0_158 == 3 then
		var_0_87()
	elseif var_0_158 == 4 then
		if var_0_165 == "" then
			var_0_9.ToggleButtonTextGear("Быстрое взятие гана", var_0_50, function()
				config.data.getgun_settings.status = not config.data.getgun_settings.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "getgun"
			end)
			var_0_9.ToggleButtonTextGear("Автокапт", var_0_136, function()
				config.data.capture.status = not config.data.capture.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "capture"
			end)
			var_0_9.ToggleButtonTextGear("Байкерлист", var_0_131, function()
				config.data.bikerlist.status = not config.data.bikerlist.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "bikerlists"
			end)
			var_0_9.ToggleButtonTextGear("Автоперегон", var_0_116, function()
				config.data.struck.status = not config.data.struck.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "struck"
			end)
			var_0_9.ToggleButtonTextGear("Quit Informer", quitinformer_status, function()
				config.data.quitinformer.status = not config.data.quitinformer.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "quitinformer"
			end)
			var_0_9.ToggleButtonTextGear("Метка на карте", var_0_54, function()
				config.data.marker.status = not config.data.marker.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "marker"
			end)
			var_0_9.ToggleButtonTextGear("Отображение квадрата", var_0_118, function()
				config.data.gz.status = not config.data.gz.status

				config_save(config.data)
			end, true, function()
				var_0_165 = "gz"
			end)
			var_0_9.ToggleButtonTextGear("Удалять кий при спавне", var_0_99, function()
				config.data.delete_cue.status = not config.data.delete_cue.status

				config_save(config.data)
			end)
		else
			for iter_206_0, iter_206_1 in pairs(var_0_166) do
				if var_0_165 == iter_206_0 then
					if var_0_9.Button("Назад##multi.menu_func", var_0_9.ImVec2(390, 20)) then
						var_0_165 = ""
					end

					iter_206_1()
				end
			end
		end
	elseif var_0_158 == 5 then
		if var_0_163 == "" then
			var_0_9.ToggleButtonTextGear("Наркотаймер", var_0_37, function()
				config.data.narkotimer.status = not config.data.narkotimer.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "narkotimer"
			end)
			var_0_9.ToggleButtonTextGear("Кастомный сквад", var_0_104, function()
				config.data.squad.status = not config.data.squad.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "squad"
			end)
			var_0_9.ToggleButtonTextGear("Танец в стенку", var_0_58, function()
				config.data.iznanka.status = not config.data.iznanka.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "iznanka"
			end)
			var_0_9.ToggleButtonTextGear("DoubleJump", var_0_67, function()
				config.data.doublejump.status = not config.data.doublejump.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "doublejump"
			end)
			var_0_9.ToggleButtonTextGear("Camhack", var_0_83, function()
				config.data.camhack.status = not config.data.camhack.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "camhack"
			end)
			var_0_9.ToggleButtonTextGear("Автоиспользование адреналина", var_0_72, function()
				config.data.autoadr.status = not config.data.autoadr.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "autoadr"
			end)
			var_0_9.ToggleButtonTextGear("Автоиспользование аптечек", var_0_85, function()
				config.data.autohealme.status = not config.data.autohealme.status

				config_save(config.data)
			end)
			var_0_9.ToggleButtonTextGear("Показывать здоровье т/с", var_0_128, function()
				config.data.dlcar.status = not config.data.dlcar.status

				config_save(config.data)
			end)
			var_0_9.ToggleButtonTextGear("Автоклист после спавна", var_0_75, function()
				config.data.autoclist_after_spawn.status = not config.data.autoclist_after_spawn.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "autoclist_after_spawn"
			end)
			var_0_9.ToggleButtonTextGear("Автоклист после капта", var_0_79, function()
				config.data.autoclist_after_capt.status = not config.data.autoclist_after_capt.status

				config_save(config.data)
			end, true, function()
				var_0_163 = "autoclist_after_capt"
			end)
			var_0_9.ToggleButtonTextGear("Автоудаление парашюта", nopara_status, function()
				config.data.NoPara.status = not config.data.NoPara.status

				config_save(config.data)
			end)
			var_0_9.ToggleButtonTextGear("Автозаправка и автопокупка канистры", var_0_127, function()
				config.data.autofill.status = not config.data.autofill.status

				config_save(config.data)
			end)
			var_0_9.ToggleButtonTextGear("ReplacingWindowWithNickName", ReplacingWindowWithNickName_status, function()
				config.data.ReplacingWindowWithNickName.status = not config.data.ReplacingWindowWithNickName.status

				config_save(config.data)
				ReplacingWindowWithNickName()
			end)
			var_0_9.Question("Заменяет имя окна на ник персонажа + сервер")
		else
			for iter_206_2, iter_206_3 in pairs(var_0_164) do
				if var_0_163 == iter_206_2 then
					if var_0_9.Button("Назад##multi.menu_func", var_0_9.ImVec2(390, 20)) then
						var_0_163 = ""
					end

					iter_206_3()
				end
			end
		end
	elseif var_0_158 == 6 then
		if var_0_161 == "" then
			var_0_9.ToggleButtonTextGear("Сбив анимации", var_0_88, function()
				config.data.sbiv.status = not config.data.sbiv.status

				config_save(config.data)
			end, true, function()
				var_0_161 = "sbiv"
			end)
			var_0_9.ToggleButtonTextGear("Вспышка", var_0_90, function()
				config.data.vspiwka.status = not config.data.vspiwka.status

				config_save(config.data)
			end, true, function()
				var_0_161 = "vspiwka"
			end)
			var_0_9.ToggleButtonTextGear("Быстрый хил грибами", var_0_93, function()
				config.data.grib_heal.status = not config.data.grib_heal.status

				config_save(config.data)
			end, true, function()
				var_0_161 = "grib_heal"
			end)
			var_0_9.ToggleButtonTextGear("Быстрый RKT + сбив", var_0_95, function()
				config.data.rkt.status = not config.data.rkt.status

				config_save(config.data)
			end, true, function()
				var_0_161 = "rkt"
			end)
			var_0_9.ToggleButtonTextGear("Быстрый FLIP + сбив", var_0_97, function()
				config.data.flip.status = not config.data.flip.status

				config_save(config.data)
			end, true, function()
				var_0_161 = "flip"
			end)
		else
			for iter_206_4, iter_206_5 in pairs(var_0_162) do
				if var_0_161 == iter_206_4 then
					if var_0_9.Button("Назад##multi.menu_func", var_0_9.ImVec2(390, 20)) then
						var_0_161 = ""
					end

					iter_206_5()
				end
			end
		end
	elseif var_0_158 == 7 then
		if var_0_159 == "" then
			var_0_9.ToggleButtonTextGear("Anti AFK", var_0_139, function()
				config.data.antiafk.status = not config.data.antiafk.status

				config_save(config.data)
			end)
			var_0_9.Question("Работа игры в свёрнутом режиме.")
			var_0_9.ToggleButtonTextGear("Бесконечный бег", var_0_140, function()
				config.data.infinite_run.status = not config.data.infinite_run.status

				config_save(config.data)
			end)
			var_0_9.Question("Игрок не будет уставать от бега.")
			var_0_9.ToggleButtonTextGear("160 HP Bar", var_0_142, function()
				config.data.hpbar.status = not config.data.hpbar.status

				config_save(config.data)
			end)
			var_0_9.Question("Увеличивает хп бар до 160.")
			var_0_9.ToggleButtonTextGear("Fast Connect", var_0_141, function()
				config.data.fastconnect.status = not config.data.fastconnect.status

				config_save(config.data)
			end)
			var_0_9.Question("Позволяет быстро подключаться к серверу.")
			var_0_9.ToggleButtonTextGear("Переворот авто", var_0_64, function()
				config.data.perevorot.status = not config.data.perevorot.status

				config_save(config.data)
			end, true, function()
				var_0_159 = "perevorot"
			end)
			var_0_9.ToggleButtonTextGear("GM Колеса", var_0_143, function()
				config.data.gmwheels.status = not config.data.gmwheels.status

				config_save(config.data)
			end)
			var_0_9.Question("Никто не сможет пробить ваши колеса.")
			var_0_9.ToggleButtonTextGear("Беспалевный NoBike", var_0_150, function()
				config.data.nobike.status = not config.data.nobike.status

				config_save(config.data)
			end)
			var_0_9.Question("Не даёт вам упасть с байка, если у вас зажата клавиша W или SHIFT.")
			var_0_9.ToggleButtonTextGear("Anti Barrier", var_0_144, function()
				config.data.antibarrier.status = not config.data.antibarrier.status

				config_save(config.data)
			end)
			var_0_9.Question("убирает все шлагбаумы.")
			var_0_9.ToggleButtonTextGear("Anti Fall", var_0_146, function()
				config.data.nofall.status = not config.data.nofall.status

				config_save(config.data)
			end)
			var_0_9.Question("анимация падения не будет проигрываться.")
			var_0_9.ToggleButtonTextGear("Fast Deagle", var_0_152, function()
				config.data.fastdeagle.status = not config.data.fastdeagle.status

				config_save(config.data)
			end, true, function()
				var_0_159 = "fastdeagle"
			end)
			var_0_9.Question("Ускоряет стрельбу с Дигла.")
			var_0_9.ToggleButtonTextGear("Fast Spawn", var_0_147, function()
				config.data.fastspawn.status = not config.data.fastspawn.status

				config_save(config.data)
			end)
			var_0_9.Question("Моментальный спавн после смерти.")
			var_0_9.ToggleButtonTextGear("Удалять забор на ID 3", var_0_110, function()
				config.data.remove_fence.status = not config.data.remove_fence.status

				config_save(config.data)
			end)
			var_0_9.ToggleButtonTextGear("Удалять фонари", var_0_114, function()
				config.data.remove_flashlight.status = not config.data.remove_flashlight.status

				config_save(config.data)
			end)
			var_0_9.ToggleButtonTextGear("ShowCrossHairInstantly", var_0_148, function()
				config.data.schi.status = not config.data.schi.status

				config_save(config.data)
				showCrosshairInstantlyPatch(config.data.schi.status)
			end)
			var_0_9.Question("Показывает игровой прицел сразу же после нажатия кнопки прицеливания.")
			var_0_9.ToggleButtonTextGear("AutoBikeMotoRunSwimOnMaxSpeed", var_0_149, function()
				config.data.AutoBikeMotoRunSwimOnMaxSpeed.status = not config.data.AutoBikeMotoRunSwimOnMaxSpeed.status

				config_save(config.data)
			end)
			var_0_9.Question("Скрипт будет нажимать за вас W, когда вы едете на любом виде т/с.\n\nАктивация:\nНа велосипеде: Зажать левый шифт\nНа мотоцикле/скутере/квадроцикле: Зажать левый шифт\nВо время бега: Зажать W + 1\nВо время плавания: Зажать 1")
			var_0_9.ToggleButtonTextGear("Ускорение на мото с пассажиром", ArrowPassMotoBike_status, function()
				config.data.ArrowPassMotoBike.status = not config.data.ArrowPassMotoBike.status

				config_save(config.data)
			end)
		else
			for iter_206_6, iter_206_7 in pairs(var_0_160) do
				if var_0_159 == iter_206_6 then
					if var_0_9.Button("Назад##multi.menu_func", var_0_9.ImVec2(390, 20)) then
						var_0_159 = ""
					end

					iter_206_7()
				end
			end
		end
	end

	var_0_9.EndChild()

	if var_0_158 == 1 then
		var_0_9.SetCursorPos(var_0_9.ImVec2(210, 390))
		var_0_9.LinkText("Cracked by Isus_Christos (clickable)", "https://vk.com/isus_christos_srp")
		var_0_9.SetCursorPos(var_0_9.ImVec2(210, 405))
		var_0_9.Text("Неизвестно для чего нужно писать скрипт\nА после ставить защиту только с Luajit\nНу что сказать, развивайтесь")
	end

	var_0_9.End()
end)

function var_0_9.LinkText(arg_271_0, arg_271_1)
	var_0_9.TextColoredRGB(arg_271_0)

	if var_0_9.IsItemClicked(0) then
		os.execute(("start %s"):format(arg_271_1))
	end
end

var_0_9.OnInitialize(function()
	var_0_9.GetIO().IniFilename = nil

	var_0_9.SwitchContext()
	mimguiStyle()
	var_0_4.Init()
end)

function var_0_9.ToggleButtonText(arg_273_0, arg_273_1, arg_273_2)
	if var_0_9.ToggleButton(arg_273_0, arg_273_1) then
		arg_273_2()
	end

	var_0_9.SameLine()
	var_0_9.SetCursorPosY(var_0_9.GetCursorPosY() + 1)
	var_0_9.TextColoredRGB((not arg_273_1[0] and "{525252}" or "") .. arg_273_0)
end

function var_0_9.TextColoredRGB(arg_274_0)
	local var_274_0 = var_0_9.GetStyle().Colors
	local var_274_1 = var_0_9.ImVec4

	local function var_274_2(arg_275_0)
		local var_275_0 = bit.band(bit.rshift(arg_275_0, 24), 255)
		local var_275_1 = bit.band(bit.rshift(arg_275_0, 16), 255)
		local var_275_2 = bit.band(bit.rshift(arg_275_0, 8), 255)
		local var_275_3 = bit.band(arg_275_0, 255)

		return var_275_0, var_275_1, var_275_2, var_275_3
	end

	local function var_274_3(arg_276_0)
		if arg_276_0:sub(1, 6):upper() == "SSSSSS" then
			local var_276_0 = var_274_0[1].x
			local var_276_1 = var_274_0[1].y
			local var_276_2 = var_274_0[1].z
			local var_276_3 = tonumber(arg_276_0:sub(7, 8), 16) or var_274_0[1].w * 255

			return var_274_1(var_276_0, var_276_1, var_276_2, var_276_3 / 255)
		end

		local var_276_4 = type(arg_276_0) == "string" and tonumber(arg_276_0, 16) or arg_276_0

		if type(var_276_4) ~= "number" then
			return
		end

		local var_276_5, var_276_6, var_276_7, var_276_8 = var_274_2(var_276_4)

		return var_0_9.ImVec4(var_276_5 / 255, var_276_6 / 255, var_276_7 / 255, var_276_8 / 255)
	end

	;(function(arg_277_0)
		for iter_277_0 in arg_277_0:gmatch("[^\r\n]+") do
			local var_277_0 = {}
			local var_277_1 = {}
			local var_277_2 = 1

			iter_277_0 = iter_277_0:gsub("{(......)}", "{%1FF}")

			while iter_277_0:find("{........}") do
				local var_277_3, var_277_4 = iter_277_0:find("{........}")
				local var_277_5 = var_274_3(iter_277_0:sub(var_277_3 + 1, var_277_4 - 1))

				if var_277_5 then
					var_277_0[#var_277_0], var_277_0[#var_277_0 + 1] = iter_277_0:sub(var_277_2, var_277_3 - 1), iter_277_0:sub(var_277_4 + 1, #iter_277_0)
					var_277_1[#var_277_1 + 1] = var_277_5
					var_277_2 = var_277_3
				end

				iter_277_0 = iter_277_0:sub(1, var_277_3 - 1) .. iter_277_0:sub(var_277_4 + 1, #iter_277_0)
			end

			if var_277_0[0] then
				for iter_277_1 = 0, #var_277_0 do
					var_0_9.TextColored(var_277_1[iter_277_1] or var_274_0[1], var_277_0[iter_277_1])
					var_0_9.SameLine(nil, 0)
				end

				var_0_9.NewLine()
			else
				var_0_9.Text(iter_277_0)
			end
		end
	end)(arg_274_0)
end

function var_0_9.Question(arg_278_0)
	if var_0_9.IsItemHovered() then
		var_0_9.BeginTooltip()
		var_0_9.PushTextWrapPos(450)
		var_0_9.TextUnformatted(arg_278_0)
		var_0_9.PopTextWrapPos()
		var_0_9.EndTooltip()
	end
end

function var_0_9.ToggleButtonTextGear(arg_279_0, arg_279_1, arg_279_2, arg_279_3, arg_279_4)
	if var_0_9.ToggleButton(arg_279_0, arg_279_1) then
		arg_279_2()
	end

	if arg_279_3 then
		var_0_9.SameLine()
		var_0_9.SetCursorPosY(var_0_9.GetCursorPosY() + 1)
		var_0_9.Text(var_0_4.GEAR)

		if var_0_9.IsItemClicked() then
			arg_279_4()
		end

		var_0_9.SameLine()
		var_0_9.TextColoredRGB((not arg_279_1[0] and "{525252}" or "") .. arg_279_0)

		if var_0_9.IsItemClicked() then
			arg_279_4()
		end
	else
		var_0_9.SameLine()
		var_0_9.SetCursorPosY(var_0_9.GetCursorPosY() + 1)
		var_0_9.TextColoredRGB("{525252}" .. var_0_4.GEAR)
		var_0_9.SameLine()
		var_0_9.TextColoredRGB((not arg_279_1[0] and "{525252}" or "") .. arg_279_0)
	end
end

local var_0_167 = {}
local var_0_168 = var_0_9.ColorConvertFloat4ToU32

function var_0_9.PageButton(arg_280_0, arg_280_1, arg_280_2, arg_280_3)
	arg_280_3 = arg_280_3 or 190

	local var_280_0 = 0.25
	local var_280_1 = var_0_9.GetWindowDrawList()
	local var_280_2 = var_0_9.GetCursorScreenPos()
	local var_280_3 = var_0_9.GetCursorPos()
	local var_280_4 = var_0_9.GetStyle().Colors[var_0_9.Col.ButtonActive]

	if not var_0_167[arg_280_2] then
		var_0_167[arg_280_2] = {}
	end

	local var_280_5 = var_0_167[arg_280_2]

	var_0_9.PushStyleColor(var_0_9.Col.Button, var_0_9.ImVec4(0, 0, 0, 0))
	var_0_9.PushStyleColor(var_0_9.Col.ButtonHovered, var_0_9.ImVec4(0, 0, 0, 0))
	var_0_9.PushStyleColor(var_0_9.Col.ButtonActive, var_0_9.ImVec4(0, 0, 0, 0))

	local var_280_6 = var_0_9.InvisibleButton(arg_280_2, var_0_9.ImVec2(arg_280_3, 35))

	if var_280_6 and not arg_280_0 then
		var_280_5.clock = os.clock()
	end

	local var_280_7 = var_0_9.IsItemActive()

	var_0_9.PopStyleColor(3)

	if arg_280_0 then
		if var_280_5.clock and var_280_0 > os.clock() - var_280_5.clock then
			local var_280_8 = (os.clock() - var_280_5.clock) * (arg_280_3 / var_280_0)

			var_280_1:AddRectFilled(var_0_9.ImVec2(var_280_2.x, var_280_2.y), var_0_9.ImVec2(var_280_2.x + 190 - var_280_8, var_280_2.y + 35), 285212671, 15, 10)
			var_280_1:AddRectFilled(var_0_9.ImVec2(var_280_2.x, var_280_2.y), var_0_9.ImVec2(var_280_2.x + 3, var_280_2.y + 35), var_0_168(var_280_4))
			var_280_1:AddRectFilled(var_0_9.ImVec2(var_280_2.x, var_280_2.y), var_0_9.ImVec2(var_280_2.x + var_280_8, var_280_2.y + 35), var_0_168(var_0_9.ImVec4(var_280_4.x, var_280_4.y, var_280_4.z, 0.6)), 15, 10)
		else
			var_280_1:AddRectFilled(var_0_9.ImVec2(var_280_2.x, var_280_7 and var_280_2.y + 3 or var_280_2.y), var_0_9.ImVec2(var_280_2.x + 5, var_280_7 and var_280_2.y + 32 or var_280_2.y + 35), var_0_168(var_280_4))
			var_280_1:AddRectFilled(var_0_9.ImVec2(var_280_2.x, var_280_2.y), var_0_9.ImVec2(var_280_2.x + 190, var_280_2.y + 35), var_0_168(var_0_9.ImVec4(var_280_4.x, var_280_4.y, var_280_4.z, 0.6)), 15, 10)
		end
	elseif var_0_9.IsItemHovered() then
		var_280_1:AddRectFilled(var_0_9.ImVec2(var_280_2.x, var_280_2.y), var_0_9.ImVec2(var_280_2.x + 190, var_280_2.y + 35), 285212671, 15, 10)
	end

	var_0_9.SameLine(10)
	var_0_9.SetCursorPosY(var_280_3.y + 8)

	if arg_280_0 then
		var_0_9.Text((" "):rep(3) .. arg_280_1)
		var_0_9.SameLine(45)
		var_0_9.Text(arg_280_2)
	else
		var_0_9.TextColored(var_0_9.ImVec4(0.6, 0.6, 0.6, 1), (" "):rep(3) .. arg_280_1)
		var_0_9.SameLine(45)
		var_0_9.TextColored(var_0_9.ImVec4(0.6, 0.6, 0.6, 1), arg_280_2)
	end

	var_0_9.SetCursorPosY(var_280_3.y + 40)

	return var_280_6
end

function mimguiStyle()
	local var_281_0 = var_0_9.GetStyle()
	local var_281_1 = var_281_0.Colors

	var_281_0.Alpha = 1
	var_281_0.WindowPadding = var_0_9.ImVec2(8, 8)
	var_281_0.WindowRounding = 7
	var_281_0.WindowBorderSize = 1
	var_281_0.WindowMinSize = var_0_9.ImVec2(32, 32)
	var_281_0.WindowTitleAlign = var_0_9.ImVec2(0.5, 0.5)
	var_281_0.ChildRounding = 0
	var_281_0.ChildBorderSize = 1
	var_281_0.PopupRounding = 0
	var_281_0.PopupBorderSize = 1
	var_281_0.FramePadding = var_0_9.ImVec2(4, 3)
	var_281_0.FrameRounding = 0
	var_281_0.FrameBorderSize = 0
	var_281_0.ItemSpacing = var_0_9.ImVec2(8, 4)
	var_281_0.ItemInnerSpacing = var_0_9.ImVec2(4, 4)
	var_281_0.IndentSpacing = 21
	var_281_0.ScrollbarSize = 14
	var_281_0.ScrollbarRounding = 9
	var_281_0.GrabMinSize = 10
	var_281_0.GrabRounding = 0
	var_281_0.TabRounding = 4
	var_281_0.ButtonTextAlign = var_0_9.ImVec2(0.5, 0.5)
	var_281_0.SelectableTextAlign = var_0_9.ImVec2(0, 0)
	var_281_1[var_0_9.Col.Text] = var_0_9.ImVec4(1, 1, 1, 1)
	var_281_1[var_0_9.Col.TextDisabled] = var_0_9.ImVec4(0.5, 0.5, 0.5, 1)
	var_281_1[var_0_9.Col.WindowBg] = var_0_9.ImVec4(0.06, 0.06, 0.06, 0.94)
	var_281_1[var_0_9.Col.ChildBg] = var_0_9.ImVec4(0, 0, 0, 0)
	var_281_1[var_0_9.Col.PopupBg] = var_0_9.ImVec4(0.08, 0.08, 0.08, 0.94)
	var_281_1[var_0_9.Col.Border] = var_0_9.ImVec4(0.43, 0.43, 0.5, 0.5)
	var_281_1[var_0_9.Col.BorderShadow] = var_0_9.ImVec4(0, 0, 0, 0)
	var_281_1[var_0_9.Col.FrameBg] = var_0_9.ImVec4(0.35, 0.37, 0.39, 0.54)
	var_281_1[var_0_9.Col.FrameBgHovered] = var_0_9.ImVec4(0.34, 0.35, 0.35, 0.4)
	var_281_1[var_0_9.Col.FrameBgActive] = var_0_9.ImVec4(0.45, 0.45, 0.45, 0.67)
	var_281_1[var_0_9.Col.TitleBg] = var_0_9.ImVec4(0.06, 0.06, 0.06, 0.94)
	var_281_1[var_0_9.Col.TitleBgActive] = var_0_9.ImVec4(0.06, 0.06, 0.06, 0.94)
	var_281_1[var_0_9.Col.TitleBgCollapsed] = var_0_9.ImVec4(0.06, 0.06, 0.06, 0.94)
	var_281_1[var_0_9.Col.MenuBarBg] = var_0_9.ImVec4(0.14, 0.14, 0.14, 1)
	var_281_1[var_0_9.Col.ScrollbarBg] = var_0_9.ImVec4(0.02, 0.02, 0.02, 0.53)
	var_281_1[var_0_9.Col.ScrollbarGrab] = var_0_9.ImVec4(0.31, 0.31, 0.31, 1)
	var_281_1[var_0_9.Col.ScrollbarGrabHovered] = var_0_9.ImVec4(0.41, 0.41, 0.41, 1)
	var_281_1[var_0_9.Col.ScrollbarGrabActive] = var_0_9.ImVec4(0.51, 0.51, 0.51, 1)
	var_281_1[var_0_9.Col.CheckMark] = var_0_9.ImVec4(1, 1, 1, 1)
	var_281_1[var_0_9.Col.SliderGrab] = var_0_9.ImVec4(1, 1, 1, 1)
	var_281_1[var_0_9.Col.SliderGrabActive] = var_0_9.ImVec4(1, 1, 1, 1)
	var_281_1[var_0_9.Col.Button] = var_0_9.ImVec4(0.53, 0.53, 0.53, 0.4)
	var_281_1[var_0_9.Col.ButtonHovered] = var_0_9.ImVec4(0.19, 0.19, 0.19, 1)
	var_281_1[var_0_9.Col.ButtonActive] = var_0_9.ImVec4(0.41, 0.41, 0.41, 1)
	var_281_1[var_0_9.Col.Header] = var_0_9.ImVec4(0.56, 0.56, 0.56, 0.31)
	var_281_1[var_0_9.Col.HeaderHovered] = var_0_9.ImVec4(0.39, 0.39, 0.39, 0.8)
	var_281_1[var_0_9.Col.HeaderActive] = var_0_9.ImVec4(0.43, 0.43, 0.43, 1)
	var_281_1[var_0_9.Col.Separator] = var_0_9.ImVec4(0.43, 0.43, 0.5, 0.5)
	var_281_1[var_0_9.Col.SeparatorHovered] = var_0_9.ImVec4(0.48, 0.48, 0.48, 0.78)
	var_281_1[var_0_9.Col.SeparatorActive] = var_0_9.ImVec4(0.26, 0.26, 0.26, 1)
	var_281_1[var_0_9.Col.ResizeGrip] = var_0_9.ImVec4(0.4, 0.4, 0.4, 0.25)
	var_281_1[var_0_9.Col.ResizeGripHovered] = var_0_9.ImVec4(0.51, 0.51, 0.51, 0.67)
	var_281_1[var_0_9.Col.ResizeGripActive] = var_0_9.ImVec4(0.5, 0.5, 0.5, 0.95)
	var_281_1[var_0_9.Col.Tab] = var_0_9.ImVec4(0.36, 0.36, 0.36, 0.86)
	var_281_1[var_0_9.Col.TabHovered] = var_0_9.ImVec4(0.45, 0.45, 0.45, 0.8)
	var_281_1[var_0_9.Col.TabActive] = var_0_9.ImVec4(0.51, 0.51, 0.51, 1)
	var_281_1[var_0_9.Col.TabUnfocused] = var_0_9.ImVec4(0.07, 0.1, 0.15, 0.97)
	var_281_1[var_0_9.Col.TabUnfocusedActive] = var_0_9.ImVec4(0.14, 0.26, 0.42, 1)
	var_281_1[var_0_9.Col.PlotLines] = var_0_9.ImVec4(0.61, 0.61, 0.61, 1)
	var_281_1[var_0_9.Col.PlotLinesHovered] = var_0_9.ImVec4(1, 0.43, 0.35, 1)
	var_281_1[var_0_9.Col.PlotHistogram] = var_0_9.ImVec4(0.9, 0.7, 0, 1)
	var_281_1[var_0_9.Col.PlotHistogramHovered] = var_0_9.ImVec4(1, 0.6, 0, 1)
	var_281_1[var_0_9.Col.TextSelectedBg] = var_0_9.ImVec4(0.26, 0.59, 0.98, 0.35)
	var_281_1[var_0_9.Col.DragDropTarget] = var_0_9.ImVec4(1, 1, 0, 0.9)
	var_281_1[var_0_9.Col.NavHighlight] = var_0_9.ImVec4(0.26, 0.59, 0.98, 1)
	var_281_1[var_0_9.Col.NavWindowingHighlight] = var_0_9.ImVec4(1, 1, 1, 0.7)
	var_281_1[var_0_9.Col.NavWindowingDimBg] = var_0_9.ImVec4(0.8, 0.8, 0.8, 0.2)
	var_281_1[var_0_9.Col.ModalWindowDimBg] = var_0_9.ImVec4(0.8, 0.8, 0.8, 0.35)
end

function isKeyCanBePressed()
	if sampIsDialogActive() or sampIsChatInputActive() or isSampfuncsConsoleActive() then
		return false
	end

	return true
end

function msg(arg_283_0)
	return sampAddChatMessage(string.format("{505050}[Paleriders MultiTool | Crack by Christos]{ffffff} %s", arg_283_0), -1)
end

function isKeysPressed(arg_284_0)
	if arg_284_0 ~= nil then
		if #arg_284_0 == 0 then
			return
		end

		local var_284_0 = 0

		for iter_284_0 = 1, #arg_284_0 do
			if iter_284_0 == #arg_284_0 then
				if wasKeyPressed(arg_284_0[iter_284_0]) then
					var_284_0 = var_284_0 + 1
				end
			elseif isKeyDown(arg_284_0[iter_284_0]) then
				var_284_0 = var_284_0 + 1
			end
		end

		if var_284_0 == #arg_284_0 then
			return true
		end
	end
end

function wasReleased(arg_285_0)
	if arg_285_0 ~= nil then
		if #arg_285_0 == 0 then
			return
		end

		local var_285_0 = 0

		for iter_285_0 = 1, #arg_285_0 do
			if iter_285_0 == #arg_285_0 then
				if wasKeyReleased(arg_285_0[iter_285_0]) then
					var_285_0 = var_285_0 + 1
				end
			elseif wasKeyReleased(arg_285_0[iter_285_0]) then
				var_285_0 = var_285_0 + 1
			end
		end

		if var_285_0 == #arg_285_0 then
			return true
		end
	end
end

function isKeysDown(arg_286_0)
	local var_286_0 = 0

	for iter_286_0 = 1, #arg_286_0 do
		if iter_286_0 == #arg_286_0 then
			if isKeyDown(arg_286_0[iter_286_0]) then
				var_286_0 = var_286_0 + 1
			end
		elseif isKeyDown(arg_286_0[iter_286_0]) then
			var_286_0 = var_286_0 + 1
		end
	end

	if var_286_0 == #arg_286_0 then
		return true
	end
end

function var_0_9.TextQuestion(arg_287_0, arg_287_1)
	var_0_9.TextDisabled(arg_287_0)

	if var_0_9.IsItemHovered() then
		var_0_9.BeginTooltip()
		var_0_9.PushTextWrapPos(600)
		var_0_9.TextUnformatted(arg_287_1)
		var_0_9.PopTextWrapPos()
		var_0_9.EndTooltip()
	end
end

_utf8 = load("return function(utf8_func, in_encoding, out_encoding); if encoding == nil then; encoding = require(\"encoding\"); encoding.default = \"CP1251\"; u8 = encoding.UTF8; end; if type(utf8_func) ~= \"table\" then; return false; end; if AnsiToUtf8 == nil or Utf8ToAnsi == nil then; AnsiToUtf8 = function(text); return u8(text); end; Utf8ToAnsi = function(text); return u8:decode(text); end; end; if _UTF8_FUNCTION_SAVE == nil then; _UTF8_FUNCTION_SAVE = {}; end; local change_var = \"_G\"; for s = 1, #utf8_func do; change_var = string.format('%s[\"%s\"]', change_var, utf8_func[s]); end; if _UTF8_FUNCTION_SAVE[change_var] == nil then; _UTF8_FUNCTION = function(...); local pack = table.pack(...); readTable = function(t, enc); for k, v in next, t do; if type(v) == 'table' then; readTable(v, enc); else; if enc ~= nil and (enc == \"AnsiToUtf8\" or enc == \"Utf8ToAnsi\") then; if type(k) == \"string\" then; k = _G[enc](k); end; if type(v) == \"string\" then; t[k] = _G[enc](v); end; end; end; end; return t; end; return table.unpack(readTable({_UTF8_FUNCTION_SAVE[change_var](table.unpack(readTable(pack, in_encoding)))}, out_encoding)); end; local text = string.format(\"_UTF8_FUNCTION_SAVE['%s'] = %s; %s = _UTF8_FUNCTION;\", change_var, change_var, change_var); load(text)(); _UTF8_FUNCTION = nil; end; return true; end")

function utf8(...)
	pcall(_utf8(), ...)
end

utf8({
	"print"
}, "Utf8ToAnsi")
utf8({
	"sampSetCurrentDialogEditboxText"
}, "Utf8ToAnsi")
utf8({
	"sampShowDialog"
}, "Utf8ToAnsi")
utf8({
	"sampSendChat"
}, "Utf8ToAnsi")
utf8({
	"sampAddChatMessage"
}, "Utf8ToAnsi")
utf8({
	"renderFontDrawText"
}, "Utf8ToAnsi")
utf8({
	"sampHasDialogRespond"
}, nil, "AnsiToUtf8")
utf8({
	"sampev",
	"onShowDialog"
}, "AnsiToUtf8", "Utf8ToAnsi")
utf8({
	"sampev",
	"onServerMessage"
}, "AnsiToUtf8", "Utf8ToAnsi")
utf8({
	"sampev",
	"onCreate3DText"
}, "AnsiToUtf8", "Utf8ToAnsi")
utf8({
	"sampev",
	"onSendCommand"
}, "AnsiToUtf8", "Utf8ToAnsi")
utf8({
	"sampev",
	"onSendChat"
}, "AnsiToUtf8", "Utf8ToAnsi")
