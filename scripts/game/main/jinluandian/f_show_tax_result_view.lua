require("scripts.auto.auto_askTax_view")
--[[
	继承自container panel, 实现跑马灯滚动消息
]]--

local f_show_tax_result_view = class("f_show_tax_result_view", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_show_tax_result_view")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_show_tax_result_view] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_show_tax_result_view:ctor()    
    self:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))
    
    self:registerNodeEvent()
    
    local showGetSilver= function()
    	g_game.g_panelManager:removeUiPanel("tax_result_view")
    end
    
	self.showTax  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.showTax)
	self.showTax:setAnchorPoint(cc.p(0.5,0.5))
	self.showTax:runAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[2], g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[3])
	self.showTax:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
    self.showTax:registeAnimationFinishCallback(showGetSilver)
    
    self.m_componentTable = createaskTax_view()
    self.taxGetPanel =  self.m_componentTable["askTax_view"]
    self:appendComponent(self.taxGetPanel)
    self.taxGetPanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2+50))
	self.taxGetPanel:setVisible(false)
	
	self.m_timer = 0
	self.m_canTrigger = false
	g_game.g_gameManager:addUpdateObj(self)
end

function f_show_tax_result_view:setAddSilver(silver)
	self.m_componentTable["add_silver_num1"]:setString("+"..silver)
end


function f_show_tax_result_view:update(dt)
	self.m_timer = self.m_timer + dt
	
	if self.m_timer > 2 then
		self.m_canTrigger = true
		self.taxGetPanel:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_show_tax_result_view] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_show_tax_result_view:onEnter()   
	local close = function()
		if self.m_canTrigger then
			g_game.g_panelManager:removeUiPanel("tax_result_view")
		end
	end
	self:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

function f_show_tax_result_view:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end

function f_show_tax_result_view:onEnterTransitionFinish()
end

function f_show_tax_result_view:onExitTransitionStart()
end

function f_show_tax_result_view:onCleanup()
end


function f_show_tax_result_view:registerNodeEvent(handler)
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

function f_show_tax_result_view:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_show_tax_result_view
