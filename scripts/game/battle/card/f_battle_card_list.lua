--[[
	继承自container panel, 实现战斗双方卡牌列表
]]--
local FLuaBattleCardList = class("FLuaBattleCardList", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattleCardList")
end)

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattleCardList:ctor()  
	self.m_list_type = 1	--type 1 攻击方list，第一张卡牌处于最右边  type 2 防御方list，第一张卡牌处于最左边
	self.m_is_self_data = true
	self.m_list_data = nil
	
	self.m_card_size = {78, 116}
	
	self.m_item_array = {}
	
	self.m_initPosX = 0
	self.m_initPosY = 0
	
	self.m_has_data_list_count = 0
	
	self.m_card_list_padding = 2.0
	
	self.m_card_animation_time	= 0.4 --卡牌自身动画时间长度
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function FLuaBattleCardList:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattleCardList] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function FLuaBattleCardList:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] onEnter
-------------------------------------------------------------------------------
function FLuaBattleCardList:onEnter()
	  
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] onExit
-------------------------------------------------------------------------------
function FLuaBattleCardList:onExit()        
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] onEnterTransitionFinish
-------------------------------------------------------------------------------
function FLuaBattleCardList:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] onExitTransitionStart
-------------------------------------------------------------------------------
function FLuaBattleCardList:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] onCleanup
-------------------------------------------------------------------------------
function FLuaBattleCardList:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] registerServerMessage
-------------------------------------------------------------------------------
function FLuaBattleCardList:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] unregisterServerMessage
-------------------------------------------------------------------------------
function FLuaBattleCardList:unregisterServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] setInitPosition
-------------------------------------------------------------------------------
function FLuaBattleCardList:setInitPosition(x, y)
	self.m_initPosX = x
	self.m_initPosY = y
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] fillData
-- 填充list数据，并且设置list类型，攻击方还是防御方
-- isSelf  标记是己方阵容数据还是敌方阵容数据
-- 		["battleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:8 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:INTEGER Size:4 名臣ID
-- 				["soldierType"] Type:INTEGER Size:4 兵种类型
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:8 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:INTEGER Size:4 怪物ID
-- 				["soldierType"] Type:INTEGER Size:4 兵种类型
-- 		}
-------------------------------------------------------------------------------
function FLuaBattleCardList:fillData(data, isSelf, type)
	self:removeAllItem()

	self.m_list_type = type
	self.m_is_self_data = isSelf
	self.m_list_data = clone(data)
	local count = #self.m_list_data
	self.m_has_data_list_count = count
	for i = 1, count do
		self.m_list_data[i]["isDead"] = 0
		self.m_list_data[i]["hasData"] = 1
	end
	
	if self.m_is_self_data then	
		for i = count+1, g_game.g_f_battle_define.MAX_LAYOUT_COUNT do
			self.m_list_data[i] = {["id"] = 0, ["officerId"] = 0, ["soldierType"] = 0, ["isDead"] = 0, ["hasData"] = 0}
		end
		self:fillSelfData()
	else
		for i = count+1, g_game.g_f_battle_define.MAX_LAYOUT_COUNT do
			self.m_list_data[i] = {["id"] = 0, ["monsterId"] = 0, ["soldierType"] = 0, ["isDead"] = 0, ["hasData"] = 0}
		end
		self:fillEnemyData()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] removeAllItem
-- 删除所有已有组件
-------------------------------------------------------------------------------
function FLuaBattleCardList:removeAllItem()
	if self.m_list_data == nil then
		return
	end
	local count = #self.m_list_data
		
	for i = 1, count do	
		local item = self.m_item_array[i]
		
		self:deleteComponent(item)
	end
	
	self.m_list_data = nil
	self.m_item_array = {}
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] fillSelfData
-- 填充己方数据
-------------------------------------------------------------------------------
function FLuaBattleCardList:fillSelfData()
	--设置list的size，根据每个卡牌的宽高和总个数计算
	local count = #self.m_list_data
	local width = self.m_card_size[1] * count
	local height = self.m_card_size[2]
	
	self:setSize(cc.size(width, height))
	
	for i = 1, count do	
		local item = require("scripts.game.battle.card.f_battle_card_head").new() 		
    	self:appendComponent(item)    
    	
		local cardId = self.m_list_data[i]["officerId"]		
		
		if self.m_list_data[i]["hasData"] == 1 then
			local cardResource = g_game.g_dictConfigManager:getCardHeadFile(cardId)
			local resourceImage = g_game.g_resourceManager:getCardHead(cardResource)	
			local cardQuality = g_game.g_dictConfigManager:getCardQuality(cardId)
	    	item:setCardQuality(cardQuality)
	    	item:setCardHead(resourceImage)
	    end
    	
		item:setAnchorPoint(cc.p(0, 1))
    	if self.m_list_type == 1 then
    		item:setPositionInContainer(cc.p(width - (self.m_card_size[1] * i) - i * self.m_card_list_padding , 1))
    	else
    		item:setPositionInContainer(cc.p(self.m_card_size[1] * (i-1) + i * self.m_card_list_padding, -1))
    	end    	
   		
		table.insert(self.m_item_array, item)
	end
	
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] getCardItem
-- 获取指定卡牌头像组件
-------------------------------------------------------------------------------
function FLuaBattleCardList:getCardItem(index)	
	return self.m_item_array[index]
