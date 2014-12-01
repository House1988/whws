require("scripts.auto.auto_tujian_ui")
require("scripts.game.main.tujian.f_tujian_card")

f_tujian_panel = class("f_tujian_panel")
f_tujian_panel.__index = f_tujian_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] static_create
-------------------------------------------------------------------------------
function f_tujian_panel.static_create()
	local infoTable = createtujian_ui()
	local panel = infoTable["tujian_ui"]
	
	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_tujian_panel)
	panel.m_componentTable = infoTable
	panel:initAllComponent()
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_tujian_panel:registerNodeEvent(handler)
    if not handler then
        handler = function(event)
            if event == "enter" then
--                self:onEnter()
            elseif event == "exit" then
                self:onExit()
            elseif event == "enterTransitionFinish" then
--                self:onEnterTransitionFinish()
            elseif event == "exitTransitionStart" then
--                self:onExitTransitionStart()
            elseif event == "cleanup" then
--                self:onCleanup()
            end
        end
    end
    self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_tujian_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] onExit
-------------------------------------------------------------------------------
function f_tujian_panel:onExit()
  	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL, self.event_refreshTujianCallback)

	
   	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_tujian_panel:initAllComponent()
	self:registerNodeEvent()
	
	local cpTable = self.m_componentTable
	
	self.m_currBtnIndex = 0
	self.m_radioBtn = {}
	
	self.m_total_pages = 0
	self.COL = 6
	self.ROW = 3
	self.m_card_array = {}
	
	-- 凌烟阁(名臣)
    local lingyangeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self:changePage(1)
	end
	self.m_radioBtn[1] = cpTable["tj_lingyange_btn"]
	cpTable["tj_lingyange_btn"]:addHandleOfcomponentEvent(lingyangeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	cpTable["tj_lingyange_btn"]:setRadioButtonState(1)
	
	-- 铜雀台(美女)
    local tongquetaiBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self:changePage(2)
	end
	self.m_radioBtn[2] = cpTable["tj_tongquetai_btn"]
	cpTable["tj_tongquetai_btn"]:addHandleOfcomponentEvent(tongquetaiBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 军械库(装备)
    local junxiekuBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self:changePage(3)
	end
	self.m_radioBtn[3] = cpTable["tj_junxieku_btn"]
	cpTable["tj_junxieku_btn"]:addHandleOfcomponentEvent(junxiekuBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 文渊阁(兵法)
    local wenyuangeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self:changePage(4)
	end
	self.m_radioBtn[4] = cpTable["tj_wenyuange_btn"]
	cpTable["tj_wenyuange_btn"]:addHandleOfcomponentEvent(wenyuangeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 关闭按钮
    local closeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("tujian_panel")
	end
	cpTable["tj_close_button"]:addHandleOfcomponentEvent(closeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_tujianOfficerTable = nil
	self.officerTotalCount = 0
	self.officerHaveCount = 0
	
	self.m_tujianBeautyTable = nil
	self.beautyTotalCount = 0
	self.beautyHaveCount = 0
	
	self.m_tujianEquipTable = nil
	self.equipTotalCount = 0
	self.equipHaveCount = 0
	
	self.m_tujianBingfaTable = nil
	self.bingfaTotalCount = 0
	self.bingfaHaveCount = 0
	
	--注册监听刷新函数
	self.event_refreshTujianCallback = function()
		self:refreshTujianPagePanel()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL, self.event_refreshTujianCallback)
	
	-- 默认显示第一页
	self:changePage(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] changePage
-------------------------------------------------------------------------------
function f_tujian_panel:changePage(index)
	if index ~= self.m_currBtnIndex then
		if self.m_currBtnIndex > 0 then
			self.m_radioBtn[self.m_currBtnIndex]:setRadioButtonState(2)
		end
		
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		local sendMsg = {["uid"] = userInfo["roleId"]}
		if index == 1 then
			g_game.g_netManager:send_message(g_network_message_type.CS_OFFICER_TITLE_BLOCK, sendMsg)
		elseif index == 2 then
			g_game.g_netManager:send_message(g_network_message_type.CS_BEAUTY_TITLE_BLOCK, sendMsg)
		elseif index == 3 then
			g_game.g_netManager:send_message(g_network_message_type.CS_EQUIP_TITLE_BLOCK, sendMsg)
		elseif index == 4 then
			g_game.g_netManager:send_message(g_network_message_type.CS_BING_FA_TITLE_BLOCK, sendMsg)
		end
	end
	
	self.m_currBtnIndex = index
	self.m_radioBtn[index]:setRadioButtonState(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] loadPageData
-------------------------------------------------------------------------------
function f_tujian_panel:loadPageData(pageIndex)
	if pageIndex < 0 or pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local startIndex = self.COL*self.ROW*(pageIndex-1)+1
	
	if self.m_currBtnIndex == 1 then
		local endIndex = ((startIndex+17) < #self.m_tujianOfficerTable) and (startIndex+17) or #self.m_tujianOfficerTable
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianOfficerTable()
		
		for i=startIndex,endIndex do
			local cardInfo = self.m_tujianOfficerTable[i]
			local card = f_tujian_card.static_create()
			self.m_page_container:addComponentToPage(card, pageIndex)
			card:setSize(cc.size(124,136))
			card:setCardBg(g_game.g_f_quality_image[cardInfo["q"]])
			card:setCardImage(cardInfo["image"], tujianCardTable[cardInfo["id"]] == nil)
			card:setCardName(cardInfo["name"])
			card:setIdAndType(cardInfo["id"], self.m_currBtnIndex)
			table.insert(self.m_card_array, card)
		end
	elseif self.m_currBtnIndex == 2 then
		local endIndex = ((startIndex+17) < #self.m_tujianBeautyTable) and (startIndex+17) or #self.m_tujianBeautyTable
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianBeautyTable()
		
		for i=startIndex,endIndex do
			local cardInfo = self.m_tujianBeautyTable[i]
			local card = f_tujian_card.static_create()
			self.m_page_container:addComponentToPage(card, pageIndex)
			card:setSize(cc.size(124,136))
			card:setCardBg(g_game.g_f_quality_image[cardInfo["q"]])
			card:setCardImage(cardInfo["image"], tujianCardTable[cardInfo["id"]] == nil)
			card:setCardName(cardInfo["name"])
			card:setIdAndType(cardInfo["id"], self.m_currBtnIndex)
			table.insert(self.m_card_array, card)
		end
	elseif self.m_currBtnIndex == 3 then
		local endIndex = ((startIndex+17) < #self.m_tujianEquipTable) and (startIndex+17) or #self.m_tujianEquipTable
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianEquipTable()
		
		for i=startIndex,endIndex do
			local cardInfo = self.m_tujianEquipTable[i]
			local card = f_tujian_card.static_create()
			self.m_page_container:addComponentToPage(card, pageIndex)
			card:setSize(cc.size(124,136))
			card:setCardBg(g_game.g_f_quality_image[cardInfo["q"]])
			card:setCardImage(cardInfo["image"], tujianCardTable[cardInfo["id"]] == nil)
			card:setCardName(cardInfo["name"])
			card:setIdAndType(cardInfo["id"], self.m_currBtnIndex)
			table.insert(self.m_card_array, card)
		end
	elseif self.m_currBtnIndex == 4 then
		local endIndex = ((startIndex+17) < #self.m_tujianBingfaTable) and (startIndex+17) or #self.m_tujianBingfaTable
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianBingfaTable()
		
		for i=startIndex,endIndex do
			local cardInfo = self.m_tujianBingfaTable[i]
			local card = f_tujian_card.static_create()
			self.m_page_container:addComponentToPage(card, pageIndex)
			card:setSize(cc.size(124,136))
			card:setCardBg(g_game.g_f_quality_image[cardInfo["q"]])
			card:setCardImage(cardInfo["image"], tujianCardTable[cardInfo["id"]] == nil)
			card:setCardName(cardInfo["name"])
			card:setIdAndType(cardInfo["id"], self.m_currBtnIndex)
			table.insert(self.m_card_array, card)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] updatePageNum
-------------------------------------------------------------------------------
function f_tujian_panel:updatePageNum()
	self.m_currPageIndex = self.m_page_container:getCurrentPageIndex()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] refreshTujianPagePanel
-- 刷新图鉴内容
-------------------------------------------------------------------------------
function f_tujian_panel:refreshTujianPagePanel()
	local tujianCardTable = nil
	if self.m_currBtnIndex == 1 then
		self:loadOfficerTujianPage()
	elseif self.m_currBtnIndex == 2 then
		self:loadBeautyTujianPage()
	elseif self.m_currBtnIndex == 3 then
		self:loadEquipTujianPage()
	elseif self.m_currBtnIndex == 4 then
		self:loadBingfaTujianPage()
	end
end

function f_tujian_panel:sortData(t)
	local sort = function(data1, data2)
		if data1["q"] == data2["q"] then
			return data1["id"] > data2["id"]
		end
		return data1["q"] > data2["q"]
	end
	
	table.sort(t, sort)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] loadOfficerTujianPage
-------------------------------------------------------------------------------
function f_tujian_panel:loadOfficerTujianPage()
	if self.m_tujianOfficerTable == nil then
		self.m_tujianOfficerTable = {}
		local officerCardTable = g_game.g_dictConfigManager:getOfficerCardTable()
		for id,tbl in pairs(officerCardTable) do
			if tbl[13] == 1 then
				local imagePath, q, name = g_game.g_dictConfigManager:getResByType(3, tbl[1])
				local cardInfo = {}
				cardInfo["id"] = tbl[1]
				cardInfo["image"] = imagePath
				cardInfo["q"] = q
				cardInfo["name"] = name
				table.insert(self.m_tujianOfficerTable, cardInfo)
				self.officerTotalCount = self.officerTotalCount + 1
			end
		end
		self:sortData(self.m_tujianOfficerTable)
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianOfficerTable()
		for id,card in pairs(tujianCardTable) do
			self.officerHaveCount = self.officerHaveCount + 1
		end
	end
	
	-- 显示收集进度
	if LANGUAGE_TYPE == 3 then
	    self.m_componentTable["tj_jindu_lbl"]:setString("名臣收集進度")  
    else
    	self.m_componentTable["tj_jindu_lbl"]:setString("名臣收集进度")
    end
	self.m_componentTable["tj_card_count_lbl"]:setString(self.officerHaveCount .. "/" .. self.officerTotalCount)
	
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_currPageIndex = 1
	
	self.m_page_container = fc.FContainerPage:create(2)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(840,486))
	self.m_page_container:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page_container:setPositionInContainer(cc.p(472,363))
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
	
	self.m_total_pages = math.ceil(#self.m_tujianOfficerTable/(3*6))
	self.m_page_container:setPageInfo(#self.m_tujianOfficerTable, self.ROW, self.COL, 19, 13, 124, 136)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] loadBeautyTujianPage
-------------------------------------------------------------------------------
function f_tujian_panel:loadBeautyTujianPage()
	if self.m_tujianBeautyTable == nil then
		self.m_tujianBeautyTable = {}
		local beautyCardTable = g_game.g_dictConfigManager:getBeautyCardTable()
		for id,tbl in pairs(beautyCardTable) do
			local imagePath, q, name = g_game.g_dictConfigManager:getResByType(2, tbl[1])
			local cardInfo = {}
			cardInfo["id"] = tbl[1]
			cardInfo["image"] = imagePath
			cardInfo["q"] = q
			cardInfo["name"] = name
			table.insert(self.m_tujianBeautyTable, cardInfo)
			self.beautyTotalCount = self.beautyTotalCount + 1
		end
		self:sortData(self.m_tujianBeautyTable)
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianBeautyTable()
		for id,card in pairs(tujianCardTable) do
			self.beautyHaveCount = self.beautyHaveCount + 1
		end
	end
	
	-- 显示收集进度
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["tj_jindu_lbl"]:setString("美女收集進度")
	else
		self.m_componentTable["tj_jindu_lbl"]:setString("美女收集进度")
	end
	self.m_componentTable["tj_card_count_lbl"]:setString(self.beautyHaveCount .. "/" .. self.beautyTotalCount)
	
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_currPageIndex = 1
	
	self.m_page_container = fc.FContainerPage:create(2)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(840,486))
	self.m_page_container:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page_container:setPositionInContainer(cc.p(472,363))
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
	
	self.m_total_pages = math.ceil(#self.m_tujianBeautyTable/(3*6))
	self.m_page_container:setPageInfo(#self.m_tujianBeautyTable, self.ROW, self.COL, 19, 13, 124, 136)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] loadEquipTujianPage
-------------------------------------------------------------------------------
function f_tujian_panel:loadEquipTujianPage()
	if self.m_tujianEquipTable == nil then
		self.m_tujianEquipTable = {}
		local equipCardTable = g_game.g_dictConfigManager:getEquipmentCardTable()
		for id,tbl in pairs(equipCardTable) do
			if tbl[6] <= 2 then
				local imagePath, q, name = g_game.g_dictConfigManager:getResByType(6, tbl[1])
				local cardInfo = {}
				cardInfo["id"] = tbl[1]
				cardInfo["image"] = imagePath
				cardInfo["q"] = q
				cardInfo["name"] = name
				table.insert(self.m_tujianEquipTable, cardInfo)
				self.equipTotalCount = self.equipTotalCount + 1
			end
		end
		self:sortData(self.m_tujianEquipTable)
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianEquipTable()
		for id,card in pairs(tujianCardTable) do
			self.equipHaveCount = self.equipHaveCount + 1
		end
	end
	
	-- 显示收集进度
	if LANGUAGE_TYPE == 3 then
	    self.m_componentTable["tj_jindu_lbl"]:setString("裝備收集進度")  
    else
    	self.m_componentTable["tj_jindu_lbl"]:setString("装备收集进度")
    end
	
	self.m_componentTable["tj_card_count_lbl"]:setString(self.equipHaveCount .. "/" .. self.equipTotalCount)
	
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_currPageIndex = 1
	
	self.m_page_container = fc.FContainerPage:create(2)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(840,486))
	self.m_page_container:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page_container:setPositionInContainer(cc.p(472,363))
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
    
	self.m_total_pages = math.ceil(#self.m_tujianEquipTable/(3*6))
	self.m_page_container:setPageInfo(#self.m_tujianEquipTable, self.ROW, self.COL, 19, 13, 124, 136)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_panel] loadBingfaTujianPage
-------------------------------------------------------------------------------
function f_tujian_panel:loadBingfaTujianPage()
	if self.m_tujianBingfaTable == nil then
		self.m_tujianBingfaTable = {}
		local equipCardTable = g_game.g_dictConfigManager:getEquipmentCardTable()
		for id,tbl in pairs(equipCardTable) do
			if tbl[6] == 3 then
				local imagePath, q, name = g_game.g_dictConfigManager:getResByType(6, tbl[1])
				local cardInfo = {}
				cardInfo["id"] = tbl[1]
				cardInfo["image"] = imagePath
				cardInfo["q"] = q
				cardInfo["name"] = name
				table.insert(self.m_tujianBingfaTable, cardInfo)
				self.bingfaTotalCount = self.bingfaTotalCount + 1
			end
		end
		self:sortData(self.m_tujianBingfaTable)
		
		local tujianCardTable = g_game.g_userInfoManager:getTujianBingfaTable()
		for id,card in pairs(tujianCardTable) do
			self.bingfaHaveCount = self.bingfaHaveCount + 1
		end
	end
	
	-- 显示收集进度
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["tj_jindu_lbl"]:setString("兵法收集進度")
	else
		self.m_componentTable["tj_jindu_lbl"]:setString("兵法收集进度")
	end
	self.m_componentTable["tj_card_count_lbl"]:setString(self.bingfaHaveCount .. "/" .. self.bingfaTotalCount)
	
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_currPageIndex = 1
	
	self.m_page_container = fc.FContainerPage:create(2)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(840,486))
	self.m_page_container:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page_container:setPositionInContainer(cc.p(472,363))
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
	
	self.m_total_pages = math.ceil(#self.m_tujianBingfaTable/(3*6))
	self.m_page_container:setPageInfo(#self.m_tujianBingfaTable, self.ROW, self.COL, 19, 13, 124, 136)
end
