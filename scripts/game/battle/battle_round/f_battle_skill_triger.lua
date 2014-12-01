--[[--
    战斗回合中，用于执行技能释放
--]]--

local f_battle_skill_triger = class("f_battle_skill_triger")
f_battle_skill_triger.__index = f_battle_skill_triger


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] ctor
-------------------------------------------------
function f_battle_skill_triger:ctor()	
	self.m_index_in_round = 0
	self.m_battle_manager = nil
	
	self.m_all_round_data = nil
	self.m_current_round_data = nil
	
	self.m_current_skill_info = nil
	
	self.m_first_group = nil
	self.m_second_group = nil
	self.m_current_skill_id = 0
	self.m_current_is_attack = false
	
	self.m_current_skill_finish = false
	
	self.m_skill_time_define = {}
	self.m_skill_time_define[1] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[2] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[3] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[4] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[5] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[6] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[7] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[8] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[9] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[10] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[11] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[20] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[21] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[22] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[23] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[24] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[25] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[26] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[27] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[28] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[29] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[30] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	self.m_skill_time_define[31] = g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
	
	self.m_skill_logic_function = {}
	local skill1Function = function()
		return self:skillTriger1()
	end
	self.m_skill_logic_function[1] = skill1Function
	local skill2Function = function()
		return self:skillTriger2()
	end
	self.m_skill_logic_function[2] = skill2Function
	local skill3Function = function()
		return self:skillTriger3()
	end
	self.m_skill_logic_function[3] = skill3Function
	local skill4Function = function()
		return self:skillTriger4()
	end
	self.m_skill_logic_function[4] = skill4Function
	local skill5Function = function()
		return self:skillTriger5()
	end
	self.m_skill_logic_function[5] = skill5Function
	local skill6Function = function()
		return self:skillTriger6()
	end
	self.m_skill_logic_function[6] = skill6Function
	local skill7Function = function()
		return self:skillTriger7()
	end
	self.m_skill_logic_function[7] = skill7Function
	local skill8Function = function()
		return self:skillTriger8()
	end
	self.m_skill_logic_function[8] = skill8Function
	local skill9Function = function()
		return self:skillTriger9()
	end
	self.m_skill_logic_function[9] = skill9Function
	local skill10Function = function()
		return self:skillTriger10()
	end
	self.m_skill_logic_function[10] = skill10Function
	local skill11Function = function()
		return self:skillTriger11()
	end
	self.m_skill_logic_function[11] = skill11Function
	
	
	local skill20Function = function()
		return self:skillTriger20()
	end
	self.m_skill_logic_function[20] = skill20Function
	local skill21Function = function()
		return self:skillTriger21()
	end
	self.m_skill_logic_function[21] = skill21Function
	local skill22Function = function()
		return self:skillTriger22()
	end
	self.m_skill_logic_function[22] = skill22Function
	local skill23Function = function()
		return self:skillTriger23()
	end
	self.m_skill_logic_function[23] = skill23Function
	local skill24Function = function()
		return self:skillTriger24()
	end
	self.m_skill_logic_function[24] = skill24Function
	local skill25Function = function()
		return self:skillTriger25()
	end
	self.m_skill_logic_function[25] = skill25Function
	local skill26Function = function()
		return self:skillTriger26()
	end
	self.m_skill_logic_function[26] = skill26Function
	local skill27Function = function()
		return self:skillTriger27()
	end
	self.m_skill_logic_function[27] = skill27Function
	local skill28Function = function()
		return self:skillTriger28()
	end
	self.m_skill_logic_function[28] = skill28Function
	local skill29Function = function()
		return self:skillTriger29()
	end
	self.m_skill_logic_function[29] = skill29Function
	local skill30Function = function()
		return self:skillTriger30()
	end
	self.m_skill_logic_function[30] = skill30Function
	local skill31Function = function()
		return self:skillTriger31()
	end
	self.m_skill_logic_function[31] = skill31Function
	
	
	self.m_triger_call_back_table = {}
	self.m_triger_call_back_table[1] = nil--皇子技能释放时候震屏回调
	
	self.MAX_TRIGER_CALL_BACK_TABLE_NUM		= 1
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] update
-- 战斗心跳
-------------------------------------------------
function f_battle_skill_triger:update(dt)
	for i = 1, self.MAX_TRIGER_CALL_BACK_TABLE_NUM do	
		if self.m_triger_call_back_table[i] ~= nil then
			self.m_triger_call_back_table[i][2] = self.m_triger_call_back_table[i][2] + dt * 1000
			if self.m_triger_call_back_table[i][2] > self.m_triger_call_back_table[i][3] then
				self.m_triger_call_back_table[i][1]()
				self.m_triger_call_back_table[i] = nil
			end
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] playCardSkillSound
-- 播放名臣技能音效
-------------------------------------------------
function f_battle_skill_triger:playCardSkillSound(solider, isRecover)
	local type = solider:getSoliderType()	
	if isRecover == true then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG2)
		return
	end
	if type < 5 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG1)
	elseif type < 9 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG5)
	elseif type < 13 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG4)
	else
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG3)
	end
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] setIndexInRound
-- 设置当前回合内进行战斗的兵团索引
-------------------------------------------------
function f_battle_skill_triger:setIndexInRound(index)	
	self.m_index_in_round = index
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] setBattleManager
-- 设置战斗管理类
-------------------------------------------------
function f_battle_skill_triger:setBattleManager(battleManager)	
	self.m_battle_manager = battleManager
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] setRoundData
-- 设置当前回合的数据
-------------------------------------------------
function f_battle_skill_triger:setRoundData(roundData)	
	self.m_current_round_data = roundData
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] setAllRoundData
-- 设置所有战斗数据
-------------------------------------------------
function f_battle_skill_triger:setAllRoundData(allRoundData)	
	self.m_all_round_data = allRoundData
