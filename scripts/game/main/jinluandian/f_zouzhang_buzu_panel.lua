require("scripts.auto.auto_zouzang_buzu_pop")
--[[--
奏章不足
--]]--

f_zouzhang_buzu_panel = class("f_zouzhang_buzu_panel")
f_zouzhang_buzu_panel.__index = f_zouzhang_buzu_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel.static_create()
	local mainPanelTable = createzouzang_buzu_pop()
	local mainPanel = mainPanelTable["zouzang_buzu_pop"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_zouzhang_buzu_panel)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_zouzhang_buzu_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] onEnter
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] onExit
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] onCleanup
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_buzu_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_zouzhang_buzu_panel:initAllComponent()
	self:setStopTouchEvent(true)
	local cpTable = self.m_componentTable
	
	cpTable["chongzhi"]:setVisible(false)
	
	-- 确定按钮
	local confirmBtnEvent = function()
		local reportsInfo = g_game.g_userInfoManager:getReportsInfo()
		local cost = 30*(1+reportsInfo["addReportsNum"])
		local userInfo = g_game.g_userInfoManager:getUserInfo()
	
		if cost > userInfo["gold"] then
			require("scripts.game.main.common.f_quick_charge_popup")
			local quickCharge = f_quick_charge_popup.static_create()
		    quickCharge:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
			g_game.g_panelManager:removeUiPanel("zouzhang_buzu_pop")
		else
			local sendMsg = {["roleId"] = userInfo["roleId"]}
			g_game.g_netManager:send_message(g_network_message_type.CS_ADD_REPORTS, sendMsg)
			g_game.g_panelManager:removeUiPanel("zouzhang_buzu_pop")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	cpTable["zb_confirm_btn"]:addHandleOfcomponentEvent(confirmBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local chongzhi = function()
		require("scripts.game.main.shangcheng.f_shangcheng_chongzhi_panel")
    	local shangcheng_chongzhi = f_shangcheng_chongzhi_panel.static_create()
	    shangcheng_chongzhi:panelInitBeforePopup()
	    g_game.g_panelManager:showUiPanel(shangcheng_chongzhi,"shangcheng_chongzhi")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	cpTable["chongzhi"]:addHandleOfcomponentEvent(chongzhi,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 关闭按钮
	local closeBtnEvent = function()
		g_game.g_panelManager:removeUiPanel("zouzhang_buzu_pop")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	cpTable["zb_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	cpTable["zb_close_btn"]:addHandleOfcomponentEvent(closeBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	cpTable["zb_cancel_btn"]:addHandleOfcomponentEvent(closeBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 购买的价格
	local reportsInfo = g_game.g_userInfoManager:getReportsInfo()
	local cost = 30*(1+reportsInfo["addReportsNum"])
	
	if LANGUAGE_TYPE == 3 then
		cpTable["zb_content1"]:setString(string.format("啟稟皇上，加急奏章需要%d",cost))
	else
		cpTable["zb_content1"]:setString(string.format("启禀皇上，加急奏章需要%d",cost))
	end
	
	-- 还可购买的次数
	local addReportsNum = g_game.g_userInfoManager:getAddReportsNum()
	if addReportsNum > 0 then
		local tipsStr = ""
		if LANGUAGE_TYPE == 3 then
			tipsStr	 = string.format("今日還可獲取%d次加急奏章", addReportsNum)
		else	
			tipsStr	 = string.format("今日还可获取%d次加急奏章。", addReportsNum)
		end	
		
		cpTable["zb_content3"]:setString(tipsStr)
		cpTable["zb_content3"]:setColor(cc.c3b(0,0,0))
		cpTable["zb_confirm_btn"]:setButtonState(2)
	else
		if LANGUAGE_TYPE == 3 then
			cpTable["zb_content3"]:setString("今日獲取加急奏章次數不足")
		else
			cpTable["zb_content3"]:setString("今日获取加急奏章次数不足")
		end
		cpTable["zb_content3"]:setColor(cc.c3b(255,0,0))
		cpTable["zb_confirm_btn"]:setVisible(false)
--		cpTable["zb_confirm_btn"]:setButtonState(8)
		cpTable["chongzhi"]:setVisible(true)
	end
end

