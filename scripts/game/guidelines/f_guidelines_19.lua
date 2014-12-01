--[[--
    新手指引
      选择名臣后在派兵布阵界面点关闭
    步骤
--]]--

local f_guidelines_19 = class("f_guidelines_19")
f_guidelines_19.__index = f_guidelines_19

-------------------------------------------------
-- @function [parent=#f_guidelines_19] ctor
-------------------------------------------------
function f_guidelines_19:ctor()	
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
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_19:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_19:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_19:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end	
		if g_game.g_panelManager:isUiPanelShow("mingchenxuanze_title") then
			return 
		end
		
		g_game.g_guidelinesManager:enableBtnAndDisOther("paibingClose")
		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local closeBtn = mainPanel.m_paibing_huangziTopTable["close_button"]	
		if closeBtn then
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = closeBtn:getPosition()
				local pos = closeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, closeBtn:getSize(), false, false)
				
				local guidelinesBtn = fc.FScaleButton:create()
    			guidelinesBtn:setButtonImage("batch_ui/guanbi_up.png")

				stencilPanel:showIndicateComponent(guidelinesBtn, pos, closeBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, closeBtn:getSize())
								
				
				--注册监听函数
				self.event_closebuzhen = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN, self.event_closebuzhen)
				
		
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_19:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_19:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	g_game.g_userInfoManager:requestRecordGuidleStep(20)
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN, self.event_closebuzhen)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_19:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_19:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_19] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_19:guidelinesNextIndex()	
	return 20
end


return f_guidelines_19