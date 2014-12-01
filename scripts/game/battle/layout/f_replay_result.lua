require("scripts.auto.auto_replay_result")

--[[--
   弹出胜利面板  
--]]--
f_replay_result = class("f_replay_result")
f_replay_result._index = f_replay_result

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_replay_result.static_create()
	local shengliTable = createreplay_result()
	local shengliPanel = shengliTable["replay_result"]
	  
	local funTable = {}
	tolua.setpeer(shengliPanel, funTable)
	setmetatable(funTable, f_replay_result)
	
	shengliPanel.m_componentTable = shengliTable
	return shengliPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_replay_result:panelInitBeforePopup(isWin)
	self:registerNodeEvent()
	
	self.m_isWin = isWin
	self.m_shaderCom = {"bgL", "bgR", "titlebg", "lineL", "lineR"}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] setBattleManager
-------------------------------------------------------------------------------
function f_replay_result:setBattleManager(bm)
	self.m_bm = bm
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] registerNodeEvent
-------------------------------------------------------------------------------
function f_replay_result:registerNodeEvent(handler)
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
-- @function [parent=#f_replay_result] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_replay_result:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] showActionIsFinish
-- 新手引导，面板显示action完成标志位
-------------------------------------------------------------------------------
function f_replay_result:showActionIsFinish()
	return self.m_show_action_is_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] onEnter
-------------------------------------------------------------------------------
function f_replay_result:onEnter()
	if self.m_isWin then
		local winAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		winAnim:setSize(cc.size(200,200))
		self.m_componentTable["rr_panel"]:appendComponent(winAnim)
		winAnim:setPositionInContainer(cc.p(352,81))
		
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
  	 	self.m_componentTable["rr_panel"]:setPositionInContainer(cc.p(480,-300))
		local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
		local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
		self.m_componentTable["rr_panel"]:runAction(actions)
		self.m_componentTable["rr_label"]:setString("您胜利了")
		for i = 1, #self.m_shaderCom do
			self.m_componentTable[self.m_shaderCom[i]]:setImageType(0)
		end
	else
		local playAnim = function()
			local loseAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			loseAnim:setSize(200,200)
			self.m_componentTable["rr_panel"]:appendComponent(loseAnim)
			loseAnim:setPositionInContainer(cc.p(352,81))
			loseAnim:setLoop(false)
			loseAnim:setAnimationSpeedScale(0.7)
			loseAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[7])
		end
		
		self.m_componentTable["rr_panel"]:setPositionInContainer(cc.p(502,-300))
		local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
		
		local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
		self.m_componentTable["rr_panel"]:runAction(actions)
		
		local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
		self.m_componentTable["rr_panel"]:runAction(actions)
		self.m_componentTable["rr_label"]:setString("您失败了")
		for i = 1, #self.m_shaderCom do
			self.m_componentTable[self.m_shaderCom[i]]:setImageType(2)
		end
		self.m_componentTable["sui1"]:setVisible(false)
		self.m_componentTable["sui2"]:setVisible(false)
	end

	local back = function()
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE, g_game.F_BACK_TOUI_MAIL)
		self.m_bm:updateMainSceneUi()
	end
	self.m_componentTable["midOkBtn"]:addHandleOfcomponentEvent(back,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] onExit
-------------------------------------------------------------------------------
function f_replay_result:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_replay_result:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] onExitTransitionStart
-------------------------------------------------------------------------------
function f_replay_result:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_replay_result] onCleanup
-------------------------------------------------------------------------------
function f_replay_result:onCleanup()
end
