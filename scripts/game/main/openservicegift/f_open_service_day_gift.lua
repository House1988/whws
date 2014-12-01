--[[--
开服有礼
--]]--

require("scripts.auto.auto_open_service_day_gift")
require("scripts.game.main.openservicegift.f_open_service_gift_item")

f_open_service_day_gift = class("f_open_service_day_gift")
f_open_service_day_gift.__index = f_open_service_day_gift

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_day_gift] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_open_service_day_gift.static_create()
	local mainPanelTable = createopen_service_day_gift()
	local mainPanel = mainPanelTable["open_service_day_gift"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_open_service_day_gift)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_day_gift] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_open_service_day_gift:initAllComponent()
	local cpTable = self.m_componentTable
	
	self.m_rewardTable = nil
	self.m_day = 0
	
	cpTable["od_title_bg"]:setScaleY(-1)
	
	-- 领取按钮
	local acceptBtnEvent = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		local sendMsg = {}
		sendMsg["roleId"] = userInfo["roleId"]
		sendMsg["day"] = self.m_day
		g_game.g_netManager:send_message(g_network_message_type.CS_ACCEPT_CHECKIN_REWARD, sendMsg)
		self.m_funHandler(self.m_day)
	end
	cpTable["od_accept_btn"]:addHandleOfcomponentEvent(acceptBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_EN2ZH = {[1]="一",[2]="二",[3]="三",[4]="四",[5]="五",[6]="六",[7]="七",[8]="八",[9]="九",[10]="十"}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_day_gift] setData
-------------------------------------------------------------------------------
function f_open_service_day_gift:setData(day, rewardTable)
	self.m_day = day
	self.m_rewardTable = rewardTable
	local cpTable = self.m_componentTable
	
	local dayStr = ""
	if day >= 20 then
		dayStr = dayStr .. self.m_EN2ZH[math.floor(day/10)] .. "十"
	elseif day >= 10 then
		dayStr = "十"
	end
	if day%10 > 0 then
		dayStr = dayStr .. self.m_EN2ZH[day%10]
	end
	
	if LANGUAGE_TYPE == 3 then
		cpTable["od_title_lbl"]:setString("簽到第" .. dayStr .. "天")
	else
		cpTable["od_title_lbl"]:setString("签到第" .. dayStr .. "天")
	end
	
	for i=1,self.m_rewardTable["num"] do
		local giftItemPanel = f_open_service_gift_item.static_create()
		self:appendComponent(giftItemPanel)
    	giftItemPanel:setAnchorPoint(cc.p(0,0.5))
    	giftItemPanel:setPositionInContainer(cc.p((i-1)*111,104))
		giftItemPanel:setData(self.m_rewardTable["list"][i])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_day_gift] setButtonState
-------------------------------------------------------------------------------
function f_open_service_day_gift:setButtonState(state)
	local cpTable = self.m_componentTable
	if state == 1 then
		-- 可以领取
		cpTable["od_accept_btn"]:setVisible(true)
		cpTable["od_accept_btn"]:setButtonState(2)
		cpTable["od_already_accept"]:setVisible(false)
	elseif state == 2 then
		-- 已经领取
		cpTable["od_accept_btn"]:setVisible(false)
		cpTable["od_already_accept"]:setVisible(true)
	elseif state == 3 then
		-- 时间没到,不可领取
		cpTable["od_accept_btn"]:setVisible(true)
		cpTable["od_accept_btn"]:setButtonState(8)
		cpTable["od_already_accept"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_day_gift] setFunHandler
-------------------------------------------------------------------------------
function f_open_service_day_gift:setFunHandler(funHandler)
	self.m_funHandler = funHandler
end
