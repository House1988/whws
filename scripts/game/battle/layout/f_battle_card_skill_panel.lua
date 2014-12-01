--[[
	继承自container panel, 实现带背景的战斗卡牌头像
]]--

local f_battle_card_skill_panel = class("f_battle_card_skill_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_battle_card_skill_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_card_skill_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_battle_card_skill_panel:ctor()     
    self:registerNodeEvent()   
    
	self.m_show_time		= g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME * 0.6
    
    
    self.m_skill_info = nil
    self.m_card_info = nil
    
    
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPosition(cc.p(0.5*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height))
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
    
  	g_game.g_director:getRunningScene():add_panel_to_layer(self, 5)
        
    
    self.m_background_animation	= nil
	self.m_background_animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
	self:appendComponent(self.m_background_animation)	
	self.m_background_animation:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
	self.m_background_animation:setVisible(true)
	self.m_background_animation:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_background_animation:setPositionInContainer(cc.p(0.5*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height))	
	self.m_background_animation:setAnimationPosition(cc.p(0.5*g_game.g_display.sizeInPixels.width, 0.5*g_game.g_display.sizeInPixels.height))
	self.m_background_animation:setLoop(false)	
	self.m_background_animation:setAnimationSpeedScale(0.5)
	self.m_background_animation:setAnimationScale(g_game.g_display.sizeInPixels.width/CONFIG_SCREEN_WIDTH)
	
	self.m_card_image	= fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_card_image)
    
    self.m_skill_name_image	= nil
    self.m_skill_name_image = fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_skill_name_image)
    
    self.m_skill_name_image_scale_first = nil
    self.m_skill_name_image_scale_first = fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_skill_name_image_scale_first)
    
    self.m_skill_name_image_scale_second = nil
    self.m_skill_name_image_scale_second = fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_skill_name_image_scale_second)
   
	self.m_skill_name_image_scale_third = nil
    self.m_skill_name_image_scale_third = fc.FShaderExtensionsImage:create(8)
    self:appendComponent(self.m_skill_name_image_scale_third)
   
	
	
	
    self:setStopTouchEvent(true)
    
    self:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_card_skill_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_battle_card_skill_panel:onEnter()       
	
end


function f_battle_card_skill_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_battle_card_skill_panel:onEnterTransitionFinish()
end

function f_battle_card_skill_panel:onExitTransitionStart()
end

function f_battle_card_skill_panel:onCleanup()
end


function f_battle_card_skill_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_card_skill_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_card_skill_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_card_skill_panel] getSkillInfoShowTime
-- 获取当前面板显示的时间长度
-------------------------------------------------------------------------------
function f_battle_card_skill_panel:getSkillInfoShowTime()
	return self.m_show_time
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_card_skill_panel] preSkillInfoPanelShow
-- 面板显示初始化
-------------------------------------------------------------------------------
function f_battle_card_skill_panel:preSkillInfoPanelShow()

end

-------------------------------------------------
-- @function [parent=#f_battle_card_skill_panel] scaleSoliderInfo
-- 展示兵团头顶头像和技能名称
-------------------------------------------------
function f_battle_card_skill_panel:scaleSoliderInfo(skillInfo, solider, callback)

	local changeImageShader = function()
		self.m_skill_name_image_scale_third:setImageType(0)
	end	
	
	local hideSelfPanel = function()
		self:setVisible(false)
		self.m_skill_name_image_scale_third:setVisible(false)
	end
	
	self.m_skill_info = skillInfo
	local soliderComponent = solider:getSoliderInfoComponent()
	if soliderComponent then
		local seqAction = g_game.g_transition.sequence({cc.EaseBounceOut:create(cc.ScaleTo:create(0.3, 2.0)), cc.DelayTime:create(0.5), cc.EaseBounceOut:create(cc.ScaleTo:create(0.3, 1.0)), cc.CallFunc:create(callback)})
		soliderComponent:runAction(seqAction)
		
		local posx, posy = soliderComponent:getPosition()
		local soliderComponentPos = soliderComponent:getParent():convertToWorldSpace(cc.p(posx, posy))			
		
		local skillNameResource = self.m_skill_info[21]
		local skillImage = g_game.g_resourceManager:getSkillNameImage(skillNameResource)--"yiguzuoqi"
		
		local pos = self.m_skill_name_image_scale_third:getParent():convertToNodeSpace(soliderComponentPos)
		self.m_skill_name_image_scale_third:setImage(skillImage)	
		self.m_skill_name_image_scale_third:setAnchorPoint(cc.p(0.1, 0))
		self.m_skill_name_image_scale_third:setPosition(pos)
		self.m_skill_name_image_scale_third:setVisible(true)
		self.m_skill_name_image_scale_third:setScale(8.0)
		self.m_skill_name_image_scale_third:setOpacity(255)
		self.m_skill_name_image_scale_third:stopAllActions()
		
		local skillSeqAction = g_game.g_transition.sequence({cc.Show:create(), cc.EaseBounceOut:create(cc.ScaleTo:create(0.1, 1.0)), cc.DelayTime:create(0.7), cc.CallFunc:create(changeImageShader), cc.FadeOut:create(0.1), cc.CallFunc:create(hideSelfPanel)})
		self.m_skill_name_image_scale_third:runAction(skillSeqAction)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_card_skill_panel] showCardSkillWithAnimation
