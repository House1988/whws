require("scripts.game.main.shangcheng.f_keju_qindiandachen_panel")

--[[--
	科举 主面板
--]]--
f_keju_panel = class("f_keju_panel")
f_keju_panel.__index = f_keju_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_keju_panel.static_create()
	local keju_Table = g_game.g_panelManager:create_panel("keju")
	local keju_Panel = keju_Table["keju"]
	  
	local funTable = {}
	tolua.setpeer(keju_Panel, funTable)
	setmetatable(funTable, f_keju_panel)
	
	keju_Panel.m_componentTable = keju_Table
	return keju_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_keju_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_keju_mingchen_list = nil
	self.m_keju_type = 0
	
--	self.m_deltaTime = 0
	--三个选择时间
	self.m_xiangshi_shijian = 0
	self.m_huishi_shijian = 0
	self.m_dianshi_shijian = 0
	
	--三个选择次数
	self.m_xiangshi_count = 0
	self.m_huishi_count = 0
	self.m_dianshi_count = 0
	
	self.TYPE_XIANGSHI = 1
	self.TYPE_HUISHI = 2
	self.TYPE_DIANSHI = 3
	self.m_triggeredTable = {}
	self.m_triggeredTable[self.TYPE_XIANGSHI] = false
	self.m_triggeredTable[self.TYPE_HUISHI] = false
	self.m_triggeredTable[self.TYPE_DIANSHI] = false
	
	--需要花费元宝获得科举资格的标志（存在CD时间，则为true）
	self.m_xiangshi_yuanbao = false
	self.m_huishi_yuanbao = false
	self.m_dianshi_yuanbao = false	
	
	--乡试次数为0状态（目标：点击后元宝购买 - 不走CD）
	self.m_xiangshi_0_state = false
	
	--乡试CD事件内使用元宝状态（目标：点击后元宝购买 - 不减少免费次数（本地））
	self.m_xiangshi_cd_yuanbao = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_keju_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_keju_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_keju_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] onEnter
-------------------------------------------------------------------------------
function f_keju_panel:onEnter()
	self.m_componentTable["keju_big_bg"]:setImage(g_game.g_resourceManager:getUiMap("choukaditu"))
    self.m_componentTable["keju_big_bg"]:setExtensionsTextureRect(cc.rect(0,0,956,553))
    self.m_componentTable["keju_big_bg"]:setPositionInContainer(cc.p(958/2,553/2))
	self:setStopTouchEvent(true)

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] onExit
-------------------------------------------------------------------------------
function f_keju_panel:onExit()  
    self:unregisterNodeEvent()
    
    g_game.g_gameManager:removeUpdateObj(self)	
    
    --移除注册接收名臣列表回调函数
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_LEFT_TIME, self.event_leftTime)
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_MINGCHEN_LIST, self.event_updateKejuMingchenList)
    
--    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_INFO, self.event_updateKejuCDTimeAndTimes)
	
	 --移除注册服务器收到名臣选择情况回调函数
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_RECEIVE_KEJU_SELECT_BACK_CALL, self.event_selectKejuMingchenResult)
    
    self.m_keju_mingchen_list = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_keju_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_keju_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] onCleanup
