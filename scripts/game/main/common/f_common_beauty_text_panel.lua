--[[
	继承自container panel, 实现单行文本组件
]]--

local f_common_beauty_text_panel = class("f_common_beauty_text_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_common_beauty_text_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_common_beauty_text_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_common_beauty_text_panel:ctor()
    self:registerNodeEvent()   
    
   	self.m_first_text_label	= fc.FLabel:createBMFont()
    self:appendComponent(self.m_first_text_label)
 	self.m_first_text_label:setAnchorPoint(cc.p(0, 0.5))
    self.m_first_text_label:setFontSize(20)
 	self.m_first_text_label:setAlignment(0)
 	self.m_first_text_label:setColor(cc.c3b(206,53,0))
 	
   	
   	self.m_second_text_label = fc.FLabel:createBMFont()
    self:appendComponent(self.m_second_text_label)
 	self.m_second_text_label:setAnchorPoint(cc.p(0, 0.5))
    self.m_second_text_label:setFontSize(20)
 	self.m_second_text_label:setAlignment(0)
 	self.m_second_text_label:setColor(cc.c3b(106,68,19))
   	
 	self.m_first_text = ""
 	self.m_second_text = ""
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_beauty_text_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_common_beauty_text_panel:onEnter()   
		
end


function f_common_beauty_text_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_common_beauty_text_panel:onEnterTransitionFinish()
end

function f_common_beauty_text_panel:onExitTransitionStart()
end

function f_common_beauty_text_panel:onCleanup()
end


function f_common_beauty_text_panel:registerNodeEvent(handler)
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

function f_common_beauty_text_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_common_beauty_text_panel] addItem
-- 添加用于显示数据
-------------------------------------------------------------------------------
function f_common_beauty_text_panel:addItem(firstText, secondText)
	local size = self:getSize()

 	self.m_first_text = firstText
 	self.m_second_text = secondText
 	
 	self.m_first_text_label:setSize(cc.size(size["width"] * 0.2, size["height"]))
 	self.m_first_text_label:setWidth(size["width"] * 0.2)
 	self.m_first_text_label:setPositionInContainer(cc.p(0, size["height"]/2))
 	self.m_first_text_label:setString(self.m_first_text)
 	
 	self.m_second_text_label:setSize(cc.size(size["width"] * 0.8, size["height"]))
 	self.m_second_text_label:setWidth(size["width"] * 0.8)
 	self.m_second_text_label:setPositionInContainer(cc.p(size["width"] * 0.25, size["height"]/2))
 	self.m_second_text_label:setString(self.m_second_text)
end

return f_common_beauty_text_panel