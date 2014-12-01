require("scripts.game.battle.layout.f_battle_reward_panel")
require("scripts.game.battle.layout.f_battle_elite_reward_panel")
--[[--
   弹出胜利面板  
--]]--
f_battle_result_shengli = class("f_battle_result_shengli")
f_battle_result_shengli.__index = f_battle_result_shengli

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_result_shengli.static_create()
	local shengliTable = g_game.g_panelManager:create_panel("shengli")
	local shengliPanel = shengliTable["shengli"]
	  
	local funTable = {}
	tolua.setpeer(shengliPanel, funTable)
	setmetatable(funTable, f_battle_result_shengli)
	
	shengliPanel.m_componentTable = shengliTable
	return shengliPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_result_shengli:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_rewardBoxArr = {}
	self.m_isEnabled = false
	self.m_battle_manager = nil
	
	self.m_show_action_is_finish = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_shengli:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_result_shengli] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_shengli:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] showActionIsFinish
-- 新手引导，面板显示action完成标志位
-------------------------------------------------------------------------------
function f_battle_result_shengli:showActionIsFinish()
	return self.m_show_action_is_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] onEnter
-------------------------------------------------------------------------------
function f_battle_result_shengli:onEnter()
	g_game.g_userInfoManager.m_isPveWin = true
	self.m_componentTable["shengli_word_label"]:setAlignment(0)
	
	local winAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	winAnim:setSize(cc.size(200,200))
	self.m_componentTable["bottom_panel"]:appendComponent(winAnim)
	winAnim:setPositionInContainer(cc.p(325,81))
	
	self.starAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self.m_componentTable["bottom_panel"]:appendComponent(self.starAnim)
	self.starAnim:setPositionInContainer(cc.p(313,307))
	
	local changeAnim = function()
		self:showStar()
		winAnim:setLoop(true)
		winAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[6])
	end
	
	local playAnim = function()
		winAnim:setLoop(false)
		winAnim:setAnimationSpeedScale(0.7)
		winAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[5])
		winAnim:registeAnimationFinishCallback(changeAnim)
		
		self.m_show_action_is_finish = true
	end
	
	for i = 1, 3 do
		local rewardBox =  g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	  	self.m_componentTable["bottom_panel"]:appendComponent(rewardBox)
		rewardBox:setPositionInContainer(cc.p(200+(i-1)*120,395))
		rewardBox:setSize(cc.size(150,150))
		rewardBox:setLoop(false)	
		rewardBox:setAnimationScale(1.0)
		rewardBox:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[8])
		rewardBox:setTouchEnabled(true)
		table.insert(self.m_rewardBoxArr,rewardBox)
	end 
	
	self.m_componentTable["bottom_panel"]:setPositionInContainer(cc.p(505,-301))
	local moveTo = cc.MoveBy:create(0.3,cc.p(0,-601))
	
	local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
	self.m_componentTable["bottom_panel"]:runAction(actions)
	
	self:initAllComponent()
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	
	self.m_expAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_expAnim:setup(self.m_componentTable["shengli_exp_num_label"], 21, "+%d", false, false)
	self.m_componentTable["shengli"]:appendComponent(self.m_expAnim)
	local p = self.m_componentTable["shengli_exp_num_label"]:getPositionInContainer()
	self.m_expAnim:setPositionInContainer(p)
	self.m_expAnim:play(0, self.m_battle_manager.m_battle_data["roundData"]["obtainExp"], 1)
	
	self.m_coinAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_coinAnim:setup(self.m_componentTable["shengli_yuanbao_num_label"], 21, "+%d", false, false)
	self.m_componentTable["shengli"]:appendComponent(self.m_coinAnim)
	local p = self.m_componentTable["shengli_yuanbao_num_label"]:getPositionInContainer()
	self.m_coinAnim:setPositionInContainer(p)
	self.m_coinAnim:play(0, self.m_battle_manager.m_battle_data["roundData"]["silver"] - userSilver, 1)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] onExit
