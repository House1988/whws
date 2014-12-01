--[[
	剧情第5步 面板
]]--

local f_story_step5_panel = class("f_story_step5_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_story_step5_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_story_step5_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_story_step5_panel:ctor()    
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
-- @function [parent=#f_story_step5_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_story_step5_panel:onEnter()   
	self.step4BgImage = fc.FExtensionsImage:create()
  	self.step4BgImage:setImage(g_game.g_resourceManager:getStoryImage("tx_piantou_bg05"))
  	self.step4BgImage:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
  	self.step4BgImage:setAnchorPoint(cc.p(0.5,0.5))
  	self:appendComponent(self.step4BgImage)
  	self.step4BgImage:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width * 0.5, g_game.g_display.sizeInPixels.height*0.5))
	self.step4BgImage:setOpacity(0)

	self.storyWordsImage = fc.FExtensionsImage:create()
  	self.storyWordsImage:setImage(g_game.g_resourceManager:getStoryImage("tx_piantou_wenzi05"))
  	self.storyWordsImage:setSize(cc.size(560,306))
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
-- @function [parent=#f_story_step5_panel] setAnimStep
-------------------------------------------------------------------------------
function f_story_step5_panel:setAnimStep(step)
	if self.m_animStep == step then
		return
	end
	self.m_animStep  = step
	
	self:updateStep()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step5_panel] updateStep
-------------------------------------------------------------------------------
function f_story_step5_panel:updateStep()
	if self.m_animStep == self.ANIM_STEP1 then
		local fadeIn1 = cc.FadeIn:create(1)
		self.step4BgImage:runAction(fadeIn1)
		
		self.m_timer = 0
		self.m_speed = 560 / 7
		self.storyWordsImage:setVisible(true)
	elseif self.m_animStep == self.ANIM_STEP2 then
		self.step4BgImage:runAction(cc.FadeOut:create(2))
		self.storyWordsImage:runAction(cc.FadeOut:create(2))
	end
end	

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step5_panel] update
-------------------------------------------------------------------------------
function f_story_step5_panel:update(dt)
	self.m_timer =  self.m_timer + dt
	
	if self.m_animStep == self.ANIM_STEP1 then
		local deltaDistance = self.m_speed*self.m_timer
		self.storyWordsImage:setPositionInContainer(cc.p((g_game.g_display.sizeInPixels.width+560-deltaDistance)*0.5,g_game.g_display.sizeInPixels.height* 0.5))
		self.storyWordsImage:setExtensionsTextureRect(cc.rect(560 - deltaDistance,0,deltaDistance,306))
		
		if self.m_timer >= 7 then
			self.m_timer = 0
			self:setAnimStep(self.ANIM_STEP2)
		end
	elseif self.m_animStep == self.ANIM_STEP2 then
		if self.m_timer >= 2 then
			self.m_isPlayOver = true
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_step5_panel] isPlayOver
-------------------------------------------------------------------------------
function f_story_step5_panel:isPlayOver()
	--返回是否 播放完毕
    return self.m_isPlayOver 
end

function f_story_step5_panel:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end

function f_story_step5_panel:onEnterTransitionFinish()
end

function f_story_step5_panel:onExitTransitionStart()
end

function f_story_step5_panel:onCleanup()
end


function f_story_step5_panel:registerNodeEvent(handler)
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

function f_story_step5_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_story_step5_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_story_step5_panel:initAllComponent()	
end

return f_story_step5_panel