--[[--
    新手指引
    指向布阵界面皇子督军按钮
    步骤
--]]--

local f_guidelines_403 = class("f_guidelines_403")
f_guidelines_403.__index = f_guidelines_403

-------------------------------------------------
-- @function [parent=#f_guidelines_403] ctor
-------------------------------------------------
function f_guidelines_403:ctor()	
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
-- @function [parent=#f_guidelines_403] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_403:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_403:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_403:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local huangziBtn = mainPanel.m_pageRadioBtnArr[2]
		if huangziBtn then		
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)		
			stencilPanel:enableStencil(true)
					
			local posx, posy = huangziBtn:getPosition()
			local pos = huangziBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, huangziBtn:getSize(), false, false)
			
			local guidelinesBtnPanel = fc.FContainerPanel:create()
		    guidelinesBtnPanel:setSize(cc.size(159,45))
		    guidelinesBtnPanel:setAnchorPoint(cc.p(0.5,0.5))
		
		    local huangzi_button = fc.FRadioButton:create()
		    huangzi_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
		    huangzi_button:setSize(cc.size(159,45))
		    huangzi_button:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtnPanel:appendComponent(huangzi_button)
		    huangzi_button:setPositionInContainer(cc.p(79.5,22.5))
		    huangzi_button:setSwallowsTouches(false)
		
		    local huang_uizi = fc.FExtensionsImage:create()
		    huang_uizi:setImage("batch_ui/huang_uizi.png")
		    huang_uizi:setSize(cc.size(32,32))
		    huang_uizi:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtnPanel:appendComponent(huang_uizi)
		    huang_uizi:setPositionInContainer(cc.p(42,24))
		
		    local zi_uizi = fc.FExtensionsImage:create()
		    zi_uizi:setImage("batch_ui/zi_uizi.png")
		    zi_uizi:setSize(cc.size(32,32))
		    zi_uizi:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtnPanel:appendComponent(zi_uizi)
		    zi_uizi:setPositionInContainer(cc.p(68,24))
		
		    local du_uizi = fc.FExtensionsImage:create()
		    du_uizi:setImage("batch_ui/du_uizi.png")
		    du_uizi:setSize(cc.size(32,32))
		    du_uizi:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtnPanel:appendComponent(du_uizi)
		    du_uizi:setPositionInContainer(cc.p(94,24))
		
		    local jun_uizi = fc.FExtensionsImage:create()
		    jun_uizi:setImage("batch_ui/jun_uizi.png")
		    jun_uizi:setSize(cc.size(32,32))
		    jun_uizi:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtnPanel:appendComponent(jun_uizi)
		    jun_uizi:setPositionInContainer(cc.p(120,24))
		
			stencilPanel:showIndicateComponent(guidelinesBtnPanel, pos, huangziBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, huangziBtn:getSize())
			
			local huangziSelectCall = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			huangzi_button:addHandleOfcomponentEvent(huangziSelectCall, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
			self.m_current_state = self.STATE_CHECK
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_403:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_403:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
		
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_403:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_403:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_403] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_403:guidelinesNextIndex()	
	return 4
end

return f_guidelines_403