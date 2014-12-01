--[[
	继承自container panel, 实现单行文本组件
]]--

local FLuaCommonTextPanel = class("FLuaCommonTextPanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaCommonTextPanel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaCommonTextPanel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaCommonTextPanel:ctor()    
    self:registerNodeEvent()   
    
   	self.m_first_text_label	= fc.FLabel:createSystemFont()
    self:appendComponent(self.m_first_text_label)
    self.m_first_text_label:setFontSize(20)
   	
   	
   	self.m_second_text_label = fc.FLabel:createBMFont()
    self:appendComponent(self.m_second_text_label)
    self.m_second_text_label:setFontSize(20)
   	
   	
 	self.m_first_text = ""
 	self.m_second_text = ""
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaCommonTextPanel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaCommonTextPanel:onEnter()   
		
end


function FLuaCommonTextPanel:onExit()    
    self:unregisterNodeEvent()
end

function FLuaCommonTextPanel:onEnterTransitionFinish()
end

function FLuaCommonTextPanel:onExitTransitionStart()
end

function FLuaCommonTextPanel:onCleanup()
end


function FLuaCommonTextPanel:registerNodeEvent(handler)
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

function FLuaCommonTextPanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaCommonTextPanel] addItem
-- 添加用于显示数据
-------------------------------------------------------------------------------
function FLuaCommonTextPanel:addItem(firstText, secondText)
	local size = self:getSize()

 	self.m_first_text = firstText
 	self.m_second_text = secondText

		
 	self.m_first_text_label:setAlignment(0)
 	self.m_first_text_label:setSize(cc.size(size["width"] * 0.2, size["height"]))
 	self.m_first_text_label:setColor(cc.c3b(206,53,0))
 	self.m_first_text_label:setString(self.m_first_text)
 	self.m_first_text_label:setAnchorPoint(cc.p(0, 0.5))
 	self.m_first_text_label:setPositionInContainer(cc.p(0, size["height"]/2))
 	
 	
 	self.m_second_text_label:setAlignment(0)
 	self.m_second_text_label:setSize(cc.size(size["width"] * 0.8, size["height"]))
 	self.m_second_text_label:setColor(cc.c3b(106,68,19))
 	self.m_second_text_label:setString(self.m_second_text)
 	self.m_second_text_label:setAnchorPoint(cc.p(0, 0.5))
 	self.m_second_text_label:setPositionInContainer(cc.p(size["width"] * 0.35, size["height"]/2))
end

return FLuaCommonTextPanel