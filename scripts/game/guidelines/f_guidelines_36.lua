--[[--
    新手指引
    选择名臣，进行升级
    步骤
--]]--

local f_guidelines_36 = class("f_guidelines_36")
f_guidelines_36.__index = f_guidelines_36

-------------------------------------------------
-- @function [parent=#f_guidelines_36] ctor
-------------------------------------------------
function f_guidelines_36:ctor()	
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
-- @function [parent=#f_guidelines_36] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_36:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_36:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_36:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_36:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("mingchen_shengji") then
			return 
		end
		
		local mingchenLevelUpMain = g_game.g_panelManager:getUiPanel("mingchen_shengji")
			
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local firstMingchen = mingchenLevelUpMain:getFirstMingchenComponent()
		if firstMingchen then		
			mingchenLevelUpMain.m_page_container:enableScroll(false)
		
			local guidelinesBtn = f_mingchen_shengji_card.static_clone(firstMingchen)
		
			local posx, posy = firstMingchen:getPosition()
			local pos = firstMingchen:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, guidelinesBtn:getSize()["width"]/2, false, false)
			    
    
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, guidelinesBtn:getSize())

			stencilPanel:showIndicateAnimation(cc.p(pos.x, pos.y-70), guidelinesBtn:getSize())
			
			guidelinesBtn:setData(firstMingchen:getData())  
			 
			--注册监听函数
			self.event_selectMingcheng = function()
				guidelinesBtn:setDuigouVisible(true)		
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_MINGCHENG_CARD, self.event_selectMingcheng)
			guidelinesBtn:setDuigouVisible(false)	
		end
		
		self.m_current_state = self.STATE_CHECK
		self.m_time = 0
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_36:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_36:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	local mingchenLevelUpMain = g_game.g_panelManager:getUiPanel("mingchen_shengji")
	if mingchenLevelUpMain then
		mingchenLevelUpMain.m_page_container:enableScroll(false)
	end
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_MINGCHENG_CARD, self.event_selectMingcheng)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_36:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_36:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_36] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_36:guidelinesNextIndex()	
	return 37
end


return f_guidelines_36