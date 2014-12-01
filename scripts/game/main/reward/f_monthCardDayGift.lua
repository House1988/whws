--[[--
	月卡日领取奖励
--]]--

require("scripts.auto.auto_month_card_day_gift")
require("scripts.game.main.shangcheng.f_shangcheng_monthcarditem")

f_monthCardDayGift = class("f_monthCardDayGift")
f_monthCardDayGift.__index = f_monthCardDayGift

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardDayGift] static_create
-------------------------------------------------------------------------------
function f_monthCardDayGift.static_create()
	local mainPanelTable = createmonth_card_day_gift()
	local mainPanel = mainPanelTable["month_card_day_gift"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_monthCardDayGift)
	
	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardDayGift] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_monthCardDayGift:initAllComponent()
	local cpTable = self.m_componentTable
	
	self.rewardItemNum = 0
	self.m_rewardTable = nil
	self.m_day = 0
	
	-- 领取按钮
	local acceptBtnEvent = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		local sendMsg = {}
		sendMsg["roleId"] = userInfo["roleId"]
		sendMsg["day"] = self.m_day
		g_game.g_netManager:send_message(g_network_message_type.CS_GET_MONTH_CARD_REWARD, sendMsg)
		self.m_funHandler(self.m_day)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	end
	cpTable["mcd_accept_btn"]:addHandleOfcomponentEvent(acceptBtnEvent, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_EN2ZH = {[1]="一",[2]="二",[3]="三",[4]="四",[5]="五",[6]="六",[7]="七",[8]="八",[9]="九",[10]="十"}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardDayGift] setData
-------------------------------------------------------------------------------
function f_monthCardDayGift:setData(rewardTable)
	self.m_day = rewardTable[1]
	self.m_rewardTable = rewardTable
	
	local dayStr = ""
	if self.m_day >= 20 then
		dayStr = dayStr .. self.m_EN2ZH[math.floor(self.m_day/10)] .. "十"
	elseif self.m_day >= 10 then
		dayStr = "十"
	end
	if self.m_day%10 > 0 then
		dayStr = dayStr .. self.m_EN2ZH[self.m_day%10]
	end
	self.m_componentTable["mcd_title_lbl"]:setString("第" .. dayStr .. "天")
	
	for i=0,1 do
		self:showRewardItem(self.m_rewardTable[2+i*3], self.m_rewardTable[3+i*3], self.m_rewardTable[4+i*3])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardDayGift] showRewardItems
-------------------------------------------------------------------------------
function f_monthCardDayGift:showRewardItem(type, id, num)
	local monthcarditem = f_shangcheng_monthcarditem.static_create()
	self:appendComponent(monthcarditem)
	monthcarditem:setPositionInContainer(cc.p(70+self.rewardItemNum*132, 86))
	self.rewardItemNum = self.rewardItemNum + 1
	local imagePath, qulity, name = g_game.g_dictConfigManager:getResByType(type, id)
	monthcarditem:setCount(tostring(num))
	monthcarditem:setName(name)
	monthcarditem:setImage(imagePath)
	monthcarditem:setQulityBg(g_game.g_f_quality_image[qulity])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardDayGift] setButtonState
-------------------------------------------------------------------------------
function f_monthCardDayGift:setButtonState(state)
	local cpTable = self.m_componentTable
	if state == 1 then
		-- 可以领取
		cpTable["mcd_accept_btn"]:setVisible(true)
		cpTable["mcd_accept_btn"]:setButtonState(2)
		cpTable["mcd_already_accept"]:setVisible(false)
	elseif state == 2 then
		-- 已经领取
		cpTable["mcd_accept_btn"]:setVisible(false)
		cpTable["mcd_already_accept"]:setImage("batch_ui/yilingqu_huodong.png")
		cpTable["mcd_already_accept"]:setSize(cc.size(114,81))
		cpTable["mcd_already_accept"]:setPositionInContainer(cc.p(332,80.5))
		cpTable["mcd_already_accept"]:setVisible(true)
	elseif state == 3 then
		-- 时间没到,不可领取
		cpTable["mcd_accept_btn"]:setVisible(true)
		cpTable["mcd_accept_btn"]:setButtonState(8)
		cpTable["mcd_already_accept"]:setVisible(false)
	elseif state == 4 then
		-- 已作废,不可领取
		cpTable["mcd_accept_btn"]:setVisible(false)
		cpTable["mcd_already_accept"]:setImage("batch_ui/zuofei.png")
		cpTable["mcd_already_accept"]:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardDayGift] setFunHandler
-------------------------------------------------------------------------------
function f_monthCardDayGift:setFunHandler(funHandler)
	self.m_funHandler = funHandler
end
