--[[--
    主界面右上角面板扩展类
--]]--
f_game_right_top_panel = class("f_game_right_top_panel")
f_game_right_top_panel.__index = f_game_right_top_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_right_top_panel.static_create()
	local leftTopPanelTable = g_game.g_panelManager:create_panel("main_ui_top_right")
	local leftTopPanel = leftTopPanelTable["main_ui_top_right"]
	
	local funTable = {}
	tolua.setpeer(leftTopPanel, funTable)
	setmetatable(funTable, f_game_right_top_panel)
	
	leftTopPanel.m_componentTable = leftTopPanelTable
	   
	return leftTopPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_game_right_top_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.RIGHT_TOP)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])
  	
  	self.m_getReward = function()
  		self:getRewardList()
  	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_OPEN_REWARD, self.m_getReward)

	self.m_updateRewardFlag = function()
		self:updateRewardFlag()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_HUODONG_FLAG, self.m_updateRewardFlag)

	self:setAnchorPoint(cc.p(1, 1))   
  	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH, 0))
 
  	self:initAllComponent()--初始化各个组件
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_right_top_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_right_top_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_right_top_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] onEnter
-------------------------------------------------------------------------------
function f_game_right_top_panel:onEnter()
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] onExit
-------------------------------------------------------------------------------
function f_game_right_top_panel:onExit()  
  	self:unregisterNodeEvent()
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_HUODONG_FLAG, self.m_updateRewardFlag)
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_OPEN_REWARD, self.m_getReward)
	g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_right_top_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_right_top_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_right_top_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] update
-------------------------------------------------------------------------------
function f_game_right_top_panel:update(dt)
--	if self.m_countDownTime > 0.5 then
--		self.m_countDownTime = self.m_countDownTime - 0.5
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
--	end
--	self.m_countDownTime = self.m_countDownTime + dt
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_right_top_panel:initAllComponent()
	self.m_countDownTime = 0
	
	local huodongCallBack = function()
		if g_game.g_guidelinesManager:canBtnClick("huodong") then		
			g_game.g_panelManager:removeUiPanel("main_popup")
			g_game.g_userInfoManager.m_shouldOpenHuodong = true
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			
			g_game.g_userInfoManager:requestHuodongList()
			
		end
	end
	self.m_componentTable["button_huodong"]:addHandleOfcomponentEvent(huodongCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
	self.m_componentTable["button_huodong"]:appendComponent(animation)
	animation:setAnchorPoint(cc.p(0.5,0.5))
	animation:setPositionInContainer(cc.p(45,44))	
	animation:setLoop(true)	
    animation:runAnimation(g_game.g_f_main_ui_effect.UI_CARD[2], g_game.g_f_main_ui_effect.UI_CARD[6])
    
    self.m_huodongAnim1  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_huodong"]:appendComponent(self.m_huodongAnim1)
	self.m_huodongAnim1:setAnchorPoint(cc.p(0.5,0))
	self.m_huodongAnim1:setLoop(true)
	self.m_huodongAnim1:runAnimation(g_game.g_f_main_ui_effect.UI_CARD[2], g_game.g_f_main_ui_effect.UI_CARD[7])
	self.m_huodongAnim1:setPositionInContainer(cc.p(45,44))
	self.m_huodongAnim1:setVisible(false)
	
	self.m_huodongAnim2  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_huodong"]:appendComponent(self.m_huodongAnim2)
	self.m_huodongAnim2:setAnchorPoint(cc.p(0.5,0))
	self.m_huodongAnim2:setLoop(true)
	self.m_huodongAnim2:runAnimation(g_game.g_f_main_ui_effect.UI_CARD[2], g_game.g_f_main_ui_effect.UI_CARD[8])
	self.m_huodongAnim2:setPositionInContainer(cc.p(45,44))
	self.m_huodongAnim2:setVisible(false)
	
	local huodong = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
	self.m_componentTable["button_huodong"]:appendComponent(huodong)
	huodong:setAnchorPoint(cc.p(0.5,0.5))
	huodong:setPositionInContainer(cc.p(45,44))	
    huodong:runAnimation(g_game.g_f_main_ui_effect.UI_CARD[2], g_game.g_f_main_ui_effect.UI_CARD[9])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] updateRewardFlag
-- 更新活动标志位   五谷丰登领取标志位
-------------------------------------------------------------------------------
function f_game_right_top_panel:updateRewardFlag()
	self.m_huodongAnim1:setVisible(g_game.g_userInfoManager.m_hasHuodongFlag)
	self.m_huodongAnim2:setVisible(g_game.g_userInfoManager.m_hasHuodongFlag)
end


function f_game_right_top_panel:getRewardList()
	g_game.g_userInfoManager.m_isNeedPopRank = false
	require("scripts.game.main.reward.f_reward_panel")
	local reward = f_reward_panel.static_create()
	reward:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(reward, "reward_panel")
end