require("scripts.auto.auto_meinvxuanze_title")
require("scripts.game.main.beauty.f_game_beauty_uncheer_card")
require("scripts.game.main.beauty.f_game_beauty_card_detail")
--[[--
未上阵美女界面
--]]--
f_game_beauty_uncheered_panel = class("f_game_beauty_uncheered_panel")
f_game_beauty_uncheered_panel.__index = f_game_beauty_uncheered_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_game_beauty_uncheered_panel.static_create()
	local meinvxuanze_title_table = createmeinvxuanze_title()
	local meinvxuanze_title_panel = meinvxuanze_title_table["meinvxuanze_title"]

	local funTable = {}
	tolua.setpeer(meinvxuanze_title_panel, funTable)
	setmetatable(funTable, f_game_beauty_uncheered_panel)

	meinvxuanze_title_panel.m_meinvxuanze_titleTable = meinvxuanze_title_table
	return meinvxuanze_title_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_unbattle_data = {}
	
	self.COL			= 5
	self.ROW			= 2
	
	self.m_targetExchangeCard = nil
	self.m_selectBeautyData = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] setTargetExchangeCard
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:setTargetExchangeCard(card)
	self.m_targetExchangeCard = card
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_uncheered_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:onEnter()
	self.m_meinvxuanze_titleTable["mnxz_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self:initAllComponent()
	self:initUncheerPages()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BEAUTY_LIST_PANEL)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] initUncheerPages
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:initUncheerPages()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_item_array = {}
	self.m_unbattle_data = {}
	
	local unbattleBeautyData = g_game.g_userInfoManager:getBeautiListInfo()["unbattleList"]
	local count = #unbattleBeautyData
	
	if count == 0 then
		return
	end
	
	for i = 1, count do
		if unbattleBeautyData[i]["beautyId"] ~= 2016 and
			unbattleBeautyData[i]["beautyId"] ~= 3025 then
			table.insert(self.m_unbattle_data,unbattleBeautyData[i])
		end
	end
	self.m_item_count = #self.m_unbattle_data
	
	--排序美女列表（第一关键字：星级 第二关键字：等级）
	local compFunc = function(meinv1, meinv2)
		--获取到名臣星级
		local meinvStar1 = g_game.g_dictConfigManager:getBeautyQuality(meinv1["beautyId"])
		local meinvStar2 = g_game.g_dictConfigManager:getBeautyQuality(meinv2["beautyId"])
		if meinvStar1 == meinvStar2 then
			if meinv1["beautyLevel"] == meinv2["beautyLevel"] then
				return meinv1["beautyId"] > meinv2["beautyId"]
			else
				return meinv1["beautyLevel"] > meinv2["beautyLevel"]
			end
		else
			return meinvStar1 > meinvStar2
		end
	end
	table.sort(self.m_unbattle_data,compFunc)
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(850,520))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(50,50))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 10, 1, 169,239)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local beautyClickCallback = function(card)
		self:selectBeautyEvent(card)
	end
	
	local removeItem = function(card)
		self:removeItem(card)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if #self.m_unbattle_data >= i then
			local beautyCard = f_game_beauty_uncheer_card.static_create()
			beautyCard:panelInitBeforePopup()
			beautyCard:setSize(cc.size(169,239))
			self.m_page_container:addComponentToPage(beautyCard, pageIndex)
	
			beautyCard:setBeautyIndex(i)
			beautyCard:setData(self.m_unbattle_data[i])
			beautyCard:setRemoveCallback(removeItem)
			beautyCard:setBeautyClickCallback(beautyClickCallback)
			--默认都不显示
			if i == 1 then
				self.m_selectBeautyData = beautyCard:getData()
				beautyCard.m_componentTable["mvxz_guangquan_image"]:setVisible(true)
			else
				beautyCard.m_componentTable["mvxz_guangquan_image"]:setVisible(false)
			end
			
			table.insert(self.m_item_array, beautyCard)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] removeItem
