--[[--
    新手指引
    皇子新手指引第一步，怀孕后指向后宫关闭
    步骤
--]]--

local f_guidelines_301 = class("f_guidelines_301")
f_guidelines_301.__index = f_guidelines_301

-------------------------------------------------
-- @function [parent=#f_guidelines_301] ctor
-------------------------------------------------
function f_guidelines_301:ctor()	
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
	
	self.m_is_start_current_guide = false
	
	--注册监听函数
	self.event_getPrince = function()
		self.m_is_start_current_guide = true	
		g_game.g_guidelinesManager:setBrunchGuildline(true)			
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GET_PRINCE, self.event_getPrince)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_301:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_301:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_301:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then	
		if self.m_is_start_current_guide == true then	
			g_game.g_userInfoManager:requestHuangziGuidleStepToServer()
			
			g_game.g_panelManager:removeUiPanel("jinluandian_bg")
			
			g_game.g_guidelinesManager:enableBtnAndDisOther("donggong")
			local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)	
			stencilPanel:enableStencil(true)
			
		
			g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GET_PRINCE, self.event_getPrince)
	
			local closeBtn = hougongMain.m_beauti_main_bg_table["hg_tqg_close_button"]
			
			if closeBtn then
				local posx, posy = closeBtn:getPosition()
				local pos = closeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setCircleType(pos, closeBtn:getSize()["width"]/2, false, false)
				    
	    
				local guidelinesBtn = fc.FScaleButton:create()
	   			guidelinesBtn:setButtonImage("batch_ui/guanbi_up.png")
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, closeBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, closeBtn:getSize())
				
				self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
				self.guidelinesPanel:panelInitBeforePopup()		
				stencilPanel:appendComponent(self.guidelinesPanel)
				self.guidelinesPanel:setComponentZOrder(100)
				local sizeT = self.guidelinesPanel:getSize()
				self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
				local stencilSize = stencilPanel:getStencilSize() 
				self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
				self.guidelinesPanel:setSwallowsTouches(false)
				self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(301))
				self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(301), false)
				
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
				
				--注册监听函数
				self.event_closeHougong = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_HOUGONG, self.event_closeHougong)
			
			end
			
		end
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_301:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_301:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end	
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_HOUGONG, self.event_closeHougong)


end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_301:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_301:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_301] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_301:guidelinesNextIndex()	
	return 2
end

return f_guidelines_301