--[[--
    战斗回合类，用于存储每一个回合的数据
--]]--

local f_battle_round = class("f_battle_round")
f_battle_round.__index = f_battle_round

-------------------------------------------------
-- @function [parent=#f_battle_round] ctor
-------------------------------------------------
function f_battle_round:ctor()	
	self.m_time	= 0.0	
	self.m_current_state_time = 0.0
	
	self.m_battle_manager = nil
	self.m_round_index = 0
		
	self.m_all_round_data = nil
  	self.m_round_data = nil  	
  	
  	self.m_self_card_data = {}
  	self.m_enemy_card_data = {}
  	
  	self.m_skillsEffRes = {}
  	
  	self.m_round_is_finish = false
  	
  	
	self.m_round_array = {}
	self.m_single_index = 1
	
	self.PRE_ROUND_STATE				= 1
	self.PRE_ROUND_STORY				= 2
	self.START_ROUND_STATE				= 3
	self.ATTACK_PRINCE_SKILL_STATE		= 4
	self.DEFENSE_PRINCE_SKILL_STATE		= 5
	self.ROUNDING_STATE					= 6
	self.END_ROUND_STATE				= 7
	self.ROUND_FINISH					= 8	
	
	self.SUB_NONE_STATE			= 1
	self.SUB_SECOND_RUNING_STATE= 2
	self.SUB_THIRD_RUNING_STATE	= 3
	self.SUB_RUNING_STATE		= 4
	self.SUB_END_STATE			= 5
	
	
	self.m_currentState			= self.PRE_ROUND_STATE
	self.m_currentSubState		= self.SUB_NONE_STATE
	
	self.m_state_function		= {}
	
	local preRoundFunction = function(dt)
		self:state_preRound(dt)
	end
	self.m_state_function[self.PRE_ROUND_STATE]	= preRoundFunction
	
	local preRoundStoryFunction = function(dt)
		self:state_stageStory(dt)
	end
	self.m_state_function[self.PRE_ROUND_STORY]	= preRoundStoryFunction
	
	local startRoundFunction = function(dt)
		self:state_startRound(dt)
	end
	self.m_state_function[self.START_ROUND_STATE]	= startRoundFunction
	
	local attackPrinceSkillFunction = function(dt)
		self:state_attackPrinceSkill(dt)
	end
	self.m_state_function[self.ATTACK_PRINCE_SKILL_STATE]	= attackPrinceSkillFunction
	
	local defensePrinceSkillFunction = function(dt)
		self:state_defensePrinceSkill(dt)
	end
	self.m_state_function[self.DEFENSE_PRINCE_SKILL_STATE]	= defensePrinceSkillFunction
	
	
	local roundFunction = function(dt)
		self:state_Round(dt)
	end
	self.m_state_function[self.ROUNDING_STATE]	= roundFunction
	
	
	local endRoundFunction = function(dt)
		self:state_endRound(dt)
	end
	self.m_state_function[self.END_ROUND_STATE]	= endRoundFunction
	
	
	local roundFinishFunction = function(dt)
		self:state_roundFinish(dt)
	end
	self.m_state_function[self.ROUND_FINISH]	= roundFinishFunction
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_round] setBattleManager
-- 设置battle manager
-------------------------------------------------------------------------------
function f_battle_round:setBattleManager(manager)
	self.m_battle_manager = manager
end

