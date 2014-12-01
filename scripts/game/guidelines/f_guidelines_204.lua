--[[--
    新手指引
    竞技场界面，指向挑战按钮
    步骤
--]]--

local f_guidelines_204 = class("f_guidelines_204")
f_guidelines_204.__index = f_guidelines_204

-------------------------------------------------
-- @function [parent=#f_guidelines_204] ctor
-------------------------------------------------
function f_guidelines_204:ctor()	
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
-- @function [parent=#f_guidelines_204] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_204:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_204] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_204:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_204] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_204:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then	
	
		if not g_game.g_panelManager:isUiPanelShow("qgyd_bottom") then
			return 
		end	
		
		local mainPanel = g_game.g_panelManager:getUiPanel("qgyd_bottom")
		local pvpScene = mainPanel.m_pvpScene
		if pvpScene then		
			local duihuanBtn = pvpScene.m_componentTable["qgyd_duihuan_button"]
			--注册监听函数
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(true)
			stencilPanel:enableStencil(true)
				
			local posx, posy = duihuanBtn:getPosition()
			local pos = duihuanBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, duihuanBtn:getSize(), false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(173,53))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local gong = fc.FExtensionsImage:create()
		    gong:setImage("batch_ui/gong2_uizi.png")
		    gong:setSize(cc.size(32,32))
		    gong:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(gong)
		    gong:setPositionInContainer(cc.p(26,26))
		
		    local ji = fc.FExtensionsImage:create()
		    ji:setImage("batch_ui/ji6_uizi.png")
		    ji:setSize(cc.size(32,32))
		    ji:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(ji)
		    ji:setPositionInContainer(cc.p(56,26))
		
		    local zhi = fc.FExtensionsImage:create()
		    zhi:setImage("batch_ui/zhi_uizi.png")
		    zhi:setSize(cc.size(32,32))
		    zhi:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(zhi)
		    zhi:setPositionInContainer(cc.p(86,26))
		
		    local dui = fc.FExtensionsImage:create()
		    dui:setImage("batch_ui/dui2_uizi.png")
		    dui:setSize(cc.size(32,32))
		    dui:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(dui)
		    dui:setPositionInContainer(cc.p(116,26))
		
		    local huan = fc.FExtensionsImage:create()
		    huan:setImage("batch_ui/huan_uizi.png")
		    huan:setSize(cc.size(32,32))
		    huan:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(huan)
		    huan:setPositionInContainer(cc.p(146,26))
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, duihuanBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, duihuanBtn:getSize())
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2+50, stencilSize.height/2-100))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(204))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(204), false)
						
			local event_clickDuihuan = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
		    end
		   guidelinesBtn:addHandleOfcomponentEvent(event_clickDuihuan,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
						
	
			self.m_current_state = self.STATE_CHECK
		end		
			
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_204] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_204:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_204] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_204:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_204] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_204:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_204] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_204:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_204] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_204:guidelinesNextIndex()	
	return 6
end

return f_guidelines_204