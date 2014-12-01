require("scripts.auto.auto_public_quick_charge")

f_quick_charge_popup = class("f_quick_charge_popup")
f_quick_charge_popup.__index = f_quick_charge_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_quick_charge_popup.static_create()
							 
	local infoTable = createpublic_quick_charge()
	local info = infoTable["public_quick_charge"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_quick_charge_popup)

	info.m_componentTable = infoTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_quick_charge_popup:panelInitBeforePopup()
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_quick_charge_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_quick_charge_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_quick_charge_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] onEnter
-------------------------------------------------------------------------------
function f_quick_charge_popup:onEnter()
	self:setStopTouchEvent(true)
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] onExit
-------------------------------------------------------------------------------
function f_quick_charge_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE, self.event_updateFirstChargeResult)
end

------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] setTipString
-------------------------------------------------------------------------------
function f_quick_charge_popup:setTipString(str)
	self.m_componentTable["pqc_tips"]:setString(str)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_quick_charge_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_quick_charge_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] onCleanup
-------------------------------------------------------------------------------
function f_quick_charge_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_quick_charge_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_quick_charge_popup:initAllComponent()
    local charge = function()
    	g_game.g_panelManager:removeUiPanel("quick_charge_ui")
    	require("scripts.game.main.shangcheng.f_shangcheng_chongzhi_panel")
    	local shangcheng_chongzhi = f_shangcheng_chongzhi_panel.static_create()
	    shangcheng_chongzhi:panelInitBeforePopup()
	    g_game.g_panelManager:showUiPanel(shangcheng_chongzhi,"shangcheng_chongzhi")
	    send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["pqc_chongzhi"]:addHandleOfcomponentEvent(charge, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	local close = function()
		g_game.g_panelManager:removeUiPanel("quick_charge_ui")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["pqc_guanbi"]:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end


