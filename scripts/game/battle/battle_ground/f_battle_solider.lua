--[[
	继承自container panel, 用于添加人物动画，包括动画身上的特效
]]--

local FLuaBattleSolider = class("FLuaBattleSolider", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattleSolider")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattleSolider:ctor()     
    self:registerNodeEvent()   
    
    self.m_flag_effect = nil
    self.m_soldier = nil
    self.m_attackEffect = nil
    self.m_defenseEffect = nil
    
    self.m_soldierType	= nil
    self.m_soldierInfo	= nil
    
    self.m_cardQuality	= 1
    
    self.m_soldierData = nil
    
    self.m_soliderNumber = nil
    
    self.m_extraEff = nil
    
    self.m_group_type = 1 -- type 1 攻击阵营   type 2 防御阵营
    self.m_effect_fade_in_time = 0.2
    
    self.m_changeValue = 0
    
	self.m_dead_animation_time	= g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME * 0.2 --自身死亡动画时间长度

	self.m_skill_call_back_table = {}
	self.m_skill_call_back_table[1] = nil--QISHOU
	self.m_skill_call_back_table[2] = nil--BEIJI
	self.m_skill_call_back_table[3] = nil--NORMALQISHOU
	self.m_skill_call_back_table[4] = nil--NORMALBEIJI
	self.m_skill_call_back_table[5] = nil--ATTACK_KEZHI
	self.m_skill_call_back_table[6] = nil--DEFENSE_KEZHI
	self.m_skill_call_back_table[7] = nil--PRINCE SKILL
	
	self.MAX_SKILL_CALL_BACK_TABLE_NUM		= 7
	
	self.m_battle_manager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] setBattleManager
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBattleSolider:setBattleManager(manager)  
	self.m_battle_manager = manager
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBattleSolider:onEnter()  
	self:setOpacity(255)
	self:setVisible(true)
	
	g_game.g_gameManager:addUpdateObj(self)
end


function FLuaBattleSolider:onExit()    
    self:unregisterNodeEvent()
    
	g_game.g_gameManager:removeUpdateObj(self)
end

function FLuaBattleSolider:onEnterTransitionFinish()
end

function FLuaBattleSolider:onExitTransitionStart()
end

function FLuaBattleSolider:onCleanup()
end


function FLuaBattleSolider:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattleSolider] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaBattleSolider:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] update
-- 兵团心跳函数，用户执行一系列回调
-------------------------------------------------------------------------------
function FLuaBattleSolider:update(dt)	
	for i = 1, self.MAX_SKILL_CALL_BACK_TABLE_NUM do	
		if self.m_skill_call_back_table[i] ~= nil then
			self.m_skill_call_back_table[i][2] = self.m_skill_call_back_table[i][2] + dt * 1000
			if self.m_skill_call_back_table[i][2] > self.m_skill_call_back_table[i][3] then
				self.m_skill_call_back_table[i][1]()
				self.m_skill_call_back_table[i] = nil
			end
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] setSoliderData
-- 设置兵种数据
-------------------------------------------------------------------------------
function FLuaBattleSolider:setSoliderData(data)	
	self.m_soldierData = data
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] setSoliderFlip
-- 设置兵种是否需要反转
-------------------------------------------------------------------------------
function FLuaBattleSolider:setSoliderFlip(flip)	
	self.m_soldier:setScaleX(-1)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] flipNormalEffect
-- 翻转普通攻击特效
-------------------------------------------------------------------------------
function FLuaBattleSolider:flipNormalEffect(skillname)
	if self.m_group_type == 2 then
		self.m_attackEffect:setScale(1)
		self.m_defenseEffect:setScale(1)
		if skillname == "bubing" then
			self.m_attackEffect:setScale(-1)
			self.m_defenseEffect:setScale(-1)
		elseif skillname == "huoqiang" then
			self.m_attackEffect:setScale(-1)
			self.m_defenseEffect:setScale(-1)
		elseif skillname == "qibing" then
			self.m_attackEffect:setScale(-1)
			self.m_defenseEffect:setScale(-1)
		elseif skillname == "gongjian" then
			self.m_attackEffect:setScaleX(-1)
			self.m_defenseEffect:setScaleX(-1)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] flipSkillEffect
