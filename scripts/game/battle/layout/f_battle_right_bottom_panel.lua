--[[--
    战斗界面右下面板扩展类
--]]--
f_battle_right_bottom_panel = class("f_battle_right_bottom_panel")
f_battle_right_bottom_panel.__index = f_battle_right_bottom_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel.static_create()
	local leftTopPanelTable = g_game.g_panelManager:create_panel("zhandoujiemian_right_bottom")
	local leftTopPanel = leftTopPanelTable["zhandoujiemian_right_bottom"]
	
	local funTable = {}
	tolua.setpeer(leftTopPanel, funTable)
	setmetatable(funTable, f_battle_right_bottom_panel)
	
	leftTopPanel.m_componentTable = leftTopPanelTable
	   
	return leftTopPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.RIGHT_DOWN)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(1, 0))   
  	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
 
  	self:initAllComponent()--初始化各个组件
  	
  	self.m_skip_callback = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_right_bottom_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] onEnter
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:onEnter()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] onExit
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:onExit()  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] onCleanup
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] setSkipBattleCallback
-- 设置跳过战斗回调
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:setSkipBattleCallback(skip)
	self.m_skip_callback = skip
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:initAllComponent()
	local skipBattle = self.m_componentTable["zhandou_right_bottom_skip_button"]
	local battleManager = g_game.g_utilManager:getCurrentBattleManager()
	if battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
		local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
		if vipInfo["level"] < 4 then
			self:disableSkipButton()
		end
	end
	
	--注册按钮回调函数
--	local skipCallback = function()
--		self.m_skip_callback()
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--	end	
--	skipBattle:addHandleOfcomponentEvent(skipCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
--	
--	skipBattle:setButtonState(8)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] enableSkipButton
-- 开启跳过按钮
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:enableSkipButton()
	local skipBattle = self.m_componentTable["zhandou_right_bottom_skip_button"]
	
	local skipCallback = function()
		self.m_skip_callback()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	skipBattle:setButtonState(2)
	
	local cantSkip = function()
		local strT = g_game.g_dictConfigManager:getLanTextById(280)
		g_game.g_utilManager:showMsg(strT)
	end
	
	
	local battleManager = g_game.g_utilManager:getCurrentBattleManager()
	if battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
		local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
		if vipInfo["level"] < 8 then
			self:disableSkipButton()
		else
			skipBattle:addHandleOfcomponentEvent(skipCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		end
	else
		if g_game.g_userInfoManager:canSkipBattle() then
			skipBattle:addHandleOfcomponentEvent(skipCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		else
			skipBattle:addHandleOfcomponentEvent(cantSkip, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		end
	end
	
end
-------------------------------------------------------------------------------
-- @function [parent=#f_battle_right_bottom_panel] disableSkipButton
-- 禁用跳过按钮
-------------------------------------------------------------------------------
function f_battle_right_bottom_panel:disableSkipButton()
	local skipBattle = self.m_componentTable["zhandou_right_bottom_skip_button"]

	skipBattle:setButtonState(8)
end

