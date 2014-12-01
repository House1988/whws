--[[--
    新手指引
   	指向三星弹出板 领取button
    步骤
--]]--

local f_guidelines_902 = class("f_guidelines_902")
f_guidelines_902.__index = f_guidelines_902

-------------------------------------------------
-- @function [parent=#f_guidelines_902] ctor
-------------------------------------------------
function f_guidelines_902:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_FINISH		= 3
	self.STATE_EXIT			= 4
	
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
-- @function [parent=#f_guidelines_902] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_902:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_902:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_902:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_902:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("mail_attachment") then
			return
		end
		local uiPanel = g_game.g_panelManager:getUiPanel("mail_attachment")
		uiPanel:setCloseVisible(false)
		self.event_ToNext = function()
			if self.m_current_state == self.STATE_CHECK then
				self.m_current_state = self.STATE_FINISH
			end
		end
		g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_LIQU_PRESS, self.event_ToNext)
			
		self.m_current_state = self.STATE_CHECK
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_902:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_902:state_Finish(dt)	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_LIQU_PRESS, self.event_ToNext)
			
	self.m_current_state = self.STATE_EXIT
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_902:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_902] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_902:guidelinesNextIndex()	
	return 3
end
return f_guidelines_902