--[[
	继承自container panel, 用于显示服务器列表
]]--

require("scripts.auto.auto_login_xuanfu_list_new")

local f_new_server_list_panel = class("f_new_server_list_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_new_server_list_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_new_server_list_panel:ctor()    
    self:registerNodeEvent()   
    
	self.json   = require("prescripts.framework.json")
	
	self:setSize(cc.size(783,535))	
	
	self.m_is_show = true
	
	self.m_server_cache_list = nil
	self.m_server_info_list = nil
	
	self.m_server_select_callback = nil
	self.m_server_click_callback = nil
	
	self.m_select_info = nil
	
	self.m_user_account = ""
	
	self.m_item_array = {}
	self.m_cache_item_array = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_new_server_list_panel:onEnter()   
	
	self:initAllComponent()
	
end


function f_new_server_list_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_new_server_list_panel:onEnterTransitionFinish()
end

function f_new_server_list_panel:onExitTransitionStart()
end

function f_new_server_list_panel:onCleanup()
end


function f_new_server_list_panel:registerNodeEvent(handler)
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

function f_new_server_list_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_new_server_list_panel:initAllComponent()	

	local serverListPanel_table = createlogin_xuanfu_list_new()
	self.m_server_list_panel = serverListPanel_table["login_xuanfu_list_new"]	
	self.m_componentTable = serverListPanel_table
	
	self:appendComponent(self.m_server_list_panel)	
	self.m_server_list_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_server_list_panel:setPositionInContainer(cc.p(783/2, 535/2))
	
	self.m_upTable = fc.FContainerTable:create(2)
	self.m_upTable:setSize(cc.size(763,95))
	self.m_upTable:setTableInfo(3,2,0,5,372,46)
	self.m_server_list_panel:appendComponent(self.m_upTable)
	self.m_upTable:setStopTouchEvent(true)	
	self.m_upTable:enableClipping(true)
	self.m_upTable:setAnchorPoint(cc.p(0,1))
	self.m_upTable:setPositionInContainer(cc.p(13,50))
	
	self.m_downTable = fc.FContainerTable:create(2)
	self.m_downTable:setSize(cc.size(763,332))
	self.m_downTable:setTableInfo(3,2,0,5,372,46)
	self.m_server_list_panel:appendComponent(self.m_downTable)
	self.m_downTable:setStopTouchEvent(true)	
	self.m_downTable:enableClipping(true)
	self.m_downTable:setAnchorPoint(cc.p(0,1))
	self.m_downTable:setPositionInContainer(cc.p(13,193))
	
	local close = function()
		self:setVisible(false)
	end
	self.m_componentTable["guan_bi"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_componentTable["guan_bi"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] setUserAccount
-- 设置当前帐户
-------------------------------------------------------------------------------
function f_new_server_list_panel:setUserAccount(account)
	self.m_user_account = account
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] fillServerList
-- 填充服务器列表
-------------------------------------------------------------------------------
function f_new_server_list_panel:fillServerList(listData)	
	for i = 1, #self.m_cache_item_array do
		self.m_upTable:deleteComponent(self.m_cache_item_array[i])
	end
	for i = 1, #self.m_item_array do
		self.m_downTable:deleteComponent(self.m_item_array[i])
	end

	self.m_item_array = {}
	self.m_cache_item_array = {}

	self.m_server_info_list = self.json.decode(listData)
	self.m_server_cache_list = g_game.g_dataManager:getCacheServerInfo(self.m_user_account)
	
	local callback = function(index)
		self:serverSelect(index)
		if self.m_server_click_callback then
			self.m_server_click_callback()
		end
	end
	
	
	local testServerInfo = nil
	if self.m_server_info_list then
		local itemCount = 1
		for i, v in ipairs(self.m_server_info_list) do
			local item = require("scripts.game.login.f_new_server_item_panel").new()
			item:setData(v)
			item:setIndex(itemCount)
			item:setItemSelectClick(callback)
			self.m_downTable:appendComponent(item)
			table.insert(self.m_item_array, item)	
			itemCount = itemCount + 1
			
			if v["test_server"] ~= nil then
				testServerInfo = v["test_server"]
			end
		end	
		if testServerInfo ~= nil then
			local hasAppVersion = function(t)					
				for i = 1, #t do
					if tonumber(t[i]) == APP_VERSION then
						return true
					end
				end
				return false
			end
			
			local hasResourceVersion = function(t)			
				for i = 1, #t do
					if tonumber(t[i]) == RESOURCE_VERSION then
						return true
					end
				end
				return false
			end
			
			local hasChannel = function(t)
				for i = 1, #t do
					if tonumber(t[i]) == DEBUG_SDK_TYPE then
						return true
					end
				end
			end
		
			local test_server_list = testServerInfo["server_list"]
			local test_server_appversion = testServerInfo["app_version"]
			local test_server_resourceversion = testServerInfo["resource_version"]
			
			
			for i, v in ipairs(test_server_list) do					
				if hasAppVersion(v["app_version"])==true and hasResourceVersion(v["resource_version"])==true and hasChannel(v["channel_list"])==true then
					local item = require("scripts.game.login.f_new_server_item_panel").new()
					item:setData(v)
					item:setIndex(itemCount)
					item:setItemSelectClick(callback)
					self.m_downTable:appendComponent(item)
					table.insert(self.m_item_array, item)	
					itemCount = itemCount + 1
					
					table.insert(self.m_server_info_list,v)
				end
			end
		end	
	end
	
	for i = 1, #self.m_server_cache_list do
		local tempCacheItemdata = nil
	
		for j, v in ipairs(self.m_server_info_list) do
			if v["name"] == self.m_server_cache_list[i]["name"] then
				tempCacheItemdata = v
				break
			end
		end

		if tempCacheItemdata ~= nil then			
			local item = require("scripts.game.login.f_new_server_item_panel").new()
			item:setData(tempCacheItemdata)
			item:setIndex(1000+i)
			item:setItemSelectClick(callback)
			
			self.m_upTable:appendComponent(item)
			table.insert(self.m_cache_item_array, item)	
		end
	end
	
	if #self.m_server_cache_list > 0 then
		self:serverSelect(1000+1)
	else
		self:serverSelect(1)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] serverSelect