-- 设置面板显示信息,并使用动画
-------------------------------------------------------------------------------
function f_battle_card_skill_panel:showCardSkillWithAnimation(skillInfo, currentCardId, isLeft)
	self.m_skill_info = skillInfo
	self.m_card_id = currentCardId
	
	local skillNameResource = self.m_skill_info[21]
	local skillImage = g_game.g_resourceManager:getSkillNameImage(skillNameResource)--"yiguzuoqi"
	
	local changeImageShader = function()
		self.m_skill_name_image:setImageType(0)
	end	
	local changeCardImageShader = function()
		self.m_card_image:setImageType(0)
	end	
	local changeCardBlur = function()
		self.m_card_image:setImageType(8)
	end
	
	local skill_ext = "lan"
	local skill_qua = self.m_skill_info[3]
	if skill_qua == 3 then
		skill_ext = "lan"
	elseif skill_qua == 4 then
		skill_ext = "zi"
	elseif skill_qua == 5 then
		skill_ext = "cheng"
	end
	
	if isLeft then
		self.m_background_animation:setScaleX(-1)
		self.m_background_animation:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_MINGCHENG_CHUCHANG[2], g_game.g_f_battle_ui_effect.BATTLE_MINGCHENG_CHUCHANG[3]..skill_ext)
	--	self.m_background_animation:animationPause()
	
		local cardImage = g_game.g_resourceManager:getCard(g_game.g_dictConfigManager:getCardFile(currentCardId))
	
		self.m_card_image:setImage(cardImage)
		local cardSize = self.m_card_image:getExtensionsImageSize()
		self.m_card_image:setSize(cardSize)
		self.m_card_image:setAnchorPoint(cc.p(0, 0.5))
		self.m_card_image:setScale(1.3)
		self.m_card_image:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width+cardSize.width, g_game.g_display.sizeInPixels.height*0.5))
	
		local seq = g_game.g_transition.sequence({cc.EaseSineIn:create(cc.MoveTo:create(self.m_show_time/4, cc.p(0, g_game.g_display.sizeInPixels.height*0.5))), cc.CallFunc:create(changeCardImageShader), cc.MoveBy:create(self.m_show_time/4*2, cc.p(50, 0)), cc.CallFunc:create(changeCardBlur), cc.EaseSineOut:create(cc.MoveTo:create(self.m_show_time/4, cc.p(g_game.g_display.sizeInPixels.width+cardSize.width, g_game.g_display.sizeInPixels.height*0.5)))})		
		
		self.m_card_image:runAction(seq)
		
		
		
		self.m_skill_name_image:setImage(skillImage)
		self.m_skill_name_image:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width*0.5+200, g_game.g_display.sizeInPixels.height*0.8-300))
		self.m_skill_name_image:setVisible(false)
		self.m_skill_name_image:setScale(8.0)
		local skillSeqAction = g_game.g_transition.sequence({cc.DelayTime:create(self.m_show_time/4), cc.Show:create(), cc.EaseBounceOut:create(cc.ScaleTo:create(self.m_show_time/8, 2.0)), cc.CallFunc:create(changeImageShader), cc.MoveBy:create(self.m_show_time/8*3, cc.p(0, 0)), cc.EaseSineOut:create(cc.MoveTo:create(self.m_show_time/4, cc.p(g_game.g_display.sizeInPixels.width+cardSize.width, g_game.g_display.sizeInPixels.height*0.8)))})
		self.m_skill_name_image:runAction(skillSeqAction)
		
		
		self.m_skill_name_image_scale_first:setImage(skillImage)
		self.m_skill_name_image_scale_first:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width*0.5+200, g_game.g_display.sizeInPixels.height*0.8-300))
		self.m_skill_name_image_scale_first:setScale(2.0)
		self.m_skill_name_image_scale_first:setVisible(false)
		local scaleFirstAction = g_game.g_transition.sequence({cc.DelayTime:create(self.m_show_time/4+self.m_show_time/8), cc.Show:create(), cc.EaseBounceOut:create(cc.ScaleTo:create(self.m_show_time/8, 4.0))})
		local scaleFirstFadeAction = g_game.g_transition.sequence({cc.DelayTime:create(self.m_show_time/4+self.m_show_time/8), cc.FadeOut:create(self.m_show_time/8*3)})
		local spwanAction = cc.Spawn:createWithTwoActions(scaleFirstAction, scaleFirstFadeAction)
		self.m_skill_name_image_scale_first:runAction(spwanAction)
	else
		self.m_background_animation:setScaleX(1)
		self.m_background_animation:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_MINGCHENG_CHUCHANG[2], g_game.g_f_battle_ui_effect.BATTLE_MINGCHENG_CHUCHANG[3]..skill_ext)
	--	self.m_background_animation:animationPause()
	
		local cardImage = g_game.g_resourceManager:getCard(g_game.g_dictConfigManager:getCardFile(currentCardId))
	
		self.m_card_image:setImage(cardImage)
		local cardSize = self.m_card_image:getExtensionsImageSize()
		self.m_card_image:setSize(cardSize)
		self.m_card_image:setAnchorPoint(cc.p(1, 0.5))
		self.m_card_image:setScale(1.3)
		self.m_card_image:setPositionInContainer(cc.p(-cardSize.width, g_game.g_display.sizeInPixels.height*0.5))
	
		local seq = g_game.g_transition.sequence({cc.EaseSineIn:create(cc.MoveTo:create(self.m_show_time/4, cc.p(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height*0.5))), cc.CallFunc:create(changeCardImageShader), cc.MoveBy:create(self.m_show_time/4*2, cc.p(-50, 0)), cc.CallFunc:create(changeCardBlur), cc.EaseSineOut:create(cc.MoveTo:create(self.m_show_time/4, cc.p(-cardSize.width, g_game.g_display.sizeInPixels.height*0.5)))})		
		self.m_card_image:runAction(seq)
		
		
		
		self.m_skill_name_image:setImage(skillImage)
		self.m_skill_name_image:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width*0.5-200, g_game.g_display.sizeInPixels.height*0.8-300))
		self.m_skill_name_image:setVisible(false)
		self.m_skill_name_image:setScale(8.0)
		
		local skillSeqAction = g_game.g_transition.sequence({cc.DelayTime:create(self.m_show_time/4), cc.Show:create(), cc.EaseBounceOut:create(cc.ScaleTo:create(self.m_show_time/8, 2.0)), cc.CallFunc:create(changeImageShader), cc.MoveBy:create(self.m_show_time/8*3, cc.p(0, 0)), cc.EaseSineOut:create(cc.MoveTo:create(self.m_show_time/4, cc.p(-cardSize.width, g_game.g_display.sizeInPixels.height*0.8)))})
		self.m_skill_name_image:runAction(skillSeqAction)
		
		
		self.m_skill_name_image_scale_first:setImage(skillImage)
		self.m_skill_name_image_scale_first:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width*0.5-200, g_game.g_display.sizeInPixels.height*0.8-300))
		self.m_skill_name_image_scale_first:setScale(2.0)
		self.m_skill_name_image_scale_first:setVisible(false)
		local scaleFirstAction = g_game.g_transition.sequence({cc.DelayTime:create(self.m_show_time/4+self.m_show_time/8), cc.Show:create(), cc.EaseBounceOut:create(cc.ScaleTo:create(self.m_show_time/8, 4.0))})
		local scaleFirstFadeAction = g_game.g_transition.sequence({cc.DelayTime:create(self.m_show_time/4+self.m_show_time/8), cc.FadeOut:create(self.m_show_time/8*3)})
		local spwanAction = cc.Spawn:createWithTwoActions(scaleFirstAction, scaleFirstFadeAction)
		self.m_skill_name_image_scale_first:runAction(spwanAction)
	end
end


return f_battle_card_skill_panel