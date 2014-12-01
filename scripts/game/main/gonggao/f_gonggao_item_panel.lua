--[[
	继承自container panel, 用于显示公告列表
]]--

require("scripts.auto.auto_gonggaoItem")

local f_gonggaoItem = class("f_gonggaoItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_gonggaoItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_gonggaoItem:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(216, 70))	
	
	self.m_data = nil
	self.m_index = 0
	self.m_item_select_callback = nil
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_gonggaoItem:onEnter() 
	self:enableClipping(true)
	
end


function f_gonggaoItem:onExit()    
    self:unregisterNodeEvent()
end

function f_gonggaoItem:onEnterTransitionFinish()
end

function f_gonggaoItem:onExitTransitionStart()
end

function f_gonggaoItem:onCleanup()
end


function f_gonggaoItem:registerNodeEvent(handler)
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

function f_gonggaoItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] setSelect
-- 设置选中状态
-------------------------------------------------------------------------------
function f_gonggaoItem:setSelect(isSelect)	
	self.m_componentTable["bgdark"]:setVisible(isSelect)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_gonggaoItem:initAllComponent()	
	local gonggaoItemTable = creategonggaoItem()
	self.gonggaoItem = gonggaoItemTable["gonggaoItem"]	
	self.m_componentTable = gonggaoItemTable
	
	self:appendComponent(self.gonggaoItem)
	
	self.gonggaoItem:setAnchorPoint(cc.p(0.5, 0.5))
	self.gonggaoItem:setPositionInContainer(cc.p(216/2, 70/2))
	
	self.m_componentTable["bgdark"]:setVisible(false)
	
	--注册touch回调函数
	local downCallback = function()	
		CCLOG("touth down")	
		self.m_isClick = true
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )
	local downCallback = function()		
		CCLOG("drag inside")	
		self.m_isClick = false
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE )
	local downCallback = function()			
		CCLOG("drag  outside")
		self.m_isClick = false
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE )
	
	
	local downCallback = function()		
		if self.m_isClick == true then
			self:itemClick()			
			self.m_isClick = false
		end	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end


-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] setData
-- 设置公告信息
-------------------------------------------------------------------------------
function f_gonggaoItem:setData(data)	
	self.m_data = data
	
	self.m_componentTable["text"]:setString(self.m_data["title"])
	self.m_componentTable["new_label"]:setVisible(self.m_data["new"] == 1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] setIndex
-- 设置公告信息
-------------------------------------------------------------------------------
function f_gonggaoItem:setIndex(index)	
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] setItemSelectClick
-- 设置公告选择回调
-------------------------------------------------------------------------------
function f_gonggaoItem:setItemSelectClick(callback)
	self.m_item_select_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggaoItem] itemClick
-- 公告条目选择
-------------------------------------------------------------------------------
function f_gonggaoItem:itemClick()	
	if self.m_item_select_callback then
		self.m_item_select_callback(self.m_index)
	end
end

return f_gonggaoItem