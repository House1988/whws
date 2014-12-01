--[[--
美女赏赐
--]]--

require("scripts.auto.auto_meinv_award_ui")
require("scripts.game.main.beauty.f_game_beauty_award_item_panel")

f_game_beauty_award_panel = class("f_game_beauty_award_panel")
f_game_beauty_award_panel.__index = f_game_beauty_award_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_award_panel.static_create()
	local mainPanelTable = createmeinv_award_ui()
	local mainPanel = mainPanelTable["meinv_award_ui"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_game_beauty_award_panel)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_award_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:onEnter()
	self.event_updateBuyItem1 = function()
		self:updateBuyItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM, self.event_updateBuyItem1)
	
	self.m_xingquAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_xingquAnim:setup(self.m_componentTable["ma_interest_value_lbl"], 21, "%d", false, false)

	self.m_componentTable["meinv_award_ui"]:appendComponent(self.m_xingquAnim)
	local p = self.m_componentTable["ma_interest_value_lbl"]:getPositionInContainer()
	self.m_xingquAnim:setPositionInContainer(p)
	
	self.m_qinmiAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_qinmiAnim:setup(self.m_componentTable["ma_intimate_value_lbl"], 21, "%d", false, false)
	self.m_componentTable["meinv_award_ui"]:appendComponent(self.m_qinmiAnim)
	local p = self.m_componentTable["ma_intimate_value_lbl"]:getPositionInContainer()
	self.m_qinmiAnim:setPositionInContainer(p)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] onExit
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM, self.event_updateBuyItem1)
  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] updateBuyItem
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:updateBuyItem()
	local popPanel = g_game.g_panelManager:getUiPanel("item_pop_up")
	local num = popPanel.m_itemCount
	local costType = popPanel.m_costType --1silver 2gold
	local cost = popPanel.m_cost
    
    local userInfo = g_game.g_userInfoManager:getUserInfo()
    if costType == 1 then
   		userInfo["silver"] = userInfo["silver"] - cost
   	end
   	
   	if costType == 2 then
   		userInfo["gold"] = userInfo["gold"] - cost
   	end
   	
   	g_game.g_panelManager:removeUiPanel("item_pop_up")
   	
   	local result = g_game.g_userInfoManager:getBuyItemResult()
   	local num2 = result["propList_Num"]
   	
   	for i = 1, num2 do
   		--3名臣  2美女
   		if result["propList"][i]["type"] == 3 then
   			g_game.g_userInfoManager:addEmptyCard(3,result["propList"][i]["id"],result["propList"][i]["primaryId"],1)
   		elseif result["propList"][i]["type"] == 2 then
   			g_game.g_userInfoManager:addEmptyCard(2,result["propList"][i]["id"],result["propList"][i]["primaryId"],1)
   		else -- 所有的道具
   			g_game.g_userInfoManager:addEmptyCard(1,result["propList"][i]["id"],result["propList"][i]["primaryId"],result["propList"][i]["num"])
   		end
   	end
   	
   	self:refreshItemCount()
	
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:initAllComponent()
	local cpTable = self.m_componentTable
	
	self.m_componentTable["ma_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	-- 关闭按钮
	local closeBtnEvent = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("meinv_award_ui")
	end
	cpTable["ma_close_btn"]:addHandleOfcomponentEvent(closeBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	self.m_itemTable = {}
	
	-- 兴趣点道具列表
	local interestItemList = cpTable["ma_interest_list"]
    interestItemList:enableClipping(true)
    interestItemList:enableScroll(false)
	interestItemList:setListInfo(5, 0, 0, 128, 140)
	
	local propsTable1 = g_game.g_dictConfigManager:getPropsByType(13)
	for _,itemInfo in pairs(propsTable1) do
		local itemPanel = f_game_beauty_award_item_panel.static_create()
		itemPanel:panelInitBeforePopup()
	    cpTable["ma_interest_list"]:appendComponent(itemPanel)
	    if LANGUAGE_TYPE == 3 then
	    	itemPanel:setItemTypeName("興趣點")
	    else
	    	itemPanel:setItemTypeName("兴趣点")
	    end
		
		itemPanel:initWithItemData(itemInfo, false)
	    self.m_itemTable[itemInfo[1]] = itemPanel
	end
	
	-- 亲密度道具列表
	local intimateItemList = cpTable["ma_intimate_list"]
    intimateItemList:enableClipping(true)
    intimateItemList:enableScroll(false)
	intimateItemList:setListInfo(5, 0, 0, 128, 140)
	
	local propsTable2 = g_game.g_dictConfigManager:getPropsByType(12)
	for _,itemInfo in pairs(propsTable2) do
		local itemPanel = f_game_beauty_award_item_panel.static_create()
		itemPanel:panelInitBeforePopup()
	    cpTable["ma_intimate_list"]:appendComponent(itemPanel)
	     if LANGUAGE_TYPE == 3 then
	     	itemPanel:setItemTypeName("親密度")
	     else
			itemPanel:setItemTypeName("亲密度")
	     end
		itemPanel:initWithItemData(itemInfo, true)
	    self.m_itemTable[itemInfo[1]] = itemPanel
	end
	
	self.m_beautyId = nil
	self.m_beautyRoleId = nil
	
	self.m_itemPropId = nil -- 赏赐物品类型
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] setItemPropId
-- 设置赏赐物品类型
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:setItemPropId(propId)
	self.m_itemPropId = propId
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] refreshAwardPanel
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:showAwardPanel(data)
	local cpTable = self.m_componentTable
	
	-- 美女
	self.m_beautyId = data["beautyId"]
	self.m_beautyRoleId = data["id"]
	self.m_beautyData = data
	
	self.m_xingquAnim:setLastValue(self.m_beautyData["beautySavor"])
	self.m_qinmiAnim:setLastValue(self.m_beautyData["beautyIntimacy"])
	
	self:refreshBeautyProp()
	self:refreshItemCount()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] refreshBeautyProp
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:refreshBeautyProp()
	local cpTable = self.m_componentTable
	-- 兴趣点
	cpTable["ma_interest_value_lbl"]:setString(self.m_beautyData["beautySavor"])
	-- 亲密度
	cpTable["ma_intimate_value_lbl"]:setString(self.m_beautyData["beautyIntimacy"])
	
	self.m_xingquAnim:playWhenLarger(self.m_beautyData["beautySavor"], 1)
	self.m_qinmiAnim:playWhenLarger(self.m_beautyData["beautyIntimacy"], 0.5)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] refreshItemList
