--[[--
    新手指引
    圈住第一个 紫卡 年羹尧
    步骤
--]]--

local f_guidelines_63 = class("f_guidelines_63")
f_guidelines_63.__index = f_guidelines_63

-------------------------------------------------
-- @function [parent=#f_guidelines_63] ctor
-------------------------------------------------
function f_guidelines_63:ctor()	
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
-- @function [parent=#f_guidelines_63] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_63:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_63:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_63:guidelinesNextIndex()	
	return 15
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_63:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_63:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("keju_qindiandachen") then
			return 
		end
		
		
		local shijuan = g_game.g_panelManager:getUiPanel("keju_qindiandachen")
		local shijuanTable = shijuan.m_mingChenCards[1]	
		if shijuanTable then
			local qindianBtn = shijuanTable["keju_card_qindian_button"]
			if qindianBtn then		
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = qindianBtn:getPosition()
				local pos = qindianBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, qindianBtn:getSize(), false, false)
				
			    local guidelinesBtn = fc.FTextButton:create()
			    guidelinesBtn:setSize(cc.size(144,51))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
			   if LANGUAGE_TYPE == 3 then
			   		 guidelinesBtn:setText("欽   點",cc.c3b(189,74,22))
			   else
			   		 guidelinesBtn:setText("钦   点",cc.c3b(189,74,22))
			   end
			   
			    guidelinesBtn:setSelectActionEnbaled(true)
				
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, qindianBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, qindianBtn:getSize())
				
				--注册监听函数
				self.event_openkeju = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				guidelinesBtn:addHandleOfcomponentEvent(self.event_openkeju, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_63:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_63:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(16)
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	stencilPanel:setVisible(false)
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)
	stencilPanel:enableStencil(false)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_63] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_63:state_Exit(dt)	
	self.m_finish = true
end


return f_guidelines_63