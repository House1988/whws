require("scripts.game.main.beauty.f_game_beauty_cefeng_list_title")

--[[
	动态list  
]]--

local f_game_beauty_cefeng_list = class("f_game_beauty_cefeng_list",function()
	return g_game.g_classFactory.newFLuaContainerList("f_game_beauty_cefeng_list",2)
	end
)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list:ctor()      
  
    self.m_components_arr = {}
    
    self.m_targetBeauty = nil
    self.m_selectTitle = nil
	
	self.m_cefengCallBack = nil
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] setTargetBeauty
-- target 
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list:setTargetBeauty(beauty)
	self.m_targetBeauty = beauty
end	


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] onEnter
-- on
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list:onEnter()
	local len = g_game.g_dictConfigManager:getTitleLen()
	local listData = g_game.g_dictConfigManager:getCefengTitleList()
	local data = self.m_targetBeauty:getData()

	for i = 1, len do
		if listData[i] ~= nil then
			local title = f_game_beauty_cefeng_list_title.static_create()
			title:panelInitBeforePopup()
			title:setSize(cc.size(244,487))
			title:setTitleIndex(i)
			
			local titleSelectCallback = function(selectTitle)
				self:selectTitleEvent(selectTitle)
			end
			title:setClickCallback(titleSelectCallback)
			
			local cefengCallback = function(titleIndex)
				self.m_cefengCallBack(titleIndex)
			end
			title:setCefengCallback(cefengCallback)
			title:setTargetBeautyData(data)
			self:appendComponent(title)
			self.m_components_arr[i] = title
		end
	end
	
	-- 赏赐后刷新界面
	self.m_refreshCefengPanel = function()
		self:refreshCefengList()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_CEFENG_PANEL, self.m_refreshCefengPanel)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] setCefengCallBack
-- 设置册封  回调
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list:setCefengCallBack(callback)
	self.m_cefengCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] selectTitleEvent
-- 设置选择回调
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list:selectTitleEvent(title)
	self.m_selectTitle  = title
	local index  = self.m_selectTitle:getTitleIndex()
	print ("Index:::" .. self.m_selectTitle:getTitleIndex())
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] getSelectBeauty
-- 获取选择的 beauty
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list:getSelectBeauty()
	return self.m_selectBeauty
end


function f_game_beauty_cefeng_list:onExit()    
    self:unregisterNodeEvent()
    self.m_components_arr = {}
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_CEFENG_PANEL, self.m_refreshCefengPanel)
end

function f_game_beauty_cefeng_list:onEnterTransitionFinish()
end

function f_game_beauty_cefeng_list:onExitTransitionStart()
end

function f_game_beauty_cefeng_list:onCleanup()
end


function f_game_beauty_cefeng_list:registerNodeEvent(handler)
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

function f_game_beauty_cefeng_list:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

----------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list] refreshCefengList
----------------------------------------------------------------------
function f_game_beauty_cefeng_list:refreshCefengList()
	local len = g_game.g_dictConfigManager:getTitleLen()
	local listData = g_game.g_dictConfigManager:getCefengTitleList()
	local data = self.m_targetBeauty:getData()
	
	for i = 1, len do
		if listData[i] ~= nil then
			local title = self.m_components_arr[i]
			title:setTargetBeautyData(data)
		end
	end
end

return f_game_beauty_cefeng_list