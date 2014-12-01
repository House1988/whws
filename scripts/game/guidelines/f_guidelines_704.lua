--[[--
    新手指引
      选中第一个 碎片 掠夺 btn
    步骤
--]]--

local f_guidelines_704 = class("f_guidelines_704")
f_guidelines_704.__index = f_guidelines_704

-------------------------------------------------
-- @function [parent=#f_guidelines_704] ctor
-------------------------------------------------
function f_guidelines_704:ctor()	
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
-- @function [parent=#f_guidelines_704] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_704:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_704:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_704:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
	
		local lveduoPanel = g_game.g_panelManager:getUiPanel("lueduo_panel")
		
		if lveduoPanel then
			--获得 一个残页位置
			local firstOne = lveduoPanel.m_componentArr[1]

			if firstOne ~= nil then
				
				local luoduoBtn = firstOne.m_componentTable["btn"]
				
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)
				stencilPanel:enableStencil(true)
				
				local posx, posy = luoduoBtn:getPosition()
				local pos = luoduoBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, luoduoBtn:getSize(), false, false)
				
			 	local btn = fc.FScaleButton:create()
			    btn:setSize(cc.size(80,79))
			    btn:setAnchorPoint(cc.p(0.5,0.5))
			    btn:setButtonImage("batch_ui/lueduo_anniu.png")
			    			
				stencilPanel:showIndicateComponent(btn, pos,luoduoBtn:getSize())
				stencilPanel:showIndicateAnimation(pos,luoduoBtn:getSize())
				
				local call = function()
					if self.m_current_state == self.STATE_CHECK then
						 self.m_current_state = self.STATE_FINISH
					end
				end
				btn:addHandleOfcomponentEvent(call, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
				
			end
		
		self.m_current_state = self.STATE_CHECK
	
		end
	
	end		
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_704:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_704:state_Finish(dt)	
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
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_704:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_704:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_704] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_704:guidelinesNextIndex()	
	return 5
end

return f_guidelines_704