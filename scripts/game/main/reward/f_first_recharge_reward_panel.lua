--[[--
首充奖励界面
--]]--

require("scripts.auto.auto_first_recharge_reward")
require("scripts.game.main.reward.f_first_recharge_reward_item")

f_first_recharge_reward_panel = class("f_first_recharge_reward_panel")
f_first_recharge_reward_panel.__index = f_first_recharge_reward_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel.static_create()
	local mainPanelTable = createfirst_recharge_reward()
	local mainPanel = mainPanelTable["first_recharge_reward"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_first_recharge_reward_panel)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_first_recharge_reward_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] onEnter
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:onEnter()
	self:initAllComponent()
	g_game.g_gameManager:addUpdateObj(self)
	self:refreshRewardPanel()
	g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_chongzhi] = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] onExit
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:onExit()
	g_game.g_gameManager:removeUpdateObj(self)
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_CHARGE_REWARD_PANEL, self.event_refresh_charge_reward_panel)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] onCleanup
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:initAllComponent()
	local cpTable = self.m_componentTable
	cpTable["fr_turnover_lbl"]:setString("")
	cpTable["fr_countdown_lbl"]:setString("")
	
	self.m_countdownTime = 0
	self.m_activeLeftTime = 0
	
	self.m_rewardItemTable = {}
	self.m_itemClickIndex = 0
	
	-- 充值按钮
	local chongBtnClick = function()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	    
	    local chongzhiPanel = g_game.g_panelManager:getUiPanel("shangcheng_chongzhi")
	    if chongzhiPanel == nil then
			chongzhiPanel = f_shangcheng_chongzhi_panel.static_create()
		    chongzhiPanel:panelInitBeforePopup()
		    g_game.g_panelManager:showUiPanel(chongzhiPanel, "shangcheng_chongzhi")
	    end
	end
	self.m_componentTable["fr_chong_btn"]:addHandleOfcomponentEvent(chongBtnClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--刷新限时充值有礼界面
	self.event_refresh_charge_reward_panel = function()
		self:refreshRewardPanel()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_CHARGE_REWARD_PANEL, self.event_refresh_charge_reward_panel)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] update
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:update(dt)
	if self.m_activeLeftTime > 0 and self.m_countdownTime >= 1 then
		self.m_countdownTime = self.m_countdownTime - 1
		
		-- 活动倒计时
		self.m_activeLeftTime = self.m_activeLeftTime - 1
		self:setCountDownLabel(self.m_activeLeftTime)
		if self.m_activeLeftTime == 0 then
			g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_chongzhi] = false
			if LANGUAGE_TYPE == 3 then
				self.m_componentTable["fr_countdown_lbl"]:setString("活動倒計時：活動已結束")			
			else
				self.m_componentTable["fr_countdown_lbl"]:setString("活动倒计时：活动已结束")
			end
		end
	end
	self.m_countdownTime = self.m_countdownTime + dt
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] refreshRewardPanel
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:refreshRewardPanel()
	local cpTable = self.m_componentTable
	
	for _,ItemPanel in pairs(self.m_rewardItemTable) do
		self:deleteComponent(ItemPanel)
	end
	self.m_rewardItemTable = {}
	
	-- 当前奖励活动信息
	local currentActivInfo = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_chongzhi)
	local activeTypeDay = currentActivInfo["day"]

	-- 奖励信息
	
	local chargeRewardInfo = g_game.g_dictConfigManager:getPeroidChargeReward()
	local rewardDetail = chargeRewardInfo["list"][activeTypeDay]
	
	local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	local rewardMask = bitCal:d2b(currentActivInfo["rewardMask"])
	local acceptRewardMask = bitCal:d2b(currentActivInfo["acceptRewardMask"])
		
	if rewardDetail ~= nil then
		for i=1,rewardDetail["num"] do
			local itemState = 0
			local rewardItemPanel = f_first_recharge_reward_item.static_create()
			table.insert(self.m_rewardItemTable, rewardItemPanel)
			self:appendComponent(rewardItemPanel)
			rewardItemPanel:setAnchorPoint(cc.p(0.5,0.0))
			rewardItemPanel:setPositionInContainer(cc.p(194.0+(i-1)*203.0, 495.0))
			rewardItemPanel:setArrowImageVisible(i<4)
			rewardItemPanel:setButtonState(8)
			
			local funcall = function(para)
				self.m_itemClickIndex = para
			end
			rewardItemPanel:setEcceptBtnHandler(funcall, currentActivInfo["peroidId"], i)
			if rewardMask[i]==1 and acceptRewardMask[i]==0 then
				rewardItemPanel:setButtonState(2)
				rewardItemPanel:setAnim(true)
			else
				rewardItemPanel:setButtonState(8)
				rewardItemPanel:setAnim(false)
				if rewardMask[i] == 1 then
					itemState = 2 --不能领取
				else
					itemState = 1 --已领取
				end
			end
			rewardItemPanel:setData(rewardDetail["list"][i], itemState)
		end
	end

	self.m_activeLeftTime = g_game.g_recoverManager:getHuodongCountDownTime(g_game.g_huodong_chongzhi)
	self:setCountDownLabel(self.m_activeLeftTime)
	
