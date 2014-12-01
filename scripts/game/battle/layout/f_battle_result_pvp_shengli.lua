
--[[--
  pvp胜利面板  
--]]--
f_battle_result_pvp_shengli = class("f_battle_result_pvp_shengli")
f_battle_result_pvp_shengli.__index = f_battle_result_pvp_shengli

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_result_pvp_shengli.static_create()
	local shengliTable = g_game.g_panelManager:create_panel("qgyd_shengli")
	local shengliPanel = shengliTable["qgyd_shengli"]
	  
	local funTable = {}
	tolua.setpeer(shengliPanel, funTable)
	setmetatable(funTable, f_battle_result_pvp_shengli)
	
	shengliPanel.m_componentTable = shengliTable
	return shengliPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_battle_manager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_result_pvp_shengli] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] onEnter
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:onEnter()
   	local winAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	winAnim:setSize(cc.size(200,200))
	self.m_componentTable["qgyd_shengli_bottom"]:appendComponent(winAnim)
	winAnim:setPositionInContainer(cc.p(325,81))
	
	local changeAnim = function()
		winAnim:setLoop(true)
		winAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[6])
	end
	
	local playAnim = function()
		winAnim:setLoop(false)
		winAnim:setAnimationSpeedScale(0.7)
		winAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[5])
		winAnim:registeAnimationFinishCallback(changeAnim)
	end
   	self.m_componentTable["qgyd_shengli_bottom"]:setPositionInContainer(cc.p(480,-300))
	local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
	
	local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
	self.m_componentTable["qgyd_shengli_bottom"]:runAction(actions)
   	
	self:initAllComponent()
	
	self.m_expAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_expAnim:setup(self.m_componentTable["qgyd_shengli_exp_num_label"], 21, " %d", false, false)
	self.m_componentTable["qgyd_shengli"]:appendComponent(self.m_expAnim)
	local p = self.m_componentTable["qgyd_shengli_exp_num_label"]:getPositionInContainer()
	self.m_expAnim:setPositionInContainer(p)
	self.m_expAnim:play(0, self.m_battle_manager.m_battle_data["roundData"]["expAddition"], 1)
	
	self.m_coinAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_coinAnim:setup(self.m_componentTable["qgyd_shengli_yuanbao_num_label"], 21, "%d", false, false)
	self.m_componentTable["qgyd_shengli"]:appendComponent(self.m_coinAnim)
	local p = self.m_componentTable["qgyd_shengli_yuanbao_num_label"]:getPositionInContainer()
	self.m_coinAnim:setPositionInContainer(p)
	self.m_coinAnim:play(0, self.m_battle_manager.m_battle_data["roundData"]["silverAddition"], 1)
	--播放胜利音效
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHENGLI)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] onExit
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] onCleanup
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:initAllComponent()

	--注册按钮回调函数
	local okCallback = function()	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		local userExp = g_game.g_userInfoManager:getUserExp()
		if  self.m_battle_manager.m_battle_data["roundData"]["levelUp"] == 1 then
			self:setVisible(false)
			local preLv = g_game.g_userInfoManager:getLevel()
			local curLv = self.m_battle_manager.m_battle_data["roundData"]["level"]
			local isOpenPosition = g_game.g_dictConfigManager:isOpenPosition(preLv,curLv)
		
			local emperorlvupBoard = f_battle_emperor_lvup.static_create()
		    emperorlvupBoard:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(emperorlvupBoard,"pve_emperor_lvup")
			emperorlvupBoard:setBattleManager(self.m_battle_manager)
			emperorlvupBoard:setOpenPosType(isOpenPosition)
			
		else
			self.m_battle_manager:refreshPvpReward()
		end
	end	
	local btn = self.m_componentTable["qgyd_shengli_queding_button"]
	btn:addHandleOfcomponentEvent(okCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self:setStopTouchEvent(true)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shengli] setBattleManager
-- 设置
-------------------------------------------------------------------------------
function f_battle_result_pvp_shengli:setBattleManager(battleManager)
	self.m_battle_manager = battleManager
	
	--pvp胜利后排名 
	local rank = self.m_battle_manager.m_battle_data["roundData"]["currRank"]
	self.m_componentTable["qgyd_shengli_tishengzhi_num_label"]:setString(rank)
	
	--银两
--	local silver = self.m_battle_manager.m_battle_data["roundData"]["silverAddition"]
--	self.m_componentTable["qgyd_shengli_yuanbao_num_label"]:setString(silver)
--	
--	--增加的经验值
--	local exp = self.m_battle_manager.m_battle_data["roundData"]["expAddition"]
--	self.m_componentTable["qgyd_shengli_exp_num_label"]:setString(exp)
	
	--增加的功绩值
	local contribute = self.m_battle_manager.m_battle_data["roundData"]["contributionAddition"]
	self.m_componentTable["qgyd_shengli_gongji_num_label"]:setString(contribute)
	
end
