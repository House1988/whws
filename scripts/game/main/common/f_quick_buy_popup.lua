require("scripts.auto.auto_public_quick_buy_pop")

f_quick_buy_popup = class("f_quick_buy_popup")
f_quick_buy_popup.__index = f_quick_buy_popup

--local buy = f_quick_buy_popup.static_create()
--buy:panelInitBeforePopup()
--g_game.g_panelManager:showUiPanel(buy,"quick_buy_panel")

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_quick_buy_popup.static_create()
							 
	local infoTable = createpublic_quick_buy_pop()
	local info = infoTable["public_quick_buy_pop"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_quick_buy_popup)

	info.m_componentTable = infoTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_quick_buy_popup:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_type = 0
	
		--1 五千石粮草   3 五百军令   5 小精力丹 8征讨令
	self.m_strengthItemId = 1
	self.m_militaryItemId = 3
	self.m_energyItemId = 5
	self.m_challengeItemId = 8
	
	self.m_quickBuyTable = {}
	self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH] = g_game.g_dictConfigManager:getPropData(self.m_strengthItemId)
	self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY] =g_game.g_dictConfigManager:getPropData(self.m_militaryItemId)
	self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY] =g_game.g_dictConfigManager:getPropData(self.m_energyItemId)
	self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT] =g_game.g_dictConfigManager:getPropData(self.m_challengeItemId)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_quick_buy_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_quick_buy_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_quick_buy_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] onEnter