-------------------------------------------------------------------------------
function f_keju_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_keju_panel:initAllComponent()

	self:setCDTimeIsVisible(self.TYPE_XIANGSHI, false)
	self:setCDTimeIsVisible(self.TYPE_HUISHI, false)
	self:setCDTimeIsVisible(self.TYPE_DIANSHI, false)
	--乡试按钮回调，发送乡试消息
	local xiangshiCallback = function()
		if self.m_triggeredTable[self.TYPE_XIANGSHI] == false then
			--获得当前元宝
			local userInfo =  g_game.g_userInfoManager:getUserInfo()
			local gold = userInfo["gold"]
			--判断元宝是否充足
			if 10 <= gold then
				self:showTishiYuanbao(self.TYPE_XIANGSHI)
			else
				self:showTishiYuanbaoBuzu(self.TYPE_XIANGSHI)
			end
		else
			self.m_keju_type = 1
			g_game.g_userInfoManager:requestKejumingchenList(1)
		end		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIAOLUO)
	end
	self.m_componentTable["kj_luo_xiang_button"]:addHandleOfcomponentEvent(xiangshiCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--会试按钮回调，发送会试消息
	local huishiCallback = function()
		if self.m_triggeredTable[self.TYPE_HUISHI] == false then
			--获得当前元宝
			local userInfo =  g_game.g_userInfoManager:getUserInfo()
			local gold = userInfo["gold"]
			--判断元宝是否充足
			if 100 <= gold then
				self:showTishiYuanbao(self.TYPE_HUISHI)
			else
				self:showTishiYuanbaoBuzu(self.TYPE_HUISHI)
			end
		else
			self.m_keju_type = 2
									 
			g_game.g_userInfoManager:requestKejumingchenList(2)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIAOLUO)
	end
	self.m_componentTable["kj_luo_hui_button"]:addHandleOfcomponentEvent(huishiCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--殿试按钮回调，发送殿试消息
	local dianshiCallback = function()
		if self.m_triggeredTable[self.TYPE_DIANSHI] == false then
			--获得当前元宝
			local userInfo =  g_game.g_userInfoManager:getUserInfo()
			local gold = userInfo["gold"]
			--判断元宝是否充足
			if 300 <= gold then
				self:showTishiYuanbao(self.TYPE_DIANSHI)
			else
				self:showTishiYuanbaoBuzu(self.TYPE_DIANSHI)
			end
		else
			self.m_keju_type = 3
			g_game.g_userInfoManager:requestKejumingchenList(3)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIAOLUO)
	end
	self.m_componentTable["kj_luo_dian_button"]:addHandleOfcomponentEvent(dianshiCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )	
	
	--注册获取科举名臣消息的回调
	self.event_updateKejuMingchenList = function()
		self.m_keju_mingchen_list = g_game.g_userInfoManager:getKejumingchenList()
		self:popUpKaoshi()
		
		local yuanbao = 0
		if self.m_keju_type == self.TYPE_XIANGSHI and self.m_triggeredTable[self.TYPE_XIANGSHI] == false then
			yuanbao = 10
		elseif  self.m_keju_type == self.TYPE_HUISHI and self.m_triggeredTable[self.TYPE_HUISHI] == false then
			yuanbao = 100
		elseif self.m_keju_type == self.TYPE_DIANSHI and self.m_triggeredTable[self.TYPE_DIANSHI] == false then
			yuanbao = 300
		end
		local userInfo =  g_game.g_userInfoManager:getUserInfo()
		userInfo["gold"] = userInfo["gold"] - yuanbao
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_MINGCHEN_LIST, self.event_updateKejuMingchenList)
	
	
	--注册选秀界面服务器返回回调函数（用于更新cd时间和响应选秀的次数）
--	self.event_updateKejuCDTimeAndTimes = function()
--		self:updateKejuCDTimeAndTimes()
--	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_INFO, self.event_updateKejuCDTimeAndTimes)
	
	
	--注册服务器收到名臣选择情况回调函数 更新cd时间 更新次数
	self.event_selectKejuMingchenResult = function()
		self:updateSelectKejuCallBack()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_RECEIVE_KEJU_SELECT_BACK_CALL, self.event_selectKejuMingchenResult)
	
	self:updateLeftNum()
	self.event_leftTime = function()
		self:updateLeftNum()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_LEFT_TIME, self.event_leftTime)
	
	self:setStopTouchEvent(true)
	
	self.m_componentTable["yuanbao_num1"]:setString(10)
	self.m_componentTable["yuanbao_num2"]:setString(100)
	self.m_componentTable["yuanbao_num3"]:setString(300)
	self:updateKejuCDTimeAndTimes()
end

function f_keju_panel:updateLeftNum()
	local left = g_game.g_userInfoManager.m_leftCount
	if left ~= nil then
		self.m_componentTable["tip_left_num"]:setTextWithInt(left["officerCount"])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] updateSelectKejuCallBack
