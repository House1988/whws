--[[--
    新手指引
    竞技场界面，指向一个角色，进行挑战
    步骤
--]]--

local f_guidelines_203 = class("f_guidelines_203")
f_guidelines_203.__index = f_guidelines_203

-------------------------------------------------
-- @function [parent=#f_guidelines_203] ctor
-------------------------------------------------
function f_guidelines_203:ctor()	
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
-- @function [parent=#f_guidelines_203] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_203:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_203] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_203:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_203] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_203:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
	
		if not g_game.g_panelManager:isUiPanelShow("qgyd_bottom") then
			return 
		end		
		local mainPanel = g_game.g_panelManager:getUiPanel("qgyd_bottom")
		if mainPanel then	
					
			--注册监听函数
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)
			stencilPanel:enableStencil(true)
			
			if mainPanel then
				local qgydScene = mainPanel.m_pvpScene
				
				if qgydScene then
					local gongjiNum = qgydScene.m_componentTable["qgyd_baochi_num_label"]
				
					local posx, posy = gongjiNum:getPosition()
					local pos = gongjiNum:getParent():convertToWorldSpace(cc.p(posx, posy))			
					
					stencilPanel:showIndicateAnimation(pos, gongjiNum:getSize())
				end
			end
			
		
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2+50, stencilSize.height/2-100))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(203))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(203), false)
			
			local skipCallback = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			stencilPanel:addHandleOfcomponentEvent(skipCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
--			self.guidelinesPanel:setGuidelinesTouchCallback(skipCallback)
			
			self.m_current_state = self.STATE_CHECK
		
		end

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_203] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_203:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_203] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_203:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_203] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_203:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_203] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_203:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_203] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_203:guidelinesNextIndex()	
	return 4
end

return f_guidelines_203