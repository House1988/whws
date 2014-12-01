require("scripts.auto.auto_lueduo_result")

--[[--
   弹出胜利面板  
--]]--
f_lueduo_result = class("f_lueduo_result")
f_lueduo_result._index = f_lueduo_result

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_lueduo_result.static_create()
	local shengliTable = createlueduo_result()
	local shengliPanel = shengliTable["lueduo_result"]
	  
	local funTable = {}
	tolua.setpeer(shengliPanel, funTable)
	setmetatable(funTable, f_lueduo_result)
	
	shengliPanel.m_componentTable = shengliTable
	return shengliPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_lueduo_result:panelInitBeforePopup(isWin, rewards)
	self:registerNodeEvent()
	
	self.m_isWin = isWin
	self.m_rewards = rewards
	self.m_shaderCom = {"bgL", "bgR", "titlebg", "lineL", "lineR"}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] setBattleManager
-------------------------------------------------------------------------------
function f_lueduo_result:setBattleManager(bm)
	self.m_bm = bm
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] registerNodeEvent
-------------------------------------------------------------------------------
function f_lueduo_result:registerNodeEvent(handler)
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
-- @function [parent=#f_lueduo_result] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lueduo_result:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] showActionIsFinish
-- 新手引导，面板显示action完成标志位
-------------------------------------------------------------------------------
function f_lueduo_result:showActionIsFinish()
	return self.m_show_action_is_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] onEnter
-------------------------------------------------------------------------------
function f_lueduo_result:onEnter()
	if self.m_isWin then
		local winAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		winAnim:setSize(cc.size(200,200))
		self.m_componentTable["bottom_panel"]:appendComponent(winAnim)
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
  	 	self.m_componentTable["bottom_panel"]:setPositionInContainer(cc.p(480,-300))
		local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
		local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
		self.m_componentTable["bottom_panel"]:runAction(actions)
	else
		local playAnim = function()
			local loseAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			loseAnim:setSize(200,200)
			self.m_componentTable["bottom_panel"]:appendComponent(loseAnim)
			loseAnim:setPositionInContainer(cc.p(352,81))
			loseAnim:setLoop(false)
			loseAnim:setAnimationSpeedScale(0.7)
			loseAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[7])
		end
		
		self.m_componentTable["bottom_panel"]:setPositionInContainer(cc.p(502,-300))
		local moveTo = cc.MoveBy:create(0.3,cc.p(0,-600))
		
		local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
		self.m_componentTable["bottom_panel"]:runAction(actions)
		
		local actions = g_game.g_transition.sequence({cc.EaseBounceOut:create(moveTo),cc.CallFunc:create(playAnim)})
		self.m_componentTable["bottom_panel"]:runAction(actions)
	end

	local backToLueduo = function()
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE, g_game.F_BACK_TOUI_LUEDUO)
		self.m_bm:refreshPvpReward()
	end
	
	local backToBingFa = function()
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE, g_game.F_BACK_TOUI_BINGFA)
		self.m_bm:refreshPvpReward()
	end
	
	local again = function()
		if g_game.g_userInfoManager.m_user_info["military"] < 100 then
			g_game.g_utilManager:showMsg("军令不足")
			return
		end
		g_game.g_userInfoManager:requestPvpLueduo(nil)
	end
	
	if self.m_isWin then
		if #self.m_rewards == 0 then
			self.m_componentTable["shengli_panel"]:setVisible(false)
			self.m_componentTable["shengli_noitem_panel"]:setVisible(true)
			self.m_componentTable["againBtn"]:setVisible(true)
			self.m_componentTable["okBtn"]:setVisible(true)
			self.m_componentTable["midOkBtn"]:setVisible(false)
			self.m_componentTable["againBtn"]:addHandleOfcomponentEvent(again,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
   			self.m_componentTable["okBtn"]:addHandleOfcomponentEvent(backToLueduo,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
		else
			self.m_componentTable["shengli_panel"]:setVisible(true)
			self.m_componentTable["shengli_noitem_panel"]:setVisible(false)
			self.m_componentTable["againBtn"]:setVisible(false)
			self.m_componentTable["okBtn"]:setVisible(false)
			self.m_componentTable["midOkBtn"]:setVisible(true)
			self.m_componentTable["midOkBtn"]:addHandleOfcomponentEvent(backToBingFa,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			
			self.m_componentTable["image"]:setImage(g_game.g_dictConfigManager:getPieceImage(self.m_rewards[1]["chipId"]))
			self.m_componentTable["image"]:setSize(cc.size(90, 90))
		end
		self.m_componentTable["shibai_panel"]:setVisible(false)
		for i = 1, #self.m_shaderCom do
			self.m_componentTable[self.m_shaderCom[i]]:setImageType(0)
		end
	else
		self.m_componentTable["shengli_panel"]:setVisible(false)
		self.m_componentTable["shengli_noitem_panel"]:setVisible(false)
		self.m_componentTable["shibai_panel"]:setVisible(true)
		
		self.m_componentTable["againBtn"]:setVisible(true)
		self.m_componentTable["okBtn"]:setVisible(true)
		self.m_componentTable["midOkBtn"]:setVisible(false)
		
		self.m_componentTable["againBtn"]:addHandleOfcomponentEvent(again,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
   		self.m_componentTable["okBtn"]:addHandleOfcomponentEvent(backToLueduo,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
   		
   		for i = 1, #self.m_shaderCom do
			self.m_componentTable[self.m_shaderCom[i]]:setImageType(2)
		end
	end
	local data = self.m_bm:getBattleData()
	self.m_componentTable["qgyd_shengli_yuanbao_num_label"]:setString("+" .. data["roundData"]["silverAddition"])
	self.m_componentTable["qgyd_shengli_yuanbao_num_label"]:setColor(cc.c3b(255,255,255))
	self.m_componentTable["qgyd_shengli_exp_num_label"]:setString("+" .. data["roundData"]["expAddition"])
	self.m_componentTable["qgyd_shengli_exp_num_label"]:setColor(cc.c3b(255,255,255))
	
	self.m_expAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_expAnim:setup(self.m_componentTable["qgyd_shengli_exp_num_label"], 21, "+%d", false, false)
	self.m_componentTable["lueduo_result"]:appendComponent(self.m_expAnim)
	local p = self.m_componentTable["qgyd_shengli_exp_num_label"]:getPositionInContainer()
	self.m_expAnim:setPositionInContainer(p)
	self.m_expAnim:play(0, self.m_bm.m_battle_data["roundData"]["expAddition"], 1)
	
	self.m_coinAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_coinAnim:setup(self.m_componentTable["qgyd_shengli_yuanbao_num_label"], 21, "+%d", false, false)
	self.m_componentTable["lueduo_result"]:appendComponent(self.m_coinAnim)
	local p = self.m_componentTable["qgyd_shengli_yuanbao_num_label"]:getPositionInContainer()
	self.m_coinAnim:setPositionInContainer(p)
	self.m_coinAnim:play(0, self.m_bm.m_battle_data["roundData"]["silverAddition"], 1)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] onExit
-------------------------------------------------------------------------------
function f_lueduo_result:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_lueduo_result:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] onExitTransitionStart
-------------------------------------------------------------------------------
function f_lueduo_result:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_result] onCleanup
-------------------------------------------------------------------------------
function f_lueduo_result:onCleanup()
end
