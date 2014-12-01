--[[--
    战斗回合中的一次交战，用于执行每一次交战
--]]--

local f_battle_single = class("f_battle_single")
f_battle_single.__index = f_battle_single

-------------------------------------------------
-- @function [parent=#f_battle_single] ctor
-------------------------------------------------
function f_battle_single:ctor()	
	self.m_time					= 0.0	
	
	self.m_round_data 			= nil
	
  	self.m_single_is_finish 	= false
  	
  	self.m_single_index 		= 0
  	
	self.m_battle_manager 		= nil
	self.m_skill_triger			= nil
	
	self.m_skill_time			= 3.0 --定制每次释放技能持续的时间
	self.m_finish_current_single = 0.1 --结束和开始本次战斗的延迟时间
	
	self.PRE_START_STATE 		= 1
	self.ATTACK_SKILL_STATE 	= 2
	self.DEFENSE_SKILL_STATE 	= 3
	self.FORBEAR_STATE 			= 4
	self.ATTACK_NORMAL_STATE 	= 5
	self.DEFENSE_NORMAL_STATE 	= 6
	self.FINISH_STATE		 	= 7
	
	self.NONE_SUB_STATE			= 1
	self.ON_ENTER_SUB_STATE		= 2
	self.ON_DOING_SUB_STATE		= 3
	self.ON_EXIT_SUB_STATE		= 4
	
	
	self.f_state_function		= {}
	local preStartFunction = function(dt)
		self:stateFunctionPreStart(dt)
	end
	self.f_state_function[self.PRE_START_STATE]	= preStartFunction	
	local attackSkillFunction = function(dt)
		self:stateFunctionAttackSkill(dt)
	end
	self.f_state_function[self.ATTACK_SKILL_STATE]	= attackSkillFunction
	local defenseSkillFunction = function(dt)
		self:stateFunctionDefenseSkill(dt)
	end
	self.f_state_function[self.DEFENSE_SKILL_STATE]	= defenseSkillFunction
	local forbearSkillFunction = function(dt)
		self:stateFunctionForbearSkill(dt)
	end
	self.f_state_function[self.FORBEAR_STATE]	= forbearSkillFunction
	local attackNormalFunction = function(dt)
		self:stateFunctionAttackNormal(dt)
	end
	self.f_state_function[self.ATTACK_NORMAL_STATE]	= attackNormalFunction
	local defenseNormalFunction = function(dt)
		self:stateFunctionDefenseNormal(dt)
	end
	self.f_state_function[self.DEFENSE_NORMAL_STATE]	= defenseNormalFunction
	local finishFunction = function(dt)
		self:stateFunctionFinish(dt)
	end
	self.f_state_function[self.FINISH_STATE]	= finishFunction
	
	self.m_current_state		= self.PRE_START_STATE
	self.m_current_sub_state	= self.NONE_SUB_STATE
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_single] setBattleManager
-- 设置battle manager
-------------------------------------------------------------------------------
function f_battle_single:setBattleManager(manager)
	self.m_battle_manager = manager
end

-------------------------------------------------
-- @function [parent=#f_battle_single] setSingleIndex
-- 设置回合索引
-------------------------------------------------
function f_battle_single:setSingleIndex(index)
	self.m_single_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_single] singleIsFinish
-- 回合是否结束
-------------------------------------------------------------------------------
function f_battle_single:singleIsFinish()
	return self.m_single_is_finish
end

