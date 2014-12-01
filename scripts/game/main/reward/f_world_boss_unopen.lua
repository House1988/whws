require("scripts.auto.auto_world_boss_unopen_ui")
--[[--
世界boss未开启
--]]--
f_world_boss_unopen = class("f_world_boss_unopen")
f_world_boss_unopen.__index = f_world_boss_unopen

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_world_boss_unopen.static_create()
							 
	local skillInfoTable = createworld_boss_unopen_ui()
	local skillInfo = skillInfoTable["world_boss_unopen_ui"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_world_boss_unopen)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_world_boss_unopen:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.isOpenExchangePanel = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] registerNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_unopen:registerNodeEvent(handler)
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
-- @function [parent=#f_world_boss_unopen] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_unopen:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] onEnter
-------------------------------------------------------------------------------
function f_world_boss_unopen:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] updateBossInfo
-------------------------------------------------------------------------------
function f_world_boss_unopen:updateBossInfo()
	
	local bossInfo = g_game.g_dictConfigManager:getBossInfoByDay()
	
	if bossInfo[5] == 1 then 
		self.m_componentTable["boss_arr_flag"]:setImage("batch_ui/gongji_tubiao.png")
		self.m_componentTable["boss_arr_flag"]:setSize(cc.size(43,60))
	else
		self.m_componentTable["boss_arr_flag"]:setImage("batch_ui/fangyu_tubiao.png")
		self.m_componentTable["boss_arr_flag"]:setSize(cc.size(43,70))
	end
	
	for i = 1, 7 do
		local cardId = bossInfo[5+i]
		local imagePath, qulity, name =	g_game.g_dictConfigManager:getResByType(3,cardId)
		
		self.m_componentTable["pos"..i]:setImage(g_game.g_f_quality_image[qulity])
		self.m_componentTable["pos"..i]:setSize(cc.size(73,73))
		
		self.m_componentTable["card"..i]:setImage(imagePath)
		self.m_componentTable["card"..i]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["card"..i]:setSize(cc.size(63,63))
		
		self.m_componentTable["card_name"..i]:setScale(0.8)
		self.m_componentTable["card_name"..i]:setString(name)
	end
	self.m_componentTable["boss_des"]:setAlignment(0)
	local des = g_game.g_dictConfigManager:getLanTextById(bossInfo[3])  
	self.m_componentTable["boss_des"]:setString(des)
	
	self.m_componentTable["activity_time"]:setString("每天"..g_game.WORLD_BOSS_START_TIME2..":00:00")
	local targetSec = g_game.g_recoverManager:getBossCdTime()
	local exportTime = g_game.g_utilManager:getExportTime(targetSec)
	self.m_componentTable["next_left_time"]:setString(exportTime)
	
	local lastBossInfo = g_game.g_userInfoManager:getLastKillBossInfo()
	local data = g_game.g_userInfoManager:getRecoverData()
	self.m_componentTable["cur_contribute_num"]:setString(data["contribution"])
	
	if lastBossInfo["result"] == 1 then
		self.m_componentTable["kill_player_name"]:setString(lastBossInfo["roleName"])
		self.m_componentTable["last_reward_contri_num"]:setString(lastBossInfo["contribution"])
	else
		self.m_componentTable["des3"]:setVisible(false)
		self.m_componentTable["des4"]:setVisible(false)
		self.m_componentTable["last_reward_contri_num"]:setVisible(false)
		self.m_componentTable["kill_player_name"]:setVisible(false)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] onExit
-------------------------------------------------------------------------------
function f_world_boss_unopen:setCdString(str)
	self.m_componentTable["next_left_time"]:setString(str)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] onExit
-------------------------------------------------------------------------------
function f_world_boss_unopen:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI, self.event_updateGongjizhi1)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END, self.event_gotoExchange)
  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_world_boss_unopen:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] onExitTransitionStart
-------------------------------------------------------------------------------
function f_world_boss_unopen:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] onCleanup
-------------------------------------------------------------------------------
function f_world_boss_unopen:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] popupContributePanel
-- 弹出功绩值兑换
-------------------------------------------------------------------------------
function f_world_boss_unopen:popupContributePanel()
	g_game.g_userInfoManager:requestRecoverTime()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	
	self.isOpenExchangePanel = true
end


function f_world_boss_unopen:gotoExchange()
	if self.isOpenExchangePanel  then
		if g_game.g_panelManager:isUiPanelShow("qgyd_gongjizhiduihuan") then
			return 
		end
		require("scripts.game.main.qianguyidi.f_qianguyidi_exchange")
		local exchangeContribute = f_qianguyidi_exchange.static_create()
		exchangeContribute:panelInitBeforePopup()
		exchangeContribute:setStopTouchEvent(true)
		g_game.g_panelManager:showUiPanel(exchangeContribute,"qgyd_gongjizhiduihuan")
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		
		self.isOpenExchangePanel = false
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_unopen] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_world_boss_unopen:initAllComponent()
	self.event_gotoExchange = function()
		self:gotoExchange()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END, self.event_gotoExchange)
	
    self.event_updateGongjizhi1 = function()
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI, self.event_updateGongjizhi1)
	
	local popUpContribute = function()
		self:popupContributePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gongji_exchange"]:addHandleOfcomponentEvent(popUpContribute, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local popUpRankInfo = function()
    	g_game.g_userInfoManager:requestLastRankInfo()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["history_rank"]:addHandleOfcomponentEvent(popUpRankInfo, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
end

function f_world_boss_unopen:refresh()
	local data = g_game.g_userInfoManager:getRecoverData()
	self.m_componentTable["cur_contribute_num"]:setString(data["contribution"])
end

