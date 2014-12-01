--[[--
    新手指引
    战斗选择
    步骤
--]]--

local f_guidelines_22 = class("f_guidelines_22")
f_guidelines_22.__index = f_guidelines_22

-------------------------------------------------
-- @function [parent=#f_guidelines_22] ctor
-------------------------------------------------
function f_guidelines_22:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_OPEN_CHAPTER	= 2
	self.STATE_CHECK		= 3
	self.STATE_FINISH		= 4
	self.STATE_EXIT			= 5
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_checkChapter = function(dt)
		self:state_CheckChapter(dt)
	end
	self.m_state_function_array[self.STATE_OPEN_CHAPTER] = state_checkChapter
	
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
-- @function [parent=#f_guidelines_22] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_22:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_22:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_22:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
			g_game.g_director:getRunningScene():getGameMap():triggerBuilding(5)
		end
		
		self.m_current_state = self.STATE_OPEN_CHAPTER
	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] state_CheckChapter
-- 检查面板是否打开
-------------------------------------------------------------------------------
function f_guidelines_22:state_CheckChapter(dt)	
	
		if g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_ditu_bg") then
				local battleMain = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
				battleMain:showSelectChapter(1)			
			end
			
			if g_game.g_panelManager:isUiPanelShow("zhanyi_ditu_bg") then
				local secondChapter = g_game.g_panelManager:getUiPanel("zhanyi_ditu_bg")
				if secondChapter.m_curBattleMapTable == nil then
					return
				end
				
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(true)
				stencilPanel:enableStencil(true)
				
				
				local btn = secondChapter.m_curBattleMapTable["small_battle_button1"]
				if btn then
					local posx, posy = btn:getPosition()
					local pos = btn:getParent():convertToWorldSpace(cc.p(posx, posy))			
					stencilPanel:setRectType(pos, btn:getSize(), false, false)
					local newPos = cc.p(pos.x+4, pos.y-2)
					
					local guidelinesBtn = fc.FScaleButton:create()
					guidelinesBtn:setButtonImage("batch_ui/zhandou_tubiao_kaiqi.png")
					
					stencilPanel:showIndicateComponent(guidelinesBtn, newPos, btn:getSize())
					stencilPanel:showIndicateAnimation(pos, btn:getSize())
					
					self.m_current_state = self.STATE_CHECK
					
					
					--注册监听函数
					self.event_openSmallBattle = function()
						if self.m_current_state == self.STATE_CHECK then
							self.m_current_state = self.STATE_FINISH
						end
					end
					g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SMALL_BATTLE, self.event_openSmallBattle)
					
				end
			end
			
		end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_22:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_22:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SMALL_BATTLE, self.event_openSmallBattle)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_22:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_22:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_22] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_22:guidelinesNextIndex()	
	return 23
end


return f_guidelines_22