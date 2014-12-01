--[[--
    新手指引
    点击宫斗中的关闭按钮
    步骤
--]]--

local f_guidelines_33 = class("f_guidelines_33")
f_guidelines_33.__index = f_guidelines_33

-------------------------------------------------
-- @function [parent=#f_guidelines_33] ctor
-------------------------------------------------
function f_guidelines_33:ctor()	
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
-- @function [parent=#f_guidelines_33] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_33:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_33:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_33:guidelinesNextIndex()	
	return 8
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_33:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_33:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		
		if not g_game.g_panelManager:isUiPanelShow("gongdou_bg") then
			return 
		end
		
		if g_game.g_panelManager:isUiPanelShow("notice_popup_panel") then
			return 
		end
		
		local gongdouMain = g_game.g_panelManager:getUiPanel("gongdou_bg")
			
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local closeBtn = gongdouMain.m_gongdouBg_table["gd_close_button"]
		if closeBtn then			
			local posx, posy = closeBtn:getPosition()
			local pos = closeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, closeBtn:getSize()["width"]/2, false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
   			guidelinesBtn:setButtonImage("batch_ui/guanbi_up.png")
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, closeBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, closeBtn:getSize())
		
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
				
			--升级
			local closeBtnCallBack = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			guidelinesBtn:addHandleOfcomponentEvent(closeBtnCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_33:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_33:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_33] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_33:state_Exit(dt)	
	self.m_finish = true
end

return f_guidelines_33