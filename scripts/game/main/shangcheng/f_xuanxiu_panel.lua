require("scripts.game.main.shangcheng.f_xuanxiu_qindianxiunv_panel")
require("scripts.auto.auto_hougong_tishi")

--[[--
	选秀 主面板
--]]--
f_xuanxiu_panel = class("f_xuanxiu_panel")
f_xuanxiu_panel.__index = f_xuanxiu_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_xuanxiu_panel.static_create()
	local xuanxiu_Table = g_game.g_panelManager:create_panel("xuanxiu")
	local xuanxiu_Panel = xuanxiu_Table["xuanxiu"]
	  
	local funTable = {}
	tolua.setpeer(xuanxiu_Panel, funTable)
	setmetatable(funTable, f_xuanxiu_panel)
	
	xuanxiu_Panel.m_componentTable = xuanxiu_Table
	return xuanxiu_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_xuanxiu_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_xuanxiu_xiunv_list = nil
	self.m_xuanxiu_type = 0
	
--	self.m_deltaTime = 0
	--三个选择时间
	self.m_xiangxuan_shijian = 0
	self.m_huixuan_shijian = 0
	self.m_dianxuan_shijian = 0
	
	--三个选择次数
	self.m_xiangxuan_count = 0
	self.m_huixuan_count = 0
	self.m_dianxuan_count = 0
	
	self.TYPE_XIANGXUAN = 1
	self.TYPE_HUIXUAN = 2
	self.TYPE_DIANXUAN = 3
	self.m_triggeredTable = {}
	self.m_triggeredTable[self.TYPE_XIANGXUAN] = false
	self.m_triggeredTable[self.TYPE_HUIXUAN] = false
	self.m_triggeredTable[self.TYPE_DIANXUAN] = false
	
	--需要花费元宝获得选秀资格的标志（存在CD时间，则为true）
	self.m_xiangxuan_yuanbao = false
	self.m_huixuan_yuanbao = false
	self.m_dianxuan_yuanbao = false	
	
	--乡选次数为0状态（目标：点击后元宝购买 - 不走CD）
	self.m_xiangxuan_0_state = false
	
	--乡试CD事件内使用元宝状态（目标：点击后元宝购买 - 不减少免费次数（本地））
	self.m_xiangxuan_cd_yuanbao = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_xuanxiu_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_xuanxiu_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_xuanxiu_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] onEnter
-------------------------------------------------------------------------------
function f_xuanxiu_panel:onEnter()
	self.m_componentTable["xuanxiu_big_bg"]:setImage(g_game.g_resourceManager:getUiMap("choukaditu"))
    self.m_componentTable["xuanxiu_big_bg"]:setExtensionsTextureRect(cc.rect(0,0,956,553))
    self.m_componentTable["xuanxiu_big_bg"]:setPositionInContainer(cc.p(958/2,553/2))
	self:setStopTouchEvent(true)
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] onExit
-------------------------------------------------------------------------------
function f_xuanxiu_panel:onExit()  
    self:unregisterNodeEvent()
    
    g_game.g_gameManager:removeUpdateObj(self)	
    --移除注册接收美女列表回调函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_LEFT_TIME, self.event_leftTime1)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_XIUNV_LIST, self.event_updateKejuMingchenList)
--    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_INFO, self.event_updateXuanxiuCDTimeAndTimes)
	
	 --移除注册服务器收到秀女选择情况回调函数
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_RECEIVE_XUANXIU_SELECT_BACK_CALL, self.event_selectXuanxiuXiunvResult)
	
    self.m_xuanxiu_xiunv_list = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_xuanxiu_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_xuanxiu_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] onCleanup
