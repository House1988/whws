local FLuaGameManager = class("FLuaGameManager", function()
    return fc.FGameManager:getInstance()
end)

function FLuaGameManager:ctor()
    self.m_nowTime = 0.0
    
    self.m_check_network_time = 0.0
    
    local luaUpdate = function(dt)
        self:gameUpdate(dt)
    end
    self:registerGameUpdate(luaUpdate)
    
    local soundCall = function(soundEvent)
    	send_lua_event(soundEvent)
    end
    self:registerSoundCallback(soundCall)
    
    self.m_updateArray = {}
    self.m_ping_time = 0.0
    
    
	local recive_ping = function(msg)
		self:reciveAliveTestResponse(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_IS_ALIVE_TEST_RESPONSE, recive_ping)
	
	
	local recive_reconnect = function(msg)
		self:reciveReconnectRespone(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_RECONNECT_RESPONSE, recive_reconnect)
	
	--监听游戏系统事件
	local recive_game_event = function(eventType)
		self:responseGameEvent(eventType)
	end
	self:registerGameEventCallback(recive_game_event)
	
	self.m_currentTime					= 0 -- 服务器时间
	self.m_ping_count					= 0
	self.NETWORK_STATE_NONE				= 1
	self.NETWORK_STATE_RUNING			= 2
	self.NETWORK_STATE_DISCONNECT		= 3
    
    self.m_current_network_state		= self.NETWORK_STATE_NONE
    
    self.m_isLoginFirstPing = false
end

function FLuaGameManager:gameUpdate(dt)
	self.m_currentTime = self.m_currentTime + dt
	
    if self.m_current_network_state == self.NETWORK_STATE_RUNING then
		self.m_check_network_time = self.m_check_network_time + dt	
		if self.m_check_network_time > 1.0 then
			self.m_check_network_time = 0.0
			if g_game.g_netManager:checkNetworkState() == 1 then
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_DISCONNECT)
	    		self.m_current_network_state		= self.NETWORK_STATE_DISCONNECT
				self.m_ping_count = 0
		    	self.m_ping_time = 0.0
			end
		end
	end
	
    if self.m_current_network_state == self.NETWORK_STATE_RUNING then
    	self.m_ping_time = self.m_ping_time + dt
    	
    	if self.m_ping_time > g_game_time_info.ping_time then
    		self:sendPingToServer()
    		self.m_ping_count = self.m_ping_count + 1
    		self.m_ping_time = 0.0
    	end
    end
    
    
    if self.m_ping_count > g_game_time_info.disconnect_ping_count and self.m_current_network_state == self.NETWORK_STATE_RUNING then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_DISCONNECT)
    	self.m_current_network_state		= self.NETWORK_STATE_DISCONNECT
		self.m_ping_count = 0
    	self.m_ping_time = 0.0
    end
    
 	for i,v in ipairs(self.m_updateArray) do
		v:update(dt)
	end
	
	g_game.g_userInfoManager:update(dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] getCurrentTime
-- 返回当前时间（跟服务器时间对应）
-------------------------------------------------------------------------------
function FLuaGameManager:getCurrentTime()
	return self.m_currentTime
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] hasShowGongGao
-- 有没有显示过公告面板
-------------------------------------------------------------------------------
function FLuaGameManager:hasShowGongGao()
	return self.m_hasShowGongGao
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] showGongGao
-- 显示过公告面板
-------------------------------------------------------------------------------
function FLuaGameManager:showGongGao()
	self.m_hasShowGongGao = true
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] setGameNetworkState
-- 设置游戏服务状态
-------------------------------------------------------------------------------
function FLuaGameManager:setGameNetworkState(state)
   self.m_current_network_state		= state
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] sendPingToServer
-- 发送心跳到服务器
-------------------------------------------------------------------------------
function FLuaGameManager:sendPingToServer()
	g_game.g_netManager:send_message(g_network_message_type.CS_IS_ALIVE_TEST_REQUEST, {})
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] reciveAliveTestResponse
-- 接收服务器心跳
-------------------------------------------------------------------------------
function FLuaGameManager:reciveAliveTestResponse(msg)
	--将服务器时间换算成固定时间格式
	local tab = os.date("*t", msg["serverTime"]);
	g_game.g_utilManager:setFormatTime(tab)
	
	self.m_currentTime = msg["serverTime"]
	self.m_ping_time = 0.0
	self.m_ping_count = 0
	
	if self.m_isLoginFirstPing == false then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_STEADY_ACTIVITY)
		self.m_isLoginFirstPing = true
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] refershPingData
-- 刷新ping
-------------------------------------------------------------------------------
function FLuaGameManager:refershPingData()
	self.m_ping_time = 0.0
	self.m_ping_count = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] reciveReconnectRespone
-- 接收服务器重新连接
-------------------------------------------------------------------------------
function FLuaGameManager:reciveReconnectRespone(msg)
	g_game.m_isDisconnectTrigger = false
	
	if msg["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_HIDE_NET_ERROR_PANEL)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_HIDE_NET_LOGIN_ERROR_PANEL)
		
	    self.m_current_network_state = self.NETWORK_STATE_RUNING
	else
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_RECONNECT_FAILD)
	end
	self.m_ping_count = 0
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] addUpdateObj
-- 添加需要心跳的对象
-------------------------------------------------------------------------------
function FLuaGameManager:addUpdateObj(obj)
	table.insert(self.m_updateArray, obj)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] removeUpdateObj
-- 移除需要心跳的对象
-------------------------------------------------------------------------------
function FLuaGameManager:removeUpdateObj(obj)
	local index = 0
	for i,v in ipairs(self.m_updateArray) do
		if v == obj then
			index = i
		end
	end
	if index > 0 then
		table.remove(self.m_updateArray, index)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaGameManager] responseGameEvent
-- 收到游戏事件
-------------------------------------------------------------------------------
function FLuaGameManager:responseGameEvent(eventType)
	if eventType == g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_BACKGROUND then
		--游戏进入后台，注册notification通知
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_BACKGROUND)
	elseif eventType == g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_FOREGROUND then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_FOREGROUND)
	elseif eventType == g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_MOMERY_WARING then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
	end
end


return FLuaGameManager