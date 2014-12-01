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
