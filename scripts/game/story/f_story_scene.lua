require ("scripts.manager.fluapanelmanager")

local f_story_scene = class("f_story_scene", function()
    return g_game.g_classFactory.newFLuaScene("f_story_scene")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_story_scene:ctor()  
  	self:registerNodeEvent()
  
  	self.m_storyLogicManager = nil
  	self.bottomPanel = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_story_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_story_scene] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_story_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] onEnter
-------------------------------------------------------------------------------
function f_story_scene:onEnter()	
	g_game.g_game_is_init = true
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_LOGIN)
	g_game.g_panelManager:resetAllPanelConfig()
	self:config_layer()
	g_game.g_panelManager:createPanelContainer()
	  
	self.bottomPanel = require("scripts.game.story.f_base_bottom_panel").new()
	self.bottomPanel:layout_in_parent()  
	  
	self.m_storyLogicManager = require("scripts.game.story.f_story_logic_manager").new()
	self.m_storyLogicManager:setBasePanel(self.bottomPanel)
	g_game.g_gameManager:addUpdateObj(self.m_storyLogicManager)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] getStoryManager
-------------------------------------------------------------------------------
function f_story_scene:getStoryManager()
	return self.m_storyLogicManager
end


-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] onExit
-------------------------------------------------------------------------------
function f_story_scene:onExit()    
    self:unregisterNodeEvent()
    
    g_game.g_gameManager:removeUpdateObj(self.m_storyLogicManager) 
    self.m_storyLogicManager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_story_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_story_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] onCleanup
-------------------------------------------------------------------------------
function f_story_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] registerServerMessage
-------------------------------------------------------------------------------
function f_story_scene:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_scene] unregisterServerMessage
-------------------------------------------------------------------------------
function f_story_scene:unregisterServerMessage()
end


return f_story_scene
