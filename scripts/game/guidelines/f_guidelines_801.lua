--[[--
    新手指引
        在残页页面，第一次引导合成
    步骤
--]]--

local f_guidelines_801 = class("f_guidelines_801")
f_guidelines_801.__index = f_guidelines_801

-------------------------------------------------
-- @function [parent=#f_guidelines_801] ctor
-------------------------------------------------
function f_guidelines_801:ctor()	
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
-- @function [parent=#f_guidelines_801] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_801:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_801:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_801:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
	
		if not g_game.g_panelManager:isUiPanelShow("bing_fa") then
			return
		end
	
		local canyePanel = g_game.g_panelManager:getUiPanel("bing_fa")
		
		if canyePanel and canyePanel.m_canMergeCanYe then
			g_game.g_userInfoManager:requestHechengGuideStep()
			
			local mergeBtn = canyePanel.m_canyeTable["btn"]
			
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)
			stencilPanel:enableStencil(true)
			
			local posx, posy = mergeBtn:getPosition()
			local pos = mergeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, mergeBtn:getSize(), false, false)
				
			local guideLineButton = fc.FScaleButton:create()
		    guideLineButton:setSize(cc.size(144,53))
		    guideLineButton:setAnchorPoint(cc.p(0.5,0.5))
		    guideLineButton:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local he = fc.FShaderExtensionsImage:create(0)
		    he:setAnchorPoint(cc.p(0.5,0.5))
		    he:setImage("batch_ui/he_uizi.png")
		    he:setSize(cc.size(32,32))
		    guideLineButton:appendComponent(he)
		    he:setPositionInContainer(cc.p(42,26))
		
		    local cheng = fc.FShaderExtensionsImage:create(0)
		    cheng:setAnchorPoint(cc.p(0.5,0.5))
		    cheng:setImage("batch_ui/cheng_uizi.png")
		    cheng:setSize(cc.size(32,32))
		    guideLineButton:appendComponent(cheng)
		    cheng:setPositionInContainer(cc.p(96,26))
		    
	    	stencilPanel:showIndicateComponent(guideLineButton, pos,mergeBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, mergeBtn:getSize())
			
			local call = function()
				if self.m_current_state == self.STATE_CHECK then
					 self.m_current_state = self.STATE_FINISH
				end
			end
			guideLineButton:addHandleOfcomponentEvent(call, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			
			self.m_current_state = self.STATE_CHECK
				
		end
		
	end		
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_801:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_801:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)
	stencilPanel:enableStencil(false)
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_801:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_801:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_801] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_801:guidelinesNextIndex()	
	return 2
end

return f_guidelines_801