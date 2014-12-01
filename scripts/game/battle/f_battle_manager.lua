--[[--
当前战斗管理类，用于处理当前战斗逻辑
--]]--
require("scripts.game.battle.layout.f_world_boss_lose")
require("scripts.game.battle.layout.f_world_boss_win")
require("scripts.game.battle.layout.f_battle_result_shengli")
require("scripts.game.battle.layout.f_battle_result_shibai")
require("scripts.game.battle.layout.f_battle_result_pvp_shengli")
require("scripts.game.battle.layout.f_battle_result_pvp_shibai")
require("scripts.game.battle.layout.f_battle_juezhan_panel")
require("scripts.game.battle.layout.f_lueduo_result")
require("scripts.game.battle.layout.f_replay_result")

local f_battle_manager = class("f_battle_manager")
f_battle_manager.__index = f_battle_manager

-------------------------------------------------
-- @function [parent=#f_battle_manager] ctor
-------------------------------------------------
function f_battle_manager:ctor()
	self.m_battle_data 	= nil

	self.m_kezhi_panel	= nil
	self.m_shibai_panel = nil
	self.m_shengli_panel = nil
	self.m_juezhan_panel = nil

	self.m_battle_map_layer = nil
	self.m_battle_solider_layer = nil
	self.m_battle_effect_layer = nil

	self.m_layout_manager = nil
	self.m_left_bottom_panel = nil
	self.m_right_top_panel = nil
	self.m_right_bottom_panel = nil

	self.m_attack_group = nil
	self.m_defense_group = nil

	self.m_round_array = {}

	self.m_time	= 0.0
	self.m_currentStateTime = 0.0

	self.m_currentRoundIndex = 1

	self.m_battle_effect_manager = require("scripts.game.battle.f_battle_effect_manager").new()
	self.m_battle_effect_manager:setBattleManager(self)

	self.m_skill_triger 		= require("scripts.game.battle.battle_round.f_battle_skill_triger").new()
	self.m_skill_triger:setBattleManager(self)


	self.ENTER_BATTLE_EFFECT	= 1
	self.START_BATTLE_STATE		= 2
	self.PRE_BATTLE_STATE		= 3
	self.BATTLE_UI_STATE		= 4
	self.BATTLING_STATE			= 5
	self.END_BATTLE_STATE		= 6
	self.BATTLE_JUEZHAN_STATE	= 7
	self.JUEZHANING_STATE		= 8
	self.BATTLE_FINISH			= 9
	self.BATTLE_RESULT			= 10

	self.SUB_STATE_NONE			= 1
	self.SUB_STATE_RUNNING		= 2

	self.m_currentState			= self.ENTER_BATTLE_EFFECT
	self.m_currentSubState		= self.SUB_STATE_NONE

	self.m_state_function		= {}

	local enterBattleEffectFunction = function(dt)
		self:state_enterBattleEffect(dt)
	end
	self.m_state_function[self.ENTER_BATTLE_EFFECT]	= enterBattleEffectFunction

	local startBattleFunction = function(dt)
		self:state_startBattle(dt)
	end
	self.m_state_function[self.START_BATTLE_STATE]	= startBattleFunction

	local preBattleFunction = function(dt)
		self:state_preBattle(dt)
	end
	self.m_state_function[self.PRE_BATTLE_STATE]	= preBattleFunction

	local battleUiFunction = function(dt)
		self:state_battleUI(dt)
	end
	self.m_state_function[self.BATTLE_UI_STATE]	= battleUiFunction

	local battlingFunction = function(dt)
		self:state_battling(dt)
	end
	self.m_state_function[self.BATTLING_STATE]	= battlingFunction

	local endBattleFunction = function(dt)
		self:state_endBattle(dt)
	end
	self.m_state_function[self.END_BATTLE_STATE]	= endBattleFunction

	local battleJuezhanFunction = function(dt)
		self:state_battleJuezhan(dt)
	end
	self.m_state_function[self.BATTLE_JUEZHAN_STATE]	= battleJuezhanFunction

	local juezhaningFunction = function(dt)
		self:state_juezhaning(dt)
	end
	self.m_state_function[self.JUEZHANING_STATE]	= juezhaningFunction

	local battleFinishFunction = function(dt)
		self:state_battleFinish(dt)
	end
	self.m_state_function[self.BATTLE_FINISH]	= battleFinishFunction

	local battleResultFunction = function(dt)
		self:state_battleResult(dt)
	end
	self.m_state_function[self.BATTLE_RESULT]	= battleResultFunction

	self.event_updateToMainScene = function()
		self:updateMainSceneUi()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVE_LEVEL, self.event_updateToMainScene)
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVP_UI, self.event_updateToMainScene)
		
	self.event_updateToWorldBoss = function()
		g_game.g_userInfoManager.m_isNeedPopRank	 	= true
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,g_game.F_BACK_TOUI_WORLD_BOSS)
		self:updateMainSceneUi()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_BACK_TOWORLD_BOSS, self.event_updateToWorldBoss)
	
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] getBattleSoliderLayer
-- 获取人物层
-------------------------------------------------
function f_battle_manager:getBattleSoliderLayer()
	return self.m_battle_solider_layer
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] setBattleSoliderLayer
-- 设置人物层
-------------------------------------------------
function f_battle_manager:setBattleSoliderLayer(soliderLayer)
	self.m_battle_solider_layer = soliderLayer
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getBattleMapLayer
-- 获取地图层
-------------------------------------------------
function f_battle_manager:getBattleMapLayer()
	return self.m_battle_map_layer

