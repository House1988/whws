require("scripts.game.main.shangcheng.f_vip_panel")
require("scripts.game.main.shangcheng.f_iap_item")
require("scripts.game.main.shangcheng.f_shangcheng_monthcarditem")

--[[--
	充值 主面板
--]]--
f_shangcheng_chongzhi_panel = class("f_shangcheng_chongzhi_panel")
f_shangcheng_chongzhi_panel.__index = f_shangcheng_chongzhi_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel.static_create()
	local shangcheng_chongzhi_Table = g_game.g_panelManager:create_panel("shangcheng_chongzhi")
	local shangcheng_chongzhi_Panel = shangcheng_chongzhi_Table["shangcheng_chongzhi"]
	  
	local funTable = {}
	tolua.setpeer(shangcheng_chongzhi_Panel, funTable)
	setmetatable(funTable, f_shangcheng_chongzhi_panel)
	
	shangcheng_chongzhi_Panel.m_componentTable = shangcheng_chongzhi_Table
	return shangcheng_chongzhi_Panel  
end

function f_shangcheng_chongzhi_panel:openQiandao()
	self.m_openQiandao = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.COL				= 3
	self.ROW				= 2
	self.m_total_pages		= 0
	self.m_all_item_info 	= nil
	self.m_item_array		= {}
	
	self.m_current_buy_index = 0
	self.isVisible = false
	
	self.m_openQiandao = false
	
	self.m_purChaseList = nil
--[[
	--接收充值结果
	self.getProductsListFromGameServer= function(msg)
		self:responseProductsIdFromGameServer(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_ITEM_LIST,self.getProductsListFromGameServer)
]]--	
	
	--本地事件
	self.event_load_products_ui = function(productsList)
		self.m_purChaseList = productsList
		self:initStoreItem(productsList)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_INIT_SHOP_ITEM, self.event_load_products_ui)
	
	self.event_buy_item_result = function(buyResult)
		self:buyItemDoneCallback(buyResult)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, self.event_buy_item_result)
	
	self.event_updateFirstCornerFlag = function()
		self:refreshCornerFlag()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG, self.event_updateFirstCornerFlag)
	
	if LANGUAGE_TYPE == 3 then 
		self.m_componentTable["sc_monthcard_price"]:setString("NT$" .. tostring(g_game.g_f_month_card_info["info"]["price"]))
	else
		self.m_componentTable["sc_monthcard_price"]:setString("￥" .. tostring(g_game.g_f_month_card_info["info"]["price"]))
	end
	local func = function() end
	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["sc_monthcard_limit1"]:setComplexString(g_game.g_utilManager:getEncodeString("分[0,255,255]30[255,255,0]次領取，每月限購", cc.c3b(255,255,0)), func)
	else
		self.m_componentTable["sc_monthcard_limit1"]:setComplexString(g_game.g_utilManager:getEncodeString("分[0,255,255]30[255,255,0]次领取，每月限购", cc.c3b(255,255,0)), func)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_shangcheng_chongzhi_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] onEnter
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:onEnter()
	self:judgeFirstChargeFlag()
	
	self:initPurchaseList()
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] onExit
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:onExit()  
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG, self.event_updateFirstCornerFlag)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT, self.event_buy_item_result)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_VIP_CHONGZHI_YUANBAO_CHENGGONG, self.event_getVipChongzhiYuanbaoChenggong)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_IAP_INIT_SHOP_ITEM, self.event_load_products_ui)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] onCleanup
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] closeCurrentPanel
-- 关闭当前面板
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:closeCurrentPanel()
	g_game.g_panelManager:removeUiPanel("shangcheng_chongzhi")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:initAllComponent()
	self.m_componentTable["sc_cz_bg"]:setImage(g_game.g_resourceManager:getUiMap("chongzhi_ditu"))
	self.m_componentTable["sc_cz_bg"]:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self.m_componentTable["sc_cz_bg"]:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	

	--vip界面弹出
	local vipCallback = function()
		--发送获取充值元宝信息
		self:showVipTequan()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["sc_cz_vip_zhuizi_button"]:addHandleOfcomponentEvent(vipCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )	
		
	--注册关闭按钮
	local closeCallback = function()
		self:closeCurrentPanel()
		if self.m_openQiandao then
			g_game.g_userInfoManager:requestQiandaoInfo()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["sc_cz_close_button"]:addHandleOfcomponentEvent(closeCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )	
	
	-- 刷新充值界面,如果升级则打开vip特权界面
	self.event_getVipChongzhiYuanbaoChenggong = function()
		self:refreshVipInfo()
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_VIP_CHONGZHI_YUANBAO_CHENGGONG, self.event_getVipChongzhiYuanbaoChenggong)
	
	-- 购买月卡按钮
	local monthCardBtnClick = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("main_popup")
		g_game.g_userInfoManager.m_shouldOpenHuodong = true
		g_game.g_userInfoManager:requestHuodongList()
	end
	self.m_componentTable["sc_monthcard_btn"]:addHandleOfcomponentEvent(monthCardBtnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )	
	
	-- 显示月卡奖励物品
	local rewardItems = {{4,0,"3140"},{1,40,""},{1,46,""},{1,20,""}}
	for i=1,4 do
		local monthcarditem = f_shangcheng_monthcarditem.static_create()
		self:appendComponent(monthcarditem)
		monthcarditem:setPositionInContainer(cc.p(74+(i-1)%2*132, 316 + math.ceil(i/2)*106))
		local imagePath, qulity, name = g_game.g_dictConfigManager:getResByType(rewardItems[i][1], rewardItems[i][2])
		monthcarditem:setCount("")
		monthcarditem:setName(rewardItems[i][3] .. name)
		monthcarditem:setImage(imagePath)
		monthcarditem:setQulityBg(g_game.g_f_quality_image[qulity])
	end
	
	
	self:refreshVipInfo()

	self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] refreshVipInfo
