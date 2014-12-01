--[[--
    新手指引
    第4次已经打完  跳转到战斗小关卡界面  此时其实第5个已开启 指向第五个关卡
    步骤
--]]--


local f_guidelines_59 = class("f_guidelines_59")
f_guidelines_59.__index = f_guidelines_59

-------------------------------------------------
-- @function [parent=#f_guidelines_59] ctor
-------------------------------------------------
function f_guidelines_59:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_CHECK1		= 3
	self.STATE_FINISH		= 4
	self.STATE_EXIT			= 5
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_check = function(dt)
		self:state_Check(dt)
	end
	self.m_state_function_array[self.STATE_CHECK] = state_check
	
	local state_check1 = function(dt)
		self:state_Check1(dt)
	end
	self.m_state_function_array[self.STATE_CHECK1] = state_check1
	
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
-- @function [parent=#f_guidelines_59] createUi
-------------------------------------------------------------------------------
function f_guidelines_59:createUi()
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:enableStencil(true)
		
		if not g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
			g_game.g_userInfoManager:requestRecordGuidleStep(59)
			
			local stageChapter = f_stage_chapters.static_create()
		    stageChapter:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(stageChapter,"nanzhengbeitao_title")
			stageChapter:guideLinePveInitChapter(1) --打开章节 初始化章节为1
			
			--打开战役	
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_ditu_bg") then
				local bigBattlePanel = f_stage_big_battle_panel.static_create()
				bigBattlePanel:panelInitBeforePopup()    
				g_game.g_panelManager:showUiPanel(bigBattlePanel,"zhanyi_ditu_bg")	
				bigBattlePanel:setChapterId(1)
				bigBattlePanel:guideLinePveInitBigBattle(1,1)--打开战役 初始化战役为1
			end
			
			--打开stage
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_waikuang") then
				local smallBattlePanel = f_stage_small_battle_panel.static_create()
				smallBattlePanel:panelInitBeforePopup()    
				g_game.g_panelManager:showUiPanel(smallBattlePanel,"zhanyi_waikuang")
				smallBattlePanel:setGuideLineSmallBattleData(1,1,5)
				smallBattlePanel:guideLinePveInitSmallBattle(1,5)
			end
			
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
						
					local guidelinesBtn = f_stage_small_battle_head.static_clone2(stage)
					guidelinesBtn:setSwallowsTouches(false)
					
					stageList:enableScroll(false)
						
					local newPos = cc.p(pos.x, pos.y - 70)
					stencilPanel:showIndicateComponent(guidelinesBtn, pos, stage:getSize())
					stencilPanel:showIndicateAnimation(newPos, stage:getSize())
						
					self.m_current_state = self.STATE_CHECK
				end
		
			end
			
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_59:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_59:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_59:state_Init(dt)	
	self.event_createUi = function()
		self:createUi()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE5, self.event_createUi)
	
	self.m_current_state = self.STATE_CHECK1
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] state_Check
-------------------------------------------------------------------------------
function f_guidelines_59:state_Check(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
	else
		self.m_current_state = self.STATE_FINISH
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] state_Check1
-------------------------------------------------------------------------------
function f_guidelines_59:state_Check1(dt)	

end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_59:state_Finish(dt)	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE5, self.event_createUi)

	g_game.g_userInfoManager:requestRecordGuidleStep(60)
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_59:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_59:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_59] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_59:guidelinesNextIndex()	
	return 60
end

return f_guidelines_59