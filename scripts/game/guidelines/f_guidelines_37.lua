--[[--
    新手指引
       点击名臣升级界面的升级按钮
    步骤
--]]--

local f_guidelines_37 = class("f_guidelines_37")
f_guidelines_37.__index = f_guidelines_37

-------------------------------------------------
-- @function [parent=#f_guidelines_37] ctor
-------------------------------------------------
function f_guidelines_37:ctor()	
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
-- @function [parent=#f_guidelines_37] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_37:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_37:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_37:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_37:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("mingchen_shengji") then
			return 
		end
		
		local mingchenLevelUpMain = g_game.g_panelManager:getUiPanel("mingchen_shengji")
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)

		local levelUpBtn = mingchenLevelUpMain.m_componentTable["shengji_shengji_button"]
		if levelUpBtn then			
			local posx, posy = levelUpBtn:getPosition()
			local pos = levelUpBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, levelUpBtn:getSize()["width"]/2, false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(144,53))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local btn_sheng = fc.FExtensionsImage:create()
		    btn_sheng:setImage("batch_ui/sheng1_uizi.png")
		    btn_sheng:setSize(cc.size(32,32))
		    btn_sheng:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(btn_sheng)
		    btn_sheng:setPositionInContainer(cc.p(54,26))
		
		    local btn_ji = fc.FExtensionsImage:create()
		    btn_ji:setImage("batch_ui/ji1_uizi.png")
		    btn_ji:setSize(cc.size(32,32))
		    btn_ji:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(btn_ji)
		    btn_ji:setPositionInContainer(cc.p(90,26))
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, levelUpBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, levelUpBtn:getSize())
		
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
				
			--注册监听函数
			self.lvupBtnCallBack = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_JUNJICHU_SHENGJI, self.lvupBtnCallBack)
			
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_37:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_37:state_Finish(dt)	

	self.m_current_state = self.STATE_EXIT
	--指向第三次打仗
	g_game.g_userInfoManager:requestRecordGuidleStep(55)
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	stencilPanel:enableAllStencil(false)
	stencilPanel:scaleFullScreen(false)	
	stencilPanel:enableStencil(false)
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_JUNJICHU_SHENGJI, self.lvupBtnCallBack)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_37:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_37] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_37:guidelinesNextIndex()	
	return 53
end

return f_guidelines_37