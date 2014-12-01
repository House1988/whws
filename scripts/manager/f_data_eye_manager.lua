local f_data_eye_manager = class("f_data_eye_manager", function()
    return fc.FDataAnalysis:getInstance()
end)

function f_data_eye_manager:ctor()

	self.event_UserLogin = function()
		self:userLogin() 
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGIN, self.event_UserLogin)
	
	self.event_UserLogout = function()
		self:userLogout()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGOUT, self.event_UserLogout)
	
	self.event_UserLevel = function()
		local userLevel = g_game.g_userInfoManager:getLevel()
		self:userLevel(userLevel)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LEVEL, self.event_UserLevel)
	
	self.event_GameServer = function()
		local userAccount = g_game.g_userInfoManager:getUserAccount()
		local gameInfo = g_game.g_dataManager:getCacheServerInfo(userAccount)
		if #gameInfo > 0 then
			self:userGameServer(gameInfo[1]["name"])
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_GAME_SERVER, self.event_GameServer)
	
	
	
	self.event_UserChargeStart = function(data)
		--self:userChargeBuyItem(data["orderId"], data["iapId"], data["amount"], data["currencyType"], data["paymentType"])
	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_START, self.event_UserChargeStart)
	
	self.event_UserBuyItemSuccess = function(data)
		--self:userBuyItemSuccess(data["orderId"])
	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_BUYITEM_SUCCESS, self.event_UserBuyItemSuccess)
	
	self.event_UserChargeSuccess = function(data)
		self:userChargeSuccess(data["currencyAmount"], data["currencyType"], data["paymentType"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_SUCCESS, self.event_UserChargeSuccess)
	
	
	self.event_UserCoinNum = function(data)
		self:userCoinNum(data["coinNum"], "CNY")
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_COINS, self.event_UserCoinNum)
	
	self.event_UserLostCoin = function(data)
		self:userLostCoin(data["reason"], data["lost"], data["left"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_LOST_COINS, self.event_UserLostCoin)
	
	self.event_UserGetCoin = function(data)
		self:userGetCoin(data["reason"], data["gain"], data["left"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_GET_COINS, self.event_UserGetCoin)
	
	self.event_UserBuyIGM = function(data)
		self:userBuyIGM(data["itemId"], data["itemType"], data["itemCnt"], data["vituralCurrency"], data["currencyType"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_BUY_IGM, self.event_UserBuyIGM)
	
	self.event_UserGetIGM = function(data)
		self:userGetIGM(data["itemId"], data["itemType"], data["itemCnt"], data["reason"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_GET_IGM, self.event_UserGetIGM)
	
	self.event_UserUseIGM = function(data)
		self:userUseIGM(data["itemId"], data["itemType"], data["itemCnt"], data["reason"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_USE_IGM, self.event_UserUseIGM)
	
	
	
--[[	

g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_START				= 5004
g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_BUYITEM_SUCCESS	= 5005
g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_SUCCESS			= 5006

g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_COINS			= 5007
g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_LOST_COINS	= 5008
g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_GET_COINS		= 5009

g_game.g_f_lua_game_event.F_LUA_DATA_USER_BUY_IGM					= 5010
g_game.g_f_lua_game_event.F_LUA_DATA_USER_GET_IGM					= 5011
g_game.g_f_lua_game_event.F_LUA_DATA_USER_USE_IGM					= 5012	
	
]]--	
	
end


return f_data_eye_manager