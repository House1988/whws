--[[--
    Google android sdk
--]]--
local f_android_tw_google_sdk = class("f_android_tw_google_sdk", function()
    return fc.FSdkManager:getInstance()
end)


function f_android_tw_google_sdk:ctor()
	self.json   = require("prescripts.framework.json")
	self.m_vertifiy_server = {["ip"] = "54.169.57.236",  ["port"] = 21000}
	
	self.event_init = function()
		self:init_sdk()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_INIT, self.event_init)
	
	-- 获取上次登录类型
	local ok
	self.lastLoginType = 0
	ok,self.lastLoginType = g_game.g_luaj.callStaticMethod("org.cocos2dx.lua.UtilTool", "getUserLastLoginType", {}, "()I")
	
	self.isFullPackFlag = 0
	ok,self.isFullPackFlag = g_game.g_luaj.callStaticMethod("org.cocos2dx.lua.UtilTool", "getIsFullPack", {}, "()I")
	
	self.lastAppVersion = 0
	ok,self.lastAppVersion = g_game.g_luaj.callStaticMethod("org.cocos2dx.lua.UtilTool", "getAppVersion", {}, "()F")
	
	-- 默认登录
	self.event_showLogin = function()
		if self.lastLoginType == 1 or self.lastLoginType == 2 then
			self:show_sdk_view(self.lastLoginType, 1)
		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL)
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN, self.event_showLogin)
	
	-- google登录
	self.event_showLogin = function()
		self:show_sdk_view(1, 0)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_GOOGLE, self.event_showLogin)
	
	-- facebook登录
	self.event_showLogin = function()
		self:show_sdk_view(2, 0)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_FACEBOOK, self.event_showLogin)
	
	self.event_changeUser = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT, self.event_changeUser)
	
	self.m_user_info = {}
	
	self.getBuyResultFromGameServer= function(msg)
		self:responseBuyResultFromGameServer(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_TRANSACTION, self.getBuyResultFromGameServer)
	
	self.event_iap_products_load = function(productsList)
		self:loadProductsFromServer(productsList)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_PRODUCLIST_LOAD, self.event_iap_products_load)
	
	
	self.event_iap_buy = function(data)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		self:iapBuyItem(data)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM, self.event_iap_buy)
	
	
	self.event_check_native_pay = function()
		self:checkNativePayment()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_CHECK_NATIVE_PAY, self.event_check_native_pay)
	
	-- google支付结果的监听
	self.google_app_billing_result_listener = function(result)
		self:f_android_tw_google_app_billing_reslut(result)
	end
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setGoogleBillingResultHandler", {self.google_app_billing_result_listener}, "(I)V")
	
	self.event_tdaUserRegister = function()
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "trackRegistLog", {}, "()V")
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_REGISTERED, self.event_tdaUserLogin)
	
	-- 将商品传入
	local itemListJson = {
		"{\"itemlist\"=[\"bbjc_auer_30\",\"bbjc_auer_150\",\"bbjc_auer_300\",\"bbjc_auer_590\",\"bbjc_auer_1490\",\"bbjc_auer_2990\",\"bbjc_auer_mouth01\"]}"
	}
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setItemArrayList", itemListJson, "(Ljava/lang/String;)V")
	
	self.m_quit_game_panel = nil
	local backKeyCallback = function()
		if self.m_quit_game_panel == nil then
			self.m_quit_game_panel = require("prescripts.common.f_quit_game_panel").new()
			self.m_quit_game_panel:setShowText("退出遊戲")
			self.m_quit_game_panel:createCommonTips()
		else
			self.m_quit_game_panel:hide()
			self.m_quit_game_panel = nil
		end
	end
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setBackKeyHandler", {backKeyCallback}, "(I)V")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] isFullPack
-------------------------------------------------------------------------------
function f_android_tw_google_sdk:isFullPack()
	if self.isFullPackFlag == 1 then
		return true
	else
		return false
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] getLastAppVersion
-------------------------------------------------------------------------------
function f_android_tw_google_sdk:getLastAppVersion()
	return self.lastAppVersion
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] setFullPackFlagAppVersion
-------------------------------------------------------------------------------
function f_android_tw_google_sdk:setFullPackFlagAppVersion(fullFlag, version)
	self.isFullPackFlag = fullFlag
	self.lastAppVersion = version
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setFullPackFlagAppVersion", {fullFlag, version}, "(IF)V")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] init_sdk
-- 初始化sdk
-------------------------------------------------------------------------------
function f_android_tw_google_sdk:init_sdk()
	self:setGoogleVertifiyServer_android(self.m_vertifiy_server["ip"], self.m_vertifiy_server["port"])
	
	local vertifiyUserInfoCallback = function(type)
		local loginResult = {}
		if type >= 0 then
			loginResult["result"] = 0
			loginResult["account"] = self.m_user_info["uid"]
			loginResult["userid"] = self.m_user_info["uid"]
			loginResult["error_des"] = ""
		else
			loginResult["account"] = ""
			loginResult["userid"] = ""
			
			if type == -1 then
				loginResult["error_des"] = "未知錯誤"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_ERROR
			elseif type == -11 then
				loginResult["error_des"] = "用戶未登錄,請登錄賬號!"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN
			elseif type == -13 then
				loginResult["error_des"] = "用戶驗證失敗,請重新登錄賬號!"
				loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED
			end
		end
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	end
	self:setLoginGoogleSdkListener_android(vertifiyUserInfoCallback)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] show_sdk_view
