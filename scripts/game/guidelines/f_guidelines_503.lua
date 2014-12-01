--[[--
    新手指引
   	 指向精英副本Radio button
    步骤
--]]--

local f_guidelines_503 = class("f_guidelines_503")
f_guidelines_503.__index = f_guidelines_503

-------------------------------------------------
-- @function [parent=#f_guidelines_503] ctor
-------------------------------------------------
function f_guidelines_503:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_CHECK2		= 3
	self.STATE_FINISH		= 4
	self.STATE_EXIT			= 5
	
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
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_503:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_503:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_503:state_Init(dt)
	if not g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
		return 
	end
	
	local pveTitlePanel = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title") 
	local guideLineBtn = pveTitlePanel.m_nanzhengbeitao_titleTable["special_pve"]
	if guideLineBtn then
		
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
			
		local posx, posy = guideLineBtn:getPosition()
		local pos = guideLineBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
		stencilPanel:setRectType(pos, guideLineBtn:getSize(), false, false)
			
		local guideLinePanel = fc.FContainerPanel:create()
	    guideLinePanel:setSize(cc.size(159,45))
	    guideLinePanel:setAnchorPoint(cc.p(0.5,0.5))
		
		local special_pve = fc.FRadioButton:create()
	    special_pve:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
	    special_pve:setSize(cc.size(159,45))
	    special_pve:setAnchorPoint(cc.p(0.5,0.5))
	    guideLinePanel:appendComponent(special_pve)
	    special_pve:setPositionInContainer(cc.p(79.5,22.5))
	    special_pve:setSwallowsTouches(false)
	    
	    local nzbt_jing = fc.FExtensionsImage:create()
	    nzbt_jing:setImage("batch_ui/jing_uizi.png")
	    nzbt_jing:setSize(cc.size(32,32))
	    nzbt_jing:setAnchorPoint(cc.p(0.5,0.5))
	    guideLinePanel:appendComponent(nzbt_jing)
	    nzbt_jing:setPositionInContainer(cc.p(37,23))
	    
	    local nzbt_ying = fc.FExtensionsImage:create()
	    nzbt_ying:setImage("batch_ui/ying_uizi.png")
	    nzbt_ying:setSize(cc.size(32,32))
	    nzbt_ying:setAnchorPoint(cc.p(0.5,0.5))
	    guideLinePanel:appendComponent(nzbt_ying)
	    nzbt_ying:setPositionInContainer(cc.p(65,23))
	
	    local nzbt_fu = fc.FExtensionsImage:create()
	    nzbt_fu:setImage("batch_ui/fu_uizi.png")
	    nzbt_fu:setSize(cc.size(32,32))
	    nzbt_fu:setAnchorPoint(cc.p(0.5,0.5))
	    guideLinePanel:appendComponent(nzbt_fu)
	    nzbt_fu:setPositionInContainer(cc.p(93,23))
	
	    local nzbt_ben = fc.FExtensionsImage:create()
	    nzbt_ben:setImage("batch_ui/ben_uizi.png")
	    nzbt_ben:setSize(cc.size(32,32))
	    nzbt_ben:setAnchorPoint(cc.p(0.5,0.5))
	    guideLinePanel:appendComponent(nzbt_ben)
	    nzbt_ben:setPositionInContainer(cc.p(121,23))

		stencilPanel:showIndicateComponent(guideLinePanel, pos, guideLinePanel:getSize())
		stencilPanel:showIndicateAnimation(pos, guideLinePanel:getSize())
			
		self.m_gotoNext = function()
			if self.m_current_state == self.STATE_CHECK then
				self.m_current_state = self.STATE_FINISH
			end
		end	
		g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_ELITE, self.m_gotoNext)
		
		self.m_current_state = self.STATE_CHECK
	
	end		
	 
		
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] state_Check
-------------------------------------------------------------------------------
function f_guidelines_503:state_Check(dt)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_503:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_ELITE, self.m_gotoNext)
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_503:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_503:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_503] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_503:guidelinesNextIndex()	
	return 4
end

return f_guidelines_503