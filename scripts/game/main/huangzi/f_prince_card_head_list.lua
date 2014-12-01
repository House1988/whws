--[[
	继承自container list, 实现皇子督军已上阵list
]]--

local FLuaPrinceCardHeadList = class("FLuaPrinceCardHeadList", function()
    return g_game.g_classFactory.newFLuaContainerList("FLuaPrinceCardHeadList", 2)
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:ctor()    
    self:registerNodeEvent()   
      
    self.m_prince_info			= nil    
    self.m_itemArray = {}
    
    self.m_update_callback 		= nil
    self.m_select_prince_callback 		= nil
    
    self.m_select_index			= 1
    self.m_temp_select_index	= 1
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] onEnter
-- on
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:onEnter()   
	self:setStopTouchEvent(true)	
--	self:setSize(cc.size(620,122))
--	self:setListInfo(1, 10, 5, 102, 102)
	self:enableClipping(true)
	

    local currentLevel = g_game.g_userInfoManager:getLevel()
	local openedPrinceNum = g_game.g_dictConfigManager:getOpenedPrinceNum(currentLevel)
	local nextPrinceNum = openedPrinceNum--g_game.g_dictConfigManager:getOpenedPrinceNum(currentLevel+1)
	local nextLevel = currentLevel
	
	for level = currentLevel, g_game.MAX_USER_LV do
		nextPrinceNum = g_game.g_dictConfigManager:getOpenedPrinceNum(level)
		if nextPrinceNum > openedPrinceNum then
			nextLevel = level
			break
		end
	end
    
	for i=1, nextPrinceNum do		
		local cardHead = require("scripts.game.main.huangzi.f_prince_card_head_component").new()	
		cardHead:setSize(cc.size(102, 102))	  
		cardHead:setSelectIndex(i)
		
		local cardEventCallBack = function(cardHeadComponent)
			self:cardHeadListEvent(cardHeadComponent)
		end
		cardHead:setCardEventCallBack(cardEventCallBack)
		
	    self:appendComponent(cardHead)
	    
	    if i == 1 then
	    	self.m_currentSelectCard = cardHead
	    	self.m_select_index 	 = i
	    end
	    
	    table.insert(self.m_itemArray, cardHead)

	end
	
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	self:fillData(nextPrinceNum, openedPrinceNum, nextLevel, princeInfo)
end

function FLuaPrinceCardHeadList:refreshSelectCard()  
	if self.m_currentSelectCard ~= nil then
		self.m_currentSelectCard:refreshLevel()
	end
end


function FLuaPrinceCardHeadList:onExit()    
    self:unregisterNodeEvent()
    self.m_itemArray = {}
end

function FLuaPrinceCardHeadList:onEnterTransitionFinish()
end

function FLuaPrinceCardHeadList:onExitTransitionStart()
end

function FLuaPrinceCardHeadList:onCleanup()
end


function FLuaPrinceCardHeadList:registerNodeEvent(handler)
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

function FLuaPrinceCardHeadList:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] getFirstCardItem
-- 获取第一个皇子督军位
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:getFirstCardItem()
	return self.m_itemArray[1]
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] refershListData
-- 刷新list数据
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:refershListData()

    local currentLevel = g_game.g_userInfoManager:getLevel()
	local openedPrinceNum = g_game.g_dictConfigManager:getOpenedPrinceNum(currentLevel)
	
	local nextPrinceNum = openedPrinceNum--g_game.g_dictConfigManager:getOpenedPrinceNum(currentLevel+1)
	local nextLevel = currentLevel
	
	for level = currentLevel, 1000 do
		nextPrinceNum = g_game.g_dictConfigManager:getOpenedPrinceNum(level)
		if nextPrinceNum > openedPrinceNum then
			nextLevel = level
			break
		end
	end
    
    
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	self:fillData(nextPrinceNum, openedPrinceNum,  nextLevel, princeInfo)
		
	self.m_itemArray[self.m_select_index]:itemClick()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] fillData
-- 填充list数据
-- num -- list个数  openedNum -- 已开启个数   data--已出阵数据
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:fillData(num, openedNum, nextLevel, data)
    self.m_card_position_num = num
    self.m_prince_info	= data
    
	local currentLevel = g_game.g_userInfoManager:getLevel()
	
    for i = openedNum + 1, num do
    	self.m_itemArray[i]:setData(nil, true, nextLevel)
    end
    
    if #self.m_prince_info["battleList"] < 1 then
    	return
    end
    for i = 1, openedNum do    
    	if self.m_prince_info["battleList"][i] == nil then
    		self.m_itemArray[i]:setData(nil, false, currentLevel)
    	else
    		self.m_itemArray[i]:setData(self.m_prince_info["battleList"][i], false, currentLevel)
    	end
    	if i == 1 then
    		self.m_itemArray[i]:setSelect(true)
    		if self.m_prince_info["battleList"][i] ~= nil then
    			self.m_itemArray[i]:itemClick()
    		end
    	else
    		self.m_itemArray[i]:setSelect(false)
    	end
    end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] cardHeadListEvent
-- 选中状态下的回调函数
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:cardHeadListEvent(cardHeadComponent)	
	if cardHeadComponent.m_currentState == cardHeadComponent.STATE_SELECT_STATE then
		local selectIndex = cardHeadComponent:getIndexInList()
	
		for i = 1,table.getn( self.m_itemArray) do
			if i == selectIndex then
			 	self.m_itemArray[i]:setSelect(true)
			else
				self.m_itemArray[i]:setSelect(false)
			end
		end
		if cardHeadComponent:getData() then
			if self.m_update_callback ~= nil then
				self.m_update_callback(cardHeadComponent:getData())
				self.m_currentSelectCard = cardHeadComponent
			end
		else
		end				
	    self.m_select_index 	 	 = selectIndex
	elseif cardHeadComponent.m_currentState == cardHeadComponent.STATE_EMPTY_STATE then	
	    self.m_temp_select_index 	 = cardHeadComponent:getIndexInList()
	    
	    self.m_select_prince_callback(cardHeadComponent:getIndexInList())
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] getSelectCard
-- 返回选中的卡牌
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:getSelectCard()
	return self.m_currentSelectCard
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] setUpdateCallback
-- 返回选中的卡牌
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:setUpdateCallback(updateCallback)
	self.m_update_callback = updateCallback
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaPrinceCardHeadList] setEmptyPrinceCallback
-- 设置点击空卡牌列表回调
-------------------------------------------------------------------------------
function FLuaPrinceCardHeadList:setEmptyPrinceCallback(callback)
	self.m_select_prince_callback = callback
end

return FLuaPrinceCardHeadList