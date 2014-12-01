--[[--
    新手指引
    选择皇子界面，点击确定
    步骤
--]]--

local f_guidelines_405 = class("f_guidelines_405")
f_guidelines_405.__index = f_guidelines_405

-------------------------------------------------
-- @function [parent=#f_guidelines_405] ctor
-------------------------------------------------
function f_guidelines_405:ctor()	
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
-- @function [parent=#f_guidelines_405] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_405:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_405:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_405:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("huangzi_xuanze") then
			return 
		end
		local dujunXuanzePanel = g_game.g_panelManager:getUiPanel("huangzi_xuanze")
		local quedingBtn = dujunXuanzePanel.m_componentTable["hzxz_queding_button"]
		if quedingBtn then
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)
			stencilPanel:enableStencil(true)
			
			local posx, posy = quedingBtn:getPosition()
			local pos = quedingBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, quedingBtn:getSize(), false, false)
			    
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(144,53))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local que = fc.FShaderExtensionsImage:create(0)
		    que:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(que)
		    que:setPositionInContainer(cc.p(44,26))
		    que:setImage("batch_ui/que_uizi.png")
		    que:setSize(cc.size(32,32))
		    
		    local ding = fc.FShaderExtensionsImage:create(0)
		    ding:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(ding)
		    ding:setPositionInContainer(cc.p(100,26))
		    ding:setImage("batch_ui/ding_uizi.png")
		    ding:setSize(cc.size(32,32))    
			    
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, quedingBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, quedingBtn:getSize())
			
			local quedingCall = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			guidelinesBtn:addHandleOfcomponentEvent(quedingCall, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_405:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_405:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
		
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_405:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_405:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_405] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_405:guidelinesNextIndex()	
	return 6
end

return f_guidelines_405