--[[
	登录底板
]]--
require ("scripts.game.login.f_new_login_panel")

local f_new_login_bottom_panel = class("f_new_login_bottom_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_new_login_bottom_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:ctor()    
    self:registerNodeEvent()   
    self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
  	self.m_componentTable = {}
  	
  	self.animScenePalace = nil
  	self.animCloud = nil
  	self.animSunlight = nil
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] layout_in_parent
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE_ALLSCALE)

	self:registerNodeEvent()--注册特殊回调函数     
	
  	self.m_autoPanel:appendComponent(self)
  	self.m_componentTable["panel_layer_config"] = 1
	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel,self.m_componentTable["panel_layer_config"])


	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:onEnter()  
	
	self:setStopTouchEvent(true)
	
	self.animScenePalace = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.animScenePalace)
	self.animScenePalace:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH,0))
	
	self.animCloud = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.animCloud)
	self.animCloud:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH,0))
	
	self.animSunlight = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.animSunlight)
	self.animSunlight:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH,0))
	
	local playCloud = function()
		self.animCloud:setLoop(true)
		self.animCloud:runAnimation(g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[2], g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[4])
		
		local gameLogo = fc.FExtensionsImage:create()
	    gameLogo:setImage("nobatch/update_logo.png")
	    gameLogo:setSize(cc.size(348,173))
	    gameLogo:setAnchorPoint(cc.p(0.5,0))
	    self:appendComponent(gameLogo)
	    gameLogo:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH-15,0))
	    gameLogo:setScale(0.1)
	    gameLogo:setVisible(false)
	    
		local initSdk = function()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_INIT)
	   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN)
		end
		
		local showTitle = function()
			gameLogo:setVisible(true)
			local scaleTo = cc.ScaleTo:create(1, 1.3, 1.3)
			gameLogo:runAction(cc.EaseElasticOut:create(scaleTo))
		end
		
		local hideTouch = function()
			self.m_newlogin_panel:hideTouchComponent()
		end
		
		self.m_newlogin_panel = f_new_login_panel.static_create()
	    self.m_newlogin_panel:layout_in_parent()
	    self.m_newlogin_panel:setOpacity(0)
	    
		local fadeIn = cc.FadeIn:create(0.5)
		local action = g_game.g_transition.sequence({fadeIn,cc.CallFunc:create(showTitle),
				cc.DelayTime:create(0.8),cc.CallFunc:create(initSdk), cc.CallFunc:create(hideTouch)})
		self.m_newlogin_panel:runAction(action)
	end
	self.animScenePalace:setLoop(false)
	self.animScenePalace:setAnimationSpeedScale(0.3)
	self.animScenePalace:runAnimation(g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[2], g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[3])
	self.animScenePalace:registeAnimationFinishCallback(playCloud)
	
	self.animSunlight:setLoop(false)
	self.animSunlight:setAnimationSpeedScale(0.3)
	self.animSunlight:runAnimation(g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[2], g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[5])
	
	self:initAllComponent()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] onExit
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:onExit()    
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] onCleanup
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_new_login_bottom_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_bottom_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_new_login_bottom_panel:initAllComponent()	

end

return f_new_login_bottom_panel