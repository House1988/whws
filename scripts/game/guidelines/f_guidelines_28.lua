--[[--
    新手指引
    上阵美女
    步骤
--]]--

local f_guidelines_28 = class("f_guidelines_28")
f_guidelines_28.__index = f_guidelines_28

-------------------------------------------------
-- @function [parent=#f_guidelines_28] ctor
-------------------------------------------------
function f_guidelines_28:ctor()	
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
-- @function [parent=#f_guidelines_28] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_28:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_28:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_28:guidelinesNextIndex()	
	return 29
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_28:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_28:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("hougong_tangquangong_bg") then
			local beautyPalace = f_game_beauty_main.static_create()
			beautyPalace:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
		end

		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
		local tangquangong = hougongMain.m_tangquangong
		if tangquangong then
			g_game.g_userInfoManager:requestRecordGuidleStep(28)
			local item = tangquangong.m_card_head_list:getItemWithIndex(1)
			
			if item then		
				tangquangong.m_card_head_list:enableScroll(false)
					
				local posx, posy = item:getPosition()
				local pos = item:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, item:getSize(), false, false)
				
				local guidelinesBtn = require("scripts.game.main.beauty.f_game_beauty_cheer_head").new()	
				guidelinesBtn:cloneCardHead(item)	
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, item:getSize())
				stencilPanel:showIndicateAnimation(pos, item:getSize())
				
				guidelinesBtn.m_currentState = guidelinesBtn.STATE_EMPTY_STATE
				guidelinesBtn:updateState()
				
				self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
				self.guidelinesPanel:panelInitBeforePopup()		
				stencilPanel:appendComponent(self.guidelinesPanel)
				self.guidelinesPanel:setComponentZOrder(100)
				local sizeT = self.guidelinesPanel:getSize()
				self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
				local stencilSize = stencilPanel:getStencilSize() 
				self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
				self.guidelinesPanel:setSwallowsTouches(false)
				self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(28))
				self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(28), false)
				
				
				--注册监听函数
				self.event_openBeautylist = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BEAUTY_LIST_PANEL, self.event_openBeautylist)
				
		
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_28:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_28:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
	local tangquangong = hougongMain.m_tangquangong
	if tangquangong then
		tangquangong.m_card_head_list:enableScroll(true)
	end
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
		
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BEAUTY_LIST_PANEL, self.event_openBeautylist)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_28] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_28:state_Exit(dt)	
	self.m_finish = true
end


return f_guidelines_28