-------------------------------------------------------------------------------
function f_xuanxiu_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_xuanxiu_panel:initAllComponent()
	
	self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, false)
	self:setCDTimeIsVisible(self.TYPE_HUIXUAN, false)
	self:setCDTimeIsVisible(self.TYPE_DIANXUAN, false)
	--乡选按钮回调,发送乡选消息
	local xiangxuanCallback = function()
		--乡选在cd时间之内，按钮弹出提示使用元宝
		if self.m_triggeredTable[self.TYPE_XIANGXUAN] == false then	
			--获得当前元宝
			local userInfo =  g_game.g_userInfoManager:getUserInfo()
			local gold = userInfo["gold"]
			--判断元宝是否充足
			if 10 <= gold then
				self:showTishiYuanbao(self.TYPE_XIANGXUAN)
			else
			
				self:showTishiYuanbaoBuzu(self.TYPE_XIANGXUAN)
			end
		else
			self.m_xuanxiu_type = 1
			g_game.g_userInfoManager:requestXuanxiuxiunvList(1)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["xx_xiangxuan_button"]:addHandleOfcomponentEvent(xiangxuanCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--会选按钮回调,发送会选消息
	local huixuanCallback = function()
		if self.m_triggeredTable[self.TYPE_HUIXUAN] == false then
			--获得当前元宝
			local userInfo =  g_game.g_userInfoManager:getUserInfo()
			local gold = userInfo["gold"]
			--判断元宝是否充足
			if 100 <= gold then
				self:showTishiYuanbao(self.TYPE_HUIXUAN)
			else
			
				self:showTishiYuanbaoBuzu(self.TYPE_HUIXUAN)
			end
		else
			self.m_xuanxiu_type = 2
			g_game.g_userInfoManager:requestXuanxiuxiunvList(2)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["xx_huixuan_button"]:addHandleOfcomponentEvent(huixuanCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--殿选按钮回调，发送店选消息
	local dianxuanCallback = function()
		if self.m_triggeredTable[self.TYPE_DIANXUAN] == false then
			--获得当前元宝
			local userInfo =  g_game.g_userInfoManager:getUserInfo()
			local gold = userInfo["gold"]
			--判断元宝是否充足
			if 300 <= gold then
				self:showTishiYuanbao(self.TYPE_DIANXUAN)
			else
				
				self:showTishiYuanbaoBuzu(self.TYPE_DIANXUAN)
			end
		else
			self.m_xuanxiu_type = 3
			g_game.g_userInfoManager:requestXuanxiuxiunvList(3)
		end		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["xx_dianxuan_button"]:addHandleOfcomponentEvent(dianxuanCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--注册获取选秀秀女消息的回调
	self.event_updateXuanxiuXiunvList = function()
		self.m_xuanxiu_xiunv_list = g_game.g_userInfoManager:getXuanxiuxiunvList()
		self:popUpXuanxiu()
		
		--减去用户的相应元宝
		local yuanbao = 0
		if self.m_xuanxiu_type == self.TYPE_XIANGXUAN and self.m_triggeredTable[self.TYPE_XIANGXUAN] == false then
			yuanbao = 10
		elseif  self.m_xuanxiu_type == self.TYPE_HUIXUAN and self.m_triggeredTable[self.TYPE_HUIXUAN] == false then
			yuanbao = 100
		elseif self.m_xuanxiu_type == self.TYPE_DIANXUAN and self.m_triggeredTable[self.TYPE_DIANXUAN] == false then
			yuanbao = 300
		end
		local userInfo =  g_game.g_userInfoManager:getUserInfo()
		userInfo["gold"] = userInfo["gold"] - yuanbao
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_XIUNV_LIST, self.event_updateXuanxiuXiunvList)
	
	
	--注册选秀界面服务器返回回调函数（用于更新cd时间和响应选秀的次数）
--	self.event_updateXuanxiuCDTimeAndTimes = function()
--		self:updateXuanxiuCDTimeAndTimes()
--	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_INFO, self.event_updateXuanxiuCDTimeAndTimes)
	
	self:updateLeftNum()
	self.event_leftTime1 = function()
		self:updateLeftNum()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_LEFT_TIME, self.event_leftTime1)
	
	--注册服务器收到秀女选择情况回调函数 更新cd时间 更新次数
	self.event_selectXuanxiuXiunvResult = function()
		self:updateSelectXiunvCallBack()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_RECEIVE_XUANXIU_SELECT_BACK_CALL, self.event_selectXuanxiuXiunvResult)
	
	self:setStopTouchEvent(true)
	
	self.m_componentTable["yuanbao_num1"]:setString(10)
	self.m_componentTable["yuanbao_num2"]:setString(100)
	self.m_componentTable["yuanbao_num3"]:setString(300)
	self:updateXuanxiuCDTimeAndTimes()
end

