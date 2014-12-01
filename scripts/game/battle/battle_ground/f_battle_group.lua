--[[
	继承自container panel, 实现双方阵营
]]--
local FLuaBattleGroup = class("FLuaBattleGroup", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattleGroup")
end)

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattleGroup:ctor(manager)  
	self:registerNodeEvent()--注册特殊回调函数  	
--[[
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)
	
 	self.m_autoPanel:appendComponent(self)
--  g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 1)
]]--  	
  	manager:getBattleSoliderLayer():appendComponent(self)
  	
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
  	
  	
  	self.m_group_type = 1   --type 1 攻击阵营     type  2 防御阵营
  	
  	self.m_solider_data = nil
  	
  	self.m_solider_item_array = {}
  	  	
  	self.m_battle_manager = manager
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function FLuaBattleGroup:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattleGroup] getAttackLayoutPosition
-- 获取指定索引位置的攻击阵营兵种坐标
-------------------------------------------------------------------------------
function FLuaBattleGroup:getAttackLayoutPosition(index)	

	return g_game.g_f_battle_solider_position.g_attack_position[index][1], g_game.g_f_battle_solider_position.g_attack_position[index][2]
--[[
	if index < 5 then		
		local initX = 120
		local initY = 190
		
		local posX = initX + index * 110
		local posY = initY + index * 70
		
		return posX, posY	
	else	
		local initX = 40
		local initY = 270
		
		local posX = initX + (index - 4) * 110
		local posY = initY + (index - 4) * 70
		
		return posX, posY	
	end
]]--
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] getDefenseLayoutPosition
-- 获取指定索引位置的攻击阵营兵种坐标
-------------------------------------------------------------------------------
function FLuaBattleGroup:getDefenseLayoutPosition(index)
	return g_game.g_f_battle_solider_position.g_defense_position[index][1], g_game.g_f_battle_solider_position.g_defense_position[index][2]
--[[
	if index < 5 then		
		local initX = 300
		local initY = 120
		
		local posX = initX + index * 110
		local posY = initY + index * 70
		
		return posX, posY	
	else	
		local initX = 510
		local initY = 110
		
		local posX = initX + (index - 4) * 110
		local posY = initY + (index - 4) * 70
		
		return posX, posY	
	end
]]--
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function FLuaBattleGroup:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] onEnter
-------------------------------------------------------------------------------
function FLuaBattleGroup:onEnter()
	  
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] onExit
-------------------------------------------------------------------------------
function FLuaBattleGroup:onExit()        
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function FLuaBattleGroup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] onExitTransitionStart
-------------------------------------------------------------------------------
function FLuaBattleGroup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] onCleanup
-------------------------------------------------------------------------------
function FLuaBattleGroup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] setGroupType
-- 设置阵营类型   type 1 攻击阵营   type 2 防御阵营
-------------------------------------------------------------------------------
function FLuaBattleGroup:setGroupType(type)
	self.m_group_type = type
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] removeAllItem
-- 删除所有已有组件
-------------------------------------------------------------------------------
function FLuaBattleGroup:removeAllItem()
	if self.m_solider_data == nil then
		return
	end
	local count = #self.m_solider_item_array
		
	for i = 1, count do	
		local item = self.m_solider_item_array[i]
		
		self:deleteComponent(item)
	end
	
	self.m_solider_data = nil
	self.m_solider_item_array = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] soliderEnterBattle
