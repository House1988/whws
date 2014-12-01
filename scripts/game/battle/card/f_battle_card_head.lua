--[[
	继承自container panel, 实现带背景的战斗卡牌头像
]]--

local FLuaBattleCardHead = class("FLuaBattleCardHead", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattleCardHead")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattleCardHead:ctor()     
    self:registerNodeEvent()   
    
    self.m_has_data = false
    
    self.m_card_self_size = {78, 116}
    self.m_card_quality = 0
    
    self.m_back_image 	= nil
    self.m_icon_image	= nil
    
    self.m_background_effect = nil
    
    self.m_back_image 			= fc.FShaderExtensionsImage:create(0)  
    self.m_background_image 	= fc.FShaderExtensionsImage:create(0)   
    self.m_background_effect	= g_game.g_classFactory.newFLuaAnimationComponent("FAC")
    self.m_icon_image			= fc.FShaderExtensionsImage:create(0)
    self.m_flag_image			= fc.FShaderExtensionsImage:create(0)
    
    self:appendComponent(self.m_back_image)
    self:appendComponent(self.m_background_image)
    self:appendComponent(self.m_icon_image)
    self:appendComponent(self.m_background_effect)
    self:appendComponent(self.m_flag_image)
    
    
	self:setSize(cc.size(self.m_card_self_size[1], self.m_card_self_size[2]))
    self.m_back_image:setImage(g_game.g_resourceManager:getImage("kapai_beimian"))
    self.m_back_image:setPositionInContainer(cc.p(self.m_card_self_size[1]/2, self.m_card_self_size[2]/2))    
    self.m_back_image:setVisible(true)	
    
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBattleCardHead:onEnter()       
	
end


function FLuaBattleCardHead:onExit()    
    self:unregisterNodeEvent()
end

function FLuaBattleCardHead:onEnterTransitionFinish()
end

function FLuaBattleCardHead:onExitTransitionStart()
end

function FLuaBattleCardHead:onCleanup()
end


function FLuaBattleCardHead:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattleCardHead] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaBattleCardHead:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] getCardSize
-- 获取卡牌头像组件size
-------------------------------------------------------------------------------
function FLuaBattleCardHead:getCardSize()		
	return self.m_card_self_size
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] setActiveCardHeadEffect
-- 显示卡牌头像背景特效
-------------------------------------------------------------------------------
function FLuaBattleCardHead:setActiveCardHeadEffect(needFlip)		
    self.m_background_effect:setSize(cc.size(self.m_card_self_size[1], self.m_card_self_size[2]))
    self.m_background_effect:setAnchorPoint(cc.p(0.5, 0.5))
	
	if needFlip then
--		self.m_background_effect:setScaleY(-1)
   		self.m_background_effect:setPositionInContainer(cc.p(self.m_card_self_size[1] / 2, self.m_card_self_size[2]))
	else
    	self.m_background_effect:setPositionInContainer(cc.p(self.m_card_self_size[1] / 2, self.m_card_self_size[2]))
	end
	self.m_background_effect:setOpacity(255)
	self.m_background_effect:setVisible(false)
	self.m_background_effect:setAnimationScale(1.0)
	self.m_background_effect:setLoop(true)
	self.m_background_effect:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_CARD_BACKGROUND_EFFECT[2], g_game.g_f_battle_ui_effect.BATTLE_CARD_BACKGROUND_EFFECT[3])
	
	local seq = g_game.g_transition.sequence({cc.Show:create(), cc.FadeIn:create(1.0)})		
		
	self.m_background_effect:runAction(seq)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] setDisableCardHeadEffect
-- 关闭卡牌头像背景特效
-------------------------------------------------------------------------------
function FLuaBattleCardHead:setDisableCardHeadEffect()
	self.m_background_effect:stopAllActions()
	local removeEffect = function()	
