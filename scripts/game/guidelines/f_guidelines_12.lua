--[[--
    新手指引
    战斗选择关卡
    步骤
--]]--

local f_guidelines_12 = class("f_guidelines_12")
f_guidelines_12.__index = f_guidelines_12

-------------------------------------------------
-- @function [parent=#f_guidelines_12] ctor
-------------------------------------------------
function f_guidelines_12:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_OPEN_FIRST_CHAPTER	= 2
	self.STATE_OPEN_CHAPTER	= 3
	self.STATE_CHECK		= 4
	self.STATE_FINISH		= 5
	self.STATE_EXIT			= 6
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_checkFirstChapter = function(dt)
		self:state_CheckFirstChapter(dt)
	end
	self.m_state_function_array[self.STATE_OPEN_FIRST_CHAPTER] = state_checkFirstChapter
	
	local state_checkChapter = function(dt)
		self:state_CheckChapter(dt)
	end
	self.m_state_function_array[self.STATE_OPEN_CHAPTER] = state_checkChapter
	
	
	local state_check = function(dt)
		self:state_Check(dt)
	end
	self.m_state_function_array[self.STATE_CHECK] = state_check
	
	local state_finish = function(dt)
		self:state_Finish(dt)
	end
	self.m_state_function_array[self.STATE_FINISH] = state_finish
	
	local state_exit = function(dt)
		self:state_Exit(dt)
	end
	self.m_state_function_array[self.STATE_EXIT] = state_exit
	
	self.m_current_state	= self.STATE_INIT
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_12:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_12:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_12:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
			g_game.g_director:getRunningScene():getGameMap():triggerBuilding(5)
		end
			
		self.m_current_state = self.STATE_OPEN_FIRST_CHAPTER
	
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:enableStencil(true)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] state_CheckFirstChapter
-- 检查面板是否打开
-------------------------------------------------------------------------------
function f_guidelines_12:state_CheckFirstChapter(dt)	
		if g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_ditu_bg") then
				local battleMain = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
				battleMain:showSelectChapter(1)			
			end
			
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_waikuang") then
				local secondChapter = g_game.g_panelManager:getUiPanel("zhanyi_ditu_bg")
				local bigBattleDataTable = g_game.g_dictConfigManager:getChapterBigBattleArr(secondChapter.m_chapterId)
			
    			secondChapter:enterBigBattleByIndex(bigBattleDataTable[1][1])
			end

			self.m_current_state = self.STATE_OPEN_CHAPTER
		end	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] state_CheckChapter
-- 检查面板是否打开
-------------------------------------------------------------------------------
function f_guidelines_12:state_CheckChapter(dt)	
	local thirdChapter = g_game.g_panelManager:getUiPanel("zhanyi_waikuang")
	if thirdChapter then
		local stageList = thirdChapter.m_stage_list
		local stage = nil
		if stageList ~= nil then
			stage = stageList.m_selectStage
		end
		
		if stage then
			local stencilPanel = self.m_guidelines_manager:getComponent()
			local posx, posy = stage:getPosition()
			local pos = stage:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, stage:getSize(), false, false)
				
			local guidelinesBtn = f_stage_small_battle_head.static_clone(stage)
			guidelinesBtn:setSwallowsTouches(false)
			
			stageList:enableScroll(false)
				
			local newPos = cc.p(pos.x, pos.y - 70)
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, stage:getSize())
			stencilPanel:showIndicateAnimation(newPos, stage:getSize())
				
			self.m_current_state = self.STATE_CHECK
		end
		
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_12:state_Check(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
	else
		self.m_current_state = self.STATE_FINISH
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_12:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(13)
	self.m_current_state = self.STATE_EXIT
	
	local thirdChapter = g_game.g_panelManager:getUiPanel("zhanyi_waikuang")
	if thirdChapter then
		local stageList = thirdChapter.m_stage_list
		if stageList ~= nil then
			stageList:enableScroll(true)
		end
	end
	
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SMALL_BATTLE, self.event_openSmallBattle)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_12:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_12:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_12] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_12:guidelinesNextIndex()	
	return 13
end


return f_guidelines_12