-- 注册服务器收到名臣选择情况回调函数 更新cd时间 更新次数
-------------------------------------------------------------------------------
function f_keju_panel:updateSelectKejuCallBack()
	if self.m_keju_type == self.TYPE_XIANGSHI then
		self.m_triggeredTable[self.TYPE_XIANGSHI] = false
		
		if self.m_xiangshi_yuanbao == false then
			self.m_xiangshi_shijian = 10*60
			g_game.g_recoverManager:setShopTime(1,self.m_xiangshi_shijian)
		end
		
		if self.m_xiangshi_0_state == true then 
			self.m_xiangshi_shijian = 0
			g_game.g_recoverManager:setShopTime(1,self.m_xiangshi_shijian)
		end
		
		local timeOfXiangshi = g_game.g_utilManager:getExportTime(self.m_xiangshi_shijian)
		self.m_componentTable["value1"]:setString(timeOfXiangshi)
		
		if self.m_xiangshi_count ~= 0  and self.m_xiangshi_cd_yuanbao == false then
			local kejuInfo = g_game.g_userInfoManager:getKejuCDTimeAndTimes()
			for i = 1, 3 do
				if kejuInfo[i]["type"] == 1 and kejuInfo[i]["count"] > 0 then
					kejuInfo[i]["count"] = kejuInfo[i]["count"] -1
				end
			end
			self.m_xiangshi_count = self.m_xiangshi_count -1
			self:setCDTimeIsVisible(self.TYPE_XIANGSHI, true)
		else
			self:setCDTimeIsVisible(self.TYPE_XIANGSHI, false)
		end
		self.m_componentTable["kj_cishu1_num_label"]:setString(self.m_xiangshi_count.."/5")
		
	elseif self.m_keju_type == self.TYPE_HUISHI then
		self.m_triggeredTable[self.TYPE_HUISHI] = false
		
		local kejuInfo = g_game.g_userInfoManager:getKejuCDTimeAndTimes()
		for i = 1, 3 do
			if kejuInfo[i]["type"] == 2 and kejuInfo[i]["count"] > 0 then
				kejuInfo[i]["count"] = kejuInfo[i]["count"] -1
			end
		end
		
		if self.m_huishi_yuanbao == false then
			self.m_huishi_shijian = 24*60*60
			g_game.g_recoverManager:setShopTime(2,self.m_huishi_shijian)
		end
		
		local timeOfHuishi = g_game.g_utilManager:getExportTime(self.m_huishi_shijian)
		self.m_componentTable["value2"]:setString(timeOfHuishi)
		
		self.m_componentTable["kj_cishu2_num_label"]:setString(self.m_huishi_count.."/1")
		
	elseif self.m_keju_type == self.TYPE_DIANSHI then
		self.m_triggeredTable[self.TYPE_DIANSHI] = false
		
		local kejuInfo = g_game.g_userInfoManager:getKejuCDTimeAndTimes()
		for i = 1, 3 do
			if kejuInfo[i]["type"] == 3 and kejuInfo[i]["count"] > 0 then
				kejuInfo[i]["count"] = kejuInfo[i]["count"] -1
			end
		end
		
		if self.m_dianshi_yuanbao == false then
			self.m_dianshi_shijian = 3*24*60*60
			g_game.g_recoverManager:setShopTime(3,self.m_dianshi_shijian)
		end
		
		local timeOfDianshi = g_game.g_utilManager:getExportTime(self.m_dianshi_shijian)
		self.m_componentTable["value3"]:setString(timeOfDianshi)
		
		self.m_componentTable["kj_cishu3_num_label"]:setString(self.m_dianshi_count.."/1")
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] updateKejuCDTimeAndTimes
-- 注册科举界面服务器返回回调函数（用于更新cd时间和响应科举的次数）
-------------------------------------------------------------------------------
function f_keju_panel:updateKejuCDTimeAndTimes()
	local kejuInfo = g_game.g_userInfoManager:getKejuCDTimeAndTimes()
	for i = 1, 3 do
		local currentInfo = kejuInfo[i]
		if currentInfo["type"] == 1 then
			self.m_xiangshi_shijian = g_game.g_recoverManager:getShopTime(1)--currentInfo["time"]			
			self.m_xiangshi_count   = currentInfo["count"]
			
			if self.m_xiangshi_shijian == 0 then
				if self.m_xiangshi_count ~= 0 then self.m_triggeredTable[self.TYPE_XIANGSHI] = true end
				
				self.m_xiangshi_yuanbao = false
				self:setCDTimeIsVisible(self.TYPE_XIANGSHI, false)
			else
				self.m_triggeredTable[self.TYPE_XIANGSHI] = false
				
				self.m_xiangshi_yuanbao = true
				self:setCDTimeIsVisible(self.TYPE_XIANGSHI, true)
			end
			local timeOfXiangshi = g_game.g_utilManager:getExportTime(self.m_xiangshi_shijian)
			self.m_componentTable["value1"]:setString(timeOfXiangshi)
			
			self.m_componentTable["kj_cishu1_num_label"]:setString(self.m_xiangshi_count.."/5")
		elseif currentInfo["type"] == 2 then
			self.m_huishi_shijian   = g_game.g_recoverManager:getShopTime(2)--currentInfo["time"]
			self.m_huishi_count     = currentInfo["count"] --1
			
			if self.m_huishi_shijian == 0 then
				if self.m_huishi_count ~= 0 then self.m_triggeredTable[self.TYPE_HUISHI] = true end
				
				self.m_huishi_yuanbao = false
				self:setCDTimeIsVisible(self.TYPE_HUISHI, false)
			else
				self.m_triggeredTable[self.TYPE_HUISHI] = false
				
				self.m_huishi_yuanbao = true
				self:setCDTimeIsVisible(self.TYPE_HUISHI, true)
			end
			local timeOfHuishi = g_game.g_utilManager:getExportTime(self.m_huishi_shijian)
			self.m_componentTable["value2"]:setString(timeOfHuishi)
			
			self.m_componentTable["kj_cishu2_num_label"]:setString(self.m_huishi_count.."/1")
		elseif currentInfo["type"] == 3 then
			self.m_dianshi_shijian  = g_game.g_recoverManager:getShopTime(3)--currentInfo["time"]
			self.m_dianshi_count    = currentInfo["count"]--1
			
			if self.m_dianshi_shijian == 0 then
				if self.m_dianshi_count ~= 0 then self.m_triggeredTable[self.TYPE_DIANSHI] = true end
				self.m_dianshi_yuanbao = false
				self:setCDTimeIsVisible(self.TYPE_DIANSHI, false)
			else
				self.m_triggeredTable[self.TYPE_DIANSHI] = false
				self.m_dianshi_yuanbao = true
				self:setCDTimeIsVisible(self.TYPE_DIANSHI, true)
			end
			local timeOfDianshi = g_game.g_utilManager:getExportTime(self.m_dianshi_shijian)
			self.m_componentTable["value3"]:setString(timeOfDianshi)
			
			self.m_componentTable["kj_cishu3_num_label"]:setString(self.m_dianshi_count.."/1")
		end
	end
	
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] update
-- 更新界面回调（乡试 会试 殿试三个事件）
-------------------------------------------------------------------------------
function f_keju_panel:update(dt)
--	self.m_deltaTime = self.m_deltaTime + dt
	
