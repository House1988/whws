--[[
	网络loading
]]--

local f_network_loading_panel = class("f_network_loading_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_network_loading_panel")
end)



-------------------------------------------------------------------------------
-- @function [parent=#f_network_loading_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_network_loading_panel:ctor()
    self:registerNodeEvent()   
    
  	self.m_real_size = g_game.g_real_size

  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)  
  	
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 5)	
  	
    self.m_layer_color_panel		= require("scripts.extend.f_lua_color_layer").new()
    self.m_autoPanel:appendComponent(self.m_layer_color_panel)
    self.m_layer_color_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_layer_color_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH * 0.5, CONFIG_SCREEN_HEIGHT * 0.5))
  		  	
  	self.m_autoPanel:appendComponent(self)
  	
	self:setSize(self.m_real_size)    	
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))	

    self:setStopTouchEvent(true)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_network_loading_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_network_loading_panel:onEnter()    
end


function f_network_loading_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_network_loading_panel:onEnterTransitionFinish()
end

function f_network_loading_panel:onExitTransitionStart()
end

function f_network_loading_panel:onCleanup()
end


function f_network_loading_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_network_loading_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_network_loading_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_network_loading_panel] showLoading
-------------------------------------------------------------------------------
function f_network_loading_panel:showLoading()
	local loading = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(loading)
	loading:setPositionInContainer(cc.p(self.m_real_size.width/2, self.m_real_size.height/2))
	loading:setLoop(true)
	loading:setAnimationScale(1.0)
    loading:runAnimation("tx_ui_loading", "qishou")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_network_loading_panel] hideLoading
-------------------------------------------------------------------------------
function f_network_loading_panel:hideLoading()
	local layer = g_game.g_director:getRunningScene():get_layer_from_config(5)
	layer:removeChild(self.m_autoPanel, true)
end




return f_network_loading_panel