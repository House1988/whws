--[[--
    新手指引
  	   打开精英副本，指向第一个开启的精英副本
    步骤
--]]--

local f_guidelines_505 = class("f_guidelines_505")
f_guidelines_505.__index = f_guidelines_505

-------------------------------------------------
-- @function [parent=#f_guidelines_505] ctor
-------------------------------------------------
function f_guidelines_505:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
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
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_505:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_505:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_505:state_Init(dt)
	local eliteStageMain = g_game.g_panelManager:getUiPanel("elite_stage")
	
	if eliteStageMain and eliteStageMain.m_selectStage then
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		eliteStageMain.m_page_container:enableScroll(false)
		
		local posx, posy = eliteStageMain.m_selectStage:getPosition()
		local pos = eliteStageMain.m_selectStage:getParent():convertToWorldSpace(cc.p(posx, posy))			
		stencilPanel:setRectType(pos, eliteStageMain.m_selectStage:getSize(), false, false)
		
		local createPanel = f_stage_elite_stage_card.static_clone(eliteStageMain.m_selectStage)
		
		local clickCallback = function(obj)
			if self.m_current_state == self.STATE_CHECK then
				self.m_current_state = self.STATE_FINISH
				self.m_time = 0
			end
		end
		createPanel:setSelectCallback(clickCallback)
		
		stencilPanel:showIndicateComponent(createPanel, pos, eliteStageMain.m_selectStage:getSize())
		stencilPanel:showIndicateAnimation(pos, eliteStageMain.m_selectStage:getSize())
		
		self.m_current_state = self.STATE_CHECK
		self.m_time = 0
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] state_Check
-------------------------------------------------------------------------------
function f_guidelines_505:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_505:state_Finish(dt)	
	self.m_gotoNext = function()
		if self.m_current_state == self.STATE_FINISH then
				self.m_current_state = self.STATE_EXIT
			end
		end	
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_TOUCH_ELITE_CARD, self.m_gotoNext)
		
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
-- @function [parent=#f_guidelines_505] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_505:state_Exit(dt)	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_TOUCH_ELITE_CARD, self.m_gotoNext)
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_505:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_505] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_505:guidelinesNextIndex()	
	return 6
end

return f_guidelines_505