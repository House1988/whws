require("scripts.auto.auto_less_silver_tip_popup")
require("scripts.game.main.jinluandian.f_jinluandian_main")
require("scripts.game.main.bingfa.f_xunfang_panel")

f_less_silver_tip_popup = class("f_less_silver_tip_popup")
f_less_silver_tip_popup.__index = f_less_silver_tip_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_less_silver_tip_popup] static_create
-------------------------------------------------------------------------------
function f_less_silver_tip_popup.static_create()
	local infoTable = createless_silver_tip_popup()
	local panel = infoTable["less_silver_tip_popup"]
	
	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_less_silver_tip_popup)
	panel.m_componentTable = infoTable
	panel:initAllComponent()
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_less_silver_tip_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_less_silver_tip_popup:initAllComponent()
	
	self.m_leftHandler = nil
	self.m_rightHandler = nil
	
	local cpTable = self.m_componentTable
	
	-- 关闭按钮
    local closeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("less_silver_tip_popup")
	end
	cpTable["lsp_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	cpTable["lsp_close_btn"]:addHandleOfcomponentEvent(closeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 征税按钮
    local leftBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("less_silver_tip_popup")
		
		local jinluandian = f_jinluandian_main.static_create()
		jinluandian:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(jinluandian,"jinluandian_bg")
	end	
	cpTable["lsp_left_btn"]:addHandleOfcomponentEvent(leftBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 寻访按钮
--    local rightBtnCallback = function()
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--		g_game.g_panelManager:removeUiPanel("less_silver_tip_popup")
--		
--		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(6)
--		if getOpenLv > g_game.g_userInfoManager:getUserLv() then
--			g_game.g_utilManager:showMsg(getOpenLv ..  "级开启。带上藏宝图，发掘天下宝藏！")
--		else
--			local panel = f_xunfang_panel.static_create()
--			panel:panelInitBeforePopup()
--			g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
--		end
--	end	
--	cpTable["lsp_right_btn"]:addHandleOfcomponentEvent(rightBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 弹出动作
	self:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self:runAction(cc.EaseBounceOut:create(actionTo))
end


