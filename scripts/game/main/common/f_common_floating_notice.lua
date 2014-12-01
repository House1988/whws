--[[
	继承自container panel,用于创建浮动消失的提示信息
]]--

local f_common_floating_notice = class("f_common_floating_notice", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_common_floating_notice")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_common_floating_notice] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_common_floating_notice:ctor()    
    self:registerNodeEvent()   
    
    self.m_bottomImage = fc.FScale9Image:createWithBatchUIFrame("nobatch/anniu_jinluandian.png",cc.rect(103,0,20,48))
    self.m_bottomImage:setSize(cc.size(550,80))
    self.m_bottomImage:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.m_bottomImage)
    
    self.m_comtentLabel = fc.FLabel:createBMFont()
    self.m_comtentLabel:setSize(cc.size(463,48))
    self.m_comtentLabel:setAnchorPoint(cc.p(0.5,0.5))
    self.m_comtentLabel:setFontSize(20)
    self.m_comtentLabel:setWidth(450)
    self.m_comtentLabel:setColor(cc.c3b(44,14,12))
    self:appendComponent(self.m_comtentLabel)
    

end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_floating_notice] setNoticeString
-- 构造函数
-------------------------------------------------------------------------------
function f_common_floating_notice:setNoticeString(string)  
	self.m_bottomImage:setPositionInContainer(cc.p(550/2,80/2)) 
	self.m_comtentLabel:setPositionInContainer(cc.p(550/2,80/2-9))
	self.m_comtentLabel:setString(string)
	
	local removeNotice = function()
		self:removeNotice()	
	end
	
	local imageMoveAbove = CCMoveBy:create(1, cc.p(0,50))
	
	local imageFadeOut = CCFadeOut:create(0.5)
	local imageActions = g_game.g_transition.sequence({CCDelayTime:create(1.5),imageFadeOut})
	
	local labelMoveAbove = CCMoveBy:create(1, cc.p(0,50))
	
	local labelFadeOut = CCFadeOut:create(0.5)
	local labelActions = g_game.g_transition.sequence({CCDelayTime:create(1.5),labelFadeOut,CCCallFunc:create(removeNotice)})
	
	self.m_bottomImage:runAction(imageMoveAbove)
	self.m_bottomImage:runAction(imageActions)
	
	self.m_comtentLabel:runAction(labelMoveAbove)
	self.m_comtentLabel:runAction(labelActions)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_floating_notice] removeNotice
-- 从父节点删除
-------------------------------------------------------------------------------
function f_common_floating_notice:removeNotice()
	if self:isVisible() and self:getParentContainer() then
	    self:getParentContainer():deleteComponent(self)
	    g_game.g_panelManager:removeUiPanel("floating_popup_panel")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_floating_notice] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_common_floating_notice:onEnter()   
		
end


function f_common_floating_notice:onExit()    
    self:unregisterNodeEvent()
end

function f_common_floating_notice:onEnterTransitionFinish()
end

function f_common_floating_notice:onExitTransitionStart()
end

function f_common_floating_notice:onCleanup()
end


function f_common_floating_notice:registerNodeEvent(handler)
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

function f_common_floating_notice:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_common_floating_notice