end



-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] fillEnemyData
-- 填充敌方数据
-------------------------------------------------------------------------------
function FLuaBattleCardList:fillEnemyData()	
	--设置list的size，根据每个卡牌的宽高和总个数计算
	local count = #self.m_list_data
	local width = self.m_card_size[1] * count
	local height = self.m_card_size[2]
	
	self:setSize(cc.size(width, height))
	
	for i = 1, count do	
		local item = require("scripts.game.battle.card.f_battle_card_head").new() 		
    	self:appendComponent(item)    
    	
		local cardId = self.m_list_data[i]["monsterId"]
		
		if self.m_list_data[i]["hasData"] == 1 then
			local cardResource = g_game.g_dictConfigManager:getCardHeadFile(cardId)
			local resourceImage = g_game.g_resourceManager:getCardHead(cardResource)
			local cardQuality = g_game.g_dictConfigManager:getCardQuality(cardId)    	
	    	item:setCardQuality(cardQuality)
	    	item:setCardHead(resourceImage)
	    end
    	
		item:setAnchorPoint(cc.p(0, 1))
    	if self.m_list_type == 1 then
    		item:setPositionInContainer(cc.p(width - (self.m_card_size[1] * i) - i * self.m_card_list_padding, 1))
    	else
    		item:setPositionInContainer(cc.p(self.m_card_size[1] * (i-1) + i * self.m_card_list_padding, -1))
    	end    	
   		
		table.insert(self.m_item_array, item)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] firstCardStartBattle
-- 当前卡牌开始战斗
-------------------------------------------------------------------------------
function FLuaBattleCardList:firstCardStartBattle()	
	if #self.m_item_array > 0 then
		local count = #self.m_list_data
		local width = self.m_card_size[1] * count
		local height = self.m_card_size[2]
		
		local posx = self.m_item_array[1]:getPositionX()
		local posy = self.m_item_array[1]:getPositionY()	
		if self.m_list_type == 1 then		
			local moveTo = CCMoveTo:create(self.m_card_animation_time, cc.p(posx, posy + self.m_card_size[2]/4))
			
			local action = CCEaseBounceOut:create(moveTo)
--			self.m_item_array[1]:runAction(action)		
			
			self.m_item_array[1]:setActiveCardHeadEffect(false)  
		else
			local moveTo = CCMoveTo:create(self.m_card_animation_time, cc.p(posx, posy - self.m_card_size[2]/4))

			local action = CCEaseBounceOut:create(moveTo)
--			self.m_item_array[1]:runAction(action)
			
			self.m_item_array[1]:setActiveCardHeadEffect(true)  
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] cardUseFinish
-- 当前卡牌完成本轮战斗
-------------------------------------------------------------------------------
function FLuaBattleCardList:cardUseFinish()	
	if #self.m_item_array > 0 then
		local origItem = self.m_item_array[self.m_has_data_list_count]
		local origYItem = self.m_item_array[g_game.g_f_battle_define.MAX_LAYOUT_COUNT]
		local origItemPos = {origItem:getPositionX(), origYItem:getPositionY()}
		
		local moveItem = self.m_item_array[1]
		local listItem = self.m_list_data[1]
		table.remove(self.m_item_array, 1)
		table.remove(self.m_list_data, 1)
		
		table.insert(self.m_item_array, self.m_has_data_list_count, moveItem)
		table.insert(self.m_list_data, self.m_has_data_list_count, listItem)
		
		
		local removeFinish = function()
			self:moveList(moveItem, listItem, origItemPos)
		end
		
		local posx = moveItem:getPositionX()
		local posy = moveItem:getPositionY()	
		if self.m_list_type == 1 then			
			local moveTo = CCMoveTo:create(self.m_card_animation_time, cc.p(posx, posy-self.m_card_size[2]))

			local action = g_game.g_transition.sequence({CCEaseSineOut:create(moveTo), CCCallFunc:create(removeFinish)})
			moveItem:runAction(action)
		else
			local moveTo = CCMoveTo:create(self.m_card_animation_time, cc.p(posx, posy+self.m_card_size[2]))

			local action = g_game.g_transition.sequence({CCEaseSineOut:create(moveTo), CCCallFunc:create(removeFinish)})
			moveItem:runAction(action)
		end  
		moveItem:setDisableCardHeadEffect()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] cardDead
