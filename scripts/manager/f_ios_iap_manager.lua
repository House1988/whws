--[[--
    ios iap manager，用于ios app store购买
--]]--

local f_lua_ios_iap_manager = class("f_lua_ios_iap_manager")
f_lua_ios_iap_manager.__index = f_lua_ios_iap_manager

-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] ctor
-------------------------------------------------
function f_lua_ios_iap_manager:ctor()	
	self.m_ios_store = nil
	self:open()
	
	self.m_products_id_list	= nil
	
	self.m_products_array = {}
		
	self.m_current_buy_item_data = nil
	
	--本地事件
	self.event_iap_products_load = function(productsList)
		self:loadProductsFromAppleServer(productsList)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_PRODUCLIST_LOAD, self.event_iap_products_load)
	
	
	self.event_iap_buy = function(data)
		self:iapBuyItem(data)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM, self.event_iap_buy)
	
	
	self.event_check_native_pay = function()
		self:checkNativePayment()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_CHECK_NATIVE_PAY, self.event_check_native_pay)
	
	
	self.getBuyResultFromGameServer= function(msg)
		self:responseBuyResultFromGameServer(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_TRANSACTION, self.getBuyResultFromGameServer)
	
	
end

-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] open
-- 开启购买模块
-------------------------------------------------
function f_lua_ios_iap_manager:open()	
	local iosStoreListener = function(transaction)
		self:iapStoreListener(transaction)
	end
	if self.m_ios_store == nil then
		self.m_ios_store 		= require("prescripts.framework.api.Store")
	   	self.m_ios_store.init(iosStoreListener)
	else
	   	self.m_ios_store.init(iosStoreListener)
	end
end


-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] loadProductsFromAppleServer
-- 使用产品key列表，从苹果服务器验证
-------------------------------------------------
function f_lua_ios_iap_manager:loadProductsFromAppleServer(itemList)	
	self.m_products_id_list = itemList
	
	
	local iosRequestProductsListener = function(data)
		self:iapRequestProductsListener(data)
	end
	
	local productKeyList = {}
	for i, v in ipairs(self.m_products_id_list) do
		table.insert(productKeyList, v["itemKey"])
	end
	
	table.insert(productKeyList, g_game.g_f_month_card_info["info"]["itemKey"])
	
   	self.m_ios_store.loadProducts(productKeyList, iosRequestProductsListener)
end

-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] getItemInfo
-- 使用productIdentifier从游戏内购数组中获取物品信息
-------------------------------------------------
function f_lua_ios_iap_manager:getItemInfo(productIdentifier)	
	for i, value in ipairs(self.m_products_id_list) do
		if value["itemKey"] == productIdentifier then
			return value
		end
	end
	return nil
end

-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] requestBuyResultFromGameServer
-- 发送购买收据到服务器进行验证
-------------------------------------------------
function f_lua_ios_iap_manager:requestBuyResultFromGameServer(transactionIdentifier, receipt, isNativePayment)
	local dataT = {}
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local dataT = {}
	dataT["roleId"] = userInfo["roleId"]
	dataT["transactionID"] = transactionIdentifier
	dataT["receipt"] = receipt
	dataT["productId"] = self.m_current_buy_item_data["info"]["id"]
	if isNativePayment == true then
		dataT["flag"] = 1
	else
		dataT["flag"] = 0
	end
	g_game.g_netManager:send_message(g_network_message_type.CS_TRANSACTION, dataT)
	
	
	--sdk事件收集
	local eventData = {}
	eventData["orderId"] = transactionIdentifier
	eventData["prince"] = self.m_current_buy_item_data["info"]["price"]
	eventData["iapId"] = self.m_current_buy_item_data["info"]["itemKey"]
	eventData["ybNum"] = self.m_current_buy_item_data["info"]["gold"]
	eventData["currencyType"] = "CNY"
	eventData["paymentType"] = "appstore"
	send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_START, eventData)
end


-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] checkNativePayment
-- 检查本地存储得收据凭证并进行继续验证
-------------------------------------------------
function f_lua_ios_iap_manager:checkNativePayment()	
	local transactionList = g_game.g_dataManager:getPaymentTransaction()
	if transactionList then		
		for i,v in ipairs(transactionList) do
			--进入购买流程，需要loading显示阻挡用户进行其他操作
