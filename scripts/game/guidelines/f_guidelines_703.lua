--[[--
    新手指引
      打开残页 ，选中最后一个碎片
    步骤
--]]--

local f_guidelines_703 = class("f_guidelines_703")
f_guidelines_703.__index = f_guidelines_703

-------------------------------------------------
-- @function [parent=#f_guidelines_703] ctor
-------------------------------------------------
function f_guidelines_703:ctor()	
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
	
	self.m_nextIndex = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_703:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_703:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_703:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
	
		local canyePanel = g_game.g_panelManager:getUiPanel("bing_fa")
		
		if canyePanel then
			--获得 一个残页位置
			local emptyPosition = canyePanel:emptyPositionStaticClone()
			if emptyPosition == nil then
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(false)
				stencilPanel:scaleFullScreen(false)
				stencilPanel:enableStencil(false)
				
				self.m_nextIndex = 5
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			else
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)
				stencilPanel:enableStencil(true)
				
				local posx, posy = emptyPosition["canYeRound"]:getPosition()
				local pos = emptyPosition["canYeRound"]:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, emptyPosition["canYeRound"]:getSize(), false, false)
				
				require("scripts.auto.auto_canYeRound")
				local guideLineRound = createcanYeRound()
				local item = guideLineRound["canYeRound"]
				guideLineRound["itemIcon"]:setImage(emptyPosition["imagePath"])
				guideLineRound["itemIcon"]:setImageType(2)	
				guideLineRound["number_text"]:setString("0")	
				
				stencilPanel:showIndicateComponent(item, pos,emptyPosition["canYeRound"]:getSize())
				stencilPanel:showIndicateAnimation(pos, emptyPosition["canYeRound"]:getSize())
				
				local call = function()
					if self.m_current_state == self.STATE_CHECK then
						 self.m_current_state = self.STATE_FINISH
					end
				end
				guideLineRound["lueduoBtn"]:addHandleOfcomponentEvent(call, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
				
				self.m_nextIndex = 4
			end
			
		end
		
		self.m_current_state = self.STATE_CHECK
	
	end		
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_703:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_703:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
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
-- @function [parent=#f_guidelines_703] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_703:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_703:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_703] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_703:guidelinesNextIndex()	
	return self.m_nextIndex
end

return f_guidelines_703