-- 服务器选择回调
-------------------------------------------------------------------------------
function f_new_server_list_panel:serverSelect(index)
	if index > 1000 then
		local cacheIndex = index - 1000			
		for i = 1, #self.m_cache_item_array do
			if i == cacheIndex then
				self.m_cache_item_array[i]:setSelect(true)
			else
				self.m_cache_item_array[i]:setSelect(false)
			end			
		end		
		
		for i = 1, #self.m_item_array do
			self.m_item_array[i]:setSelect(false)	
		end
		
		self.m_select_info = nil
		if self.m_server_info_list then
			for j = 1, #self.m_server_info_list do
				if self.m_server_info_list[j]["name"] == self.m_server_cache_list[cacheIndex]["name"] then
					self.m_select_info = self.m_server_info_list[j]
					break
				end
			end
		end
		if self.m_select_info == nil then
			self.m_select_info = self.m_server_info_list[1]
		end
	else		
		for i = 1, #self.m_cache_item_array do
			self.m_cache_item_array[i]:setSelect(false)		
		end	
		for i = 1, #self.m_item_array do
			if i == index then
				self.m_item_array[i]:setSelect(true)
			else
				self.m_item_array[i]:setSelect(false)
			end			
		end
		if self.m_server_info_list then
			self.m_select_info = self.m_server_info_list[index]
		end
	end
	
	if self.m_server_select_callback and self.m_select_info then
		self.m_server_select_callback(self.m_select_info["name"])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] setServerSelectCallback
-- 服务器选择回调
-------------------------------------------------------------------------------
function f_new_server_list_panel:setServerSelectCallback(callback)
	self.m_server_select_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] setServerClickCallback
-- 服务器点击回调
-------------------------------------------------------------------------------
function f_new_server_list_panel:setServerClickCallback(callback)
	self.m_server_click_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_list_panel] getSelectServerInfo
-- 获取选择的服务器
-------------------------------------------------------------------------------
function f_new_server_list_panel:getSelectServerInfo()
	return self.m_select_info
end

return f_new_server_list_panel