--[[--
    新手指引
  	 指向 打开开服有礼后的 第一个奖励的 领取button
    步骤
--]]--

local f_guidelines_49 = class("f_guidelines_49")
f_guidelines_49.__index = f_guidelines_49

-------------------------------------------------
-- @function [parent=#f_guidelines_49] ctor
-------------------------------------------------
function f_guidelines_49:ctor()	
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
-- @function [parent=#f_guidelines_49] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_49:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_49] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_49:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_49] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_49:state_Init(dt)
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("open_service_ui") then
			return 
		end
	 
	 	local openUi = g_game.g_panelManager:getUiPanel("open_service_ui")
	 	if openUi then
	 			
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)		
			stencilPanel:enableStencil(true)
			
			local accepteBtn = openUi.m_giftItemListTable[1].m_componentTable["od_accept_btn"]
			
			local posx, posy = accepteBtn:getPosition()
			local pos = accepteBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, accepteBtn:getSize(), false, false)
			
			local guideLineBtn = fc.FScaleButton:create()
		    guideLineBtn:setSize(cc.size(146,53))
		    guideLineBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guideLineBtn:setButtonImage("batch_ui/teshuanniu.png")
		
		    local od_ling = fc.FShaderExtensionsImage:create(0)
		    od_ling:setAnchorPoint(cc.p(0.5,0.5))
		    od_ling:setImage("batch_ui/ling_uizi.png")
		    od_ling:setSize(cc.size(32,32))
		    guideLineBtn:appendComponent(od_ling)
		    od_ling:setPositionInContainer(cc.p(46,26))
		
		    local od_qu = fc.FShaderExtensionsImage:create(0)
		    od_qu:setAnchorPoint(cc.p(0.5,0.5))
		    od_qu:setImage("batch_ui/qu_uizi.png")
		    od_qu:setSize(cc.size(32,32))
		    guideLineBtn:appendComponent(od_qu)
		    od_qu:setPositionInContainer(cc.p(100,26))
			
	 		stencilPanel:showIndicateComponent(guideLineBtn, pos, accepteBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, accepteBtn:getSize())
			
			local toFinish = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			guideLineBtn:addHandleOfcomponentEvent(toFinish, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
	 	end
	 	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_49] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_49:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_49] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_49:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	--其实这时已经领取过了  直接记录到5  
	g_game.g_userInfoManager:requestRecordGuidleStep(5)
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
-- @function [parent=#f_guidelines_49] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_49:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_49] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_49:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_49] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_49:guidelinesNextIndex()	
	return 50
end

return f_guidelines_49