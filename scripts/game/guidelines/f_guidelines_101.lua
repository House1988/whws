--[[--
    新手指引
    战斗失败界面，指向布阵按钮
    步骤
--]]--

local f_guidelines_101 = class("f_guidelines_101")
f_guidelines_101.__index = f_guidelines_101

-------------------------------------------------
-- @function [parent=#f_guidelines_101] ctor
-------------------------------------------------
function f_guidelines_101:ctor()	
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
-- @function [parent=#f_guidelines_101] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_101:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_101:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_101:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_BATTLE then	
		local shibaiPanel = g_game.g_panelManager:getUiPanel("shibai")	
		
		if shibaiPanel then		
			g_game.g_guidelinesManager:setBrunchGuildline(true)	
			g_game.g_guidelinesManager:enableBtnAndDisOther("paibing")
			if not shibaiPanel:showActionIsFinish() then
				return 
			end
			local paibinBuzhenBtn = shibaiPanel.m_componentTable["shibai_paibingbuzhen_button"]
			if paibinBuzhenBtn then			
				g_game.g_userInfoManager:requestBuzhenGuidleStepToServer()
				--注册监听函数
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)
				stencilPanel:enableStencil(true)
				
				
				local posx, posy = paibinBuzhenBtn:getPosition()
				local pos = paibinBuzhenBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, paibinBuzhenBtn:getSize(), false, false)
				
			    local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(100,100))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/paibingbuzhen_anniu.png")
			    
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, paibinBuzhenBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, paibinBuzhenBtn:getSize())
				
				self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
				self.guidelinesPanel:panelInitBeforePopup()		
				stencilPanel:appendComponent(self.guidelinesPanel)
				self.guidelinesPanel:setComponentZOrder(100)
				local sizeT = self.guidelinesPanel:getSize()
				self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
				local stencilSize = stencilPanel:getStencilSize() 
				self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2+200, stencilSize.height/2-150))
				self.guidelinesPanel:setSwallowsTouches(false)
				self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(101))
				self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(101), false)
				
				local jumoToPaibing = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				guidelinesBtn:addHandleOfcomponentEvent(jumoToPaibing, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
				
				
				self.m_current_state = self.STATE_CHECK
			end
				
		end

	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_101:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_101:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()

	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)
	stencilPanel:enableStencil(false)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_101:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_101:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_101] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_101:guidelinesNextIndex()	
	return 2
end

return f_guidelines_101