-- 删除美女
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:removeItem(beauty)	
	local index = beauty:getBeautyIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getBeautyIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] selectBeautyEvent
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:selectBeautyEvent(card)
	self.m_selectBeautyData = card:getData()

	for i = 1 ,#self.m_item_array do
		if  self.m_selectBeautyData == self.m_item_array[i]:getData() then
			self.m_item_array[i].m_componentTable["mvxz_guangquan_image"]:setVisible(true)
		else
			self.m_item_array[i].m_componentTable["mvxz_guangquan_image"]:setVisible(false)
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] onExit
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:onExit()
	self:unregisterNodeEvent()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:initAllComponent()
--	self.m_meinvxuanze_titleTable["meinvxuanze_queding_button"]:setComponentZOrder(10)
--	self.m_meinvxuanze_titleTable["meinvxuanze_xiangqing_button"]:setComponentZOrder(10)
	
	local closeCallBack = function()
		self:deleteFromParent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_meinvxuanze_titleTable["mnxz_close_button"]:addHandleOfcomponentEvent(closeCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--查看当前选中卡牌的详细
	local showDetail = function()
		self:showCurBeautyDetail()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_meinvxuanze_titleTable["meinvxuanze_xiangqing_button"]:addHandleOfcomponentEvent(showDetail, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--更换助阵美女
	local changeBeautyToCheer = function()
		self:sendChangeBeautyMessage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_meinvxuanze_titleTable["meinvxuanze_queding_button"]:addHandleOfcomponentEvent(changeBeautyToCheer, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] sendChangeBeautyMessage
-- 发送 更换助阵美女消息
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:sendChangeBeautyMessage()

	local allBeautyListInfo = g_game.g_userInfoManager:getBeautiListInfo()
	local battleListNum = allBeautyListInfo["battleList_Num"]
	local unbattleListNum = allBeautyListInfo["unbattleList_Num"]
	
	if unbattleListNum == 0 then
		return
	end
	
	local allBattleCardsInfo = allBeautyListInfo["battleList"]
	local allUnbattleCardsInfo = allBeautyListInfo["unbattleList"]
	
	local targetIndex = self.m_targetExchangeCard:getIndexInList()

	local selectData = self.m_selectBeautyData
	local targetData = self.m_targetExchangeCard:getData()

	if targetData == nil then
		battleListNum = battleListNum + 1
		allBeautyListInfo["battleList_Num"] = battleListNum
		unbattleListNum = unbattleListNum -1
		allBeautyListInfo["unbattleList_Num"] = unbattleListNum
		table.insert(allBattleCardsInfo,selectData)
		
		for i = #allUnbattleCardsInfo,1,-1 do
			if allUnbattleCardsInfo[i]["id"] == selectData["id"] then
				table.remove(allUnbattleCardsInfo,i)
			end
		end

		--用于update 信息用 ，没有对 battleList直接操作
		self.m_targetExchangeCard:setData(selectData)

		g_game.g_userInfoManager:requestChangeCheerBeauty(selectData["id"],
		selectData["beautyId"],targetIndex)
	else
		table.remove(allBattleCardsInfo,targetIndex)
		
		local removeIndex = 0
		for i = #allUnbattleCardsInfo,1,-1 do
			if allUnbattleCardsInfo[i]["id"] == selectData["id"] then
				removeIndex = i
				table.remove(allUnbattleCardsInfo,i)
			end
		end
		
		table.insert(allBattleCardsInfo,targetIndex,selectData)
		table.insert(allUnbattleCardsInfo,removeIndex,targetData)
		
		self.m_targetExchangeCard:setData(selectData)
	
		g_game.g_userInfoManager:requestChangeCheerBeauty(selectData["id"],selectData["beautyId"],targetIndex)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] showCurBeautyDetail
-- 显示详情
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:showCurBeautyDetail()
	
	if self.m_selectBeautyData == nil then
		return
	end
	
	local detailPanel = f_game_beauty_card_detail.static_create()
	detailPanel:panelInitBeforePopup()
	detailPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
	
	local item = require("scripts.game.main.suipian.f_fake_beauty").new()
	item:setWholeData(self.m_selectBeautyData)
	
    detailPanel:setDetail(item)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheered_panel] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_game_beauty_uncheered_panel:deleteFromParent()
	local tangquanmain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
	if tangquanmain then
		local tangquangong = tangquanmain.m_tangquangong
		if tangquangong:isVisible() then
			tangquangong:updateBeautyViewToDefault()
		end
	end

	g_game.g_panelManager:removeUiPanel("meinvxuanze_title")
	
end
