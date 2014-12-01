--[[--
开服有礼
--]]--

require("scripts.auto.auto_open_service_gift")
require("scripts.game.main.openservicegift.f_open_service_day_gift")

f_open_service_gift_panel = class("f_open_service_gift_panel")
f_open_service_gift_panel.__index = f_open_service_gift_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_open_service_gift_panel.static_create()
	local mainPanelTable = createopen_service_gift()
	local mainPanel = mainPanelTable["open_service_gift"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_open_service_gift_panel)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_open_service_gift_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_open_service_gift_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_open_service_gift_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] onEnter
-------------------------------------------------------------------------------
function f_open_service_gift_panel:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_KUANG1[1])
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] onExit
-------------------------------------------------------------------------------
function f_open_service_gift_panel:onExit()
	self:unregisterNodeEvent()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_KUANG1[1])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_open_service_gift_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_open_service_gift_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] onCleanup
-------------------------------------------------------------------------------
function f_open_service_gift_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_open_service_gift_panel:initAllComponent()
	local cpTable = self.m_componentTable
	
	-- 领取奖励标记
	self.m_acceptIndex = 0
	
	-- 灯笼
	local lantern_effect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(lantern_effect)
	lantern_effect:setAnchorPoint(cc.p(0.5,0.5))
	lantern_effect:setLoop(true)
	lantern_effect:setAnimationScale(0.4)
	lantern_effect:setScale(2.55)
	lantern_effect:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[2])
	lantern_effect:setPositionInContainer(cc.p(486, 320))
	
	-- 关闭按钮
	local closeBtnEvent = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("open_service_ui")
	end
	cpTable["os_close_btn"]:addHandleOfcomponentEvent(closeBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 每日奖励列表
	self.m_giftItemListTable = {}
	
	self.m_rewardTable = g_game.g_dictConfigManager:getServerStartReward()
	
	self.m_total_pages = 0
	self.COL = 1
	self.ROW = 3
	
	self.m_page_container = fc.FContainerPage:create(2)
	cpTable["os_page_panel"]:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(516,525))
	self.m_page_container:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page_container:setPositionInContainer(cc.p(258,262))
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
	
	self.m_total_pages = math.ceil(self.m_rewardTable["num"]/3)
	
	-- 设置初始页
	local infoTable = g_game.g_userInfoManager:getServerStartRewardInfo()
	local pageIndex = math.ceil(infoTable["day"]/3)
	for i=1,infoTable["day"] do
		if infoTable["rewardMask"][i] == 0 then
			pageIndex = math.ceil(i/3)
			break
		end
	end
	
	self.m_page_container:setPageInfoAndIndex(self.m_rewardTable["num"], self.ROW, self.COL, 0, 0, 516, 175, pageIndex)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] loadPageData
-------------------------------------------------------------------------------
function f_open_service_gift_panel:loadPageData(pageIndex)
	if pageIndex < 0 or pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local startIndex = self.COL*self.ROW*(pageIndex-1)+1
	local endIndex = ((startIndex+3) < self.m_rewardTable["num"]) and (startIndex+3) or self.m_rewardTable["num"]
	
	local infoTable = g_game.g_userInfoManager:getServerStartRewardInfo()
	local buttonState = 1
	local isSplit = false
	
	for i=startIndex,endIndex do
		local dayGiftPanel = f_open_service_day_gift.static_create()
		self.m_page_container:addComponentToPage(dayGiftPanel, pageIndex)
		dayGiftPanel:setSize(cc.size(516,175))
		dayGiftPanel:setData(i, self.m_rewardTable["reward_list"][i])
		
		local funCall = function(index)
			self.m_acceptIndex = index
		end
		dayGiftPanel:setFunHandler(funCall)
		if i > infoTable["day"] then
			buttonState = 3
		else
			if infoTable["rewardMask"][i] == 0 then
				buttonState = 1
			else
				buttonState = 2
			end
		end
		dayGiftPanel:setButtonState(buttonState)
		
		self.m_giftItemListTable[i] = dayGiftPanel
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] updatePageNum
-------------------------------------------------------------------------------
function f_open_service_gift_panel:updatePageNum()
	self.m_currPageIndex = self.m_page_container:getCurrentPageIndex()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_open_service_gift_panel:refreshRewardState()
	local rewardPanel = self.m_giftItemListTable[self.m_acceptIndex]
	rewardPanel:setButtonState(2)
	g_game.g_userInfoManager:setServerStartRewardMask(self.m_acceptIndex, 1)
end