-------------------------------------------------------------------------------
function f_battle_result_shengli:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_result_shengli:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_result_shengli:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] onCleanup
-------------------------------------------------------------------------------
function f_battle_result_shengli:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_result_shengli:initAllComponent()
	--设置胜利查看 和 回放按钮 不显示
	local touchBox1Function = function()
	  	 self:enableBoxByIndex(1)
	  	 send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAIBAOXIANG)
	end
	self.m_rewardBoxArr[1]:addHandleOfcomponentEvent(touchBox1Function, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local touchBox2Function = function()
		 self:enableBoxByIndex(2)
		 send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAIBAOXIANG)
	end
	self.m_rewardBoxArr[2]:addHandleOfcomponentEvent(touchBox2Function, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local touchBox3Function = function()
	  	 self:enableBoxByIndex(3)
	  	 send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAIBAOXIANG)
	end
	self.m_rewardBoxArr[3]:addHandleOfcomponentEvent(touchBox3Function, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] enableBoxByIndex
-- 设置
-------------------------------------------------------------------------------
function f_battle_result_shengli:enableBoxByIndex(index)
	local popupReward = function()
		self.m_rewardBoxArr[index]:setLoop(true)
		self:setVisible(false)
		
		if self.m_battle_manager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE then
			self:showPveRewardPanel()
		elseif self.m_battle_manager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
			self:showPveEliteRewardPanel()
		end
	end

	if not self.m_isEnabled then
		 self.m_rewardBoxArr[index]:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2], g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[9])
	  	 self.m_rewardBoxArr[index]:registeAnimationFinishCallback(popupReward)
	  	 self.m_isEnabled = true
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] showPveRewardPanel
-------------------------------------------------------------------------------
function f_battle_result_shengli:showPveRewardPanel()
	local popupReward = f_battle_reward_panel.static_create()
    popupReward:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(popupReward,"rewardInfo")
	popupReward:setBattleManager(self.m_battle_manager)
	popupReward:updatePanelData()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN)
end

---------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] showPveEliteRewardPanel
-------------------------------------------------------------------------------
function f_battle_result_shengli:showPveEliteRewardPanel()
	local rewardPop = f_battle_elite_reward_panel.static_create()
	rewardPop:panelInitBeforePopup()
	rewardPop:setBattleManager(self.m_battle_manager)
	g_game.g_panelManager:showUiPanel(rewardPop, "mail_attachment")
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] setBattleManager
-- 设置
-------------------------------------------------------------------------------
function f_battle_result_shengli:setBattleManager(battleManager)
	self.m_battle_manager = battleManager
	
	if self.m_battle_manager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE then
		self:showPveContent()
	elseif self.m_battle_manager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
		self:showPveEliteContent()
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] showPveContent
-------------------------------------------------------------------------------
function f_battle_result_shengli:showStar()
	if self.m_battle_manager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE then
		--判断战斗 结果星级
		local showStarNum = 0
		if self.m_battle_manager.m_battle_data["roundData"]["fightResult"] == 0 then
			showStarNum = 0
		else
			local roundNum = self.m_battle_manager.m_battle_data["roundData"]["roundData_Num"]
	
			if roundNum <= 2 then
				showStarNum = 3
			else
				local isFinalFight = self.m_battle_manager:judgeJuezhan()
				if isFinalFight then
					showStarNum = 1
				else
					showStarNum = 2
				end
			end
		end
		
		self.starAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[10+showStarNum])
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] showPveContent
-------------------------------------------------------------------------------
function f_battle_result_shengli:showPveContent()
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	local rewardSilver = self.m_battle_manager.m_battle_data["roundData"]["silver"]-userSilver
	self.m_componentTable["shengli_yuanbao_num_label"]:setString("+"..rewardSilver)
	
	local rewardExp = self.m_battle_manager.m_battle_data["roundData"]["obtainExp"]
	self.m_componentTable["shengli_exp_num_label"]:setString("+"..rewardExp)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shengli] showPveEliteContent
-------------------------------------------------------------------------------
function f_battle_result_shengli:showPveEliteContent()
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	local rewardSilver = self.m_battle_manager.m_battle_data["roundData"]["silver"]-userSilver
	self.m_componentTable["shengli_yuanbao_num_label"]:setString("+"..rewardSilver)
	
	local rewardExp = self.m_battle_manager.m_battle_data["roundData"]["obtainExp"]
	self.m_componentTable["shengli_exp_num_label"]:setString("+"..rewardExp)
	
end
