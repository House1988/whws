--[[--
    新手指引
    装备详情界面，指向升级按钮
    步骤
--]]--

local f_guidelines_42 = class("f_guidelines_42")
f_guidelines_42.__index = f_guidelines_42

-------------------------------------------------
-- @function [parent=#f_guidelines_42] ctor
-------------------------------------------------
function f_guidelines_42:ctor()	
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
-- @function [parent=#f_guidelines_42] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_42:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_42:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_42:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_42:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("equip_detial_panel") then
			return 
		end
		
		local equipDetailPanel = g_game.g_panelManager:getUiPanel("equip_detial_panel")
		if equipDetailPanel then
			local upgradeBtn = equipDetailPanel.m_componentTable["btnUpgradel"]
		
			if upgradeBtn then		
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = upgradeBtn:getPosition()
				local pos = upgradeBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, upgradeBtn:getSize(), false, false)
				
				local guidelinesBtn = fc.FScaleButton:create()
			    guidelinesBtn:setSize(cc.size(146,53))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:setButtonImage("batch_ui/teshuanniu.png")
			
			    local sheng = fc.FShaderExtensionsImage:create(0)
			    sheng:setAnchorPoint(cc.p(0.5,0.5))
			    sheng:setImage("batch_ui/sheng1_uizi.png")
			    sheng:setSize(cc.size(32,32))
			    guidelinesBtn:appendComponent(sheng)
			    sheng:setPositionInContainer(cc.p(47,26))
			
			    local ji = fc.FShaderExtensionsImage:create(0)
			    ji:setAnchorPoint(cc.p(0.5,0.5))
			    ji:setImage("batch_ui/ji1_uizi.png")
			    ji:setSize(cc.size(32,32))
			    guidelinesBtn:appendComponent(ji)
			    ji:setPositionInContainer(cc.p(101,26))
			    
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, upgradeBtn:getSize())
				stencilPanel:showIndicateAnimation(pos, upgradeBtn:getSize())
				
				--注册监听函数
				self.event_upgradCall = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
				end
				g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_CLICK_UPDATE_BTN, self.event_upgradCall)
				    			
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_42:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_42:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(58)
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	stencilPanel:setVisible(false)

	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_CLICK_UPDATE_BTN, self.event_upgradCall)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_42:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_42] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_42:guidelinesNextIndex()	
	return 43
end



return f_guidelines_42