--[[--
   	windows版本，用于接受一系列sdk消息，保证数据流程正常运转
--]]--

local f_win32_simulator_sdk = class("f_win32_simulator_sdk", function()
    return fc.FSdkManager:getInstance()
end)

function f_win32_simulator_sdk:ctor()
	self.m_sdk_info = {"P10235", "D10026", "35wrszfgzf2236n3160n"}
	
	self.json   = require("prescripts.framework.json")
	self.m_version_list = nil
	
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
	
	
	--充值	
	self.getTransitionInfo= function(msg)
		self:responseTranscationInfoFromGameServer(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_TRANSACTION_INFO,self.getTransitionInfo)
	
		
	self.getBuyResultFromGameServer= function(msg)
		self:responseBuyResultFromGameServer(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_TRANSACTION, self.getBuyResultFromGameServer)
	
	
	
	self.event_iap_products_load = function(productsList)
		self:loadProductsFromServer(productsList)
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
	
	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] init_sdk
-- 初始化sdk
-------------------------------------------------------------------------------
function f_win32_simulator_sdk:init_sdk()	
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] show_sdk_view
-- 显示sdk界面
-------------------------------------------------------------------------------
function f_win32_simulator_sdk:show_sdk_view()
	local winInputPanel = require("scripts.game.login.f_login_win_input_user").new()
	
	local loginSuccessCallback = function(userName)
		local loginResult = 
		{
			["result"] = 0, ["account"] = userName, ["error_des"] = "",	["userid"] = userName
		}
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
		self:hide_sdk_view()
	end
	--快速登录模拟
	local fastLoginCallback = function (  )
		local tip = "您将以遊客身份登入遊戲，在綁定帳號之前，刪除應用程式或變更裝置時，資料可能無法保留。为保障您的帳號安全，请尽快綁定facebook/gmail帳號。是否確定以遊客身份登入？"
	 	g_game.g_utilManager:showAlertLayer(tip,function (  )
	 		self:fastLoginAlter()
	 	end)
		
	end
	winInputPanel:showFastLoginBtn()
	winInputPanel:setInputDoneCallback(loginSuccessCallback)	
	winInputPanel:setFastLoginCallBack(fastLoginCallback)	
	g_game.g_panelManager:showUiPanel(winInputPanel,"login_win_input")
	winInputPanel:showInput()
end

function f_win32_simulator_sdk:fastLoginAlter(  )
	local udid = g_game.g_system:getUUID()	
	local loginResult = 
	{
		["result"] = 0, 
		["account"] = DEBUG_SDK_TYPE.."_"..udid, 
		["error_des"] = "",	
		["userid"] = DEBUG_SDK_TYPE.."_"..udid,
		["isFastLogin"] = true
	}
	send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, loginResult)
	self:hide_sdk_view()
end
-------------------------------------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] hide_sdk_view
-- 隐藏sdk界面
-------------------------------------------------------------------------------
function f_win32_simulator_sdk:hide_sdk_view()
	g_game.g_panelManager:removeUiPanel("login_win_input")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] change_sdk_user
-- 更改sdk用户
-------------------------------------------------------------------------------
function f_win32_simulator_sdk:change_sdk_user()
	self:show_sdk_view()
end


---------------------------------------------------------------------------------
--充值部分

-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] loadProductsFromServer
-- 使用产品key列表，刷新商店界面
-------------------------------------------------
function f_win32_simulator_sdk:loadProductsFromServer(itemList)	
	self.m_products_id_list = itemList
		
	
	self:iapRequestProductsListener(self.m_products_id_list)
end


-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] iapRequestProductsListener
-- 模拟苹果服务器返回列表
-------------------------------------------------
function f_win32_simulator_sdk:iapRequestProductsListener(data)	
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
-- @function [parent=#f_win32_simulator_sdk] checkNativePayment
-- 检查本地存储得收据凭证并进行继续验证
-------------------------------------------------
function f_win32_simulator_sdk:checkNativePayment()	
	local transactionList = g_game.g_dataManager:getPaymentTransaction()
	if transactionList then		
		for i,v in ipairs(transactionList) do
			--进入购买流程，需要loading显示阻挡用户进行其他操作
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
			self:requestTransitionVertifyFromGameServer(v["transactionIdentifier"])
		end
	end
end


-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] iapBuyItem
-- 请求购买物品的订单id
-------------------------------------------------
function f_win32_simulator_sdk:iapBuyItem(data)	
--	return
	self.m_current_buy_item_data = data
	
	self:requestTransitionInfoFromGameServer()
end

-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] buyResultFromPPServer
-- 接收PP服务器返回的购买结果
-------------------------------------------------
function f_win32_simulator_sdk:buyResultFromPPServer(type)	
	if type == 0 then	
		if self.m_current_save_trascation then			
			g_game.g_dataManager:removePaymentTransaction(self.m_current_save_trascation)
			self.m_current_save_trascation = nil
		end		
	end
	if type == -1 or type == -2 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	elseif type == -3 then
		g_game.g_utilManager:showMsg("购买商品请求处理成功!如果长 时间未收到商品请联系 PP 充值客服。电话:020-38276673。")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
end

-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] responseTranscationInfoFromGameServer
-- 接收游戏服务器返回的订单号等信息
-------------------------------------------------
function f_win32_simulator_sdk:responseTranscationInfoFromGameServer(msg)	
	if msg["result"] == 0 then		
		self:buyResultFromPPServer(0)
		
		self.m_current_save_trascation = msg["transactionId"]
	else
		if self.m_current_buy_item_data["info"]["id"] == g_game.g_f_month_card_info["info"]["id"] then
			g_game.g_utilManager:showMsg("购买月卡失败，请重新购买!")
		else
			g_game.g_utilManager:showMsg("购买元宝失败，请重新购买!")
		end
		send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, {["result"] = false, ["productId"] = self.m_current_buy_item_data["info"]["id"]})	
		self.m_current_buy_item_data = nil
	end
end

-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] requestTransitionInfoFromGameServer
-- 向服务器发送购买请求，并获取订单id
-------------------------------------------------
function f_win32_simulator_sdk:requestTransitionInfoFromGameServer()		
	local dataT = {}
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local dataT = {}
	dataT["roleId"] = userInfo["roleId"]
	dataT["transactionID"] = "none"
	dataT["receipt"] = "none"
	dataT["productId"] = self.m_current_buy_item_data["info"]["id"]
	dataT["flag"] = 0
	g_game.g_netManager:send_message(g_network_message_type.CS_TRANSACTION, dataT)
end


-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] requestTransitionVertifyFromGameServer
-- 使用本地缓存的未完成订单，向服务器再次验证
-------------------------------------------------
function f_win32_simulator_sdk:requestTransitionVertifyFromGameServer(transcationId)	
	
	
	local dataT = {}
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local dataT = {}
	dataT["roleId"] = userInfo["roleId"]
	dataT["transactionID"] = transcationId
	dataT["receipt"] = "none"
	dataT["productId"] = "none"
	dataT["flag"] = 1
	g_game.g_netManager:send_message(g_network_message_type.CS_TRANSACTION, dataT)
end


-------------------------------------------------
-- @function [parent=#f_win32_simulator_sdk] responseBuyResultFromGameServer
-- 从游戏服务器接收购买物品结果
-------------------------------------------------
function f_win32_simulator_sdk:responseBuyResultFromGameServer(msg)	
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
			
		
		self:buyResultFromPPServer(0)
		
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


return f_win32_simulator_sdk