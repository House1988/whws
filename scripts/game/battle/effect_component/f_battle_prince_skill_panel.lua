--[[
	继承自container panel, 用于显示皇子技能起手全屏特效
]]--

local FLuaBattlePrinceSkillPanel = class("FLuaBattlePrinceSkillPanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattlePrinceSkillPanel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattlePrinceSkillPanel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:ctor(index)       
    self:registerNodeEvent()   
    
    self.m_skill_info = nil
    self.m_round_data = nil
    self.m_prince_is_attack = false
    
    self.m_showFinishCallback = nil
    
    self.m_animation_time	= 1.0
    
    
	self.m_bg_image	= fc.FExtensionsImage:create()
	self:appendComponent(self.m_bg_image)	
	
	self.m_secondImage = fc.FExtensionsImage:create()
	self:appendComponent(self.m_secondImage)	
	
	self.m_thirdImage = fc.FExtensionsImage:create()
	self:appendComponent(self.m_thirdImage)	
	
	self.m_prince_skill_qishou = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_prince_skill_qishou)
	self.m_prince_skill_qishou:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self.m_prince_skill_qishou:setVisible(false)
	self.m_prince_skill_qishou:setLoop(false)	
	self.m_prince_skill_qishou:setAnimationScale(1.0)
	self.m_prince_skill_qishou:setAnchorPoint(cc.p(0, 0))
	self.m_prince_skill_qishou:setPositionInContainer(cc.p(0, 0))	
	
	
	self.m_prince_image = fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_prince_image)
    
	self.m_prince_skill_name = fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_prince_skill_name)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattlePrinceSkillPanel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:onEnter()       	
	self.m_prince_skill_effect = nil	
end


function FLuaBattlePrinceSkillPanel:onExit()    
    self:unregisterNodeEvent()
end

function FLuaBattlePrinceSkillPanel:onEnterTransitionFinish()
end

function FLuaBattlePrinceSkillPanel:onExitTransitionStart()
end

function FLuaBattlePrinceSkillPanel:onCleanup()
end


function FLuaBattlePrinceSkillPanel:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattlePrinceSkillPanel] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattlePrinceSkillPanel] princeQishouAnimation
-- 显示皇子技能起手
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:princeQishouAnimation()	
	local princeSkillAnimationResource = self.m_skill_info[4]
	self.m_prince_skill_qishou:runAnimation(princeSkillAnimationResource, "qishou")
	self.m_prince_skill_qishou:setVisible(true)
	
	local animationFinish = function()
		self.m_showFinishCallback()
	end
	
	self.m_prince_skill_qishou:registeAnimationFinishCallback(animationFinish)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattlePrinceSkillPanel] princeEnter
-- 显示皇子形象
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:princeEnter()	
	local princeSkillNameResource = g_game.g_dictConfigManager:getSkillNameResource(self.m_princeSkillId)
	
	local princeNameText = self.m_round_data["selfPrinceName"]
	local princeStar = self.m_round_data["selfPrinceStar"]
	local princeResource = self.m_round_data["selfPrinceResource"]
	
	if self.m_is_attack then
		if self.m_is_self then
			princeNameText = self.m_round_data["selfPrinceName"]
			princeStar = self.m_round_data["selfPrinceStar"]
			princeResource = self.m_round_data["selfPrinceResource"]
		else
			princeNameText = self.m_round_data["enemyPrinceName"]
			princeStar = self.m_round_data["enemyPrinceStar"]
			princeResource = self.m_round_data["enemyPrinceResource"]
		end
	else
		if self.m_is_self then
			princeNameText = self.m_round_data["enemyPrinceName"]
			princeStar = self.m_round_data["enemyPrinceStar"]
			princeResource = self.m_round_data["enemyPrinceResource"]
		else
			princeNameText = self.m_round_data["selfPrinceName"]
			princeStar = self.m_round_data["selfPrinceStar"]
			princeResource = self.m_round_data["selfPrinceResource"]
		end
	end	
	local princeImage = g_game.g_resourceManager:getPrinceImage(g_game.g_dictConfigManager:getPrinceImage(princeStar, princeResource, 5))
	local skillImage = g_game.g_resourceManager:getSkillNameImage(princeSkillNameResource)
	
	
	self.m_prince_image:setImage(princeImage)
	local princeImageSize = self.m_prince_image:getExtensionsImageSize()
    self.m_prince_image:setSize(princeImageSize)    
	
	self.m_prince_image:setAnchorPoint(cc.p(0, 0.5))
	self.m_prince_image:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT/2)) 
	
	
	self.m_prince_image:setVisible(false)
	
	
	local showAnimation = function()
		self:princeQishouAnimation()
	end
	
	local princeImageChangeShader = function()
		self.m_prince_image:setImageType(0)
	end
	local skillImageChangeShader = function()
		self.m_prince_skill_name:setImageType(0)
	end
	
	local sequAction = g_game.g_transition.sequence({cc.Show:create(), CCEaseBounceOut:create(cc.MoveTo:create(self.m_animation_time*0.2, cc.p(-40, CONFIG_SCREEN_HEIGHT/2))), cc.CallFunc:create(princeImageChangeShader), cc.DelayTime:create(self.m_animation_time*0.3), cc.CallFunc:create(showAnimation)})
	self.m_prince_image:runAction(sequAction)
	
	
	self.m_prince_skill_name:setImage(skillImage)
	local skillImageSize = self.m_prince_skill_name:getExtensionsImageSize()
    self.m_prince_skill_name:setSize(skillImageSize)  
    self.m_prince_skill_name:setAnchorPoint(cc.p(1, 0.5))
	self.m_prince_skill_name:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH - skillImageSize["width"], CONFIG_SCREEN_HEIGHT*0.5)) 
	
	if self.m_is_attack then
		self.m_prince_skill_name:setFlippedX(false)
	else
		self.m_prince_skill_name:setFlippedX(true)
	end
	self.m_prince_skill_name:setScale(8)
	self.m_prince_skill_name:setVisible(true)
	local nameSequAction = g_game.g_transition.sequence({cc.Show:create(), CCEaseBounceOut:create(cc.ScaleTo:create(self.m_animation_time*0.2, 1.0)), cc.CallFunc:create(skillImageChangeShader)})
	self.m_prince_skill_name:runAction(nameSequAction)