--	if self.m_deltaTime >= 1 then
--		self.m_deltaTime = 0
	
	self.m_xiangshi_shijian = g_game.g_recoverManager:getShopTime(1)
	self.m_huishi_shijian = g_game.g_recoverManager:getShopTime(2)
	self.m_dianshi_shijian = g_game.g_recoverManager:getShopTime(3)
		
		if self.m_xiangshi_shijian <= 0 then
			self.m_xiangshi_shijian = 0
			self.m_xiangshi_yuanbao = false
			self.m_xiangshi_cd_yuanbao = false
			self:setCDTimeIsVisible(self.TYPE_XIANGSHI, false)
			if  self.m_xiangshi_count > 0 then
				self.m_triggeredTable[self.TYPE_XIANGSHI] = true
				self.m_xiangshi_0_state = false
			else
				self.m_xiangshi_0_state = true
			end
		else
			self.m_xiangshi_yuanbao = true
			self.m_xiangshi_cd_yuanbao = true
			self:setCDTimeIsVisible(self.TYPE_XIANGSHI, true)
		end
		
		if self.m_huishi_shijian <= 0 then
			self.m_huishi_shijian = 0
			self.m_huishi_yuanbao = false
			self:setCDTimeIsVisible(self.TYPE_HUISHI, false)
			self.m_triggeredTable[self.TYPE_HUISHI] = true
		else
			self.m_huishi_yuanbao = true
			self:setCDTimeIsVisible(self.TYPE_HUISHI, true)
		end
		
		if self.m_dianshi_shijian <= 0 then
			self.m_dianshi_shijian = 0
			self.m_dianshi_yuanbao = false
			self:setCDTimeIsVisible(self.TYPE_DIANSHI, false)
			self.m_triggeredTable[self.TYPE_DIANSHI] = true
		else
			self.m_dianshi_yuanbao = true
			self:setCDTimeIsVisible(self.TYPE_DIANSHI, true)
		end
		
		local timeOfXiangshi = g_game.g_utilManager:getExportTime(self.m_xiangshi_shijian)
		local timeOfHuishi = g_game.g_utilManager:getExportTime(self.m_huishi_shijian)
		local timeOfDianshi = g_game.g_utilManager:getExportTime(self.m_dianshi_shijian)
		
		self.m_componentTable["value1"]:setString(timeOfXiangshi)
		self.m_componentTable["value2"]:setString(timeOfHuishi)
		self.m_componentTable["value3"]:setString(timeOfDianshi)
		
