
local f_resource_scene = class("f_resource_scene", function()
    return cc.Scene:create()
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_resource_scene:ctor()  
  	self:registerNodeEvent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_resource_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_resource_scene] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_resource_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] onEnter
-------------------------------------------------------------------------------
function f_resource_scene:onEnter()	
	self:config_layer()
	
	self.m_bg_layer = require("prescripts.f_resource_scene_bg_layer").new()	
	
	
	g_resource.g_resource_update_manager:start()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] onExit
-------------------------------------------------------------------------------
function f_resource_scene:onExit()  
    self:unregisterNodeEvent()	
    
 end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_resource_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_resource_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] onCleanup
-------------------------------------------------------------------------------
function f_resource_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] registerServerMessage
-------------------------------------------------------------------------------
function f_resource_scene:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene] unregisterServerMessage
-------------------------------------------------------------------------------
function f_resource_scene:unregisterServerMessage()
end



function f_resource_scene:config_layer()  
    self.preload_layers = {}
    for i=1,6 do
      self.preload_layers[i] = cc.Layer:create()
      self:addChild(self.preload_layers[i])
  	end
end

function f_resource_scene:add_panel_to_layer(panel, layer_config)
    if layer_config ~= nil then
        if self.preload_layers ~= nil then
            self.preload_layers[layer_config]:addChild(panel)
        end
    end
end

function f_resource_scene:get_layer_from_config(tag)
    return self.preload_layers[tag]
end

return f_resource_scene