require("scripts.auto.auto_mingchenxuanze_title")
require("scripts.auto.auto_mingchenxuanze_middle")
require("scripts.auto.auto_mingchenxuanze_bottom")

require("scripts.game.main.card.f_card_mingchen_detail")
require("scripts.game.main.card.f_card_mingchenxuanze_card")
--[[--
未上阵名臣
--]]--
f_card_mingchenxuanze_panel = class("f_card_mingchenxuanze_panel")
f_card_mingchenxuanze_panel.__index = f_card_mingchenxuanze_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_card_mingchenxuanze_panel.static_create()
	local mingchenxuanze_title_table = createmingchenxuanze_title()
	local mingchenxuanze_panel = mingchenxuanze_title_table["mingchenxuanze_title"]

	local funTable = {}
	tolua.setpeer(mingchenxuanze_panel, funTable)
	setmetatable(funTable, f_card_mingchenxuanze_panel)

	mingchenxuanze_panel.m_mingchen_xuanzeTitleTable = mingchenxuanze_title_table
	return mingchenxuanze_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_unbattle_data = {}
	
	self.COL			= 4
	self.ROW			= 2
	
	self.m_mingchen_xuanze_middleTable = nil
	self.m_mingchen_xuanze_bottomTable = nil
	
	self.m_targetExchangeCard = nil
	self.m_selectData = nil
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] setTargetExchangeCard
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:setTargetExchangeCard(card)
	self.m_targetExchangeCard = card
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_card_mingchenxuanze_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] onEnter
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:onEnter()


	self.m_mingchen_xuanze_bottomTable = createmingchenxuanze_bottom()
	local mingchenxuanze_bottom_panel = self.m_mingchen_xuanze_bottomTable["mingchenxuanze_bottom"]
	self:appendComponent(mingchenxuanze_bottom_panel)
	mingchenxuanze_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
	mingchenxuanze_bottom_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
	CONFIG_SCREEN_HEIGHT/2))
	
	self.m_mingchen_xuanzeTitleTable["mingchenxuanze_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)

	self:initAllMingchenCardsPanel()
	self.m_mingchen_xuanze_middleTable =  createmingchenxuanze_middle()
	local mingchenxuanze_middle_panel = self.m_mingchen_xuanze_middleTable["mingchenxuanze_middle"]
	self:appendComponent(mingchenxuanze_middle_panel)
	mingchenxuanze_middle_panel:setAnchorPoint(cc.p(0.5,0.5))
	mingchenxuanze_middle_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
	CONFIG_SCREEN_HEIGHT/2))
	self.m_mingchen_xuanze_middleTable["xuanze_container_panel1"]:setStopTouchEvent(true)
	self.m_mingchen_xuanze_middleTable["xuanze_container_panel2"]:setStopTouchEvent(true)

	self:initAllComponent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BUZHEN_LIST)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] initAllMingchenCardsPanel
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:initAllMingchenCardsPanel()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_item_array = {}
	self.m_unbattle_data = {}
	
	local allUnbattleCardsInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	
	local count = #allUnbattleCardsInfo
	if count == 0 then
		return
	end
	
	for i = 1, count do
		if allUnbattleCardsInfo[i]["officerId"] ~= 2033 and
			allUnbattleCardsInfo[i]["officerId"] ~= 3045 then
			table.insert(self.m_unbattle_data,allUnbattleCardsInfo[i])
		end
	end
	
	self.m_item_count = #self.m_unbattle_data
	
	--排序名臣列表（第一关键字：星级 第二关键字：等级）
	local compFunc = function(mingchen1, mingchen2)
		--获取到名臣星级
		local mingchenStar1 = g_game.g_dictConfigManager:getCardQuality(mingchen1["officerId"])
		local mingchenStar2 = g_game.g_dictConfigManager:getCardQuality(mingchen2["officerId"])
		if mingchenStar1 == mingchenStar2 then
			if mingchen1["officerLevel"] == mingchen2["officerLevel"] then
				return mingchen1["officerId"] > mingchen2["officerId"]
			else
				return mingchen1["officerLevel"] > mingchen2["officerLevel"]
			end
		else
			return mingchenStar1 > mingchenStar2
		end
	end
	table.sort(self.m_unbattle_data,compFunc)             
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(800,480))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(70,78))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 7, 20, 175,231)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local updateTeamInfoCallBack = function(card)
		self:updateTeamAtkAndDef(card)
	end
	
	local removeItem = function(card)
		self:removeItem(card)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if #self.m_unbattle_data >= i then
		
			local mingchenCard =  f_card_mingchenxuanze_card.static_create()
			mingchenCard:panelInitBeforePopup()
			mingchenCard:setSize(cc.size(156,231))
			mingchenCard:setMingchenIndex(i)
			
			mingchenCard:setMingchenRemoveFromListCallback(removeItem)
			mingchenCard:setMingchenCardEventCallBack(updateTeamInfoCallBack)
			mingchenCard:setMingchenIndexInUnbattleList(i)
			mingchenCard:setData(self.m_unbattle_data[i])
			
			if i == 1 then
				self.m_selectData = mingchenCard:getData()
				mingchenCard.m_componentTable["mingchenxuanze_card_xuanzhong_image"]:setVisible(true)
			else
				mingchenCard.m_componentTable["mingchenxuanze_card_xuanzhong_image"]:setVisible(false)
			end

			self.m_page_container:addComponentToPage(mingchenCard, pageIndex)
			
			table.insert(self.m_item_array, mingchenCard)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] removeItem
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:removeItem(card)
	local index = card:getMingchenIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getMingchenIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] onExit
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:onExit()
	self:unregisterNodeEvent()

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN_LIST)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] onCleanup
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:initAllComponent()
	
	--名臣选择界面   向前翻页
	local forwardCallBack = function()
		self.m_page_container:showNextPage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_mingchen_xuanze_middleTable["xuanze_back_page_button"]:addHandleOfcomponentEvent(forwardCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--名臣选择界面 向后翻页
	local backwardCallBack = function()
		self.m_page_container:showPrePage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_mingchen_xuanze_middleTable["xuanze_pre_page_button"]:addHandleOfcomponentEvent(backwardCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--删除名臣界面回调
	local delete_mingchen_CallBack = function()
		self:deleteFromParent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_mingchen_xuanzeTitleTable["mingchenxuanze_close_button"]:addHandleOfcomponentEvent(delete_mingchen_CallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local genghuanCallBack = function()
		self:sendChangeMingChenMessage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_mingchen_xuanze_bottomTable["mingchenxuanze_change_button"]:addHandleOfcomponentEvent(genghuanCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local popuUpCardDetailCallBack = function()
		self:showCurrentCardDetail()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_mingchen_xuanze_bottomTable["mingchenxuanze_details_button"]:addHandleOfcomponentEvent(popuUpCardDetailCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] sendChangeMingChenMessage
-- 发送换将 信息
-------------------------------------------------------------------------------

function f_card_mingchenxuanze_panel:sendChangeMingChenMessage()
	local allBattleCardsInfo  = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local allUnbattleCardsInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	local battleListNum = #allBattleCardsInfo
	local unbattleListNum = #allUnbattleCardsInfo
	
	if unbattleListNum == 0 then
		return
	end
	
	local targetIndex = self.m_targetExchangeCard:getIndexInList()

	local selectData = self.m_selectData
	local targetData = self.m_targetExchangeCard:getData()
	
	if targetData == nil or selectData["officerId"] ~= targetData["officerId"] then
		local t = allBattleCardsInfo
		for i = 1, #t do
			if t[i]["officerId"] == selectData["officerId"] then
				g_game.g_utilManager:showGuildLinePopup(g_game.g_f_error_msg_def.F_LUA_ERROR_DUPLICATE_MINGCHEN)
				return
			end
		end
	end

	if targetData == nil then
		table.insert(allBattleCardsInfo,selectData)
		
		for i = #allUnbattleCardsInfo,1,-1 do
			if allUnbattleCardsInfo[i]["id"] == selectData["id"] then
				table.remove(allUnbattleCardsInfo,i)
			end
		end

		--用于update 信息用 ，没有对 battleList直接操作
		self.m_targetExchangeCard:setData(selectData)

		g_game.g_userInfoManager:requestChangeMingchen(selectData["id"],
		selectData["officerId"],targetIndex)
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
		g_game.g_userInfoManager:requestChangeMingchen(selectData["id"],selectData["officerId"],targetIndex)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] showCurrentCardDetail
-- 查看当前 card的 详情
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:showCurrentCardDetail()
	if self.m_selectData ~= nil then
		local detailPanel = f_card_mingchen_detail.static_create()
	    detailPanel:panelInitBeforePopup()
	    detailPanel:setDetail(self.m_selectData)
	    	    
	    g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")
	else	
		local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT)
		g_game.g_utilManager:showMsg(tips)		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:deleteFromParent()
	local paibinghuangzi = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
	
	if paibinghuangzi then
		local paibing = paibinghuangzi.m_paibing_buzhen
		if paibing:isVisible() then
			paibing:updateOfficerViewToDefault()
		end
	end

	g_game.g_panelManager:removeUiPanel("mingchenxuanze_title")
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_panel] updateTeamAtkAndDef
-- 刷新当前阵容整体的 攻击力 和防御力显示
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_panel:updateTeamAtkAndDef(card)

	if card ~= nil then
		self.m_selectData = card:getData()
		local index = card:getMingchenIndex()
	
		for i = 1,table.getn(self.m_item_array) do
			if self.m_item_array[i]:getMingchenIndex() == index then
				self.m_item_array[i].m_componentTable["mingchenxuanze_card_xuanzhong_image"]:setVisible(true)
			else
				self.m_item_array[i].m_componentTable["mingchenxuanze_card_xuanzhong_image"]:setVisible(false)
			end
		end
	end

	
	local unBattleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	local noBattleNum = #unBattleList
	
	if noBattleNum == 0 then
		return
	end
	
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local battleNum = #battleList
	
	local allAtk = 0
	local allDef = 0
	
    local targetIndex =  self.m_targetExchangeCard:getIndexInList()

	for i = 1 ,battleNum do
		--选择的在阵容当中 表明选中的是 某一个 不是空的
		if i == targetIndex then
			local atkAddition,defAddition = g_game.g_dictConfigManager:getCardAddition(i,self.m_selectData)
			allAtk = allAtk + self.m_selectData["attack"] + atkAddition
			allDef = allDef + self.m_selectData["defense"] + defAddition
		else
			local atkAddition,defAddition = g_game.g_dictConfigManager:getCardAddition(i,battleList[i])
		    allAtk = allAtk + battleList[i]["attack"] +atkAddition
		    allDef = allDef + battleList[i]["defense"]+defAddition
		end
	end
	
	--表明当前需要换将的位置  是空的
	if targetIndex > battleNum then
		local atkAddition,defAddition = g_game.g_dictConfigManager:getCardAddition(targetIndex,self.m_selectData)
	
		allAtk = allAtk + self.m_selectData["attack"] + atkAddition
		allDef = allDef + self.m_selectData["defense"] + defAddition
	end
	
	 self.m_mingchen_xuanze_bottomTable["mingchenxuanze_bottom_attack_num_label"]:setString(""..math.floor(allAtk))
	 self.m_mingchen_xuanze_bottomTable["mingchenxuanze_bottom_xueliang_num_label"]:setString("".. math.floor(allDef))
	 
	 local userLevel = g_game.g_userInfoManager:getLevel()
	 local  openedNum = g_game.g_dictConfigManager:getOpenedCardNum(userLevel)
	 self.m_mingchen_xuanze_bottomTable["mingchenxuanze_bottom_zhenrong_num_label"]:setString(battleNum .. "/"..openedNum)
	 
end