--[[
		if self.m_background_effect ~= nil then		
			self:deleteComponent(self.m_background_effect)
			self.m_background_effect = nil
		end
]]--
	end
	
	local seq = g_game.g_transition.sequence({cc.FadeOut:create(0.5), cc.Hide:create(), cc.CallFunc:create(removeEffect)})		
		
	self.m_background_effect:runAction(seq)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] setCardQuality
-- 设置卡牌品质, 并根据品质设置背景
-------------------------------------------------------------------------------
function FLuaBattleCardHead:setCardQuality(cardQuality)
	self.m_card_quality = cardQuality
		
	local backgroundImage = g_game.g_resourceManager:getImage(g_game.g_f_battle_card_background[self.m_card_quality])
    self.m_background_image:setImage(backgroundImage)
    
    self.m_background_image:setPositionInContainer(cc.p(self.m_card_self_size[1]/2, self.m_card_self_size[2]/2))
    
    self.m_background_image:setVisible(false)	

end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] setCardHead
-- 设置卡牌头像
-------------------------------------------------------------------------------
function FLuaBattleCardHead:setCardHead(iconImage)	
	self.m_has_data = true
	
    self.m_icon_image:setImage(iconImage)
    self.m_icon_image:setSize(cc.size(self.m_card_self_size[1] - 2, self.m_card_self_size[2] - 2))
    self.m_icon_image:setPositionInContainer(cc.p(self.m_card_self_size[1]/2, self.m_card_self_size[2]/2))
    
    self.m_icon_image:setVisible(false)	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] showCardContent
-- 直接显示卡牌
-------------------------------------------------------------------------------
function FLuaBattleCardHead:showCardContent()	
	self.m_background_image:setVisible(true)
	self.m_icon_image:setVisible(true)	
	self.m_back_image:setVisible(false)	
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] preOpenCardHead
-- 准备翻开卡牌
-------------------------------------------------------------------------------
function FLuaBattleCardHead:preOpenCardHead()	
	if self.m_has_data then
	    self.m_background_image:setVisible(false)
	    self.m_icon_image:setVisible(false)	
	    self.m_back_image:setVisible(true)	
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] openCardHead
-- 翻开卡牌
-------------------------------------------------------------------------------
function FLuaBattleCardHead:openCardHead()	
	if self.m_has_data then
		local actionBgIn = g_game.g_transition.sequence({cc.DelayTime:create(g_game.g_f_battle_time.BATTLE_CARD_OPEN_ANI_TIME), CCShow:create(),cc.OrbitCamera:create(g_game.g_f_battle_time.BATTLE_CARD_OPEN_ANI_TIME, 1, 0, 270, 90, 0, 0)})		
		local actionIconIn = g_game.g_transition.sequence({cc.DelayTime:create(g_game.g_f_battle_time.BATTLE_CARD_OPEN_ANI_TIME), CCShow:create(),cc.OrbitCamera:create(g_game.g_f_battle_time.BATTLE_CARD_OPEN_ANI_TIME, 1, 0, 270, 90, 0, 0)})					
		local actionOut = g_game.g_transition.sequence({cc.OrbitCamera:create(g_game.g_f_battle_time.BATTLE_CARD_OPEN_ANI_TIME, 1, 0, 0, 90, 0, 0), cc.Hide:create()})			
		
		self.m_background_image:runAction(actionBgIn)
		self.m_back_image:runAction(actionOut)	
		self.m_icon_image:runAction(actionIconIn)
		
		
		
	end
end	

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleCardHead] setCardDisable
-- 设置卡牌置灰，当卡牌死亡
-------------------------------------------------------------------------------
function FLuaBattleCardHead:setCardDisable()	
	self.m_background_image:setImageType(2)
	self.m_back_image:setImageType(2)	
	self.m_icon_image:setImageType(2)
	
    self.m_flag_image:setImage(g_game.g_resourceManager:getImage("zhanbai"))
    self.m_flag_image:setSize(cc.size(69, 64))
    self.m_flag_image:setPositionInContainer(cc.p(self.m_card_self_size[1]/2, self.m_card_self_size[2]/2))
    
end

return FLuaBattleCardHead