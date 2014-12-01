require("scripts.auto.auto_worldboss_shibai")
--[[--
   弹出boss失败面板  
--]]--
f_world_boss_lose = class("f_world_boss_lose")
f_world_boss_lose.__index = f_world_boss_lose

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_world_boss_lose.static_create()
	local shibaiTable = createworldboss_shibai()
	local shibaiPanel = shibaiTable["worldboss_shibai"]
	  
	local funTable = {}
	tolua.setpeer(shibaiPanel, funTable)
	setmetatable(funTable, f_world_boss_lose)
	
	shibaiPanel.m_componentTable = shibaiTable
	return shibaiPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_world_boss_lose:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_battle_manager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] registerNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_lose:registerNodeEvent(handler)
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
-- @function [parent=#f_world_boss_lose] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_lose:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

function f_world_boss_lose:setImagesGrey()
	self.m_componentTable["line_left"]:setImageType(2)
	self.m_componentTable["line_right"]:setImageType(2)
	self.m_componentTable["shibai_bg_image"]:setImageType(2)
	self.m_componentTable["shibai_bg_left"]:setImageType(2)
	self.m_componentTable["shibai_bg_right"]:setImageType(2)
	self.m_componentTable["sui1"]:setImageType(2)
	self.m_componentTable["sui2"]:setImageType(2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] onEnter
-------------------------------------------------------------------------------
function f_world_boss_lose:onEnter()   
	self:setImagesGrey()
	
	local playAnim = function()
		local loseAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		loseAnim:setSize(cc.size(200,200))
		self.m_componentTable["shibai_bottom_panel"]:appendComponent(loseAnim)
		loseAnim:setPositionInContainer(cc.p(325,81))
		loseAnim:setLoop(false)
		loseAnim:setAnimationSpeedScale(0.7)
		loseAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[7])
		
	end
	
	self.m_componentTable["shibai_bottom_panel"]:setPositionInContainer(cc.p(508,-300))
	local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
	
	local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
	self.m_componentTable["shibai_bottom_panel"]:runAction(actions)
	
	self:initAllComponent()	
	
	--播放胜利音效
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHIBAI)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] onExit
-------------------------------------------------------------------------------
function f_world_boss_lose:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_world_boss_lose:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] onExitTransitionStart
-------------------------------------------------------------------------------
function f_world_boss_lose:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] onCleanup
-------------------------------------------------------------------------------
function f_world_boss_lose:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_world_boss_lose:initAllComponent()
	--注册按钮回调函数
	local okCallback = function()	
		self.m_battle_manager:requestBossBack()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	local btn = self.m_componentTable["shibai_queding_button"]
	btn:addHandleOfcomponentEvent(okCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_lose] setBattleManager
-- 设置
-------------------------------------------------------------------------------
function f_world_boss_lose:setBattleManager(battleManager)
	self.m_battle_manager = battleManager
	self.m_componentTable["hurt_shibai"]:setTextWithInt(self.m_battle_manager.m_battle_data["roundData"]["bossHurt"])

	local gain = math.floor(self.m_battle_manager.m_battle_data["roundData"]["bossHurt"]/2)
	self.m_componentTable["reward_con2"]:setString(gain)
end