function f_xuanxiu_panel:updateLeftNum()
	local left = g_game.g_userInfoManager.m_leftCount
	if left ~= nil then
		self.m_componentTable["tip_left_num"]:setTextWithInt(left["beautyCount"])
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] updateSelectXiunvCallBack
-- 注册服务器收到秀女选择情况回调函数 更新cd时间 更新次数
-------------------------------------------------------------------------------
function f_xuanxiu_panel:updateSelectXiunvCallBack()
	if self.m_xuanxiu_type == self.TYPE_XIANGXUAN then
		self.m_triggeredTable[self.TYPE_XIANGXUAN] = false
		
		if self.m_xiangxuan_yuanbao == false then
			self.m_xiangxuan_shijian = 10*60
			g_game.g_recoverManager:setShopTime(4,self.m_xiangxuan_shijian)
		end
		
		if self.m_xiangxuan_0_state == true then
			self.m_xiangxuan_shijian = 0
			g_game.g_recoverManager:setShopTime(4,self.m_xiangxuan_shijian)
		end
		
		local timeOfXiangxuan = g_game.g_utilManager:getExportTime(self.m_xiangxuan_shijian)
		self.m_componentTable["value1"]:setString(timeOfXiangxuan)
		
		if self.m_xiangxuan_count ~= 0  and self.m_xiangxuan_cd_yuanbao == false then
			local xuanxiuInfo = g_game.g_userInfoManager:getXuanxiuCDTimeAndTimes()
			for i = 1, 3 do
				if xuanxiuInfo[i]["type"] == 1 and xuanxiuInfo[i]["count"] > 0 then
					xuanxiuInfo[i]["count"] = xuanxiuInfo[i]["count"] - 1
				end
			end
			
			self.m_xiangxuan_count = self.m_xiangxuan_count -1
			self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, true)
		else
			self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, false)
		end
		self.m_componentTable["xx_cishu1_num_label"]:setString(self.m_xiangxuan_count.."/5")
		
	elseif self.m_xuanxiu_type == self.TYPE_HUIXUAN then
		self.m_triggeredTable[self.TYPE_HUIXUAN] = false
		
		local xuanxiuInfo = g_game.g_userInfoManager:getXuanxiuCDTimeAndTimes()
		for i = 1, 3 do
			if xuanxiuInfo[i]["type"] == 2 and xuanxiuInfo[i]["count"] > 0 then
				xuanxiuInfo[i]["count"] = xuanxiuInfo[i]["count"] - 1
			end
		end
		
		if self.m_huixuan_yuanbao == false then
			self.m_huixuan_shijian = 24*60*60
			g_game.g_recoverManager:setShopTime(5,self.m_huixuan_shijian)
		end
		local timeOfHuixuan = g_game.g_utilManager:getExportTime(self.m_huixuan_shijian)
		self.m_componentTable["value2"]:setString(timeOfHuixuan)
		self.m_componentTable["xx_cishu2_num_label"]:setString(self.m_huixuan_count.."/1")
		
	elseif self.m_xuanxiu_type == self.TYPE_DIANXUAN then
		self.m_triggeredTable[self.TYPE_DIANXUAN] = false
		
		local xuanxiuInfo = g_game.g_userInfoManager:getXuanxiuCDTimeAndTimes()
		for i = 1, 3 do
			if xuanxiuInfo[i]["type"] == 3 and xuanxiuInfo[i]["count"] > 0 then
				xuanxiuInfo[i]["count"] = xuanxiuInfo[i]["count"] - 1
			end
		end
		
		if self.m_dianxuan_yuanbao == false then
			self.m_dianxuan_shijian = 3*24*60*60
			g_game.g_recoverManager:setShopTime(6,self.m_dianxuan_shijian)
		end
		local timeOfDianxuan = g_game.g_utilManager:getExportTime(self.m_dianxuan_shijian)
		self.m_componentTable["value3"]:setString(timeOfDianxuan)
		self.m_componentTable["xx_cishu3_num_label"]:setString(self.m_dianxuan_count.."/1")
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] updateXuanxiuCDTimeAndTimes
-- 注册选秀界面服务器返回回调函数（用于更新cd时间和响应选秀的次数）
-------------------------------------------------------------------------------
function f_xuanxiu_panel:updateXuanxiuCDTimeAndTimes()
	local xuanxiuInfo = g_game.g_userInfoManager:getXuanxiuCDTimeAndTimes()
	for i = 1, 3 do
		local currentInfo = xuanxiuInfo[i]
		if currentInfo["type"] == 1 then
			self.m_xiangxuan_shijian =  g_game.g_recoverManager:getShopTime(4)--currentInfo["time"]
			self.m_xiangxuan_count   = currentInfo["count"]
			
			if self.m_xiangxuan_shijian == 0 then
				self.m_xiangxuan_yuanbao = false
				self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, false)
			else
				self.m_xiangxuan_yuanbao = true
				self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, true)
			end
			
			local timeOfXiangxuan = g_game.g_utilManager:getExportTime(self.m_xiangxuan_shijian)
			self.m_componentTable["value1"]:setString(timeOfXiangxuan)
		
			self.m_componentTable["xx_cishu1_num_label"]:setString(self.m_xiangxuan_count.."/5")
		elseif currentInfo["type"] == 2 then
			self.m_huixuan_shijian   = g_game.g_recoverManager:getShopTime(5)--currentInfo["time"]
			self.m_huixuan_count     = currentInfo["count"] --1
			
			if self.m_huixuan_shijian == 0 then
				self.m_huixuan_yuanbao = false
				self:setCDTimeIsVisible(self.TYPE_HUIXUAN, false)
			else
				self.m_huixuan_yuanbao = true
				self:setCDTimeIsVisible(self.TYPE_HUIXUAN, true)
			end
			
			local timeOfHuixuan = g_game.g_utilManager:getExportTime(self.m_huixuan_shijian)
			self.m_componentTable["value2"]:setString(timeOfHuixuan)
			
			self.m_componentTable["xx_cishu2_num_label"]:setString(self.m_huixuan_count.."/1")
		elseif currentInfo["type"] == 3 then
			self.m_dianxuan_shijian  = g_game.g_recoverManager:getShopTime(6)--currentInfo["time"]
			self.m_dianxuan_count    = currentInfo["count"]--1
			
			if self.m_dianxuan_shijian == 0 then
				self.m_dianxuan_yuanbao = false
				self:setCDTimeIsVisible(self.TYPE_DIANXUAN, false)
			else
				self.m_dianxuan_yuanbao = true
				self:setCDTimeIsVisible(self.TYPE_DIANXUAN, true)
			end
			
			local timeOfDianxuan = g_game.g_utilManager:getExportTime(self.m_dianxuan_shijian)
			self.m_componentTable["value3"]:setString(timeOfDianxuan)
			
			self.m_componentTable["xx_cishu3_num_label"]:setString(self.m_dianxuan_count.."/1")
		end
	end
	
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] update
-- 更新界面回调（乡选 会选 殿选三个事件）
-------------------------------------------------------------------------------
function f_xuanxiu_panel:update(dt)
--	self.m_deltaTime = self.m_deltaTime + dt
--	
--	if self.m_deltaTime >= 1 then
--		self.m_deltaTime = 0
	self.m_xiangxuan_shijian = g_game.g_recoverManager:getShopTime(4)
	self.m_huixuan_shijian = g_game.g_recoverManager:getShopTime(5)
	self.m_dianxuan_shijian = g_game.g_recoverManager:getShopTime(6)
		
		if self.m_xiangxuan_shijian <= 0 then
			self.m_xiangxuan_shijian = 0
			self.m_xiangxuan_yuanbao = false
			self.m_xiangshi_cd_yuanbao = false
			self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, false)
			if  self.m_xiangxuan_count > 0 then
				self.m_triggeredTable[self.TYPE_XIANGXUAN] = true
				self.m_xiangxuan_0_state = false
			else
				self.m_xiangxuan_0_state = true
			end
		else
			self.m_xiangxuan_yuanbao = true
			self.m_xiangshi_cd_yuanbao = true
			self:setCDTimeIsVisible(self.TYPE_XIANGXUAN, true)
		end
		
		if self.m_huixuan_shijian <= 0 then
			self.m_huixuan_shijian = 0
			self.m_huixuan_yuanbao = false
			self:setCDTimeIsVisible(self.TYPE_HUIXUAN, false)
			self.m_triggeredTable[self.TYPE_HUIXUAN] = true
		else
			self.m_huixuan_yuanbao = true
			self:setCDTimeIsVisible(self.TYPE_HUIXUAN, true)
		end
		
		if self.m_dianxuan_shijian <= 0 then
			self.m_dianxuan_shijian = 0
			self.m_dianxuan_yuanbao = false
			self:setCDTimeIsVisible(self.TYPE_DIANXUAN, false)
			self.m_triggeredTable[self.TYPE_DIANXUAN] = true
		else
			self.m_dianxuan_yuanbao = true
			self:setCDTimeIsVisible(self.TYPE_DIANXUAN, true)
		end
		
		local timeOfXiangxuan = g_game.g_utilManager:getExportTime(self.m_xiangxuan_shijian)
		local timeOfHuixuan = g_game.g_utilManager:getExportTime(self.m_huixuan_shijian)
		local timeOfDianxuan = g_game.g_utilManager:getExportTime(self.m_dianxuan_shijian)
		
		self.m_componentTable["value1"]:setString(timeOfXiangxuan)
		self.m_componentTable["value2"]:setString(timeOfHuixuan)
		self.m_componentTable["value3"]:setString(timeOfDianxuan)
		