end
-------------------------------------------------
-- @function [parent=#f_battle_manager] setBattleMapLayer
-- 设置地图层
-------------------------------------------------
function f_battle_manager:setBattleMapLayer(battleMap)
	self.m_battle_map_layer = battleMap
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] setEffectLayer
-- 设置全局特效层
-------------------------------------------------
function f_battle_manager:setEffectLayer(effect)
	self.m_battle_effect_layer = effect
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] getEffectLayer
-- 获取全局特效层
-------------------------------------------------
function f_battle_manager:getEffectLayer()
	return self.m_battle_effect_layer
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getBattleEffectManager
-- 获取战斗全局特效管理类
-------------------------------------------------
function f_battle_manager:getBattleEffectManager()
	return self.m_battle_effect_manager
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] getAttackGroup
-- 获取攻击兵营
-------------------------------------------------
function f_battle_manager:getAttackGroup()
	return self.m_attack_group
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] getDefenseGroup
-- 获取防御兵营
-------------------------------------------------
function f_battle_manager:getDefenseGroup()
	return self.m_defense_group
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getLeftBottomPanel
-- 获取攻击方面板
-------------------------------------------------
function f_battle_manager:getLeftBottomPanel()
	return self.m_left_bottom_panel
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] getRightTopPanel
-- 获取防御方面板
-------------------------------------------------
function f_battle_manager:getRightTopPanel()
	return self.m_right_top_panel
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] getRightBottomPanel
-- 获取跳过面板
-------------------------------------------------
function f_battle_manager:getRightBottomPanel()
	return self.m_right_bottom_panel
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] selfIsAttack()
-- 判定自己是否攻击方
-------------------------------------------------
function f_battle_manager:selfIsAttack()
	return (self.m_battle_data["roundData"]["battleFlag"] == 2)
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] setBattleData
-------------------------------------------------
function f_battle_manager:setBattleData(battleData)
	self.m_battle_data = battleData
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getBattleData
-------------------------------------------------
function f_battle_manager:getBattleData()
	return self.m_battle_data
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getSkillTriger
-------------------------------------------------
function f_battle_manager:getSkillTriger()
	return self.m_skill_triger
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] setBattleGroup
-------------------------------------------------
function f_battle_manager:setBattleGroup(attackGroup, defenseGroup)
	self.m_attack_group = attackGroup
	self.m_defense_group = defenseGroup
	self.m_attack_group:setVisible(false)
	self.m_defense_group:setVisible(false)
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getBattleMap
-- 获取当前战斗场景地图
-------------------------------------------------
function f_battle_manager:getBattleMap()
	local levelResource = nil
	if self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
		levelResource = self.m_battle_data["levelInfo"][37]
	else
		levelResource = self.m_battle_data["levelInfo"][22]
	end
	return g_game.g_resourceManager:getBattleMap(levelResource)
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] getBattleLevelName
-- 获取当前战斗关卡名称
-------------------------------------------------
function f_battle_manager:getBattleLevelName()
	local id = self.m_battle_data["levelInfo"][2]
	return g_game.g_dictConfigManager:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] setUserPanel
