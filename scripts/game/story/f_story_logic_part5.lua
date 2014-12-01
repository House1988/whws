--[[
    剧情逻辑5
]]--
local f_story_logic_part5 = class("f_story_logic_part5")
f_story_logic_part5.__index = f_story_logic_part5

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] ctor
-------------------------------------------------
function f_story_logic_part5:ctor()	
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
-- @function [parent=#f_story_logic_part5] initLogic
-------------------------------------------------
function f_story_logic_part5:initLogic()
	self.m_logicState = self.STEP_PRELOAD
	self.m_isLogicOver = false
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] setLogicManager
-------------------------------------------------
function f_story_logic_part5:setLogicManager(manager)
	self.m_logicManager = manager
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] update
-------------------------------------------------
function f_story_logic_part5:update(dt)
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
-- @function [parent=#f_story_logic_part5] storyPreload
-------------------------------------------------
function f_story_logic_part5:storyPreload(dt)
	--release predata
	g_game.g_resourceManager:removeAllAnimation()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()

	--load new data
	
	self.m_logicState = self.STEP_LOADPANEL
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] storyLoadPanel
-------------------------------------------------
function f_story_logic_part5:storyLoadPanel(dt)
	local basePanel = self.m_logicManager:getBottomPanel()
	basePanel:removeChildPanel(4)
	
	self.m_panel = require("scripts.game.story.f_story_step5_panel").new()
	basePanel:addChildPanel(5,self.m_panel)
	
	self.m_logicState = self.STEP_RUNNING
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] storyRunning
-------------------------------------------------
function f_story_logic_part5:storyRunning(dt)
	if self.m_panel:isPlayOver() then
		self.m_logicState = self.STEP_FINISH
	end
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] storyFinish
-------------------------------------------------
function f_story_logic_part5:storyFinish(dt)
	self.m_isLogicOver = true
end

-------------------------------------------------
-- @function [parent=#f_story_logic_part5] isLogicOver
-------------------------------------------------
function f_story_logic_part5:isLogicOver()
	return self.m_isLogicOver
end

return f_story_logic_part5