--			self:requestBuyResultFromGameServer(v["transactionIdentifier"], v["receipt"], true)
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] iapStoreListener
-- 交易结果回调处理
-------------------------------------------------
function f_lua_ios_iap_manager:iapStoreListener(transaction)	
	if transaction.transaction.state == "purchased" then
--		g_game.g_dataManager:savePaymentTransaction(transaction.transaction)
		--发送收据凭证给game server
		self:requestBuyResultFromGameServer(transaction.transaction["transactionIdentifier"], transaction.transaction["receipt"], false)
	else
		if transaction.transaction.state == "unknown" then		
		elseif transaction.transaction.state == "purchasing" then
		elseif transaction.transaction.state == "failed" then
		elseif transaction.transaction.state == "restored" then
		elseif transaction.transaction.state == "cancelled" then
		end
		
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = self.m_current_buy_item_data["info"]["id"]})
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end	
	self.m_ios_store.finishTransaction(transaction.transaction)
	
end


-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] iapRequestProductsListener
-- 请求ios store数据回调处理
-------------------------------------------------
function f_lua_ios_iap_manager:iapRequestProductsListener(data)	
	self.m_products_array = {}	
	
	if data["errorCode"] == nil then	
		for key, value in pairs(data["products"]) do 
			local info = self:getItemInfo(value["productIdentifier"])
			if info ~= nil then
				local itemInfo = {} 
				itemInfo["iap"] = value
				itemInfo["info"] = info
				
				table.insert(self.m_products_array, itemInfo)
			end		
		end 	
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_INIT_SHOP_ITEM, self.m_products_array)
	else		
		if data["errorCode"] == -1 then
			CCLOG("CCStoreProductsRequestErrorCancelled")
		elseif data["errorCode"] == -2 then
			CCLOG("CCStoreProductsRequestErrorPreviousRequestNotCompleted")
		end
	end
	
end


-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] getCustomTrascationIdForUser
-- 用于sdk事件统计
-------------------------------------------------
function f_lua_ios_iap_manager:getCustomTrascationIdForUser()
	local userId = g_game.g_userInfoManager:getUserRoleId()	
	local timeTamp = g_game.g_gameManager:getCurrentTime()
	local randomNum = math.random(1, 10)
	return tostring(userId) + tostring(timeTamp) + tostring(randomNum)
end

-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] iapBuyItem
-- 请求ios 购买物品
-------------------------------------------------
function f_lua_ios_iap_manager:iapBuyItem(data)	
	if self.m_ios_store.canMakePurchases() then	
		self.m_current_buy_item_data = data	
		self.m_ios_store.purchase(data["iap"]["productIdentifier"])
		
	else
	
	end
end


-------------------------------------------------
-- @function [parent=#f_lua_ios_iap_manager] responseBuyResultFromGameServer
-- 从游戏服务器接收购买物品结果
-------------------------------------------------
function f_lua_ios_iap_manager:responseBuyResultFromGameServer(msg)	
-- 		["result"] Type:BYTE Size:1 是否成功
-- 		["errorCode"] Type:INTEGER Size:4 失败代码
-- 		["userGold"] Type:INTEGER Size:4 用户gold数量
-- 		["transactionID"] Type:STRING Size:8 交易ID

	if msg["result"] == 0 then	--   -2 服务器数据库错误  －1 正在验证   0 成功  1  未验证  2  失败
		g_game.g_userInfoManager:updateUserGold(msg["userGold"])
		
		local transactionId = msg["transactionID"]
--		g_game.g_dataManager:removePaymentTransaction(transactionId)
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD)
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = true, ["productId"] = msg["productId"]})
		
		
		--sdk事件收集
		local eventData = {}
		eventData["orderId"] = msg["transactionID"]
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_BUYITEM_SUCCESS, eventData)
		
		local tdaEventData = {}
		tdaEventData["orderId"] = msg["transactionID"]
		tdaEventData["prince"] = self.m_current_buy_item_data["info"]["price"]
		tdaEventData["currencyType"] = "CNY"
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_PAY, tdaEventData)		
	elseif msg["result"] == 1 then
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	elseif msg["result"] == 2 then
		local transactionId = msg["transactionID"]
--		g_game.g_dataManager:removePaymentTransaction(transactionId)
		
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	elseif msg["result"] == -2 or msg["result"] == -1 then
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	else
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = msg["productId"]})
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	
	self.m_current_buy_item_data = nil
end

return f_lua_ios_iap_manager