-- 设置攻击方和防御方面板
-------------------------------------------------
function f_battle_manager:setUserPanel(leftBottom, rightTop, rightBottom)
	self.m_left_bottom_panel = leftBottom
	self.m_right_top_panel = rightTop
	self.m_right_bottom_panel = rightBottom
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] setBattleLayoutManager
-- 设置布局管理类
-------------------------------------------------
function f_battle_manager:setBattleLayoutManager(layoutManager)
	self.m_layout_manager = layoutManager
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] updateUserPanel
-- 更新攻击和防御双方面板种的数据
-------------------------------------------------
function f_battle_manager:updateUserPanel()
	if self.m_battle_data["roundData"]["battleFlag"] == 1 then--玩家自己是防御
		self.m_left_bottom_panel:setName(self.m_battle_data["roundData"]["enemyName"])
		self.m_right_top_panel:setName(g_game.g_userInfoManager:getUserName())
	elseif self.m_battle_data["roundData"]["battleFlag"] == 2 then--玩家自己是攻击
		self.m_left_bottom_panel:setName(g_game.g_userInfoManager:getUserName())
		self.m_right_top_panel:setName(self.m_battle_data["roundData"]["enemyName"])
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] loadRoundData
-- 加载回合数据
-------------------------------------------------
function f_battle_manager:loadRoundData()
	local roundData = self.m_battle_data["roundData"]["roundData"]
	for i = 1, #roundData do
		local round = require("scripts.game.battle.battle_round.f_battle_round").new()
		round:setBattleManager(self)
		round:setRoundIndex(i)
		--		round:setGroupData(self.m_battle_data["roundData"]["battleArray"], self.m_battle_data["roundData"]["enemyBattleArray"])
		round:loadRoundData(self.m_battle_data["roundData"])

		table.insert(self.m_round_array, round)
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] checkRoundFinish
-- 检查当前回合是否结束
-------------------------------------------------
function f_battle_manager:checkRoundFinish()
	return self.m_round_array[self.m_currentRoundIndex]:roundIsFinish()
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] state_battleResult
-- 状态机函数	BATTLE_RESULT
-------------------------------------------------
function f_battle_manager:state_battleResult(dt)
	self.m_time = self.m_time + dt
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_battleFinish
-- 状态机函数	BATTLE_FINISH
-------------------------------------------------
function f_battle_manager:state_battleFinish(dt)
	self.m_time = self.m_time + dt
	if self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE or
	self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE  then
		if self.m_battle_data["roundData"]["fightResult"] == 1 then
			self:showShengli()
		elseif self.m_battle_data["roundData"]["fightResult"] == 0 then
			self:showShibai()
		end
	elseif self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP then
		if self.m_battle_data["roundData"]["fightResult"] == 1 then
			self:showPvpShengli()
		elseif self.m_battle_data["roundData"]["fightResult"] == 0 then
			self:showPvpShibai()
		end
	elseif self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST then
		self:showLueduoResult(self.m_battle_data["roundData"]["fightResult"] ~= 0)
	elseif self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_REPLAY then
		self:showReplayResult(self.m_battle_data["roundData"]["fightResult"] ~= 0)
	elseif self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_WORLD_BOSS then
		self:showWorldBossResult(self.m_battle_data["roundData"]["fightResult"])
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_STOPBG_MUSIC)
	self.m_currentState = self.BATTLE_RESULT
end

