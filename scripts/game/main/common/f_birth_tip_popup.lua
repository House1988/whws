require("scripts.auto.auto_birth_tip_popup")

f_birth_tip_popup = class("f_birth_tip_popup")
f_birth_tip_popup.__index = f_birth_tip_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] static_create
-------------------------------------------------------------------------------
function f_birth_tip_popup.static_create()
	local infoTable = createbirth_tip_popup()
	local panel = infoTable["birth_tip_popup"]
	
	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_birth_tip_popup)
	panel.m_componentTable = infoTable
	panel:initAllComponent()
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_birth_tip_popup:registerNodeEvent(handler)
    if not handler then
        handler = function(event)
                      if event == "enter" then
                          self:onEnter()
                      elseif event == "exit" then
                          self:onExit()
                      elseif event == "enterTransitionFinish" then
--                          self:onEnterTransitionFinish()
                      elseif event == "exitTransitionStart" then
--                          self:onExitTransitionStart()
                      elseif event == "cleanup" then
--                          self:onCleanup()
                      end
                  end
    end
    self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_birth_tip_popup:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] onEnter
-------------------------------------------------------------------------------
function f_birth_tip_popup:onEnter()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_POPUP)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] onExit
-------------------------------------------------------------------------------
function f_birth_tip_popup:onExit()
    self:unregisterNodeEvent()
	g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_birth_tip_popup:initAllComponent()
    self:registerNodeEvent()
    
	self.m_time = 0
	self.STATE_COUNTING = 0
	self.STATE_ENDING = 1
	self.STATE_NONE = 3
	
	if self.m_targetSec == 0 then
		self.m_state = self.STATE_ENDING
	else
		self.m_state = self.STATE_COUNTING
	end
	
	local cpTable = self.m_componentTable
	
	-- 剩余时间
	local result = g_game.g_userInfoManager:getPregnantTimeResult()
	self.m_targetSec = math.floor(result["remainTime"])
 	local exportTime = g_game.g_utilManager:getExportTime(self.m_targetSec)
 	cpTable["btp_time_label"]:setString(exportTime)
 	
	-- 花费元宝
	cpTable["btp_price_label"]:setString("50")
 	
	-- 关闭按钮
    local closeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("birth_tip_popup")
	end
	cpTable["btp_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	cpTable["btp_close_btn"]:addHandleOfcomponentEvent(closeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 取消按钮
    local leftBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("birth_tip_popup")
	end	
	cpTable["btp_left_btn"]:addHandleOfcomponentEvent(leftBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 催生按钮
	self.m_beautyId = nil
    local rightBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_beautyId ~= nil then
			local userInfo = g_game.g_userInfoManager:getUserInfo()
			if userInfo["gold"] < 50 then
				g_game.g_utilManager:showMsg("催生需花费50元宝，您元宝不足！")
			else
				local sendMsg = {}
				sendMsg["roleId"] = userInfo["roleId"]
				sendMsg["beautyId"] = self.m_beautyId
				g_game.g_netManager:send_message(g_network_message_type.CS_ACCEL_CONCEIVE, sendMsg)
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
			end
		end
		g_game.g_panelManager:removeUiPanel("birth_tip_popup")
	end
	cpTable["btp_right_btn"]:addHandleOfcomponentEvent(rightBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 确定按钮
	self.m_confirmHandler = nil
    local confirmBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("birth_tip_popup")
		if self.m_confirmHandler ~= nil then
			self.m_confirmHandler()
		end
	end
	cpTable["btp_confirm_btn"]:addHandleOfcomponentEvent(confirmBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	cpTable["btp_confirm_btn"]:setVisible(false)
	cpTable["btp_bling_panel"]:setVisible(false)
	
	--注册更新的 update time
	g_game.g_gameManager:addUpdateObj(self)
	
	-- 弹出动作
	self:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self:runAction(cc.EaseBounceOut:create(actionTo))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] update
-- 更新update
-------------------------------------------------------------------------------
function f_birth_tip_popup:update(dt)
 	self.m_time = self.m_time + dt
 	
	if self.m_state == self.STATE_COUNTING then
	 	if self.m_time >= 1 then
	 		self.m_time = 0
	 		
	 		self.m_targetSec = self.m_targetSec -1
	 		self.m_targetSec = math.floor(self.m_targetSec)
		 	local exportTime = g_game.g_utilManager:getExportTime(self.m_targetSec)
		 	self.m_componentTable["btp_time_label"]:setString(exportTime)
		 	
		 	if self.m_targetSec <= 0 then
		 		self.m_targetSec = 0
		 		self.m_state = self.STATE_ENDING
		 		
		 		-- 调整显示界面
		 		self.m_componentTable["btp_content"]:setPositionInContainer(cc.p(285,115))
		 		self.m_componentTable["btp_time_label"]:setPositionInContainer(cc.p(284.5,181))
		 		self.m_componentTable["btp_confirm_btn"]:setVisible(true)
		 		self.m_componentTable["btp_bling_panel"]:setVisible(true)
		 		self.m_componentTable["btp_buy_panel"]:setVisible(false)
		 		
		 		local exportTime = g_game.g_utilManager:getExportTime(self.m_targetSec)
		 	 	self.m_componentTable["btp_time_label"]:setString(exportTime)
		 	end
	 	end
 	elseif self.m_state == self.STATE_ENDING then
 		local blink = CCBlink:create(0.5,5)
 		local repeatAction = CCRepeatForever:create(blink)
 		self.m_componentTable["btp_bling_panel"]:runAction(repeatAction)
 		
 		self.m_state = self.STATE_NONE
 	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] setConfirmCallBack
-------------------------------------------------------------------------------
function f_birth_tip_popup:setConfirmCallBack(handler)
	self.m_confirmHandler = handler
end

-------------------------------------------------------------------------------
-- @function [parent=#f_birth_tip_popup] setBeautyId
-------------------------------------------------------------------------------
function f_birth_tip_popup:setBeautyId(beautyId)
	self.m_beautyId = beautyId
end


