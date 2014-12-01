local f_talking_data_manager = class("f_talking_data_manager", function()
    return fc.FDataAnalysis:getInstance()
end)


function f_talking_data_manager:ctor()
	self.m_td_account_id = ""

	
	self.event_UserLogin = function()
		local userAccount = g_game.g_userInfoManager:getUserAccount()
		local gameInfo = g_game.g_dataManager:getCacheServerInfo(userAccount)
		local userId = g_game.g_userInfoManager:getUserRoleId()
		local userName = g_game.g_userInfoManager:getUserRoleName()
		local userLevel = g_game.g_userInfoManager:getLevel()
		if #gameInfo > 0 then
			self:setUserAccount(userId, gameInfo[1]["serverId"])
		end
		if self.m_td_account_id ~= nil and self.m_td_account_id ~= "" then				
			self:tdUserLogin(self.m_td_account_id) 			
			self:tdUserName(self.m_td_account_id, userName) 
			self:tdUserLevel(self.m_td_account_id, userLevel) 
			self:tdUserGameServer(self.m_td_account_id, tostring(gameInfo[1]["serverId"])) 			
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGIN, self.event_UserLogin)


	self.event_UserLevel = function()
		local userLevel = g_game.g_userInfoManager:getLevel()
		self:tdUserLevel(self.m_td_account_id, userLevel) 
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LEVEL, self.event_UserLevel)
	


	self.event_UserChargeRequest = function(data)
		self:tdUserChargeRequest(self.m_td_account_id, data["orderId"], data["iapId"], data["prince"], data["currencyType"], data["ybNum"], data["paymentType"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_START, self.event_UserChargeRequest)
	
	self.event_UserChargeSuccess = function(data)
		self:tdUserChargeSuccess(self.m_td_account_id, data["orderId"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_BUYITEM_SUCCESS, self.event_UserChargeSuccess)
	
	
	
	self.event_tdaUserRegister = function()
		self:tdaOnRegister(self.m_td_account_id)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_REGISTERED, self.event_tdaUserRegister)
	
	self.event_tdaUserLogin = function()
		self:tdaOnLogin(self.m_td_account_id)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_LOGINED, self.event_tdaUserLogin)
	
	
	self.event_tdaUserPay = function(data)
		self:tdaOnPay(self.m_td_account_id, data["orderId"], data["prince"], data["currencyType"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_PAY, self.event_tdaUserPay)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_talking_data_manager] setUserAccount
-- 设置当前登陆玩家信息，用户id和服务器id
-------------------------------------------------------------------------------
function f_talking_data_manager:setUserAccount(userId, serverId)
	self.m_td_account_id = tostring(serverId) .. tostring(userId)
end


return f_talking_data_manager