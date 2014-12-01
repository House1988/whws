require("scripts.auto.auto_challenge_num_reset_pop")
--[[--
精英副本
--]]--
f_stage_reset_num_popup = class("f_stage_reset_num_popup")
f_stage_reset_num_popup.__index = f_stage_reset_num_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_reset_num_popup.static_create()
							 
	local eliteCardTable = createchallenge_num_reset_pop()
	local info = eliteCardTable["challenge_num_reset_pop"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_stage_reset_num_popup)

	info.m_componentTable = eliteCardTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:panelInitBeforePopup()
	self.m_smallStageId = 0
	self:registerNodeEvent()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_reset_num_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] onEnter
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:onEnter()
	local buyCondition = g_game.g_userInfoManager:getChallengeNumCondition()

	self.m_componentTable["use_gold"]:setString(buyCondition["needgold"])
	self.m_componentTable["remain_count"]:setString(buyCondition["purchaseTimes"].."次")

	self.m_componentTable["cnrp_bottom"]:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self.m_componentTable["cnrp_bottom"]:runAction(cc.EaseBounceOut:create(actionTo))
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] onExit
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_PVE_NUM_RESULT, self.event_updateBuyNumResult)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] onCleanup
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:initAllComponent()
	self.m_componentTable["close_chongzhi"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("stage_buy_challenge")
	end
	self.m_componentTable["close_chongzhi"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
   
	local resetNum = function()
		self:requestResetChallengeNum()
	end
	self.m_componentTable["chongzhi_btn"]:addHandleOfcomponentEvent(resetNum, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self.event_updateBuyNumResult  = function()
		self:updateUserChallengeNum()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_PVE_NUM_RESULT, self.event_updateBuyNumResult)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] requestResetChallengeNum
-- 请求重置当前次数
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:requestResetChallengeNum()
	local buyCondition = g_game.g_userInfoManager:getChallengeNumCondition()
	
	if  buyCondition["canPurchase"] == 2 then
	--快速充值
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
	else
		g_game.g_userInfoManager:requestResetPveChallengeNum(self.m_smallStageId)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] updateUserChallengeNum
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:updateUserChallengeNum()
	g_game.g_panelManager:removeUiPanel("stage_buy_challenge")
	
	local result = g_game.g_userInfoManager:getChallengeNumResult()
	g_game.g_userInfoManager:updateUserGold(result["gold"])
	
	g_game.g_utilManager:showMsg("重置成功！")
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reset_num_popup] requestResetChallengeNum
-------------------------------------------------------------------------------
function f_stage_reset_num_popup:setSmallStageId(smallStageId)
	self.m_smallStageId = smallStageId
end

