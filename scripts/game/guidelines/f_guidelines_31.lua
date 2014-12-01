--[[--
    新手指引
    选择美女进行升级
    步骤
--]]--

local f_guidelines_31 = class("f_guidelines_31")
f_guidelines_31.__index = f_guidelines_31

-------------------------------------------------
-- @function [parent=#f_guidelines_31] ctor
-------------------------------------------------
function f_guidelines_31:ctor()	
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
-- @function [parent=#f_guidelines_31] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_31:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_31:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_31:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_31:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("gongdou_bg") then
			return 
		end
		
		local gongdouMain = g_game.g_panelManager:getUiPanel("gongdou_bg")
			
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local firstBeauty = gongdouMain:getFirstBeautyComponent()
		if firstBeauty then
			
			gongdouMain.m_page_container:enableScroll(false)
		
			local guidelinesBtn = f_game_beauty_allbeauty_card.static_clone(firstBeauty)
		
			local posx, posy = firstBeauty:getPosition()
			local pos = firstBeauty:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, guidelinesBtn:getSize()["width"]/2, false, false)
			    
    
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, guidelinesBtn:getSize())

			stencilPanel:showIndicateAnimation(cc.p(pos.x, pos.y-70), guidelinesBtn:getSize())
			
			--注册监听函数
			self.event_selectBeauty = function()
				guidelinesBtn.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)	
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_BEAUTY_CARD, self.event_selectBeauty)
			    		
		end
		
		self.m_current_state = self.STATE_CHECK
		self.m_time = 0
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_31:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_31:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	local gongdouMain = g_game.g_panelManager:getUiPanel("gongdou_bg")
	if gongdouMain then
		gongdouMain.m_page_container:enableScroll(true)
	end
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_BEAUTY_CARD, self.event_selectBeauty)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_31:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_31:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_31] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_31:guidelinesNextIndex()	
	return 32
end


return f_guidelines_31