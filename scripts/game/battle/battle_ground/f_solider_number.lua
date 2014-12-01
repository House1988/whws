--[[
	继承自container panel, 用于添加人物血量变化组件
]]--

local FLuaSoliderNumber = class("FLuaSoliderNumber", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaSoliderNumber")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaSoliderNumber:ctor()     
    self:registerNodeEvent()   

    self.m_group_type = 1 -- type 1 攻击阵营   type 2 防御阵营
    
    self.m_background_bg = nil
    self.m_solider_head = nil
    self.m_number_label = nil    
    self.m_attr_label = nil
    
    
    self.m_solider_health = 300
    self.m_current_solider_health = 300
    
	self.m_value_change_animation_time	= 1.0 --血量变化持续时间
	
	self.m_attack_health_number_image = g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_BLUE_TYPE)
	self.m_defense_health_number_image = g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE)
	self.m_attack_change_health_number_image = g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_BLUE_TYPE)
	self.m_defense_change_health_number_image = g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE)
	
	self.m_officer_id	= 0
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaSoliderNumber:onEnter()  
	self:setOpacity(255)
	self:setVisible(true)
end


function FLuaSoliderNumber:onExit()    
    self:unregisterNodeEvent()
end

function FLuaSoliderNumber:onEnterTransitionFinish()
end

function FLuaSoliderNumber:onExitTransitionStart()
end

function FLuaSoliderNumber:onCleanup()
end


function FLuaSoliderNumber:registerNodeEvent(handler)
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
-- @function [parent=#FLuaSoliderNumber] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaSoliderNumber:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] setOfficerId
-- 设置卡牌id
-------------------------------------------------------------------------------
function FLuaSoliderNumber:setOfficerId(officerId)
	self.m_officer_id = officerId
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] showStaticHeath
-- 是否显示静态血量
-------------------------------------------------------------------------------
function FLuaSoliderNumber:showStaticHeath(isShow)
	self:setVisible(isShow)
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] showHead
-- 是否显示头像
-------------------------------------------------------------------------------
function FLuaSoliderNumber:showHead(isShow)
	if self.m_solider_head then
		self.m_solider_head:setVisible(isShow)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] createSoliderNumber
-- 创建血量组件
-------------------------------------------------------------------------------
function FLuaSoliderNumber:createSoliderNumber(type)
	self.m_group_type = type
	
	local parentSize = self:getSize()
	if self.m_officer_id then
		local cardResource = g_game.g_dictConfigManager:getCardHeadFile(self.m_officer_id)
		local resourceImage = g_game.g_resourceManager:getCardHead(cardResource)	
		local cardQuality = g_game.g_dictConfigManager:getCardQuality(self.m_officer_id)
		
		self.m_background_bg = fc.FExtensionsImage:create()
		self:appendComponent(self.m_background_bg)	
	    self.m_background_bg:setImage(g_game.g_f_solider_number_quality_image[cardQuality])
	    local sizeT = self.m_background_bg:getExtensionsImageSize()
	    self.m_background_bg:setSize(sizeT)
	    self.m_background_bg:setAnchorPoint(cc.p(0.5,0.5))
	    self.m_background_bg:setPositionInContainer(cc.p(parentSize["width"]/2, parentSize["height"]/2))
	    
	    self.m_solider_head = fc.FClippingImage:create()
		self:appendComponent(self.m_solider_head)
		self.m_solider_head:setImage(resourceImage)
		self.m_solider_head:setSize(parentSize)	
		sizeT = self.m_background_bg:getExtensionsImageSize()
		self.m_solider_head:setClippingPosition(cc.p(45, 85))
		self.m_solider_head:setClippingType(2, 45, cc.size(0, 0))
		self.m_solider_head:setAnchorPoint(cc.p(0.5, 0.5))
		self.m_solider_head:setPositionInContainer(cc.p(20, 20))
		self.m_solider_head:setScale(0.45)
		self.m_solider_head:setVisible(true)
		
	end
		
	
	--创建显示血条数字组件
	if self.m_group_type == 1 then		
		self.m_attr_label = fc.FAnimationLabel:create("", self.m_defense_health_number_image)
	else
		self.m_attr_label = fc.FAnimationLabel:create("", self.m_attack_health_number_image)	
	end
	self:appendComponent(self.m_attr_label)	
	self.m_attr_label:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_attr_label:setPositionInContainer(cc.p(40,25))	
	self.m_attr_label:setTextWithInt(432)
	self.m_attr_label:setScale(0.5)
	
	--血量减少跳字
	if self.m_number_label == nil then
		if self.m_group_type == 1 then
			self.m_number_label = fc.FAnimationLabel:create("", self.m_defense_change_health_number_image)
		else
			self.m_number_label = fc.FAnimationLabel:create("", self.m_attack_change_health_number_image)
		end
		self:appendComponent(self.m_number_label)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] setSoliderHealth
-- 设置兵团血量
-------------------------------------------------------------------------------
function FLuaSoliderNumber:setSoliderHealth(allHealth, currentHealth)	
	self.m_solider_health = allHealth
	self.m_current_solider_health = currentHealth
		
	self.m_attr_label:setTextWithInt(currentHealth)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] showJumpValue
-- 显示血量变化的值
-------------------------------------------------------------------------------
function FLuaSoliderNumber:showJumpValue(value)
	--显示人物头顶数字变化数字
	local changeValueStr = ""
	
	if value > 0 then
		changeValueStr = "+" .. tostring(value)
	else
		changeValueStr = tostring(value)
	end
	self.m_number_label:setAnchorPoint(cc.p(0.5,0.5))
	self.m_number_label:setVisible(true)
	self.m_number_label:stopAllActions()
	self.m_number_label:setPositionInContainer(cc.p(90,15))
	self.m_number_label:setScale(0.0)
	self.m_number_label:setString(changeValueStr)
	
	local posx = self.m_number_label:getPositionX()
	local posy = self.m_number_label:getPositionY()	
	local scaleTo = cc.ScaleTo:create(self.m_value_change_animation_time/2, 1.0)
			
	local finish = function()
		self.m_number_label:setVisible(false)
	end
	local action = g_game.g_transition.sequence({cc.EaseElasticOut:create(scaleTo), cc.DelayTime:create(self.m_value_change_animation_time/2),cc.CallFunc:create(finish)})			
	self.m_number_label:runAction(action)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaSoliderNumber] changeSoliderAttrValue
-- 显示战斗加成
-------------------------------------------------------------------------------
function FLuaSoliderNumber:changeSoliderAttrValue(value)
	self.m_attr_label:stopAllActions()
	local finish = function()
		self:showJumpValue(value)
	end
	local action = g_game.g_transition.sequence({cc.DelayTime:create(self.m_value_change_animation_time/10), CCCallFunc:create(finish)})			
	self.m_attr_label:runAction(action)
	
	local newValue = self.m_current_solider_health + value
	if newValue < 0 then
		newValue = 0
	end
	--动态变化人物血量变化
	self.m_attr_label:setTextChangeWithAnimation(newValue, self.m_value_change_animation_time/2)
	
	self.m_current_solider_health = newValue
end

return FLuaSoliderNumber