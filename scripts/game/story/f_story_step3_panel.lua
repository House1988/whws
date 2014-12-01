--[[
	剧情第3步 面板
]]--

local f_story_step3_panel = class("f_story_step3_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_story_step3_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_story_step3_panel:ctor()    
    self:registerNodeEvent()   
    	
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
	
  	self.ANIM_STEP_NONE = 0
  	self.ANIM_STEP1 = 1
  	self.ANIM_STEP2 = 2	
  	self.ANIM_STEP3 = 3
  	
	self.m_animStep = self.ANIM_STEP_NONE
    
    self.m_timer = 0
  	self.m_speed = 0
  	self.m_isPlayOver = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_story_step3_panel:onEnter()   
	self.step3BgImage = fc.FExtensionsImage:create()
  	self.step3BgImage:setImage(g_game.g_resourceManager:getStoryImage("tx_piantou_bg_03"))
  	self.step3BgImage:setSize(cc.size(CONFIG_SCREEN_WIDTH,893))
  	self.step3BgImage:setAnchorPoint(cc.p(0.5,0.5))
  	self:appendComponent(self.step3BgImage)
  	self.step3BgImage:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width * 0.5, 893/2))
	
	self.animStep3 =  g_game.g_classFactory.newFLuaAnimationComponent("FAC")
  	self:appendComponent(self.animStep3)
  	self.animStep3:setScaleX(g_game.g_display.sizeInPixels.width /960)
	self.animStep3:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width/2, g_game.g_display.sizeInPixels.height/2+20))
	
	self.storyWordsImage = fc.FExtensionsImage:create()
  	self.storyWordsImage:setImage(g_game.g_resourceManager:getStoryImage("tx_piantou_wenzi03"))
  	self.storyWordsImage:setSize(cc.size(416,210))
  	self.storyWordsImage:setAnchorPoint(cc.p(0.5,0.5))
  	self:appendComponent(self.storyWordsImage)
  	self.storyWordsImage:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width* 0.5, g_game.g_display.sizeInPixels.height* 0.5))
	self.storyWordsImage:setVisible(false)
	
	self:setStopTouchEvent(true)
	self:initAllComponent()
	
	self:setAnimStep(self.ANIM_STEP1)
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] setAnimStep
-------------------------------------------------------------------------------
function f_story_step3_panel:setAnimStep(step)
	if self.m_animStep == step then
		return
	end
	self.m_animStep  = step
	
	self:updateStep()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] updateStep
-------------------------------------------------------------------------------
function f_story_step3_panel:updateStep()
	if self.m_animStep == self.ANIM_STEP1 then
		self.m_timer = 0
	elseif self.m_animStep == self.ANIM_STEP2 then
		self.m_timer = 0
		self.m_speed = 416 / 5
		self.storyWordsImage:setVisible(true)
		
		local bgGoDown = function()
			local moveTo = cc.MoveBy:create(1,cc.p(0,893 - g_game.g_display.sizeInPixels.height))
			self.step3BgImage:runAction(moveTo)
		end
		local actions = g_game.g_transition.sequence({cc.DelayTime:create(3),cc.CallFunc:create(bgGoDown)})
		self:runAction(actions)
	elseif self.m_animStep == self.ANIM_STEP3 then
		self.m_timer = 0
		self.storyWordsImage:runAction(cc.FadeOut:create(0.3))
	end
end	

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] update
-------------------------------------------------------------------------------
function f_story_step3_panel:update(dt)
	self.m_timer =  self.m_timer + dt
	
	if self.m_animStep == self.ANIM_STEP1 then
		if self.m_timer >= 6 then
		
			local stepOver = function()
				self.m_isPlayOver = true
			end
			
			local fade = function()
				local fadeOut = cc.FadeOut:create(0.2)
				local actions1 = g_game.g_transition.sequence({cc.DelayTime:create(0.1),fadeOut})
				self.animStep3:runAction(actions1)
				local fadeOut2 = cc.FadeOut:create(0.2)
				local actions2 = g_game.g_transition.sequence({cc.DelayTime:create(0.1),fadeOut2,cc.CallFunc:create(stepOver)})
				self.step3BgImage:runAction(actions2)
			end 
			self.animStep3:runAnimation(g_game.g_f_main_ui_effect.STORY_STEP3_1[2],g_game.g_f_main_ui_effect.STORY_STEP3_1[3])
			self.animStep3:setAnimationSpeedScale(0.1)
			self.animStep3:registeAnimationFinishCallback(fade)
			
			self:setAnimStep(self.ANIM_STEP_NONE)
		end
	elseif self.m_animStep == self.ANIM_STEP2 then
		local deltaDistance = self.m_speed*self.m_timer
		self.storyWordsImage:setPositionInContainer(cc.p((g_game.g_display.sizeInPixels.width+416-deltaDistance)*0.5,g_game.g_display.sizeInPixels.height* 0.5))
		self.storyWordsImage:setExtensionsTextureRect(cc.rect(416 - deltaDistance,0,deltaDistance,210))
		
		if self.m_timer >= 5.5 then
			self.m_timer = 0
			self:setAnimStep(self.ANIM_STEP3)
		end
	elseif self.m_animStep == self.ANIM_STEP3 then
			
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] isPlayOver
-------------------------------------------------------------------------------
function f_story_step3_panel:isPlayOver()
	--返回是否 播放完毕
    return self.m_isPlayOver
end

function f_story_step3_panel:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end

function f_story_step3_panel:onEnterTransitionFinish()
end

function f_story_step3_panel:onExitTransitionStart()
end

function f_story_step3_panel:onCleanup()
end


function f_story_step3_panel:registerNodeEvent(handler)
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

function f_story_step3_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_story_step3_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_story_step3_panel:initAllComponent()	
end

return f_story_step3_panel