-- 兵团进入战斗场景动画
-------------------------------------------------------------------------------
function FLuaBattleGroup:soliderEnterBattle()
	if self.m_group_type == 1 then
		return self:attackSoliderEnterBattle()
	elseif self.m_group_type == 2 then
		return self:defenseSoliderEnterBattle()
	end
	return 0.0
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] attackSoliderEnterBattle
-- 攻击阵营进入
-------------------------------------------------------------------------------
function FLuaBattleGroup:attackSoliderEnterBattle()	
	local moveTime = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.8	
	local count = #self.m_solider_data
	local layoutCount = count
	if layoutCount > g_game.g_f_battle_define.MAX_LAYOUT_COUNT then
		layoutCount = g_game.g_f_battle_define.MAX_LAYOUT_COUNT
	end
	
	for i = 1, layoutCount do
		local item = self.m_solider_item_array[i]
		local posx, posy = item:getPosition()
		
		local moveto = CCMoveTo:create(moveTime+i*0.1, cc.p(posx+0.5*CONFIG_SCREEN_WIDTH, posy+0.5*CONFIG_SCREEN_HEIGHT))
		
		local itemPlayYidong = function()
			item:showMoveAnimation()
		end
		local itemFinishYidong = function()
			item:showIdleAnimation()
		end
		
		
		local action = g_game.g_transition.sequence({CCCallFunc:create(itemPlayYidong), CCEaseSineIn:create(moveto), CCCallFunc:create(itemFinishYidong)})
	
		item:runAction(action)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BINGMA_JINRU)
	end
	
	return moveTime+layoutCount*0.1
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] defenseSoliderEnterBattle
-- 防御阵营进入
-------------------------------------------------------------------------------
function FLuaBattleGroup:defenseSoliderEnterBattle()	
	local moveTime = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.8		
	local count = #self.m_solider_data
	local layoutCount = count
	if layoutCount > g_game.g_f_battle_define.MAX_LAYOUT_COUNT then
		layoutCount = g_game.g_f_battle_define.MAX_LAYOUT_COUNT
	end
	
	for i = 1, layoutCount do
		local item = self.m_solider_item_array[i]
		local posx, posy = item:getPosition()
		
		local moveto = CCMoveTo:create(moveTime+i*0.1, cc.p(posx-0.5*CONFIG_SCREEN_WIDTH, posy-0.5*CONFIG_SCREEN_HEIGHT))
		
		local itemPlayYidong = function()
			item:showMoveAnimation()
		end
		local itemFinishYidong = function()
			item:showIdleAnimation()
		end
		
		local action = g_game.g_transition.sequence({CCCallFunc:create(itemPlayYidong), CCEaseSineIn:create(moveto), CCCallFunc:create(itemFinishYidong)})
	
		item:runAction(action)
	end
	
	return moveTime+layoutCount*0.1
end



-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] setGroupData
-- 设置阵营中数据
-------------------------------------------------------------------------------
function FLuaBattleGroup:setGroupData(data)
	self:removeAllItem()

	self.m_solider_data = clone(data)
	
	if self.m_group_type == 1 then
		self:placeAttackSolider()
	elseif self.m_group_type == 2 then
		self:placeDefenseSolider()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] placeAttackSolider
-- 在场景中添加攻击阵营兵种
-------------------------------------------------------------------------------
function FLuaBattleGroup:placeAttackSolider()	
	local count = #self.m_solider_data
	local layoutCount = count
	if layoutCount > g_game.g_f_battle_define.MAX_LAYOUT_COUNT then
		layoutCount = g_game.g_f_battle_define.MAX_LAYOUT_COUNT
	end
	
	for i = 1, layoutCount do
		local item = require("scripts.game.battle.battle_ground.f_battle_solider").new()
		self:appendComponent(item)
		item:setSize(cc.size(100, 100))
		item:setSoliderData(self.m_solider_data[i])
		item:setBattleManager(self.m_battle_manager)
		item:setSolider(self.m_solider_data[i]["soldierType"], 1)
		item:hideHaemalstrand()
		item:setSoliderHealth(300, 100)
		item:setAnchorPoint(cc.p(0.5, 0.5))
		
		local posx, posy = self:getAttackLayoutPosition(i)
		item:setPositionInContainer(cc.p(posx-0.5*CONFIG_SCREEN_WIDTH, posy+0.5*CONFIG_SCREEN_HEIGHT))		
	
		item:setSoliderFlip(true)
		
		table.insert(self.m_solider_item_array, item)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] placeDefenseSolider