--	if rewardInfo ~= nil then
--		-- 活动期间累计充值
--		local touroverStrFormat = "[250,255,165]活动期间已累计充值[139,255,240]%d[250,255,165]元"
--		local touroverStr = string.format(touroverStrFormat, rewardInfo["money"])
--		local call = function()
--		end
--		cpTable["fr_turnover_lbl"]:setComplexString(g_game.g_utilManager:getEncodeString(touroverStr, cc.c3b(250,255,165)), call)
--		
--		-- 活动已领取奖励掩码
		
--		
--		-- 奖励信息
--		for i=1, #self.m_rewardItemTable do
--			local rewardItemPanel = self.m_rewardItemTable[i]
--			local funcall = function(para)
--				self.m_itemClickIndex = para
--			end
--			rewardItemPanel:setEcceptBtnHandler(funcall, rewardInfo["peroidId"], i)
			
			
--			rewardItemPanel:setData(rewardDetail["list"][i])
--		end
--	else
		-- 活动期间累计充值
		local touroverStrFormat = ""
		if LANGUAGE_TYPE == 3 then
			touroverStrFormat = "[250,255,165]活動期間已累計充值[139,255,240]%d[250,255,165]元"
		else
			touroverStrFormat = "[250,255,165]活动期间已累计充值[139,255,240]%d[250,255,165]元"
		end
		local touroverStr = string.format(touroverStrFormat, currentActivInfo["money"])
		local call = function()
		end
		cpTable["fr_turnover_lbl"]:setComplexString(g_game.g_utilManager:getEncodeString(touroverStr, cc.c3b(250,255,165)), call)
--	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] setAcceptBtnState
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:setAcceptBtnState()
	if self.m_itemClickIndex > 0 then
		local itemPanel = self.m_rewardItemTable[self.m_itemClickIndex]
		itemPanel:claimReward()
		local data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_chongzhi)
		local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
		local t = bitCal:d2b(data["acceptRewardMask"])
		t[self.m_itemClickIndex] = 1
		data["acceptRewardMask"] = bitCal:b2d(t)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_panel] setCountDownLabel
-------------------------------------------------------------------------------
function f_first_recharge_reward_panel:setCountDownLabel(leftTime)
	local countdownStrFormat =""
	if LANGUAGE_TYPE == 3 then
		countdownStrFormat = "[250,255,165]活動倒計時：[139,255,240]%d[250,255,165]天[139,255,240]%d[250,255,165]小時[139,255,240]%d[250,255,165]分[139,255,240]%d[250,255,165]秒"               
	else
		countdownStrFormat = "[250,255,165]活动倒计时：[139,255,240]%d[250,255,165]天[139,255,240]%d[250,255,165]小时[139,255,240]%d[250,255,165]分[139,255,240]%d[250,255,165]秒"               
	end
 	local countdownStr = string.format(countdownStrFormat, math.floor(leftTime/(24*3600)),  math.floor(leftTime%(24*3600)/3600), math.floor(leftTime%3600/60), leftTime%60)
	local call = function()
	end
	self.m_componentTable["fr_countdown_lbl"]:setComplexString(g_game.g_utilManager:getEncodeString(countdownStr, cc.c3b(250,255,165)), call)
end
