--[[--
    新手指引
    商城纳贤抽卡
    步骤
--]]--

local f_guidelines_14 = class("f_guidelines_14")
f_guidelines_14.__index = f_guidelines_14

-------------------------------------------------
-- @function [parent=#f_guidelines_14] ctor
-------------------------------------------------
function f_guidelines_14:ctor()	
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
-- @function [parent=#f_guidelines_14] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_14:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_14:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_14:guidelinesNextIndex()	
	return 63
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_14:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_14:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("keju_xuanxiu_shangcheng") then
			return 
		end
		
		
		local shangchengPanel = g_game.g_panelManager:getUiPanel("keju_xuanxiu_shangcheng")
		local kejuPanel = shangchengPanel.m_keju	
		if kejuPanel then
			local luoBtn = kejuPanel.m_componentTable["kj_luo_dian_button"]
			if luoBtn then		
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = luoBtn:getPosition()
				local pos = luoBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, luoBtn:getSize(), false, false)
				
				local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(146,53))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/teshuanniu.png")
			
			    local kai3 = fc.FExtensionsImage:create()
			    kai3:setImage("batch_ui/kai_uizi.png")
			    kai3:setSize(cc.size(32,32))
			    kai3:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(kai3)
			    kai3:setPositionInContainer(cc.p(52,26))
			
			    local kao3 = fc.FExtensionsImage:create()
			    kao3:setImage("batch_ui/kao.png")
			    kao3:setSize(cc.size(32,32))
			    kao3:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(kao3)
			    kao3:setPositionInContainer(cc.p(94,26))
				
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, luoBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, luoBtn:getSize())
				
				self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
				self.guidelinesPanel:panelInitBeforePopup()		
				stencilPanel:appendComponent(self.guidelinesPanel)
				self.guidelinesPanel:setComponentZOrder(100)
				local sizeT = self.guidelinesPanel:getSize()
				self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
				local stencilSize = stencilPanel:getStencilSize() 
				self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
				self.guidelinesPanel:setSwallowsTouches(false)
				self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(14))
				self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(14), false)
				
				--注册监听函数
				self.event_openkeju = function()
					if self.m_current_state == self.STATE_CHECK then
						stencilPanel:enableStencil(false)
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_KEJU, self.event_openkeju)
				
		
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_14:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_14:state_Finish(dt)	
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
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_KEJU, self.event_openkeju)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_14] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_14:state_Exit(dt)	
	self.m_finish = true
end


return f_guidelines_14