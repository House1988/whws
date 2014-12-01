require("scripts.game.main.equipBag.f_game_item")

--[[
	动态list  
]]--

local f_game_item_list = class("f_game_item_list",function()
	return g_game.g_classFactory.newFLuaContainerPanel("f_game_item_list")
	end
)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_item_list:ctor()      
  
    self.m_components_arr = {}
    self.m_selectIndex = 0
	
	self.m_selectCallback = nil
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] setType
-- 设置list类别
-------------------------------------------------------------------------------
function f_game_item_list:setType(type, isSelect)
	self.m_type = type
	self.m_isSelect = isSelect
end

function f_game_item_list:setTextCallback(callback)
	self.m_textCallback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] onEnter
-- on
-------------------------------------------------------------------------------
function f_game_item_list:onEnter()

	self.onSell = function()
		self:updateDisplay()
		g_game.g_panelManager:removeUiPanel("sell_popup")
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SELL_EQUIP, self.onSell)
	
	self.refreshEquip = function()
		if self.m_type ~= 3 then
			self:refreshEquipItem()
		end
	end
	
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP, self.refreshEquip)
	
	self:updateDisplay()
end

function f_game_item_list:updateDisplay()
	
    local sort = function(e1, e2)
    	local star1 = g_game.g_dictConfigManager:getEquipStar(e1["equip_id"])
		local star2 = g_game.g_dictConfigManager:getEquipStar(e2["equip_id"])
		if star1 == star2 then
			if e1["equip_level"] == e2["equip_level"] then
				return e1["equip_id"] > e2["equip_id"]
			else
				return  e1["equip_level"] >  e2["equip_level"]
			end
		else
			return star1 > star2
		end
    end
	
	self.m_dataList = {}
	if self.m_type == 3 then
		local items = g_game.g_userInfoManager:getUserEquipData()
		self.m_dataList = items["propList"]
	elseif self.m_type == 1 then
		self.m_dataList = g_game.g_userInfoManager:getWeaponList(not self.m_isSelect)
	elseif self.m_type == 2 then
		self.m_dataList = g_game.g_userInfoManager:getArmorList(not self.m_isSelect)
	else
		self.m_dataList = g_game.g_userInfoManager:getBingfaList(not self.m_isSelect)
	end
	if self.m_type ~= 3 then
		table.sort(self.m_dataList, sort)
	end
	
	local num = #self.m_dataList
	
	if num == 0 then
		return
	end
	
	local current = 1
	if self.m_page ~= nil then
		current = self.m_page:getCurrentPageIndex()
		self:deleteComponent(self.m_page)
	end
	self.m_total_pages = math.ceil(num / 4)
	if current > self.m_total_pages then
		current = self.m_total_pages
	end
	
	self:setSize(cc.size(940, 520))
	self.m_page = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page)
	self.m_page:setSize(cc.size(940,520))
	self.m_page:setAnchorPoint(cc.p(0,1))
	self.m_page:setPositionInContainer(cc.p(0, -10))
    self.m_page:setStopTouchEvent(true) 
    self.m_page:enableClipping(true)
	
	local load = function(index)
		self:loadPage(index)
	end
	
	local onPageMove = function()
		self.m_textCallback(self.m_page:getCurrentPageIndex() .. "/" .. self.m_total_pages)
	end
	self.m_page:registMovePageCallback(onPageMove)

	self.m_page:registLoadPageCallback(load)
	
	self.m_page:setPageInfoAndIndex(num, 1, 4, 0, 0, 235, 520, current)
	
	self.m_textCallback(self.m_page:getCurrentPageIndex() .. "/" .. self.m_total_pages)
end

function f_game_item_list:loadPage(pageIndex)
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page:needLoadPage(pageIndex) then
		return
	end
		
	local itemCallback = function(card)
		self:updateSelectItem(card)
	end
	
	local removeItem = function(card)
		self:onRemoveItem(card)
	end
	
	local startIndex = (pageIndex-1) * 4 + 1
	local endIndex = math.min(startIndex + 3, #self.m_dataList)
	
	for i = startIndex, endIndex do
	
		local item = f_game_item.static_create()
		item:panelInitBeforePopup()
		item:setSize(cc.size(251,520))
		item:setIndex(i)
		item:setData(self.m_dataList[i], self.m_type)
		item:setRemoveCallback(removeItem)
		
		local itemSelectCallback = function(item)
			self:itemSelectCallback(item)
		end
		item:setClickCallback(itemSelectCallback)
		
		if i == 1 then
			self.m_selectIndex = 1
			item.m_componentTable["card_select"]:setVisible(true)
			self.m_selectCallback(item)
		else
			item.m_componentTable["card_select"]:setVisible(false)
		end
		
		self.m_page:addComponentToPage(item, pageIndex)
		table.insert(self.m_components_arr,item)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] refreshEquipItem
-- 刷新显示装备
-------------------------------------------------------------------------------
function f_game_item_list:refreshEquipItem()
	for i = 1, #self.m_components_arr do
		local data = self.m_components_arr[i]:getData()
		if data == g_game.g_userInfoManager.m_upgradeEquip then
			self.m_components_arr[i]:setData(data, self.m_type)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] itemSelectCallback
-- 获取选择的 beauty
-------------------------------------------------------------------------------
function f_game_item_list:itemSelectCallback(item)
	self.m_selectIndex = item.m_index
	local index = item.m_index
	
	for i = 1, #self.m_components_arr do
		if self.m_components_arr[i]:getIndex() == index then
			self.m_components_arr[i].m_componentTable["card_select"]:setVisible(true)
		else
			self.m_components_arr[i].m_componentTable["card_select"]:setVisible(false)
		end
	end
	
	if self.m_selectCallback ~= nil then
		self.m_selectCallback(item)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] setSelectCallback
--set选择 items
-------------------------------------------------------------------------------
function f_game_item_list:setSelectCallback(callback)
	self.m_selectCallback = callback
end

function f_game_item_list:onRemoveItem(item)
	for i = 1, #self.m_components_arr do
		if self.m_components_arr[i] == item then
			table.remove(self.m_components_arr, i)
			return
		end
	end
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_list] getSelectItem
-- 获取选择的 beauty
-------------------------------------------------------------------------------
function f_game_item_list:getSelectData()
	if self.m_selectIndex < 1 then
		return nil
	end
	return self.m_dataList[self.m_selectIndex]
end

function f_game_item_list:getItemByData(data)
	for i = 1, #self.m_components_arr do
		if self.m_components_arr[i].m_data == data then
			return self.m_components_arr[i]
		end
	end
	return nil
end

function f_game_item_list:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SELL_EQUIP, self.onSell)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP, self.refreshEquip)
    self.m_components_arr = {}
end

function f_game_item_list:onEnterTransitionFinish()
end

function f_game_item_list:onExitTransitionStart()
end

function f_game_item_list:onCleanup()
end


function f_game_item_list:registerNodeEvent(handler)
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

function f_game_item_list:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_game_item_list