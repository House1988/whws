--[[
	战斗场景地图
]]--
local f_battle_map = class("f_battle_map", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_battle_map")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_battle_map:ctor()  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_battle_map:layout_in_parent()

  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)
	self:registerNodeEvent()--注册特殊回调函数     
	
  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 2)
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_battle_map:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_map] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_battle_map:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] onEnter
-------------------------------------------------------------------------------
function f_battle_map:onEnter()
	  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] onExit
-------------------------------------------------------------------------------
function f_battle_map:onExit()        
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_map:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_map:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] onCleanup
-------------------------------------------------------------------------------
function f_battle_map:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] registerServerMessage
-------------------------------------------------------------------------------
function f_battle_map:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map] unregisterServerMessage
-------------------------------------------------------------------------------
function f_battle_map:unregisterServerMessage()
end


return f_battle_map