--		self.m_xiangxuan_shijian = self.m_xiangxuan_shijian -1
--		self.m_huixuan_shijian = self.m_huixuan_shijian -1
--		self.m_dianxuan_shijian = self.m_dianxuan_shijian  -1
--	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] popUpXuanxiu
-- 弹出选秀界面
-------------------------------------------------------------------------------
function f_xuanxiu_panel:popUpXuanxiu()
	if self.m_xuanxiu_xiunv_list ~= nil then
		local qindianxiunv_panel = f_xuanxiu_qindianxiunv_panel.static_create()
	    qindianxiunv_panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(qindianxiunv_panel,"xuanxiu_qindianxiunv")
		qindianxiunv_panel:setXuanxiuData(self.m_xuanxiu_type,self.m_xuanxiu_xiunv_list)
	else
		print("Get the nil xiunv list!")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] setCDTimeIsVisible
-- 设置CD事件是否显示
-------------------------------------------------------------------------------
function f_xuanxiu_panel:setCDTimeIsVisible(type, isVisible)
	self.m_componentTable["xx_mianfei_time" .. type .."_label"]:setVisible(isVisible)
	self.m_componentTable["value" .. type]:setVisible(isVisible)
	self.m_componentTable["xx_mianfei" .. type .."_label"]:setVisible(not isVisible)
	self.m_componentTable["xx_cishu" .. type .. "_num_label"]:setVisible(not isVisible)
	
	self.m_componentTable["num_didi"..type]:setVisible(isVisible)
	self.m_componentTable["yuanbao"..type]:setVisible(isVisible)
	self.m_componentTable["yuanbao_num"..type]:setVisible(isVisible)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] showTishiYuanbao
