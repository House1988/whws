--[[--
    新手指引
    商城选秀
    步骤
--]]--

local f_guidelines_1003 = class("f_guidelines_1003")
f_guidelines_1003.__index = f_guidelines_1003

-------------------------------------------------
-- @function [parent=#f_guidelines_1003] ctor
-------------------------------------------------
function f_guidelines_1003:ctor()	
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
-- @function [parent=#f_guidelines_1003] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_1003:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_1003:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_1003:guidelinesNextIndex()	
	return 4
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_1003:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_1003:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("keju_xuanxiu_shangcheng") then
			return 
		end
		
		
		local shangchengPanel = g_game.g_panelManager:getUiPanel("keju_xuanxiu_shangcheng")
		local xuanxiuPanel = shangchengPanel.m_xuanxiu	
		if xuanxiuPanel then
			local luoBtn = xuanxiuPanel.m_componentTable["xx_dianxuan_button"]
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

			    local xuan3 = fc.FExtensionsImage:create()
			    xuan3:setImage("batch_ui/xuan_uizi.png")
			    xuan3:setSize(cc.size(32,32))
			    xuan3:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(xuan3)
			    xuan3:setPositionInContainer(cc.p(52,26))

			    local xiu3 = fc.FExtensionsImage:create()
			    xiu3:setImage("batch_ui/xiu_uizi.png")
			    xiu3:setSize(cc.size(32,32))
			    xiu3:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(xiu3)
			    xiu3:setPositionInContainer(cc.p(94,26))
				
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, luoBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, luoBtn:getSize())
				
				--注册监听函数
				local over = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				guidelinesBtn:addHandleOfcomponentEvent(over, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_1003:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_1003:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)
	stencilPanel:enableStencil(false)
	
	g_game.g_guidelinesManager:setBrunchGuildline(false)	
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_KEJU, self.event_openkeju)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_1003] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_1003:state_Exit(dt)	
	self.m_finish = true
end


return f_guidelines_1003