-- 显示sdk界面
-------------------------------------------------------------------------------
function f_android_tw_google_sdk:show_sdk_view(loginType, isDefault)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	local loginCallback = function(resStr)
		local resultInfo = self.json.decode(resStr)
		self.m_user_info["flag"] = resultInfo["flag"]
		self.m_user_info["appId"] = resultInfo["appId"]
		self.m_user_info["token"] = resultInfo["token"]
		self.m_user_info["uid"] = resultInfo["uid"]
		
		self:vertifiyGoogleAccount_android(self.m_user_info["flag"], self.m_user_info["appId"], self.m_user_info["uid"], self.m_user_info["token"])
	end
	
	local loginFailedCallback = function(strCode)
		local resultInfo = self.json.decode(strCode)
		local loginResult = {}
		local type = resultInfo["errorCode"]
		loginResult["account"] = ""
		loginResult["userid"] = ""
		
		if type == -1 then
			loginResult["error_des"] = "未知錯誤"
			loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_ERROR
		elseif type == -11 then
			loginResult["error_des"] = "用戶未登錄,請登錄賬號!"
			loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN
		elseif type == -13 then
			loginResult["error_des"] = "用戶驗證失敗,請重新登錄賬號!"
			loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED
		end
	
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	end
	
	local args = 
	{
		loginType,
		isDefault,
		loginCallback,
		loginFailedCallback
	}
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "show_login", args, "(IIII)V")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] change_sdk_user
-- 更改sdk用户
-------------------------------------------------------------------------------
function f_android_tw_google_sdk:change_sdk_user()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
	local loginCallback = function(resStr)		
		local resultInfo = self.json.decode(resStr)	
		self.m_user_info["flag"] = resultInfo["flag"]
		self.m_user_info["appId"] = resultInfo["appId"]
		self.m_user_info["webId"] = resultInfo["webId"]
		self.m_user_info["token"] = resultInfo["token"]
		self.m_user_info["uid"] = resultInfo["uid"]
		
		self:vertifiyGoogleAccount_android(self.m_user_info["flag"], self.m_user_info["appId"], self.m_user_info["webId"], self.m_user_info["token"])
	end
	
	local loginFailedCallback = function(strCode)
		local resultInfo = self.json.decode(strCode)	
		
		local loginResult = {}
		local type = resultInfo["errorCode"]
		loginResult["account"] = ""
		loginResult["userid"] = ""
		if type == -1 then
			loginResult["error_des"] = "未知錯誤"
			loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_ERROR
		elseif type == -11 then
			loginResult["error_des"] = "用戶未登錄,請登錄賬號!"
			loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN
		elseif type == -13 then
			loginResult["error_des"] = "用戶驗證失敗,請重新登錄賬號!"
			loginResult["result"] = g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED
		end
	
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	end
	local args = 
	{
		loginCallback,
		loginFailedCallback
	}
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "show_login_switch_user", args, "(II)V")
end


---------------------------------------------------------------------------------
--充值部分

-------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] loadProductsFromServer
-- 使用产品key列表，刷新商店界面
-------------------------------------------------
function f_android_tw_google_sdk:loadProductsFromServer(itemList)	
	self.m_products_id_list = itemList
		
	
	self:iapRequestProductsListener(self.m_products_id_list)
end


-------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] iapRequestProductsListener
-- 模拟苹果服务器返回列表
-------------------------------------------------
function f_android_tw_google_sdk:iapRequestProductsListener(data)	
	self.m_products_array = {}	

	for key, value in ipairs(data) do 
		local itemInfo = {} 
		itemInfo["iap"] = value["itemKey"]
		itemInfo["info"] = value
		
		table.insert(self.m_products_array, itemInfo)
	end 	
	send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_INIT_SHOP_ITEM, self.m_products_array)
	
