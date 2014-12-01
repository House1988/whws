require("scripts.auto.auto_exchange_reward")
--[[--
  兑换码弹出
--]]--
f_game_exchange_reward = class("f_game_exchange_reward")
f_game_exchange_reward.__index = f_game_exchange_reward

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_exchange_reward.static_create()
							 
	local skillInfoTable = createexchange_reward()
	local skillInfo = skillInfoTable["exchange_reward"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_game_exchange_reward)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_exchange_reward:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.exchange_code = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_exchange_reward:registerNodeEvent(handler)
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
-- @function [parent=#f_game_exchange_reward] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_exchange_reward:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] onEnter
-------------------------------------------------------------------------------
function f_game_exchange_reward:onEnter()
    local lantern_effect_left = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(lantern_effect_left)
	lantern_effect_left:setAnchorPoint(cc.p(0.5,0.5))
	lantern_effect_left:setLoop(true)
	lantern_effect_left:setAnimationScale(0.4)
	lantern_effect_left:setScale(2.54)
	lantern_effect_left:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[2])
	lantern_effect_left:setPositionInContainer(cc.p(486, 436))
	self:initAllComponent()
	
    g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] onExit
-------------------------------------------------------------------------------
function f_game_exchange_reward:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_EXCHANGE_REWARD, self.event_updateGetReward)
    g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_exchange_reward:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_exchange_reward:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] onCleanup
-------------------------------------------------------------------------------
function f_game_exchange_reward:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_exchange_reward:initAllComponent()
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["label_1"]:setString("請輸入有效的兌換碼：")
    else
		self.m_componentTable["label_1"]:setString("请输入有效的兑换码：")
    end
    
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("exchange_reward")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["exchange_close"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    self.m_componentTable["exchange_close2"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local exchangeReward = function()
    	self:requestExchangeReward()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["exchange_exchange_button"]:addHandleOfcomponentEvent(exchangeReward, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
   
   	self.m_inputText = ""
   	
    self.event_updateGetReward = function()
    	g_game.g_panelManager:removeUiPanel("exchange_reward")
    	self:updateExchangeReward()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_EXCHANGE_REWARD, self.event_updateGetReward)
 
 	self.m_componentTable["exchange_num_input"]:setPositionInContainer(cc.p(302,174))
 	self.m_componentTable["exchange_num_input"]:setReturnType(1)
end

function f_game_exchange_reward:resetInputPosition()
	 self.m_componentTable["exchange_num_input"]:setPositionInContainer(cc.p(302,174))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] update
-------------------------------------------------------------------------------
function  f_game_exchange_reward:update()
	if device.platform == "android" and self.m_componentTable["exchange_num_input"]:getText() ~= self.m_inputText then
		self.m_inputText = self.m_componentTable["exchange_num_input"]:getText()
		self.m_componentTable["exchange_num_input"]:setText(self.m_inputText)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] updateExchangeReward
-------------------------------------------------------------------------------
function f_game_exchange_reward:updateExchangeReward()
	require("scripts.game.main.layout.f_game_exchange_rewardList")
	local rewardPop = f_game_exchange_rewardList.static_create()
	rewardPop:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(rewardPop, "mail_attachment")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_reward] requestExchangeReward
-------------------------------------------------------------------------------
function f_game_exchange_reward:requestExchangeReward()
	self.exchange_code = self.m_componentTable["exchange_num_input"]:getText()
	g_game.g_userInfoManager:requestExchangeReward(self.exchange_code)
end

