--[[
    剧情逻辑2
]]--
local f_story_logic_part2 = class("f_story_logic_part2")
f_story_logic_part2.__index = f_story_logic_part2

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] ctor
-------------------------------------------------
function f_story_logic_part2:ctor()	
	self.STEP_PRELOAD = 1
	self.STEP_LOADPANEL = 2
	self.STEP_RUNNING = 3
	self.STEP_FINISH = 4
	
	self.m_logicState = self.STEP_PRELOAD
	
	self.m_isLogicOver = false
	self.m_logicManager = nil
	self.m_panel = nil
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] initLogic
-------------------------------------------------
function f_story_logic_part2:initLogic()
	self.m_logicState = self.STEP_PRELOAD
	self.m_isLogicOver = false
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] setLogicManager
-------------------------------------------------
function f_story_logic_part2:setLogicManager(manager)
	self.m_logicManager = manager
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] update
-------------------------------------------------
function f_story_logic_part2:update(dt)
	if self.m_logicState == self.STEP_PRELOAD then
		self:storyPreload(dt)
	elseif self.m_logicState == self.STEP_LOADPANEL then
		self:storyLoadPanel(dt)
	elseif self.m_logicState == self.STEP_RUNNING then
		self:storyRunning(dt)
	elseif self.m_logicState == self.STEP_FINISH then
		self:storyFinish(dt)
	end
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] storyPreload
-------------------------------------------------
function f_story_logic_part2:storyPreload(dt)
	--release predata
	g_game.g_resourceManager:removeAllAnimation()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
	
	--load new data
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.STORY_STEP3_1[1])
	
	self.m_logicState = self.STEP_LOADPANEL
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] storyLoadPanel
-------------------------------------------------
function f_story_logic_part2:storyLoadPanel(dt)
	local basePanel = self.m_logicManager:getBottomPanel()
	basePanel:removeChildPanel(1)
	
	local bottomPanel = require("scripts.game.story.f_story_step3_panel").new()
	basePanel:addChildPanel(3,bottomPanel)
	
	self.m_panel = basePanel:getChildPanel(2)
	self.m_panel:setAnimStep(2)
	
	self.m_logicState = self.STEP_RUNNING
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] storyRunning
-------------------------------------------------
function f_story_logic_part2:storyRunning(dt)
	if self.m_panel:isPlayOver() then
		self.m_logicState = self.STEP_FINISH
	end
	
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] storyFinish
-------------------------------------------------
function f_story_logic_part2:storyFinish(dt)
	self.m_isLogicOver = true
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part2] isLogicOver
-------------------------------------------------
function f_story_logic_part2:isLogicOver()
	return self.m_isLogicOver
end

return f_story_logic_part2