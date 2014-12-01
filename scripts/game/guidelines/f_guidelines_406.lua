--[[--
    新手指引
    指向总加成界面
    步骤
--]]--

local f_guidelines_406 = class("f_guidelines_406")
f_guidelines_406.__index = f_guidelines_406

-------------------------------------------------
-- @function [parent=#f_guidelines_406] ctor
-------------------------------------------------
function f_guidelines_406:ctor()	
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
-- @function [parent=#f_guidelines_406] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_406:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_406:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_406:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local dujunPanel = mainPanel.m_huangzi_dujun
		if dujunPanel then		
			local zongjiachenBtn = dujunPanel.m_huangzi_dujun_bottomArrTable["btn_bg_image"]
			if zongjiachenBtn then
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)
				stencilPanel:enableStencil(true)
				
				local posx, posy = zongjiachenBtn:getPosition()
				local pos = zongjiachenBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, zongjiachenBtn:getSize(), false, false)
				    
				local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(65,124))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/huanzhen2_anniu.png")
			
			    local zong_ui = fc.FShaderExtensionsImage:create(0)
			    zong_ui:setAnchorPoint(cc.p(0.5,0.5))
			    zong_ui:setImage("batch_ui/zong_uizi.png")
			    zong_ui:setSize(cc.size(32,32))
			    guidelinesBtn:appendComponent(zong_ui)
			    zong_ui:setPositionInContainer(cc.p(49,30))
			
			    local jia_ui = fc.FShaderExtensionsImage:create(0)
			    jia_ui:setAnchorPoint(cc.p(0.5,0.5))
			    jia_ui:setImage("batch_ui/jia_uizi.png")
			    jia_ui:setSize(cc.size(32,32))
			    guidelinesBtn:appendComponent(jia_ui)
			    jia_ui:setPositionInContainer(cc.p(49,62))
			
			    local cheng_ui = fc.FShaderExtensionsImage:create(0)
			    cheng_ui:setAnchorPoint(cc.p(0.5,0.5))
			    cheng_ui:setImage("batch_ui/cheng_uizi.png")
			    cheng_ui:setSize(cc.size(32,32))
			    guidelinesBtn:appendComponent(cheng_ui)
			    cheng_ui:setPositionInContainer(cc.p(49,94))
				   
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, zongjiachenBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, zongjiachenBtn:getSize())
				
				
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
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_406:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_406:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
		
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_406:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_406:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_406] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_406:guidelinesNextIndex()	
	return 7
end

return f_guidelines_406