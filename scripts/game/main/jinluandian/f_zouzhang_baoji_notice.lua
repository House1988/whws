--[[
	继承自container panel,用于批阅奏章时显示银两和经验值显示
]]--

local f_zouzhang_baoji_notice = class("f_zouzhang_baoji_notice", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_zouzhang_baoji_notice")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_baoji_notice] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_zouzhang_baoji_notice:ctor()    
    self:setSize(cc.size(343, 48))
    self:registerNodeEvent()
    
    self.m_bottomImage = fc.FScale9Image:createWithBatchUIFrame("nobatch/anniu_jinluandian.png",cc.rect(103,0,20,48))
    self.m_bottomImage:setSize(cc.size(380,80))
    self.m_bottomImage:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.m_bottomImage)
	self.m_bottomImage:setPositionInContainer(cc.p(171,40)) 
    
    self.m_comtentLabel = fc.FLabel:createBMFont()
    self.m_comtentLabel:setSize(cc.size(450,48))
    self.m_comtentLabel:setFontSize(20)
    self.m_comtentLabel:setWidth(320)
    self.m_comtentLabel:setColor(cc.c3b(44,14,12))
    self.m_comtentLabel:setAlignment(0)
    self:appendComponent(self.m_comtentLabel)
    self.m_comtentLabel:setAnchorPoint(cc.p(0,0.5))
	self.m_comtentLabel:setPositionInContainer(cc.p(32,31))
    
    -- 暴击标志
    self.baoji_bg = fc.FExtensionsImage:create()
    self.baoji_bg:setImage("batch_ui/babeibaoji_kuang_jinluandian.png")
    self.baoji_bg:setSize(cc.size(88,50))
    self.baoji_bg:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.baoji_bg)
    self.baoji_bg:setPositionInContainer(cc.p(321,60))
    self.baoji_bg:setVisible(false)
    
    -- 暴击倍数
    self.m_baoji_time_lbl = fc.FLabel:createBMFont()
    self.m_baoji_time_lbl:setSize(cc.size(343,48))
    self.m_baoji_time_lbl:setAnchorPoint(cc.p(0.5,0.5))
    self.m_baoji_time_lbl:setFontSize(20)
    self.m_baoji_time_lbl:setWidth(20)
    self.m_baoji_time_lbl:setColor(cc.c3b(252,251,201))
	self.m_baoji_time_lbl:setRotation(-15)
    self:appendComponent(self.m_baoji_time_lbl)
	self.m_baoji_time_lbl:setPositionInContainer(cc.p(292,62))
    self.m_baoji_time_lbl:setString("")
    self.m_baoji_time_lbl:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_baoji_notice] setNoticeData
-- 提示内容
-------------------------------------------------------------------------------
function f_zouzhang_baoji_notice:setNoticeData(string, baojiTime)
	self.m_comtentLabel:setString(string)
	
	if baojiTime ~= nil and baojiTime > 1 then
	    self.baoji_bg:setVisible(true)
	    self.m_baoji_time_lbl:setVisible(true)
	    self.m_baoji_time_lbl:setString(tostring(baojiTime))
	end
	
	local removeNotice = function()
		self:removeNotice()	
	end
	local moveAbove = CCMoveBy:create(1, cc.p(0,50))
	local actions = g_game.g_transition.sequence({CCDelayTime:create(0.5),CCFadeOut:create(0.5),CCCallFunc:create(removeNotice)})
	
	self:runAction(moveAbove)
	self:runAction(actions)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_baoji_notice] removeNotice
-- 从父节点删除
-------------------------------------------------------------------------------
function f_zouzhang_baoji_notice:removeNotice()
	if self:isVisible() and self:getParentContainer() then
	    self:getParentContainer():deleteComponent(self)
	    g_game.g_panelManager:removeUiPanel("baoji_popup_panel")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_baoji_notice] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_zouzhang_baoji_notice:onEnter()   
		
end


function f_zouzhang_baoji_notice:onExit()    
    self:unregisterNodeEvent()
end

function f_zouzhang_baoji_notice:onEnterTransitionFinish()
end

function f_zouzhang_baoji_notice:onExitTransitionStart()
end

function f_zouzhang_baoji_notice:onCleanup()
end


function f_zouzhang_baoji_notice:registerNodeEvent(handler)
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

function f_zouzhang_baoji_notice:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_zouzhang_baoji_notice
