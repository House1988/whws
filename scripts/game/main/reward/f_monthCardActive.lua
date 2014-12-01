--[[--
	月卡活动
--]]--

require("scripts.auto.auto_monthCardActive")
require("scripts.game.main.reward.f_monthCardItem")
require("scripts.game.main.reward.f_monthCardGift")

f_monthCardActive = class("f_monthCardActive")
f_monthCardActive.__index = f_monthCardActive

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_monthCardActive.static_create()
	local mainPanelTable = createmonthCardActive()
	local mainPanel = mainPanelTable["monthCardActive"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_monthCardActive)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] registerNodeEvent
-------------------------------------------------------------------------------
function f_monthCardActive:registerNodeEvent(handler)
    if not handler then
        handler = function(event)
            if event == "enter" then
                self:onEnter()
            elseif event == "exit" then
                self:onExit()
            end
        end
    end
    self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_monthCardActive:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] onEnter
-------------------------------------------------------------------------------
function f_monthCardActive:onEnter()
	self:initAllComponent()
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] onExit
-------------------------------------------------------------------------------
function f_monthCardActive:onExit()
    self:unregisterNodeEvent()
	g_game.g_gameManager:removeUpdateObj(self)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, self.event_buy_month_card_result)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_monthCardActive:initAllComponent()
	local cpTable = self.m_componentTable
	
	self.monthCardRewardInfo = g_game.g_userInfoManager:getMonthCardReward()
	
	self.monthCardPrice = g_game.g_f_month_card_info["info"]["price"] -- 月卡价格
	cpTable["mca_card_price"]:setString(tostring(self.monthCardPrice))
	cpTable["mca_card_price"]:setScale(0.6)
	
	if DEBUG_SDK_TYPE == 14 then
		local p = cpTable["mca_card_price"]:getPositionInContainer()
		cpTable["mca_card_price"]:setPositionInContainer(cc.p(p.x+8,p.y));
		local p2 = cpTable["mca_yuan"]:getPositionInContainer()
		cpTable["mca_yuan"]:setPositionInContainer(cc.p(p2.x+8,p2.y))
		cpTable["tile_li"]:setPositionInContainer(cc.p(494.5,186))
	end

	cpTable["mca_rule_lbl1"]:setAlignment(0)
	cpTable["mca_rule_lbl2"]:setAlignment(0)
	cpTable["mca_rule_lbl3"]:setAlignment(0)
	
	local str1 = g_game.g_dictConfigManager:getLanTextById(179)
	local str2 = g_game.g_dictConfigManager:getLanTextById(180)
	cpTable["mca_rule_lbl1"]:setString(str1)
	cpTable["mca_rule_lbl2"]:setString(str2)
	cpTable["mca_rule_lbl3"]:setString("")
	
	
	cpTable["mca_itemList"]:enableScroll(false)
	cpTable["mca_itemList"]:setListInfo(4, 0, 24, 124, 138)
	
	-- 详情按钮
	local detailBtnEvent = function()
		local monthCardGiftPanel = g_game.g_panelManager:getUiPanel("monthCard_gift")
		if monthCardGiftPanel ~= nil then
			g_game.g_panelManager:removeUiPanel("monthCard_gift")
		end
		monthCardGiftPanel = f_monthCardGift.static_create()
		g_game.g_panelManager:showUiPanel(monthCardGiftPanel,"monthCard_gift")
	end
	cpTable["detailBtn"]:addHandleOfcomponentEvent(detailBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 购买/领取按钮
	if self.monthCardRewardInfo["hasMonthCard"] == 1 then
		cpTable["buyBtn_gou"]:setImage("batch_ui/ling_uizi.png")
		cpTable["buyBtn_mai"]:setImage("batch_ui/qu_uizi.png")
	else
		cpTable["buyBtn_gou"]:setImage("batch_ui/gou_uizi.png")
		cpTable["buyBtn_mai"]:setImage("batch_ui/mai_uizi.png")
	end
	
	local buyBtnEvent = function()
		if self.monthCardRewardInfo["hasMonthCard"] == 1 then
			local monthCardGiftPanel = g_game.g_panelManager:getUiPanel("monthCard_gift")
			if monthCardGiftPanel ~= nil then
				g_game.g_panelManager:removeUiPanel("monthCard_gift")
			end
			monthCardGiftPanel = f_monthCardGift.static_create()
			g_game.g_panelManager:showUiPanel(monthCardGiftPanel,"monthCard_gift")
		else
			--进入购买流程，需要loading显示阻挡用户进行其他操作
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
			
			send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM, g_game.g_f_month_card_info)
		end
	end
	cpTable["buyBtn"]:addHandleOfcomponentEvent(buyBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 显示月卡奖励物品
	local rewardItems = {{4,0,"3140"},{1,40,""},{1,46,""},{1,20,""}}
	for i=1,4 do
		local monthcarditem = f_monthCardItem.static_create()
		cpTable["mca_itemList"]:appendComponent(monthcarditem)
		local imagePath, qulity, name = g_game.g_dictConfigManager:getResByType(rewardItems[i][1], rewardItems[i][2])
		monthcarditem:setCount("")
		monthcarditem:setName(rewardItems[i][3] .. name)
		monthcarditem:setImage(imagePath)
		monthcarditem:setQulityBg(g_game.g_f_quality_image[qulity])
	end
	
	self.buyCdTime = self.monthCardRewardInfo["cdTime"] -- 据下次购买的剩余时间
	if self.buyCdTime > 0 then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["mca_limit_lbl"]:setString(math.ceil(self.buyCdTime/86400) .. "天后可再次購買")
		else
			self.m_componentTable["mca_limit_lbl"]:setString(math.ceil(self.buyCdTime/86400) .. "天后可再次购买")
		end
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["mca_limit_lbl"]:setString("每月限購一次")
		else
			self.m_componentTable["mca_limit_lbl"]:setString("每月限购一次")
		end
		
	end
	self.countdownTime = 0
	
	-- 购买结果的回调
	self.event_buy_month_card_result = function(buyResult)
		self:buyMonthCardDoneCallback(buyResult)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, self.event_buy_month_card_result)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] update