-- 翻转技能特效
-------------------------------------------------------------------------------
function FLuaBattleSolider:flipSkillEffect(flipFlag)
	self.m_attackEffect:setScale(1)
	self.m_defenseEffect:setScale(1)
	if flipFlag == 1 then
		self.m_attackEffect:setScaleX(-1)
		self.m_defenseEffect:setScaleX(-1)
	elseif flipFlag == 2 then
		self.m_attackEffect:setScaleY(-1)
		self.m_defenseEffect:setScaleY(-1)
	elseif flipFlag == 3 then
		self.m_attackEffect:setScale(-1)
		self.m_defenseEffect:setScale(-1)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] setSoliderHealth
-- 设置兵团血量
-------------------------------------------------------------------------------
function FLuaBattleSolider:setSoliderHealth(allHealth, currentHealth)	
	self.m_soliderNumber:setSoliderHealth(allHealth, currentHealth)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] getSoliderInfoComponent
-- 获取显示兵团信息组件
-------------------------------------------------------------------------------
function FLuaBattleSolider:getSoliderInfoComponent()
	return self.m_soliderNumber
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showHaemalstrand
-- 显示血量
-------------------------------------------------------------------------------
function FLuaBattleSolider:showHaemalstrand()
	self.m_soliderNumber:setVisible(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] hideHaemalstrand
-- 隐藏血量
-------------------------------------------------------------------------------
function FLuaBattleSolider:hideHaemalstrand()	
	self.m_soliderNumber:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] changeSoliderAttrValue
-- 显示战斗加成
-------------------------------------------------------------------------------
function FLuaBattleSolider:changeSoliderAttrValue(value,isShowZeroNum)
	if isShowZeroNum then
		self.m_soliderNumber:changeSoliderAttrValue(value)
	else
		if value ~= 0 then
			self.m_soliderNumber:changeSoliderAttrValue(value)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] setSolider
-- 设置兵种
-------------------------------------------------------------------------------
function FLuaBattleSolider:setSolider(soldierType, groupType)
	self.m_soldierType = soldierType	
	self.m_group_type = groupType
	
	self.m_soldierInfo = g_game.g_dictConfigManager:getSoliderInfo(self.m_soldierType)
	
	g_game.g_resourceManager:preloadFAnimation(self.m_soldierInfo[7])
	
	--创建当兵团激活时，用于标记兵团的buffer特效
	if self.m_flag_effect == nil then
		self.m_flag_effect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_flag_effect)
	end
	self.m_flag_effect:setVisible(false)
	self.m_flag_effect:setAnchorPoint(cc.p(0.5,0.5))
	self.m_flag_effect:setLoop(true)	
	self.m_flag_effect:setAnimationScale(1.0)
	if self.m_group_type == 1 then
		self.m_flag_effect:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_SOLIDER_FLAG_BUFFER[2], g_game.g_f_battle_ui_effect.BATTLE_SOLIDER_FLAG_BUFFER[3])
		self.m_flag_effect:setPositionInContainer(cc.p(45, 60))	
	else
		self.m_flag_effect:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_SOLIDER_FLAG_BUFFER[2], g_game.g_f_battle_ui_effect.BATTLE_SOLIDER_FLAG_BUFFER[4])
		self.m_flag_effect:setPositionInContainer(cc.p(55, 65))	
	end
		
	--创建显示人物动画的组件
	if self.m_soldier == nil then
		self.m_soldier = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_soldier)
	end
	self.m_soldier:setVisible(true)
	self.m_soldier:setSize(cc.size(100, 100))
	self.m_soldier:setAnchorPoint(cc.p(0.5,0.5))
	self.m_soldier:setPositionInContainer(cc.p(50, 50))	
	self.m_soldier:setLoop(true)	
	self.m_soldier:setAnimationScale(0.6)
	
	self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
	
	if self.m_soliderNumber == nil then
		self.m_soliderNumber = require("scripts.game.battle.battle_ground.f_solider_number").new()
		self:appendComponent(self.m_soliderNumber)
	end
	self.m_soliderNumber:setOpacity(255)
	self.m_soliderNumber:setSize(cc.size(100, 40))
	self.m_soliderNumber:setAnchorPoint(cc.p(0.5, 0))
	self.m_soliderNumber:setPositionInContainer(cc.p(50, 15))	
	if self.m_group_type == 1 then
		if self.m_battle_manager:selfIsAttack() then
			self.m_soliderNumber:setOfficerId(self.m_soldierData["officerId"])
			self.m_cardQuality = g_game.g_dictConfigManager:getCardQuality(self.m_soldierData["officerId"])
		else
			self.m_soliderNumber:setOfficerId(self.m_soldierData["monsterId"])	
			self.m_cardQuality = g_game.g_dictConfigManager:getCardQuality(self.m_soldierData["monsterId"])
		
		end
	else
		if self.m_battle_manager:selfIsAttack() then
			self.m_soliderNumber:setOfficerId(self.m_soldierData["monsterId"])
			self.m_cardQuality = g_game.g_dictConfigManager:getCardQuality(self.m_soldierData["monsterId"])
		else	
			self.m_soliderNumber:setOfficerId(self.m_soldierData["officerId"])
			self.m_cardQuality = g_game.g_dictConfigManager:getCardQuality(self.m_soldierData["officerId"])
		end
	end
	self.m_soliderNumber:createSoliderNumber(self.m_group_type)
	self.m_soliderNumber:setVisible(true)
	self.m_soliderNumber:showStaticHeath(true)

	--创建用于播放特效的组件
	if self.m_attackEffect == nil then
		self.m_attackEffect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_attackEffect)	
	end
	self.m_attackEffect:setSize(cc.size(100, 100))
	self.m_attackEffect:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_attackEffect:setPositionInContainer(cc.p(50, 50))
	self.m_attackEffect:setVisible(false)	
	
	if self.m_defenseEffect == nil then
		self.m_defenseEffect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_defenseEffect)	
	end
	self.m_defenseEffect:setSize(cc.size(100, 100))
	self.m_defenseEffect:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_defenseEffect:setPositionInContainer(cc.p(50, 50))
	self.m_defenseEffect:setVisible(false)	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] getSoliderType
