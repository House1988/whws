--[[
	剧情第1步 面板
]]--

local f_story_step1_panel = class("f_story_step1_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_story_step1_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_story_step1_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_story_step1_panel:ctor()    
    self:registerNodeEvent()   
    	
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
  	
  	self.ANIM_STEP_NONE = 0
  	self.ANIM_STEP1 = 1
  	self.ANIM_STEP2 = 2	
  	
  	self.m_animStep = self.ANIM_STEP_NONE
  	
  	self.m_timer = 0
  	self.m_speed = 0
  	self.m_isPlayOver = false
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step1_panel] isPlayOver
-------------------------------------------------------------------------------
function f_story_step1_panel:isPlayOver()
	--返回是否 播放完毕
    return self.m_isPlayOver
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step1_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_story_step1_panel:onEnter()   
	self.step1BgImage = fc.FExtensionsImage:create()
  	self.step1BgImage:setImage(g_game.g_resourceManager:getStoryImage("tx_piantou_bg01"))
  	self.step1BgImage:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
  	self.step1BgImage:setAnchorPoint(cc.p(0.5,0.5))
  	self:appendComponent(self.step1BgImage)
  	self.step1BgImage:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width * 0.5, g_game.g_display.sizeInPixels.height * 0.5))

  	self.storyWordsImage = fc.FExtensionsImage:create()
  	self.storyWordsImage:setImage(g_game.g_resourceManager:getStoryImage("tx_piantou_wenzi01"))
  	self.storyWordsImage:setSize(cc.size(488,380))
  	self.storyWordsImage:setAnchorPoint(cc.p(0.5,0.5))
  	self:appendComponent(self.storyWordsImage)
  	self.storyWordsImage:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width* 0.5, g_game.g_display.sizeInPixels.height* 0.5))
 	
	self:setStopTouchEvent(true)
	self:initAllComponent()
	
	self:setAnimStep(self.ANIM_STEP1)
	g_game.g_gameManager:addUpdateObj(self)
	
end

function f_story_step1_panel:setAnimStep(step)
	if self.m_animStep == step then
		return
	end
	self.m_animStep  = step
	
	self:updateStep()
end

function f_story_step1_panel:updateStep()
	if self.m_animStep == self.ANIM_STEP1 then
		local preScaleX = self.step1BgImage:getScaleX()
	  	local preScaleY = self.step1BgImage:getScaleY()
	  	local scaleTo = cc.ScaleTo:create(7.5,preScaleX+0.5,preScaleY+0.5)
	  	self.step1BgImage:runAction(scaleTo)
	  	self.m_speed = 488 / 7.5
	  	
	elseif self.m_animStep == self.ANIM_STEP2 then
		local fadeOut1 = cc.FadeOut:create(2)
		local fadeOut2 = cc.FadeOut:create(2)
		self.step1BgImage:runAction(fadeOut1)
		self.storyWordsImage:runAction(fadeOut2)
	end
end	

function f_story_step1_panel:update(dt)
	self.m_timer =  self.m_timer + dt
	
	if self.m_animStep == self.ANIM_STEP1 then
		local deltaDistance = self.m_speed*self.m_timer
		self.storyWordsImage:setPositionInContainer(cc.p((g_game.g_display.sizeInPixels.width+488-deltaDistance)*0.5,g_game.g_display.sizeInPixels.height* 0.5))
		self.storyWordsImage:setExtensionsTextureRect(cc.rect(488 - deltaDistance,0,deltaDistance,380))
		
		if self.m_timer >= 7.5 then
			self.m_timer = 0
			self:setAnimStep(self.ANIM_STEP2)
		end
	elseif self.m_animStep == self.ANIM_STEP2 then
		if self.m_timer >= 2 then
			self.m_isPlayOver = true
		end
	end
end

function f_story_step1_panel:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self) 
end

function f_story_step1_panel:onEnterTransitionFinish()
end

function f_story_step1_panel:onExitTransitionStart()
end

function f_story_step1_panel:onCleanup()
end


function f_story_step1_panel:registerNodeEvent(handler)
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

function f_story_step1_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step1_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_story_step1_panel:initAllComponent()	
end

return f_story_step1_panel