-------------------------------------------------------------------------------
function f_quick_buy_popup:onEnter()
	self.m_componentTable["pqbp_bottom_panel"]:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self.m_componentTable["pqbp_bottom_panel"]:runAction(cc.EaseBounceOut:create(actionTo))
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] setType
-------------------------------------------------------------------------------
function f_quick_buy_popup:setType(type)
	self.m_type = type
	
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local liangcaoLimit = g_game.g_dictConfigManager:getStrengthUseLimit(vipInfo["level"])
	local junlingLimit = g_game.g_dictConfigManager:getMilitaryUseLimit(vipInfo["level"])
	local jingliLimit = g_game.g_dictConfigManager:getEnergyUseLimit(vipInfo["level"])
	
	local leftStrengthTimes = liangcaoLimit - vipInfo["use_strength_times"]
	local leftMilitaryTimes = junlingLimit - vipInfo["use_military_times"]
	local leftEnergyTimes = jingliLimit - vipInfo["use_energy_times"]
	
	local call = function()
	end
	
	if self.m_type ==  g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
	
	 	 local itemName = g_game.g_dictConfigManager:getLanTextById(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][2])
		 if LANGUAGE_TYPE == 3 then
		 	self.m_componentTable["pqbp_tile_label"]:setString("糧草不足")
		    local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢復[206,53,0]"
				..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][8].."[91,24,6]點[206,53,0]糧草"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
		
			local des2= "[91,24,6]每天可使用[206,53,0]"..liangcaoLimit.."[91,24,6]次"
			self.m_componentTable["pqbp_label2"]:setComplexString(g_game.g_utilManager:getEncodeString(des2, cc.c3b(255,255,255)), call)
		
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][5])
		 else
		 	self.m_componentTable["pqbp_tile_label"]:setString("粮草不足")
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][8].."[91,24,6]点[206,53,0]粮草"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
		
			local des2= "[91,24,6]每天可使用[206,53,0]"..liangcaoLimit.."[91,24,6]次"
			self.m_componentTable["pqbp_label2"]:setComplexString(g_game.g_utilManager:getEncodeString(des2, cc.c3b(255,255,255)), call)
		
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][5])
		 end

		
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		local itemName = g_game.g_dictConfigManager:getLanTextById(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][2])
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["pqbp_tile_label"]:setString("軍令不足")
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][8].."[91,24,6]點[206,53,0]軍令"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			
			local des2= "[91,24,6]每天可使用[206,53,0]"..junlingLimit.."[91,24,6]次"
			self.m_componentTable["pqbp_label2"]:setComplexString(g_game.g_utilManager:getEncodeString(des2, cc.c3b(255,255,255)), call)
			
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][5])
		
		else
			self.m_componentTable["pqbp_tile_label"]:setString("军令不足")
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][8].."[91,24,6]点[206,53,0]军令"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			
			local des2= "[91,24,6]每天可使用[206,53,0]"..junlingLimit.."[91,24,6]次"
			self.m_componentTable["pqbp_label2"]:setComplexString(g_game.g_utilManager:getEncodeString(des2, cc.c3b(255,255,255)), call)
			
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][5])
		
		end
		
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
		local itemName = g_game.g_dictConfigManager:getLanTextById(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][2])
		
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["pqbp_tile_label"]:setString("精力不足")
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢復[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][8].."[91,24,6]點[206,53,0]精力"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			
			local des2= "[91,24,6]每天可使用[206,53,0]"..jingliLimit.."[91,24,6]次"
			self.m_componentTable["pqbp_label2"]:setComplexString(g_game.g_utilManager:getEncodeString(des2, cc.c3b(255,255,255)), call)
			
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][5])
		else
			self.m_componentTable["pqbp_tile_label"]:setString("精力不足")
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][8].."[91,24,6]点[206,53,0]精力"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			
			local des2= "[91,24,6]每天可使用[206,53,0]"..jingliLimit.."[91,24,6]次"
			self.m_componentTable["pqbp_label2"]:setComplexString(g_game.g_utilManager:getEncodeString(des2, cc.c3b(255,255,255)), call)
			
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][5])
		end
		
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
		local itemName = g_game.g_dictConfigManager:getLanTextById(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][2])
		
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["pqbp_tile_label"]:setString("挑戰次數不足")
		
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢復[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8].."[91,24,6]次[206,53,0]挑戰次數"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
		
			self.m_componentTable["pqbp_label2"]:setVisible(false)
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][5])
		else
			self.m_componentTable["pqbp_tile_label"]:setString("挑战次数不足")
		
			local des = "[91,24,6]使用[206,53,0]"..itemName.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8].."[91,24,6]次[206,53,0]挑战次数"
			self.m_componentTable["pqbp_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
		
			self.m_componentTable["pqbp_label2"]:setVisible(false)
			self.m_componentTable["yuanbao_num"]:setString(self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][5])
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] onExit
-------------------------------------------------------------------------------
function f_quick_buy_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM,self.event_updateUseItem2)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM, self.event_updateBuyItem1)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_QUICK_USE_ITEM_CALLBACK,self.event_quickUseItem)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_quick_buy_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_quick_buy_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] onCleanup
-------------------------------------------------------------------------------
function f_quick_buy_popup:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_quick_buy_popup:initAllComponent()
    local close = function()
		g_game.g_panelManager:removeUiPanel("quick_buy_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["close_btn1"]:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local buyAnduse = function()
		self:quickBuyAndUse()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["buy_and_use_btn"]:addHandleOfcomponentEvent(buyAnduse, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    self.event_updateBuyItem1 = function()
		self:updateBuyItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM, self.event_updateBuyItem1)
	
	self.event_updateUseItem2 = function()
		self:updateUseItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM,self.event_updateUseItem2)
	
	self.event_quickUseItem = function()
		local dataT = {}
		dataT["propNum"] = 1
		if self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH  then
			dataT["propId"] = self.m_strengthItemId --五千石粮草
		elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
			dataT["propId"] = self.m_militaryItemId	--五百军令
		elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY  then
			dataT["propId"] = self.m_energyItemId--小精力丹
		elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT  then
			dataT["propId"] = self.m_challengeItemId--征讨令
		end
		g_game.g_userInfoManager:requestUseSelectItem(dataT)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_QUICK_USE_ITEM_CALLBACK,self.event_quickUseItem)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] updateBuyItem
-------------------------------------------------------------------------------
function f_quick_buy_popup:updateBuyItem()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["gold"] = userInfo["gold"] - self.m_quickBuyTable[self.m_type][5]
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
	
--	g_game.g_panelManager:removeUiPanel("quick_buy_panel")
end

