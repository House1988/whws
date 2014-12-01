require("scripts.auto.auto_lianhuaSelectPanel")
--[[--
邮件面板
--]]--

f_lianhuaSelectPanel = class("f_lianhuaSelectPanel")
f_lianhuaSelectPanel.__index = f_lianhuaSelectPanel

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel.static_create()
	local mailTable = createlianhuaSelectPanel()
	local mail = mailTable["lianhuaSelectPanel"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_lianhuaSelectPanel)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:panelInitBeforePopup(datas, selects, type)
	
	self:registerNodeEvent()
	self.m_datas = datas
	self.m_selects = {}
	for i = 1, #selects do
		table.insert(self.m_selects, selects[i])
	end
	self.m_type = type
	
	self.MAX = 8
	
	self.m_items = {}
	
	self.m_total_pages = math.ceil(#self.m_datas / 8)
	self.m_componentTable["bottomlabel"]:setString("已选中" .. #self.m_selects .. "张卡牌")
	
	self.m_page = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page)
	self.m_page:setSize(cc.size(800, 480))
	self.m_page:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page:setPositionInContainer(cc.p(480,309))
    self.m_page:setStopTouchEvent(true) 
    self.m_page:enableClipping(true)

    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page:registLoadPageCallback(load)
    
    local updatePageNum = function()
    	self:updatePageNum()
    end      
    self.m_page:registMovePageCallback(updatePageNum)
   
    self.m_page:setPageInfo(#self.m_datas, 2, 4, 0, 20, 180,240)
    
    local selectAll = function()
    	if self.m_componentTable["gd_quanxuan_checkbox"]:isCheckBoxSelectYes() then
    		self:setSelectAll(true)
    	else
    		self:setSelectAll(false)
    	end
    end
    self.m_componentTable["gd_quanxuan_checkbox"]:addHandleOfcomponentEvent(selectAll,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local close = function()
		g_game.g_panelManager:removeUiPanel("lianhua_select")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jjc_close_button"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local ok = function()
		g_game.g_panelManager:removeUiPanel("lianhua_select")
		local panel = g_game.g_panelManager:getUiPanel("lianhua_panel")
		panel:setSelects(self.m_selects)
		panel:refresh()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gd_shengji_button"]:addHandleOfcomponentEvent(ok,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_lianhuaSelectPanel:updatePageNum()
	local page = self.m_page:getCurrentPageIndex()
	local startIndex = (page-1) * 8 + 1
	local endIndex = startIndex + 7
	
	local isAll = true
	for i = 1, #self.m_items do
		local item = self.m_items[i]
		if item:getIndex() <= endIndex and item:getIndex() >= startIndex and not item:isSelect() then
			isAll = false
			break
		end
	end
	self.m_componentTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(isAll)
end

function f_lianhuaSelectPanel:setSelectAll(isSelect)
	local page = self.m_page:getCurrentPageIndex()
	local startIndex = (page-1) * 8 + 1
	local endIndex = startIndex + 7
	if isSelect then
		local count = 0
		local t = {}
		for i = 1, #self.m_items do
			local item = self.m_items[i]
			if item:getIndex() <= endIndex and item:getIndex() >= startIndex and not item:isSelect() then
				count = count + 1
				table.insert(t, item)
			end
		end
		if count + #self.m_selects > self.MAX then
			self.m_componentTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
			g_game.g_utilManager:showMsg("最多只能选择" .. self.MAX .. "张卡牌")
		else
			for i = 1, #t do
				t[i]:setSelect(true)
				table.insert(self.m_selects, t[i].m_data)
			end
			self.m_componentTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(true)
		end
	else
		for i = 1, #self.m_items do
			local item = self.m_items[i]
			if item:getIndex() <= endIndex and item:getIndex() >= startIndex then
				self:removeSelect(item.m_data)
				item:setSelect(false)
			end
		end
		self.m_componentTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
	end
	self.m_componentTable["bottomlabel"]:setString("已选中" .. #self.m_selects .. "张卡牌")
end

function f_lianhuaSelectPanel:loadPageData(pageIndex)
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
	
	local remove = function(item)
		for i = 1, #self.m_items do
			if self.m_items[i] == item then
				table.remove(self.m_items, i)
			end
		end
	end
	
	local startIndex = (pageIndex-1) * 8 + 1
	local endIndex = math.min(startIndex + 7, #self.m_datas)
	
	for i = startIndex, endIndex do
		local item = require("scripts.game.main.lianhua.f_lianhuaSelectItem").new()
		self.m_page:addComponentToPage(item, pageIndex)			
		item:setData(self.m_datas[i], self.m_type, itemCallback)	
		item:setIndex(i)
		item:setRemove(remove)
		item:setSelect(self:isDataSelect(self.m_datas[i]))
		table.insert(self.m_items, item)						
	end
	if pageIndex == self.m_page:getCurrentPageIndex() then
		self:updatePageNum()
	end
end

function f_lianhuaSelectPanel:isDataSelect(data)
	for i = 1, #self.m_selects do
		if self.m_selects[i] == data then
			return true
		end
	end
	return false
end

function f_lianhuaSelectPanel:removeSelect(data)
	for i = 1, #self.m_selects do
		if self.m_selects[i] == data then
			table.remove(self.m_selects, i)
			return
		end
	end
end

function f_lianhuaSelectPanel:updateSelectItem(item)
	if item:isSelect() then
		item:setSelect(false)
		self:removeSelect(item.m_data)
	else
		if not self:isDataSelect(item.m_data) then
			if #self.m_selects >= self.MAX then
				item:setSelect(false)
				g_game.g_utilManager:showMsg("最多只能选择" .. self.MAX .. "张卡牌")
			else
				table.insert(self.m_selects, item.m_data)
				item:setSelect(true)
			end
		end
	end
	self.m_componentTable["bottomlabel"]:setString("已选中" .. #self.m_selects .. "张卡牌")
end

function f_lianhuaSelectPanel:registerNodeEvent(handler)
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
-- @function [parent=#f_lianhuaSelectPanel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] onEnter
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] onExit
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] onCleanup
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectPanel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lianhuaSelectPanel:initAllComponent()

end