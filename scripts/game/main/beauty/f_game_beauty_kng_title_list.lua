require("scripts.game.main.beauty.f_game_beauty_kng_title")
--[[
	继承自container list, 实现美女 title list
]]--

local f_game_beauty_kng_title_list = class("f_game_beauty_kng_title_list", function()
    return g_game.g_classFactory.newFLuaContainerList("f_game_beauty_kng_title_list", 1)
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title_list] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_kng_title_list:ctor()
	--8种称号  皇后 皇贵妃  贵妃 妃  嫔  贵人 常在 答应      
    self.m_card_info			= nil
    
    self.m_currentSelectCard	= nil
    
    self.m_selectCardUpdateCallBack   = nil
    
    self.m_itemArray = {}
    
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title_list] onEnter
-- on
-------------------------------------------------------------------------------
function f_game_beauty_kng_title_list:onEnter()   
	local len = g_game.g_dictConfigManager:getTitleLen()
	local listData = g_game.g_dictConfigManager:getCefengTitleList()
	for i=1, len do
		if listData[i] ~= nil then
			local cardHead = f_game_beauty_kng_title.static_create()
			cardHead:panelInitBeforePopup()
			cardHead:setSize(cc.size(178, 84))	  
			cardHead:setTitleIndex(i)
			
			local cardEventCallBack = function(cardHeadComponent)
				self:cardHeadListEvent(cardHeadComponent)
			end
			cardHead:setCardEventCallBack(cardEventCallBack)
			
		    self:appendComponent(cardHead)
		 
		    
		    if i == len then
		    	local actionTo = CCScaleTo:create(0.05, 1.1)
	            cardHead:runAction(actionTo)  
	            cardHead:setSelect(true)
		    end
		    
		    table.insert(self.m_itemArray, cardHead)
		end
	end
	if self.m_itemArray[#self.m_itemArray] ~= nil then 
		self.m_currentSelectCard = self.m_itemArray[#self.m_itemArray]
	end
	
--	self:setScrollOffset(cc.p(0, 210))
end


function f_game_beauty_kng_title_list:onExit()    
    self:unregisterNodeEvent()
    self.m_itemArray = {}
end

function f_game_beauty_kng_title_list:onEnterTransitionFinish()
end

function f_game_beauty_kng_title_list:onExitTransitionStart()
end

function f_game_beauty_kng_title_list:onCleanup()
end


function f_game_beauty_kng_title_list:registerNodeEvent(handler)
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

function f_game_beauty_kng_title_list:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title_list] cardHeadListEvent
-- 选中状态下的回调函数
-------------------------------------------------------------------------------
function f_game_beauty_kng_title_list:cardHeadListEvent(cardHeadComponent)
	self.m_currentSelectCard = cardHeadComponent
	local selectIndex = cardHeadComponent:getTitleIndex()
	
	for i = 1, #self.m_itemArray do
		self.m_itemArray[i]:stopAllActions()
		self.m_itemArray[i]:setScale(1.0)
		if selectIndex == self.m_itemArray[i]:getTitleIndex() then
			--变换动画的位置
			local actionTo = CCScaleTo:create(0.05, 1.1)
            self.m_itemArray[i]:runAction(actionTo)                              
		else
			--未选中
			self.m_itemArray[i]:setSelect(false)
		end
	end
	
	self.m_selectCardUpdateCallBack(cardHeadComponent)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title_list] getSelectTitle
-- 返回选中的卡牌
-------------------------------------------------------------------------------

function f_game_beauty_kng_title_list:getSelectTitle()
	return self.m_currentSelectCard
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title_list] setUpdateSelectTitleCallBack
-- 设置list 选择后  更新 回调
-------------------------------------------------------------------------------
function f_game_beauty_kng_title_list:setUpdateSelectTitleCallBack(headListUpdateSelectInfoCallBack)
	self.m_selectCardUpdateCallBack = headListUpdateSelectInfoCallBack
end


return f_game_beauty_kng_title_list