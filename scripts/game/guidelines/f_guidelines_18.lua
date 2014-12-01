--[[--
    新手指引
    选择上阵名臣
    步骤
--]]--

local f_guidelines_18 = class("f_guidelines_18")
f_guidelines_18.__index = f_guidelines_18

-------------------------------------------------
-- @function [parent=#f_guidelines_18] ctor
-------------------------------------------------
function f_guidelines_18:ctor()	
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
-- @function [parent=#f_guidelines_18] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_18:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_18:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_18:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end	
		if not g_game.g_panelManager:isUiPanelShow("mingchenxuanze_title") then
			return 
		end
		
		local mainPanel = g_game.g_panelManager:getUiPanel("mingchenxuanze_title")
		local genghuangBtn = mainPanel.m_mingchen_xuanze_bottomTable["mingchenxuanze_change_button"]	
		if genghuangBtn then
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = genghuangBtn:getPosition()
				local pos = genghuangBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, genghuangBtn:getSize(), false, false)
				
				local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(144,53))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
			
			    local ui_geng = fc.FExtensionsImage:create()
			    ui_geng:setImage("batch_ui/geng_uizi.png")
			    ui_geng:setSize(cc.size(32,32))
			    ui_geng:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(ui_geng)
			    ui_geng:setPositionInContainer(cc.p(48,26))
			
			    local ui_huan = fc.FExtensionsImage:create()
			    ui_huan:setImage("batch_ui/huan_uizi.png")
			    ui_huan:setSize(cc.size(32,32))
			    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(ui_huan)
			    ui_huan:setPositionInContainer(cc.p(96,26))
				
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, genghuangBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, genghuangBtn:getSize())
				
				--注册监听函数
				self.event_closebuzhenlist = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN_LIST, self.event_closebuzhenlist)
				
		
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_18:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_18:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(20)
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN_LIST, self.event_closebuzhenlist)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_18:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_18:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_18] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_18:guidelinesNextIndex()	
	return 19
end


return f_guidelines_18