---------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] updateUseItem
-------------------------------------------------------------------------------
function f_quick_buy_popup:updateUseItem()	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	if self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH  then
		userInfo["strength"] = userInfo["strength"] + self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][8]
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		userInfo["military"] = userInfo["military"] + self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][8]
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY  then
		userInfo["energy"] = userInfo["energy"] + self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][8]
	elseif 	self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
		userInfo["challengeNum"] = userInfo["challengeNum"] + self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8]
		local userRankData = g_game.g_userInfoManager:getUserPvpRank()
		userRankData["challengeNum"]  = userRankData["challengeNum"] + self.m_quickBuyTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8]
	end

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
	
	g_game.g_panelManager:removeUiPanel("quick_buy_panel")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] quickBuyAndUse
-- 快速购买并使用
-------------------------------------------------------------------------------
function f_quick_buy_popup:quickBuyAndUse()
	--超过  相应值上限
	if self:judgeIsArriveValueLimit() then
		return
	end
	
	--超过  使用次数上限
	if self:judgeIsArriveTimesLimit() then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		
		local strT = g_game.g_dictConfigManager:getLanTextById(373)
		quickCharge:setTipString(strT)
--		g_game.g_utilManager:showMsg("该道具已达当前VIP使用次数上限")
		return
	end
	
	local dataT = {}
	dataT["propNum"] = 1
	if self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH  then
		dataT["propId"] = self.m_strengthItemId --五千石粮草
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		dataT["propId"] = self.m_militaryItemId	--五百军令
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY  then
		dataT["propId"] = self.m_energyItemId--小精力丹
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT  then
		dataT["propId"] = self.m_challengeItemId--征讨令
	end
	
	local userGold = g_game.g_userInfoManager:getUserInfo()["gold"]
	local costGold = g_game.g_dictConfigManager:getPropData(dataT["propId"])[5]
	if userGold < costGold then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")	
	else
		g_game.g_userInfoManager:requestBuyItem(dataT["propId"],1)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] judgeIsArriveValueLimit
-- 判断是否达到值上限
-------------------------------------------------------------------------------
function f_quick_buy_popup:judgeIsArriveValueLimit()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	
	local isPopup = false
	local des = nil
	
	if self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
		local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
		if userInfo["strength"] >= userStrengthLimit then
			des = ""
			if LANGUAGE_TYPE ==3 then
				des = "糧草已達上限，無法使用"
			else
				des = "粮草已达上限，无法使用"
			end
			
			isPopup = true
		end
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		local userMilitaryLimit = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
		if userInfo["military"] >= userMilitaryLimit then
			des = ""
			if LANGUAGE_TYPE ==3 then
				des = "軍令已達上限，無法使用"
			else
				des = "军令已达上限，无法使用"
			end
			isPopup = true
		end
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
		local userJingliLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
		if userInfo["energy"] >= userJingliLimit then
			des = ""
			if LANGUAGE_TYPE ==3 then
				des = "精力已達上限，無法使用"
			else
				des = "精力已达上限，无法使用"
			end
			
			isPopup = true
		end
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
		isPopup = false
	end

	if isPopup then
		g_game.g_utilManager:showMsg(des)
	end

	return isPopup
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] judgeIsArriveTimesLimit
-- 判断是否达到次数上限
-------------------------------------------------------------------------------
function f_quick_buy_popup:judgeIsArriveTimesLimit()
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local liangcaoLimit = g_game.g_dictConfigManager:getStrengthUseLimit(vipInfo["level"])
	local junlingLimit = g_game.g_dictConfigManager:getMilitaryUseLimit(vipInfo["level"])
	local jingliLimit = g_game.g_dictConfigManager:getEnergyUseLimit(vipInfo["level"])
	
	local leftStrengthTimes = liangcaoLimit - vipInfo["use_strength_times"]
	local leftMilitaryTimes = junlingLimit - vipInfo["use_military_times"]
	local leftEnergyTimes = jingliLimit - vipInfo["use_energy_times"]

	if self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH and leftStrengthTimes == 0 then
		
		return true
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY and leftMilitaryTimes == 0 then
		
		return true
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY and leftEnergyTimes == 0 then
		
		return true
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
		return false
	end
	
	return false
end

