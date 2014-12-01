--[[--
    新手指引
         精英副本，弹出 ，点击开战
    步骤
--]]--

local f_guidelines_506 = class("f_guidelines_506")
f_guidelines_506.__index = f_guidelines_506

-------------------------------------------------
-- @function [parent=#f_guidelines_506] ctor
-------------------------------------------------
function f_guidelines_506:ctor()	
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
-- @function [parent=#f_guidelines_506] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_506:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_506] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_506:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_506] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_506:state_Init(dt)
	if not g_game.g_panelManager:isUiPanelShow("elite_stage_battle") then
		return 
	end
	
	local pvpEliteFight = g_game.g_panelManager:getUiPanel("elite_stage_battle") 
	
	if pvpEliteFight then
		local guideLineBtn = pvpEliteFight.m_componentTable["battle_btn"]
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local posx, posy = guideLineBtn:getPosition()
		local pos = guideLineBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
		stencilPanel:setRectType(pos, guideLineBtn:getSize(), false, false)
		
		local battle_btn = fc.FScaleButton:create()
	    battle_btn:setSize(cc.size(128,92))
	    battle_btn:setAnchorPoint(cc.p(0.5,0.5))
	    battle_btn:setButtonImage("batch_ui/kaizhan_anniu.png")
	    
    	stencilPanel:showIndicateComponent(battle_btn, pos, guideLineBtn:getSize())
		stencilPanel:showIndicateAnimation(pos, guideLineBtn:getSize())
			
		self.m_gotoNext = function()
			if self.m_current_state == self.STATE_CHECK then
				self.m_current_state = self.STATE_FINISH
			end
		end	
		g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GOTO_ELITE, self.m_gotoNext)
		
		self.m_current_state = self.STATE_CHECK
	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_506] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_506:state_Check(dt)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_506] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_506:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GOTO_ELITE, self.m_gotoNext)
	
	g_game.g_guidelinesManager:setBrunchGuildline(false)
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
-- @function [parent=#f_guidelines_506] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_506:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_506] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_506:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_506] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_506:guidelinesNextIndex()	
	return 7
end

return f_guidelines_506