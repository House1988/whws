--[[--
    新手指引
  	请求阵容2 指引
    步骤
--]]--

local f_guidelines_601 = class("f_guidelines_601")
f_guidelines_601.__index = f_guidelines_601

-------------------------------------------------
-- @function [parent=#f_guidelines_601] ctor
-------------------------------------------------
function f_guidelines_601:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
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
-- @function [parent=#f_guidelines_601] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_601:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_601] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_601:update(dt)	
	self.m_time = self.m_time + dt
	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_601] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_601:state_Init(dt)
	if not g_game.g_panelManager:isUiPanelShow("pve_emperor_lvup") then
		return 
	end
	 
	local levelupPanel = g_game.g_panelManager:getUiPanel("pve_emperor_lvup")
	if not levelupPanel:showActionIsFinish() then
		return
	end
	
	if levelupPanel:lvupType() == 2 then
		self:reportsLvUpLogic()
	elseif levelupPanel:lvupType() == 1 then
	    self:stageLvUpLogic()
	end
		
end

function f_guidelines_601:reportsLvUpLogic()
	
	local userLv = g_game.g_userInfoManager:getUserInfo()["level"] 
	if userLv == 30 then
		 --删除掉可能弹出的 奏章奖励面板
		 g_game.g_guidelinesManager:setBrunchGuildline(true)	
		 g_game.g_guidelinesManager:enableBtnAndDisOther("paibing")
		 g_game.g_panelManager:removeUiPanel("zozhang_result_view")
		
		 local stencilPanel = self.m_guidelines_manager:getComponent()
		 stencilPanel:enableAllStencil(true)
	 	 stencilPanel:scaleFullScreen(false)
		 stencilPanel:enableStencil(true)
			
		 local levelupPanel = g_game.g_panelManager:getUiPanel("pve_emperor_lvup")
		 levelupPanel:setYesBtnVisible(true)
		 if levelupPanel then	
		 	 g_game.g_userInfoManager:requestArr2GuideStepToServer()
		 	 
		 	local yesBtn = levelupPanel.m_componentTable["yes_btn"]
			
			local posx, posy = yesBtn:getPosition()
			local pos = yesBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, yesBtn:getSize(), false, false)
			
		    local guidelinesBtn = fc.FTextButton:create()
		    guidelinesBtn:setSize(cc.size(144,51))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
		    guidelinesBtn:setText("立即前往",cc.c3b(255,255,255))
		    guidelinesBtn:setSelectActionEnbaled(true)
		    
		    stencilPanel:showIndicateComponent(guidelinesBtn, pos, yesBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, yesBtn:getSize())
			
			local jumoToMainScene = function()
				if self.m_current_state == self.STATE_CHECK then									
					g_game.g_panelManager:removeUiPanel("pve_emperor_lvup")
					g_game.g_panelManager:removeUiPanel("jinluandian_bg")									
				
					self.m_current_state = self.STATE_FINISH
				end
			
			end
			guidelinesBtn:addHandleOfcomponentEvent(jumoToMainScene, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
		 end
	end
end


function f_guidelines_601:stageLvUpLogic()
    local battleManager = g_game.g_utilManager:getCurrentBattleManager()
    local lv = 0
    if battleManager.m_battle_data["roundData"]["currLevel"]  ~= nil then
    	lv = battleManager.m_battle_data["roundData"]["currLevel"]
    end
    
    if battleManager.m_battle_data["roundData"]["level"] ~= nil then
    	lv = battleManager.m_battle_data["roundData"]["level"]
    end
    
	if lv == 30 then	
		g_game.g_guidelinesManager:setBrunchGuildline(true)	
		g_game.g_guidelinesManager:enableBtnAndDisOther("paibing")		
		g_game.g_dataManager:saveBattleState(2,0)
		--注册监听函数
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:enableStencil(true)
		
		local levelupPanel = g_game.g_panelManager:getUiPanel("pve_emperor_lvup")
		levelupPanel:setYesBtnVisible(true)
		if levelupPanel then			
			 g_game.g_userInfoManager:requestArr2GuideStepToServer()
		
			local yesBtn = levelupPanel.m_componentTable["yes_btn"]
			
			local posx, posy = yesBtn:getPosition()
			local pos = yesBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, yesBtn:getSize(), false, false)
			
		    local guidelinesBtn = fc.FTextButton:create()
		    guidelinesBtn:setSize(cc.size(144,51))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
		    guidelinesBtn:setText("立即前往",cc.c3b(255,255,255))
		    guidelinesBtn:setSelectActionEnbaled(true)
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, yesBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, yesBtn:getSize())
			
			local jumoToMainScene = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			
			end
			guidelinesBtn:addHandleOfcomponentEvent(jumoToMainScene, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			self.m_current_state = self.STATE_CHECK
		end
		
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_601] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_601:state_Check(dt)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_601] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_601:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT

	
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
-- @function [parent=#f_guidelines_601] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_601:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_601] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_601:guidelinesFinish()	
	return self.m_finish
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_601] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_601:guidelinesNextIndex()	
	return 2
end

return f_guidelines_601