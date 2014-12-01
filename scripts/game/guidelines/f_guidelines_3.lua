--[[--
    新手指引
    金銮殿输入年号
    步骤
--]]--
require("scripts.game.guidelines.f_guidelines_nianhao_panel")

local f_guidelines_3 = class("f_guidelines_3")
f_guidelines_3.__index = f_guidelines_3

-------------------------------------------------
-- @function [parent=#f_guidelines_3] ctor
-------------------------------------------------
function f_guidelines_3:ctor()	
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
-- @function [parent=#f_guidelines_3] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_3:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_3:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_3:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_3:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("jinluandian_bg") then
			--g_game.g_director:getRunningScene():getGameMap():enterJinluandian()
			return
		end
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:enableStencil(true)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), false, false)
--		stencilPanel:showIndicateAnimation(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2), cc.size(200,100))
		
		
		self.guidelinesPanel = f_guidelines_nianhao_panel.static_create()
		self.guidelinesPanel:panelInitBeforePopup()
--		stencilPanel:showIndicateComponent(guidelinesPanel, cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2),  cc.size(475,262))
		
		stencilPanel:appendComponent(self.guidelinesPanel)
		local stencilSize = stencilPanel:getStencilSize() 
		self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
		self.guidelinesPanel:setSwallowsTouches(true)
		
		self.guidelinesPanel:resetInputPosition()
	
		self.m_current_state = self.STATE_CHECK
		self.m_time = 0

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_3:state_Check(dt)	
	self.m_time = self.m_time + dt
	
	if self.guidelinesPanel:isFinishCreateNianhao() then
		self.m_current_state = self.STATE_FINISH
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_3:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(4)
	self.m_current_state = self.STATE_EXIT
	

	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	
	stencilPanel:deleteComponent(self.guidelinesPanel)
--	stencilPanel:hideIndicateAnimation()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_3:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_3] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_3:guidelinesNextIndex()	
	return 4
end

return f_guidelines_3