-- 只用于赏赐成功后的刷新
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:refreshItemList()
	local propInfo = g_game.g_dictConfigManager:getPropById(self.m_itemPropId)
	-- 亲密度
	if propInfo[4] == 12 then
		g_game.g_userInfoManager:reduceEquipDataByPropId(self.m_itemPropId, 1)
		g_game.g_userInfoManager:changeBeautyInfoById(self.m_beautyRoleId, "beautyIntimacy", propInfo[8])
		local msgStr = ""
		
		if LANGUAGE_TYPE == 3 then
			msgStr = string.format("賞賜成功！親密度+%d！", propInfo[8])
		else
			msgStr = string.format("赏赐成功！亲密度+%d！", propInfo[8])
		end
		
		g_game.g_utilManager:showMsg(msgStr)
	end
	-- 兴趣点
	if propInfo[4] == 13 then
		g_game.g_userInfoManager:reduceEquipDataByPropId(self.m_itemPropId, 1)
		g_game.g_userInfoManager:changeBeautyInfoById(self.m_beautyRoleId, "beautySavor", propInfo[8])
		local msgStr = ""
		if LANGUAGE_TYPE == 3 then
			msgStr = string.format("賞賜成功！興趣點+%d！", propInfo[8])
		else
			msgStr = string.format("赏赐成功！兴趣点+%d！", propInfo[8])
		end
		g_game.g_utilManager:showMsg(msgStr)
	end
	
	self:refreshBeautyProp()
	self:refreshItemCount()
	
	-- 刷新汤泉行宫数据
	local tqxgPanel = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
	if tqxgPanel ~= nil then
		tqxgPanel:updateTqxgCardInfo()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] refreshItemCount
-- 刷新道具数量
-------------------------------------------------------------------------------
function f_game_beauty_award_panel:refreshItemCount()
	local cpTable = self.m_componentTable
	
	for propId,itemPanel in pairs(self.m_itemTable) do
		local count = g_game.g_userInfoManager:getItemCount(propId)
		itemPanel:setItemData(count, self.m_beautyRoleId)
	end
end
