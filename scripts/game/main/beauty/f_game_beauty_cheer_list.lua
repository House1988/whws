--[[
	继承自container list, 实现助阵美女卡牌list
]]--

local f_game_beauty_cheer_list = class("f_game_beauty_cheer_list", function()
    return g_game.g_classFactory.newFLuaContainerList("f_game_beauty_cheer_list", 2)
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:ctor()      
    self.m_card_info			= nil
    
    self.m_currentSelectCard	= nil
    
    self.m_selectCardUpdateCallBack   = nil
    self.m_jumpToUnCheerBeautyView = nil
    
    self.m_itemArray = {}
    local num1,num2,num3 = g_game.g_dictConfigManager:getMaxLimitNum()
    self.MAX_OPENED = num2
    
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] onEnter
-- on
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:onEnter()   
	self:setStopTouchEvent(true)	
	self:enableClipping(true)
	
	local userLevel = g_game.g_userInfoManager:getLevel()
	local openedNum = g_game.g_dictConfigManager:getOpenedBeautiNum(userLevel)
	local createNum = openedNum+1
	if createNum > self.MAX_OPENED then
		createNum = self.MAX_OPENED
	end
	
	for i=1, createNum do
		local cardHead = require("scripts.game.main.beauty.f_game_beauty_cheer_head").new()	
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
	
	
	local cardInfo = g_game.g_userInfoManager:getBeautiListInfo()
	self:fillData(createNum, openedNum, cardInfo)
end

function f_game_beauty_cheer_list:setSelectToFirst()
	self.m_currentSelectCard = self.m_itemArray[1]
end


function f_game_beauty_cheer_list:onExit()    
    self:unregisterNodeEvent()
    self.m_itemArray = {}
end

function f_game_beauty_cheer_list:onEnterTransitionFinish()
end

function f_game_beauty_cheer_list:onExitTransitionStart()
end

function f_game_beauty_cheer_list:onCleanup()
end


function f_game_beauty_cheer_list:registerNodeEvent(handler)
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

function f_game_beauty_cheer_list:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] fillData
-- 填充list数据
-- num -- list个数  openedNum -- 已开启个数   data--已助阵数据
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:fillData(num, openedNum, data)
    self.m_card_info	= data
    
    local start = openedNum + 1
    

    if start <=  self.MAX_OPENED then
	    for i = start, num do
	    	self.m_itemArray[i]:setData(nil, true)
	    end
	end
    
    for i = 1, openedNum do
    
    	if i == 1 then
    		self.m_itemArray[i]:setSelect(true)
    	else
    		self.m_itemArray[i]:setSelect(false)
    	end
    	self.m_itemArray[i]:setData(self.m_card_info["battleList"][i], false)
    end
    
    
end

function f_game_beauty_cheer_list:updateDisplay()
	local userLevel = g_game.g_userInfoManager:getLevel()
	local openedNum = g_game.g_dictConfigManager:getOpenedBeautiNum(userLevel)
	local createNum = openedNum+1
	
	local num1,num2,num3 = g_game.g_dictConfigManager:getMaxLimitNum()
	if createNum > num2 then
		createNum = num2
	end
	
	local cardInfo = g_game.g_userInfoManager:getBeautiListInfo()
	self:fillData(createNum, openedNum, cardInfo)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] cardHeadListEvent
-- 选中状态下的回调函数
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:cardHeadListEvent(cardHeadComponent)
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
		local beautyInfo = g_game.g_userInfoManager:getBeautiListInfo()
		if beautyInfo == nil then
		
		end
		
		local battleListNum = beautyInfo["battleList_Num"]
		local firstEmptyCardIndex =  battleListNum+1
		
		for i = 1,table.getn( self.m_itemArray) do
			if i == firstEmptyCardIndex then
			 	self.m_itemArray[i]:setSelect(true)
			else
				self.m_itemArray[i]:setSelect(false)
			end
		end
	
	    self.m_currentSelectCard = self.m_itemArray[firstEmptyCardIndex]
	    self.m_jumpToUnCheerBeautyView()
	    
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] getSelectCard
-- 返回选中的卡牌
-------------------------------------------------------------------------------

function f_game_beauty_cheer_list:getSelectCard()
	return self.m_currentSelectCard
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] setUpdateCallBack
-- 设置list 选择后  更新 回调
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:setUpdateSelectInfoCallBack(headListUpdateSelectInfoCallBack)
	self.m_selectCardUpdateCallBack = headListUpdateSelectInfoCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] setJumpToUnCheerBeautyViewCallBack
-- 设置未上阵 美女 界面 回调
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:setJumpToUnCheerBeautyView(jumpToUnCheerBeautyViewCallBack)
	self.m_jumpToUnCheerBeautyView = jumpToUnCheerBeautyViewCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_list] getItemWithIndex
-- 获取指定索引card head
-------------------------------------------------------------------------------
function f_game_beauty_cheer_list:getItemWithIndex(index)   
	return self.m_itemArray[index]
end

return f_game_beauty_cheer_list