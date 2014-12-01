require("scripts.auto.auto_public_settings")
--[[--
  兑换码弹出
--]]--
f_game_settings = class("f_game_settings")
f_game_settings.__index = f_game_settings

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_settings.static_create()
							 
	local skillInfoTable = createpublic_settings()
	local skillInfo = skillInfoTable["public_settings"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_game_settings)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_settings:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_musicFlag = 0
	self.m_effectFlag = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_settings:registerNodeEvent(handler)
	if not handler then
		handler = function(event)
			if event == "enter" then
				self:onEnter()
			elseif event == "exit" then
				self:onExit()
			elseif event == "enterTransitionFinish" then
				self:onEnterTransitionFinish()
			elseif event == "exitTransitionStart" then
				self:onExitTransitionStart()
			elseif event == "cleanup" then
				self:onCleanup()
			end
		end
	end
	self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_settings:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onEnter
-------------------------------------------------------------------------------
function f_game_settings:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onExit
-------------------------------------------------------------------------------
function f_game_settings:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_settings:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_settings:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onCleanup
-------------------------------------------------------------------------------
function f_game_settings:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_settings:initAllComponent()
	local m,e = g_game.g_dataManager:getUserSetting()
	self.m_musicFlag = m
	self.m_effectFlag = e
	self:setSettingFlag()
	
	local yesBtn = function()
		g_game.g_panelManager:removeUiPanel("public_setting")
		g_game.g_dataManager:saveUserSetting(self.m_musicFlag,self.m_effectFlag)
		self:setSound()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["yes_btn"]:addHandleOfcomponentEvent(yesBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local canlBtn = function()
    	g_game.g_panelManager:removeUiPanel("public_setting")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["no_btn"]:addHandleOfcomponentEvent(canlBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
 
 	local musicBtn = function()
 		if self.m_musicFlag == 1 then self.m_musicFlag = 0 else  self.m_musicFlag = 1 end
 		self:setSettingFlag()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["panel1"]:addHandleOfcomponentEvent(musicBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local effectBtn = function()
    	if self.m_effectFlag == 1 then self.m_effectFlag = 0 else  self.m_effectFlag = 1 end
    	self:setSettingFlag()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["panel2"]:addHandleOfcomponentEvent(effectBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
 
end

function f_game_settings:setSound()
	g_game.g_utilManager:setUserSettings()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] setSettingFlag
-------------------------------------------------------------------------------
function f_game_settings:setSettingFlag()
	if self.m_musicFlag == 1 then
		self.m_componentTable["btn_music"]:setImage("batch_ui/setting_on.png")
	else
		self.m_componentTable["btn_music"]:setImage("batch_ui/setting_off.png")
	end
	
	if self.m_effectFlag == 1 then
		self.m_componentTable["btn_effect"]:setImage("batch_ui/setting_on.png")
	else
		self.m_componentTable["btn_effect"]:setImage("batch_ui/setting_off.png")
	end
end


