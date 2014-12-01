--[[
    剧情逻辑管理类
]]--
local f_story_game_logic_manager = class("f_story_game_logic_manager")
f_story_game_logic_manager.__index = f_story_game_logic_manager

-------------------------------------------------
-- @function [parent=#f_story_game_logic_manager] ctor
-------------------------------------------------
function f_story_game_logic_manager:ctor()
	--定义剧情步骤
	self.MAX_STEP = 5
	
	self.logicFuncTable = {}
	
	for i = 1, self.MAX_STEP do
		self.logicFuncTable[i] = require("scripts.game.story.f_story_logic_part"..i).new()
		self.logicFuncTable[i]:setLogicManager(self)
	end
	
	--从第一步开始
	self.m_logic_part_index = 1
	self.m_isStoryFinish = false
	self.bottomPanel = nil
	
	self:initStory()
end


-------------------------------------------------
-- @function [parent=#f_story_game_logic_manager] initStory
-------------------------------------------------
function f_story_game_logic_manager:initStory()
	self.m_logic_part_index = 1
	self.logicFuncTable[self.m_logic_part_index]:initLogic()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_game_logic_manager] setBasePanel
-------------------------------------------------------------------------------
function f_story_game_logic_manager:setBasePanel(panel)
	self.bottomPanel = panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_story_game_logic_manager] getBottomPanel
-------------------------------------------------------------------------------
function f_story_game_logic_manager:getBottomPanel()
	return self.bottomPanel
end


-------------------------------------------------
-- @function [parent=#f_story_game_logic_manager] update
-------------------------------------------------
function f_story_game_logic_manager:update(dt)
	if not self.m_isStoryFinish then
		self.logicFuncTable[self.m_logic_part_index]:update(dt)
	else
		g_game.g_userInfoManager:requestStoryProgress()
		g_game.enterLoadingScene(2)	
		g_game.g_current_loading_scene:setLoadingData({"test"})		
		g_game.g_guidelinesManager:preInitGuidelines()
		g_game.g_secondGuidelinesManager:preInitGuidelines()
	end

	if self.logicFuncTable[self.m_logic_part_index]:isLogicOver() then
		--5步逻辑结束
		if self.m_logic_part_index >= self.MAX_STEP then
			self.m_isStoryFinish = true
		else
			self.m_logic_part_index = self.m_logic_part_index + 1
			self.logicFuncTable[self.m_logic_part_index]:initLogic()
		end
	end	
	
end


return f_story_game_logic_manager