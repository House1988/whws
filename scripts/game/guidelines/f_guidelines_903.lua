--[[--
    新手指引
   指向关闭按钮
    步骤
--]]--

local f_guidelines_903 = class("f_guidelines_903")
f_guidelines_903.__index = f_guidelines_903

-------------------------------------------------
-- @function [parent=#f_guidelines_903] ctor
-------------------------------------------------
function f_guidelines_903:ctor()	
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
-- @function [parent=#f_guidelines_903] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_903:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_903:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_903:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_903:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("zhanyi_waikuang") then
			return
		end
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)		
		stencilPanel:enableStencil(true)
		
		local smallPanel = g_game.g_panelManager:getUiPanel("zhanyi_waikuang")
		local close = smallPanel.m_battlePanel_title["zy_close_button"]
		
		if close then
			local posx, posy = close:getPosition()
			local pos = close:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, close:getSize(), false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
   			guidelinesBtn:setSize(cc.size(56,56))
   			guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
    		guidelinesBtn:setButtonImage("batch_ui/guanbi_up.png")
			
   			stencilPanel:showIndicateComponent(guidelinesBtn, pos, close:getSize())
			stencilPanel:showIndicateAnimation(pos, close:getSize())
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(903))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(903), false)
			
			local goToNext = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			guidelinesBtn:addHandleOfcomponentEvent(goToNext, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
		
		end

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_903:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_903:state_Finish(dt)	
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)
	stencilPanel:enableStencil(false)
	
	self.m_current_state = self.STATE_EXIT
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_903:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_903] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_903:guidelinesNextIndex()	
	return 4
end
return f_guidelines_903