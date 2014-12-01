--[[--
    新手指引
    金銮殿剧情提示
    步骤
--]]--

local f_guidelines_2 = class("f_guidelines_2")
f_guidelines_2.__index = f_guidelines_2

-------------------------------------------------
-- @function [parent=#f_guidelines_2] ctor
-------------------------------------------------
function f_guidelines_2:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_PRE_SHOW		= 2
	self.STATE_CHECK		= 3
	self.STATE_FINISH		= 4
	self.STATE_EXIT			= 5
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_preShow = function(dt)
		self:state_PreShow(dt)
	end
	self.m_state_function_array[self.STATE_PRE_SHOW] = state_preShow
	
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
-- @function [parent=#f_guidelines_2] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_2:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_2:update(dt)	
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_2:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_2:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then

		if not g_game.g_panelManager:isUiPanelShow("jinluandian_bg") then
			g_game.g_director:getRunningScene():getGameMap():enterJinluandian()
			return
		end
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:enableStencil(false)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
		stencilPanel:hideIndicateAnimation()
		
		self.m_current_state = self.STATE_PRE_SHOW
		self.m_time = 0

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] state_PreShow
-- 展示万岁
-------------------------------------------------------------------------------
function f_guidelines_2:state_PreShow(dt)	
	self.m_time = self.m_time + dt
	if self.m_time > 3.0 then
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableStencil(true)
		
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(2))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(2), false)
			self.guidelinesPanel:showJiantouAnimation(true)
			
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
-- @function [parent=#f_guidelines_2] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_2:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_2:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_2:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_2] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_2:guidelinesNextIndex()	
	return 3
end

return f_guidelines_2