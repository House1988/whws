require("scripts.auto.auto_jump_tip_popup1")

f_shangci_tip_popup = class("f_shangci_tip_popup")
f_shangci_tip_popup.__index = f_shangci_tip_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_shangci_tip_popup] static_create
-------------------------------------------------------------------------------
function f_shangci_tip_popup.static_create()
	local infoTable = createjump_tip_popup1()
	local panel = infoTable["jump_tip_popup1"]
	
	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_shangci_tip_popup)
	panel.m_componentTable = infoTable
	panel:initAllComponent()
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangci_tip_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangci_tip_popup:initAllComponent()
	
	self.m_leftHandler = nil
	self.m_rightHandler = nil
	
	local cpTable = self.m_componentTable
	
	-- 关闭按钮
    local closeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("jump_tip_popup")
	end
	cpTable["jtp_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	cpTable["jtp_close_btn"]:addHandleOfcomponentEvent(closeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangci_tip_popup] setBtnHandler
-------------------------------------------------------------------------------
function f_shangci_tip_popup:setBtnHandler(leftHandler, rightHandler)
	self.m_leftHandler = leftHandler
	self.m_rightHandler = rightHandler
end

