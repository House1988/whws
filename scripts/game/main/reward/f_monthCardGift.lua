--[[--
	月卡奖励领取面板
--]]--

require("scripts.auto.auto_month_card_gift")
require("scripts.game.main.reward.f_monthCardDayGift")
require("scripts.game.main.shangcheng.f_shangcheng_monthcarditem")

f_monthCardGift = class("f_monthCardGift")
f_monthCardGift.__index = f_monthCardGift

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardGift] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_monthCardGift.static_create()
	local mainPanelTable = createmonth_card_gift()
	local mainPanel = mainPanelTable["month_card_gift"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_monthCardGift)
	
	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardGift] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_monthCardGift:initAllComponent()
	local cpTable = self.m_componentTable
	
	-- 灯笼
	local lantern_effect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(lantern_effect)
	lantern_effect:setAnchorPoint(cc.p(0.5,0.5))
	lantern_effect:setLoop(true)
	lantern_effect:setAnimationScale(0.4)
	lantern_effect:setScale(1.85)
	lantern_effect:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[2])
	lantern_effect:setPositionInContainer(cc.p(486, 248))
	
	
	-- 领取奖励标记
	self.m_acceptIndex = 0
	self.m_rewardListTable	= {}
	
	-- 关闭按钮
	cpTable["mcg_close"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local closeBtnEvent = function()
		g_game.g_panelManager:removeUiPanel("monthCard_gift")
	end
	cpTable["mcg_close"]:addHandleOfcomponentEvent(closeBtnEvent, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 月卡奖励物品
	self.monthCardTable = g_game.g_dictConfigManager:getMonthCardTable()
	
	-- 月卡当前领取状态信息
	self.monthCardReward = g_game.g_userInfoManager:getMonthCardReward()
	
	self.COL = 1
	self.ROW = 3
	self.m_total_pages = math.ceil(#self.monthCardTable/self.ROW)
	
	self.m_page_container = fc.FContainerPage:create(2)
	cpTable["mcg_panel"]:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(412,458))
	self.m_page_container:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page_container:setPositionInContainer(cc.p(267,277))
    self.m_page_container:setStopTouchEvent(true)
    self.m_page_container:enableClipping(true)
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    local updatePageNum = function()
    	self:updatePageNum()
    end
    self.m_page_container:registMovePageCallback(updatePageNum)
    
    self.m_page_container:setPageInfo(#self.monthCardTable, self.ROW, self.COL, 0, 0, 412, 152)
    
	-- 设置初始页
	local pageIndex = math.ceil(self.monthCardReward["day"]/3)
	pageIndex = (pageIndex == 0) and 1 or pageIndex
	self.m_page_container:setPageInfoAndIndex(#self.monthCardTable, self.ROW, self.COL, 0, 0, 412, 152, pageIndex)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardGift] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_monthCardGift:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	local buttonState = 1
	
	for i = startIndex, endIndex do
		local monthcardDayGift = f_monthCardDayGift.static_create()
		self.m_page_container:addComponentToPage(monthcardDayGift, pageIndex)
		self.m_rewardListTable[i] = monthcardDayGift
		monthcardDayGift:setData(self.monthCardTable[i])
		
		local funCall = function(index)
			self.m_acceptIndex = index
		end
		monthcardDayGift:setFunHandler(funCall)
		if i > self.monthCardReward["day"] then
			buttonState = 3
		elseif i == self.monthCardReward["day"] then
			if self.monthCardReward["rewardMask"][i] == 0 then
				buttonState = 1
			else
				buttonState = 2
			end
		else
			if self.monthCardReward["rewardMask"][i] == 0 then
				buttonState = 4
			else
				buttonState = 2
			end
		end
		monthcardDayGift:setButtonState(buttonState)
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardGift] updatePageNum
-- 更新页码
-------------------------------------------------------------------------------
function f_monthCardGift:updatePageNum()
	self.m_currPageIndex = self.m_page_container:getCurrentPageIndex()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardGift] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_monthCardGift:refreshRewardState()
	local rewardPanel = self.m_rewardListTable[self.m_acceptIndex]
	rewardPanel:setButtonState(2)
end
