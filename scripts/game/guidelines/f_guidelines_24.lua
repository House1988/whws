--[[--
    新手指引
    指向主界面 选秀按钮，用于美女选秀
    步骤
--]]--

local f_guidelines_24 = class("f_guidelines_24")
f_guidelines_24.__index = f_guidelines_24

-------------------------------------------------
-- @function [parent=#f_guidelines_24] ctor
-------------------------------------------------
function f_guidelines_24:ctor()	
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
-- @function [parent=#f_guidelines_24] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_24:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_24:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_24:guidelinesNextIndex()	
	return 25
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_24:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_24:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		g_game.g_userInfoManager:requestRecordGuidleStep(24)
		
		g_game.g_guidelinesManager:enableBtnAndDisOther("xuanxiu")
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)		
		stencilPanel:enableStencil(true)
		
		local xuanxiuBtn = g_game.g_director:getRunningScene().m_layout_manager.layout_left_center.m_componentTable["button_xuanxiu"]
		
		if xuanxiuBtn then
			local posx, posy = xuanxiuBtn:getPosition()
			local pos = xuanxiuBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, xuanxiuBtn:getSize()["width"]/2, false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
   			guidelinesBtn:setSize(cc.size(82,82))
    	    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
    		guidelinesBtn:setButtonImage("batch_ui/gongnenganniu_up.png")
   			guidelinesBtn:setIconImage("batch_ui/xuanxiu.png",cc.p(41,41))
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, xuanxiuBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, xuanxiuBtn:getSize())
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(24))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(24), false)
			
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
			
			--注册监听函数
			self.event_openshangcheng = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SHANGCHENG, self.event_openshangcheng)
			
		end

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_24:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_24:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end

	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SHANGCHENG, self.event_openshangcheng)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_24] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_24:state_Exit(dt)	
	self.m_finish = true
end


return f_guidelines_24