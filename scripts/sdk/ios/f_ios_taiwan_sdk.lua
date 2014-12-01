--[[--
    ios 台湾正版
--]]--

local f_ios_taiwan_sdk = class("f_ios_taiwan_sdk", function()
    return fc.FSdkManager:getInstance()
end)


function f_ios_taiwan_sdk:ctor()
	
	--临时验证服务器
	self.m_taiwan_vertifiy_server = {["ip"] = "54.255.182.50",["port"] = 21000}
	--{["ip"] = "118.192.76.178",  ["port"] = 20000}
	
	self.event_init = function()
		self:init_sdk()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_INIT, self.event_init)
	
	--初始化 自动登陆判断
	self.event_showLogin = function()
		self:show_sdk_view()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN, self.event_showLogin)
	
	self.m_beginUpdate = false
	-- google admob 广告
	self.event_requestAdmob = function()
		self.m_beginUpdate = true
		g_game.g_gameManager:addUpdateObj(self)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
		self:requestGoogleAdmobAd()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_IOS_ADMOD_EVENT, self.event_requestAdmob)
	
	-- google+ 登陆
	self.event_showLogin = function()
--		local type = g_game.g_dataManager:getUserLastLoginType()
--		if type ~= 0 then
--			self:logoutLastLoginSdk(type)
--		end
		g_game.g_dataManager:setUserLastLoginType(1)
		self:show_sdk_view()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_GOOGLE, self.event_showLogin)
	
	-- facebook登录
	self.event_showLogin = function()
--		local type = g_game.g_dataManager:getUserLastLoginType()
--		if type ~= 0 then
--			self:logoutLastLoginSdk(type)
--		end
		g_game.g_dataManager:setUserLastLoginType(2)
		self:show_sdk_view()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_FACEBOOK, self.event_showLogin)
	
	
	self.event_changeUser = function()
		self:change_sdk_user()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT, self.event_changeUser)
	
	--party 用户注册 事件
	self.event_partyRegister = function()
		self:trackPartyEvent(g_game.g_f_party_event.F_LUA_PARTY_SDK_REGIST)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_REGISTERED, self.event_partyRegister)
end

function f_ios_taiwan_sdk:update()
	if self.m_beginUpdate and self:getAdReceiveResult() ~= 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		self.m_beginUpdate = false
		self:isReceiveAdToShow(0)
		g_game.g_gameManager:removeUpdateObj(self) 
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_ios_taiwan_sdk] init_sdk
-- 初始化sdk
-------------------------------------------------------------------------------
function f_ios_taiwan_sdk:init_sdk()	
	self:setTaiwanIapVerifyServer(self.m_taiwan_vertifiy_server["ip"], self.m_taiwan_vertifiy_server["port"])
end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_taiwan_sdk] show_sdk_view
-- 显示sdk界面
-------------------------------------------------------------------------------
function f_ios_taiwan_sdk:show_sdk_view()
	-- 1 google  2 facebook  0 none
	local type2 = g_game.g_dataManager:getUserLastLoginType()
	if type2 == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL)
		return
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
	--走同一个callback
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
			elseif type == -2 then
				loginResult["error_des"] = "获取用户登陆信息出错，请重新登陆！"
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
	
	if type2 == 2 then
		self:showFaceBookAppSdkLoginView()
		self:setLoginWithFacebookCallBack(loginCallback)
	elseif type2 == 1 then
		self:showGooglePlusAppSdkLoginView()
		self:setLoginWithGooglePlusCallBack(loginCallback)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_taiwan_sdk] change_sdk_user
-- 更改sdk用户
-------------------------------------------------------------------------------
function f_ios_taiwan_sdk:change_sdk_user()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_POPUP_CHANGE_ACOUNT)
end

return f_ios_taiwan_sdk