--[[
	最底部的底板
]]--

local f_base_bottom_panel = class("f_base_bottom_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_base_bottom_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_base_bottom_panel:ctor()    
    self:registerNodeEvent()   
    self.MAX_STEP = 5
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
  	self.m_componentTable = {}
  	self.panelArr = {}
  	for i = 1,  self.MAX_STEP do
	  	table.insert(self.panelArr,{["base_panel_"..i] = nil})
  	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] layout_in_parent
-------------------------------------------------------------------------------
function f_base_bottom_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE_ALLSCALE)

	self:registerNodeEvent()--注册特殊回调函数     
	
  	self.m_autoPanel:appendComponent(self)
  	self.m_componentTable["panel_layer_config"] = 4
	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel,self.m_componentTable["panel_layer_config"])

end

-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] addChildPanel
-------------------------------------------------------------------------------
function f_base_bottom_panel:addChildPanel(index,panel)
	self.panelArr[index]["base_panel_"..index] = panel
	self:appendComponent(panel)
	panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH,0))
	panel:setComponentZOrder(6-index)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] removeChildPanel
-------------------------------------------------------------------------------
function f_base_bottom_panel:removeChildPanel(index)
	self:deleteComponent(self.panelArr[index]["base_panel_"..index])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] getChildPanel
-------------------------------------------------------------------------------
function f_base_bottom_panel:getChildPanel(index)
	return self.panelArr[index]["base_panel_"..index]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_base_bottom_panel:onEnter()  
	self:setStopTouchEvent(true)
	self:initAllComponent()
end


function f_base_bottom_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_base_bottom_panel:onEnterTransitionFinish()
end

function f_base_bottom_panel:onExitTransitionStart()
end

function f_base_bottom_panel:onCleanup()
end


function f_base_bottom_panel:registerNodeEvent(handler)
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

function f_base_bottom_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_base_bottom_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_base_bottom_panel:initAllComponent()	
end

return f_base_bottom_panel