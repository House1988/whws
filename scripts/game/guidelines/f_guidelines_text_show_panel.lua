require("scripts.auto.auto_xinshouyindao_content")
--[[--
     圣旨界面
--]]--
f_guidelines_text_show_panel = class("f_guidelines_text_show_panel")
f_guidelines_text_show_panel.__index = f_guidelines_text_show_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel.static_create()
	local textshowPanel_table = createxinshouyindao_content()
	local textshow_panel = textshowPanel_table["xinshouyindao_content"]
	
	local funTable = {}
	tolua.setpeer(textshow_panel, funTable)
	setmetatable(funTable, f_guidelines_text_show_panel)
	
	textshow_panel.m_componentTable = textshowPanel_table
	   
	return textshow_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:panelInitBeforePopup()	
	self:registerNodeEvent()		
	
	self.m_touch_callback	= nil
	
	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_guidelines_text_show_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] onEnter
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:onEnter()
	
	self:initAllComponent()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] onExit
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:onExit()  
	
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] onCleanup
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:initAllComponent()
	self.m_componentTable["xsyd_jiantou"]:setVisible(false)
	self.m_componentTable["xsyd_content_label"]:setAlignment(0)
	
	local downCallback = function()		
		if self.m_touch_callback then
			self.m_touch_callback()
		end
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] setGuidelinesTouchCallback
-- 设置面板点击回调
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:setGuidelinesTouchCallback(callback)
	self.m_touch_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] showJiantouAnimation
-- 显示动态箭头
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:showJiantouAnimation(showJT)
	self.m_componentTable["xsyd_jiantou"]:stopAllActions()
	if showJT then
		self.m_componentTable["xsyd_jiantou"]:setVisible(true)
		local action = g_game.g_transition.sequence({cc.MoveBy:create(0.3, cc.p(0, -10)), cc.MoveBy:create(0.3, cc.p(0, 10))})
	
		self.m_componentTable["xsyd_jiantou"]:runAction(cc.RepeatForever:create(action))
	else
		self.m_componentTable["xsyd_jiantou"]:setVisible(false)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] setGuidlinesPersonImage
-- 设置圣旨人物
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:setGuidlinesPersonImage(image, needFlip)
	self.m_componentTable["yindao_person"]:setImage(image)
	if needFlip then
		self.m_componentTable["yindao_person"]:setScaleX(-1)
	else
		self.m_componentTable["yindao_person"]:setScaleX(1)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_text_show_panel] showText
-- 显示文本
-------------------------------------------------------------------------------
function f_guidelines_text_show_panel:showText(text)
	self.m_componentTable["xsyd_content_label"]:setString(text)
end
