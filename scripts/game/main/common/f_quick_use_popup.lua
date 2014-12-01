require("scripts.auto.auto_public_quick_use_pop")

f_quick_use_popup = class("f_quick_use_popup")
f_quick_use_popup.__index = f_quick_use_popup

--local use = f_quick_use_popup.static_create()
--use:panelInitBeforePopup()
--g_game.g_panelManager:showUiPanel(use,"quick_use_panel")

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_quick_use_popup.static_create()
							 
	local infoTable = createpublic_quick_use_pop()
	local info = infoTable["public_quick_use_pop"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_quick_use_popup)

	info.m_componentTable = infoTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_quick_use_popup:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_type = 0
	
	--1 五千石粮草   3 五百军令   5 小精力丹  8征讨令
	self.m_strengthItemId = 1
	self.m_militaryItemId = 3
	self.m_energyItemId = 5
	self.m_challengeItemId = 8
	
	self.m_quickUseTable = {}
	self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH] = g_game.g_dictConfigManager:getPropData(self.m_strengthItemId)
	self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY] =g_game.g_dictConfigManager:getPropData(self.m_militaryItemId)
	self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY] =g_game.g_dictConfigManager:getPropData(self.m_energyItemId)
	self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT] =g_game.g_dictConfigManager:getPropData(self.m_challengeItemId)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_quick_use_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_quick_use_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_quick_use_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] onEnter
-------------------------------------------------------------------------------
function f_quick_use_popup:onEnter()
	self.m_componentTable["pqup_bottom_panel"]:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self.m_componentTable["pqup_bottom_panel"]:runAction(cc.EaseBounceOut:create(actionTo))
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] setType
-------------------------------------------------------------------------------
function f_quick_use_popup:setType(type)
	self.m_type = type
	
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local liangcaoLimit = g_game.g_dictConfigManager:getStrengthUseLimit(vipInfo["level"])
	local junlingLimit = g_game.g_dictConfigManager:getMilitaryUseLimit(vipInfo["level"])
	local jingliLimit = g_game.g_dictConfigManager:getEnergyUseLimit(vipInfo["level"])
	
	local leftStrengthTimes = liangcaoLimit - vipInfo["use_strength_times"]
	local leftMilitaryTimes = junlingLimit - vipInfo["use_military_times"]
	local leftEnergyTimes = jingliLimit - vipInfo["use_energy_times"]
	
	local ownNum = self:getOwnNum(self.m_type)
	local call = function()
	end
	if self.m_type ==  g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
		
		local strTT = g_game.g_dictConfigManager:getLanTextById(self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][2])
		if LANGUAGE_TYPE == 3 then
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢復[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][8].."[91,24,6]點[206,53,0]糧草"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("擁有"..strTT.."個數：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setString(leftStrengthTimes)
		else
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][8].."[91,24,6]点[206,53,0]粮草"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("拥有"..strTT.."个数：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setString(leftStrengthTimes)
		end
		
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		local strTT = g_game.g_dictConfigManager:getLanTextById(self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][2])
		
		if LANGUAGE_TYPE == 3 then
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢復[206,53,0]"
		..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][8].."[91,24,6]點[206,53,0]軍令"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("擁有"..strTT.."個數：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setString(leftMilitaryTimes)
		else
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][8].."[91,24,6]点[206,53,0]军令"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("拥有"..strTT.."个数：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setString(leftMilitaryTimes)
		end
		
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
		local strTT = g_game.g_dictConfigManager:getLanTextById(self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][2])
		
		if LANGUAGE_TYPE == 3 then
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢復[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][8].."[91,24,6]點[206,53,0]精力"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("擁有"..strTT.."個數：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setString(leftEnergyTimes)
		else
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][8].."[91,24,6]点[206,53,0]精力"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("拥有"..strTT.."个数：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setString(leftEnergyTimes)
		end
	
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
		local strTT = g_game.g_dictConfigManager:getLanTextById(self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][2])
		
		if LANGUAGE_TYPE == 3 then
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢復[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8].."[91,24,6]次[206,53,0]挑戰次數"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("擁有"..strTT.."個數：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setVisible(false)
			self.m_componentTable["left_num_label"]:setVisible(false)
			self.m_componentTable["pqup_label_di2"]:setVisible(false)
			self.m_componentTable["pqup_num_di"]:setVisible(false)
		else
			local des = "[91,24,6]使用[206,53,0]"..strTT.."[91,24,6]可恢复[206,53,0]"
			..self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8].."[91,24,6]次[206,53,0]挑战次数"
			
			self.m_componentTable["pqup_tip_label1"]:setComplexString(g_game.g_utilManager:getEncodeString(des, cc.c3b(255,255,255)), call)
			self.m_componentTable["own_num_label"]:setString("拥有"..strTT.."个数：")
			self.m_componentTable["own_num"]:setString(ownNum)
			self.m_componentTable["left_num"]:setVisible(false)
			self.m_componentTable["left_num_label"]:setVisible(false)
			self.m_componentTable["pqup_label_di2"]:setVisible(false)
			self.m_componentTable["pqup_num_di"]:setVisible(false)
		end
	
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] getOwnNum
-------------------------------------------------------------------------------
function f_quick_use_popup:getOwnNum(type)
	local propData = g_game.g_userInfoManager:getUserEquipData()
	
	for i = 1,#propData["propList"] do
		--商城道具  五千石粮草
		if propData["propList"][i]["propId"] == self.m_strengthItemId and  type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
			return propData["propList"][i]["propNum"]
		--商城道具  五百军令
		elseif propData["propList"][i]["propId"] == self.m_militaryItemId and type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		  	return propData["propList"][i]["propNum"]
		--商城道具 小精力丹
		elseif propData["propList"][i]["propId"] == self.m_energyItemId and type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
			return propData["propList"][i]["propNum"]
		--商城道具 征讨令
		elseif propData["propList"][i]["propId"] == self.m_challengeItemId and type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
			return propData["propList"][i]["propNum"]
		end
	end
	
	return 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] onExit
