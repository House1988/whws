--[[--
	台湾版本登录方式选择面板
--]]--
require("scripts.auto.auto_login_choose_type")

f_tw_login_choose_type_panel = class("f_tw_login_choose_type_panel")
f_tw_login_choose_type_panel.__index = f_tw_login_choose_type_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_tw_login_choose_type_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_tw_login_choose_type_panel.static_create()
	local mainTable = createlogin_choose_type()
	local mainPanel = mainTable["login_choose_type"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_tw_login_choose_type_panel)
	
	mainPanel.m_componentTable = mainTable
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tw_login_choose_type_panel] initAllComponent
-- 初始化所有面板中的组件
------------------------------------------------------------------------------
function f_tw_login_choose_type_panel:initAllComponent()
	
	-- 点击面板的响应
	local facebookBtnOnClick = function()
		g_game.g_panelManager:removeUiPanel("login_choose_type")
	end
	self:setStopTouchEvent(true)
	self:addHandleOfcomponentEvent(facebookBtnOnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- facebook按钮
	local facebookBtnOnClick = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_FACEBOOK)
		g_game.g_panelManager:removeUiPanel("login_choose_type")
	end
	self.m_componentTable["lct_facebook_btn"]:addHandleOfcomponentEvent(facebookBtnOnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- google按钮
	local googleBtnOnClick = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_GOOGLE)
		g_game.g_panelManager:removeUiPanel("login_choose_type")
	end
	self.m_componentTable["lct_google_btn"]:addHandleOfcomponentEvent(googleBtnOnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-- 显示快速登录按钮
function f_tw_login_choose_type_panel:showFastLoginBtn(  )
	--快速登录模拟
	local fastLoginCallback = function (  )
		local tip = "您将以遊客身份登入遊戲，在綁定帳號之前，刪除應用程式或變更裝置時，資料可能無法保留。为保障您的帳號安全，请尽快綁定facebook/gmail帳號。是否確定以遊客身份登入？"
	 	g_game.g_utilManager:showAlertLayer(tip,function (  )
	 		self:fastLoginAlter()
	 	end)
	end
	self.m_componentTable["jld_nh_fastlogin_button"]:setVisible(true)
	self.m_componentTable["jld_nh_fastlogin_button"]:addHandleOfcomponentEvent(fastLoginCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end
-- 快速登录发送消息
function f_tw_login_choose_type_panel:fastLoginAlter(  )
	local udid = g_game.g_system:getUUID()	
	local loginResult = 
	{
		["result"] = 0, 
		["account"] = DEBUG_SDK_TYPE.."_"..udid, 
		["error_des"] = "",	
		["userid"] = DEBUG_SDK_TYPE.."_"..udid,
		["isFastLogin"] = true
	}
	send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	g_game.g_panelManager:removeUiPanel("login_choose_type")
end