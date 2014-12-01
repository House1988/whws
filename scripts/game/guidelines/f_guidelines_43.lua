--[[--
    新手指引
    装备详情界面，指向关闭按钮
    步骤
--]]--

local f_guidelines_43 = class("f_guidelines_43")
f_guidelines_43.__index = f_guidelines_43

-------------------------------------------------
-- @function [parent=#f_guidelines_43] ctor
-------------------------------------------------
function f_guidelines_43:ctor()	
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
-- @function [parent=#f_guidelines_43] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_43:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_43:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_43:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_43:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("equip_detial_panel") then
			return 
		end
		
		g_game.g_guidelinesManager:enableBtnAndDisOther("equipDetailClose")
		
		local equipDetailPanel = g_game.g_panelManager:getUiPanel("equip_detial_panel")
		if equipDetailPanel then
			local closeBtn = equipDetailPanel.m_componentTable["close"]
		
			if closeBtn then		
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = closeBtn:getPosition()
				local pos = closeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, closeBtn:getSize(), false, false)
				
			    local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(52,52))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/guanbi_up.png")
										
						    

				stencilPanel:showIndicateComponent(guidelinesBtn, pos, closeBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, closeBtn:getSize())
				
				--注册监听函数
				self.event_closeEquipPanel = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_CLOSE_EQUEP_DETAIL, self.event_closeEquipPanel)
				
    
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_43:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_43:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	g_game.g_userInfoManager:requestRecordGuidleStep(58)
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	stencilPanel:setVisible(true)

	if g_game.g_panelManager:isUiPanelShow("equip_detial_panel") then
		g_game.g_panelManager:removeUiPanel("equip_detial_panel")
	end

	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_CLOSE_EQUEP_DETAIL, self.event_closeEquipPanel)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_43:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_43] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_43:guidelinesNextIndex()	
	return 57
end



return f_guidelines_43