function f_battle_manager:showWorldBossResult(result)
	if result == 1 then
		local bossWin = f_world_boss_win.static_create()
		bossWin:panelInitBeforePopup()
		bossWin:setBattleManager(self)
		g_game.g_panelManager:showUiPanel(bossWin,"bosswin")
	else
		local bossLose = f_world_boss_lose.static_create()
		bossLose:panelInitBeforePopup()
		bossLose:setBattleManager(self)
		g_game.g_panelManager:showUiPanel(bossLose,"bosslose")
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] state_juezhaning
-- 状态机函数	JUEZHANING_STATE
-------------------------------------------------
function f_battle_manager:state_juezhaning(dt)
	self.m_time = self.m_time + dt

	self.m_juezhan_panel:update(dt)
	if self.m_juezhan_panel:isShowFinish() then
		self:hideJuezhan()
		self.m_currentState = self.BATTLE_FINISH
	end
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_battleJuezhan
-- 状态机函数	BATTLE_JUEZHAN_STATE
-------------------------------------------------
function f_battle_manager:state_battleJuezhan(dt)
	self.m_time = self.m_time + dt

	self:showJuezhan(self.m_battle_data["roundData"])

	self.m_currentState = self.JUEZHANING_STATE
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_endBattle
-- 状态机函数	END_BATTLE_STATE
-------------------------------------------------
function f_battle_manager:state_endBattle(dt)
	self.m_time = self.m_time + dt

	if self.m_currentSubState == self.SUB_STATE_NONE then
		if self:judgeJuezhan() then
			self.m_currentStateTime = self.m_battle_effect_layer:showRoundUI(4)
			self.m_currentSubState = self.SUB_STATE_RUNNING
			self.m_time = 0.0
		else
			self.m_currentState = self.BATTLE_FINISH
		end
	elseif self.m_currentSubState == self.SUB_STATE_RUNNING then
		if self.m_time > self.m_currentStateTime then
			self.m_currentState = self.BATTLE_JUEZHAN_STATE
			self.m_currentSubState = self.SUB_STATE_NONE
			self.m_time = 0.0
		end
	end
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_battling
-- 状态机函数	BATTLING_STATE
-------------------------------------------------
function f_battle_manager:state_battling(dt)
	self.m_time = self.m_time + dt

	if self.m_currentRoundIndex > 0 and self.m_currentRoundIndex <= #self.m_round_array then
		self.m_round_array[self.m_currentRoundIndex]:update(dt)
		if self:checkRoundFinish() then
			self.m_currentRoundIndex = self.m_currentRoundIndex + 1
			if self.m_currentRoundIndex <= #self.m_round_array then
				self.m_round_array[self.m_currentRoundIndex]:loadCurrentRoundDataToScene()
			else
				self.m_currentState = self.END_BATTLE_STATE
			end
		end
	end
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_battleUI
-- 状态机函数	BATTLE_UI_STATE
-------------------------------------------------
function f_battle_manager:state_battleUI(dt)
	self.m_time = self.m_time + dt

	if self.m_currentSubState == self.SUB_STATE_NONE then
		self.m_currentStateTime = self.m_layout_manager:moveToShowUI()
		self.m_currentSubState = self.SUB_STATE_RUNNING
		self.m_time = 0.0
	elseif self.m_currentSubState == self.SUB_STATE_RUNNING then
		if self.m_time > self.m_currentStateTime then
		
		
		
			self.m_currentState = self.BATTLING_STATE
			self.m_currentSubState = self.SUB_STATE_NONE
			self.m_time = 0.0

		end
	end
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_preBattle
-- 状态机函数	PRE_BATTLE_STATE
-------------------------------------------------
function f_battle_manager:state_preBattle(dt)
	self.m_time = self.m_time + dt

	self.m_round_array[self.m_currentRoundIndex]:loadCurrentRoundDataToScene()
	self.m_currentState = self.BATTLE_UI_STATE
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_startBattle
-- 状态机函数	START_BATTLE_STATE
-------------------------------------------------
function f_battle_manager:state_startBattle(dt)
	self.m_time = self.m_time + dt

	self:loadRoundData()
	self.m_currentState = self.PRE_BATTLE_STATE
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] state_enterBattleEffect
-- 状态机函数	ENTER_BATTLE_EFFECT
-------------------------------------------------
function f_battle_manager:state_enterBattleEffect(dt)
	self.m_time = self.m_time + dt

	if self.m_currentSubState == self.SUB_STATE_NONE then
		self.m_currentStateTime = self.m_battle_effect_layer:showFireAndMove()
		self.m_currentSubState = self.SUB_STATE_RUNNING
		self.m_time = 0.0
	elseif self.m_currentSubState == self.SUB_STATE_RUNNING then
		if self.m_time > self.m_currentStateTime then
			--播放云退场
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_YUNCENG)

			self.m_battle_map_layer:setVisible(true)
			self.m_currentState = self.START_BATTLE_STATE
			self.m_currentSubState = self.SUB_STATE_NONE
		end
	end
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] update
-- 战斗心跳
-------------------------------------------------
function f_battle_manager:update(dt)
	self.m_state_function[self.m_currentState](dt)
	self.m_skill_triger:update(dt)
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showPvpShengli
-- 显示pvp胜利界面
-------------------------------------------------
function f_battle_manager:showPvpShengli()
	self.m_shengli_panel = f_battle_result_pvp_shengli.static_create()
	self.m_shengli_panel:panelInitBeforePopup()
	self.m_shengli_panel:setBattleManager(self)
	g_game.g_panelManager:showUiPanel(self.m_shengli_panel,"qgyd_shengli")

