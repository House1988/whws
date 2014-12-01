--[[--
    新手指引
    退出后宫
    步骤
--]]--

local f_guidelines_8 = class("f_guidelines_8")
f_guidelines_8.__index = f_guidelines_8

-------------------------------------------------
-- @function [parent=#f_guidelines_8] ctor
-------------------------------------------------
function f_guidelines_8:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CLOSE_OTHER	= 2
	self.STATE_CHECK		= 3
	self.STATE_FINISH		= 4
	self.STATE_EXIT			= 5
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_closeother = function(dt)
		self:state_CloseOther(dt)
	end
	self.m_state_function_array[self.STATE_CLOSE_OTHER] = state_closeother
	
	
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
-- @function [parent=#f_guidelines_8] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_8:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_8:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_8:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_8:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME  then
		
		if not g_game.g_panelManager:isUiPanelShow("hougong_tangquangong_bg") then
			g_game.g_director:getRunningScene():getGameMap():enterBeauty()
		end
		
		g_game.g_userInfoManager:requestRecordGuidleStep(8)
		
		self.m_current_state = self.STATE_CLOSE_OTHER	
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] state_CloseOther
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_8:state_CloseOther(dt)		
		local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
		if hougongMain.m_tangquangong.m_uiFavorState == hougongMain.m_tangquangong.UI_CURBEAUTY_STATE_NONE then				
			
			
			local closeBtn = hougongMain.m_beauti_main_bg_table["hg_tqg_close_button"]
			
			if closeBtn then
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)	
				stencilPanel:enableStencil(true)
			
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
				self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(8))
				self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(8), false)
			
					
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

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_8:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_8:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(9)
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
-- @function [parent=#f_guidelines_8] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_8:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_8:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_8] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_8:guidelinesNextIndex()	
	return 9
end



return f_guidelines_8