-------------------------------------------------
-- @function [parent=#f_battle_round] setRoundIndex
-- 设置回合索引
-------------------------------------------------
function f_battle_round:setRoundIndex(index)
	self.m_round_index = index
end

-------------------------------------------------
-- @function [parent=#f_battle_round] enterRound
-- 进入回合
-------------------------------------------------
function f_battle_round:enterRound()
	self.m_time = 0.0	
	local attackGroup = self.m_battle_manager:getAttackGroup()
	local defenseGroup = self.m_battle_manager:getDefenseGroup()
	
	attackGroup:setVisible(true)
	defenseGroup:setVisible(true)
	attackGroup:groupFadein(0.0)
	defenseGroup:groupFadein(0.0)
	
	
	local leftBottom = self.m_battle_manager:getLeftBottomPanel()
	local rightTop = self.m_battle_manager:getRightTopPanel()	
	leftBottom:openAllCard()
	rightTop:openAllCard()
	
	attackGroup:soliderEnterBattle()
	return defenseGroup:soliderEnterBattle()
end

-------------------------------------------------
-- @function [parent=#f_battle_round] exitRound
-- 退出回合
-------------------------------------------------
function f_battle_round:exitRound()	
	local attackGroup = self.m_battle_manager:getAttackGroup()
	local defenseGroup = self.m_battle_manager:getDefenseGroup()
	
	attackGroup:groupFadeout(0.7)
	defenseGroup:groupFadeout(0.7)
	
	return 0.7
end

-------------------------------------------------
-- @function [parent=#f_battle_round] state_roundFinish
-- 状态机函数  ROUND_FINISH
-------------------------------------------------
function f_battle_round:state_roundFinish(dt)
	self.m_time = self.m_time + dt
	self:removeRoundAnim()
	self.m_round_is_finish = true
end
-------------------------------------------------
-- @function [parent=#f_battle_round] state_endRound
-- 状态机函数  END_ROUND_STATE
-------------------------------------------------
function f_battle_round:state_endRound(dt)
	self.m_time = self.m_time + dt

	if self.m_currentSubState == self.SUB_NONE_STATE then	
		self.m_currentSubState = self.SUB_RUNING_STATE
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then	
		if self.m_time > 1.0 then
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.ROUND_FINISH
		self.m_currentSubState = self.SUB_NONE_STATE
		self.m_time = 0.0
		
		self.m_battle_manager:getRightBottomPanel():disableSkipButton()
	end
end
-------------------------------------------------
-- @function [parent=#f_battle_round] state_Round
-- 状态机函数  ROUNDING_STATE
-------------------------------------------------
function f_battle_round:state_Round(dt)
	self.m_time = self.m_time + dt
	
	if self.m_currentSubState == self.SUB_NONE_STATE then		
		if self.m_single_index > 0 and self.m_single_index <= #self.m_round_array then
			self.m_round_array[self.m_single_index]:update(dt)
			if self.m_round_array[self.m_single_index]:singleIsFinish() then
				self.m_single_index = self.m_single_index + 1
			end
			if self.m_single_index > #self.m_round_array then
				self.m_current_state_time = self:exitRound()
				self.m_currentSubState = self.SUB_RUNING_STATE
				self.m_time = 0.0
			end
		end
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then
		if self.m_time > self.m_current_state_time then
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.END_ROUND_STATE
		self.m_currentSubState = self.SUB_NONE_STATE
		self.m_time = 0.0
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_round] state_defensePrinceSkill
-- 状态机函数  DEFENSE_PRINCE_SKILL_STATE
-------------------------------------------------
function f_battle_round:state_defensePrinceSkill(dt)
	self.m_time = self.m_time + dt
	if self.m_currentSubState == self.SUB_NONE_STATE then	
		local princeId = 0
		if self.m_battle_manager:selfIsAttack() then
			princeId = self.m_round_data["enemyPrinceId"]
		else
			princeId = self.m_round_data["selfPrinceId"]
		end
		if 	princeId ~= 0 then	
			self.m_current_state_time = self.m_battle_manager:getEffectLayer():showPrinceSkill(self.m_round_data, false, self.m_battle_manager:selfIsAttack())
			self.m_time = 0.0
			self.m_currentSubState = self.SUB_SECOND_RUNING_STATE
						
			g_game.g_director:getRunningScene():showAllUi(false)
			
			--播放皇子技能音效
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJINENG1)
		else
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_SECOND_RUNING_STATE then
		if self.m_time > self.m_current_state_time and self.m_battle_manager:getEffectLayer():showSkillIsFinish() then
			self.m_current_state_time = self.m_battle_manager:getSkillTriger():defensePrinceUseSkill()
			self.m_currentSubState = self.SUB_RUNING_STATE
			self.m_time = 0.0
		end
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then
		if self.m_time > self.m_current_state_time and self.m_battle_manager:getEffectLayer():showSkillIsFinish()  then
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.ROUNDING_STATE
		self.m_currentSubState = self.SUB_NONE_STATE
		
		self.m_battle_manager:getRightBottomPanel():enableSkipButton()
		
		self.m_time = 0.0
	end
	
end


-------------------------------------------------
-- @function [parent=#f_battle_round] state_attackPrinceSkill
-- 状态机函数  ATTACK_PRINCE_SKILL_STATE
-------------------------------------------------
function f_battle_round:state_attackPrinceSkill(dt)
	self.m_time = self.m_time + dt
	if self.m_currentSubState == self.SUB_NONE_STATE then	
		local princeId = 0
		if self.m_battle_manager:selfIsAttack() then
			princeId = self.m_round_data["selfPrinceId"]
		else
			princeId = self.m_round_data["enemyPrinceId"]
		end
		if 	princeId ~= 0 then
			self.m_current_state_time = self.m_battle_manager:getEffectLayer():showPrinceSkill(self.m_round_data, true, self.m_battle_manager:selfIsAttack())
			self.m_time = 0.0
			self.m_currentSubState = self.SUB_SECOND_RUNING_STATE
			
			g_game.g_director:getRunningScene():showAllUi(false)
						
			--播放皇子技能音效
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJINENG1)
		else
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_SECOND_RUNING_STATE then
		if self.m_time > self.m_current_state_time and self.m_battle_manager:getEffectLayer():showSkillIsFinish() then
			self.m_current_state_time = self.m_battle_manager:getSkillTriger():attackPrinceUseSkill()			
			self.m_currentSubState = self.SUB_RUNING_STATE
			self.m_time = 0.0
		end
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then
		if self.m_time > self.m_current_state_time and self.m_battle_manager:getEffectLayer():showSkillIsFinish()  then
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.DEFENSE_PRINCE_SKILL_STATE
		self.m_currentSubState = self.SUB_NONE_STATE
		self.m_time = 0.0
	end
	
end

-------------------------------------------------
-- @function [parent=#f_battle_round] state_startRound
-- 状态机函数  START_ROUND_STATE
-------------------------------------------------
function f_battle_round:state_startRound(dt)
	self.m_time = self.m_time + dt
	if self.m_currentSubState == self.SUB_NONE_STATE then			
		self.m_current_state_time = self.m_battle_manager:getEffectLayer():showRoundUI(self.m_round_index)
		self.m_time = 0.0
		self.m_currentSubState = self.SUB_RUNING_STATE
		
		--播放回合开始音效
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUHUIHE)
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then
		if self.m_time > self.m_current_state_time and self.m_battle_manager:getEffectLayer():showSkillIsFinish()  then
			self.m_currentSubState = self.SUB_END_STATE
			
			self.m_battle_manager:getLeftBottomPanel():firstCardStartBattle()
			self.m_battle_manager:getRightTopPanel():firstCardStartBattle()
			
			local defenseGroup = self.m_battle_manager:getDefenseGroup()	
			local attackGrounp = self.m_battle_manager:getAttackGroup()	
				
			local defenseSolider = defenseGroup:getSolidr(self.m_single_index)			
			local attackSolider = attackGrounp:getSolidr(self.m_single_index)	
					
			defenseSolider:showFlagBuffer(true)
			attackSolider:showFlagBuffer(true)
			
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.ATTACK_PRINCE_SKILL_STATE
		self.m_currentSubState = self.SUB_NONE_STATE
		self.m_time = 0.0
	end
end
-------------------------------------------------
-- @function [parent=#f_battle_round] state_preRound
-- 状态机函数  PRE_ROUND_STATE
-------------------------------------------------
function f_battle_round:state_preRound(dt)
	self.m_time = self.m_time + dt
	if self.m_currentSubState == self.SUB_NONE_STATE then	
		self:preLoadRoundAnim()	
		self.m_current_state_time = self:enterRound()
		self.m_time = 0.0
		self.m_currentSubState = self.SUB_RUNING_STATE
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then
		if self.m_time > self.m_current_state_time then
			local type = self.m_battle_manager.m_battle_data["battleType"]
		
			if type == g_game.g_f_battle_type.BATTLE_TYPE_PVE and self.m_round_index == 1 then
				self.m_currentState = self.PRE_ROUND_STORY
				self.m_currentSubState = self.SUB_NONE_STATE
				self.m_time = 0.0
			else
				self.m_currentSubState = self.SUB_END_STATE
			end
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.START_ROUND_STATE
		self.m_currentSubState = self.SUB_NONE_STATE
		self.m_time = 0.0
	end
	
end

-------------------------------------------------
-- @function [parent=#f_battle_round] insertEff
-------------------------------------------------
function f_battle_round:insertEff(skillId)
	if skillId == 0 then
		return	
	end
	local info = g_game.g_dictConfigManager:getSkillInfo(skillId)
	local effRes = info[4]
	local isRepeat = false
	for i = 1, #self.m_skillsEffRes do
		if self.m_skillsEffRes[i] == effRes then
			isRepeat = true
			break
		end
	end
	
	if isRepeat == false then
		table.insert(self.m_skillsEffRes, effRes)
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_round] preLoadRoundAnim
-------------------------------------------------
function f_battle_round:preLoadRoundAnim()
	--prince id
	self:insertEff(self.m_round_data["enemyPrinceSkillId"])
	self:insertEff(self.m_round_data["selfPrinceSkillId"])
	
	for i = 1,self.m_round_data["fightData_Num"] do
		self:insertEff(self.m_round_data["fightData"][i]["selfSkillId"])
		self:insertEff(self.m_round_data["fightData"][i]["enemySkillId"])
	end
	
	for j = 1, #self.m_skillsEffRes do
		g_game.g_resourceManager:preloadFAnimation(self.m_skillsEffRes[j])
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_round] removeRoundAnim
-------------------------------------------------
function f_battle_round:removeRoundAnim()
	for j = 1, #self.m_skillsEffRes do
		g_game.g_resourceManager:removeFAnimation(self.m_skillsEffRes[j])
	end
	self.m_skillsEffRes = {}
end

-------------------------------------------------
-- @function [parent=#f_battle_round] state_stageStory
-- 战斗前剧情
-------------------------------------------------
function f_battle_round:state_stageStory(dt)
	self.m_time = self.m_time + dt
	
	if self.m_currentSubState == self.SUB_NONE_STATE then	
		local isAlreadyFight = self.m_battle_manager.m_battle_data["isAlreadyFight"]
		local levelId = self.m_battle_manager.m_battle_data["levelId"]
		local hasStory = g_game.g_dictConfigManager:hasStageStory(levelId)
		if isAlreadyFight == false and hasStory == true then
			local stageStory = require("scripts.game.battle.effect_component.f_battle_story_panel").new()	
			g_game.g_panelManager:showUiPanel(stageStory,"story_stage_panel")
			local storyPersonData = g_game.g_dictConfigManager:getStageStoryPersonData(levelId)
			stageStory:setPersonData(storyPersonData)
		
			self.m_currentSubState = self.SUB_RUNING_STATE
		else
			self.m_currentSubState = self.SUB_END_STATE
		end
	elseif self.m_currentSubState == self.SUB_RUNING_STATE then
		local storyPanel = g_game.g_panelManager:getUiPanel("story_stage_panel")
		if storyPanel:isShowOver() then
			self.m_currentSubState = self.SUB_END_STATE
			g_game.g_panelManager:removeUiPanel("story_stage_panel")
		end
	elseif self.m_currentSubState == self.SUB_END_STATE	then
		self.m_currentState = self.START_ROUND_STATE
		self.m_currentSubState = self.SUB_NONE_STATE
		self.m_time = 0.0
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_round] update
-- 战斗心跳
-------------------------------------------------
function f_battle_round:update(dt)
	self.m_state_function[self.m_currentState](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_round] loadSelfCard()
-- 加载己方卡牌数据
-------------------------------------------------------------------------------
function f_battle_round:loadSelfCard()
	local currentCard = nil
	for i = 1, #self.m_round_data["selfFightArray"] do
		local index = self.m_round_data["selfFightArray"][i]["selfFightIndex"]
		currentCard = clone(self.m_all_round_data["battleArray"][index])
		table.insert(self.m_self_card_data, currentCard)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_round] loadEnemyCard()
-- 加载敌方卡牌数据
-------------------------------------------------------------------------------
function f_battle_round:loadEnemyCard()
	local currentCard = nil
	for i = 1, #self.m_round_data["enemyFightArray"] do
		local index = self.m_round_data["enemyFightArray"][i]["enemyFightIndex"]
		currentCard = clone(self.m_all_round_data["enemyBattleArray"][index])
		table.insert(self.m_enemy_card_data, currentCard)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_round] loadRoundData
-- 加载回合数据
-------------------------------------------------------------------------------
function f_battle_round:loadRoundData(allBattleData)
	self.m_all_round_data = allBattleData
	self.m_round_data	= clone(self.m_all_round_data["roundData"][self.m_round_index])
	
	--遍历整个战斗数据，计算当前回合数据之前死亡后的卡牌
	self:loadSelfCard()
	self:loadEnemyCard()
	
	for i = 1, #self.m_round_data["fightData"] do
		local single = require("scripts.game.battle.battle_round.f_battle_single").new()
		single:setSingleIndex(i)
		single:setRoundData(self.m_round_data["fightData"][i])
		single:setBattleManager(self.m_battle_manager)
		
		table.insert(self.m_round_array, single)	
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_round] roundIsFinish
-- 回合是否结束
-------------------------------------------------------------------------------
function f_battle_round:roundIsFinish()
	return self.m_round_is_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_round] loadCurrentRoundDataToScene