-- 在场景中添加防御阵营兵种
-------------------------------------------------------------------------------
function FLuaBattleGroup:placeDefenseSolider()
	local count = #self.m_solider_data
	local layoutCount = count
	if layoutCount > g_game.g_f_battle_define.MAX_LAYOUT_COUNT then
		layoutCount = g_game.g_f_battle_define.MAX_LAYOUT_COUNT
	end
	
	if layoutCount > 4 then		
		for i = 5, layoutCount do
			local item = require("scripts.game.battle.battle_ground.f_battle_solider").new()
			self:appendComponent(item)
			item:setSize(cc.size(100, 100))
			item:setSoliderData(self.m_solider_data[i])
			item:setBattleManager(self.m_battle_manager)
			item:setSolider(self.m_solider_data[i]["soldierType"], 2)
			item:hideHaemalstrand()
			item:setSoliderHealth(300, 100)			
			item:setAnchorPoint(cc.p(0.5, 0.5))
						
			local posx, posy = self:getDefenseLayoutPosition(i)
			item:setPositionInContainer(cc.p(posx+0.5*CONFIG_SCREEN_WIDTH, posy-0.5*CONFIG_SCREEN_HEIGHT))
			
			table.insert(self.m_solider_item_array, item)
		end
		for i = 1, 4 do
			local item = require("scripts.game.battle.battle_ground.f_battle_solider").new()
			self:appendComponent(item)
			item:setSize(cc.size(100, 100))
			item:setSoliderData(self.m_solider_data[i])
			item:setBattleManager(self.m_battle_manager)
			item:setSolider(self.m_solider_data[i]["soldierType"], 2)
			item:hideHaemalstrand()
			item:setSoliderHealth(300, 100)			
			item:setAnchorPoint(cc.p(0.5, 0.5))
			
			local posx, posy = self:getDefenseLayoutPosition(i)
			item:setPositionInContainer(cc.p(posx+0.5*CONFIG_SCREEN_WIDTH, posy-0.5*CONFIG_SCREEN_HEIGHT))
			
			table.insert(self.m_solider_item_array, i, item)
		end
	else		
		for i = 1, layoutCount do
			local item = require("scripts.game.battle.battle_ground.f_battle_solider").new()
			self:appendComponent(item)
			item:setSize(cc.size(100, 100))
			item:setSoliderData(self.m_solider_data[i])
			item:setBattleManager(self.m_battle_manager)
			item:setSolider(self.m_solider_data[i]["soldierType"], 2)
			item:hideHaemalstrand()
			item:setSoliderHealth(300, 100)			
			item:setAnchorPoint(cc.p(0.5, 0.5))
			
			local posx, posy = self:getDefenseLayoutPosition(i)
			item:setPositionInContainer(cc.p(posx+0.5*CONFIG_SCREEN_WIDTH, posy-0.5*CONFIG_SCREEN_HEIGHT))
			
			table.insert(self.m_solider_item_array, item)
		end	
	end

end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] groupFadeout
-- 阵容渐隐,用于回合切换
-------------------------------------------------------------------------------
function FLuaBattleGroup:groupFadeout(time)
	self:runAction(CCFadeOut:create(time))
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] groupFadein
-- 阵容渐现,用于回合切换
-------------------------------------------------------------------------------
function FLuaBattleGroup:groupFadein(time)
	self:setOpacity(255)
--	self:runAction(CCFadeIn:create(time))
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleGroup] getSolidr
-- 获取指定索引的兵种
-------------------------------------------------------------------------------
function FLuaBattleGroup:getSolidr(index)
	if index <= #self.m_solider_item_array then
		return self.m_solider_item_array[index]
	end
	return nil
end

return FLuaBattleGroup