end
	
-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] currentSkillIsFinish
-- 本次技能使用完毕
-------------------------------------------------
function f_battle_skill_triger:currentSkillIsFinish()	
	return self.m_current_skill_finish
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] attackHasUseSkill
-- 攻击方是否使用了技能
-------------------------------------------------
function f_battle_skill_triger:attackHasUseSkill()	
	local skillId = 0
	if self.m_battle_manager:selfIsAttack() then
		skillId = self.m_current_round_data["selfSkillId"]
	else
		skillId = self.m_current_round_data["enemySkillId"]
	end	
	return skillId > 0
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] defenseHasUseSkill
-- 防御方是否使用了技能
-------------------------------------------------
function f_battle_skill_triger:defenseHasUseSkill()	
	local skillId = 0
	if self.m_battle_manager:selfIsAttack() then
		skillId = self.m_current_round_data["enemySkillId"]
	else
		skillId = self.m_current_round_data["selfSkillId"]
	end	
	return skillId > 0
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] attackPrinceUseSkill
-- 攻击方皇子使用技能
-------------------------------------------------
function f_battle_skill_triger:attackPrinceUseSkill()	
	self.m_current_skill_finish = false
	self.m_current_is_attack = true
	
	if self.m_battle_manager:selfIsAttack() then
		self.m_current_skill_id = self.m_all_round_data["selfPrinceSkillId"]
	else
		self.m_current_skill_id = self.m_all_round_data["enemyPrinceSkillId"]
	end	

	self.m_first_group = self.m_battle_manager:getAttackGroup()
	self.m_second_group = self.m_battle_manager:getDefenseGroup()	
	
	self.m_current_skill_info = g_game.g_dictConfigManager:getSkillInfo(self.m_current_skill_id)
	
	local skill_type = self.m_current_skill_info[5]
		
	self.m_skill_logic_function[skill_type]()
	
	
	return self.m_skill_time_define[skill_type]
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] defensePrinceUseSkill
-- 防御方皇子使用技能
-------------------------------------------------
function f_battle_skill_triger:defensePrinceUseSkill()
	self.m_current_skill_finish = false
	self.m_current_is_attack = false
	
	if self.m_battle_manager:selfIsAttack() then
		self.m_current_skill_id = self.m_all_round_data["enemyPrinceSkillId"]
	else
		self.m_current_skill_id = self.m_all_round_data["selfPrinceSkillId"]
	end		

	self.m_first_group = self.m_battle_manager:getDefenseGroup()	
	self.m_second_group = self.m_battle_manager:getAttackGroup()
		
	
	self.m_current_skill_info = g_game.g_dictConfigManager:getSkillInfo(self.m_current_skill_id)
	
	local skill_type = self.m_current_skill_info[5]
	
	self.m_skill_logic_function[skill_type]()
	
	
	return self.m_skill_time_define[skill_type]
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] attackUseSkill
-- 攻击方使用技能
-------------------------------------------------
function f_battle_skill_triger:attackUseSkill()	
	self.m_current_skill_finish = false
	self.m_current_is_attack = true
	
	local currentCardId = 0

	if self.m_battle_manager:selfIsAttack() then
		self.m_current_skill_id = self.m_current_round_data["selfSkillId"]
		currentCardId = self.m_current_round_data["selfOfficerId"]
	else
		self.m_current_skill_id = self.m_current_round_data["enemySkillId"]
		currentCardId = self.m_current_round_data["enemyOfficerId"]
	end	

	self.m_first_group = self.m_battle_manager:getAttackGroup()
	self.m_second_group = self.m_battle_manager:getDefenseGroup()	
	
	
	self.m_current_skill_info = g_game.g_dictConfigManager:getSkillInfo(self.m_current_skill_id)
	
	local skill_type = self.m_current_skill_info[5]
	
	local useSkillSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	
	
	local cardQuality = g_game.g_dictConfigManager:getCardQuality(currentCardId)
	
	if cardQuality < 3 then
		local timeRemind = self.m_battle_manager:getBattleEffectManager():getScaleSoliderInfoTime()
	
		self.m_battle_manager:getBattleEffectManager():scaleSoliderInfo(self.m_current_skill_info, useSkillSolider, self.m_skill_logic_function[skill_type])	
		
		return timeRemind + self.m_skill_time_define[skill_type]	
	else
	
		local cardShowFinish = function()
			self.m_battle_manager:getBattleEffectManager():cardSkillInfoShow(self.m_skill_logic_function[skill_type], self.m_current_skill_info, currentCardId, true)	
		end
		
		local showCardTime = self.m_battle_manager:getEffectLayer():showFloatCardImage(true, currentCardId, useSkillSolider, cardShowFinish)
		
		local timeRemind = self.m_battle_manager:getBattleEffectManager():getCardSkillInfoShowTime()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MC_JINENGZHANSHI)
		
		return showCardTime + timeRemind + self.m_skill_time_define[skill_type]	
	
	end