end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showShengli
-- 显示胜利界面
-------------------------------------------------
function f_battle_manager:showShengli()
	--播放胜利音效
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHENGLI)
	
	self.m_shengli_panel = f_battle_result_shengli.static_create()
	self.m_shengli_panel:panelInitBeforePopup()
	self.m_shengli_panel:setBattleManager(self)
	g_game.g_panelManager:showUiPanel(self.m_shengli_panel,"shengli")

end


-------------------------------------------------
-- @function [parent=#f_battle_manager] hideShengli
-- 移除胜利界面
-------------------------------------------------
function f_battle_manager:hideShengli()
	g_game.g_panelManager:removeUiPanel("shengli")
	self.m_shengli_panel = nil
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showPvpShibai
-- 显示Pvp失败界面
-------------------------------------------------
function f_battle_manager:showPvpShibai()
	self.m_shibai_panel = f_battle_result_pvp_shibai.static_create()
	self.m_shibai_panel:panelInitBeforePopup()
	self.m_shibai_panel:setBattleManager(self)
	g_game.g_panelManager:showUiPanel(self.m_shibai_panel,"qgyd_shibai")

end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showLueduoResult
-- 显示掠夺结果界面
-------------------------------------------------
function f_battle_manager:showLueduoResult(isWin)
	local panel = f_lueduo_result.static_create()
	panel:panelInitBeforePopup(isWin, self.m_battle_data["roundData"]["chipReward"])
	panel:setBattleManager(self)
	g_game.g_panelManager:showUiPanel(panel,"lueduo_result")
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showLueduoResult
-- 显示掠夺结果界面
-------------------------------------------------
function f_battle_manager:showReplayResult(isWin)
	local panel = f_replay_result.static_create()
	panel:panelInitBeforePopup(isWin)
	panel:setBattleManager(self)
	g_game.g_panelManager:showUiPanel(panel,"lueduo_result")
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showShibai
-- 显示失败界面
-------------------------------------------------
function f_battle_manager:showShibai()
	self.m_shibai_panel = f_battle_result_shibai.static_create()
	self.m_shibai_panel:panelInitBeforePopup()
	self.m_shibai_panel:setBattleManager(self)
	g_game.g_panelManager:showUiPanel(self.m_shibai_panel,"shibai")

end

-------------------------------------------------
-- @function [parent=#f_battle_manager] showJuezhan
-- 显示决战界面
-------------------------------------------------
function f_battle_manager:showJuezhan(roundData)
	self.m_juezhan_panel = f_battle_juezhan_panel.static_create()
	self.m_juezhan_panel:panelInit(roundData, self)

	g_game.g_panelManager:showUiPanel(self.m_juezhan_panel,"juezhan")

	self.m_battle_effect_manager:forceHideSkillInfo()
end
-------------------------------------------------
-- @function [parent=#f_battle_manager] hideJuezhan
-- 移除决战界面
-------------------------------------------------
function f_battle_manager:hideJuezhan()
	g_game.g_panelManager:removeUiPanel("juezhan")
	self.m_juezhan_panel = nil
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] skipBattle
-- 跳过战斗过程，直接显示战斗结果
-------------------------------------------------
function f_battle_manager:skipBattle()
	--	self.m_currentState = self.BATTLE_FINISH
	if g_game.g_userInfoManager:canSkipBattle() then
		self.m_currentState 		= self.END_BATTLE_STATE
		self.m_currentSubState		= self.SUB_STATE_NONE
		self.m_time = 0.0
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] judgeJuezhan
-- 判定是否决战
-------------------------------------------------
function f_battle_manager:judgeJuezhan()
	local selfFinalNum = self.m_battle_data["roundData"]["selfFinal_Num"]
	local enemyFinalNum = self.m_battle_data["roundData"]["enemyFinal_Num"]

	if selfFinalNum > 0 and enemyFinalNum > 0 then
		return true
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] refreshPvpReward
-- pvp 更新
-------------------------------------------------
function f_battle_manager:refreshPvpReward()
	local newlv = self.m_battle_data["roundData"]["level"]
	local newExp = self.m_battle_data["roundData"]["totalExp"]
	local newSilver = self.m_battle_data["roundData"]["totalSilver"]

	g_game.g_userInfoManager:refershUserLevelInfo(newlv,newExp)
	g_game.g_userInfoManager:refershUserSilver(newSilver)

	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["military"] = self.m_battle_data["roundData"]["military"]
	userInfo["energy"] = self.m_battle_data["roundData"]["energy"]
	userInfo["strength"] = self.m_battle_data["roundData"]["strength"]

	local t = self.m_battle_data["roundData"]["chipReward"]
	if t ~= nil then
		for i = 1, #t do
			g_game.g_userInfoManager:insertPieceToTable(13, t[i]["chipId"])
		end
	end

	if not g_game.g_utilManager:allGuidelinesIsFinish() then
		self:updateMainSceneUi()
	elseif self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
		g_game.g_userInfoManager:requestUserPvpPlayerList()
	elseif self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST or self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_REPLAY then
		self:updateMainSceneUi()
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] updateMainSceneUi
-- 返回主场景后的 ui 跳转
-------------------------------------------------
function f_battle_manager:updateMainSceneUi()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVE_LEVEL, self.event_updateToMainScene)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVP_UI, self.event_updateToMainScene)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_BACK_TOWORLD_BOSS, self.event_updateToWorldBoss)
	--进入资源loading界面
	g_game.enterLoadingScene(2)
	if g_game.g_current_loading_scene ~= nil then
		g_game.g_current_loading_scene:setLoadingData({"test"})
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] requestpvpLvupToMainUi
-- pvp请求升级信息
-------------------------------------------------
function f_battle_manager:requestpvpLvupToMainUi(type)
	local newlv = self.m_battle_data["roundData"]["level"]
	local newExp = self.m_battle_data["roundData"]["totalExp"]
	local newSilver = self.m_battle_data["roundData"]["totalSilver"]

	g_game.g_userInfoManager:refershUserLevelInfo(newlv,newExp)
	g_game.g_userInfoManager:refershUserSilver(newSilver)

	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["military"] = self.m_battle_data["roundData"]["military"]
	userInfo["energy"] = self.m_battle_data["roundData"]["energy"]
	userInfo["strength"] = self.m_battle_data["roundData"]["strength"]

	g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,type)
	--进入资源loading界面
	g_game.enterLoadingScene(2)
	if g_game.g_current_loading_scene ~= nil then
		g_game.g_current_loading_scene:setLoadingData({"test"})
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] requestLvupToMainUi
-- pve请求升级信息
-------------------------------------------------
function f_battle_manager:requestLvupToMainUi(type)

	if self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP then
		local newlv = self.m_battle_data["roundData"]["level"]
		local newExp = self.m_battle_data["roundData"]["totalExp"]
		local newSilver = self.m_battle_data["roundData"]["totalSilver"]
		
		g_game.g_userInfoManager:refershUserLevelInfo(newlv,newExp)
		g_game.g_userInfoManager:refershUserSilver(newSilver)
		
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		userInfo["military"] = self.m_battle_data["roundData"]["military"]
		userInfo["energy"] = self.m_battle_data["roundData"]["energy"]
		userInfo["strength"] = self.m_battle_data["roundData"]["strength"]
	else
		if self.m_battle_data["roundData"]["fightResult"]  == 1 then

			g_game.g_userInfoManager:refershUserLevelInfo(self.m_battle_data["roundData"]["currLevel"], self.m_battle_data["roundData"]["emperorExp"])
			self:updateRewardToUserData()
			g_game.g_userInfoManager:refershUserSilver(self.m_battle_data["roundData"]["silver"])
	
			local userInfo = g_game.g_userInfoManager:getUserInfo()
			userInfo["military"] = self.m_battle_data["roundData"]["military"]
			userInfo["energy"] = self.m_battle_data["roundData"]["energy"]
			userInfo["strength"] = self.m_battle_data["roundData"]["strength"]
		end
	end

	g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,type)

	--进入资源loading界面
	g_game.enterLoadingScene(2)
	if g_game.g_current_loading_scene ~= nil then
		g_game.g_current_loading_scene:setLoadingData({"test"})
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] requestLevelUp
-- 请求世界boss  返回 需要先更新下活动消息
-------------------------------------------------
function f_battle_manager:requestBossBack()
	g_game.g_userInfoManager.m_shouldOpenHuodong = false
	g_game.g_userInfoManager:requestHuodongList()
