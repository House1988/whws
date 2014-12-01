--[[--
    新手指引
  	 点击 开服有礼
    步骤
--]]--

local f_guidelines_48 = class("f_guidelines_48")
f_guidelines_48.__index = f_guidelines_48

-------------------------------------------------
-- @function [parent=#f_guidelines_48] ctor
-------------------------------------------------
function f_guidelines_48:ctor()	
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
-- @function [parent=#f_guidelines_48] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_48:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_48] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_48:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_48] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_48:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		g_game.g_guidelinesManager:enableBtnAndDisOther("kaifu")
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)		
		stencilPanel:enableStencil(true)
		
		local kaifuBtn = g_game.g_director:getRunningScene().m_layout_manager.layout_left_center.m_componentTable["button_open_service_gift"]
		
		if kaifuBtn then
			local posx, posy = kaifuBtn:getPosition()
			local pos = kaifuBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, kaifuBtn:getSize(), false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(85,86))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/gongnenganniu_up.png")
		    guidelinesBtn:setIconImage("batch_ui/qiandaoyouli.png",cc.p(41,41))
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, kaifuBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, kaifuBtn:getSize())
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(48))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(48), false)
			
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
			
			local toFinish = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			guidelinesBtn:addHandleOfcomponentEvent(toFinish, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

		end
	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_48] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_48:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_48] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_48:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_48] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_48:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_48] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_48:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_48] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_48:guidelinesNextIndex()	
	return 49
end

return f_guidelines_48