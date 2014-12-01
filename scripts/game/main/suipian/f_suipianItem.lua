--[[
	继承自container panel, 用于显示碎片列表
]]--

require("scripts.auto.auto_suipianItem")
require("scripts.auto.auto_suipianEquip")

local f_suipianItem = class("f_suipianItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_suipianItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_suipianItem:ctor()    
    self:registerNodeEvent()   
    
	self.m_data = nil
	self.m_index = 0
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_suipianItem:onEnter() 

	self:initAllComponent()
end

function f_suipianItem:setType(type)
	self.m_type = type 
end


function f_suipianItem:onExit()   
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self)
	end 
    self:unregisterNodeEvent()
end

function f_suipianItem:onEnterTransitionFinish()
end

function f_suipianItem:onExitTransitionStart()
end

function f_suipianItem:onCleanup()
end


function f_suipianItem:registerNodeEvent(handler)
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

function f_suipianItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] setSelect
-- 设置选中状态
-------------------------------------------------------------------------------
function f_suipianItem:setSelect(isSelect)	
	self.m_componentTable["highLight"]:setVisible(isSelect)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_suipianItem:initAllComponent()	
	if self.m_type == 3 then
		local gonggaoItemTable = createsuipianEquip()
		self.suipianItem = gonggaoItemTable["suipianEquip"]	
		self.m_componentTable = gonggaoItemTable
		self:appendComponent(self.suipianItem)
		self.suipianItem:setAnchorPoint(cc.p(0.5, 0.5))
		self.suipianItem:setPositionInContainer(cc.p(125.5, 229))
	else
		local gonggaoItemTable = createsuipianItem()
		self.suipianItem = gonggaoItemTable["suipianItem"]	
		self.m_componentTable = gonggaoItemTable
		self:appendComponent(self.suipianItem)
		self.suipianItem:setAnchorPoint(cc.p(0.5, 0.5))
		self.suipianItem:setPositionInContainer(cc.p(97.5, 124))
	end
	
	
	
	
	--注册touch回调函数
	local downCallback = function()	
		self.m_isClick = true
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )
	local downCallback = function()		
		self.m_isClick = false
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE )
	
	
	local downCallback = function()		
		if self.m_isClick == true then
			self:itemClick()			
			self.m_isClick = false
		end	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.suipianItem:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self.m_index = -1
	self.m_remove_callback = nil
	self.m_item_select_callback = nil
end


-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] setData
-- 设置公告信息
-------------------------------------------------------------------------------
function f_suipianItem:setData(data, index)	
	self.m_data = data
	self.m_index = index
	
	local id = data["fragmentId"]
	local star = g_game.g_dictConfigManager:getPieceStar(id)
	for i = 1, 5 do
		if i <= star then
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing.png")
		else
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing_dark.png")
		end
	end
	self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[star])
	self.m_componentTable["name"]:setString(g_game.g_dictConfigManager:getPieceName(id))
	self.m_componentTable["image"]:setImage(g_game.g_dictConfigManager:getPieceImage(id))
	self.m_componentTable["image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	self.m_componentTable["highLight"]:setVisible(false)
	
	self.m_componentTable["number"]:setString(data["count"] .. "/" .. g_game.g_dictConfigManager:getPieceMergeNumber(id))
	self.m_componentTable["cost"]:setString(g_game.g_dictConfigManager:getPieceCost(id))
	self.m_componentTable["cost"]:setAlignment(0)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] setItemSelectClick
-- 设置公告选择回调
-------------------------------------------------------------------------------
function f_suipianItem:setItemSelectClick(callback)
	self.m_item_select_callback = callback
end

function f_suipianItem:setRemoveCallback(callBack)
	self.m_remove_callback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_suipianItem] itemClick
-- 公告条目选择
-------------------------------------------------------------------------------
function f_suipianItem:itemClick()	
	if self.m_item_select_callback then
		self.m_item_select_callback(self)
	end
end

return f_suipianItem