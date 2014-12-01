require("scripts.auto.auto_delete_bottom")
require("scripts.auto.auto_gongdou_bg")
require("scripts.game.main.beauty.f_game_beauty_allbeauty_card")
--[[--
删除美女界面
--]]--
f_delete_beauty = class("f_delete_beauty")
f_delete_beauty.__index = f_delete_beauty

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_delete_beauty.static_create()
	local gongdouBg_table = g_game.g_panelManager:create_panel("gongdou_bg")
	local gongdouBg_panel = gongdouBg_table["gongdou_bg"]

	local funTable = {}
	tolua.setpeer(gongdouBg_panel, funTable)
	setmetatable(funTable, f_delete_beauty)

	gongdouBg_panel.m_gongdouBg_table = gongdouBg_table
	return gongdouBg_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_delete_beauty:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_gongdouBottomTable = nil
	
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_beautys = {}
	
	self.COL			= 5
	self.ROW			= 2
	
	self.m_current_page = 1
	self.m_lvupTargetBeauty = nil
	
	self.m_selectedPage = {}
	
	self.m_rewardLv = 0
	self.m_rewardExp = 0
	self.m_rewardIntimacy = 0
	self.m_costSilver = 0
end


-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] registerNodeEvent
-------------------------------------------------------------------------------
function f_delete_beauty:registerNodeEvent(handler)
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
-- @function [parent=#f_delete_beauty] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_delete_beauty:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] onEnter
-------------------------------------------------------------------------------
function f_delete_beauty:onEnter()
	self.m_gongdouBottomTable = createdelete_bottom()
	local bottomPanel = self.m_gongdouBottomTable["delete_bottom"]
    self:appendComponent(bottomPanel)
    bottomPanel:setAnchorPoint(cc.p(0.5,0.5))
    bottomPanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
	
	self.m_gongdouBg_table["gd_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setComponentZOrder(10)
	
	self.m_gongdouBg_table["gd_biaoti_image"]:setVisible(false)
	self.m_gongdouBg_table["gd_delete_image"]:setVisible(true)
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	self.m_gongdouBg_table["gongdou_yinliang_num"]:setString(userSilver)
	
	self:initGongDouList()
	self:initAllComponent()
	
	self:resetGongDouSelectData()
	
	self.onDelete = function()
		self:updateDeleteResult()
	end
	
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REMOVE_BEAUTY, self.onDelete)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] resetGongDouSelectData
-- 初始化 重置 宫斗 数据
-------------------------------------------------------------------------------
function f_delete_beauty:resetGongDouSelectData()
	--卖出卡牌获得银两
	self.m_gongdouBottomTable["bottom_label"]:setString("遣散后可获得银两: "..0)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] updateGongDouSelectData
-- 更新 宫斗选择吃卡的总 数据
-------------------------------------------------------------------------------
function f_delete_beauty:updateGongDouSelectData()
	local money = 0
	for i = 1 , #self.m_beautys do
		if self.m_beautys[i]["isSelected"] then
			money = money + g_game.g_dictConfigManager:getSaleBeautyValue(self.m_beautys[i]["beautyLevel"], g_game.g_dictConfigManager:getBeautyQuality(self.m_beautys[i]["beautyId"]))
		end
	end
	self.m_gongdouBottomTable["bottom_label"]:setString("遣散后可获得银两: ".. money)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] initGongDouList
-------------------------------------------------------------------------------
function f_delete_beauty:initGongDouList()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
		self.m_page_container = nil
	end
	
	self.m_current_page = 1
	self.m_item_array = {}
	self.m_item_count = 0
	self.m_total_pages = 0
	self.m_selectedPage  = {}
	
	self.m_beautys = g_game.g_userInfoManager:getDeleteableBeauty()
	self.m_item_count = table.getn(self.m_beautys)
	
	if self.m_item_count == 0 then
		return
	end
	
	--美女按照 星级排序
	local compFunc = function(beauty1Data, beauty2Data)
		local beauty1Quality = g_game.g_dictConfigManager:getBeautyQuality(beauty1Data["beautyId"])
		local beauty2Quality = g_game.g_dictConfigManager:getBeautyQuality(beauty2Data["beautyId"])
		if beauty1Quality == beauty2Quality then
			if beauty1Data["beautyLevel"] == beauty2Data["beautyLevel"] then
				return beauty1Data["beautyId"] > beauty2Data["beautyId"]
			else
				return beauty1Data["beautyLevel"] < beauty2Data["beautyLevel"]
			end
		else
			return beauty1Quality < beauty2Quality
		end
	end
	table.sort(self.m_beautys,compFunc)
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	for i = 1, self.m_total_pages do
		table.insert(self.m_selectedPage,0)
	end
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(911,500))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(20,45))
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
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 8, 10, 169,238)	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] updatePageNum
-- 更新页码
-------------------------------------------------------------------------------
function f_delete_beauty:updatePageNum()
	self.m_current_page = self.m_page_container:getCurrentPageIndex()
	self:updatePageSelectState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] updatePageSelectState