-- 刷新玩家vip信息
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:refreshVipInfo()
	--获取到用户vip信息
	local vipDict = g_game.g_dictConfigManager:getVipInfo()
	local info = g_game.g_userInfoManager:getUserInfo()
	local vipCurrent = info["vipLevel"]
	
	if vipCurrent < (#vipDict - 1) then
		local vipNext = vipCurrent + 1	
		--获取vip元宝信息
		local vipYuanbao = g_game.g_userInfoManager:getUserChongzhiYuanbao()
		--获取到当前vip的多余(不足以升到下一级)元宝数
		local vipExtraYuanbao = vipYuanbao - g_game.g_dictConfigManager:getVipNeedYuanbao(vipCurrent)		
		--获取到当前vip升级到下一级所需元宝
		local vipNeedYuanbao = g_game.g_dictConfigManager:getVipNeedYuanbao(vipNext) - g_game.g_dictConfigManager:getVipNeedYuanbao(vipCurrent)
		--计算百分比
		local percent =  vipExtraYuanbao/vipNeedYuanbao 
		
		--设置当前vip级别
		self.m_componentTable["sc_cz_dangqian_vip_num"]:setString(string.format("%d", vipCurrent))
		--设置下一个vip级别
		self.m_componentTable["sc_cz_shengzhi_vip_num"]:setString(string.format("%d", vipNext))
	
		
		--设置进度条显示
		self.m_componentTable["sc_cz_loading_bar"]:setPercent(percent*100)
		--设置文字显示（再充值升到下一级）
		self.m_componentTable["sc_cz_zaichongzhi_num_label"]:setString(string.format("%d", vipNeedYuanbao-vipExtraYuanbao))
		self.m_componentTable["yuanbao"]:setVisible(true)
		self.m_componentTable["vipIcon1"]:setVisible(true)
		self.m_componentTable["shengjidao_label"]:setVisible(true)
		--设置最高vip提示不显示
--		self.m_componentTable["vip_max_vip_image"]:setVisible(false)
	else		
		--设置当前vip级别
		self.m_componentTable["sc_cz_dangqian_vip_num"]:setString(string.format("%d", vipCurrent))
		
		--设置下一个vip级别
		self.m_componentTable["sc_cz_shengzhi_vip_num"]:setVisible(false)
		self.m_componentTable["sc_cz_loading_bar"]:setVisible(false)
		self.m_componentTable["sc_cz_zaichongzhi_num_label"]:setVisible(false)
		self.m_componentTable["sc_cz_zaichongzhi_label"]:setVisible(false)
		self.m_componentTable["yuanbao"]:setVisible(false)
		self.m_componentTable["vipIcon1"]:setVisible(false)
		self.m_componentTable["shengjidao_label"]:setVisible(false)
--		self.m_componentTable["sc_cz_shengzhi_vip"]:setVisible(false)
	
		
		--设置最高vip提示不显示
--		self.m_componentTable["vip_max_vip_image"]:setVisible(true)
	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] showVipTequan
-- 显示vip特权界面（获取到元宝充值数量成功后）
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:showVipTequan()
	local vipPanel = f_vip_panel.static_create()
	vipPanel:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(vipPanel,"vip")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] initPurchaseList
-- 初始化购买列表
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:initPurchaseList()

	self:requestProductsIdFromGameServer()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] initStoreItem