-- CD时间内点击选秀，提示消耗元宝
-------------------------------------------------------------------------------
function f_xuanxiu_panel:showTishiYuanbao(type)

	
--	local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--	g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--	pop:setNoticeContent(nil,"此次举办选秀需要消耗" .. yuanbao .. "元宝，确定要举办？",nil,nil)
--	pop:popUpNotice(29)
--	pop:setActionType(1)
--	
--	local quedingClick = function()
		--发送要选秀消息
		self.m_xuanxiu_type = type
		
		--发送更新主界面的消息
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD)
		g_game.g_userInfoManager:requestXuanxiuxiunvList(type)
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--	end
--	pop:setYesCallBack(quedingClick)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_panel] showTishiYuanbaoBuzu
-- CD时间内点击选秀，元宝不足提示
-------------------------------------------------------------------------------
function f_xuanxiu_panel:showTishiYuanbaoBuzu(type)
--	local yuanbao = 0
--	if type == self.TYPE_XIANGXUAN then
--		yuanbao = 10
--	elseif  type == self.TYPE_HUIXUAN then
--		yuanbao = 100
--	else
--		yuanbao = 300
--	end
--	local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--	g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--	pop:setNoticeContent(nil,"此次举办选秀需要消耗" .. yuanbao .. "元宝，是否继续？",nil,nil)
--	pop:popUpNotice(29)
--	pop:setActionType(1)
	
--	local call = function()
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
--	end
--	pop:setYesCallBack(call)
	
end