--		self.m_xiangshi_shijian = self.m_xiangshi_shijian -1
--		self.m_huishi_shijian = self.m_huishi_shijian -1
--		self.m_dianshi_shijian = self.m_dianshi_shijian  -1
--	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] popUpKaoshi
-- 弹出考试界面
-------------------------------------------------------------------------------
function f_keju_panel:popUpKaoshi()	
	if self.m_keju_mingchen_list ~= nil then
		local qindiandachen_panel = f_keju_qindiandachen_panel.static_create()
	    qindiandachen_panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(qindiandachen_panel,"keju_qindiandachen")
		qindiandachen_panel:setKaoshiData(self.m_keju_type,self.m_keju_mingchen_list)
	else
		print("Get the nil mingchen list!")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] setCDTimeIsVisible
-- 设置CD事件是否显示
-------------------------------------------------------------------------------
function f_keju_panel:setCDTimeIsVisible(type, isVisible)
	self.m_componentTable["kj_mianfei_time" .. type .."_label"]:setVisible(isVisible)
	self.m_componentTable["value" .. type]:setVisible(isVisible)
	self.m_componentTable["kj_mianfei" .. type .."_label"]:setVisible(not isVisible)
	self.m_componentTable["kj_cishu" .. type .. "_num_label"]:setVisible(not isVisible)
	
	self.m_componentTable["num_di"..type]:setVisible(isVisible)
	self.m_componentTable["yuanbao"..type]:setVisible(isVisible)
	self.m_componentTable["yuanbao_num"..type]:setVisible(isVisible)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] showTishiYuanbao
-- CD时间内点击科举，提示消耗元宝
-------------------------------------------------------------------------------
function f_keju_panel:showTishiYuanbao(type)
	
--	local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--	g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--	pop:setNoticeContent(nil,"此次举办科举需要消耗\n" .. yuanbao .. "元宝，确定要举办？",nil,nil)
--	pop:popUpNotice(29)
--	pop:setActionType(1)
	
--	local quedingClick = function()
--		发送要选秀消息
		self.m_keju_type = type
		--减去用户的相应元宝
		--发送更新主界面的消息
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD)
		g_game.g_userInfoManager:requestKejumingchenList(type)
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--	end
--	pop:setYesCallBack(quedingClick)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_panel] showTishiYuanbaoBuzu
-- CD时间内点击科举，元宝不足提示
-------------------------------------------------------------------------------
function f_keju_panel:showTishiYuanbaoBuzu(type)
--	local yuanbao = 0
--	if type == self.TYPE_XIANGSHI then
--		yuanbao = 10
--	elseif  type == self.TYPE_HUISHI then
--		yuanbao = 100
--	else
--		yuanbao = 300
--	end
--	local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--	g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--	pop:setNoticeContent(nil,"此次举办科举需要消耗\n" .. yuanbao .. "元宝，是否继续？",nil,nil)
--	pop:popUpNotice(29)
--	pop:setActionType(1)
--	
--	local call = function()
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
--	end 
--	pop:setYesCallBack(call)
	
end
