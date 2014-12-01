--[[--
    新手指引
    指向军机处界面中的升级按钮
    步骤
--]]--

local f_guidelines_35 = class("f_guidelines_35")
f_guidelines_35.__index = f_guidelines_35

-------------------------------------------------
-- @function [parent=#f_guidelines_35] ctor
-------------------------------------------------
function f_guidelines_35:ctor()	
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
-- @function [parent=#f_guidelines_35] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_35:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_35:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_35:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_35:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("junjichu_title") then
			return 
		end
		
		local junjichuMain = g_game.g_panelManager:getUiPanel("junjichu_title")
			
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local levelUpBtn = junjichuMain.m_componentTable["jjc_shengji_button"]
		if levelUpBtn then
			local posx, posy = levelUpBtn:getPosition()
			local pos = levelUpBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, levelUpBtn:getSize()["width"]/2, false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(144,53))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local sheng = fc.FShaderExtensionsImage:create(0)
		    sheng:setAnchorPoint(cc.p(0.5,0.5))
		    sheng:setImage("batch_ui/sheng1_uizi.png")
		    sheng:setSize(cc.size(32,32))
		    guidelinesBtn:appendComponent(sheng)
		    sheng:setPositionInContainer(cc.p(44,26))
		
		    local ji = fc.FShaderExtensionsImage:create(0)
		    ji:setAnchorPoint(cc.p(0.5,0.5))
		    ji:setImage("batch_ui/ji1_uizi.png")
		    ji:setSize(cc.size(32,32))
		    guidelinesBtn:appendComponent(ji)
		    ji:setPositionInContainer(cc.p(99,26))
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, levelUpBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, levelUpBtn:getSize())
		
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
				
			--升级
			local lvupBtnCallBack = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			guidelinesBtn:addHandleOfcomponentEvent(lvupBtnCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			
		end
		
		self.m_current_state = self.STATE_CHECK
		self.m_time = 0
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_35:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_35:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_35:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_35:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_35] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_35:guidelinesNextIndex()	
	return 36
end


return f_guidelines_35