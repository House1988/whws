
local f_pre_lua_autoscale_panel = class("f_pre_lua_autoscale_panel", function()
    return fc.FContainerPanel:create()
end)

--类变量定义
f_pre_lua_autoscale_panel.LEFT_TOP      			= 1
f_pre_lua_autoscale_panel.MIDDLE_TOP    			= 2
f_pre_lua_autoscale_panel.RIGHT_TOP     			= 3
f_pre_lua_autoscale_panel.LEFT_MIDDLE   			= 4
f_pre_lua_autoscale_panel.RIGHT_MIDDLE  			= 5
f_pre_lua_autoscale_panel.LEFT_DOWN     			= 6
f_pre_lua_autoscale_panel.MIDDLE_DOWN   			= 7
f_pre_lua_autoscale_panel.RIGHT_DOWN    			= 8
f_pre_lua_autoscale_panel.MIDDLE_MIDDLE 			= 9
f_pre_lua_autoscale_panel.MIDDLE_MIDDLE_ALLSCALE 	= 10
f_pre_lua_autoscale_panel.POS_END      			= 11

--类变量定义结束

function f_pre_lua_autoscale_panel:ctor()     
    self:registerNodeEvent()    
    
    
    self.m_anchPos                    = {}
    self.m_anchPos[self.LEFT_TOP]     = {0, 1}
    self.m_anchPos[self.MIDDLE_TOP]   = {0.5, 1}
    self.m_anchPos[self.RIGHT_TOP]    = {1, 1}
    self.m_anchPos[self.LEFT_MIDDLE]  = {0, 0.5}
    self.m_anchPos[self.RIGHT_MIDDLE] = {1, 0.5}
    self.m_anchPos[self.LEFT_DOWN]    = {0, 0}
    self.m_anchPos[self.MIDDLE_DOWN]  = {0.5, 0}
    self.m_anchPos[self.RIGHT_DOWN]   = {1, 0}
    self.m_anchPos[self.MIDDLE_MIDDLE]= {0.5, 0.5}
    self.m_anchPos[self.MIDDLE_MIDDLE_ALLSCALE]= {0.5, 0.5}


    self.m_position                    = {}
    self.m_position[self.LEFT_TOP]     = {0*g_resource.g_display.sizeInPixels.width, 1*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.MIDDLE_TOP]   = {0.5*g_resource.g_display.sizeInPixels.width, 1*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.RIGHT_TOP]    = {1*g_resource.g_display.sizeInPixels.width, 1*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.LEFT_MIDDLE]  = {0*g_resource.g_display.sizeInPixels.width, 0.5*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.RIGHT_MIDDLE] = {1*g_resource.g_display.sizeInPixels.width, 0.5*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.LEFT_DOWN]    = {0*g_resource.g_display.sizeInPixels.width, 0*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.MIDDLE_DOWN]  = {0.5*g_resource.g_display.sizeInPixels.width, 0*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.RIGHT_DOWN]   = {1*g_resource.g_display.sizeInPixels.width, 0*g_resource.g_display.sizeInPixels.height}
    self.m_position[self.MIDDLE_MIDDLE]= {0.5*g_resource.g_display.sizeInPixels.width, 0.5*g_resource.g_display.sizeInPixels.height}
 	self.m_position[self.MIDDLE_MIDDLE_ALLSCALE]= {0.5*g_resource.g_display.sizeInPixels.width, 0.5*g_resource.g_display.sizeInPixels.height}


    self.m_size    = {0, 0}

    self.m_current_pos = self.LEFT_TOP
        
end



--设置将要绑定的面板的宽度 和高度
function f_pre_lua_autoscale_panel:bindSize(w, h)
    self.m_size[1]  = w
    self.m_size[2]  = h	
    
end

--设置将要绑定的面板属于的游戏区域 
function f_pre_lua_autoscale_panel:bindPos(currentPos)
    if currentPos >= f_pre_lua_autoscale_panel.LEFT_TOP and currentPos < f_pre_lua_autoscale_panel.POS_END then
        self.m_current_pos  = currentPos
    else
        echoError("f_pre_lua_autoscale_panel bindPos函数设置非法值")
    end
end

--c++组件中的onenter回调
function f_pre_lua_autoscale_panel:onEnter()   
	self:setSize(cc.size(self.m_size[1], self.m_size[2]))
    self:setAnchorPoint(cc.p(self.m_anchPos[self.m_current_pos][1],self.m_anchPos[self.m_current_pos][2]))
    self:setPosition(cc.p(self.m_position[self.m_current_pos][1], self.m_position[self.m_current_pos][2]))
    self:setTouchEnabled(false)
    
    if self.m_current_pos == self.MIDDLE_MIDDLE_ALLSCALE then    
    	
	    local w = g_resource.g_display.sizeInPixels.width
	    local h = g_resource.g_display.sizeInPixels.height
	    local scaleX = w / CONFIG_SCREEN_WIDTH
	    local scaleY = h / CONFIG_SCREEN_HEIGHT
	    --[[
	    if scaleX < 1.0 then
	    	scaleX = CONFIG_SCREEN_WIDTH / w
	    end
	    
	    if scaleY < 1.0 then
	    	scaleY = CONFIG_SCREEN_HEIGHT / h
	    end
	    ]]--
	    self:setScaleX(scaleX)
	    self:setScaleY(scaleY)
    else
	    local w = g_resource.g_display.sizeInPixels.width
	    local h = g_resource.g_display.sizeInPixels.height
	    local scale = h / CONFIG_SCREEN_HEIGHT	  	

	    if CONFIG_SCREEN_WIDTH * scale > g_resource.g_display.sizeInPixels.width then
	    	scale = w / CONFIG_SCREEN_WIDTH	 	    
	    end
	  	
	    self:setScale(scale)
    end
end


function f_pre_lua_autoscale_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_pre_lua_autoscale_panel:onEnterTransitionFinish()
end

function f_pre_lua_autoscale_panel:onExitTransitionStart()
end

function f_pre_lua_autoscale_panel:onCleanup()
end


function f_pre_lua_autoscale_panel:registerNodeEvent(handler)
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

function f_pre_lua_autoscale_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_pre_lua_autoscale_panel