end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] defenseUseSkill
-- 防御方使用技能
-------------------------------------------------
function f_battle_skill_triger:defenseUseSkill()
	self.m_current_skill_finish = false
	self.m_current_is_attack = false
	
	local currentCardId = 0
	if self.m_battle_manager:selfIsAttack() then
		self.m_current_skill_id = self.m_current_round_data["enemySkillId"]
		currentCardId = self.m_current_round_data["enemyOfficerId"]
	else
		self.m_current_skill_id = self.m_current_round_data["selfSkillId"]
		currentCardId = self.m_current_round_data["selfOfficerId"]
	end		

	self.m_first_group = self.m_battle_manager:getDefenseGroup()	
	self.m_second_group = self.m_battle_manager:getAttackGroup()
	
	
	self.m_current_skill_info = g_game.g_dictConfigManager:getSkillInfo(self.m_current_skill_id)
	
	local skill_type = self.m_current_skill_info[5]
	
	local useSkillSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	
	local cardQuality = g_game.g_dictConfigManager:getCardQuality(currentCardId)
	
	if cardQuality < 3 then
		local timeRemind = self.m_battle_manager:getBattleEffectManager():getScaleSoliderInfoTime()
		
		self.m_battle_manager:getBattleEffectManager():scaleSoliderInfo(self.m_current_skill_info, useSkillSolider, self.m_skill_logic_function[skill_type])	
		
		return timeRemind + self.m_skill_time_define[skill_type]	
	else
	
		local cardShowFinish = function()
			self.m_battle_manager:getBattleEffectManager():cardSkillInfoShow(self.m_skill_logic_function[skill_type], self.m_current_skill_info, currentCardId, false)	
		end
		
		local showCardTime = self.m_battle_manager:getEffectLayer():showFloatCardImage(false, currentCardId, useSkillSolider, cardShowFinish)
		
		local timeRemind = self.m_battle_manager:getBattleEffectManager():getCardSkillInfoShowTime()
		
		return showCardTime + timeRemind + self.m_skill_time_define[skill_type]
	
	end
	
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] handlerSkillConfig
-- 处理当前技能的预配置逻辑
-------------------------------------------------
function f_battle_skill_triger:handlerSkillConfig(isAttack, attackSolider, defenseSolider)	

	if isAttack then
		if self.m_current_skill_info[15] == 1 then
			self.m_battle_manager:getBattleEffectManager():scaleSolider(attackSolider)
		end
	else		
		if self.m_current_skill_info[16] == 1 then
			self.m_battle_manager:getBattleEffectManager():scaleMap(defenseSolider, attackSolider)
		end
		if self.m_current_skill_info[19] == 1 then
			self.m_battle_manager:getBattleEffectManager():shakeMap(defenseSolider, attackSolider)
		end
		if self.m_current_skill_info[20] == 1 then
			self.m_battle_manager:getBattleEffectManager():shakeSolider(defenseSolider)
		end	
	end

