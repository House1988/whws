require("scripts.game.main.shangcheng.f_shangcheng_sell_item")
--[[
	商城 道具 table
]]--

local f_shangcheng_items_table = class("f_shangcheng_items_table", function()
    return g_game.g_classFactory.newFLuaContainerTable("f_shangcheng_items_table", 2)
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_items_table] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_shangcheng_items_table:ctor()      
    self.m_componentsTable = {}
    self:registerNodeEvent()   
	self.m_buyCallback = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_items_table] onEnter
-- on
-------------------------------------------------------------------------------
function f_shangcheng_items_table:onEnter()   
	self:setStopTouchEvent(true)	
	self:enableClipping(true)
	
	local shopItems = g_game.g_dictConfigManager:getShopItems()
	
	local sort = function(d1, d2)
		return d1[14] < d2[14]
	end
	
	table.sort(shopItems, sort)
	
	local itemNum = #shopItems
	for i = 1,itemNum do
	
		local itemCell = f_shangcheng_sell_item.static_create()
		itemCell:panelInitBeforePopup()
		itemCell:setSize(cc.size(344,228))
		itemCell:setIndex(i)
		itemCell:setData(shopItems[i])
		self:appendComponent(itemCell)
		
		itemCell:setBuyCallBack(self.m_buyCallback)
		table.insert(self.m_componentsTable, itemCell)
	end
end

function f_shangcheng_items_table:setBuyCallBack(callback)
	self.m_buyCallback = callback
end

function f_shangcheng_items_table:onExit()    
    self:unregisterNodeEvent()
end

function f_shangcheng_items_table:onEnterTransitionFinish()
end

function f_shangcheng_items_table:onExitTransitionStart()
end

function f_shangcheng_items_table:onCleanup()
end


function f_shangcheng_items_table:registerNodeEvent(handler)
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

function f_shangcheng_items_table:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_shangcheng_items_table