-- 更新每一页全选的state
-------------------------------------------------------------------------------
function f_delete_beauty:updatePageSelectState()
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_item_count then
		endIndex = 	self.m_item_count
	end
	
	
	local pageItemCount = endIndex - startIndex + 1
	local currentPageIsAllSelect = true
	for i = startIndex, endIndex do
		if self.m_beautys[i]["isSelected"] == true then
		
		else
			currentPageIsAllSelect = false
		end
	end
	
	if currentPageIsAllSelect == true then
		self.m_selectedPage[self.m_current_page] = 1
	else
		self.m_selectedPage[self.m_current_page] = 0
	end
	
		
	if self.m_selectedPage[self.m_current_page] == 1 then
		self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(true)
		for i = 1, #self.m_item_array do			
			local otherbeauty =  self.m_item_array[i]
			local otherIndex  =  otherbeauty:getBeautyIndex()
			
			if otherIndex >= startIndex and otherIndex <= endIndex then
				if self.m_beautys[otherIndex]["id"] == otherbeauty:getData()["id"] then	
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)				
					self.m_beautys[otherIndex]["isSelected"] = true					
				end	
			end			
		end
	else
		self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
		for i = 1, #self.m_item_array do			
			local otherbeauty =  self.m_item_array[i]
			local otherIndex  =  otherbeauty:getBeautyIndex()
			
			if otherIndex >= startIndex and otherIndex <= endIndex then
				if self.m_beautys[otherIndex]["isSelected"] == true then					
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)
				else				
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(false)				
				end	
			end		
		end
	end
	
	self:updateGongDouSelectData()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_delete_beauty:loadPageData(pageIndex)	
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
		if #self.m_beautys >= i then
			local beautyCard = f_game_beauty_allbeauty_card.static_create()
			beautyCard:panelInitBeforePopup()
			beautyCard:setSize(cc.size(169,238))
			
			beautyCard:setBeautyIndex(i)
			beautyCard:setData(self.m_beautys[i])
			beautyCard:setIsGongDou(true)
			
			beautyCard:setRemoveCallback(removeItem)
			beautyCard:setBeautyClickCallback(beautyClickCallback)

			beautyCard.m_componentTable["gd_card_xuanzhong_image"]:setVisible(self.m_beautys[i]["isSelected"])
			self.m_page_container:addComponentToPage(beautyCard, pageIndex)
			
			table.insert(self.m_item_array, beautyCard)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] selectBeautyEvent
-------------------------------------------------------------------------------
function f_delete_beauty:selectBeautyEvent(card)

	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_item_count then
		endIndex = 	self.m_item_count
	end
	
	local index = card:getBeautyIndex()
	
	for j = 1, #self.m_item_array do	
		local otherbeauty =  self.m_item_array[j]
		local otherIndex  =  otherbeauty:getBeautyIndex()
		
		if otherIndex >= startIndex and otherIndex <= endIndex then	
			if card:getData() == otherbeauty:getData() then				
				if self.m_beautys[otherIndex]["isSelected"] == true then
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(false)
					self.m_beautys[index]["isSelected"] = false
				else
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)
					self.m_beautys[index]["isSelected"] = true
				end
			end
		end
	end
	self:updatePageSelectState()
	self:updateGongDouSelectData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] removeItem
-------------------------------------------------------------------------------
function f_delete_beauty:removeItem(card)
	local index = card:getBeautyIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getBeautyIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] onExit
