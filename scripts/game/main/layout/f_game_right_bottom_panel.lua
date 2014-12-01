require("scripts.game.main.shangcheng.f_shangcheng_main")

--[[--
    主界面右下面板扩展类
--]]--
f_game_right_bottom_panel = class("f_game_right_bottom_panel")
f_game_right_bottom_panel.__index = f_game_right_bottom_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_right_bottom_panel.static_create()
	local leftTopPanelTable = g_game.g_panelManager:create_panel("main_ui_right_bottom")
	local leftTopPanel = leftTopPanelTable["main_ui_right_bottom"]
	
	local funTable = {}
	tolua.setpeer(leftTopPanel, funTable)
	setmetatable(funTable, f_game_right_bottom_panel)
	
	leftTopPanel.m_componentTable = leftTopPanelTable
	   
	return leftTopPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.RIGHT_DOWN)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(1, 0))   
  	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
 
  	self:initAllComponent()--初始化各个组件
  	
  	self:setVisible(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_right_bottom_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] onEnter
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:onEnter()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] onExit
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:onExit()  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:initAllComponent()
	--商城按钮注册事件
	local shangchengCallback = function()
		if g_game.g_guidelinesManager:canBtnClick("shangchen") then
			self:popUpShangcheng()
			g_game.g_panelManager:removeUiPanel("main_popup")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["button_shangcheng"]:addHandleOfcomponentEvent(shangchengCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	--菜单
	local notOpenCallBack = function()
		if g_game.g_panelManager:isUiPanelShow("main_popup") then
			g_game.g_panelManager:removeUiPanel("main_popup")
		else
			require("scripts.game.main.layout.f_game_main_popup")
			local panel = f_game_main_popup.static_create()
			panel:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(panel, "main_popup")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["button_caidan"]:addHandleOfcomponentEvent(notOpenCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_bottom_panel] popUpShangcheng
-- 弹出商城
-------------------------------------------------------------------------------
function f_game_right_bottom_panel:popUpShangcheng()    
	g_game.g_utilManager:enterShop(3)
end
