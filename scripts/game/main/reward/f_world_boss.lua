require("scripts.auto.auto_world_boss")

--[[--
世界boss 
--]]--
local f_world_boss = class("f_world_boss", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_world_boss")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_world_boss:ctor()    
    self:registerNodeEvent()   
   	self.m_componentTable = nil
   	self:setSize(cc.size(960, 640))
	
	self.m_unopenPanel = nil
	self.m_openPanel = nil
	
	self.m_isBossOpen = false
	self.m_timer = 1
	self.m_timeLeft = 0
	
	self.m_count = g_game.REFRESH_COUNT
	
	self.m_isTriggerUpdate = false
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] registerNodeEvent
-------------------------------------------------------------------------------
function f_world_boss:registerNodeEvent(handler)
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
-- @function [parent=#f_world_boss] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_world_boss:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] onEnter
-------------------------------------------------------------------------------
function f_world_boss:onEnter()
	self.m_componentTable = createworld_boss()
	local panel = self.m_componentTable["world_boss"]	
	self:appendComponent(panel)
	panel:setAnchorPoint(cc.p(0.5, 0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	
	local bossInfo = g_game.g_dictConfigManager:getBossInfoByDay()
	local des = g_game.g_dictConfigManager:getLanTextById(bossInfo[2])
	self.m_componentTable["boss_title"]:setString(des)
	
	require("scripts.game.main.reward.f_world_boss_open")
	self.m_openPanel = f_world_boss_open.static_create()
	self.m_openPanel:panelInitBeforePopup()
	self:appendComponent(self.m_openPanel)
	self.m_openPanel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_openPanel:setPositionInContainer(cc.p(480, 320))
	
	require("scripts.game.main.reward.f_world_boss_unopen")
	self.m_unopenPanel = f_world_boss_unopen.static_create()
	self.m_unopenPanel:panelInitBeforePopup()
	self:appendComponent(self.m_unopenPanel)
	self.m_unopenPanel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_unopenPanel:setPositionInContainer(cc.p(480, 320))
	
	self:updateTimeUiState()
	
	self:initAllComponent()
	
	--活动时间倒计时 开启触发
	self.m_updateRewardFlag1 = function()
		local flag = g_game.g_userInfoManager:updateSingleFlag("worldboss")
		self.m_isBossOpen = flag 
		self.m_isTriggerUpdate = false
		if flag then
			g_game.g_userInfoManager.m_refreshFightRequest = g_game.REFRESH_OPEN_BOSS
		else
			g_game.g_userInfoManager.m_refreshFightRequest = g_game.REFRESH_UNOPEN_BOSS
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_HUODONG_FLAG, self.m_updateRewardFlag1)
	
	self.m_updateRequestOpen = function()
		self:refreshRequestUiOpen()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_OPEN, self.m_updateRequestOpen)
	
	self.m_updateRequestUnopen = function()
		self:refreshRequestUiUnOpen()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_UNOPEN , self.m_updateRequestUnopen)
	
	self.event_openRankInfo2 = function()
		self:popupRankInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOW_RANKINFO, self.event_openRankInfo2)
	
	self.m_isTriggerUpdate = true
	g_game.g_gameManager:addUpdateObj(self)
end

function f_world_boss:updateTimeUiState()
	local curTime = g_game.g_gameManager:getCurrentTime()
	local t = os.date("*t",curTime)
	local time = t["hour"] * 3600 + t["min"] * 60 + t["sec"]
	
	self.m_isBossOpen = false
	
	if time >= g_game.WORLD_BOSS_START_TIME2*3600 and time < g_game.WORLD_BOSS_START_TIME2*3600 + g_game.WORLD_BOSS_LAST_TIME then
		self.m_isBossOpen = true
		self.m_timeLeft = g_game.WORLD_BOSS_START_TIME2*3600 + g_game.WORLD_BOSS_LAST_TIME - time 
	end
	
	self:updateUiChange()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] update