-- 将当前回合的数据加载到卡牌列表和地图中
-------------------------------------------------------------------------------
function f_battle_round:loadCurrentRoundDataToScene()
	--加载卡牌列表
	local leftBottom = self.m_battle_manager:getLeftBottomPanel()
	local rightTop = self.m_battle_manager:getRightTopPanel()	
	
	if self.m_battle_manager:selfIsAttack() then
		leftBottom:showCardList(self.m_self_card_data, true)
		rightTop:showCardList(self.m_enemy_card_data, false)
	else
		leftBottom:showCardList(self.m_enemy_card_data, false)
		rightTop:showCardList(self.m_self_card_data, true)
	end
	
	--加载战斗场景兵种
	local attackGroup = self.m_battle_manager:getAttackGroup()
	local defenseGroup = self.m_battle_manager:getDefenseGroup()
	if self.m_battle_manager:selfIsAttack() then
		attackGroup:setGroupData(self.m_self_card_data)
		defenseGroup:setGroupData(self.m_enemy_card_data)
	else
		attackGroup:setGroupData(self.m_enemy_card_data)
		defenseGroup:setGroupData(self.m_self_card_data)
	end
	
	for i = 1, #self.m_round_array do
		local single = self.m_round_array[i]	
		single:preFillSoliderHeath()
	end
	
		
	self.m_battle_manager:getSkillTriger():setAllRoundData(self.m_round_data)
end

return f_battle_round