--[[--
    cmge 正版ios sdk
--]]--

local f_ios_cmge_sdk = class("f_ios_cmge_sdk", function()
    return fc.FSdkManager:getInstance()
end)


function f_ios_cmge_sdk:ctor()
	self.m_sdk_info = {"P10235", "D10026", "35wrszfgzf2236n3160n"}
	self.m_cmge_vertifiy_server = {["ip"] = "118.192.76.178",  ["port"] = 20000}
	
	self.event_init = function()
		self:init_sdk()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_INIT, self.event_init)
	
	self.event_showLogin = function()
		self:show_sdk_view()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN, self.event_showLogin)
	
	self.event_changeUser = function()
		self:change_sdk_user()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT, self.event_changeUser)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_cmge_sdk] init_sdk
-- 初始化sdk
-------------------------------------------------------------------------------
function f_ios_cmge_sdk:init_sdk()	
	self:setCmgeAppSdkVertifiyServer(self.m_cmge_vertifiy_server["ip"], self.m_cmge_vertifiy_server["port"])

end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_cmge_sdk] show_sdk_view
-- 显示sdk界面
-------------------------------------------------------------------------------
function f_ios_cmge_sdk:show_sdk_view()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	self:showCmgeAppSdkLoginView()
	
	local loginCallback = function(type, userName, userId)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		local loginResult = {}
		if type == 0 then
			loginResult["result"] = 0
			loginResult["account"] = userName
			loginResult["userid"] = userId
			loginResult["error_des"] = ""
		else
			loginResult["account"] = ""
			loginResult["userid"] = ""
			if type == -1 then
				loginResult["error_des"] = "未知错误"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_ERROR
			elseif type == -11 then
				loginResult["error_des"] = "用户未登录,请登录平台帐号!"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN
			elseif type == -13 then
				loginResult["error_des"] = "用户校验失败,请重新登录平台帐号!"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED
			end
		end
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	end	
	self:setLoginCallbackWithCmgeAppSdk(loginCallback)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_cmge_sdk] change_sdk_user
-- 更改sdk用户
-------------------------------------------------------------------------------
function f_ios_cmge_sdk:change_sdk_user()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	self:switchCmgeAppSdkUser()
	
	local loginCallback = function(type, userName, userId)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		local loginResult = {}
		if type == 0 then
			loginResult["result"] = 0
			loginResult["account"] = userName
			loginResult["userid"] = userName
			loginResult["error_des"] = ""
		else
			loginResult["account"] = ""
			loginResult["userid"] = ""
			if type == -1 then
				loginResult["error_des"] = "未知错误"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_ERROR
			elseif type == -11 then
				loginResult["error_des"] = "用户未登录,请登录平台帐号!"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN
			elseif type == -13 then
				loginResult["error_des"] = "用户校验失败,请重新登录平台帐号!"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED
			end
		end
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	end	
	self:setLoginCallbackWithCmgeAppSdk(loginCallback)
end

return f_ios_cmge_sdk