-- 当前卡牌死亡
-------------------------------------------------------------------------------
function FLuaBattleCardList:cardDead()		
	if #self.m_item_array > 0 then
		local origItem = self.m_item_array[self.m_has_data_list_count]
		local origYItem = self.m_item_array[g_game.g_f_battle_define.MAX_LAYOUT_COUNT]
		local origItemPos = {origItem:getPositionX(), origYItem:getPositionY()}
	
		local moveItem = self.m_item_array[1]
		local listItem = self.m_list_data[1]
		
		listItem["isDead"] = 1

		table.remove(self.m_item_array, 1)
		table.remove(self.m_list_data, 1)
		
		table.insert(self.m_item_array, self.m_has_data_list_count, moveItem)
		table.insert(self.m_list_data, self.m_has_data_list_count, listItem)
		
		local removeFinish = function()
			self:moveList(moveItem, listItem, origItemPos)
		end
		
		
		local posx = moveItem:getPositionX()
		local posy = moveItem:getPositionY()	
		if self.m_list_type == 1 then			
			local moveTo = CCMoveTo:create(self.m_card_animation_time, cc.p(posx, posy-self.m_card_size[2]/4-self.m_card_size[2]))

			local action = g_game.g_transition.sequence({CCEaseSineOut:create(moveTo), CCCallFunc:create(removeFinish)})
			moveItem:runAction(action)
		else
			local moveTo = CCMoveTo:create(self.m_card_animation_time, cc.p(posx, posy+self.m_card_size[2]/4+self.m_card_size[2]))

			local action = g_game.g_transition.sequence({CCEaseSineOut:create(moveTo), CCCallFunc:create(removeFinish)})
			moveItem:runAction(action)
		end  
		moveItem:setDisableCardHeadEffect()
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] updateListItem
-- 更新列表内的card位置
-------------------------------------------------------------------------------
function FLuaBattleCardList:updateListItem(moveItem, listItem, origItemPos)
	--设置list的size，根据每个卡牌的宽高和总个数计算
	moveItem:setPositionX(origItemPos[1])
	
	
	local moveTo = cc.MoveTo:create(self.m_card_animation_time, cc.p(origItemPos[1], origItemPos[2]))
							
	moveItem:runAction(cc.EaseBounceOut:create(moveTo))
	
	if listItem["isDead"] == 1 then		
		moveItem:setCardDisable()
		self.m_has_data_list_count = self.m_has_data_list_count - 1
	end
--	moveItem:setPosition(cc.p(origItemPos[1] , origItemPos[2]))
	
--[[	
    if self.m_list_type == 1 then
    	moveItem:setPositionInContainer(cc.p(origItemPos[1] , 1))
    else
    	moveItem:setPositionInContainer(cc.p(origItemPos[1], -1))
    end   
	local height = self.m_card_size[2]
	
	self:setSize(cc.size(width, height))
	self:setPositionInContainer(cc.p(self.m_initPosX, self.m_initPosY))
	
	for i = 1, count do	
    	item:setOpacity(255)
    	if self.m_list_type == 1 then
    		item:setPositionInContainer(cc.p(width - (self.m_card_size[1] * i) - (i * self.m_card_list_padding) , 1))
    	else
    		item:setPositionInContainer(cc.p(self.m_card_size[1] * (i-1) + i * self.m_card_list_padding, -1))
    	end    	
	end
]]--
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] moveList
-- 当前卡牌完成战斗或者死亡后移动列表
-------------------------------------------------------------------------------
function FLuaBattleCardList:moveList(moveItem, listItem, origItemPos)	
	local moveFinish = function()
		self:updateListItem(moveItem, listItem, origItemPos)
	end
		
	local count = #self.m_list_data
	
	for i = 1, count do		
		if self.m_list_data[i]["isDead"] == 0 and self.m_list_data[i]["hasData"] == 1 then
			local item = self.m_item_array[i]
			local posx = item:getPositionX()
			local posy = item:getPositionY()
			if self.m_list_type == 1 then	
				local moveTo = cc.MoveTo:create(self.m_card_animation_time, cc.p(posx + self.m_card_size[1]+self.m_card_list_padding, posy))
								
				item:runAction(cc.EaseBounceOut:create(moveTo))
			else
				local moveTo = cc.MoveTo:create(self.m_card_animation_time, cc.p(posx - self.m_card_size[1]-self.m_card_list_padding, posy))
							
				item:runAction(cc.EaseBounceOut:create(moveTo))
			end
		end
	end	
	
	local action = g_game.g_transition.sequence({cc.DelayTime:create(self.m_card_animation_time),cc.CallFunc:create(moveFinish)})	
	self:runAction(action)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] preOpenAllCard
-- 准备打开所有卡牌
-------------------------------------------------------------------------------
function FLuaBattleCardList:preOpenAllCard()	
	for i = 1, #self.m_item_array do
		self.m_item_array[i]:preOpenCardHead()
	end
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardList] openAllCard
-- 打开所有卡牌
-------------------------------------------------------------------------------
function FLuaBattleCardList:openAllCard()	
	for i = 1, #self.m_item_array do
		self.m_item_array[i]:openCardHead()
	end
end

return FLuaBattleCardList