-------------------------------------------------------------------------------
function f_delete_beauty:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REMOVE_BEAUTY, self.onDelete)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_delete_beauty:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] onExitTransitionStart
-------------------------------------------------------------------------------
function f_delete_beauty:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] onCleanup
-------------------------------------------------------------------------------
function f_delete_beauty:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_delete_beauty:initAllComponent()
	local closeCallBack = function()
		self:deleteFromParent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_gongdouBg_table["gd_close_button"]:addHandleOfcomponentEvent(closeCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--升级
	local lvupBtnCallBack = function()
		self:deleteBeauty()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_gongdouBottomTable["gd_qiansan_button"]:addHandleOfcomponentEvent(lvupBtnCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--传递是否全选事件
	local allSelectCallBack = function()
		if self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:isCheckBoxSelectYes() then
			self:setIsSelectAllBeauty(true)
		else
			self:setIsSelectAllBeauty(false)
		end
	end
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:addHandleOfcomponentEvent(allSelectCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] setIsSelectAllBeauty
-- 是否全选当前 吞卡卡牌组
-------------------------------------------------------------------------------
function f_delete_beauty:setIsSelectAllBeauty(isSelect)
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_item_count then
		endIndex = 	self.m_item_count
	end
	
	if isSelect then
		self.m_selectedPage[self.m_current_page] = 1
	else
		self.m_selectedPage[self.m_current_page] = 0
	end
	
	for i = startIndex, endIndex do
		self.m_beautys[i]["isSelected"] = isSelect
	end
	
	for i = startIndex,endIndex do
		for j = 1, #self.m_item_array do
			if self.m_item_array[j]:getBeautyIndex() == i then
				self.m_item_array[j].m_componentTable["gd_card_xuanzhong_image"]:setVisible(self.m_beautys[i]["isSelected"])
				break
			end
		end
	end
	
	

	
	self:updateGongDouSelectData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] levelupCurSelectCard
-- 升级当前card
-------------------------------------------------------------------------------
function f_delete_beauty:deleteBeauty()
	local isPopup = false
	self.m_removeBeautys = {}
	for i = 1, #self.m_beautys do
		if self.m_beautys[i]["isSelected"] then
			table.insert(self.m_removeBeautys, {["beautyId"] = self.m_beautys[i]["id"]})
			if g_game.g_dictConfigManager:getBeautyQuality(self.m_beautys[i]["beautyId"]) >= 3 then
				isPopup = true
			end
		end
	end
	
	if isPopup  then
		
		if  self:isPopupLvupNotice() and g_game.g_userInfoManager.m_isPopupSell then
			local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
			g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
	   		--24 stand for 吞卡三星以上时
	   		popupEatLv3:popUpNotice(31)
	   		--1 stand for scale action
	   		popupEatLv3:setActionType(1)
	   		
	   		local yesEvent = function()
	   			self:sendDeleteMeg()
	   		end
	   		popupEatLv3:setYesCallBack(yesEvent)
		
		else
			self:sendDeleteMeg()
		end
	else  
		self:sendDeleteMeg()
	end

	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] isPopupLvupNotice
-- 是否弹出 升级提示面板
-------------------------------------------------------------------------------
function f_delete_beauty:isPopupLvupNotice()
	
	for i = 1, self.m_item_count do
		--canBeEaten 为 true
		local beautyId = self.m_beautys[i]["beautyId"]
		local quality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
		if self.m_beautys[i]["isSelected"] and quality >= 3 then
			return true
		end
	end
	
	return false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] sendDeleteMeg
-- 发送升级消息
-------------------------------------------------------------------------------
function f_delete_beauty:sendDeleteMeg()
	g_game.g_userInfoManager:requestRemoveBeauty(self.m_removeBeautys)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] updateDeleteResult
-- 更新删除的结果
-------------------------------------------------------------------------------
function f_delete_beauty:updateDeleteResult()
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	self.m_gongdouBg_table["gongdou_yinliang_num"]:setString(userSilver)

	self:initGongDouList()
	self:resetGongDouSelectData()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_delete_beauty] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_delete_beauty:deleteFromParent()
	 g_game.g_panelManager:removeUiPanel("gongdou_bg")
end


