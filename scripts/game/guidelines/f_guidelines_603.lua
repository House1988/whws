--[[--
    新手指引
        指向换阵按钮
    步骤
--]]--

local f_guidelines_603 = class("f_guidelines_603")
f_guidelines_603.__index = f_guidelines_603

-------------------------------------------------
-- @function [parent=#f_guidelines_603] ctor
-------------------------------------------------
function f_guidelines_603:ctor()	
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
-- @function [parent=#f_guidelines_603] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_603:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_603:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_603:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end
		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local buzhenPanel = mainPanel.m_paibing_buzhen	
		if buzhenPanel then
			local huanzhenBtn = buzhenPanel.m_paibing_huangzi_bottomArrTable["paibing_card_array_huanzhen_button"]
			if huanzhenBtn then				
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
			
				local posx, posy = huanzhenBtn:getPosition()
				local pos = huanzhenBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, huanzhenBtn:getSize(), false, false)
			    
			    local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(65,124))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/huanzhen2_anniu.png")
			
			    local pb_huan_uizi = fc.FShaderExtensionsImage:create(0)
			    pb_huan_uizi:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(pb_huan_uizi)
			    pb_huan_uizi:setPositionInContainer(cc.p(49,40))
			    pb_huan_uizi:setImage("batch_ui/huan_uizi.png")
			    pb_huan_uizi:setSize(cc.size(32,32))
			    
			    local pb_zhen_uizi = fc.FShaderExtensionsImage:create(0)
			    pb_zhen_uizi:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(pb_zhen_uizi)
			    pb_zhen_uizi:setPositionInContainer(cc.p(49,82))
				pb_zhen_uizi:setImage("batch_ui/zhen_uizi.png")
    			pb_zhen_uizi:setSize(cc.size(32,32))

				stencilPanel:showIndicateComponent(guidelinesBtn, pos, huanzhenBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, huanzhenBtn:getSize())
								
				local event_clickHuanzhenBtn = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
	
			    end
			   guidelinesBtn:addHandleOfcomponentEvent(event_clickHuanzhenBtn,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
							
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end		
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] state_Check
-------------------------------------------------------------------------------
function f_guidelines_603:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_603:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_603:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_603:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_603] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_603:guidelinesNextIndex()	
	return 4
end

return f_guidelines_603