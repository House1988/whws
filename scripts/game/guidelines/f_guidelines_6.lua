--[[--
    新手指引
    宠幸妃子
    步骤
--]]--

local f_guidelines_6 = class("f_guidelines_6")
f_guidelines_6.__index = f_guidelines_6

-------------------------------------------------
-- @function [parent=#f_guidelines_6] ctor
-------------------------------------------------
function f_guidelines_6:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	self.m_is_show = false
	
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
-- @function [parent=#f_guidelines_6] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_6:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_6:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_6:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_6:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		if not g_game.g_panelManager:isUiPanelShow("hougong_tangquangong_bg") then
			g_game.g_director:getRunningScene():getGameMap():enterBeauty()
			return 
		end
		
		
		local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
		local tangquangong = hougongMain.m_tangquangong
		local chongxingBtn = tangquangong.m_meinvInfo_table["hg_tqg_chongxing_button"]
		
		if chongxingBtn then
				
			g_game.g_userInfoManager:requestRecordGuidleStep(6)
			
				
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)	
			stencilPanel:enableStencil(true)
			
				
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
			
			--注册监听函数
			self.event_chongxing = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING, self.event_chongxing)
			
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_6:state_Check(dt)	
	self.m_time = self.m_time + dt
	if self.m_time > 1.3 and self.m_is_show == false then
		self.m_time = 0
		self.m_is_show = true
		
		local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
		local tangquangong = hougongMain.m_tangquangong
		local chongxingBtn = tangquangong.m_meinvInfo_table["hg_tqg_chongxing_button"]
		
		if chongxingBtn then

			local stencilPanel = self.m_guidelines_manager:getComponent()
			
			local posx, posy = chongxingBtn:getPosition()
			local pos = chongxingBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, chongxingBtn:getSize()["width"]/2, false, false)
			    
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(101,92))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/chongxing_anniu.png")
		    guidelinesBtn:setTextImage("batch_ui/chongxing.png",cc.p(50,55))
		    stencilPanel:showIndicateComponent(guidelinesBtn, pos, chongxingBtn:getSize())
							
			stencilPanel:showIndicateAnimation(pos, chongxingBtn:getSize())
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_6:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	g_game.g_userInfoManager:requestRecordGuidleStep(8)
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)	
	stencilPanel:enableStencil(false)
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING, self.event_chongxing)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_6:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_6:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_6] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_6:guidelinesNextIndex()	
	return 7
end


return f_guidelines_6