end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger1
-- 技能1逻辑函数 一鼓作气
-------------------------------------------------
function f_battle_skill_triger:skillTriger1()	
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end
	
	local attackSkillFinish = function()
	--被攻击方属性变化回调
	--被攻击方逻辑处理
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
					self.m_first_group:getSolidr(additionIndex):skillDefense(self.m_current_skill_id, allSkillFinish, nil, nil, nil)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
					self.m_first_group:getSolidr(additionIndex):skillDefense(self.m_current_skill_id, allSkillFinish, nil, nil, nil)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
					self.m_first_group:getSolidr(additionIndex):skillDefense(self.m_current_skill_id, allSkillFinish, nil, nil, nil)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
					self.m_first_group:getSolidr(additionIndex):skillDefense(self.m_current_skill_id, allSkillFinish, nil, nil, nil)
				end		
			end
		end
	end
	
	
	self.m_second_group:setComponentZOrder(1)
	self.m_first_group:setComponentZOrder(5)
	
	
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, nil, nil, nil)

	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self:playCardSkillSound(attackSolider, true)
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end	

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger2
-- 技能2逻辑函数 同归于尽
-------------------------------------------------
function f_battle_skill_triger:skillTriger2()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger3
-- 技能3逻辑函数 整装待发
-------------------------------------------------
function f_battle_skill_triger:skillTriger3()
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end	
	
	--被攻击方属性变化回调
	local defenseAttrChangeCallback = function()			
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			end		
		else		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			else
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
		end
	end
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		defenseSolider:setExtraPlayEffect(attackSolider.m_defenseEffect)
		defenseSolider:skillDefenseAndAddAttack(self.m_current_skill_id, allSkillFinish, defenseAttrChangeCallback, nil, nil)
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
	end
	
	local changeAttrValueCallback = function()	
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end		
			end
		end
	end
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeAttrValueCallback, nil, nil)
	
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
	self:playCardSkillSound(attackSolider, false)

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger4
-- 技能4逻辑函数 以战养战
-------------------------------------------------
function f_battle_skill_triger:skillTriger4()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger5
-- 技能5逻辑函数 蛊惑军心
-------------------------------------------------
function f_battle_skill_triger:skillTriger5()
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end	
	
	--被攻击方属性变化回调
	local defenseAttrChangeCallback = function()			
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			end		
		else		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			else
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
		end
	end
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		defenseSolider:skillDefense(self.m_current_skill_id, allSkillFinish, defenseAttrChangeCallback, nil, nil)
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
	end
	
	local changeAttrValueCallback = function()	
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end		
			end
		end
	end
	
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeAttrValueCallback, nil, nil)
	
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
	
	self:playCardSkillSound(attackSolider, false)

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger6
-- 技能6逻辑函数 借刀杀人
-------------------------------------------------
function f_battle_skill_triger:skillTriger6()
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end	
	
	--被攻击方属性变化回调
	local defenseAttrChangeCallback = function()			
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			end		
		else		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			else
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
		end
	end
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		defenseSolider:skillDefense(self.m_current_skill_id, allSkillFinish, defenseAttrChangeCallback, nil, nil)
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
	end
	
	local changeAttrValueCallback = function()	
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end		
			end
		end
	end
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeAttrValueCallback, nil, nil)
	
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
	self:playCardSkillSound(attackSolider, false)

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger7
-- 技能7逻辑函数 趁火打劫
-------------------------------------------------
function f_battle_skill_triger:skillTriger7()
	
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end	
	
	--被攻击方属性变化回调
	local defenseAttrChangeCallback = function()			
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			end		
		else		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			else
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
		end
	end
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		defenseSolider:setExtraPlayEffect(attackSolider.m_defenseEffect)
		defenseSolider:skillDefense(self.m_current_skill_id, allSkillFinish, defenseAttrChangeCallback, nil, nil)
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
	end
	
	local changeAttrValueCallback = function()	
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end		
			end
		end
	end
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeAttrValueCallback, nil, nil)
	
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
	self:playCardSkillSound(attackSolider, false)

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger8
-- 技能8逻辑函数 金蝉脱壳
-------------------------------------------------
function f_battle_skill_triger:skillTriger8()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger9
-- 技能9逻辑函数 三军用命
-------------------------------------------------
function f_battle_skill_triger:skillTriger9()

	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
	
	local lastZOrder = attackSolider:getComponentZOrder()
		
	local allSkillFinish = function()
		attackSolider:setComponentZOrder(lastZOrder)
		self.m_current_skill_finish = true
	end	
	
	--被攻击方属性变化回调
	local defenseAttrChangeCallback = function()			
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			end		
		else		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			else
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
		end
	end
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		attackSolider:setComponentZOrder(lastZOrder+1)
		defenseSolider:setExtraPlayEffect(attackSolider.m_defenseEffect)
		defenseSolider:skillDefenseAndAddAttack(self.m_current_skill_id, allSkillFinish, defenseAttrChangeCallback, nil, nil)
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
	end
	
	local changeAttrValueCallback = function()	
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end		
			end
		end
	end
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeAttrValueCallback, nil, nil)
	
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
	self:playCardSkillSound(attackSolider, false)

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger10
-- 技能10逻辑函数 铁索连环
-------------------------------------------------
function f_battle_skill_triger:skillTriger10()
		local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end	
	
	--被攻击方属性变化回调
	local defenseAttrChangeCallback = function()			
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			end		
		else		
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end	
			else
				local attackArray = self.m_current_round_data["enemySkillHurt"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyHurtValue"]
					
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
		end
	end
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		defenseSolider:skillDefense(self.m_current_skill_id, allSkillFinish, defenseAttrChangeCallback, nil, nil)
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
	end
	
	local changeAttrValueCallback = function()	
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(additionValue,true)
				end		
			end
		end
	end
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeAttrValueCallback, nil, nil)
	
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
	self:playCardSkillSound(attackSolider, false)

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger11
-- 技能11逻辑函数 起死回生
-------------------------------------------------
function f_battle_skill_triger:skillTriger11()

	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
	
	local allSkillFinish = function()
		self.m_current_skill_finish = true
	end
	
	--被攻击方逻辑处理
	local attackSkillFinish = function()
		self.m_current_skill_finish = true
		
		local attackArray = nil
		if self.m_battle_manager:selfIsAttack() then
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]					
				end
			else
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
				end
			end
			
		else
			if self.m_current_is_attack then
				local attackArray = self.m_current_round_data["enemySkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["enemyOfficerIndex"]
					local additionValue = attackArray[i]["enemyAdditionValue"]
					
				end
			else
				local attackArray = self.m_current_round_data["selfSkillAddition"]
				for i = 1, #attackArray do
					local additionIndex = attackArray[i]["selfOfficerIndex"]
					local additionValue = attackArray[i]["selfAdditionValue"]
					
				end		
			end
		end
		self:handlerSkillConfig(false, attackSolider, defenseSolider)	
		
	end
	local changeValueCallback = function()
	
	end
	attackSolider:skillAttack(self.m_current_skill_id, attackSkillFinish, changeValueCallback, nil, nil)
	self:handlerSkillConfig(true, attackSolider, defenseSolider)	
	
	
	self.m_second_group:setComponentZOrder(1)
	self.m_first_group:setComponentZOrder(5)
	
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger20
-- 技能20逻辑函数 全军鼓舞
-------------------------------------------------
function f_battle_skill_triger:skillTriger20()
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	
	self.m_second_group:setComponentZOrder(1)
	self.m_first_group:setComponentZOrder(5)
	
	local allSkillFinish = function()
	end
	
	local animationFinish = function()
		g_game.g_director:getRunningScene():showAllUi(true)
		self.m_second_group:setVisible(true)
		self.m_current_skill_finish = true
	end
	
	self.m_second_group:setVisible(false)
	
	if self.m_current_is_attack then
		self.m_battle_manager:getEffectLayer():showPrinceMingzhongSkill(self.m_current_skill_id, false, animationFinish)
	else
		self.m_battle_manager:getEffectLayer():showPrinceMingzhongSkill(self.m_current_skill_id, true, animationFinish)
	end
	--被攻击方属性变化回调
	--被攻击方逻辑处理
	local attackArray = nil
	if self.m_battle_manager:selfIsAttack() then
		if self.m_current_is_attack then
			local attackArray = self.m_all_round_data["selfEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["selfOfficerIndex"]
				local additionValue = attackArray[i]["selfPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_first_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end
		else
			local attackArray = self.m_all_round_data["enemyEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["enemyOfficerIndex"]
				local additionValue = attackArray[i]["enemyPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_first_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end
		
		end
	else
		if self.m_current_is_attack then
			local attackArray = self.m_all_round_data["enemyEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["enemyOfficerIndex"]
				local additionValue = attackArray[i]["enemyPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_first_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end
		else
			local attackArray = self.m_all_round_data["selfEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["selfOfficerIndex"]
				local additionValue = attackArray[i]["selfPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_first_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_first_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end		
		end	
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG1)
		
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度

end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger21
-- 技能21逻辑函数 探敌虚实
-------------------------------------------------
function f_battle_skill_triger:skillTriger21()
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
		
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(5)
	
		
	local allSkillFinish = function()
	end
	
	local animationFinish = function()
		g_game.g_director:getRunningScene():showAllUi(true)
		self.m_first_group:setVisible(true)
		self.m_current_skill_finish = true
	end
	
	self.m_first_group:setVisible(false)
	
	if self.m_current_is_attack then
		self.m_battle_manager:getEffectLayer():showPrinceMingzhongSkill(self.m_current_skill_id, true, animationFinish)
	else
		self.m_battle_manager:getEffectLayer():showPrinceMingzhongSkill(self.m_current_skill_id, false, animationFinish)
	end
	
	local princeSkillShake = function()
		self.m_battle_manager:getBattleEffectManager():shakeMap(defenseSolider, attackSolider)
	end
	
	self.m_triger_call_back_table[1] = {princeSkillShake, 0, 500}
		
	--被攻击方属性变化回调
	--被攻击方逻辑处理
	local attackArray = nil
	if self.m_battle_manager:selfIsAttack() then
		if self.m_current_is_attack then
			local attackArray = self.m_all_round_data["selfEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["selfOfficerIndex"]
				local additionValue = attackArray[i]["selfPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_second_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end
		else
			local attackArray = self.m_all_round_data["enemyEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["enemyOfficerIndex"]
				local additionValue = attackArray[i]["enemyPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_second_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end
		
		end
	else
		if self.m_current_is_attack then
			local attackArray = self.m_all_round_data["enemyEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["enemyOfficerIndex"]
				local additionValue = attackArray[i]["enemyPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_second_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end
		else
			local attackArray = self.m_all_round_data["selfEffectOfficerList"]
			for i = 1, #attackArray do
				local additionIndex = attackArray[i]["selfOfficerIndex"]
				local additionValue = attackArray[i]["selfPrinceSkillValue"]
					
				local changeValueCallback = function()
					local changeVa = additionValue
					self.m_second_group:getSolidr(additionIndex):changeSoliderAttrValue(changeVa,true)
				end
				self.m_second_group:getSolidr(additionIndex):princeSkill(self.m_current_skill_id, allSkillFinish, changeValueCallback, nil, nil)
			end		
		end	
	end
	
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG2)
		
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5 --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger22
-- 技能22逻辑函数 兵器精炼
-------------------------------------------------
function f_battle_skill_triger:skillTriger22()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger23
-- 技能23逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger23()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger24
-- 技能24逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger24()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger25
-- 技能25逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger25()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger26
-- 技能26逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger26()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger27
-- 技能27逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger27()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger28
-- 技能28逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger28()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger29
-- 技能29逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger29()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger30
-- 技能30逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger30()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] skillTriger31
-- 技能31逻辑函数
-------------------------------------------------
function f_battle_skill_triger:skillTriger31()
	self.m_current_skill_finish = true

	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME --返回本次战斗时间长度
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] attackNormalAttack
-- 使用普通攻击
-------------------------------------------------
function f_battle_skill_triger:attackNormalAttack()	
	self.m_current_skill_finish = false
	
	self.m_first_group = self.m_battle_manager:getAttackGroup()
	self.m_second_group = self.m_battle_manager:getDefenseGroup()	
	
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
	
	local info = attackSolider:getSoliderInfo()	
	local skillId = info[11]
	
	local defenseFinish = function()
		self.m_current_skill_finish = true
	end
--[[	
	--兵团被击中，播放被击打的抖动效果
	local effectCallback = function()	
		self.m_battle_manager:getBattleEffectManager():shakeSolider(defenseSolider)
	end
]]--	
	local attackSkillFinish = function()	
		defenseSolider:showNormalDefense(skillId, defenseFinish, self.m_current_round_data["reduceValue"], nil, 0)
	end
	attackSolider:showNormalAttack(skillId, attackSkillFinish, 0, nil, nil)
	
	self.m_second_group:setComponentZOrder(1)
	self.m_first_group:setComponentZOrder(50)
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.2
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] defenseNormalAttack
-- 使用普通防御
-------------------------------------------------
function f_battle_skill_triger:defenseNormalAttack()
	self.m_current_skill_finish = false
	
	self.m_first_group = self.m_battle_manager:getDefenseGroup()
	self.m_second_group = self.m_battle_manager:getAttackGroup()	
	
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)	
	
	local info = attackSolider:getSoliderInfo()	
	local skillId = info[11]
	
	local defenseFinish = function()
		self.m_current_skill_finish = true
	end
	
	--兵团被击中，播放被击打的抖动效果
	local effectCallback = function()	
		self.m_battle_manager:getBattleEffectManager():shakeSolider(defenseSolider)
	end
	
	
	local attackSkillFinish = function()	
		defenseSolider:showNormalDefense(skillId, defenseFinish, self.m_current_round_data["reduceValue"], nil, 0)
	end
	attackSolider:showNormalAttack(skillId, attackSkillFinish, 0, nil, nil)
	
	
	self.m_first_group:setComponentZOrder(1)
	self.m_second_group:setComponentZOrder(50)
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.2
end

-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] hasForbear
-- 是否发生克制
-------------------------------------------------
function f_battle_skill_triger:hasForbear()	
	if self.m_current_round_data["selfRestraint"] ~= 0 and self.m_current_round_data["enemyRestraint"] ~= 0 then
		return true
	end
	return false
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] Forbear
-- 克制使用
-------------------------------------------------
function f_battle_skill_triger:Forbear()
	self.m_current_skill_finish = false	
	self.m_first_group = self.m_battle_manager:getAttackGroup()
	self.m_second_group = self.m_battle_manager:getDefenseGroup()	
	
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)		
	
	local attackForbearDefense = false
	if self.m_battle_manager:selfIsAttack() then
		if self.m_current_round_data["selfRestraint"] == 1 then
			attackForbearDefense = true
		else
			attackForbearDefense = false
		end
	else
		if self.m_current_round_data["selfRestraint"] == 1 then
			attackForbearDefense = false
		else
			attackForbearDefense = true
		end
	end
		
	local attackKezhiValue = 0
	local defenseKezhiValue = 0
	if self.m_battle_manager:selfIsAttack() then
		attackKezhiValue = self.m_current_round_data["selfRestraintValue"]
		defenseKezhiValue = self.m_current_round_data["enemyRestraintValue"]
	else
		attackKezhiValue = self.m_current_round_data["enemyRestraintValue"]
		defenseKezhiValue = self.m_current_round_data["selfRestraintValue"]
	end
			
	
	local kezhiFinish = function()
		self.m_current_skill_finish = true
	end
	
	local kezhiAnimation = function()
		if attackForbearDefense then
				
			
			defenseSolider:showDefenseKezhi(g_game.g_f_battle_ui_effect.BATTLE_KEZHI_EFFECT[2], kezhiFinish,defenseKezhiValue)
		else
			
			self.m_second_group:setComponentZOrder(1)
			self.m_first_group:setComponentZOrder(50)
			attackSolider:showDefenseKezhi(g_game.g_f_battle_ui_effect.BATTLE_KEZHI_EFFECT[2], kezhiFinish,attackKezhiValue)
		end
		--播放被克制音效
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BEIKEZHI)
	end
	if attackForbearDefense then
		attackSolider:showAttackKezhi(g_game.g_f_battle_ui_effect.BATTLE_KEZHI_EFFECT[2], kezhiAnimation,attackKezhiValue)
			
		self.m_second_group:setComponentZOrder(1)
		self.m_first_group:setComponentZOrder(50)
	else
		defenseSolider:showAttackKezhi(g_game.g_f_battle_ui_effect.BATTLE_KEZHI_EFFECT[2], kezhiAnimation,defenseKezhiValue)
			
		self.m_first_group:setComponentZOrder(1)
		self.m_second_group:setComponentZOrder(50)
	end
	

	--播放克制音效
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KEZHI)
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.5
end


-------------------------------------------------
-- @function [parent=#f_battle_skill_triger] ForbearFinish
-- 克制结束
-------------------------------------------------
function f_battle_skill_triger:ForbearFinish()

	self.m_first_group = self.m_battle_manager:getAttackGroup()
	self.m_second_group = self.m_battle_manager:getDefenseGroup()	
	
	local attackSolider = self.m_first_group:getSolidr(self.m_index_in_round)	
	local defenseSolider = self.m_second_group:getSolidr(self.m_index_in_round)		
	
end

return f_battle_skill_triger


