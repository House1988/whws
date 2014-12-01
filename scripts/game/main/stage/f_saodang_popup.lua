require("scripts.auto.auto_saodang_popup")
--[[--
扫荡弹出
--]]--
f_saodang_popup = class("f_saodang_popup")
f_saodang_popup.__index = f_saodang_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_saodang_popup.static_create()
							 
	local skillInfoTable = createsaodang_popup()
	local skillInfo = skillInfoTable["saodang_popup"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_saodang_popup)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_saodang_popup:panelInitBeforePopup(isMore)
	self:registerNodeEvent()
	self.m_areaId =0
	self.m_bigBattleId = 0
	self.m_stageId = 0
	self.m_battleTimes = 0
	
	self.m_costStrength = 0
	
	self.m_isMore = isMore
end


-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_saodang_popup:registerNodeEvent(handler)
	if not handler then
		handler = function(event)
			if event == "enter" then
				self:onEnter()
			elseif event == "exit" then
				self:onExit()
			elseif event == "enterTransitionFinish" then
				self:onEnterTransitionFinish()
			elseif event == "exitTransitionStart" then
				self:onExitTransitionStart()
			elseif event == "cleanup" then
				self:onCleanup()
			end
		end
	end
	self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] setUseId
-------------------------------------------------------------------------------
function f_saodang_popup:setUseId(areaId,bigId,stageId)
	self.m_areaId = areaId
	self.m_bigBattleId = bigId
	self.m_stageId = stageId
	local levelInfo = g_game.g_dictConfigManager:getLevelInfo(self.m_stageId)
	
	local name = g_game.g_dictConfigManager:getLanTextById(levelInfo[2]) 
	self.m_componentTable["saodang_stage_label"]:setString(name)
	
	if self.m_isMore then
		local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()["levelDate"]
		for i = 1, #smallStageNumsData do
			if 	smallStageNumsData[i]["level"] == self.m_stageId then
				self.m_battleTimes = smallStageNumsData[i]["count"]
				break
			end
		end
		
		if self.m_battleTimes > 10 then
			self.m_battleTimes = 10
		end
	else
		self.m_battleTimes = 1
	end
	
	self.m_componentTable["saodang_num"]:setString(self.m_battleTimes)
	local singgleCostStrength = g_game.g_dictConfigManager:getCostStrength(self.m_stageId)
	self.m_costStrength = singgleCostStrength*self.m_battleTimes
	self.m_componentTable["saodang_liangcao_num"]:setString(self.m_costStrength)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] beginSaoDang
-------------------------------------------------------------------------------
function f_saodang_popup:beginSaoDang()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local userStrength = userInfo["strength"]
	
	if userStrength < self.m_costStrength then
		g_game.g_panelManager:removeUiPanel("saodang")
		--粮草快速购买
		g_game.g_utilManager:popupQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_STRENGTH)
		return
	end
	
	g_game.g_userInfoManager:requestSaodang(self.m_areaId,self.m_bigBattleId,self.m_stageId,self.m_battleTimes)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_saodang_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] onEnter
-------------------------------------------------------------------------------
function f_saodang_popup:onEnter()
	self.event_updateSweep = function()
		self:updateSaodangResult()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE, self.event_updateSweep)
	
	self:initAllComponent()
end

function f_saodang_popup:updateSaodangResult()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE_NUM)
	
	g_game.g_panelManager:removeUiPanel("saodang")
	
	require("scripts.game.main.stage.f_saodang_result_popup")
	local saodangR = f_saodang_result_popup.static_create()
	saodangR:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(saodangR,"saodang_result")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] onExit
-------------------------------------------------------------------------------
function f_saodang_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE, self.event_updateSweep)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_saodang_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_saodang_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] onCleanup
-------------------------------------------------------------------------------
function f_saodang_popup:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_saodang_popup:initAllComponent()
    local saodang = function()
    	self:beginSaoDang()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn_saodang"]:addHandleOfcomponentEvent(saodang, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	 local close = function()
    	g_game.g_panelManager:removeUiPanel("saodang")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn_close"]:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end