end


-------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] checkNativePayment
-- 检查本地存储得收据凭证并进行继续验证
-------------------------------------------------
function f_android_tw_google_sdk:checkNativePayment()	
--	local transactionList = g_game.g_dataManager:getPaymentTransaction()
--	if transactionList then
--		for i,v in ipairs(transactionList) do
--			--进入购买流程，需要loading显示阻挡用户进行其他操作
--			self:requestTransitionVertifyFromGameServer(v["transactionIdentifier"])
--		end
--	end
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "queryItemInfo", {}, "()V")
end

-------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] requestBuyResultFromGameServer
-- 发送购买收据到服务器进行验证
-------------------------------------------------
function f_android_tw_google_sdk:requestBuyResultFromGameServer(transactionIdentifier, receipt)
	local dataT = {}
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local dataT = {}
	dataT["roleId"] = userInfo["roleId"]
	dataT["transactionID"] = transactionIdentifier
	dataT["receipt"] = receipt
	dataT["productId"] = self.m_current_buy_item_data["info"]["id"]
	dataT["flag"] = 1
	g_game.g_netManager:send_message(g_network_message_type.CS_TRANSACTION, dataT)
	
	--sdk事件收集
	local eventData = {}
	eventData["orderId"] = transactionIdentifier
	eventData["prince"] = self.m_current_buy_item_data["info"]["price"]
	eventData["iapId"] = self.m_current_buy_item_data["info"]["itemKey"]
	eventData["ybNum"] = self.m_current_buy_item_data["info"]["gold"]
	eventData["currencyType"] = "NT$"
	eventData["paymentType"] = "google-in-app-billing"
	send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_START, eventData)
	
	-- PartyTrack sdk    记录付费情况
	local paraTable = {
		self.m_current_buy_item_data["info"]["productName"] or "元宝",
		self.m_current_buy_item_data["info"]["price"]
		}
	local paraType = "(Ljava/lang/String;I)V"
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "partyTrackPayment", paraTable, paraType)
end

-------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] iapBuyItem
-- 请求购买物品的订单id
-------------------------------------------------
function f_android_tw_google_sdk:iapBuyItem(data)	
	self.m_current_buy_item_data = data
	--buy item from Google sdk here
	local args =
	{
		self.m_current_buy_item_data["info"]["itemKey"]
	}
	g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "buyItemWithInfo", args, "(Ljava/lang/String;)V")
end

----------------------------------------------------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] f_android_tw_google_app_billing_reslut
-- 客户端购买成功后的处理
----------------------------------------------------------------------------------------------
function f_android_tw_google_sdk:f_android_tw_google_app_billing_reslut(result)
	local resultInfo = self.json.decode(result)
	local type = resultInfo["type"] -- 1 继续购买流程 2 返回购买错误码
	if type == 1 then
		local orderId = resultInfo["orderId"]
		local buyResult = resultInfo["buyResult"]
		self:requestBuyResultFromGameServer(orderId, buyResult)
	elseif type == 2 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
end

-------------------------------------------------
-- @function [parent=#f_android_tw_google_sdk] responseBuyResultFromGameServer
-- 从游戏服务器接收购买物品结果
-------------------------------------------------
function f_android_tw_google_sdk:responseBuyResultFromGameServer(msg)	
-- 		["result"] Type:BYTE Size:1 是否成功
-- 		["errorCode"] Type:INTEGER Size:4 失败代码
-- 		["userGold"] Type:INTEGER Size:4 用户gold数量
-- 		["transactionID"] Type:STRING Size:8 交易ID
	
	if msg["result"] == 0 then	--   -2 服务器数据库错误  －1 正在验证   0 成功  1  未验证  2  失败
		g_game.g_userInfoManager:updateUserGold(msg["userGold"])
		
		local transactionId = msg["transactionID"]
		g_game.g_dataManager:removePaymentTransaction(transactionId)
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD)
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = true, ["productId"] = msg["productId"]})
		
		--sdk事件收集
		local eventData = {}
		eventData["orderId"] = msg["transactionID"]
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_BUYITEM_SUCCESS, eventData)
		
		local chData = {}
		chData["currencyAmount"] = msg["money"]
		chData["currencyType"] = "NT$"
		chData["paymentType"] = "google支付"		
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_SUCCESS, chData)
	elseif msg["result"] == 1 then
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	elseif msg["result"] == 2 then
		local transactionId = msg["transactionID"]
		g_game.g_dataManager:removePaymentTransaction(transactionId)
		
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	elseif msg["result"] == -2 or msg["result"] == -1 then
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	else
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

return f_android_tw_google_sdk