-- 获取兵种类型
-------------------------------------------------------------------------------
function FLuaBattleSolider:getSoliderType()	
	return self.m_soldierType
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] getSoliderInfo
-- 获取兵种资源信息
-------------------------------------------------------------------------------
function FLuaBattleSolider:getSoliderInfo()	
	return self.m_soldierInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] skillAttack
-- 播放兵种普通攻击动作，并播放技能起手特效，播放完成后恢复站立动作
-------------------------------------------------------------------------------
function FLuaBattleSolider:skillAttack(skillId, callback, changeValueCallback, otherEffectCallback, afterAnimationScale)	
	local info = g_game.g_dictConfigManager:getSkillInfo(skillId)--技能信息,目前先使用固定文件
	
	if self.m_group_type == 2 then
		self:flipSkillEffect(info[13])
	end	
	
	local skillQishou = "qishoudi"
	

	--攻击动作释放到配置时间时播放技能起手特效
	local qishouAnimation = function(event)	
		if callback ~= nil then
			callback()
		end
		self.m_attackEffect:setVisible(false)
		
		if changeValueCallback ~= nil then
			changeValueCallback()
		end
	end
	
	--攻击动作播放完成后，恢复站立动作
	local revertAnimation = function(event)
		self.m_soldier:setLoop(true)	
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
		
		local hasQishou = false
		local skillQishou = info[10] --当前技能是否有起手动画
		if skillQishou ~= 0 and skillQishou ~= "" then
			hasQishou = true
		end
		
		if not hasQishou then
			if callback ~= nil then
				callback()
			end
			if changeValueCallback ~= nil then
				changeValueCallback()
			end
		end
	end
	self.m_soldier:setLoop(false)
	if self.m_cardQuality < 3 then
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "qishoudi")
	else
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "qishougao")
	end
	self.m_soldier:registeAnimationFinishCallback(revertAnimation)
	self.m_skill_call_back_table[1] = {qishouAnimation, 0, info[17]}
