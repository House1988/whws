
--[[--
   弹出失败面板  
--]]--
f_battle_result_shibai = class("f_battle_result_shibai")
f_battle_result_shibai.__index = f_battle_result_shibai

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_result_shibai.static_create()
	local shibaiTable = g_game.g_panelManager:create_panel("shibai")
	local shibaiPanel = shibaiTable["shibai"]
	  
	local funTable = {}
	tolua.setpeer(shibaiPanel, funTable)
	setmetatable(funTable, f_battle_result_shibai)
	
	shibaiPanel.m_componentTable = shibaiTable
	return shibaiPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_result_shibai:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_show_action_is_finish = false
	
	self.m_battle_manager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_shibai:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_result_shibai] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_shibai:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] showActionIsFinish
-- 新手引导，移动显示action完成
-------------------------------------------------------------------------------
function f_battle_result_shibai:showActionIsFinish()   
	return self.m_show_action_is_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] onEnter
-------------------------------------------------------------------------------
function f_battle_result_shibai:onEnter()   
	g_game.g_userInfoManager.m_isPveWin = false
	self.m_componentTable["shibai_word_label"]:setAlignment(0)
	
	local playAnim = function()
		local loseAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		loseAnim:setSize(cc.size(200,200))
		self.m_componentTable["shibai_bottom_panel"]:appendComponent(loseAnim)
		loseAnim:setPositionInContainer(cc.p(325,81))
		loseAnim:setLoop(false)
		loseAnim:setAnimationSpeedScale(0.7)
		loseAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[7])
		
		self.m_show_action_is_finish = true
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
-- @function [parent=#f_battle_result_shibai] onExit
-------------------------------------------------------------------------------
function f_battle_result_shibai:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_result_shibai:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_result_shibai:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] onCleanup
-------------------------------------------------------------------------------
function f_battle_result_shibai:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_result_shibai:initAllComponent()
	--注册按钮回调函数
	local okCallback = function()	
		self.m_battle_manager:requestLevelUp()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	local btn = self.m_componentTable["shibai_queding_button"]
	btn:addHandleOfcomponentEvent(okCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local jumoToPaibing = function()
		self.m_battle_manager:requestLvupToMainUi(g_game.F_BACK_TOUI_OFFICER)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shibai_paibingbuzhen_button"]:addHandleOfcomponentEvent(jumoToPaibing, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local jumpToKeju = function()
		self.m_battle_manager:requestLvupToMainUi(g_game.F_BACK_TOUI_KEJU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shibai_zhaomu_button"]:addHandleOfcomponentEvent(jumpToKeju, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local jumpToZhuangbei = function()
		self.m_battle_manager:requestLvupToMainUi(g_game.F_BACK_TOUI_ZHUANGBEI)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shibai_equipLvup_button"]:addHandleOfcomponentEvent(jumpToZhuangbei, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
	self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_shibai] setBattleManager
-- 设置
-------------------------------------------------------------------------------
function f_battle_result_shibai:setBattleManager(battleManager)
	self.m_battle_manager = battleManager
	
	self.m_componentTable["shibai_yuanbao_num_label"]:setString("+0")
	
	self.m_componentTable["shibai_exp_num_label"]:setString("+0")
	
end