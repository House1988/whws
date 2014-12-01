--[[
	美女生的儿子们
]]--

local f_game_beauty_sons_list = class("f_game_beauty_sons_list", function()
    return g_game.g_classFactory.newFLuaContainerList("f_game_beauty_sons_list", 2)
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_list] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_sons_list:ctor()      
    self.m_card_info			= nil
    
    self.m_currentSelectCard	= nil
    self.m_selectCallBack   = nil
    
    self.m_itemArray = {}
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_list] onEnter
-- on
-------------------------------------------------------------------------------
function f_game_beauty_sons_list:onEnter()   
	self:setStopTouchEvent(true)	
	self:enableClipping(true)
end


function f_game_beauty_sons_list:setSonsData(sonsTable)
	self.m_card_info = sonsTable
	
	for i=1, #self.m_card_info do
		local cardHead = require("scripts.game.main.beauty.f_game_beauty_sons_head").new()	
		cardHead:setSize(cc.size(102, 102))	  
		cardHead:setSelectIndex(i)
		cardHead:setData(self.m_card_info[i])
		local cardEventCallBack = function(cardHeadComponent)
			self:cardHeadListEvent(cardHeadComponent)
		end
		cardHead:setCardEventCallBack(cardEventCallBack)
		
	    self:appendComponent(cardHead)
	    
	    if i == 1 then
	    	self.m_currentSelectCard = cardHead
	    end
	    
	    table.insert(self.m_itemArray, cardHead)
	end
	
end

function f_game_beauty_sons_list:onExit()    
    self:unregisterNodeEvent()
    self.m_itemArray = {}
end

function f_game_beauty_sons_list:onEnterTransitionFinish()
end

function f_game_beauty_sons_list:onExitTransitionStart()
end

function f_game_beauty_sons_list:onCleanup()
end


function f_game_beauty_sons_list:registerNodeEvent(handler)
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

function f_game_beauty_sons_list:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_list] cardHeadListEvent
-- 选中状态下的回调函数
-------------------------------------------------------------------------------
function f_game_beauty_sons_list:cardHeadListEvent(cardHeadComponent)
	local selectIndex = cardHeadComponent:getIndexInList()

	for i = 1,table.getn( self.m_itemArray) do
		if i == selectIndex then
		 	self.m_itemArray[i].m_hight_light:setVisible(true)
		else
			self.m_itemArray[i].m_hight_light:setVisible(false)
		end
	end
	self.m_currentSelectCard = cardHeadComponent
	self.m_selectCallBack()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_list] getSelectCard
-- 返回选中的卡牌
-------------------------------------------------------------------------------

function f_game_beauty_sons_list:getSelectCard()
	return self.m_currentSelectCard
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_list] setSelectCallBack
-- 设置list 选择后  更新 回调
-------------------------------------------------------------------------------
function f_game_beauty_sons_list:setSelectCallBack(callback)
	self.m_selectCallBack = callback
end


return f_game_beauty_sons_list