--	self.m_soldier:registeAnimationCallback(qishouAnimation, info[17]/100.0)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] setExtraPlayEffect
-- 额外 需要播放的 特效对象
-------------------------------------------------------------------------------
function FLuaBattleSolider:setExtraPlayEffect(extraEff)
	self.m_extraEff = extraEff
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] skillDefenseAndAddAttack
-- 播放兵种普通被击动作，此为攻击方增益，无被击特效，播放完成后恢复站立动作
-------------------------------------------------------------------------------
function FLuaBattleSolider:skillDefenseAndAddAttack(skillId, callback, changeValueCallback, otherEffectCallback, afterAnimationScale)	
	local info = g_game.g_dictConfigManager:getSkillInfo(skillId)--技能信息,目前先使用固定文件
	
	if self.m_group_type == 2 then
		self:flipSkillEffect(info[14])
	end
	
	--攻击动作播放完成后，恢复站立动作
	local revertAnimation = function(event)
		self.m_soldier:setLoop(true)	
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
		
		local hasMingzhong = false		
		local skillMingzhong = info[11] --当前技能是否有命中动画
		if skillMingzhong ~= 0 and skillMingzhong ~= "" then	
			hasMingzhong = true
		end
		
		if not hasMingzhong then
			if callback ~= nil then
				callback()
			end
		end
	end
	
	local mingzhongAnimation = function(event)
		self.m_soldier:setLoop(false)
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "beiji")
		self.m_soldier:registeAnimationFinishCallback(revertAnimation)
		
		if changeValueCallback ~= nil then
			changeValueCallback()
		end
	end

	local skillExtraMingzhong = nil
	
	if self.m_group_type == 2 then
		skillExtraMingzhong = "mingzhongzuo"
	else
		skillExtraMingzhong = "mingzhongyou"
	end	
	
	--特效播放结束后， 删除特效播放组件，并调用外部回调
	local effectFinish = function(event)
		if callback ~= nil then
			callback()
		end
		self.m_extraEff:setVisible(false)
		self.m_extraEff = nil
	end
	
	if self.m_extraEff ~= nil then
		self.m_extraEff:setVisible(true)
		self.m_extraEff:setAnimationScale(1.0)
		self.m_extraEff:setLoop(false)	
		self.m_extraEff:runAnimation(info[4], skillExtraMingzhong)
		self.m_extraEff:registeAnimationFinishCallback(effectFinish)
	end
	self.m_skill_call_back_table[2] = {mingzhongAnimation, 0, info[18]}
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] skillDefense
-- 播放兵种普通被击动作，并播放技能命中特效，播放完成后恢复站立动作
-------------------------------------------------------------------------------
function FLuaBattleSolider:skillDefense(skillId, callback, changeValueCallback, otherEffectCallback, afterAnimationScale)	
	local info = g_game.g_dictConfigManager:getSkillInfo(skillId)--技能信息,目前先使用固定文件
	
	if self.m_group_type == 2 then
		self:flipSkillEffect(info[14])
	end
	
	--攻击动作播放完成后，恢复站立动作
	local revertAnimation = function(event)
		self.m_soldier:setLoop(true)	
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
		
		local hasMingzhong = false		
		local skillMingzhong = info[11] --当前技能是否有命中动画
		if skillMingzhong ~= 0 and skillMingzhong ~= "" then	
			hasMingzhong = true
		end
		
		if not hasMingzhong then
			if callback ~= nil then
				callback()
			end
		end
	end
	
	local mingzhongAnimation = function(event)
		self.m_soldier:setLoop(false)
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "beiji")
		self.m_soldier:registeAnimationFinishCallback(revertAnimation)
		
		if changeValueCallback ~= nil then
			changeValueCallback()
		end
	end

	local skillMingzhong = info[11] --当前技能是否有命中动画
	local skillExtraMingzhong = nil
	
	if info[10] == 0 then
		skillMingzhong = info[11]
	else
		if self.m_group_type == 2 then
			skillMingzhong = "mingzhongyou"
			skillExtraMingzhong = "qishouzuo"
		else
			skillMingzhong = "mingzhongzuo"
			skillExtraMingzhong = "qishouyou"
		end	
	end
	if skillMingzhong ~= 0 and skillMingzhong ~= "" then		
		--特效播放结束后， 删除特效播放组件，并调用外部回调
		local effectFinish = function(event)
			if callback ~= nil then
				callback()
			end
			self.m_defenseEffect:setVisible(false)
		end
		
		if self.m_extraEff ~= nil then
			local extraEffFinish = function()
				self.m_extraEff:setVisible(false)
				self.m_extraEff = nil
			end
			self.m_extraEff:setVisible(true)
			self.m_extraEff:setAnimationScale(1.0)
			self.m_extraEff:setLoop(false)	
			self.m_extraEff:runAnimation(info[4], skillExtraMingzhong)
			self.m_extraEff:registeAnimationFinishCallback(extraEffFinish)
		end
		
		self.m_defenseEffect:setVisible(true)
--		self.m_defenseEffect:setOpacity(0)
--		self.m_defenseEffect:runAction(cc.FadeIn:create(self.m_effect_fade_in_time))
		self.m_defenseEffect:setAnimationScale(1.0)
		self.m_defenseEffect:setLoop(false)	
		self.m_defenseEffect:runAnimation(info[4], skillMingzhong)
		self.m_defenseEffect:registeAnimationFinishCallback(effectFinish)
		self.m_skill_call_back_table[2] = {mingzhongAnimation, 0, info[18]}
		