-------------------------------------------------------------------------------
function f_world_boss:update(dt)
	if g_game.g_userInfoManager.m_refreshFightRequest ~= -1 then
		self:refreshBossRequest()		
		g_game.g_userInfoManager.m_refreshFightRequest = -1
	end
	
	if not self.m_isTriggerUpdate then
		return 
	end

	if not self.m_isBossOpen then
		local targetSec = g_game.g_recoverManager:getBossCdTime()
		local exportTime = g_game.g_utilManager:getExportTime(targetSec)
		self.m_unopenPanel:setCdString(exportTime)
		return
	end
	
	self.m_timer = self.m_timer - dt
	if self.m_timer <= 0 then
		self.m_timeLeft = self.m_timeLeft -1
		if self.m_timeLeft <= 0 then
			self.m_timeLeft = 0
			self.m_isBossOpen = false
			g_game.g_userInfoManager.m_isNeedPopRank = true
			g_game.g_userInfoManager.m_refreshFightRequest = g_game.REFRESH_UNOPEN_BOSS
		end
		self.m_openPanel:setLeftTime(self.m_timeLeft)
		
		self.m_count = self.m_count -1
		if self.m_count <= 0 then
			g_game.g_userInfoManager:requestWorldBossOpen()
			self.m_count = g_game.REFRESH_COUNT
		end
		
		self.m_timer = self.m_timer + 1
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] popupRankInfo
-------------------------------------------------------------------------------
function f_world_boss:popupRankInfo()
	--只要弹榜单 ，活动就结束了
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_WORLD_BOSS_OVER)
	
	local rankInfo  = g_game.g_panelManager:getUiPanel("world_boss_rank_info")
	if rankInfo ~= nil then
	 	return
	end
	require("scripts.game.main.reward.f_world_boss_rank_info")
	local rankInfo = f_world_boss_rank_info.static_create()
    rankInfo:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(rankInfo,"world_boss_rank_info")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] refreshBossRequest
-------------------------------------------------------------------------------
function f_world_boss:refreshBossRequest()
	if g_game.g_userInfoManager.m_refreshFightRequest == g_game.REFRESH_UNOPEN_BOSS then
		g_game.g_userInfoManager:requestLastKillBossInfo()
		
		if g_game.g_userInfoManager.m_isNeedPopRank	then
			g_game.g_userInfoManager:requestLastRankInfo()
		end
		
	elseif g_game.g_userInfoManager.m_refreshFightRequest == g_game.REFRESH_OPEN_BOSS then
		g_game.g_userInfoManager:requestWorldBossOpen()
	end
end

function f_world_boss:refreshRequestUiOpen()
	self.m_isBossOpen = true
	
	local curTime = g_game.g_gameManager:getCurrentTime()
	local t = os.date("*t",curTime)
	local time = t["hour"] * 3600 + t["min"] * 60 + t["sec"]
	
	if time >= g_game.WORLD_BOSS_START_TIME2*3600 and time < g_game.WORLD_BOSS_START_TIME2*3600 + g_game.WORLD_BOSS_LAST_TIME then
		self.m_timeLeft = g_game.WORLD_BOSS_START_TIME2*3600 + g_game.WORLD_BOSS_LAST_TIME - time 
	end
	
	self:updateUiChange()
	
	self.m_isTriggerUpdate = true
end

function f_world_boss:refreshRequestUiUnOpen()
	self.m_isBossOpen = false
	self:updateUiChange()
	self.m_isTriggerUpdate = true
end

function f_world_boss:updateUiChange()
	
	if self.m_isBossOpen  then
		self.m_openPanel:updateOpenData()
		self.m_openPanel:setVisible(true)
		self.m_unopenPanel:setVisible(false)
		self.m_openPanel:setLeftTime(self.m_timeLeft)
	else
		self.m_unopenPanel:updateBossInfo()
		self.m_unopenPanel:setVisible(true)
		self.m_openPanel:setVisible(false)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] onExit
-------------------------------------------------------------------------------
function f_world_boss:onExit()
	self:unregisterNodeEvent()
	g_game.g_gameManager:removeUpdateObj(self)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_OPEN, self.m_updateRequestOpen)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_UNOPEN , self.m_updateRequestUnopen)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_HUODONG_FLAG, self.m_updateRewardFlag1)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOW_RANKINFO, self.event_openRankInfo2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_world_boss:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] onExitTransitionStart
-------------------------------------------------------------------------------
function f_world_boss:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] onCleanup
-------------------------------------------------------------------------------
function f_world_boss:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_world_boss:initAllComponent()
end


return f_world_boss
