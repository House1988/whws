local FLuaNetServiceManager = class("FLuaNetServiceManager", function()
    return fc.FNetService:sharedFNetService()
end)

function FLuaNetServiceManager:ctor()	
	self.message_function_array = {}
	self:initMsgProtocol(g_game.g_resourceManager:getMsgpackPath() .. "xmlList.m")
	
	self.m_native_server = nil
	if DEBUG_USE_NATIVE_SERVER then
		self.m_native_server = require("scripts.manager.fluanativeserver").new()
	end
	
end

function FLuaNetServiceManager:connect(ip, port)	
	if DEBUG_USE_NATIVE_SERVER then
		return 
	end
	local error = function(errorCode)
		self:errorCallback(errorCode)
	end

	self:setLuaCallBack(error)
	g_game.g_gameManager:setGameNetworkState(2)
	self:init(ip, port)
	
end


function FLuaNetServiceManager:reconnect()
	local account = g_game.g_userInfoManager:getUserAccount()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local serverInfo = g_game.g_dataManager:getCacheServerInfo(account)
	
	local error = function(errorCode)
		self:errorConnectCallback(errorCode)
	end

	self:setLuaCallBack(error)
	self:init(serverInfo[1]["ip"], serverInfo[1]["port"])
	
	local udid = g_game.g_system:getUUID()	
	local dataT = {}
	dataT["account"] = account
	dataT["roleId"] = tonumber(userInfo["roleId"])
	dataT["deviceSign"] = udid
	dataT["channel"] = DEBUG_SDK_TYPE
	
	g_game.g_netManager:send_message(g_network_message_type.CS_RECONNECT_REQUEST, dataT)

end

function FLuaNetServiceManager:send_message(messageType, sendMessage)
	if g_game.m_isDisconnectTrigger and 
		messageType ~= g_network_message_type.CS_RECONNECT_REQUEST then
		return
	end

	if DEBUG_USE_NATIVE_SERVER and self.m_native_server ~= nil then
		self.m_native_server:send_message(messageType, sendMessage)
	else
		FSendMessage(messageType, sendMessage)
	end
end

--消息处理函数
function FLuaNetServiceManager:message_handler(reciveMessage)
	g_game.g_gameManager:refershPingData()
	
  	local messageType = reciveMessage.msg_type
  	local functionArray = self.message_function_array[messageType]
  	if functionArray==nil then
      	echo("\nFLuaNetServiceManager.lua: no logic function for type="..messageType)
      	return
  	end
  	for i=1, #functionArray do
      	if functionArray[i] == nil then
          	echo("\nFLuaNetServiceManager.lua: function is nil: "..functionArray[i])
      	else 
          	functionArray[i](reciveMessage)
      	end
  	end
end

--注册消息
function FLuaNetServiceManager:registerMessage(messageType, logicFunction)
    local functionArray = self.message_function_array[messageType]
    if functionArray == nil then
        functionArray = {logicFunction}
        self.message_function_array[messageType] = functionArray
    else
        self:removeMessage(messageType, logicFunction)
        table.insert(functionArray, logicFunction)
    end
    for i=1, #self.message_function_array[messageType] do
        print(self.message_function_array[messageType][i])
    end
end

--移除消息
function FLuaNetServiceManager:removeMessage(messageType, logicFunction)
    local functionArray = self.message_function_array[messageType]
    if functionArray == nil then
        return
    end
    if logicFunction ~= nil then
      local index = 0
      for i=1, #functionArray do
          if functionArray[i]==logicFunction then
              index = i
              break
          end
      end
      if index>0 then
          table.remove(functionArray, index)
      end
    else   
      self.message_function_array[messageType] = nil
    end
end

function FLuaNetServiceManager:removeAllMessage()
	self.message_function_array = {}
end

function FLuaNetServiceManager:errorCallback(errorCode)
	g_game.g_gameManager:setGameNetworkState(1)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_CANNOT_CONNECT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
end


function FLuaNetServiceManager:errorConnectCallback(errorCode)
	g_game.g_gameManager:setGameNetworkState(1)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_RECONNECT_FAILD)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
end

function FLuaNetServiceManager:exit()
    self:close()
	g_game.g_gameManager:setGameNetworkState(1)
end

return FLuaNetServiceManager