--		self.m_defenseEffect:registeAnimationCallback(mingzhongAnimation, info[18]/100.0)
	else			
		self.m_soldier:setLoop(false)
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "beiji")
		self.m_soldier:registeAnimationFinishCallback(revertAnimation)
		if changeValueCallback ~= nil then
			changeValueCallback()
		end
	end	
	
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] princeSkill
-- 皇子技能释放
-------------------------------------------------------------------------------
function FLuaBattleSolider:princeSkill(skillId, callback, changeValueCallback, otherEffectCallback, afterAnimationScale)	
	
	local mingzhongAnimation = function()
		if changeValueCallback ~= nil then
			changeValueCallback()
		end
	end	
	self.m_skill_call_back_table[7] = {mingzhongAnimation, 0, 600}
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showAttackKezhi
-- 释放兵种克制特效，当前兵团属于克制方
-------------------------------------------------------------------------------
function FLuaBattleSolider:showAttackKezhi(skill, callback, changeValue)
	self.m_changeValue = changeValue

	local effectFinish = function(event)
		if callback ~= nil then
			callback()
		end
		self.m_attackEffect:setVisible(false)
	end	
	
	local kezhiCallback = function(event)	
		self:changeSoliderAttrValue(self.m_changeValue,false)
	end
	
	self:flipNormalEffect(skill)
	self.m_attackEffect:setVisible(true)
	self.m_attackEffect:setAnimationScale(1.0)
	self.m_attackEffect:setLoop(false)	
	self.m_attackEffect:runAnimation(skill, "qishou")
	self.m_attackEffect:registeAnimationFinishCallback(effectFinish)
	self.m_skill_call_back_table[5] = {kezhiCallback, 0, 600}	
--	self.m_soldier:registeAnimationCallback(kezhiCallback, 0.6)	

end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showDefenseKezhi
-- 释放兵种克制特效，当前兵团属于被克制方
-------------------------------------------------------------------------------
function FLuaBattleSolider:showDefenseKezhi(skill, callback, changeValue)
	self.m_changeValue = changeValue
	
	local effectFinish = function(event)
		if callback ~= nil then
			callback()
		end
		self.m_defenseEffect:setVisible(false)
	end	
	
	local kezhiCallback = function(event)	
		self:changeSoliderAttrValue(self.m_changeValue,false)
	end
	
	self:flipNormalEffect(skill)
	self.m_defenseEffect:setVisible(true)
	self.m_defenseEffect:setAnimationScale(1.0)
	self.m_defenseEffect:setLoop(false)	
	self.m_defenseEffect:runAnimation(skill, "mingzhong")
	self.m_defenseEffect:registeAnimationFinishCallback(effectFinish)	
	self.m_skill_call_back_table[6] = {kezhiCallback, 0, 600}	
--	self.m_soldier:registeAnimationCallback(kezhiCallback, 0.6)	

end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] playSoliderSoundEffect
-- 播放兵种普通攻击音效
-------------------------------------------------------------------------------
function FLuaBattleSolider:playSoliderSoundEffect()
	if self.m_soldierType < 5 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BUBING)
	elseif self.m_soldierType < 9 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_GONGBING)
	elseif self.m_soldierType < 13 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIBING)
	else
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUOQIANG)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showNormalAttack
-- 播放兵种普通攻击动作，并播放普通技能特效，播放完成后恢复站立动作
-------------------------------------------------------------------------------
function FLuaBattleSolider:showNormalAttack(skill, callback, changeValue, otherEffectCallback, afterAnimationScale)
	self.m_changeValue = changeValue
		
	local animationName = "qishouzuo"
	if self.m_group_type == 2 then
		animationName = "qishouyou"
	else
		animationName = "qishouzuo"
	end
	
	local effectFinish = function(event)
		if callback ~= nil then
			callback()
		end
		self.m_attackEffect:setVisible(false)
	end	
	
	--攻击动作释放到一半时播放起手特效
	local qishouAnimation = function(event)
		local callbackChangeValue = changeValue
		--特效播放结束后， 删除特效播放组件，并调用外部回调
		self:flipNormalEffect(skill)
		self.m_attackEffect:setVisible(true)
		self.m_attackEffect:setAnimationScale(1.0)
		self.m_attackEffect:setLoop(false)	
		self.m_attackEffect:runAnimation(skill, animationName)
		self.m_attackEffect:registeAnimationFinishCallback(effectFinish)		
		self:changeSoliderAttrValue(callbackChangeValue,false)
		
		--当特效播放到百分比时，执行指定回调
		if otherEffectCallback ~= nil then
			self.m_attackEffect:registeAnimationSkillCallback(otherEffectCallback, afterAnimationScale)
		end		
	end
	
	--攻击动作播放完成后，恢复站立动作
	local revertAnimation = function(event)
		self.m_soldier:setLoop(true)		
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
	end
	self.m_soldier:setLoop(false)
	self.m_soldier:runAnimation(self.m_soldierInfo[7], "gongji")
	self.m_soldier:registeAnimationFinishCallback(revertAnimation)
	self.m_skill_call_back_table[3] = {qishouAnimation, 0, 300}
