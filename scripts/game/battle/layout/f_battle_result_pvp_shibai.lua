
--[[--
   pvp失败面板 
--]]--
f_battle_result_pvp_shibai = class("f_battle_result_pvp_shibai")
f_battle_result_pvp_shibai.__index = f_battle_result_pvp_shibai

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_result_pvp_shibai.static_create()
	local shibaiTable = g_game.g_panelManager:create_panel("qgyd_shibai")
	local shibaiPanel = shibaiTable["qgyd_shibai"]
	  
	local funTable = {}
	tolua.setpeer(shibaiPanel, funTable)
	setmetatable(funTable, f_battle_result_pvp_shibai)
	
	shibaiPanel.m_componentTable = shibaiTable
	return shibaiPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_battle_manager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_result_pvp_shibai] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] onEnter
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:onEnter()   
	local playAnim = function()
		local loseAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		loseAnim:setSize(200,200)
		self.m_componentTable["qgyd_shibai_panel"]:appendComponent(loseAnim)
		loseAnim:setPositionInContainer(cc.p(325,81))
		loseAnim:setLoop(false)
		loseAnim:setAnimationSpeedScale(0.7)
		loseAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[7])
	end
	
	self.m_componentTable["qgyd_shibai_panel"]:setPositionInContainer(cc.p(502,-300))
	local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
	
	local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
	self.m_componentTable["qgyd_shibai_panel"]:runAction(actions)

	self:initAllComponent()	
	--播放胜利音效
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHIBAI)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] onExit
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] onCleanup
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:initAllComponent()
	--注册按钮回调函数
	local okCallback = function()	
		self.m_battle_manager:refreshPvpReward()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	local btn = self.m_componentTable["qgyd_shibai_queding_button"]
	btn:addHandleOfcomponentEvent(okCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local paibing = function()	
		self.m_battle_manager:requestLvupToMainUi(g_game.F_BACK_TOUI_OFFICER)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["qgyd_paibing_btn"]:addHandleOfcomponentEvent(paibing, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local keju  = function()	
		self.m_battle_manager:requestLvupToMainUi(g_game.F_BACK_TOUI_KEJU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["qgyd_keju_btn"]:addHandleOfcomponentEvent(keju, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local zhuangbei = function()	
		self.m_battle_manager:requestLvupToMainUi(g_game.F_BACK_TOUI_ZHUANGBEI)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["qgyd_equiplv_btn"]:addHandleOfcomponentEvent(zhuangbei, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
	self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_result_pvp_shibai] setBattleManager
-- 设置
-------------------------------------------------------------------------------
function f_battle_result_pvp_shibai:setBattleManager(battleManager)
	self.m_battle_manager = battleManager
	
	--银两
	local silver = self.m_battle_manager.m_battle_data["roundData"]["silverAddition"]
	self.m_componentTable["qgyd_shibai_yuanbao_num_label"]:setString("+"..silver)
	
	--增加的经验值
	local exp = self.m_battle_manager.m_battle_data["roundData"]["expAddition"]
	self.m_componentTable["qgyd_shibai_exp_num_label"]:setString("+"..exp)
	
	--增加的功绩值
	local contribute = self.m_battle_manager.m_battle_data["roundData"]["contributionAddition"]
	self.m_componentTable["qgyd_shibai_gongji_num_label"]:setString("+"..contribute)
	
end
