require ("scripts.manager.fluapanelmanager")

local f_login_scene = class("f_login_scene", function()
    return g_game.g_classFactory.newFLuaScene("f_login_scene")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_login_scene:ctor()  
  	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_login_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_login_scene] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_login_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] onEnter
-------------------------------------------------------------------------------
function f_login_scene:onEnter()	
	 g_game.g_game_is_init = false

	 g_game.g_netManager:exit()
	 
	  --发送播放主场景音乐事件
	 send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_LOGIN)

	 g_game.g_panelManager:resetAllPanelConfig()

	 self:config_layer()
	 g_game.g_panelManager:createPanelContainer()
	 g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("login_ui"))

	  --背景动画 panel
  	 self.newbottomPanel = require("scripts.game.login.f_new_login_bottom_panel").new()
 	 self.newbottomPanel:layout_in_parent()  
	  
	 g_game.g_dataManager:initServerCache()
	 g_game.g_dataManager:initLoginTypeFile()
	  
	 g_game.g_guidelinesManager:initComponent()
	 g_game.g_secondGuidelinesManager:initComponent()
	 g_game.g_recoverManager:startTimer(false)
	  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] onExit
-------------------------------------------------------------------------------
function f_login_scene:onExit()  
    self:unregisterNodeEvent()	
      
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_login_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_login_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] onCleanup
-------------------------------------------------------------------------------
function f_login_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] registerServerMessage
-------------------------------------------------------------------------------
function f_login_scene:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_login_scene] unregisterServerMessage
-------------------------------------------------------------------------------
function f_login_scene:unregisterServerMessage()
end


return f_login_scene
