--[[--
    新手指引
  	三星奖励 引导
    步骤
--]]--

local f_guidelines_901 = class("f_guidelines_901")
f_guidelines_901.__index = f_guidelines_901

-------------------------------------------------
-- @function [parent=#f_guidelines_901] ctor
-------------------------------------------------
function f_guidelines_901:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_FINISH		= 3
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
	
	local state_finish = function(dt)
		self:state_Finish(dt)
	end
	self.m_state_function_array[self.STATE_FINISH] = state_finish
	
	local state_exit = function(dt)
		self:state_Exit(dt)
	end
	self.m_state_function_array[self.STATE_EXIT] = state_exit
	
	self.m_current_state	= self.STATE_INIT
	
	self.guidelinesPanel = nil
	
	self.event_3starBegin = function()
		if self.m_current_state == self.STATE_INIT then
			self:trigger3StarReward()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_3STAR_GUIDE, self.event_3starBegin)
	
	self.event_RewardPress = function()
		if self.m_current_state == self.STATE_CHECK then
			self.m_current_state = self.STATE_FINISH
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_STAGE_REWARD_PRESS, self.event_RewardPress)
			
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_901:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_901:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_901:state_Init(dt)
	if not g_game.g_panelManager:isUiPanelShow("zhanyi_waikuang") then
		return 
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] trigger3StarReward
-------------------------------------------------------------------------------
function f_guidelines_901:trigger3StarReward()

	local thirdChapter = g_game.g_panelManager:getUiPanel("zhanyi_waikuang")
	if thirdChapter then
		local stageList = thirdChapter.m_stage_list
		local stage = nil
		if stageList ~= nil then
			stage = stageList:getRewardStage()
		end
		
		if stage then
			g_game.g_userInfoManager:request3StarGuideStep()
			
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)		
			stencilPanel:enableStencil(true)
			
			local posx, posy = stage:getPosition()
			local pos = stage:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, stage:getSize(), false, false)
				
			local guidelinesBtn = f_stage_small_battle_head:static_cloneReward(stage)
			guidelinesBtn:setSwallowsTouches(false)
			
			stageList:enableScroll(false)
			
			local newPos = cc.p(pos.x, pos.y - 12)
			local newPos2 = cc.p(pos.x, pos.y - 10)
			stencilPanel:showIndicateComponent(guidelinesBtn, newPos, stage:getSize())
			stencilPanel:showIndicateAnimation(newPos2, stage:getSize())
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(901))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(901), false)
			
			self.m_current_state = self.STATE_CHECK
		end
		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] state_Check
-------------------------------------------------------------------------------
function f_guidelines_901:state_Check(dt)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_901:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_3STAR_GUIDE, self.event_3starBegin)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_STAGE_REWARD_PRESS, self.event_RewardPress)
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)
	stencilPanel:enableStencil(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_901:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_901:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_901] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_901:guidelinesNextIndex()	
	return 2
end

return f_guidelines_901