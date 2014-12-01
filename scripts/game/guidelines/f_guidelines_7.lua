--[[--
    新手指引
    宠幸动画
    步骤
--]]--

local f_guidelines_7 = class("f_guidelines_7")
f_guidelines_7.__index = f_guidelines_7

-------------------------------------------------
-- @function [parent=#f_guidelines_7] ctor
-------------------------------------------------
function f_guidelines_7:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_CHECK_SKIP	= 3
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
	
	local state_check_skip = function(dt)
		self:state_CheckSkip(dt)
	end
	self.m_state_function_array[self.STATE_CHECK_SKIP] = state_check_skip
	
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
-- @function [parent=#f_guidelines_7] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_7:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_7:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_7:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_7:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("chongxing_panel") then
			self.m_current_state = self.STATE_FINISH
		else			
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(false)
			stencilPanel:scaleFullScreen(false)		
			stencilPanel:enableStencil(false)
			stencilPanel:setSwallowsTouches(false)
			
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] state_Check
-- 延迟显示指引向跳过按钮
-------------------------------------------------------------------------------
function f_guidelines_7:state_Check(dt)	
	self.m_time = self.m_time + dt
	local chongxinPanel = g_game.g_panelManager:getUiPanel("chongxing_panel")
	
	if self.m_time > 2.0 and chongxinPanel.m_chongxing_state == chongxinPanel.STATE_SHOW_FUCKING then	
		
			--注册监听函数
		self.event_chongxing_skip = function()
			if self.m_current_state == self.STATE_CHECK_SKIP then
				self.m_current_state = self.STATE_FINISH
			end
		end
		g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING_SKIP, self.event_chongxing_skip)
			
		self.m_time = 0
		self.m_current_state = self.STATE_CHECK_SKIP
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] state_CheckSkip
-- 检查是否点击了跳过
-------------------------------------------------------------------------------
function f_guidelines_7:state_CheckSkip(dt)	
	self.m_time = self.m_time + dt
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_7:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setSwallowsTouches(true)
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	stencilPanel:setVisible(false)
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING_SKIP, self.event_chongxing_skip)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_7:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_7:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_7] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_7:guidelinesNextIndex()	
	return 8
end


return f_guidelines_7