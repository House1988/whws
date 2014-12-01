
local FLuaAutoScalePanel = class("FLuaAutoScalePanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaAutoScalePanel")
end)

--类变量定义
FLuaAutoScalePanel.LEFT_TOP      			= 1
FLuaAutoScalePanel.MIDDLE_TOP    			= 2
FLuaAutoScalePanel.RIGHT_TOP     			= 3
FLuaAutoScalePanel.LEFT_MIDDLE   			= 4
FLuaAutoScalePanel.RIGHT_MIDDLE  			= 5
FLuaAutoScalePanel.LEFT_DOWN     			= 6
FLuaAutoScalePanel.MIDDLE_DOWN   			= 7
FLuaAutoScalePanel.RIGHT_DOWN    			= 8
FLuaAutoScalePanel.MIDDLE_MIDDLE 			= 9
FLuaAutoScalePanel.MIDDLE_MIDDLE_ALLSCALE 	= 10
FLuaAutoScalePanel.POS_END      			= 11

--类变量定义结束

function FLuaAutoScalePanel:ctor()     
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
    self.m_position[self.LEFT_TOP]     = {0*g_game.g_display.sizeInPixels.width, 1*g_game.g_display.sizeInPixels.height}
    self.m_position[self.MIDDLE_TOP]   = {0.5*g_game.g_display.sizeInPixels.width, 1*g_game.g_display.sizeInPixels.height}
    self.m_position[self.RIGHT_TOP]    = {1*g_game.g_display.sizeInPixels.width, 1*g_game.g_display.sizeInPixels.height}
    self.m_position[self.LEFT_MIDDLE]  = {0*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height}
    self.m_position[self.RIGHT_MIDDLE] = {1*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height}
    self.m_position[self.LEFT_DOWN]    = {0*g_game.g_display.sizeInPixels.width, 0*g_game.g_display.sizeInPixels.height}
    self.m_position[self.MIDDLE_DOWN]  = {0.5*g_game.g_display.sizeInPixels.width, 0*g_game.g_display.sizeInPixels.height}
    self.m_position[self.RIGHT_DOWN]   = {1*g_game.g_display.sizeInPixels.width, 0*g_game.g_display.sizeInPixels.height}
    self.m_position[self.MIDDLE_MIDDLE]= {0.5*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height}
 	self.m_position[self.MIDDLE_MIDDLE_ALLSCALE]= {0.5*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height}


    self.m_size    = {0, 0}

    self.m_current_pos = self.LEFT_TOP
        
end



--设置将要绑定的面板的宽度 和高度
function FLuaAutoScalePanel:bindSize(w, h)
    self.m_size[1]  = w
    self.m_size[2]  = h	
end

--设置将要绑定的面板属于的游戏区域 
function FLuaAutoScalePanel:bindPos(currentPos)
    if currentPos >= FLuaAutoScalePanel.LEFT_TOP and currentPos < FLuaAutoScalePanel.POS_END then
        self.m_current_pos  = currentPos
    else
        echoError("FLuaAutoScalePanel bindPos函数设置非法值")
    end
end

--c++组件中的onenter回调
function FLuaAutoScalePanel:onEnter()   
	self:setSize(cc.size(self.m_size[1], self.m_size[2]))
    self:setAnchorPoint(cc.p(self.m_anchPos[self.m_current_pos][1],self.m_anchPos[self.m_current_pos][2]))
    self:setPosition(cc.p(self.m_position[self.m_current_pos][1], self.m_position[self.m_current_pos][2]))
    self:setTouchEnabled(false)
    
    if self.m_current_pos == self.MIDDLE_MIDDLE_ALLSCALE then    
    	
	    local w = g_game.g_display.sizeInPixels.width
	    local h = g_game.g_display.sizeInPixels.height
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
	    local w = g_game.g_display.sizeInPixels.width
	    local h = g_game.g_display.sizeInPixels.height
	    local scale = h / CONFIG_SCREEN_HEIGHT	  	

	    if CONFIG_SCREEN_WIDTH * scale > g_game.g_display.sizeInPixels.width then
	    	scale = w / CONFIG_SCREEN_WIDTH	 	    
	    end
	  	
	    self:setScale(scale)
    end
end


function FLuaAutoScalePanel:onExit()    
    self:unregisterNodeEvent()
end

function FLuaAutoScalePanel:onEnterTransitionFinish()
end

function FLuaAutoScalePanel:onExitTransitionStart()
end

function FLuaAutoScalePanel:onCleanup()
end


function FLuaAutoScalePanel:registerNodeEvent(handler)
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

function FLuaAutoScalePanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return FLuaAutoScalePanel