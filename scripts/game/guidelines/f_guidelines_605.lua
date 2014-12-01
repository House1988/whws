--[[--
    新手指引
 	点击阵容2的更换按钮
    步骤
--]]--

local f_guidelines_605 = class("f_guidelines_605")
f_guidelines_605.__index = f_guidelines_605

-------------------------------------------------
-- @function [parent=#f_guidelines_605] ctor
-------------------------------------------------
function f_guidelines_605:ctor()	
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
-- @function [parent=#f_guidelines_605] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_605:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_605] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_605:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_605] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_605:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then	
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end	
		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local buzhenPanel = mainPanel.m_paibing_buzhen	
		if buzhenPanel == nil then
			return
		end
		
		local huanzhenPanel = buzhenPanel.genghuanzhenrong_panel
		
		if huanzhenPanel then
				
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(true)
			stencilPanel:enableStencil(true)
			
			local changeBtn = huanzhenPanel.m_genghuan_zhenrong_bottomTable["change_button"]
			local posx, posy = changeBtn:getPosition()
			local pos = changeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, changeBtn:getSize(), false, false)	
			
			local guidelineBtn = fc.FScaleButton:create()
		    guidelineBtn:setSize(cc.size(144,53))
		    guidelineBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelineBtn:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local ui_geng = fc.FExtensionsImage:create()
		    ui_geng:setImage("batch_ui/geng_uizi.png")
		    ui_geng:setSize(cc.size(32,32))
		    ui_geng:setAnchorPoint(cc.p(0.5,0.5))
		    guidelineBtn:appendComponent(ui_geng)
		    ui_geng:setPositionInContainer(cc.p(42,26))
		
		    local ui_huan = fc.FExtensionsImage:create()
		    ui_huan:setImage("batch_ui/huan_uizi.png")
		    ui_huan:setSize(cc.size(32,32))
		    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
		    guidelineBtn:appendComponent(ui_huan)
		    ui_huan:setPositionInContainer(cc.p(102,26))
		
		    stencilPanel:showIndicateComponent(guidelineBtn, pos, changeBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, changeBtn:getSize())
				
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(605))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(605), false)		
				
			self.m_gotoNext = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end	
			guidelineBtn:addHandleOfcomponentEvent(self.m_gotoNext, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_605] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_605:state_Check(dt)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_605] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_605:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_605] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_605:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_605] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_605:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_605] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_605:guidelinesNextIndex()	
	return 6
end

return f_guidelines_605