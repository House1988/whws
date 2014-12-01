--[[--
    新手指引
    点击皇子督军空位
    步骤
--]]--

local f_guidelines_404 = class("f_guidelines_404")
f_guidelines_404.__index = f_guidelines_404

-------------------------------------------------
-- @function [parent=#f_guidelines_404] ctor
-------------------------------------------------
function f_guidelines_404:ctor()	
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
-- @function [parent=#f_guidelines_404] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_404:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_404:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_404:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local dujunPanel = mainPanel.m_huangzi_dujun
		if dujunPanel then		
			local cardHeadList = dujunPanel.m_card_head_list
			if cardHeadList then
				local item = cardHeadList:getFirstCardItem()
			
				if item then		
					cardHeadList:enableScroll(false)					
						
					local stencilPanel = self.m_guidelines_manager:getComponent()
					stencilPanel:enableAllStencil(true)
					stencilPanel:scaleFullScreen(false)		
					stencilPanel:enableStencil(true)
							
					local posx, posy = item:getPosition()
					local pos = item:getParent():convertToWorldSpace(cc.p(posx, posy))			
					stencilPanel:setRectType(pos, item:getSize(), false, false)
					
					
					local guidelinesBtn = require("scripts.game.main.huangzi.f_prince_card_head_component").new()	
					guidelinesBtn:cloneCardHead(item)	
					stencilPanel:showIndicateComponent(guidelinesBtn, pos, item:getSize())
					stencilPanel:showIndicateAnimation(pos, item:getSize())
					
					guidelinesBtn.m_currentState = guidelinesBtn.STATE_EMPTY_STATE
					guidelinesBtn:updateState()
					
					
					--注册监听函数
					self.event_openhuangziList = function()
						if self.m_current_state == self.STATE_CHECK then
							self.m_current_state = self.STATE_FINISH
						end
					end
					g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_PRINCE_LIST, self.event_openhuangziList)
					
			
					self.m_current_state = self.STATE_CHECK
				end
			end
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_404:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_404:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
		
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	

	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_PRINCE_LIST, self.event_openhuangziList)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_404:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_404:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_404] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_404:guidelinesNextIndex()	
	return 5
end

return f_guidelines_404