--	self.m_soldier:registeAnimationCallback(qishouAnimation, 0.9)	

	self:playSoliderSoundEffect()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showNormalDefense
-- 播放兵种普通被击动作，并播放普通技能特效，播放完成后恢复站立动作
-------------------------------------------------------------------------------
function FLuaBattleSolider:showNormalDefense(skill, callback, changeValue, otherEffectCallback, afterAnimationScale)	
	self.m_changeValue = changeValue
	
	local animationName = "mingzhongzuo"
	if self.m_group_type == 2 then
		animationName = "mingzhongzuo"
	else
		animationName = "mingzhongyou"
	end
	
	
	--攻击动作播放完成后，恢复站立动作
	local revertAnimation = function(event)
		self.m_soldier:setLoop(true)	
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
	end
	
	
	--被击特效播放到一半时，播放人物被攻击动作
	local mingzhongAnimation = function(event)
		local callbackChangeValue = changeValue
		self.m_soldier:setLoop(false)
		self.m_soldier:runAnimation(self.m_soldierInfo[7], "beiji")
		self.m_soldier:registeAnimationFinishCallback(revertAnimation)
		
		self:changeSoliderAttrValue(callbackChangeValue,false)
		
		--当特效播放到百分比时，执行指定回调
		if otherEffectCallback ~= nil then
			self.m_soldier:registeAnimationSkillCallback(otherEffectCallback, afterAnimationScale)
		end
	end
	
	
	--特效播放结束后， 删除特效播放组件，并调用外部回调
	local effectFinish = function(event)
		if callback ~= nil then
			callback()
		end
		self.m_defenseEffect:setVisible(false)
	end
	self:flipNormalEffect(skill)
	self.m_defenseEffect:setVisible(true)
	self.m_defenseEffect:setAnimationScale(1.0)
	self.m_defenseEffect:setLoop(false)	
	self.m_defenseEffect:runAnimation(skill, animationName)
	
	self.m_defenseEffect:registeAnimationFinishCallback(effectFinish)
	self.m_skill_call_back_table[4] = {mingzhongAnimation, 0, 300}
--	self.m_defenseEffect:registeAnimationCallback(mingzhongAnimation, 0.8)	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] playEffect
-- 播放特效
-------------------------------------------------------------------------------
function FLuaBattleSolider:playEffect(skillId)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showMoveAnimation
-- 播放移动特效
-------------------------------------------------------------------------------
function FLuaBattleSolider:showMoveAnimation()
	self.m_soldier:setLoop(true)	
	self.m_soldier:runAnimation(self.m_soldierInfo[7], "yidong")
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showIdleAnimation
-- 播放站立特效
-------------------------------------------------------------------------------
function FLuaBattleSolider:showIdleAnimation()
	self.m_soldier:setLoop(true)	
	self.m_soldier:runAnimation(self.m_soldierInfo[7], "zhanli")
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] slodierDead
-- 兵团死亡
-------------------------------------------------------------------------------
function FLuaBattleSolider:slodierDead()
	local removeFinish = function()
	end
	local action = g_game.g_transition.sequence({CCBlink:create(self.m_dead_animation_time, 2), CCFadeOut:create(0.2), CCCallFunc:create(removeFinish)})
	self:runAction(action)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleSolider] showFlagBuffer
-- 显示兵团光圈
-------------------------------------------------------------------------------
function FLuaBattleSolider:showFlagBuffer(isShow)
	if isShow then
		self.m_flag_effect:setVisible(true)
	else
		self.m_flag_effect:setVisible(false)
	end
end

return FLuaBattleSolider