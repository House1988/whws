--[[
	继承自container panel, 用于显示第几回合文本，并用于添加特效
]]--

local FLuaBattleRoundTextPanel = class("FLuaBattleRoundTextPanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattleRoundTextPanel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleRoundTextPanel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattleRoundTextPanel:ctor(index)       
    self:registerNodeEvent()   
    
    self.m_round_index = index
    
    self.m_text_image = {}
    if index == 1 then
    	self.m_text_image[1] = "di_huihe"
    	self.m_text_image[2] = "yi_huihe"
    	self.m_text_image[3] = "hui_huihe"
    	self.m_text_image[4] = "he_huihe"
    elseif index == 2 then
    	self.m_text_image[1] = "di_huihe"
    	self.m_text_image[2] = "er_huihe"
    	self.m_text_image[3] = "hui_huihe"
    	self.m_text_image[4] = "he_huihe"
    elseif index == 3 then
    	self.m_text_image[1] = "di_huihe"
    	self.m_text_image[2] = "san_huihe"
    	self.m_text_image[3] = "hui_huihe"
    	self.m_text_image[4] = "he_huihe"
    elseif index == 4 then
    	self.m_text_image[1] = "quan"
    	self.m_text_image[2] = "jun"
    	self.m_text_image[3] = "chong"
    	self.m_text_image[4] = "feng"
    end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleRoundTextPanel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBattleRoundTextPanel:onEnter()       	
    self.m_first_text_image	= fc.FExtensionsImage:create()
    self:appendComponent(self.m_first_text_image)
    self.m_first_text_image:setImage(g_game.g_resourceManager:getImage(self.m_text_image[1]))
    local size = self.m_first_text_image:getSize()
    self.m_first_text_image:setSize(size)
    
    self.m_second_text_image = fc.FExtensionsImage:create()
    self:appendComponent(self.m_second_text_image)
    self.m_second_text_image:setImage(g_game.g_resourceManager:getImage(self.m_text_image[2]))
    size = self.m_second_text_image:getSize()
    self.m_second_text_image:setSize(size)
    
    self.m_third_text_image	= fc.FExtensionsImage:create()
    self:appendComponent(self.m_third_text_image)
    self.m_third_text_image:setImage(g_game.g_resourceManager:getImage(self.m_text_image[3]))
    size = self.m_third_text_image:getSize()
    self.m_third_text_image:setSize(size)
    
    self.m_four_text_image	= fc.FExtensionsImage:create()
    self:appendComponent(self.m_four_text_image)
    self.m_four_text_image:setImage(g_game.g_resourceManager:getImage(self.m_text_image[4]))
    size = self.m_four_text_image:getSize()
    self.m_four_text_image:setSize(size)
    
    
    local width = 0
    local height = 0
    local size1 = self.m_first_text_image:getExtensionsImageSize()
    self.m_first_text_image:setAnchorPoint(cc.p(0,0.5))
    width = width + size1["width"]
    if height < size1["height"] then
    	height = size1["height"]
    end
    
    local size2 = self.m_second_text_image:getExtensionsImageSize()
    self.m_second_text_image:setAnchorPoint(cc.p(0,0.5))
    width = width + size2["width"]
    if height < size2["height"] then
    	height = size2["height"]
    end
    
    local size3 = self.m_third_text_image:getExtensionsImageSize()
    self.m_third_text_image:setAnchorPoint(cc.p(0, 0.5))
    width = width + size3["width"]
    if height < size3["height"] then
    	height = size3["height"]
    end
    
    local size4 = self.m_four_text_image:getExtensionsImageSize()
    self.m_four_text_image:setAnchorPoint(cc.p(0,0.5))
    width = width + size4["width"]
    if height < size4["height"] then
    	height = size4["height"]
    end
    
    self:setSize(cc.size(width, height))
    
    self.m_first_text_image:setPositionInContainer(cc.p(0, height/2))
    self.m_second_text_image:setPositionInContainer(cc.p(size1["width"], height/2))
    self.m_third_text_image:setPositionInContainer(cc.p(size1["width"]+size2["width"], height/2))
    self.m_four_text_image:setPositionInContainer(cc.p(size1["width"]+size2["width"]+size3["width"], height/2))

    self.m_first_text_image:setVisible(true)
    self.m_second_text_image:setVisible(true)
    self.m_third_text_image:setVisible(true)
    self.m_four_text_image:setVisible(true)
end


function FLuaBattleRoundTextPanel:onExit()    
    self:unregisterNodeEvent()
end

function FLuaBattleRoundTextPanel:onEnterTransitionFinish()
end

function FLuaBattleRoundTextPanel:onExitTransitionStart()
end

function FLuaBattleRoundTextPanel:onCleanup()
end


function FLuaBattleRoundTextPanel:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattleRoundTextPanel] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaBattleRoundTextPanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleRoundTextPanel] showRoundText
-- 显示回合文本，并在结束后使用回调返回
-------------------------------------------------------------------------------
function FLuaBattleRoundTextPanel:showRoundText(callback)
	self:setScale(3.0)
	
	local action = g_game.g_transition.sequence({CCEaseBounceOut:create(CCScaleTo:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.1, 1.0)), CCDelayTime:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.2), CCEaseSineIn:create(CCScaleTo:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.1, 8.0)), cc.Hide:create(), cc.DelayTime:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.1), CCCallFunc:create(callback)})
	self:runAction(action)
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.1+g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.2+g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.1+g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.1
end

return FLuaBattleRoundTextPanel