-------------------------------------------------------------------------------
function f_quick_use_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM,self.event_updateUseItem1)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_quick_use_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_quick_use_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] onCleanup
-------------------------------------------------------------------------------
function f_quick_use_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_quick_use_popup:initAllComponent()
    local close = function()
		g_game.g_panelManager:removeUiPanel("quick_use_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["close_btn2"]:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local use = function()
    	self:quickUse()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["use_btn"]:addHandleOfcomponentEvent(use, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--除了vip道具以外其他道具的使用返回
	self.event_updateUseItem1 = function()
		self:updateUseItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM,self.event_updateUseItem1)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] updateUseItem
-- 快速使用结果
-------------------------------------------------------------------------------
function f_quick_use_popup:updateUseItem()
	local propData = g_game.g_userInfoManager:getUserEquipData()
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local userInfo = g_game.g_userInfoManager:getUserInfo()

	local liangcaoLimit = g_game.g_dictConfigManager:getStrengthUseLimit(vipInfo["level"])
	local junlingLimit = g_game.g_dictConfigManager:getMilitaryUseLimit(vipInfo["level"])
	local jingliLimit = g_game.g_dictConfigManager:getEnergyUseLimit(vipInfo["level"])
	
	for i = 1,#propData["propList"] do
		--商城道具  五千石粮草
		if propData["propList"][i]["propId"] == self.m_strengthItemId and  self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
			propData["propList"][i]["propNum"] = propData["propList"][i]["propNum"] - 1
			vipInfo["use_strength_times"] = vipInfo["use_strength_times"] +1
			local leftStrengthTimes = liangcaoLimit - vipInfo["use_strength_times"]
			self.m_componentTable["own_num"]:setString(propData["propList"][i]["propNum"])
			self.m_componentTable["left_num"]:setString(leftStrengthTimes)
			
			userInfo["strength"] = userInfo["strength"] + self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_STRENGTH][8]
		--商城道具  五百军令
		elseif propData["propList"][i]["propId"] == self.m_militaryItemId and self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		    propData["propList"][i]["propNum"] = propData["propList"][i]["propNum"] - 1
		    vipInfo["use_military_times"] = vipInfo["use_military_times"] +1
		    local leftMilitaryTimes = junlingLimit - vipInfo["use_military_times"]
		    self.m_componentTable["own_num"]:setString( propData["propList"][i]["propNum"])
			self.m_componentTable["left_num"]:setString(leftMilitaryTimes)
			
			userInfo["military"] = userInfo["military"] + self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_MILITARY][8]
		--商城道具 小精力丹
		elseif propData["propList"][i]["propId"] == self.m_energyItemId and self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
			propData["propList"][i]["propNum"] = propData["propList"][i]["propNum"] - 1
			vipInfo["use_energy_times"] = vipInfo["use_energy_times"] +1
			local leftEnergyTimes = jingliLimit - vipInfo["use_energy_times"]
			self.m_componentTable["own_num"]:setString(propData["propList"][i]["propNum"])
			self.m_componentTable["left_num"]:setString(leftEnergyTimes)
			
			userInfo["energy"] = userInfo["energy"] + self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_ENERGY][8]
		
		--征讨令
		elseif propData["propList"][i]["propId"] == self.m_challengeItemId and self.m_type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
			propData["propList"][i]["propNum"] = propData["propList"][i]["propNum"] - 1
			self.m_componentTable["own_num"]:setString(propData["propList"][i]["propNum"])
			
			userInfo["challengeNum"] = userInfo["challengeNum"] + self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8]
			local userRankData = g_game.g_userInfoManager:getUserPvpRank()
			userRankData["challengeNum"]  = userRankData["challengeNum"] + self.m_quickUseTable[g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT][8]
			
		end
	end
	
	local itemsList = propData["propList"]
	for i = 1,#itemsList do
		if itemsList[i]["propNum"] == 0 then
			table.remove(itemsList,i)
			propData["propList_Num"] = propData["propList_Num"] -1
			break
		end
	end
	g_game.g_panelManager:removeUiPanel("quick_use_panel")
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] quickUse
-- 快速使用
-------------------------------------------------------------------------------
function f_quick_use_popup:quickUse()
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
		quickCharge:setTipString("VIP使用次数已达上限，是否前往充值？")
	--	g_game.g_utilManager:showMsg("该道具已达当前VIP使用次数上限")
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
	g_game.g_userInfoManager:requestUseSelectItem(dataT)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] judgeIsArriveTimesLimit
-- 判断是否达到次数上限
-------------------------------------------------------------------------------
function f_quick_use_popup:judgeIsArriveTimesLimit()
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

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_use_popup] judgeIsArriveValueLimit
-- 判断是否达到值上限
-------------------------------------------------------------------------------
function f_quick_use_popup:judgeIsArriveValueLimit()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	
	local isPopup = false
	local des = nil
	
	if self.m_type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
		local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
		if userInfo["strength"] >= userStrengthLimit then
			des = "粮草已达上限，无法使用"
			isPopup = true
		end
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		local userMilitaryLimit = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
		if userInfo["military"] >= userMilitaryLimit then
			des = "军令已达上限，无法使用"
			isPopup = true
		end
	elseif self.m_type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
		local userJingliLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
		if userInfo["energy"] >= userJingliLimit then
			des = "精力已达上限，无法使用"
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

