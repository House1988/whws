--[[--
    新手指引
    展示皇子教育成果
    步骤
--]]--

local f_guidelines_309 = class("f_guidelines_309")
f_guidelines_309.__index = f_guidelines_309

-------------------------------------------------
-- @function [parent=#f_guidelines_309] ctor
-------------------------------------------------
function f_guidelines_309:ctor()	
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
-- @function [parent=#f_guidelines_309] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_309:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_309:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_309:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if g_game.g_panelManager:isUiPanelShow("notice_popup_panel") then
			return 
		end
		
		if not g_game.g_panelManager:isUiPanelShow("huangzi_shangshufang") then
			return 
		end
		
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:enableStencil(true)
		
	
		self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
		self.guidelinesPanel:panelInitBeforePopup()		
		stencilPanel:appendComponent(self.guidelinesPanel)
		self.guidelinesPanel:setComponentZOrder(100)
		local sizeT = self.guidelinesPanel:getSize()
		self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
		local stencilSize = stencilPanel:getStencilSize() 
		self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2+100))
		self.guidelinesPanel:setSwallowsTouches(false)
		self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(308))
		self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(308), false)
		
		local skipCallback = function()
			if self.m_current_state == self.STATE_CHECK then
				self.m_current_state = self.STATE_FINISH
			end
		end
		self.guidelinesPanel:setGuidelinesTouchCallback(skipCallback)
	
		self.m_current_state = self.STATE_CHECK

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_309:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_309:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	g_game.g_guidelinesManager:setBrunchGuildline(false)	
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
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_309:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_309:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_309] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_309:guidelinesNextIndex()	
	return 10
end

return f_guidelines_309