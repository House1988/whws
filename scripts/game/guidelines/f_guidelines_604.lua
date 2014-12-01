--[[--
    新手指引
  	指向点击阵容2
    步骤
--]]--

local f_guidelines_604 = class("f_guidelines_604")
f_guidelines_604.__index = f_guidelines_604

-------------------------------------------------
-- @function [parent=#f_guidelines_604] ctor
-------------------------------------------------
function f_guidelines_604:ctor()	
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
-- @function [parent=#f_guidelines_604] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_604:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_604] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_604:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_604] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_604:state_Init(dt)

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
			
			local zhenrong2Btn = huanzhenPanel.m_genghuan_zhenrongTitleTable["zhenrong2_button"]
			local posx, posy = zhenrong2Btn:getPosition()
			local pos = zhenrong2Btn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, zhenrong2Btn:getSize(), false, false)	
		
			local guideLinePanel = fc.FContainerPanel:create()
		    guideLinePanel:setSize(cc.size(159,45))
		    guideLinePanel:setAnchorPoint(cc.p(0.5,0.5))
		    
			local zhenrong2_button = fc.FRadioButton:create()
		    zhenrong2_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
		    zhenrong2_button:setSize(cc.size(159,45))
		    zhenrong2_button:setAnchorPoint(cc.p(0.5,0.5))
		    guideLinePanel:appendComponent(zhenrong2_button)
		    zhenrong2_button:setPositionInContainer(cc.p(79.5,22.5))
		    zhenrong2_button:setSwallowsTouches(false)
		    
		    local ui_zhen = fc.FExtensionsImage:create()
		    ui_zhen:setImage("batch_ui/zhen_uizi.png")
		    ui_zhen:setSize(cc.size(32,32))
		    ui_zhen:setAnchorPoint(cc.p(0.5,0.5))
		    guideLinePanel:appendComponent(ui_zhen)
		    ui_zhen:setPositionInContainer(cc.p(51,23))
		
		    local ui_rong = fc.FExtensionsImage:create()
		    ui_rong:setImage("batch_ui/rong_uizi.png")
		    ui_rong:setSize(cc.size(32,32))
		    ui_rong:setAnchorPoint(cc.p(0.5,0.5))
		    guideLinePanel:appendComponent(ui_rong)
		    ui_rong:setPositionInContainer(cc.p(79,22))
		
		    local ui_er = fc.FExtensionsImage:create()
		    ui_er:setImage("batch_ui/er_uizi.png")
		    ui_er:setSize(cc.size(32,32))
		    ui_er:setAnchorPoint(cc.p(0.5,0.5))
		    guideLinePanel:appendComponent(ui_er)
		    ui_er:setPositionInContainer(cc.p(108,22))
		    
		    stencilPanel:showIndicateComponent(guideLinePanel, pos, zhenrong2Btn:getSize())
			stencilPanel:showIndicateAnimation(pos, zhenrong2Btn:getSize())
				
			self.m_gotoNext = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end	
			zhenrong2_button:addHandleOfcomponentEvent(self.m_gotoNext, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_604] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_604:state_Check(dt)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_604] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_604:state_Finish(dt)	
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
-- @function [parent=#f_guidelines_604] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_604:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_604] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_604:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_604] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_604:guidelinesNextIndex()	
	return 5
end

return f_guidelines_604