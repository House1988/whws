require("scripts.auto.auto_worldboss_shengli")
--[[--
   弹出boss胜利面板  
--]]--
f_world_boss_win = class("f_world_boss_win")
f_world_boss_win.__index = f_world_boss_win

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_world_boss_win.static_create()
	local shengliTable = createworldboss_shengli()
	local shengliPanel = shengliTable["worldboss_shengli"]
	  
	local funTable = {}
	tolua.setpeer(shengliPanel, funTable)
	setmetatable(funTable, f_world_boss_win)
	
	shengliPanel.m_componentTable = shengliTable
	return shengliPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_world_boss_win:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_battle_manager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] registerNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_win:registerNodeEvent(handler)
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
-- @function [parent=#f_world_boss_win] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_win:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] onEnter
-------------------------------------------------------------------------------
function f_world_boss_win:onEnter()
	local winAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	winAnim:setSize(cc.size(200,200))
	self.m_componentTable["bottom_panel"]:appendComponent(winAnim)
	winAnim:setPositionInContainer(cc.p(325,81))
	
	local playAnim = function()
		winAnim:setLoop(false)
		winAnim:setAnimationSpeedScale(0.7)
		winAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[5])
	end
	
	self.m_componentTable["bottom_panel"]:setPositionInContainer(cc.p(505,-301))
	local moveTo = cc.MoveBy:create(0.3,cc.p(0,-601))
	
	local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
	self.m_componentTable["bottom_panel"]:runAction(actions)
	
	self:initAllComponent()
	
	--播放胜利音效
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHENGLI)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] onExit
-------------------------------------------------------------------------------
function f_world_boss_win:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_world_boss_win:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] onExitTransitionStart
-------------------------------------------------------------------------------
function f_world_boss_win:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] onCleanup
-------------------------------------------------------------------------------
function f_world_boss_win:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_world_boss_win:initAllComponent()
	
	local queding = function()
		 self.m_battle_manager:requestBossBack()
	  	 send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shengli_queding_button"]:addHandleOfcomponentEvent(queding, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_win] setBattleManager
-- 设置
-------------------------------------------------------------------------------
function f_world_boss_win:setBattleManager(battleManager)
	self.m_battle_manager = battleManager
	self.m_componentTable["hurt_label"]:setTextWithInt(self.m_battle_manager.m_battle_data["roundData"]["bossHurt"] )

	local gain = math.floor(self.m_battle_manager.m_battle_data["roundData"]["bossHurt"]/2)
	self.m_componentTable["reward_contri"]:setString(gain)
end


