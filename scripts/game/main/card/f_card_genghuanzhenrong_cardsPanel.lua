require("scripts.game.main.card.f_card_genghuanzhenrong_card")
--[[
	继承自container panel, 每个panel最多显示当前阵容 13张名臣卡牌
]]--

local f_card_genghuanzhenrong_cardsPanel = class("f_card_genghuanzhenrong_cardsPanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_card_genghuanzhenrong_cardsPanel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:ctor()
	 self.m_componentNum = 0
	 
	 self.TYPE_ARR1 = 1
	 self.TYPE_ARR2 = 2
	 self.m_componentType = 0
	 
	 self.CARD_SPACE = 1
	 self.ROW_NUM = 7
	 
	 self.m_selectCard = nil
	 self.m_targetCard = nil
	 
	 self.curCardsData = nil
	 
     self.m_components_arr = {} 
     self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] setComponentType
-- 显示卡牌阵容类型
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:setComponentType(type)   
	self.m_componentType = type
	
	if self.m_componentType == self.TYPE_ARR1 then
		self.curCardsData = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_BATTLE_ARR1)
	elseif self.m_componentType == self.TYPE_ARR2 then
		self.curCardsData = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_BATTLE_ARR2)
	end
	self.m_componentNum = #self.curCardsData
	
	self:updatePanelData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] getSecondComponent
-- 新手指引，获取第二个卡牌
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:getSecondComponent()  
	return self.m_components_arr[2]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] updatePanelData
-- 更新当前界面卡牌数据
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:updatePanelData()   
	if #self.m_components_arr ~= 0 then
		for i = 1, #self.m_components_arr do
			self:deleteComponent(self.m_components_arr[i])
		end
	end
	self.m_components_arr = {}
	
	if self.m_componentNum == 0 then
		return
	end

	for i = 1, self.m_componentNum do
		local zhenrongCard = f_card_genghuanzhenrong_card.static_create()
		zhenrongCard:panelInitBeforePopup()
		zhenrongCard:setHuanzhenIndex(i)			
		zhenrongCard:setSize(cc.size(145,220))
		
		local huanzhenCardChangePositionCallBack = function(card)
			self:huanzhenCardPanelChangePosition(card)
		end
		zhenrongCard:setChangePositionCallBack(huanzhenCardChangePositionCallBack)
		
		local huanzhenCardEventCallBack = function(card)
			self:huanzhenCardPanelEvent(card)
		end
		zhenrongCard:setHuanzhenCallBack(huanzhenCardEventCallBack)
		
		self:appendComponent(zhenrongCard)
		zhenrongCard:setAnchorPoint(cc.p(0,1))
		
		local pos_x = (i-1)% self.ROW_NUM *(133+ self.CARD_SPACE) 
		local pos_y = 0
		
		if i > self.ROW_NUM then
			pos_y = pos_y + 220 + self.CARD_SPACE+19
		end
		
		zhenrongCard.m_componentTable["genghuan_button_panel"]:setStopTouchEvent(true)
		if i == 1 then
			zhenrongCard.m_componentTable["genghuanzhenrong_card_xuanzhong_image"]:setVisible(true)
			zhenrongCard.m_componentTable["genghuan_button"]:setVisible(false)
		else
			zhenrongCard.m_componentTable["genghuanzhenrong_card_xuanzhong_image"]:setVisible(false)
			zhenrongCard.m_componentTable["genghuan_button"]:setVisible(true)
		end

		zhenrongCard:setPositionInContainer(cc.p(pos_x,pos_y))
		
		zhenrongCard:setData(self.curCardsData[i])
		table.insert(self.m_components_arr,zhenrongCard)
		
	end
	
	if self.m_components_arr[1] ~= 	nil then
		self.m_selectCard = self.m_components_arr[1]
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] getSelectCard
-- 换位 call back
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:getSelectCard()
	return self.m_selectCard
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] huanzhenCardPanelChangePosition
-- 换位 call back
-------------------------------------------------------------------------------	
function f_card_genghuanzhenrong_cardsPanel:huanzhenCardPanelChangePosition(card)
	
	self.m_targetCard = card
	
	local targetPosition = self.m_targetCard:getPositionInContainer()
	local selectPosition = self.m_selectCard:getPositionInContainer()
	
	self.m_selectCard:setPositionInContainer(targetPosition)
	self.m_targetCard:setPositionInContainer(selectPosition)
	
	local targetIndex = self.m_targetCard:getHuanzhenIndex()
	local selectIndex = self.m_selectCard:getHuanzhenIndex() 	
	
	--向服务器发送  卡牌位置  和  更换卡牌的信息
	local tempTargetData = clone(self.m_targetCard:getData())
	self.curCardsData[targetIndex] = self.m_selectCard:getData()
	self.curCardsData[selectIndex] = tempTargetData
	
	--本地 components_arr信息
	local tempTarget = self.m_components_arr[targetIndex]
	self.m_components_arr[targetIndex] = self.m_components_arr[selectIndex]
	self.m_components_arr[selectIndex] = tempTarget
	
	--位置index 信息
	local tempTargetIndex = targetIndex
	self.m_targetCard:setHuanzhenIndex(selectIndex)
	self.m_selectCard:setHuanzhenIndex(tempTargetIndex)

	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] huanzhenCardPanelEvent
-- 换阵 panel event
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:huanzhenCardPanelEvent(card)   
	
	self.m_selectCard = card
	local index = card:getHuanzhenIndex()
	
	local GENG_HUAN = 1
	local CARD_SELECT = 2
	
	for i= 1, table.getn(self.m_components_arr) do
	
		if i == index then
			self.m_components_arr[i]:setCardState(CARD_SELECT)
		else
			self.m_components_arr[i]:setCardState(GENG_HUAN)
		end
	end
end	



-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:onEnter()   

end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] onExit
-- 退出调用
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:onExit()    
    self:unregisterNodeEvent()
    self.m_components_arr = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] onEnterTransitionFinish
-- 切换结束 回调
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] onExitTransitionStart
-- 切换开始回调
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] onExitTransitionStart
-- 清理
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] registerNodeEvent
-- 注册活动监听
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:registerNodeEvent(handler)
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

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_cardsPanel] unregisterNodeEvent
-- 注册活动监听
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_cardsPanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_card_genghuanzhenrong_cardsPanel