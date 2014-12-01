--[[--
    新手指引
    指向跃龙门按钮
    步骤
--]]--

local f_guidelines_306 = class("f_guidelines_306")
f_guidelines_306.__index = f_guidelines_306

-------------------------------------------------
-- @function [parent=#f_guidelines_306] ctor
-------------------------------------------------
function f_guidelines_306:ctor()	
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
-- @function [parent=#f_guidelines_306] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_306:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_306] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_306:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_306] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_306:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("huangzi_qianqinggong_top") then
			return 
		end
		local donggongPanel = g_game.g_panelManager:getUiPanel("huangzi_qianqinggong_top")
		local yangxingdianPanel = donggongPanel.m_yangxindian_panel
		if yangxingdianPanel then
			local yuelongmengBtn = yangxingdianPanel.m_componentTable["hz_yxd_yuelongmen_button"]
			if yuelongmengBtn then
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)
				stencilPanel:enableStencil(true)
				
				local posx, posy = yuelongmengBtn:getPosition()
				local pos = yuelongmengBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, yuelongmengBtn:getSize(), false, false)
				
				local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(144,53))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
			
			    local yue = fc.FShaderExtensionsImage:create(0)
			    yue:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(yue)
			    yue:setPositionInContainer(cc.p(43,26))
			    yue:setImage("batch_ui/yue_uizi.png")
			    yue:setSize(cc.size(32,32))
			    
			    local long = fc.FShaderExtensionsImage:create(0)
			    long:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(long)
			    long:setPositionInContainer(cc.p(72,26))
			    long:setImage("batch_ui/long_uizi.png")
			    long:setSize(cc.size(32,32))
			    
			    local men = fc.FShaderExtensionsImage:create(0)
			    men:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(men)
			    men:setPositionInContainer(cc.p(102,27))
			    men:setImage("batch_ui/men_uizi.png")
			    men:setSize(cc.size(32,32))
										
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, yuelongmengBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, yuelongmengBtn:getSize())
				
				self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
				self.guidelinesPanel:panelInitBeforePopup()		
				stencilPanel:appendComponent(self.guidelinesPanel)
				self.guidelinesPanel:setComponentZOrder(100)
				local sizeT = self.guidelinesPanel:getSize()
				self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
				local stencilSize = stencilPanel:getStencilSize() 
				self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
				self.guidelinesPanel:setSwallowsTouches(false)
				self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(305))
				self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(305), false)
				
				
				local yuelongmengCall = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
		
				end
				guidelinesBtn:addHandleOfcomponentEvent(yuelongmengCall, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
				
		
				self.m_current_state = self.STATE_CHECK
			end
		end
		


	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_306] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_306:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_306] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_306:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_306] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_306:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_306] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_306:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_306] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_306:guidelinesNextIndex()	
	return 7
end

return f_guidelines_306