--[[
	继承自stencil panel, 实现蒙板指示功能
]]--

local f_lua_stencil_panel = class("f_lua_stencil_panel", function()
    return g_game.g_classFactory.newFLuaStencilPanel("f_lua_stencil_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_lua_stencil_panel:ctor()    
    self:registerNodeEvent()   
    
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)  
  	
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 5)	

	self.m_panel_size = cc.size(5000, 5000)

	self.m_layer_color_panel		= require("scripts.extend.f_lua_color_layer").new()
    self.m_autoPanel:appendComponent(self.m_layer_color_panel)
    self.m_layer_color_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_layer_color_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self.m_layer_color_panel:setVisible(false)
	  	
  	self.m_autoPanel:appendComponent(self)
  	
	self:setSize(self.m_panel_size)    	
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))	
	
	self.m_maobi_animation_component 	= nil
	self.m_guidelines_component			= nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] getStencilSize
-- 获取蒙板尺寸
-------------------------------------------------------------------------------
function f_lua_stencil_panel:getStencilSize()   
	return self.m_panel_size
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] enableStencil
-- 是否显示蒙板
-------------------------------------------------------------------------------
function f_lua_stencil_panel:enableStencil(isShow) 
	self.m_layer_color_panel:setVisible(isShow)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] enableAllStencil
-- 是否显示蒙板
-------------------------------------------------------------------------------
function f_lua_stencil_panel:enableAllStencil(isShow) 
	self:setVisible(isShow)
	self.m_layer_color_panel:setVisible(isShow)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_lua_stencil_panel:onEnter() 
    self:setStopTouchEvent(true)
end


function f_lua_stencil_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_lua_stencil_panel:onEnterTransitionFinish()
end

function f_lua_stencil_panel:onExitTransitionStart()
end

function f_lua_stencil_panel:onCleanup()
end


function f_lua_stencil_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_lua_stencil_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lua_stencil_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] showIndicateAnimation
-- 显示提示动画在指定位置
-------------------------------------------------------------------------------
function f_lua_stencil_panel:showIndicateAnimation(pos, size)
	if self.m_maobi_animation_component == nil then
		self.m_maobi_animation_component = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
		self:appendComponent(self.m_maobi_animation_component)	
		self.m_maobi_animation_component:setSize(cc.size(300, 300))
		self.m_maobi_animation_component:setVisible(false)
		self.m_maobi_animation_component:setAnchorPoint(cc.p(0.5, 0.5))
		self.m_maobi_animation_component:setPositionInContainer(cc.p(50, 50))	
		self.m_maobi_animation_component:setAnimationPosition(cc.p(150, 150))
		self.m_maobi_animation_component:setLoop(true)	
--		self.m_maobi_animation_component:setAnimationScale(1.5)
		self.m_maobi_animation_component:setAnimationSpeedScale(0.3)
		self.m_maobi_animation_component:runAnimation(g_game.g_f_main_ui_effect.XINSHOU_ZHIYIN_MAOBI[2], g_game.g_f_main_ui_effect.XINSHOU_ZHIYIN_MAOBI[3])
		self.m_maobi_animation_component:animationPause()
		self.m_maobi_animation_component:setComponentZOrder(100)
	end
	self.m_maobi_animation_component:setVisible(true)
	local destPos = self.m_maobi_animation_component:getParent():convertToNodeSpace(pos)
	self.m_maobi_animation_component:setPosition(destPos)--cc.p(destPos.x + size.width/2, destPos.y + size.height/2))
	self.m_maobi_animation_component:animationPlayWithPercent(0.0)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] hideIndicateAnimation
-- 隐藏提示动画
-------------------------------------------------------------------------------
function f_lua_stencil_panel:hideIndicateAnimation()
	if self.m_maobi_animation_component then
		self.m_maobi_animation_component:animationPause()
		self.m_maobi_animation_component:setVisible(false)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] showIndicateComponent
-- 显示指定按钮在指定位置
-------------------------------------------------------------------------------
function f_lua_stencil_panel:showIndicateComponent(component, pos, size)
	if self.m_guidelines_component ~= nil then
		self:deleteComponent(self.m_guidelines_component)
		self.m_guidelines_component = nil
	end
	self.m_guidelines_component = component
	self:appendComponent(self.m_guidelines_component)	
	
	self.m_guidelines_component:setSize(size)
	self.m_guidelines_component:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_guidelines_component:setSwallowsTouches(false)
	
	local destPos = self.m_guidelines_component:getParent():convertToNodeSpace(pos)
	self.m_guidelines_component:setPosition(destPos)
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] showIndicateComponentWithPosition
-- 显示指定按钮在指定位置,不需要组件坐标转换
-------------------------------------------------------------------------------
function f_lua_stencil_panel:showIndicateComponentWithPosition(component, pos, size)
	if self.m_guidelines_component ~= nil then
		self:deleteComponent(self.m_guidelines_component)
		self.m_guidelines_component = nil
	end
	self.m_guidelines_component = component
	self:appendComponent(self.m_guidelines_component)	
	
	self.m_guidelines_component:setSize(size)
	self.m_guidelines_component:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_guidelines_component:setSwallowsTouches(false)
	
	self.m_guidelines_component:setPosition(pos)
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] hideIndicateComponent
-- 隐藏提示按钮
-------------------------------------------------------------------------------
function f_lua_stencil_panel:hideIndicateComponent()
	if self.m_guidelines_component ~= nil then
		self:deleteComponent(self.m_guidelines_component)
		self.m_guidelines_component = nil
	end	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_stencil_panel] scaleFullScreen
-- 缩放至全屏
-------------------------------------------------------------------------------
function f_lua_stencil_panel:scaleFullScreen(on)
	if on then
	    local w = g_game.g_display.sizeInPixels.width
	    local h = g_game.g_display.sizeInPixels.height
	    local scaleX = w / CONFIG_SCREEN_WIDTH
	    local scaleY = h / CONFIG_SCREEN_HEIGHT
	  
	    self.m_autoPanel:setScaleX(scaleX)
	    self.m_autoPanel:setScaleY(scaleY)
	
	else
		
	    local w = g_game.g_display.sizeInPixels.width
	    local h = g_game.g_display.sizeInPixels.height
	    local scale = h / CONFIG_SCREEN_HEIGHT	  	
	    
	    if CONFIG_SCREEN_WIDTH * scale > g_game.g_display.sizeInPixels.width then
	    	scale = w / CONFIG_SCREEN_WIDTH	 
	    
	    end
	  	
	    self.m_autoPanel:setScale(scale)
	end

end

return f_lua_stencil_panel