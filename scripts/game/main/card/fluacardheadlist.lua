--[[
	继承自container list, 实现布阵卡牌list
]]--

local FLuaCardHeadList = class("FLuaCardHeadList", function()
    return g_game.g_classFactory.newFLuaContainerList("FLuaCardHeadList", 2)
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaCardHeadList:ctor()      
    
    self.m_currentSelectCard	= nil
    
    self.m_selectCardUpdateCallBack   = nil
    self.m_jumpToMingchenCallBack = nil
    
    self.m_itemArray = {}
    
    local num1,num2,num3 = g_game.g_dictConfigManager:getMaxLimitNum()
    
    self.MAX_OPENED	= num1
    
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] getItemWithIndex
-- 获取指定索引card head
-------------------------------------------------------------------------------
function FLuaCardHeadList:getItemWithIndex(index)   
	return self.m_itemArray[index]
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] onEnter
-- on
-------------------------------------------------------------------------------
function FLuaCardHeadList:onEnter()   
	self:setStopTouchEvent(true)	
--	self:setSize(cc.size(620,122))
--	self:setListInfo(1, 10, 5, 102, 102)
	self:enableClipping(true)
	
	local userLevel = g_game.g_userInfoManager:getLevel()
	local openedNum = g_game.g_dictConfigManager:getOpenedCardNum(userLevel)
	local createNum = openedNum+1
	if createNum >  self.MAX_OPENED then
		createNum =  self.MAX_OPENED
	end
	
	for i=1, createNum do
		local cardHead = require("scripts.game.main.card.fluacardheadcomponent").new()	
		cardHead:setSize(cc.size(102, 102))	  
		cardHead:setSelectIndex(i)
		
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
	
	self:fillData(createNum, openedNum)
end


function FLuaCardHeadList:onExit()    
    self:unregisterNodeEvent()
    self.m_itemArray = {}
end

function FLuaCardHeadList:onEnterTransitionFinish()
end

function FLuaCardHeadList:onExitTransitionStart()
end

function FLuaCardHeadList:onCleanup()
end


function FLuaCardHeadList:registerNodeEvent(handler)
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

function FLuaCardHeadList:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] fillData
-- 填充list数据
-- num -- list个数  openedNum -- 已开启个数  
-------------------------------------------------------------------------------
function FLuaCardHeadList:fillData(num, openedNum)
    local m_card_info = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
    
    local start = openedNum + 1
    
    if start <= self.MAX_OPENED then
	    for i = start, num do
			self.m_itemArray[i]:setData(nil, true)
	    end
	end
    
    for i = 1, openedNum do
    
    	if i == self.m_currentSelectCard:getIndexInList() then
    		self.m_itemArray[i]:setSelect(true)
    	else
    		self.m_itemArray[i]:setSelect(false)
    	end
    	self.m_itemArray[i]:setData(m_card_info[i], false)
    end
    
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] cardHeadListEvent
-- 选中状态下的回调函数
-------------------------------------------------------------------------------
function FLuaCardHeadList:cardHeadListEvent(cardHeadComponent)
	if cardHeadComponent.m_currentState == cardHeadComponent.STATE_SELECT_STATE then
		local selectIndex = cardHeadComponent:getIndexInList()
	
		for i = 1,table.getn( self.m_itemArray) do
			if i == selectIndex then
			 	self.m_itemArray[i]:setSelect(true)
			else
				self.m_itemArray[i]:setSelect(false)
			end
		end
		self.m_currentSelectCard = cardHeadComponent
		self.m_selectCardUpdateCallBack()
			
	elseif cardHeadComponent.m_currentState == cardHeadComponent.STATE_EMPTY_STATE then
	
		local battleList =  g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
		local battleListNum = #battleList
		local firstEmptyCardIndex =  battleListNum+1
		
		for i = 1,table.getn( self.m_itemArray) do
			if i == firstEmptyCardIndex then
			 	self.m_itemArray[i]:setSelect(true)
			else
				self.m_itemArray[i]:setSelect(false)
			end
		end
	
	    self.m_currentSelectCard = self.m_itemArray[firstEmptyCardIndex]
	    self.m_jumpToMingchenCallBack()
	    
	end

end

function FLuaCardHeadList:getSecondCardHead()
	return self.m_itemArray[2]
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] getFirstSelectCard
-------------------------------------------------------------------------------
function FLuaCardHeadList:setSelectToFirst()
	self.m_currentSelectCard = self.m_itemArray[1]
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] getSelectCard
-- 返回选中的卡牌
-------------------------------------------------------------------------------

function FLuaCardHeadList:getSelectCard()
	return self.m_currentSelectCard
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] setUpdateCallBack
-- 设置list 选择后  更新 回调
-------------------------------------------------------------------------------
function FLuaCardHeadList:setUpdateSelectInfoCallBack(headListUpdateSelectInfoCallBack)
	self.m_selectCardUpdateCallBack = headListUpdateSelectInfoCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCardHeadList] setJumpToMingchenCallBack
-- 设置跳转名臣 界面 回调
-------------------------------------------------------------------------------
function FLuaCardHeadList:setJumpToMingChenCallBack(headListJumpToMingChenCallBack)
	self.m_jumpToMingchenCallBack = headListJumpToMingChenCallBack
end

return FLuaCardHeadList