-------------------------------------------------------------------------------
function f_monthCardActive:update(dt)
	if self.buyCdTime > 0 then
		if self.countdownTime >= 1 then
			self.buyCdTime = self.buyCdTime - 1
			
			if LANGUAGE_TYPE == 3 then
				self.m_componentTable["mca_limit_lbl"]:setString(math.ceil(self.buyCdTime/86400) .. "天后可再次購買")
			else
				self.m_componentTable["mca_limit_lbl"]:setString(math.ceil(self.buyCdTime/86400) .. "天后可再次购买")
			end
			
			
			self.countdownTime = self.countdownTime - 60
		end
		self.countdownTime = self.countdownTime + dt
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] refreshBuyAcceptBtnStatus
-------------------------------------------------------------------------------
function f_monthCardActive:refreshBuyAcceptBtnStatus()
	self.monthCardRewardInfo = g_game.g_userInfoManager:getMonthCardReward()
	
	self.buyCdTime = self.monthCardRewardInfo["cdTime"]
	
	local cpTable = self.m_componentTable
	
	if self.buyCdTime > 0 then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["mca_limit_lbl"]:setString(math.ceil(self.buyCdTime/86400) .. "天后可再次購買")
		else
			self.m_componentTable["mca_limit_lbl"]:setString(math.ceil(self.buyCdTime/86400) .. "天后可再次购买")
		end
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["mca_limit_lbl"]:setString("每月限購一次")
		else
			self.m_componentTable["mca_limit_lbl"]:setString("每月限购一次")
		end
	end
	
	if self.monthCardRewardInfo["hasMonthCard"] == 1 then
		cpTable["buyBtn_gou"]:setImage("batch_ui/ling_uizi.png")
		cpTable["buyBtn_mai"]:setImage("batch_ui/qu_uizi.png")
	else
		cpTable["buyBtn_gou"]:setImage("batch_ui/gou_uizi.png")
		cpTable["buyBtn_mai"]:setImage("batch_ui/mai_uizi.png")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardActive] buyMonthCardDoneCallback
-------------------------------------------------------------------------------
function f_monthCardActive:buyMonthCardDoneCallback(buyResult)
	if buyResult["productId"] == 7 then
		if buyResult["result"] == true then
			local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_BUY_MONTH_CARD_SUCCESS)
			g_game.g_utilManager:showCustomMessagePanel(tips)
			
			g_game.g_userInfoManager:requestMonthCard() -- 购买月卡成功，修改月卡相关数据
			
			--刷新vip数据
			g_game.g_userInfoManager:sendToGetVipYuanbao()
			--如果限时充值奖励打开，则刷新限时充值奖励界面
			local rewardPanel = g_game.g_panelManager:getUiPanel("reward_panel")
			if rewardPanel ~= nil then
				local userInfo = g_game.g_userInfoManager:getUserInfo()
				local sendMsg = {}
				sendMsg["roleId"] = userInfo["roleId"]
				g_game.g_netManager:send_message(g_network_message_type.CS_GET_PEROID_CHARGE_INFO, sendMsg)
				g_game.g_userInfoManager:setNeedRefreshPeroidCharge(true)
			end
		else
			g_game.g_utilManager:showFloatingMsg("服务器未验证成功,购买月卡失败!")
		end
	end
end
