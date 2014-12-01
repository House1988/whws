--[[
	继承自panel, 添加一个颜色蒙板,用于遮挡
]]--

local f_lua_color_layer = class("f_lua_color_layer", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_lua_color_layer")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_color_layer] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_lua_color_layer:ctor()    
    self:registerNodeEvent()   
    
  	self.m_real_size = cc.size(g_game.g_real_size.width * 5.0, g_game.g_real_size.height * 0.5)

	self:setSize(self.m_real_size)

    self.m_layer_color		= cc.LayerColor:create(cc.c4b(0, 0, 0, 96))
    self:addChild(self.m_layer_color)
    self.m_layer_color:setContentSize(self.m_real_size)
	self.m_layer_color:setPosition(cc.p(0, 0))
	
  
    self:setScale(5.0)--手动强制设置蒙板背景很大
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_color_layer] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_lua_color_layer:onEnter() 
    self:setStopTouchEvent(false)
end


function f_lua_color_layer:onExit()    
    self:unregisterNodeEvent()
end

function f_lua_color_layer:onEnterTransitionFinish()
end

function f_lua_color_layer:onExitTransitionStart()
end

function f_lua_color_layer:onCleanup()
end


function f_lua_color_layer:registerNodeEvent(handler)
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
-- @function [parent=#f_lua_color_layer] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lua_color_layer:unregisterNodeEvent()
    self:unregisterScriptHandler()
end



return f_lua_color_layer