-------------------------------------------------
-- @function [parent=#f_battle_single] update
-- 战斗心跳
-------------------------------------------------
function f_battle_single:update(dt)
	self.f_state_function[self.m_current_state](dt)	
end

-------------------------------------------------
-- @function [parent=#f_battle_single] setRoundData
-- 当前回合中的某一次战斗
-------------------------------------------------
function f_battle_single:setRoundData(round)
	self.m_round_data = round	
end

-------------------------------------------------
-- @function [parent=#f_battle_single] fillCurrentRoundDataToSkillTriger
-- 填充当前回合数据到技能逻辑类
-------------------------------------------------
function f_battle_single:fillCurrentRoundDataToSkillTriger()
	self.m_skill_triger = self.m_battle_manager:getSkillTriger()
	self.m_skill_triger:setIndexInRound(self.m_single_index)
	self.m_skill_triger:setRoundData(self.m_round_data)
end


-------------------------------------------------
-- @function [parent=#f_battle_single] preFillSoliderHeath
-- 提前填充兵团血量
-------------------------------------------------
function f_battle_single:preFillSoliderHeath()
	local defenseGroup = self.m_battle_manager:getDefenseGroup()	
	local attackGrounp = self.m_battle_manager:getAttackGroup()	
		
	local defenseSolider = defenseGroup:getSolidr(self.m_single_index)			
	local attackSolider = attackGrounp:getSolidr(self.m_single_index)	
	
	
	--初始化血量
    if self.m_battle_manager:selfIsAttack() then
		attackSolider:setSoliderHealth(self.m_round_data["selfCurrValue"], self.m_round_data["selfCurrValue"])
		defenseSolider:setSoliderHealth(self.m_round_data["enemyCurrValue"], self.m_round_data["enemyCurrValue"])
	else
		attackSolider:setSoliderHealth(self.m_round_data["enemyCurrValue"], self.m_round_data["enemyCurrValue"])
		defenseSolider:setSoliderHealth(self.m_round_data["selfCurrValue"], self.m_round_data["selfCurrValue"])
	end
	
	attackSolider:showHaemalstrand()
	defenseSolider:showHaemalstrand()
end

-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionPreStart
-- 战斗开始前预处理
-------------------------------------------------
function f_battle_single:stateFunctionPreStart(dt)
	self.m_time = self.m_time + dt
	if self.m_time > self.m_finish_current_single then
		self.m_current_state		= self.ATTACK_SKILL_STATE
		self.m_current_sub_state	= self.NONE_SUB_STATE
		self.m_time = 0.0
		
		self.m_battle_manager:getLeftBottomPanel():firstCardStartBattle()
		self.m_battle_manager:getRightTopPanel():firstCardStartBattle()
		
		local defenseGroup = self.m_battle_manager:getDefenseGroup()	
		local attackGrounp = self.m_battle_manager:getAttackGroup()	
			
		local defenseSolider = defenseGroup:getSolidr(self.m_single_index)			
		local attackSolider = attackGrounp:getSolidr(self.m_single_index)	
				
		defenseSolider:showFlagBuffer(true)
		attackSolider:showFlagBuffer(true)
		
		
		self:fillCurrentRoundDataToSkillTriger()
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionAttackSkill
-- 攻击方释放技能
-- 
--	self.NONE_SUB_STATE			= 1
--	self.ON_ENTER_SUB_STATE		= 2
--	self.ON_DOING_SUB_STATE		= 3
--	self.ON_EXIT_SUB_STATE		= 4
-------------------------------------------------
function f_battle_single:stateFunctionAttackSkill(dt)
	self.m_time = self.m_time + dt
	
	if self.m_current_sub_state	== self.NONE_SUB_STATE then
		if self.m_skill_triger:attackHasUseSkill() then
			self.m_skill_time = self.m_skill_triger:attackUseSkill()
			self.m_current_sub_state = self.ON_DOING_SUB_STATE
			
		else--攻击方没有使用技能，退出当前状态
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end
		
	elseif self.m_current_sub_state	== self.ON_ENTER_SUB_STATE then
	elseif self.m_current_sub_state	== self.ON_DOING_SUB_STATE then
		if self.m_time >= self.m_skill_time and self.m_skill_triger:currentSkillIsFinish() then
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end
	elseif self.m_current_sub_state	== self.ON_EXIT_SUB_STATE then		
		self.m_current_state		= self.DEFENSE_SKILL_STATE
		self.m_current_sub_state	= self.NONE_SUB_STATE
		self.m_time = 0.0
	end	
end


-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionDefenseSkill
-- 防御方释放技能
-------------------------------------------------
function f_battle_single:stateFunctionDefenseSkill(dt)
	self.m_time = self.m_time + dt
	
	if self.m_current_sub_state	== self.NONE_SUB_STATE then
		if self.m_skill_triger:defenseHasUseSkill() then
			self.m_skill_time = self.m_skill_triger:defenseUseSkill()
			self.m_current_sub_state = self.ON_DOING_SUB_STATE
			
		else--攻击方没有使用技能，退出当前状态
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end		
	elseif self.m_current_sub_state	== self.ON_ENTER_SUB_STATE then
	elseif self.m_current_sub_state	== self.ON_DOING_SUB_STATE then
		if self.m_time >= self.m_skill_time and self.m_skill_triger:currentSkillIsFinish() then
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end
	elseif self.m_current_sub_state	== self.ON_EXIT_SUB_STATE then		
		self.m_current_state		= self.FORBEAR_STATE
		self.m_current_sub_state	= self.NONE_SUB_STATE
		self.m_time = 0.0
	end	
end

-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionForbearSkill
-- 判定克制
-------------------------------------------------
function f_battle_single:stateFunctionForbearSkill(dt)	
	self.m_time = self.m_time + dt	
	
	if self.m_current_sub_state	== self.NONE_SUB_STATE then
	
		if self.m_skill_triger:hasForbear() then
			self.m_skill_time = self.m_skill_triger:Forbear()
			self.m_current_sub_state = self.ON_DOING_SUB_STATE
			
		else--攻击方没有使用技能，退出当前状态
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end		
		
	elseif self.m_current_sub_state	== self.ON_ENTER_SUB_STATE then
		if self.m_time > 5.0 then
			self.m_current_sub_state = self.ON_DOING_SUB_STATE
		end
	elseif self.m_current_sub_state	== self.ON_DOING_SUB_STATE then
		if self.m_time >= self.m_skill_time and self.m_skill_triger:currentSkillIsFinish() then
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
			self.m_skill_triger:ForbearFinish()
		end
	elseif self.m_current_sub_state	== self.ON_EXIT_SUB_STATE then		
		self.m_current_state		= self.ATTACK_NORMAL_STATE
		self.m_current_sub_state	= self.NONE_SUB_STATE
		self.m_time = 0.0
	end	
end

-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionAttackNormal
-- 攻击方普通技能
-------------------------------------------------
function f_battle_single:stateFunctionAttackNormal(dt)
	self.m_time = self.m_time + dt
	
	if self.m_current_sub_state	== self.NONE_SUB_STATE then		
		if self:attackIsDead() then			
			self.m_skill_time = self.m_skill_triger:attackNormalAttack()
		else
			self.m_skill_time = self.m_skill_triger:defenseNormalAttack()
		end	
		self.m_current_sub_state = self.ON_DOING_SUB_STATE
	elseif self.m_current_sub_state	== self.ON_ENTER_SUB_STATE then
	elseif self.m_current_sub_state	== self.ON_DOING_SUB_STATE then
		if self.m_time >= self.m_skill_time and self.m_skill_triger:currentSkillIsFinish() then
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end
	elseif self.m_current_sub_state	== self.ON_EXIT_SUB_STATE then		
		self.m_current_state		= self.DEFENSE_NORMAL_STATE
		self.m_current_sub_state	= self.NONE_SUB_STATE
		self.m_time = 0.0
	end	

end

-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionDefenseNormal
-- 防御方普通技能
-------------------------------------------------
function f_battle_single:stateFunctionDefenseNormal(dt)
	self.m_time = self.m_time + dt
	
	if self.m_current_sub_state	== self.NONE_SUB_STATE then		
		if self:attackIsDead() then
			self.m_skill_time = self.m_skill_triger:defenseNormalAttack()
		else
			self.m_skill_time = self.m_skill_triger:attackNormalAttack()
		end
		self.m_current_sub_state = self.ON_DOING_SUB_STATE
	elseif self.m_current_sub_state	== self.ON_ENTER_SUB_STATE then
	elseif self.m_current_sub_state	== self.ON_DOING_SUB_STATE then
		if self.m_time >= self.m_skill_time and self.m_skill_triger:currentSkillIsFinish() then
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
		end
	elseif self.m_current_sub_state	== self.ON_EXIT_SUB_STATE then		
		self.m_current_state		= self.FINISH_STATE
		self.m_current_sub_state	= self.NONE_SUB_STATE
		self.m_time = 0.0
	end	
end

-------------------------------------------------
-- @function [parent=#f_battle_single] stateFunctionFinish
-- 战斗结束，进入下一回合前操作
-------------------------------------------------
function f_battle_single:stateFunctionFinish(dt)
	self.m_time = self.m_time + dt
	
	if self.m_current_sub_state	== self.NONE_SUB_STATE then	
			
		local defenseGroup = self.m_battle_manager:getDefenseGroup()		
		local defenseSolider = defenseGroup:getSolidr(self.m_single_index)	
		
		local attackGrounp = self.m_battle_manager:getAttackGroup()	
		local attackSolider = attackGrounp:getSolidr(self.m_single_index)	
		
		if self.m_battle_manager:selfIsAttack() then
			if self.m_round_data["selfRemained"] <= 0 then		
				self.m_battle_manager:getLeftBottomPanel():cardDead()	
				attackSolider:slodierDead()
			else
				self.m_battle_manager:getLeftBottomPanel():cardUseFinish()
			end		
			
			if self.m_round_data["enemyRemained"] <= 0 then
				self.m_battle_manager:getRightTopPanel():cardDead()
				defenseSolider:slodierDead()
			else
				self.m_battle_manager:getRightTopPanel():cardUseFinish()
			end				
		else
			if self.m_round_data["selfRemained"] <= 0 then
				self.m_battle_manager:getRightTopPanel():cardDead()
				defenseSolider:slodierDead()
			else
				self.m_battle_manager:getRightTopPanel():cardUseFinish()
			end
			if self.m_round_data["enemyRemained"] <= 0 then
				self.m_battle_manager:getLeftBottomPanel():cardDead()
				attackSolider:slodierDead()
			else
				self.m_battle_manager:getLeftBottomPanel():cardUseFinish()
			end			
		end
		
		self.m_current_sub_state = self.ON_DOING_SUB_STATE
		
		--播放死亡音效
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_SIWANG)
		
	elseif self.m_current_sub_state	== self.ON_ENTER_SUB_STATE then
	elseif self.m_current_sub_state	== self.ON_DOING_SUB_STATE then
		if self.m_time > self.m_finish_current_single then
			self.m_current_sub_state = self.ON_EXIT_SUB_STATE
			
			local defenseGroup = self.m_battle_manager:getDefenseGroup()	
			local attackGrounp = self.m_battle_manager:getAttackGroup()	
				
			local defenseSolider = defenseGroup:getSolidr(self.m_single_index)			
			local attackSolider = attackGrounp:getSolidr(self.m_single_index)	
			
			
			defenseSolider:showFlagBuffer(false)
			attackSolider:showFlagBuffer(false)
			
		end
	elseif self.m_current_sub_state	== self.ON_EXIT_SUB_STATE then			
		self.m_single_is_finish = true
		
		self.m_skill_triger = nil
	end	
end


-------------------------------------------------
-- @function [parent=#f_battle_single] attackIsDead
-- 判定是否攻击方最终死亡
-------------------------------------------------
function f_battle_single:attackIsDead()
	if self.m_battle_manager:selfIsAttack() then
		if self.m_round_data["selfRemained"] <= 0 then	
			return true
		end
		return false
	else		
		if self.m_round_data["enemyRemained"] <= 0 then
			return true
		end
		return false
	end
end


return f_battle_single