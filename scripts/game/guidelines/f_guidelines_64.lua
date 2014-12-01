--[[--
    新手指引
        指向排兵布阵  第二个名臣
    步骤
--]]--

local f_guidelines_64 = class("f_guidelines_64")
f_guidelines_64.__index = f_guidelines_64

-------------------------------------------------
-- @function [parent=#f_guidelines_603] ctor
-------------------------------------------------
function f_guidelines_64:ctor()	
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
-- @function [parent=#f_guidelines_64] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_64:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_64] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_64:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_64] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_64:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end
		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local buzhenPanel = mainPanel.m_paibing_buzhen	
		if buzhenPanel then
			local headList = buzhenPanel.m_card_head_list
			if headList then	
				local seceondHead = headList:getSecondCardHead()
							
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
			
				local posx, posy = seceondHead:getPosition()
				local pos = seceondHead:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, seceondHead:getSize(), false, false)
			    
			    local guidelinesBtn = require("scripts.game.main.card.fluacardheadcomponent").new()	
				guidelinesBtn:cloneCardHead2(seceondHead)	
			    
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, guidelinesBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, guidelinesBtn:getSize())
								
				local event_clickShengjiBtn = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
			    end
			   guidelinesBtn:addHandleOfcomponentEvent(event_clickShengjiBtn,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
							
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end		
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_64] state_Check
-------------------------------------------------------------------------------
function f_guidelines_64:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_64] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_64:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_64] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_64:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_64] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_64:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_64] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_64:guidelinesNextIndex()	
	return 52
end

return f_guidelines_64