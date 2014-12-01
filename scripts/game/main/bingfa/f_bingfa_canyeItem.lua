--[[
	继承自container panel, 用于显示公告列表
]]--

require("scripts.auto.auto_canYeItem")

local f_bingfa_canyeItem = class("f_bingfa_canyeItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_bingfa_canyeItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(104, 150))	
	
	self.m_data = nil
	self.m_index = 0
	self.m_item_select_callback = nil
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:onEnter() 
	
end


function f_bingfa_canyeItem:onExit()    
    self:unregisterNodeEvent()
end

function f_bingfa_canyeItem:onEnterTransitionFinish()
end

function f_bingfa_canyeItem:onExitTransitionStart()
end

function f_bingfa_canyeItem:onCleanup()
end


function f_bingfa_canyeItem:registerNodeEvent(handler)
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

function f_bingfa_canyeItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] setSelect
-- 设置选中状态
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:setSelect(isSelect)	
	self.m_componentTable["hightlight"]:setVisible(isSelect)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:initAllComponent()	
	local gonggaoItemTable = createcanYeItem()
	self.gonggaoItem = gonggaoItemTable["canYeItem"]	
	self.m_componentTable = gonggaoItemTable
	
	self:appendComponent(self.gonggaoItem)
	
	self.gonggaoItem:setAnchorPoint(cc.p(0.5, 0.5))
	self.gonggaoItem:setPositionInContainer(cc.p(104/2, 150/2))
	
	
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
-- @function [parent=#f_bingfa_canyeItem] setData
-- 设置公告信息
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:setData(data)	
	self.m_data = data
	
	local image = g_game.g_dictConfigManager:getEquipResource(data["id"])
	self.m_componentTable["icon"]:setImage(g_game.g_resourceManager:getItemImage(image))
	local star = g_game.g_dictConfigManager:getEquipStar(data["id"])
	self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[star])
	self.m_componentTable["name"]:setString(g_game.g_dictConfigManager:getEquipName(data["id"]))
	self.m_componentTable["hightlight"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] setIndex
-- 设置公告信息
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:setIndex(index)	
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] setItemSelectClick
-- 设置公告选择回调
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:setItemSelectClick(callback)
	self.m_item_select_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_canyeItem] itemClick
-- 公告条目选择
-------------------------------------------------------------------------------
function f_bingfa_canyeItem:itemClick()	
	if self.m_item_select_callback then
		self.m_item_select_callback(self.m_index)
	end
end

return f_bingfa_canyeItem