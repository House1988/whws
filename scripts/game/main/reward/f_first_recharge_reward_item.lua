--[[--
首充奖励界面,奖励显示
--]]--

require("scripts.auto.auto_first_recharge_reward_item")
require("scripts.game.main.reward.f_charge_reward_detail_panel")

f_first_recharge_reward_item = class("f_first_recharge_reward_item")
f_first_recharge_reward_item.__index = f_first_recharge_reward_item

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_first_recharge_reward_item.static_create()
	local mainPanelTable = createfirst_recharge_reward_item()
	local mainPanel = mainPanelTable["first_recharge_reward_item"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_first_recharge_reward_item)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_first_recharge_reward_item:initAllComponent()
	self.m_peroidId = 0
	self.m_rewardNumber = 0
	
	self.m_rewardInfo = {}
	
	local cpTable = self.m_componentTable
	
	-- 领取的处理
	self.m_acceptBtnHandler = nil
	local acceptBtnEvent = function()
--		local t = {}
--		for i = 1, self.m_rewardInfo["reward"]["num"] do
--			local temp = {}
--			temp["id"] = tonumber(self.m_rewardInfo["reward"]["list"][i]["id"])
--			temp["type"] = tonumber(self.m_rewardInfo["reward"]["list"][i]["type"])
--			temp["num"] = tonumber(self.m_rewardInfo["reward"]["list"][i]["num"])
--			table.insert(t,	temp)
--		end
--		require("scripts.game.main.mail.f_mail_attachment")
--		local mail = f_mail_attachment.static_create()
--		mail:panelInitBeforePopup(t)
--		mail:setCallback(self.m_acceptBtnHandler, self.m_rewardNumber)
--		mail:setButtonState(self.m_btnState)
--		g_game.g_panelManager:showUiPanel(mail, "mail_attachment")
		
		if self.m_acceptBtnHandler ~= nil then
			self.m_acceptBtnHandler(self.m_rewardNumber)
		end
		local detailPanel = g_game.g_panelManager:removeUiPanel("charge_reward_detail_panel")
		if detailPanel == nil then
			detailPanel = f_charge_reward_detail_panel.static_create()
			detailPanel:setBtnState(self.m_btnState)
			g_game.g_panelManager:showUiPanel(detailPanel, "charge_reward_detail_panel")
		end
		detailPanel:refreshRewardDetailPanel(self.m_peroidId, self.m_rewardNumber, self.m_rewardInfo)
	end
	cpTable["fri_accept_btn"]:addHandleOfcomponentEvent(acceptBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_anim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_anim)
	self.m_anim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_anim:setLoop(true)
	self.m_anim:setAnimationScale(1)
	self.m_anim:setPositionInContainer(cc.p(87, 99))
	self.m_anim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_anim:setVisible(false)
end


function f_first_recharge_reward_item:setAnim(visible)
	self.m_anim:setVisible(visible)
end

function f_first_recharge_reward_item:claimReward()
	self.m_componentTable["yilingqu"]:setVisible(true)
	self.m_componentTable["fri_accept_btn"]:setVisible(false)
	self.m_anim:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] setEcceptBtnHandler
-- 设置领取按钮的处理方法
-------------------------------------------------------------------------------
function f_first_recharge_reward_item:setEcceptBtnHandler(handler, peroidId, rewardNumber)
	self.m_acceptBtnHandler = handler
	self.m_peroidId = peroidId
	self.m_rewardNumber = rewardNumber
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] setEcceptBtnHandler
-- 设置领取按钮的处理方法
-------------------------------------------------------------------------------
function f_first_recharge_reward_item:setArrowImageVisible(isVisible)
	self.m_componentTable["fri_arrow_image"]:setVisible(isVisible)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] setMoneyLimit
-------------------------------------------------------------------------------
function f_first_recharge_reward_item:setMoneyLimit(count)
	self.m_componentTable["fri_title_2"]:setVisible(tostring(count))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] setButtonState
-------------------------------------------------------------------------------
function f_first_recharge_reward_item:setButtonState(state)
	self.m_btnState = state
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_recharge_reward_item] setData
-------------------------------------------------------------------------------
function f_first_recharge_reward_item:setData(data, itemState)
	self.m_rewardInfo = data
	
	local cpTable = self.m_componentTable
	cpTable["fri_title_2"]:setString(tostring(data["money"]))
	
	for i=1,data["reward"]["num"] do
		local detail = data["reward"]["list"][i]
		local imagePath, qulity, name = g_game.g_dictConfigManager:getResByType(tonumber(detail["type"]), tonumber(detail["id"]))
		cpTable["fri_detail_"..i]:setString(name.."*"..detail["num"])
	end
	if itemState == 2 then
		cpTable["yilingqu"]:setVisible(true)
		cpTable["fri_accept_btn"]:setVisible(false)
	else
		cpTable["yilingqu"]:setVisible(false)
		cpTable["fri_accept_btn"]:setVisible(true)
	end
end