-- 初始化商店界面
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:initStoreItem(productsArray)
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_all_item_info = productsArray
	
	self.m_total_pages = math.ceil(#self.m_all_item_info / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(685, 480))
	self.m_page_container:setPositionInContainer(cc.p(615, 381))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
       
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
	
	self.m_page_container:setPageInfo(#self.m_all_item_info, self.ROW, self.COL, 10, 5, 220, 221)	

	--产品信息获取完成
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	
end

function f_shangcheng_chongzhi_panel:judgeFirstChargeFlag()
	local flag = g_game.g_userInfoManager:getFirstChargeFlag()
	
	if flag == nil then
		return
	end
	
	if flag["result"] == 1 then
		self.isVisible = false
	elseif flag["result"] == 0 then 
		self.isVisible = true
	elseif flag["result"] == 2 then
		self.isVisible = false
	end
end

function f_shangcheng_chongzhi_panel:refreshCornerFlag()
	self:judgeFirstChargeFlag()
	
	self:initStoreItem(self.m_purChaseList)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local removeItem = function(index)
		self:removeItem(index)
	end
	
	local buyItem = function(index)
		self:buyItem(index)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
		
	for i = startIndex, endIndex do
		if #self.m_all_item_info >= i then
			local item = f_iap_item.static_create()
			item:panelInitBeforePopup()
			self.m_page_container:addComponentToPage(item, pageIndex)
			item:setData(self.m_all_item_info[i])
			item:setIndex(i)				
			item:setRemoveCallback(removeItem)
			item:setBuyCallback(buyItem)
			item:setCornerFlagVisible(self.isVisible)
			
			table.insert(self.m_item_array, item)
			
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] removeItem
-- 删除皇子
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:removeItem(index)	
	local data = self.m_all_item_info[index]
	
	for i = 1, #self.m_item_array do
		if data == self.m_item_array[i]:getData() then
			table.remove(self.m_item_array, i)
			break
		end	
	end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] buyItemDoneCallback
-- 购买物品完成回调
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:buyItemDoneCallback(buyResult)
	if buyResult["productId"] < 7 then
		if buyResult["result"] == true then
			if self.m_current_buy_index > 0 then
				local data = self.m_all_item_info[self.m_current_buy_index]
				local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_BUY_ITEM_GET_CONS)
				local tips = string.format(tips, data["info"]["gold"])		
				
				g_game.g_utilManager:showCustomMessagePanel(tips)	
				
				--刷新vip数据
				g_game.g_userInfoManager:sendToGetVipYuanbao()
				--如果限时充值奖励打开，则刷新限时充值奖励界面
				local rewardPanel = g_game.g_panelManager:getUiPanel("reward_panel")
				if rewardPanel ~= nil then
					local userInfo = g_game.g_userInfoManager:getUserInfo()
					local sendMsg = {}
					sendMsg["roleId"] = userInfo["roleId"]
					g_game.g_netManager:send_message(g_network_message_type.CS_GET_PEROID_CHARGE_INFO, sendMsg)
					g_game.g_userInfoManager:setNeedRefreshPeroidCharge(true)
				end
				-- 首充奖励
				g_game.g_userInfoManager:requestFirstChargeFlag()
			end
		else
			g_game.g_utilManager:showFloatingMsg("服务器未验证成功,购买元宝失败!")
		end
	
		self.m_current_buy_index = 0
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] buyItem
-- 购买物品
-------------------------------------------------------------------------------
function f_shangcheng_chongzhi_panel:buyItem(index)	
	local data = self.m_all_item_info[index]
	self.m_current_buy_index = index
	
	-- 增加商品名称
	data["info"]["productName"] = "元宝"
	
	--进入购买流程，需要loading显示阻挡用户进行其他操作
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_BUY_ITEM, data)	
	
end


-------------------------------------------------------------------------------
--用于付费产品请求列表
-------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] requestProductsIdFromGameServer
-- 从游戏服务器请求iap产品id数组
-------------------------------------------------
function f_shangcheng_chongzhi_panel:requestProductsIdFromGameServer()	
	--loading状态，加载服务器产品列表，并从apple server获取产品信息
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local dataT = {}
	dataT["roleId"] = userInfo["roleId"]
		
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_SHOP_ITEM, dataT)
end

--[[

-------------------------------------------------
-- @function [parent=#f_shangcheng_chongzhi_panel] responseProductsIdFromGameServer
-- 从游戏服务器接收iap产品id数组
-------------------------------------------------
function f_shangcheng_chongzhi_panel:responseProductsIdFromGameServer(msg)		
	send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_PRODUCLIST_LOAD, msg["itemList"])	
end

]]--