end


-------------------------------------------------
-- @function [parent=#f_battle_manager] requestLevelUp
-- 请求升级信息
-------------------------------------------------
function f_battle_manager:requestLevelUp()

	if self.m_battle_data["roundData"]["fightResult"]  == 1 then

		g_game.g_userInfoManager:refershUserLevelInfo(self.m_battle_data["roundData"]["currLevel"], self.m_battle_data["roundData"]["emperorExp"])
		self:updateRewardToUserData()
		g_game.g_userInfoManager:refershUserSilver(self.m_battle_data["roundData"]["silver"])

		local userInfo = g_game.g_userInfoManager:getUserInfo()
		userInfo["military"] = self.m_battle_data["roundData"]["military"]
		userInfo["energy"] = self.m_battle_data["roundData"]["energy"]
		userInfo["strength"] = self.m_battle_data["roundData"]["strength"]

	end

	if self.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
		g_game.g_userInfoManager:requestUserPveProgress()
		return
	end

	if  not g_game.g_utilManager:allGuidelinesIsFinish() then
		self:updateMainSceneUi()
	else
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
		g_game.g_userInfoManager:requestUserPveProgress()
	end
end

-------------------------------------------------
-- @function [parent=#f_battle_manager] updateRewardToUserData
-- 更新战斗奖励到用户数据
-------------------------------------------------
function f_battle_manager:updateRewardToUserData()
	local beautyReward_Num = self.m_battle_data["roundData"]["beautyReward_Num"]
	if beautyReward_Num > 0 then
		for i = 1, beautyReward_Num do
			g_game.g_userInfoManager:addEmptyCard(2,self.m_battle_data["roundData"]["beautyReward"][i]["beautyId"],
			self.m_battle_data["roundData"]["beautyReward"][i]["id"],1)
		end
	end
	local officerReward_Num = self.m_battle_data["roundData"]["officerReward_Num"]
	if officerReward_Num > 0 then
		for i = 1, officerReward_Num do
			g_game.g_userInfoManager:addEmptyCard(3,self.m_battle_data["roundData"]["officerReward"][i]["officerId"],
			self.m_battle_data["roundData"]["officerReward"][i]["id"],1)
		end
	end
	local equipReward_Num = self.m_battle_data["roundData"]["equipReward_Num"]
	if equipReward_Num > 0 then
		for i = 1, equipReward_Num do
			g_game.g_userInfoManager:addEmptyCard(6,self.m_battle_data["roundData"]["equipReward"][i]["equipId"],
			self.m_battle_data["roundData"]["equipReward"][i]["id"],1)
		end
	end

	local propReward_Num = self.m_battle_data["roundData"]["propReward_Num"]
	if propReward_Num > 0 then
		for i = 1, propReward_Num do
			g_game.g_userInfoManager:insertProp(self.m_battle_data["roundData"]["propReward"][i])
		end
	end

	local chipReward_Num = self.m_battle_data["roundData"]["chipReward_Num"]
	if chipReward_Num > 0 then
		for i = 1, chipReward_Num do
			local chipData = self.m_battle_data["roundData"]["chipReward"][i]
			g_game.g_userInfoManager:insertPieceToTable(chipData["type"] + 9,chipData["chipId"])
		end
	end
end


return f_battle_manager