end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattlePrinceSkillPanel] showPrinceSkillWithAnimation
-- 显示皇子技能特效起手
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:showPrinceSkillWithAnimation(roundData, isAttack, callback, isSelf)
    self.m_round_data = roundData
    self.m_prince_is_attack = isAttack
	
	self.m_princeSkillId = 0
	self.m_is_attack = 	isAttack
	self.m_is_self = isSelf
	self.m_showFinishCallback = callback
	
	if isAttack then
		if isSelf then
			self.m_princeSkillId = self.m_round_data["selfPrinceSkillId"]
		else
			self.m_princeSkillId = self.m_round_data["enemyPrinceSkillId"]
		end	
	else	
		if isSelf then
			self.m_princeSkillId = self.m_round_data["enemyPrinceSkillId"]
		else
			self.m_princeSkillId = self.m_round_data["selfPrinceSkillId"]
		end
	end
	
	self.m_skill_info = g_game.g_dictConfigManager:getSkillInfo(self.m_princeSkillId)
	local princeSkillBgResource = g_game.g_dictConfigManager:getPrinceSkillBgResource(self.m_princeSkillId)
		
	local princeSkillBgImage = g_game.g_resourceManager:getPrinceSkillBg(princeSkillBgResource)

	--背景图片
	local size = g_game.g_real_size
	self.m_bg_image:setImage(princeSkillBgImage)
	self.m_bg_image:setExtensionsTextureRect(cc.rect(0, 0, 960, 640))
	self.m_bg_image:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self.m_bg_image:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_bg_image:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	
	self.m_secondImage:setImage(princeSkillBgImage)
	self.m_secondImage:setExtensionsTextureRect(cc.rect(0, 0, 960, 640))
	self.m_secondImage:setSize(cc.size(960, 640))
	self.m_secondImage:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_secondImage:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	
	self.m_thirdImage:setImage(princeSkillBgImage)
	self.m_thirdImage:setExtensionsTextureRect(cc.rect(0, 0, 960, 640))
	self.m_thirdImage:setSize(cc.size(960, 640))
	self.m_thirdImage:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_thirdImage:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self.m_thirdImage:setVisible(false)
	
	local bgActionFinish = function()
		self:princeEnter()
--		self.m_thirdImage:setVisible(true)
	end	
	local sequAction = g_game.g_transition.sequence({cc.FadeOut:create(self.m_animation_time*0.3), cc.CallFunc:create(bgActionFinish)})
	local spwanAction = cc.Spawn:createWithTwoActions(sequAction, cc.ScaleTo:create(self.m_animation_time*0.3, 4))
	self.m_secondImage:runAction(spwanAction)	
	
	return self.m_animation_time * 0.5 + 0.7 + self.m_animation_time*0.3
end



-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattlePrinceSkillPanel] showPrinceMingzhongSkillWithAnimation
-- 显示皇子技能特效命中
-------------------------------------------------------------------------------
function FLuaBattlePrinceSkillPanel:showPrinceMingzhongSkillWithAnimation(sillId, isLeft, callback)
	self.m_princeSkillId = sillId
	self.m_showFinishCallback = callback
	
	self.m_skill_info = g_game.g_dictConfigManager:getSkillInfo(self.m_princeSkillId)
	local princeSkillAnimationResource = self.m_skill_info[4]
	
	local animationName = "mingzhongzuo"
	if isLeft then
		animationName = "mingzhongyou"
	else
		animationName = "mingzhongzuo"
	end

	self.m_prince_skill_qishou:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_prince_skill_qishou:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self.m_prince_skill_qishou:runAnimation(princeSkillAnimationResource, animationName)
	self.m_prince_skill_qishou:setVisible(true)
	
	local animationFinish = function()
		self.m_showFinishCallback()
	end
	
	self.m_prince_skill_qishou:registeAnimationFinishCallback(animationFinish)
	
	
	return self.m_animation_time * 1.5
end
return FLuaBattlePrinceSkillPanel