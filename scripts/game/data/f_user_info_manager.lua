--[[--
    玩家自己的信息更新
--]]--

local f_user_info_manager = class("f_user_info_manager")
f_user_info_manager.__index = f_user_info_manager

-------------------------------------------------
-- @function [parent=#f_user_info_manager] ctor
-------------------------------------------------
function f_user_info_manager:ctor()
	self:resetCurrentUserData()
		
	local receiveSaoDang = function(msg)
		self:receiveSaoDang(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_LEVEL_SWEEP, receiveSaoDang)
	
	local receiveJiTian = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["res"] == 0 then
			local num = msg["baoyin"] - self.m_baoyin
			self.m_baoyin = msg["baoyin"]
			local t = nil
			local key = "id"
			if self.m_lianhuaType == 1 then
				t = self.m_officer_position["unbattleList"]
			elseif self.m_lianhuaType == 2 then
				t = self.m_beautiArrList["unbattleList"]
			elseif self.m_lianhuaType == 3 then
				t = self.m_equipments["equipments"]
				key = "primaryId"
			end
			for i = 1, #self.m_lianhuaList do
				for j = 1, #t do
					if t[j][key] == self.m_lianhuaList[i]["primaryId"] then
						table.remove(t,j)
						break;
					end
				end
			end
			local reward = {}
			table.insert(reward, {["type"] = 14, ["id"] = 0, ["primaryId"] = 0, ["num"] = num})
			for i = 1, #msg["jitianList"] do	
				local data = msg["jitianList"][i]
				local num = self:addEmptyCard(data["type"], data["id"], data["primaryId"], data["num"])
				if num > 0 then
					data["num"] = num
					table.insert(reward, data)
				end
			end
			
			local panel = g_game.g_panelManager:getUiPanel("lianhua_panel")
			if panel ~= nil then
				panel:setReward(reward)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_FINISH_JITIAN)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CARD_JITIAN, receiveJiTian)
	
	local receiveLeftCount = function(msg)
		self.m_leftCount = msg
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_LEFT_TIME)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_REMAIN_COUNT, receiveLeftCount)
	
	
	local receiveGameLimit = function(msg)
		local index = {}
		for i = 1,#msg["list"] do
			if msg["list"][i]["status"] == 1 then
				table.insert(index,i)
			end
		end
		
		local refLimitStr = nil
		if LANGUAGE_TYPE == 3 then
			refLimitStr = g_game.g_f_bagLimit_str2
		else
			refLimitStr = g_game.g_f_bagLimit_str1
		end
		
		local finalStr = ""
		for j = 1,#index do
			if j ~= #index then
				finalStr =finalStr..refLimitStr[index[j]].."、"
			else
				finalStr =finalStr..refLimitStr[index[j]]
			end
		end 
		finalStr = finalStr..refLimitStr[5]
		
		g_game.g_utilManager:showMsg(finalStr)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_LIMIT_INFO, receiveGameLimit)
	
	local receiveExchangeReward = function(msg)
		self:receiveExchangeReward(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_EXCHANGE_CODE, receiveExchangeReward)
	
	
	local receiveBattleArr2 = function(msg)
		self:receiveBattleArr2FirstCard(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SEC_BATTLE_CARD, receiveBattleArr2)
	
	local receiveBuyLianhuaItem = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			self:addEmptyCard(msg["type"], msg["id"], msg["primaryId"], msg["num"])
			self.m_baoyin = msg["baoyin"]
			local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
			local t = bitCal:d2b(self.m_lianhuaShopMask)
			t[self.m_lianHuaShopBuyIndex] = 1
			self.m_lianhuaShopMask = bitCal:b2d(t)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_LIANHUA_SHOP)
			g_game.g_panelManager:showEffect(9)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_JITIAN_SHOP_BUY, receiveBuyLianhuaItem)
	
	local receiveBuyRankItem = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			self:addEmptyCard(msg["type"], msg["id"], msg["primaryId"], msg["num"])
			local data = self.m_huodongData[g_game.g_huodong_choujiang]
			data["currentScore"] = msg["currentScore"]
			local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
			local t = bitCal:d2b(self.m_shopBuyMask)
			t[self.m_rankShopBuyIndex] = 1
			self.m_shopBuyMask = bitCal:b2d(t)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK)
			g_game.g_panelManager:showEffect(9)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHOUJIANG_SHOP_BUY, receiveBuyRankItem)
	
	local receivePvpLeaderboard = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			local panel = g_game.g_panelManager:getUiPanel("leaderboard")
			if panel ~= nil then
				panel:updatePvpLeaderboard(msg)
			end
		else
			g_game.g_utilManager:showMsg("请求排行榜失败")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_PVP_RANK_LIST, receivePvpLeaderboard)
	
	local receivePveRankLeaderboard = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			local panel = g_game.g_panelManager:getUiPanel("leaderboard")
			if panel ~= nil then
				panel:updateLevelRankLeaderboard(msg)
			end
		else
			g_game.g_utilManager:showMsg("请求排行榜失败")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_PVE_LEVEL_LIST, receivePveRankLeaderboard)
	
	local receiveLianhuaShop = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			self.m_user_info["gold"] = msg["gold"]
			self:setPropNum(47, msg["itemNum"])
			self.m_lianhuaShopMask = msg["shopItemMask"]
			local panel = g_game.g_panelManager:getUiPanel("lianhua_shop") 
			if panel ~= nil then
				panel:setData(msg["list"], msg["nextFlushTime"])
				panel:refresh()
			else
				require("scripts.game.main.lianhua.f_lianhuaShop")
				local panel = f_lianhuaShop.static_create()
				panel:panelInitBeforePopup(msg["list"], msg["nextFlushTime"])
				g_game.g_panelManager:showUiPanel(panel, "lianhua_shop")
			end
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_JITIAN_SHOP_INFO, receiveLianhuaShop)
	
	local receiveRankShop = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			self.m_shopBuyMask = msg["shopItemMask"]
			local panel = g_game.g_panelManager:getUiPanel("rank_shop") 
			if panel ~= nil then
				panel:setData(msg["list"], msg["nextFlushTime"])
				panel:refresh()
			else
				require("scripts.game.main.reward.f_rank_shop")
				local panel = f_rank_shop.static_create()
				panel:panelInitBeforePopup(msg["list"], msg["nextFlushTime"])
				g_game.g_panelManager:showUiPanel(panel, "rank_shop")
			end
			self.m_user_info["gold"] = msg["gold"]
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHOUJIANG_SHOP, receiveRankShop)
	
	local receiveChoujiangRank = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			local data = self.m_huodongData[g_game.g_huodong_choujiang]
			data["rank"] = msg["rank"]
			data["score"] = msg["score"]
			require("scripts.game.main.reward.f_choujiang_rank_panel")
			local panel = f_choujiang_rank_panel.static_create()
			panel:panelInitBeforePopup(msg)
			g_game.g_panelManager:showUiPanel(panel, "choujiang_rank")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHOUJIANG_RANK, receiveChoujiangRank)
	
	local receiveChoujiang = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			local t = msg["list"]
			local reward = {}
			for i = 1, #t do
				self:addEmptyCard(t[i]["type"], t[i]["id"], t[i]["primaryId"], t[i]["num"])
				table.insert(reward, {["type"] = t[i]["type"], ["id"] = t[i]["id"], ["num"] = t[i]["rewardNum"]})
			end
			self.m_user_info["gold"] = msg["gold"]
			local data = self.m_huodongData[g_game.g_huodong_choujiang]
			data["score"] = msg["score"]
			data["currentScore"] = msg["currentScore"]
			data["rank"] = msg["rank"]
			require("scripts.game.main.reward.f_choujiang_rewardPanel")
			local mail = f_choujiang_rewardPanel.static_create()
			mail:panelInitBeforePopup(reward, true)
			g_game.g_panelManager:showUiPanel(mail, "choujiang_reward")
			if self.m_isChoujiangFree then
				self.m_huodongData[g_game.g_huodong_choujiang]["freeTime"] = self.m_huodongData[g_game.g_huodong_choujiang]["freeTime"] + 1
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHOUJIANG, receiveChoujiang)
	
	local receiveHuodong = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		
		self.m_huodongList = {}
		self.m_huodongReceive = {}
		self.m_huodongReceive["dailyReward"] = 0
		self.m_huodongReceive["levelReward"] = 0
		self.m_huodongReceive["worldboss"] = 0
		if msg["result"] == 1 then
			for i = 1, #msg["list"] do
				table.insert(self.m_huodongList, msg["list"][i]["type"])
				g_game.g_dictConfigManager:setRemoteConfig(msg["list"][i]["type"], msg["list"][i]["data"])
				g_game.g_recoverManager:setHuodongEndTime(msg["list"][i]["type"], msg["list"][i]["endTime"])
				self.m_huodongReceive[msg["list"][i]["type"]] = 0
			end
		end
		for k, v in pairs(self.m_huodongReceive) do
			if k == "dailyReward" then
				self:requestDailyReward()
			elseif k == "levelReward" then
				self:requestLevelReward()
			elseif k == "worldboss" then
				self:requestWorldBoss()
			elseif k == g_game.g_huodong_chongzhi then
				local sendMsg = {}
				sendMsg["roleId"] = self.m_user_info["roleId"]
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
				g_game.g_netManager:send_message(g_network_message_type.CS_GET_PEROID_CHARGE_INFO, sendMsg)
			elseif k == g_game.g_huodong_choujiang then
				self:requestChoujiangInfo()
			elseif k == g_game.g_huodong_box then
				self:requestFortuneBox()
--				self.m_huodongReceive[3] = 1
			end
		end
		g_game.g_recoverManager:setHuodongTime(msg["time"])
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_HUODONG_INFO, receiveHuodong)
	
	local receiveFortuneBox = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			self.m_huodongData[g_game.g_huodong_box] = msg["list"]
			self.m_huodongReceive[g_game.g_huodong_box] = 1
			self:openHuodong()
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_FORTUNE_BOX, receiveFortuneBox)
	
	local receiveBuyFortuneBox = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			local num = self:addEmptyCard(msg["type"], msg["id"], msg["primaryId"], msg["num"])
			local reward = {{["type"] = msg["type"], ["id"] = msg["id"], ["num"] = num}}
			self.m_user_info["gold"] = msg["gold"]
			local data = self.m_huodongData[g_game.g_huodong_box]
			data[self.m_boxIndex]["num"] = msg["left"]
			require("scripts.game.main.reward.f_choujiang_rewardPanel")
			local mail = f_choujiang_rewardPanel.static_create()
			mail:panelInitBeforePopup(reward, false)
			g_game.g_panelManager:showUiPanel(mail, "choujiang_reward")
			
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_BOX)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BUY_FORTUNE_BOX, receiveBuyFortuneBox)
	
	local receiveChoujiangInfo = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		self.m_huodongData[g_game.g_huodong_choujiang] = msg
		self.m_huodongReceive[g_game.g_huodong_choujiang] = 1
		self:openHuodong()
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHOUJIANG_INFO, receiveChoujiangInfo)
	
	
	local onSellBingfa = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			self:removeEquipments(self.m_selledBingfa)
			self.m_selledBingfa = nil
			self.m_user_info["silver"] = msg["silver"]
		   	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA)
		   	local panel = g_game.g_panelManager:getUiPanel("bing_fa")
			panel:setPageAndBottom(1, nil)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BOOK_PRICE, onSellBingfa)
	--接受走马灯消息
	local onUpgradeBingfa = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			local e = self:getEquipByPrimayID(self.m_bingfaUpgradeId)
			if e ~= nil then
				local addLv = msg["level"] - e["equip_level"]
				e["equip_level"] = msg["level"]
				e["bookExp"] = msg["exp"]
				local popupLvUp = require("scripts.game.main.common.f_common_popup_notice").new()	
				g_game.g_panelManager:showUiPanel(popupLvUp,"notice_popup_panel")
		   		if LANGUAGE_TYPE == 3 then
		   			local lvupTips = "經驗+".. msg["obtainExp"] .. "\n等級+" .. addLv
		   			popupLvUp:setNoticeContent("升級成功","恭喜您成功升級！",lvupTips,nil)
		   		else
		   			local lvupTips = "经验+".. msg["obtainExp"] .. "\n等级+" .. addLv
		   			popupLvUp:setNoticeContent("升级成功","恭喜您成功升级！",lvupTips,nil)
		   		end
		   		
		   		--13 名臣吞卡升级
		   		popupLvUp:popUpNotice(13)
		   		--1 stand for scale action
		   		popupLvUp:setActionType(1)
		   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI)
		   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA)
			end
			self:removeEquipments(self.m_bingfaUpgradeCostList)
			self.m_bingfaUpgradeCostList = nil
			self.m_user_info["silver"] = msg["silver"]
			local panel = g_game.g_panelManager:getUiPanel("bing_fa")
			panel.m_refresh()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_UPGRADE_BING_FA, onUpgradeBingfa)
	
	local receiveMovingMsg = function(msg)
		self:setMovingMsg(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_MOVING_MSG, receiveMovingMsg)
	
	local receiveChangeBattleArr = function(msg)
		self:receiveChangeBattleArr(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHANGE_BATTLE, receiveChangeBattleArr)

	local receiveLueduoList = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 1 then
			self.m_lueduoList = msg["list"]
			self:openLueduoPanel()
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PREY_LIST, receiveLueduoList)
	
	local receiveBaoyin = function(msg)
		if msg["result"] == 0 then
			self.m_baoyin = msg["baoyin"]
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_USER_JITIAN_INFO, receiveBaoyin)
	
	
	local receiveBingfaList = function(msg)
		for i = 1, #msg["bookList"] do
			table.insert(self.m_equipments["equipments"], msg["bookList"][i])
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_EQUIPPOSITION)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_BOOKS_LIST, receiveBingfaList)
	
	local receiveAdvance = function(msg)
		if msg["result"] == 0 then
			local card =self:getOfficerByPrimayID(self.m_advanceCardId)
			card["advanced"] = msg["offical"]
			if msg["cardId"] > 0 then
				self:removeUnbattleOfficerByPrimayID(msg["cardId"])
			end
			self.m_user_info["silver"] = msg["silver"]
			if msg["offical"] >= g_game.g_dictConfigManager:getMaxAdvanceLevel() then
				local str = g_game.g_dictConfigManager:getLanTextById(360)
				g_game.g_utilManager:showMsg(str)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_MINGCHEN_JINJIE_EFFECT)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CARD_ADVANCED, receiveAdvance)
	
	local receiveBingfaMerge = function(msg)
		if msg["result"] == 1 then
			self:addEmptyCard(6, msg["bingFaId"], msg["bId"], 1)
			for i = 1, #self.m_mergeBingfaPieces do
				self:removeBingfaPiece(self.m_mergeBingfaPieces[i], 1)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA_MERGE)
		else
			g_game.g_utilManager:showMsg("兵法合成失败")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_MERGE_BING_FA, receiveBingfaMerge)
	
	local receiveXunfang = function(msg)
		if msg["result"] == 0 then
			self:receiveXunfang(msg["rewardList"])
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_VISIT, receiveXunfang)
	
	local receiveGetFirstChargReward = function(msg)
		self:receiveGetFirstChargReward(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_CHARGE_REWARD, receiveGetFirstChargReward)
	
	local receiveFirstChargeFlag = function(msg)
		self:receiveFirstChargeFlag(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_CHARGE_REWARD_INFO, receiveFirstChargeFlag)
	
	local receiveAskTaxResult = function(msg)
		self:receiveAskTaxResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_TEX, receiveAskTaxResult)
	
	local receiveRewardFlag = function(msg)
		self.m_todayRewardFlag = msg
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USER_STRENGTH_REWARD_INFO, receiveRewardFlag)
	
	local receiveStrengthReward = function(msg)
		self:receiveStrengthReward(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_STRENGTH_REWARD, receiveStrengthReward)
	
	local receiveUseVipPack = function(msg)
		self:receiveUseVipPack(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_PROP_PACKAGE, receiveUseVipPack)
	
	--获得vip pack
	local receiveVipPack = function(msg)
		self:receiveVipPack(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BUY_VIP_PACKAGE, receiveVipPack)
	--查看 当前关卡可购买挑战次数  需要花费银两返回结果  
	local receiveChallengeNumCondition = function(msg)
		self:receiveChallengeNumCondition(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PURCHASE_FUBEN_INFO, receiveChallengeNumCondition)
	
	--关卡副本返回结果
	local receiveChallengeNum = function(msg)
		self:receiveResetPveChallengeNum(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PURCHASE_FUBEN, receiveChallengeNum)
	
	--接受过关奖励 消息
	self.passStageResult = nil
	local receiveStageReward = function(msg)
		self:receiveStageReward(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PASS_STAGE_GIFT, receiveStageReward)
	
	local receiveUserCombinationData = function(msg)
		self:updateUserCombination(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_CARD_COMBINA_INFO, receiveUserCombinationData)
	
	local receiveEquipment = function(msg)
		self.m_equipments = msg
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_EQUIPMENTS, receiveEquipment)
	
	local mergePieceResult = function(msg)
		if msg["result"] == 1 then
			local type = g_game.g_dictConfigManager:getPieceType(self.m_mergePieceId)
			local t = self:getPieceList(type)
			for i = 1, #t do
				if t[i]["fragmentId"] == self.m_mergePieceId then
					t[i]["count"] = t[i]["count"] - g_game.g_dictConfigManager:getPieceMergeNumber(self.m_mergePieceId)
					if t[i]["count"] == 0 then
						table.remove(t, i)
					end
					break
				end
			end
			if type == 1 then
				type = 3
			elseif type == 2 then
				type = 2
			elseif type == 3 then
				type = 6
			end
			self:addEmptyCard(type, g_game.g_dictConfigManager:getPieceCardID(self.m_mergePieceId), msg["id"], 1)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_FRAGMENT_MERGE, mergePieceResult)
	
	local receiveSellEquipment = function(msg)
		if msg["result"] == 0 then
			local t = self.m_equipments["equipments"]
			for i = 1, #t do
				if t[i]["primaryId"] == self.m_sellEquipID then
					table.remove(t,i)
					break
				end
			end
			self.m_user_info["silver"] = msg["silver"]
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SELL_EQUIP)
		end			
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SELL_EQUIPMENT, receiveSellEquipment)
	
	local onChangeEquip = function(msg)
		if msg["result"] == 0 then
			if self.m_changedOldEquip ~= nil then
				self.m_changedOldEquip["status"] = 0
				self.m_changedOldEquip["position"] = 0
				self.m_changedOldEquip["battle"] = 0
			end
			self.m_changedNewEquip["status"] = 1
			self.m_changedNewEquip["battle"] = self.m_user_info["curr_battle"]
			self.m_changedNewEquip["position"] = self.m_changedEquipPosition
			g_game.g_panelManager:showEffect(7)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_EQUIPMENTS, onChangeEquip)
	
	local onUnloadEquip = function(msg)
		if msg["result"] == 0 then
			self.m_unloadedEquip["status"] = 0
			self.m_unloadedEquip["position"] = 0
			self.m_unloadedEquip["battle"] = 0
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP)
			g_game.g_panelManager:removeUiPanel("equip_detial_panel")
			g_game.g_panelManager:showEffect(6)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_REMOVE_EQUIPMENTS, onUnloadEquip)
	
	local onUpgradeEquip = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			self.m_upgradeEquip["equip_level"] = self.m_upgradeEquip["equip_level"] + msg["level"]
			self.m_user_info["silver"] = msg["silver"]
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP)
		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_STOP_UPDATE_EQUIP)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_EQUIPMENT_LEVEL_UP, onUpgradeEquip)
	
	local qiandaoInfo = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			self.m_qiandaoMask = msg["mask"]
			self.m_qiandaoDay = msg["checkNum"]
			if msg["money"] > 0 then
				self.m_qiandaoDay = self.m_qiandaoDay + 1
			end
			if self.m_qiandaoDay > 20 then
				self.m_qiandaoDay = 1
			end
			if self.m_shouldOpenQiandao then
				g_game.g_dictConfigManager:setRemoteConfig("qiandao", msg["rewardDes"])
				require("scripts.game.main.reward.f_qiandaoPanel")
				local panel = f_qiandaoPanel.static_create()
				panel:panelInitBeforePopup(msg)
				g_game.g_panelManager:showUiPanel(panel, "qiandao_panel")
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_QIANDAO_EFFECT)
		end
		self.m_shouldOpenQiandao = true
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_CHARGE_CHECKIN_INFO, qiandaoInfo)
	
	local claimQiandaoReward = function(msg)
		if msg["result"] == 0 then
			local t = msg["rewardList"]
			for i = 1, #t do
				self:addEmptyCard(t[i]["type"], t[i]["id"], t[i]["primaryId"], t[i]["num"])
			end
			local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
			local rewardMask = bitCal:d2b(self.m_qiandaoMask)
			rewardMask[self.m_claimQiandaoIndex] = 1
			self.m_qiandaoMask = bitCal:b2d(rewardMask)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLIAM_QIANDAO)
			local strT = g_game.g_dictConfigManager:getLanTextById(369)
			g_game.g_utilManager:showFloatingMsg(strT)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_QIANDAO_EFFECT)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ACCEPT_CHARGE_CHECKIN_REWARD, claimQiandaoReward)
	
	local claimDailyReward = function(msg)
		if msg["result"] == 1 then
			local t = msg["resultList"]
			for i = 1, #t do
				self:addEmptyCard(t[i]["type"], t[i]["cardId"], t[i]["uniquId"], t[i]["totalNum"])
			end
			for i = 1, #self.m_dailyRewardUnReceiveList do
				if self.m_dailyRewardUnReceiveList[i] == self.m_claimDailyRewardIndex then
					table.remove(self.m_dailyRewardUnReceiveList, i)
					break
				end
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLAIM_DAILY_REWARD)
			local strT = g_game.g_dictConfigManager:getLanTextById(369)
			g_game.g_utilManager:showFloatingMsg(strT)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_LOGIN_REWARD_RESPONSE, claimDailyReward)
	
	local claimLevelReward = function(msg)
		if msg["result"] == 0 then
			local t = msg["updateInfo"]
			for i = 1, #t do
				self:addEmptyCard(t[i]["type"], t[i]["id"], t[i]["primaryId"], t[i]["num"])
			end
			table.insert(self.m_levelRewardReceiveList, self.m_claimLevelRewardLevel)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLAIM_LEVEL_REWARD)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
			local strT = g_game.g_dictConfigManager:getLanTextById(369)
			g_game.g_utilManager:showFloatingMsg(strT)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_RECEIVE_LEVEL_REWARD, claimLevelReward)
	
	--世界boss已开启
	local receiveWorldBossOpen = function(msg)
		self:receiveWorldBossOpen(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CURRENT_FIGHT_INFO, receiveWorldBossOpen)
	
	--世界boss 未开启信息
	local receiveLastKillBossInfo = function(msg)
		self:receiveLastKillBossInfo(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_LAST_KILL_BOSS_INFO, receiveLastKillBossInfo)
	
	--世界boss榜单数据
	local receiveLastRankInfo = function(msg)
		self:receiveLastRankInfo(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_RANK_LIST, receiveLastRankInfo)
	
	local receiveWorldBossUserInfo = function(msg)
		self:receiveWorldBossUserInfo(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_WORLD_BOOS_USER_INFO, receiveWorldBossUserInfo)
	
	--boss鼓舞
	local receiveBossCourage = function(msg)
		self:receiveBossCourage(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GU_WU_INFO, receiveBossCourage)
	
	--重生
	local receiveBossReborn = function(msg)
		self:receiveBossReborn(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_REBORN_FIGHT, receiveBossReborn)
	
	local receiveLevelReward = function(msg)
		local tab = msg["reward_level_list"]
		self.m_levelRewardReceiveList = {}
		for i = 1, #tab do
			table.insert(self.m_levelRewardReceiveList, tab[i]["level"])
		end
		self.m_huodongReceive["levelReward"] = 1
		self:openHuodong()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_USER_REWARD_LEVEL, receiveLevelReward)
	
	local receiveDailyReward = function(msg)
		local tab = msg["rewardList"]
		self.m_dailyRewardUnReceiveList = {}
		for i = 1, #tab do
			table.insert(self.m_dailyRewardUnReceiveList, tab[i]["rewardId"])
		end
		self.m_claimDailyRewardIndex = msg["days"]
		self.m_huodongReceive["dailyReward"] = 1
		self:openHuodong()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_LOGIN_REWARD_RESPONSE, receiveDailyReward)
	
	local receiveUseItem = function(msg)
		self:receiveUseItem(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USE_PROP, receiveUseItem)
	
	local receiveBuyItem = function(msg)
		self:receiveBuyItem(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BUY_PROP, receiveBuyItem)

	local updateUserEquipInfo = function(msg)
		self:receiveUserEuipBagData(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PROP_LIST, updateUserEquipInfo)
	
	local updateUserPiece = function(msg)
		self:receiveUserPieces(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_FRAGMENT_INFO, updateUserPiece)
	
	local updateBingfaPiece = function(msg)
		self:receiveBingfaPieces(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_PIECE_LIST, updateBingfaPiece)
	
	local updatePveSmallStageNums = function(msg)
		self:receivePveSmallStageNums(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_LEVEL_FIGHT_INFO, updatePveSmallStageNums)
	
	local updatePveLevelInfo = function(msg)
		self:receivePveLevelData(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_LEVEL_INFO, updatePveLevelInfo)
	
	local updateTargetPvpFightData = function(msg)
		if self.m_pveBattleData["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_REPLAY then
			msg["enemyName"] = self.m_pveBattleData["enemyReplayName"]
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		self:setBattleData(msg)
		
		if g_game.g_utilManager:allGuidelinesIsFinish() then
			g_game.g_dataManager:saveBattleState(0,1)
		end
		
		--进入资源loading界面
		g_game.enterLoadingScene(1)	
		if g_game.g_current_loading_scene ~= nil then
			g_game.g_current_loading_scene:setLoadingData(msg)
		end
	end	
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PVP_FIGHT, updateTargetPvpFightData)
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PREY_FIGHT, updateTargetPvpFightData)
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PVP_REPLAY, updateTargetPvpFightData)
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PREY_FIGHT_REPLAY, updateTargetPvpFightData)
		
	local updateUserContribute = function(msg)
		self:updateUserContribute(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PLAY_CONTRIBUTION, updateUserContribute)
	
	--接收到的 断开链接原因
	local disconnectCallback = function(msg)
		self:setDisconnectReason(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_DISCONNECT_INFO, disconnectCallback)
	
	--注册登录接收的服务器消息
	local sclogininfoCallback = function(msg)
		g_game.g_dataManager:saveBattleState(0,0)
		g_game.g_dataManager:savePveProgress("","","")
		self:setUserInfo(msg)	
		self:updateBuilding()	
		
		self:requestBeautyArr()
		self:requestPrinceList()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)

		if self:loginGame() then	
			self:sendToGetVipYuanbao()		
			self:requestUserEquipBag()
			self:requestUserPieces()
			self:requestRecoverTime()
			self:sendToGetKejuCDTimeAndTimes()
			self:sendToGetXuanxiuCDTimeAndTimes()
		end
		
		self:requestMonthCard()
		
		--登录成功后给平台服务器发送玩家数据
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SEND_USERINFO_TO_PLANTFORM)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_LOGIN_INFO, sclogininfoCallback)
	
	local scRemoveBeauty = function(msg)
		self:removeBeauty(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BEAUTY_CARD_PRICE_RESPONSE, scRemoveBeauty)
	
	local scRemovePrince = function(msg)
		self:removePrince(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PRINCE_CARD_PRICE_RESPONSE, scRemovePrince)
	
	local scRemoveMingChen = function(msg)
		self:removeMinChen(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_OFFICER_CARD_PRICE_RESPONSE, scRemoveMingChen)
	
	local scGetMail = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
		self.m_mailCount = msg["mail_num"]
		if self.m_mailCount ~= nil and self.m_mailRequestIndex >= self.m_mailCount and self.m_mailCount ~= 0 then
			self.m_mailReuqestIndex = (math.ceil(self.m_mailCount / 4) - 1) * 4 
			self:requestMail(math.ceil(self.m_mailCount / 4), self.m_mailRequestType)
			return
		end
		self.m_mailPage = self.m_mailRequestIndex / 4 + 1
		self.m_mailList = msg["mail_list"]
		self.m_mailServerTime = msg["server_timestamp"]
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RECEIVE_MAIL)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_SYS_MAILS, scGetMail)
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_PVP_MAIL, scGetMail)
	
	local scDeleteMail = function(msg)
		if msg["result"] == 0 then
			g_game.g_utilManager:showMsg("删除成功")
			self:requestMail(self.m_mailPage, self.m_mailRequestType)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_DELETE_MAIL, scDeleteMail)
	g_game.g_netManager:registerMessage(g_network_message_type.SC_REMOVE_PVP_MAIL, scDeleteMail)
	
	local scDealMail = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			self:requestMail(self.m_mailPage, self.m_mailRequestType)
			local t = msg["updateInfo"]
			for i = 1, #t do
				local num = self:addEmptyCard(t[i]["type"], t[i]["id"], t[i]["primaryId"], t[i]["num"])
				if num > 0 then
					t[i]["num"] = num
				end
			end	
			require("scripts.game.main.mail.f_mail_attachment")
			local mail = f_mail_attachment.static_create()
			mail:panelInitBeforePopup(t)
			g_game.g_panelManager:showUiPanel(mail, "mail_attachment")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CONFIRM_MAIL_ATTACHMENT, scDealMail)

	--获取 美女 列表
	local beautyListCallBack = function(msg)
		self:setBeautiListInfo(msg)
		
		if self:loginGame() then	
			self:sendToGetVipYuanbao()		
			self:requestUserEquipBag()
			self:requestUserPieces()
			self:requestRecoverTime()
			self:sendToGetKejuCDTimeAndTimes()
			self:sendToGetXuanxiuCDTimeAndTimes()
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BEAUTY_LIST, beautyListCallBack)
	
	--获取宠幸 结果
	local beautyChongxingCallBack = function(msg)
		self:setChongxingResult(msg)
		self:updateChongxingResult()
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_FAVOR_BEAUTY, beautyChongxingCallBack)
	
	--获取请求怀孕时间结果
	local beautyPregnantTimeCallBack = function(msg)
		self:setPregnantTimeResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BEAUTY_CONCEIVE, beautyPregnantTimeCallBack)
	
	--获得出生的皇子id
	local beautyPrinceBornCallBack = function(msg)
		self:setBornPrinceResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_OBTAIN_PRINCE, beautyPrinceBornCallBack)
	
	
	--获得宫斗结果
	local palaceBattleResult = function(msg)
		self:setPalaceBattleResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PALACE_BATTLE, palaceBattleResult)
	
	--弃妃结果
	local qifeiResult = function(msg)
		self:setQifeiResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_WASTER_PRINCESS, qifeiResult)
	
	--册封结果
	local cefengResult = function(msg)
		self:setCefengResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BEAUTY_CEFENG, cefengResult)
	
	--尚书房结果
	local princeEducationResult = function(msg)
		self:setPrinceEducationResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PRINCE_SHANG_SHU_FANG, princeEducationResult)
	
	--注册阵容接收的服务器消息
	local officerCallback = function(msg) 
		self:setOfficerInfo(msg)
		
		if self:loginGame() then	
			self:sendToGetVipYuanbao()		
			self:requestUserEquipBag()
			self:requestUserPieces()
			self:requestRecoverTime()
			self:sendToGetKejuCDTimeAndTimes()
			self:sendToGetXuanxiuCDTimeAndTimes()
			--发送播放战斗场景音乐事件
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINRUYOUXI)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CARD_BATTLE_LIST, officerCallback)
	
	local gonggaoCallback = function(msg)
		self.m_gonggaoList = msg["announcement_list"]
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if #self.m_gonggaoList > 0 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_RECEIVE_GONG_GAO)
		else
			g_game.g_utilManager:showFloatingMsg("当前没有公告")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_ANNOUNCEMENTS , gonggaoCallback)
	
	
	--经验上限 体力上限等 
	local limitCallback = function(msg)
		self:setLimitInfo(msg)
		
		if self:loginGame() then	
			self:sendToGetVipYuanbao()
			self:requestUserEquipBag()
			self:requestUserPieces()
			self:requestRecoverTime()
			self:sendToGetKejuCDTimeAndTimes()
			self:sendToGetXuanxiuCDTimeAndTimes()
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PERSON_LIMIT_INFO, limitCallback)
	
	--注册战斗数据返回回调
	local battleCallback = function(msg)
		self:setBattleData(msg)
		
		g_game.enterLoadingScene(1)	
		if g_game.g_current_loading_scene ~= nil then
			g_game.g_current_loading_scene:setLoadingData(msg)
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PVE_FIGHT, battleCallback)
	
	
	local bossBattleCallback = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		self.m_pveBattleData["roundData"] = msg
		
		self.m_canRequestInBoss = true
		g_game.enterLoadingScene(1)	
		if g_game.g_current_loading_scene ~= nil then
			g_game.g_current_loading_scene:setLoadingData(msg)
		end
		
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_WORLD_BOSS_FIGHT, bossBattleCallback)
	
	--注册精英战斗数据返回回调
	local eliteBattleCallback = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		
		self:setBattleData(msg)
			--进入资源loading界面
		g_game.enterLoadingScene(1)	
		if g_game.g_current_loading_scene ~= nil then
			g_game.g_current_loading_scene:setLoadingData(msg)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ELITE_FIGHT, eliteBattleCallback)
	
	--注册更换助阵美女回调
	local changeBeautyCallBack = function(msg)
		self:setChangeBeautyResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BEAUTY_BATTLE,changeBeautyCallBack)
	
	--注册换将返回回调
	local huangjiangCallBack = function(msg)
		self:setHuangJiangResult(msg)
		
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_OFFICER_CARD_BATTLE,huangjiangCallBack)
	
	local changePositionCallBack = function(msg)
		self:setChangePositionResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHANGE_BATTLE_ARRAY,changePositionCallBack)

	--皇子系统消息
	local recivePrinceList = function(msg)
		self:setPrinceData(msg)
		
		if self:loginGame() then	
			self:sendToGetVipYuanbao()		
			self:requestUserEquipBag()
			self:requestUserPieces()
			self:requestRecoverTime()
			self:sendToGetKejuCDTimeAndTimes()
			self:sendToGetXuanxiuCDTimeAndTimes()
			--发送播放战斗场景音乐事件
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINRUYOUXI)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PRINCE_LIST,recivePrinceList)
	
	local recivePrinceChangeNameCallback = function(msg)
		self:recivePrinceChangeNameResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PRINCE_CHANGE_NAME,recivePrinceChangeNameCallback)

	local receivePrinceZongrenfuCallback = function(msg)
		self:receivePrinceZongrenfuResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PRINCE_ZONG_REN_FU,receivePrinceZongrenfuCallback)
	
	--名臣升级回调
	local receiveMingchenShengjiCallback = function(msg)
		self:receiveMingchenShengjifuResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_MERGE_CARD_RESPONSE,receiveMingchenShengjiCallback)
	
	--接受pvp 挑战错误消息
	local receivePvpErrorMessage = function(msg)
		self:receivePvpErrorMessage(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PVP_ERROR_MESSAGE,receivePvpErrorMessage)
	
	
	--接受玩家 pvp 排名
	local receivePvpUserRank = function(msg)
		self:receivePvpUserRank(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PVP_RANK,receivePvpUserRank)
	
	--获取到科举四个名臣的列表
	local receiveKejumingchenList = function(msg)
		self:receiveKejumingchenList(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_OFFICER,receiveKejumingchenList)
	
	--获取到选秀四个秀女的列表
	local receiveXuanxiuxiunvList = function(msg)
		self:receiveXuanxiuxiunvList(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_BEAUTY,receiveXuanxiuxiunvList)
	
	--获取到科举名臣选择发送回馈
	local receiveSendKejuMingchenResult = function(msg)
		self:receiveSendKejuMingchenResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_EXTRACT_OFFICER,receiveSendKejuMingchenResult)
	
	--获取到选秀美女选择发送回馈
	local receiveSendXuanxiuXiunvResult = function(msg)
		self:receiveSendXuanxiuXiunvResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_EXTRACT_BEAUTY,receiveSendXuanxiuXiunvResult)
	
	--获取当前选秀的次数和CD时间
	local receiveXuanxiuCDTimeAndTimes = function(msg)
		self:receiveXuanxiuCDTimeAndTimes(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_XUAN_XIU,receiveXuanxiuCDTimeAndTimes)
	
	--获取当前科举的次数和CD时间
	local receiveKejuCDTimeAndTimes = function(msg)
		self:receiveKejuCDTimeAndTimes(msg)
	end	
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_KE_JU,receiveKejuCDTimeAndTimes)
	
	--获取玩家充值元宝数量
	local receiveUserChongzhiYuanbao = function(msg)
		self:receiveUserChongzhiYuanbao(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_VIP_INFO,receiveUserChongzhiYuanbao)
	
	--接受pvp 玩家的 内容
	local receivePvpPlayerZhenrong= function(msg)
		self:receivePvpPlayerZhenrong(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PVP_VIEW_BATTLE,receivePvpPlayerZhenrong)
	
	--接收更新年号结果
	local receiveAlterNianhaoResult= function(msg)
		self:receiveAlterNianhaoResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CHANGE_REIGN,receiveAlterNianhaoResult)
	
	local receiveGongjizhiDuihuanResult= function(msg)
		self:receiveGongjizhiDuihuanResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_EXCHANGE,receiveGongjizhiDuihuanResult)	

	--新手指引记录
	local recordGuidleStep= function(msg)
		self:responeseRecordGuidleStep(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_UPDATE_GUIDE_STEP,recordGuidleStep)	
	
	--服务器返回-------绑定账户
	local receiveBindInfo = function(msg)
		self:rBindAccountHandler(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BIND_ACCOUNT, receiveBindInfo)

	
	--服务器动态配置信息接收
	local receiveServerConfigInfo = function(msg)
		self:receiveServerConfigInfo(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SERVER_CONFIG_RESPONSE, receiveServerConfigInfo)

	--动态获取恢复时间
	local receiveRecoverTime = function(msg)
		self:receiveRecoverTime(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_RECOVER_LIST, receiveRecoverTime)
	
	local receiveRecoverData = function(msg)
		self:receiveRecoverData(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_RECOVER_STRENGTH_RESPONSE, receiveRecoverData)
	
	local receiveStoryProgress = function(msg)
		if msg["result"] == 1 then
			print "is play over"
		else
			print "play not over"
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_UPDATE_FIRST_LOGIN, receiveStoryProgress)
	
	-- 赏赐美女结果
	local scRewardBeauty = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			local awardPanel = g_game.g_panelManager:getUiPanel("meinv_award_ui")
			if awardPanel ~= nil then
				awardPanel:refreshItemList()
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_CEFENG_PANEL)
		else
			g_game.g_utilManager:showMsg("赏赐失败")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_REWARD_BEAUTY, scRewardBeauty)
	
	-- 批阅奏折结果
	local SC_READ_REPORTS = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		self.m_zouzhangResult = msg
		if msg["result"] == 0 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZOUZHANG_SUCCESS)

		elseif msg["result"] == 1 then
			-- 未到恢复时间
			g_game.g_utilManager:showMsg("批阅奏折未到恢复时间")
		else
			-- 失败
			g_game.g_utilManager:showMsg("批阅奏折失败")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_READ_REPORTS, SC_READ_REPORTS)
	
	-- 添加奏折结果
	local SC_ADD_REPORTS = function(msg)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		if msg["result"] == 0 then
			self.m_userReportsInfo["addReportsNum"] = self.m_userReportsInfo["addReportsNum"] + 1
			self.m_userReportsInfo["reportsNum"] = 0 -- 修改奏章数目
			self.m_zouzhangAddTime = g_game.g_f_lua_game_event.F_LUA_ZOUZHANG_RECOVER_TIME
			self.m_user_info["gold"] = msg["gold"]
			-- 刷新显示
			local jinluandianPanel = g_game.g_panelManager:getUiPanel("jinluandian_bg")
			if jinluandianPanel ~= nil then
				jinluandianPanel:refreshZouzhangNum(self:getLeftReportsNum(), 0)
			end
		else
			g_game.g_utilManager:showMsg("添加奏折失败")
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ADD_REPORTS, SC_ADD_REPORTS)
	
	-- 用户批阅奏折信息，登录时会主动推送一次
	local SC_USER_REPORTS_INFO = function(msg)
		self.m_userReportsInfo = msg
		if msg["reportsNum"] <= 0 then
			self.m_zouzhangAddTime = g_game.g_f_lua_game_event.F_LUA_ZOUZHANG_RECOVER_TIME
		else
			self.m_zouzhangAddTime = msg["recoverStart"]
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_USER_REPORTS_INFO, SC_USER_REPORTS_INFO)
	
	-- 返回当前限时活动充值信息
	local SC_GET_PERIOD_CHARGE_INFO = function(msg)
		if msg["result"] == 0 then
			self.m_huodongData[g_game.g_huodong_chongzhi] = msg["peroidRewardList"][1]
			self.m_huodongReceive[g_game.g_huodong_chongzhi] = 1
			self:openHuodong()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_CHARGE_REWARD_PANEL)
		end
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_PERIOD_CHARGE_INFO, SC_GET_PERIOD_CHARGE_INFO)
	
	-- 返回领取限时充值奖励结果
	local SC_ACCEPT_PEROID_CHARGE_REWARD = function(msg)
		if msg["result"] == 0 then
			g_game.g_utilManager:showMsg("领取限时充值奖励成功")
			-- 更新数据
			self:updatePackToUser(msg["rewardList_Num"],msg["rewardList"])
			local rewardPanel = g_game.g_panelManager:getUiPanel("reward_panel")
			if rewardPanel ~= nil then
				rewardPanel:setChargeRewardBtnState()
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
		else
			g_game.g_utilManager:showMsg("领取限时充值奖励失败")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ACCEPT_PEROID_CHARGE_REWARD, SC_ACCEPT_PEROID_CHARGE_REWARD)
	
	-- 返回开服奖励信息
	local SC_GET_SERVER_START_REWARD = function(msg)
	--[[
		if msg["result"] == 0 then
			self.m_serverStartReward = msg
			local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
			local rewardMask = bitCal:d2b(msg["acceptRewardMask"])
			self.m_serverStartReward["rewardMask"] = rewardMask
			local hasReward = false
			local hasUnreceiveReward = false
			local infoTable = g_game.g_userInfoManager:getServerStartRewardInfo()
			local currentTime = g_game.g_gameManager:getCurrentTime()
			local daysNum = math.ceil((currentTime - self.m_serverStartReward["startTime"])/(24*3600))
			for i=1,7 do
				if rewardMask[i] < 1 then
					hasReward = true
					if i <= daysNum then
						hasUnreceiveReward = true
						break;
					end
				end
			end
			g_game.g_director:getRunningScene():setServerStartRewardBtnVisible(hasReward, hasUnreceiveReward)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	]]--
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_SERVER_START_REWARD, SC_GET_SERVER_START_REWARD)
	
	-- 返回领取开服奖励结果
	local SC_ACCEPT_SERVER_START_REWARD = function(msg)
	--[[
		if msg["result"] == 0 then
			self:updatePackToUser(msg["rewardList_Num"], msg["rewardList"])
			local openServiceGift = g_game.g_panelManager:getUiPanel("open_service_ui")
			if openServiceGift ~= nil then
				openServiceGift:refreshRewardState()
			end
			
			local hasReward = false
			local hasUnreceiveReward = false
			local infoTable = g_game.g_userInfoManager:getServerStartRewardInfo()
			local currentTime = g_game.g_gameManager:getCurrentTime()
			local daysNum = math.ceil((currentTime - infoTable["startTime"])/(24*3600))
			for i=1,7 do
				if self.m_serverStartReward["rewardMask"][i] < 1 then
					hasReward = true
					if i <= daysNum then
						hasUnreceiveReward = true
						break;
					end
				end
			end
			g_game.g_director:getRunningScene():setServerStartRewardBtnVisible(hasReward, hasUnreceiveReward)
			
			g_game.g_utilManager:showMsg("领取成功")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		else
			g_game.g_utilManager:showMsg("领取开服奖励失败")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	]]--
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ACCEPT_SERVER_START_REWARD, SC_ACCEPT_SERVER_START_REWARD)
	
	-- 返回新玩家签到奖励
	local SC_GET_CHECKIN_REWARD_INFO = function(msg)
		if msg["result"] == 0 then
			self.m_serverStartReward = msg
			local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
			local rewardMask = bitCal:d2b(msg["mask"])
			self.m_serverStartReward["rewardMask"] = rewardMask
			local rewardTable = g_game.g_dictConfigManager:getServerStartReward()
			local hasReceiveReward = 0
			local hasUnreceiveReward = false
			for i=1,rewardTable["num"] do
				if rewardMask[i] < 1 then
					hasReceiveReward = hasReceiveReward + 1
					if i <= msg["day"] then
						hasUnreceiveReward = true
					end
				end
			end
			self.m_serverStartReward["hasReward"] = hasReceiveReward>0
			self.m_serverStartReward["hasUnreceiveReward"] = hasUnreceiveReward
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_CHECKIN_REWARD_INFO, SC_GET_CHECKIN_REWARD_INFO)
	
	-- 领取签到奖励结果
	local SC_ACCEPT_CHECKIN_REWARD = function(msg)
		if msg["result"] == 0 then
			self:updatePackToUser(msg["rewardList_Num"], msg["rewardList"])
			local openServiceGift = g_game.g_panelManager:getUiPanel("open_service_ui")
			if openServiceGift ~= nil then
				openServiceGift:refreshRewardState()
			end
			
			local rewardTable = g_game.g_dictConfigManager:getServerStartReward()
			local hasReceiveReward = 0
			local hasUnreceiveReward = false
			for i=1,rewardTable["num"] do
				if self.m_serverStartReward["rewardMask"][i] < 1 then
					hasReceiveReward = hasReceiveReward + 1
					if i <= self.m_serverStartReward["day"] then
						hasUnreceiveReward = true
					end
				end
			end
			self.m_serverStartReward["hasReward"] = hasReceiveReward>0
			self.m_serverStartReward["hasUnreceiveReward"] = hasUnreceiveReward
			local strT = g_game.g_dictConfigManager:getLanTextById(369)
			g_game.g_utilManager:showMsg(strT)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SERVER_START_REWARD_BUTTON_STATE)
		else
			
			local strT = g_game.g_dictConfigManager:getLanTextById(370)
			g_game.g_utilManager:showMsg(strT)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ACCEPT_CHECKIN_REWARD, SC_ACCEPT_CHECKIN_REWARD)
	
	-- 加速怀孕
	local SC_ACCEL_CONCEIVE = function(msg)
		if msg["result"] == 0 then
			self.m_user_info["gold"] = msg["gold"]
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REQUEST_OBTAIN_BORN_PRINCEID)
		else
			g_game.g_utilManager:showMsg("催生失败！")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_ACCEL_CONCEIVE, SC_ACCEL_CONCEIVE)
	
	-- 名臣列表
	self.m_officer_tujian_table = {}
	local SC_OFFICER_TITLE_BLOCK = function(msg)
		self.m_officer_tujian_table = {}
		if msg["result"] == 1 then
			for i=1,msg["list_Num"] do
				self.m_officer_tujian_table[msg["list"][i]["card"]] = 1
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_OFFICER_TITLE_BLOCK, SC_OFFICER_TITLE_BLOCK)
	
	-- 美女列表
	self.m_beauty_tujian_table = {}
	local SC_BEAUTY_TITLE_BLOCK = function(msg)
		self.m_beauty_tujian_table = {}
		if msg["result"] == 1 then
			for i=1,msg["list_Num"] do
				self.m_beauty_tujian_table[msg["list"][i]["card"]] = 1
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BEAUTY_TITLE_BLOCK, SC_BEAUTY_TITLE_BLOCK)
	
	-- 装备列表
	self.m_equip_tujian_table = {}
	local SC_EQUIP_TITLE_BLOCK = function(msg)
		self.m_equip_tujian_table = {}
		if msg["result"] == 1 then
			for i=1,msg["list_Num"] do
				self.m_equip_tujian_table[msg["list"][i]["card"]] = 1
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_EQUIP_TITLE_BLOCK, SC_EQUIP_TITLE_BLOCK)
	
	-- 兵法列表
	self.m_bingfa_tujian_table = {}
	local SC_BING_FA_TITLE_BLOCK = function(msg)
		self.m_bingfa_tujian_table = {}
		if msg["result"] == 1 then
			for i=1,msg["list_Num"] do
				self.m_bingfa_tujian_table[msg["list"][i]["card"]] = 1
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_BING_FA_TITLE_BLOCK, SC_BING_FA_TITLE_BLOCK)
	
	-- 返回月卡礼包信息
	self.m_monthCardReward = {}
	local SC_GET_MONTH_CARD = function(msg)
		if msg["result"] == 0 then
			self.m_monthCardReward = msg
			local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
			local rewardMask = bitCal:d2b(msg["mask"])
			self.m_monthCardReward["rewardMask"] = rewardMask
			
			local rewardPanel = g_game.g_panelManager:getUiPanel("reward_panel")
			if rewardPanel ~= nil then
				rewardPanel:refreshMonthCardPanel()
			end
			self:updateHuodongFlag()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_MONTH_CARD, SC_GET_MONTH_CARD)
	
	-- 领取月卡礼包结果
	local SC_GET_MONTH_CARD_REWARD = function(msg)
		if msg["result"] == 0 then
			self:updatePackToUser(msg["rewardList_Num"], msg["rewardList"])
			
			local reward = nil
			for i=1,msg["rewardList_Num"] do
				reward = msg["rewardList"][i]
				self:addEmptyCard(reward["type"], reward["id"], reward["primaryId"], reward["num"])
			end
			
			self.m_monthCardReward["rewardMask"][self.m_monthCardReward["day"]] = 1
			local monthCardGiftPanel = g_game.g_panelManager:getUiPanel("monthCard_gift")
			if monthCardGiftPanel ~= nil then
				monthCardGiftPanel:refreshRewardState()
			end
			self:updateHuodongFlag()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
		else
			g_game.g_utilManager:showMsg("领取月卡礼包失败")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_GET_MONTH_CARD_REWARD, SC_GET_MONTH_CARD_REWARD)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] update
-- 奏章恢复
-------------------------------------------------
function f_user_info_manager:update(dt)
	if self.m_countdownTime >= 1 then
		self.m_countdownTime = self.m_countdownTime - 1
		if self.m_userReportsInfo ~= nil and self.m_userReportsInfo["reportsNum"] > 0 then
			-- 刷新奏章显示
			local jinluandianPanel = g_game.g_panelManager:getUiPanel("jinluandian_bg")
			if self.m_zouzhangAddTime <= 0 then
				self:changeReportsNum(-1)
				if jinluandianPanel ~= nil then
					jinluandianPanel:refreshZouzhangNum(self:getLeftReportsNum(), self.m_zouzhangAddTime)
				end
				self.m_zouzhangAddTime = g_game.g_f_lua_game_event.F_LUA_ZOUZHANG_RECOVER_TIME
--				print("时间恢复奏章：", g_game.g_userInfoManager:getLeftReportsNum())
			else
				if jinluandianPanel ~= nil then
					jinluandianPanel:refreshZouzhangNum(self:getLeftReportsNum(), self.m_zouzhangAddTime)
				end
			end
			
			self.m_zouzhangAddTime = self.m_zouzhangAddTime - 1
		end
		
		-- 请求跨天会变化的数据
		local currentTime = g_game.g_gameManager:getCurrentTime()
		if currentTime > 100000 then
			local date = os.date("*t", currentTime)
			if date["hour"]+date["min"]+date["sec"] == 0 then
				g_game.g_netManager:send_message(g_network_message_type.CS_USER_REPORTS, {["roleId"] = self.m_user_info["roleId"]})
				
				self:requestMonthCard()
			end
		end
	end
	self.m_countdownTime = self.m_countdownTime + dt
	
	-- 购买月卡cd时间
	if self.m_monthCardReward["cdTime"] ~= nil and self.m_monthCardReward["cdTime"] > 0 then
		self.m_monthCardReward["cdTime"] = self.m_monthCardReward["cdTime"] - dt
		if self.m_monthCardReward["cdTime"] <= 0 then
			self.m_monthCardReward["cdTime"] = 0
			self.m_monthCardReward["hasMonthCard"] = 0
			self:updateHuodongFlag()
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getCurrentPeroidChargeInfo
-------------------------------------------------
function f_user_info_manager:getCurrentPeroidChargeInfo()
	return self.m_currentPeroidChargeInfo
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPeriodChargeInfo
-------------------------------------------------
function f_user_info_manager:getPeriodChargeInfo()
	return self.m_peroidChargeInfo
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLeftReportsNum
-- 剩余可批阅奏折数
-------------------------------------------------
function f_user_info_manager:getLeftReportsNum()
	local reportsNum = 0
	local maxNum = g_game.g_dictConfigManager:getMaxReportsNum(self.m_userVipInfo["level"])
	if maxNum > 0 and self.m_userReportsInfo ~= nil then
		reportsNum = maxNum - self.m_userReportsInfo["reportsNum"]
	end
	return reportsNum
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setZouZhangFullNum
-- 奏章数目设置最大值
-------------------------------------------------
function f_user_info_manager:setZouZhangFullNum()
	self.m_userReportsInfo["reportsNum"] = 0
	self.m_zouzhangAddTime = g_game.g_f_lua_game_event.F_LUA_ZOUZHANG_RECOVER_TIME
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] changeReportsNum
-------------------------------------------------
function f_user_info_manager:changeReportsNum(num)
	self.m_userReportsInfo["reportsNum"] = self.m_userReportsInfo["reportsNum"] + num
	if self.m_userReportsInfo["reportsNum"] < 0 then
		self.m_userReportsInfo["reportsNum"] = 0
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setNeedRefreshPeroidCharge
-------------------------------------------------
function f_user_info_manager:setNeedRefreshPeroidCharge(isNeed)
	self.m_needRefreshPeroidCharge = isNeed
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getAddReportsNum
-- 今日可添加奏折次数
-------------------------------------------------
function f_user_info_manager:getAddReportsNum()
	local addReportsNum = 0
	local maxNum = g_game.g_dictConfigManager:getMaxAddReportsNum(self.m_userVipInfo["level"])
	if maxNum > 0 and self.m_userReportsInfo ~= nil then
		addReportsNum = maxNum - self.m_userReportsInfo["addReportsNum"]
	end
	return addReportsNum
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getServerStartRewardInfo
-- 返回开服有礼数据
-------------------------------------------------
function f_user_info_manager:getServerStartRewardInfo()
	return self.m_serverStartReward
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getZouZhangAddTime
-- 据恢复还有多少时间
-------------------------------------------------
function f_user_info_manager:getZouZhangAddTime()
	return self.m_zouzhangAddTime
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getReportsInfo
-------------------------------------------------
function f_user_info_manager:getReportsInfo()
	return self.m_userReportsInfo
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setServerStartRewardMask
-------------------------------------------------
function f_user_info_manager:setServerStartRewardMask(index, maskVal)
	self.m_serverStartReward["rewardMask"][index] = maskVal
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setPeroidRewardMask
-- 设置限时充值奖励领取奖励状态掩码
-------------------------------------------------
function f_user_info_manager:setPeroidRewardMask(num, index, maskVal)
	local listNum = self.m_peroidChargeInfo["peroidRewardList_Num"]
	if num <= listNum then
		if self.m_peroidChargeInfo["peroidRewardList"][num] ~= nil then
			self.m_peroidChargeInfo["peroidRewardList"][num]["acceptRewardMask"][index] = maskVal
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] removeBingfaPiece
-- 删除兵法碎片
-------------------------------------------------
function f_user_info_manager:removeBingfaPiece(id, num)
	local remove = {}
	for i = 1, #self.m_bingfaPiece do
		if self.m_bingfaPiece[i]["fragmentId"] == id then
			self.m_bingfaPiece[i]["count"] = self.m_bingfaPiece[i]["count"] - num
			if self.m_bingfaPiece[i]["count"] <= 0 then
				table.insert(remove, i)
			end
		end
	end
	for i =1, #remove do
		table.remove(self.m_bingfaPiece, remove[#remove - i + 1])
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] addEmptyCard
-- 添加一张新的卡牌或者美女，或者皇子，或者物品
-- 1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
-------------------------------------------------
function f_user_info_manager:addEmptyCard(type, cardID, uniID, num)
	local temp = {}
	temp["id"] = uniID
	if type == 1 then
		temp = self.m_userEquipBagData["propList"]
		for i = 1, #temp do
			if temp[i]["propId"] == cardID then
				local old = temp[i]["propNum"]
				temp[i]["propNum"] = num
				return num - old
			end
		end
		table.insert(temp, {["propId"] = cardID, ["propNum"] = num})
		self.m_userEquipBagData["propList_Num"] = self.m_userEquipBagData["propList_Num"] + 1
		return num
	elseif type == 2 then
		temp["beautyId"] = cardID
		temp["beautyLevel"] = 1
		temp["beautyTitle"] = 0
		temp["position"] = 0
		temp["beautyIntimacy"] = 0
		temp["beautyEducation"] = 0
		temp["beautySavor"] = 2
		temp["beautyExp"] = 0
		temp["conceive"] = 0
		temp["princeList_Num"] = 0
		temp["princeList"] = {}
		self.m_beautiArrList["unbattleList_Num"] = self.m_beautiArrList["unbattleList_Num"] + 1
		table.insert(self.m_beautiArrList["unbattleList"], temp)
		return 1
	elseif type == 3 then
		local data = g_game.g_dictConfigManager:getOfficerCardData(cardID)
		temp["officerId"] = cardID
		temp["officerLevel"] = 1
		temp["officerExp"] = 0
		temp["attack"] = math.round(data[7] / 100)
		temp["defense"] = math.round(data[6] / 100)
		temp["intellect"] = data[8]
		temp["soldierType"] = data[14]
		temp["advanced"] = 1
		temp["battle"] = 0
		table.insert(self.m_officer_position["unbattleList"], temp)
		return 1
	elseif type == 5 then
		local old = self.m_user_info["silver"]
		self.m_user_info["silver"] = num
		return num - old
	elseif type == 4 then
		local old = self.m_user_info["gold"]
		self.m_user_info["gold"] = num
		return num - old
	elseif type == 6 then
		temp["equip_id"] = cardID
		temp["primaryId"] = uniID
		temp["status"] = 0
		temp["battle"] = 0
		temp["position"] = 0
		temp["equip_level"] = 1
		temp["bookExp"] = 0
		table.insert(self.m_equipments["equipments"], temp)
		return 1
	elseif type == 7 then
		self.m_vip_yuanbao = num
	elseif type == 8 then -- 功绩值
		self.m_recoverData["contribution"] = num
		return cardID
	elseif type == 9 then -- 碎片
		local t = g_game.g_dictConfigManager:getPieceType(cardID)
		if t == 1 then -- 名臣碎片
			return self:updatePieceInTable(self.m_mingChenPiece, cardID, num)	
		elseif t == 2 then -- 美女碎片
			return self:updatePieceInTable(self.m_beautyPiece, cardID, num)
		elseif t == 3 then -- 装备碎片
			return self:updatePieceInTable(self.m_equipmentPiece, cardID, num)
		elseif t == 4 then -- 兵法碎片
			return self:updatePieceInTable(self.m_bingfaPiece, cardID, num)	
		end
	elseif type == 10 then -- 名臣碎片
		return self:updatePieceInTable(self.m_mingChenPiece, cardID, num)	
	elseif type == 11 then -- 美女碎片
		return self:updatePieceInTable(self.m_beautyPiece, cardID, num)
	elseif type == 12 then -- 装备碎片
		return self:updatePieceInTable(self.m_equipmentPiece, cardID, num)
	elseif type == 13 then -- 兵法碎片
		return self:updatePieceInTable(self.m_bingfaPiece, cardID, num)	
	end
	return -1
end

function f_user_info_manager:getBingfaPieceNumber(id)
	for i = 1, #self.m_bingfaPiece do
		if self.m_bingfaPiece[i]["fragmentId"] == id then
			return self.m_bingfaPiece[i]["count"]
		end
	end
	return 0
end

function f_user_info_manager:insertPieceToTable(type,id)
	local listT = nil
	if type == 10 then
		listT = self.m_mingChenPiece
	elseif type == 11 then
		listT = self.m_beautyPiece
	elseif type == 12 then
		listT = self.m_equipmentPiece
	elseif type == 13 then
		listT = self.m_bingfaPiece
	end

	local isRepeat = false
	for i = 1, #listT do
		if listT[i]["fragmentId"] == id then
			listT[i]["count"] = listT[i]["count"] + 1
			isRepeat = true
			break
		end
	end
	
	if isRepeat == false then
		table.insert(listT, {["fragmentId"] = id, ["count"] = 1})
	end
end

function f_user_info_manager:updatePieceInTable(t, id, num)
	for i = 1, #t do
		if t[i]["fragmentId"] == id then
			local old = t[i]["count"]
			t[i]["count"] = num
			return num - old
		end
	end
	table.insert(t, {["fragmentId"] = id, ["count"] = num})
	return num
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getEquipmentData
-- 位置装备信息
-------------------------------------------------
function f_user_info_manager:getEquipmentData()
	return self.m_equipments
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getEquipmentBelong
-- 装备所属的名臣
-------------------------------------------------
function f_user_info_manager:getEquipmentBelong(position, battle)
	local battleList = self.m_officer_position["battleList" .. battle]
	return battleList[position]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] isReceiveDailyReward
-- 是否获得了每日奖励
-------------------------------------------------
function f_user_info_manager:isReceiveDailyReward(day)
	for i = 1, #self.m_dailyRewardUnReceiveList do
		if self.m_dailyRewardUnReceiveList[i] == day then
			return false
		end
	end
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] hasDailyRewrd
-- 是否有每日奖励
-------------------------------------------------
function f_user_info_manager:hasDailyRewrd()
	return #self.m_dailyRewardUnReceiveList > 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] isReceiveLevelReward
-- 是否获得了等级奖励
-------------------------------------------------
function f_user_info_manager:isReceiveLevelReward(level)
	for i = 1, #self.m_levelRewardReceiveList do
		if self.m_levelRewardReceiveList[i] == level then
			return true
		end
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] hasLevelRewrd
-- 是否有等级奖励
-------------------------------------------------
function f_user_info_manager:hasLevelRewrd()
	local t = g_game.g_dictConfigManager:getLevelRewardTable()
	local lv = g_game.g_userInfoManager:getLevel()
	local count = 0
	for i = 1, #t do
		if t[i][2] > lv then
			break
		end
		count = count + 1
	end
	return #self.m_levelRewardReceiveList ~= count
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] resetCurrentUserData
-- 清除当前用户数据
-------------------------------------------------
function f_user_info_manager:resetCurrentUserData()
	--服务器动态配置
	
	self.m_server_dyn_config	= nil

	--用户保存
	self.m_user_account			= nil
	self.m_user_info			= nil
	self.m_officer_position 	= nil
	self.m_limit_info			= nil
	self.m_baoyin				= 0
	self.m_hasClickFBox 		= false
	self.m_shouldOpenQiandao 	= false
	self.m_qiandaoDay			= 1
	
	self.m_zouzhangResult 		= nil
	
	self.m_shouldOpenHuodong = false
	
	self.m_canRequestInBoss = false
	
	self.m_huodongInTime = {}
	
	self.m_building_list		= nil
	self.m_gonggaoList			= nil
	self.m_mailList 			= nil
	self.m_mailPage 			= 1
	self.m_mailCount			= 0
	self.m_mailServerTime 		= 0
	self.m_shouldGotoBingfaItem = 0
	
	--world boss
	self.m_lastKillBossInfo		= nil
	self.m_curWorldBossInfo		= nil
	self.m_rankList 			= nil
	self.m_bossUserData 		= nil
	self.m_courageResult		= nil
	self.m_rebornResult			= nil
	self.m_isNeedPopRank	 	= false
	self.m_refreshFightRequest	= -1 
	
	self.m_leftCount 			= nil
	self.m_dailyRewardDay		= 1
	
	self.m_pveBattleData		= {}
	self.m_equipments 			= nil
	
	self.m_equipmentPiece		= nil
	self.m_mingChenPiece		= {}
	self.m_beautyPiece			= {}
	self.m_bingfaPiece			= {}
	
	self.m_buyItemResult = nil
	self.m_lueduoList = {}
	
	self.m_huodongList = {}
	self.m_huodongData = {}
	
	--服务器返回的美女数据  用上阵 和未上阵区分
	self.m_beautiArrList = nil
	--删除美女列表
	self.m_removeBeautyList = {}
	--删除皇子列表
	self.m_removePrinceList = {}
	--删除名臣列表
	self.m_removeMinChenList = {}
	--用户所有美女数据
	self.m_allBeautyArr = {}
	--用户排除未助阵，和正在孕育皇子的美女数据
	self.m_eatenBeautyArr = {}
	
	--登陆奖励没有领奖的列表
	self.m_dailyRewardUnReceiveList = {}
	
	--等级奖励领取的列表
	self.m_levelRewardReceiveList = {}
	
	self.m_isPopupEaten = true
	self.m_isPopupSell = true
	
	self.m_palaceBattleResult = nil
	
	self.m_beautyFavorResult = nil
	
	--美女不同title的 group
	self.m_beautyTitleGroup = {}
	
	--不大于某一个title的美女 group,该组里的美女都可以被提拔
	self.m_beautyGroupCanPromote = {}

	--皇子数据
	self.m_princeData	= nil
	--皇子教育返回结果
	self.m_princeEducationResult = nil
	--皇子宗人府是否提示三星级
	self.m_isPopZongrenfuSanxing = true
	--名臣卡牌升级是否提示三星级
	self.m_isPopMingchenShengjiSanxing = true
	self.m_isPopMingchenSell = true
	
	--接受返回的 怀孕时间
	self.m_pregnantResult = nil
	--接受返回的 出生皇子结果
	self.m_bornPrinceResult = nil
	
	self.m_disConnectReason = nil
	
	self.m_changeNameResult = nil
	
	--pvp玩家排名
	self.m_userPvpRank = nil
	self.m_pvpPlayerZhenrong = nil
	self.m_updateContribute = nil
	self.m_pvpErrorMessage = nil
	
	--商城
	--当前选秀信息
	self.m_xuanxiu_info = nil
	--当前科举信息
	self.m_keju_info	= nil
	--科举名臣列表
	self.m_keju_mingchen_list = nil
	self.m_xuanxiu_xiunv_list = nil
	--vip元宝
	self.m_vip_yuanbao = 0
	
	--关卡进度信息
	self.m_userPveLevelProgress = nil
	self.m_userPveSmallStageProgress = nil
	
	--user背包数据
	self.m_userEquipBagData = nil
	self.m_useItemResult = nil
	
	--user缘分
	self.m_userCombinationData = nil
	
	--恢复数据
	self.m_recoverTimeArr = nil
	self.m_recoverData = nil
	
	self.m_claimDailyRewardIndex = 0
	
	self.m_removeMingchenResult = nil
	self.m_removePrinceResult = nil
	self.m_cardMergResult = nil
	self.m_zongrenfuResult = nil
	
	self.m_buyPveNumResult = nil
	self.m_buyPveNumCondition = nil
	
	self.m_vipPack = nil
	self.m_vipPackUseResult = nil
	
	self.m_userVipInfo = nil
	--当天定点活动是否已领取标志  登录主动推送
	self.m_todayRewardFlag = nil
	--定点活动 领取结果
	self.m_strengthReward = nil
	--征税结果
	self.m_askTaxResult = nil
	
	--首充标记
	self.m_isFirstCharge = nil
	self.m_firstChargeReward = nil
	
	--奏章信息
	self.m_userReportsInfo = nil
	self.m_zouzhangAddTime = g_game.g_f_lua_game_event.F_LUA_ZOUZHANG_RECOVER_TIME
	
	--限时充值奖励消息
	self.m_currentPeroidChargeInfo = {}
	self.m_peroidChargeInfo = {}
	
	-- 限时充值奖励面板,是否需要充值后的刷新
	self.m_needRefreshPeroidCharge = false
	
	--倒计时
	self.m_countdownTime = 1
	
	--开服有礼
	self.m_serverStartReward = nil
	
	--走马灯消息 {["content"] ["times"]}
	self.m_userMovingMsg = {}
	
	--兑换码
	self.m_exchangeCodeReward = nil
	
	--接收功绩值兑换结果
	self.battleArr2Card = nil
	--第二阵容的第一张卡
	self.exchangeResult = nil
	
	self.m_saodang_result = nil
	
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] saveUserAccount
-- 保存当前用户帐户
-------------------------------------------------
function f_user_info_manager:saveUserAccount(account)
	self.m_user_account = account
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserAccount
-- 保存当前用户帐户
-------------------------------------------------
function f_user_info_manager:getUserAccount()
	return self.m_user_account
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserEnergy
-- 获取玩家当前精力值
-------------------------------------------------
function f_user_info_manager:getUserEnergy()
	if self.m_user_info then
		return self.m_user_info["energy"]
	else
		return -1
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveRecoverData
-- 获取恢复数据
-------------------------------------------------
function f_user_info_manager:receiveRecoverData(msg)
	self.m_recoverData = msg
	if self.m_recoverData["result"] == 1 then
		self.m_user_info["strength"] = msg["strength"]
		self.m_user_info["energy"] = msg["energy"]
		self.m_user_info["military"] = msg["military"]
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA )
		--g_game.g_panelManager:showEffect(13)
	else
		print "recover failed"
	end

end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] getRecoverData
-- 获取恢复后的数据
-------------------------------------------------
function f_user_info_manager:getRecoverData()
	return self.m_recoverData
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveRecoverTime
-- 获取恢复时间
-------------------------------------------------
function f_user_info_manager:receiveRecoverTime(msg)
	local t = {}
	if msg["result"] == 1 then
		self.m_recoverTimeArr = msg
		if self.m_recoverTimeArr["contributionRemainTime"] == 0 then
			self.m_recoverTimeArr["contributionRemainTime"] = 600
		end
		table.insert(t, msg["energyRemainTime"])
		table.insert(t, msg["strengthRemainTime"])
		table.insert(t, msg["militaryRemainTime"])
		table.insert(t, msg["contributionRemainTime"])

		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END )
		
	else
		table.insert(t, 0)
		table.insert(t, 0)
		table.insert(t, 0)
		table.insert(t, 0)
	end
	g_game.g_recoverManager:setTargetTime(t)
--	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] updateUserGold
-- 从商城充值手动调用， 更新用户最新元宝数
-------------------------------------------------
function f_user_info_manager:updateUserGold(gold)
	local num = gold - self.m_user_info["gold"]
	if num < 0 then
		--sdk事件定义
		local eventData = {}
		eventData["reason"] =  "元宝消耗"
		eventData["lost"] = self.m_user_info["gold"] - gold
		eventData["left"] = gold
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_LOST_COINS, eventData)
	
	else
		
		--sdk事件定义
		local eventData = {}
		eventData["reason"] =  "商城充值|领取奖励"
		eventData["gain"] = gold - self.m_user_info["gold"]
		eventData["left"] = gold
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_GET_COINS, eventData)
		
		
	end
	
	
	self.m_user_info["gold"] = gold
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)

end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] updateUserSilver
-- 从商城充值手动调用， 更新用户最新银两数
-------------------------------------------------
function f_user_info_manager:updateUserSilver(silver)
	self.m_user_info["silver"] = silver
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] updateUserCombination
-- 更新 user的 缘分
-------------------------------------------------
function f_user_info_manager:updateUserCombination(msg)
	self.m_userCombinationData = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_COMBINATION)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserCombination
-- 获得 user的 缘分
-------------------------------------------------
function f_user_info_manager:getUserCombination()
	return self.m_userCombinationData
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveUseItem
-- 接受 使用道具返回
-------------------------------------------------
function f_user_info_manager:receiveUseItem(msg)
	self.m_useItemResult = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if self.m_useItemResult["result"] == 2 then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")	
		quickCharge:setTipString("VIP使用次数已达上限，是否前往充值？")
--		g_game.g_utilManager:showMsg("该道具已达当前VIP使用次数上限")
	elseif self.m_useItemResult["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM)
		g_game.g_panelManager:showEffect(8)
		
	elseif self.m_useItemResult["result"] == 0 then
		g_game.g_utilManager:showMsg("道具使用失败")
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveChongzhiResult
-- 接收充值结果
-------------------------------------------------
function f_user_info_manager:receiveChongzhiResult(msg)
	if msg["result"] == 1 then
		print("充值成功！")
	else
		print("充值失败！")
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUseItemResult
-- 获得 使用道具返回
-------------------------------------------------
function f_user_info_manager:getUseItemResult()
	return self.m_useItemResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveBuyItem
-- 接受 购买道具返回
-------------------------------------------------
function f_user_info_manager:receiveBuyItem(msg)
	self.m_buyItemResult = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM)
		g_game.g_panelManager:showEffect(12)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_QUICK_USE_ITEM_CALLBACK)
	else
		print "buy item failed"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBuyItemResult
-------------------------------------------------
function f_user_info_manager:getBuyItemResult()
	return self.m_buyItemResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveUserEuipBagData
-- 接受 user 背包数据
-------------------------------------------------
function f_user_info_manager:receiveUserEuipBagData(msg)
	self.m_userEquipBagData = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_EQUIP_BAG)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveUserPieces
-- 接受 user 碎片数据
-------------------------------------------------
function f_user_info_manager:receiveUserPieces(msg)
	local t = msg["fragmentList"]
	self.m_equipmentPiece		= {}
	self.m_mingChenPiece		= {}
	self.m_beautyPiece			= {}
	for i = 1, #t do
		local type = g_game.g_dictConfigManager:getPieceType(t[i]["fragmentId"])
		if type == 1 then
			table.insert(self.m_mingChenPiece, t[i])
		elseif type == 2 then
			table.insert(self.m_beautyPiece, t[i])
		elseif type == 3 then
			table.insert(self.m_equipmentPiece, t[i])
		end
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveBingfaPieces
-- 接受 user 碎片数据
-------------------------------------------------
function f_user_info_manager:receiveBingfaPieces(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	
	self.m_bingfaPiece = msg["pieceList"]
	
	local bingfaTable, bingfaUnused = g_game.g_userInfoManager:getBingfaList()
	local canyeTable, canyeUnused = g_game.g_userInfoManager:getCanYeList()
	if #bingfaTable == 0 and #canyeTable == 0 then
		require("scripts.game.main.common.f_jump_tip_popup")
		local panel = f_jump_tip_popup.static_create()
		panel:setPanelByType(13)
		local leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			require("scripts.game.main.bingfa.f_xunfang_panel")
			local panel = f_xunfang_panel.static_create()
			panel:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
		end
		local rightBtnCallback = function()
			g_game.g_panelManager:removeAllUiPanel()
--			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			local beautyPalace = f_game_beauty_main.static_create()
			beautyPalace:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
		end
		panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		
		return
	end
	
	require("scripts.game.main.bingfa.f_bingfa_panel")
	local mail = f_bingfa_panel.static_create()
	mail:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(mail, "bing_fa")
	mail:setPageAndBottom(2, nil)
	if self.m_shouldGotoBingfaItem > 0 then
		mail:setLueduoBingfa(self.m_shouldGotoBingfaItem)
	end
	self.m_shouldGotoBingfaItem = 0
	
	local type = g_game.g_utilManager:getGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE)
	if type == g_game.F_BACK_TOUI_LUEDUO then
		self:showLueduo(false, nil)
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserEquipData
-- 返回 背包数据
-------------------------------------------------
function f_user_info_manager:getUserEquipData()
	return self.m_userEquipBagData
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPropNum
-- 获取背包数据数量
-------------------------------------------------
function f_user_info_manager:getPropNum(id)
	local t = self.m_userEquipBagData["propList"]
	for i = 1, #t do
		if t[i]["propId"] == id then
			return t[i]["propNum"]
		end
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setPropNum
-- 设置背包数据
-------------------------------------------------
function f_user_info_manager:setPropNum(id, num)
	local t = self.m_userEquipBagData["propList"]
	for i = 1, #t do
		if t[i]["propId"] == id then
			if num == 0 then
				table.remove(t, i)
			else
				t[i]["propNum"] = num
			end
			return
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] reduceEquipDataByPropId
-- 根据propId减少
-- 返回值true，成功减掉道具个数
-------------------------------------------------
function f_user_info_manager:reduceEquipDataByPropId(propId, value)
	if self.m_userEquipBagData ~= nil then
		if self.m_userEquipBagData["propList_Num"] ~= nil then
			local propList_Num = self.m_userEquipBagData["propList_Num"]
			local itemInfo = nil
			for i=1,propList_Num do
				itemInfo = self.m_userEquipBagData["propList"][i]
				if itemInfo["propId"] == propId then
					if itemInfo["propNum"] > value then
						self.m_userEquipBagData["propList"][i]["propNum"] = itemInfo["propNum"] - value
					else
						table.remove(self.m_userEquipBagData["propList"], i)
						self.m_userEquipBagData["propList_Num"] = self.m_userEquipBagData["propList_Num"] - 1
					end
					return true
				end
			end
		end
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserEquipDataByType
-- 根据类型返回道具数据
-------------------------------------------------
function f_user_info_manager:getUserEquipDataByType(type)
	local equipData = {}
	if self.m_userEquipBagData ~= nil then
		if self.m_userEquipBagData["propList_Num"] ~= nil then
			local propList_Num = self.m_userEquipBagData["propList_Num"]
			local equipType = nil
			local itemInfo = nil
			for i=1,propList_Num do
				itemInfo = self.m_userEquipBagData["propList"][i]
				equipType = g_game.g_dictConfigManager:getPropsType(itemInfo["propId"])
				if type == equipType then
					table.insert(equipData, itemInfo)
				end
			end
		end
	end
	
	return equipData
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserEquipData
-- 返回 背包数据
-------------------------------------------------
function f_user_info_manager:getItemCount(item)
	local t = self.m_userEquipBagData["propList"]
	for i = 1, #t do
		if t[i]["propId"] == item then
			return t[i]["propNum"]
		end
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] showLueduo
-- 准备打开掠夺界面
-------------------------------------------------
function f_user_info_manager:showLueduo(isForceRequest, piece)
	if piece == nil then
		piece = self.m_lastLueduoPiece
	end
	self.m_lastLueduoPiece = piece
	if not isForceRequest and self.m_lueduoList ~= nil then
		self:openLueduoPanel()
	else
		local dataT = {}
		dataT["roleId"] = self.m_user_info["roleId"]
		dataT["chipId"] = piece
		g_game.g_netManager:send_message(g_network_message_type.CS_PREY_LIST, dataT)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] openLueduoPanel
-- 打开掠夺界面
-------------------------------------------------
function f_user_info_manager:openLueduoPanel()
	if g_game.g_panelManager:isUiPanelShow("lueduo_panel") then
		local panel = g_game.g_panelManager:getUiPanel("lueduo_panel")
		panel:setData(self.m_lueduoList)
		panel:btnCd()
	else
		require("scripts.game.main.bingfa.f_lueduo_panel")
		local panel = f_lueduo_panel.static_create()
		panel:panelInitBeforePopup()
		panel:setData(self.m_lueduoList)
		g_game.g_panelManager:showUiPanel(panel, "lueduo_panel")
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getAdvSameCardCount
-------------------------------------------------
function f_user_info_manager:getAdvSameCardCount(id, primaryId)
	local t = self:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	local count = 0
	for i = 1, #t do
		if t[i]["officerId"] == id and t[i]["id"] ~= primaryId then
			count = count + 1
		end
	end
	return count
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getOfficerByPrimayID
-------------------------------------------------
function f_user_info_manager:getOfficerByPrimayID(id)
	local t = self:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR)
	for i = 1, #t do
		if t[i]["id"] == id then
			return t[i]
		end
	end
	return nil
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getAdvSameCardCount
-- 返回 背包数据
-------------------------------------------------
function f_user_info_manager:removeUnbattleOfficerByPrimayID(id)
	local t = self:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	for i = 1, #t do
		if t[i]["id"] == id then
			table.remove(t, i)
			return
		end
	end
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] receivePveSmallStageNums
-- 接受 pve返回的 小关卡  攻打次数
-------------------------------------------------
function f_user_info_manager:receivePveSmallStageNums(msg)
	self.m_userPveSmallStageProgress = msg
	
	local isBackPveUi,isBackPvpUi = g_game.g_dataManager:getBattleState()
	
	if  not g_game.g_utilManager:allGuidelinesIsFinish() then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_NUM)
	else
		if isBackPveUi == 1 or isBackPveUi == 3 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVE_LEVEL)
		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_NUM)
		end
	end
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPveSmallStageNums
-- 接收 pve返回的 小关卡  攻打次数
-------------------------------------------------
function f_user_info_manager:getPveSmallStageNums()
	return self.m_userPveSmallStageProgress
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receivePveLevelData
-- 接受pve 关卡进度
-------------------------------------------------
function f_user_info_manager:receivePveLevelData(msg)	
	self.m_userPveLevelProgress = msg	
	
	local isBackPveUi,isBackPvpUi = g_game.g_dataManager:getBattleState()
	local areaId,stageId,levelId = g_game.g_dataManager:getPveProgress()
	
	
	if not g_game.g_utilManager:allGuidelinesIsFinish() then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING  )
	else
		if isBackPveUi == 1 or isBackPveUi == 3 then
			self:requestPveLevelsNum(areaId,stageId)
		elseif isBackPveUi == 2 then
			self:requestUserPvpPlayerList()
		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SUIPIAN_TO_ELITE)
		end
	end
	
end


-------------------------------------------------

-- @function [parent=#f_user_info_manager] getUserPveProgress
-- 获取 pvp 关卡进度
-------------------------------------------------
function f_user_info_manager:getUserPveProgress()
	return self.m_userPveLevelProgress
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] updateUserContribute
-- 更新 传来的 功绩值
-------------------------------------------------
function f_user_info_manager:updateUserContribute(msg)
	self.m_updateContribute = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CONTRIBUTE)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUpdateContribute
-- 获得 每10分钟的 功绩值
-------------------------------------------------
function f_user_info_manager:getUpdateContribute()
	return self.m_updateContribute
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getCanYeList
-- 获得 有残叶的兵法列表
-------------------------------------------------
function f_user_info_manager:getCanYeList()
	local t = {}
	local eq = {}
	local pieces = {}
	for i = 1, #self.m_bingfaPiece do
		if self.m_bingfaPiece[i]["count"] > 0 then
			local id = g_game.g_dictConfigManager:getPieceCardID(self.m_bingfaPiece[i]["fragmentId"])
			local temp = eq[id]
			if temp == nil then
				temp = {}
				eq[id] = temp
				temp["id"] = id
				temp["piece"] = {}
			end
			table.insert(temp["piece"], self.m_bingfaPiece[i]["fragmentId"])
			pieces[self.m_bingfaPiece[i]["fragmentId"]] = 1
		end
	end
	local p = g_game.g_dictConfigManager:getPieceList()
	for k, v in pairs(p) do
		if v[3] >= 4 and v[3] <= 6 then
			if eq[v[4]] ~= nil and pieces[v[1]] == nil then
				pieces[v[1]] = 0 
				table.insert(eq[v[4]]["piece"], v[1]);
			end
		end
	end
	
	local compFunc = function(v1, v2)
		return v1 < v2
	end
	
	for k, v in pairs(eq) do
		table.insert(t, v)
		table.sort(v["piece"], compFunc)
	end
	return t, pieces
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receivePvpErrorMessage
-- 接受 pvp 错误消息
-------------------------------------------------
function f_user_info_manager:receivePvpErrorMessage(msg)
	self.m_pvpErrorMessage = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_ERROR_MSG)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPvpErrorMessage
-- 获得 pvp的 错误信息
-------------------------------------------------
function f_user_info_manager:getPvpErrorMessage()
	return self.m_pvpErrorMessage
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receivePvpUserRank
-- 接受pvp data
-------------------------------------------------
function f_user_info_manager:receivePvpUserRank(msg)
	self.m_userPvpRank = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	
	if self.m_userPvpRank["result"] == 1 then
		for i = 1, self.m_userPvpRank["challengeList_Num"] do
			self.m_userPvpRank["challengeList"][i]["canbeChallenge"] = true
		end
		
		for i = 1, self.m_userPvpRank["topTen_Num"] do
			self.m_userPvpRank["topTen"][i]["canbeChallenge"] = false
		end
		 
		local isBackPveUi,isBackPvpUi = g_game.g_dataManager:getBattleState()
		if isBackPvpUi == 1 or isBackPveUi == 2 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVP_UI)
		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_LIST_DATA)
		end
	else
		print "receive pvp rank data failed"
	end
	
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveKejumingchenList
-- 接受科举名臣 data
-------------------------------------------------
function f_user_info_manager:receiveKejumingchenList(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
	self.m_keju_mingchen_list = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_MINGCHEN_LIST)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveXuanxiuxiunvList
-- 接受选秀秀女 data
-------------------------------------------------
function f_user_info_manager:receiveXuanxiuxiunvList(msg)
	self.m_xuanxiu_xiunv_list = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_XIUNV_LIST)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveSendKejuMingchenResult
--获取到科举名臣选择发送回馈
-------------------------------------------------
function f_user_info_manager:receiveSendKejuMingchenResult(msg)
	if msg["result"] == 1 then
		--使用收到的数据更新名臣列表（将获取到的名臣信息添加到名臣未上阵列表中）
		local singleOfficer = {}
		singleOfficer["id"] = msg["id"]
		singleOfficer["officerId"] = msg["officerId"]
		singleOfficer["officerLevel"] = msg["officerLevel"]
		singleOfficer["officerExp"] = msg["officerExp"]
		singleOfficer["attack"] = msg["attack"]
		singleOfficer["defense"] = msg["defense"]
		singleOfficer["intellect"] = msg["intellect"]
		singleOfficer["soldierType"] = msg["soldierType"]
		singleOfficer["advanced"] = 1
		singleOfficer["battle"] = 0
		
		self:insertOfficerCardToUnbattleList(singleOfficer)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RECEIVE_KEJU_SELECT_BACK_CALL)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHOUZHONGMINGCHEN)
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveSendXuanxiuXiunvResult
--获取到选秀秀女选择发送回馈
-------------------------------------------------
function f_user_info_manager:receiveSendXuanxiuXiunvResult(msg)
	if msg["result"] == 1 then
		--使用收到的数据更新美女列表（将获取到的名臣信息添加到名臣未上阵列表中）
		self.m_beautiArrList["unbattleList_Num"] = self.m_beautiArrList["unbattleList_Num"]  +1
		
		local singleBeauty = {}
		singleBeauty["id"] = msg["id"]
		singleBeauty["beautyId"] = msg["beautyId"]
		singleBeauty["beautyLevel"] =msg["beautyLevel"]
		singleBeauty["beautyTitle"] =msg["beautyTitle"]
		singleBeauty["position"] =msg["position"]
		singleBeauty["beautyIntimacy"] =msg["beautyIntimacy"]
		singleBeauty["beautyEducation"] =msg["beautyEducation"]
		singleBeauty["beautySavor"] =msg["beautySavor"]
		singleBeauty["beautyExp"] =msg["beautyExp"]
		singleBeauty["conceive"] =msg["conceive"]
		singleBeauty["princeList_Num"] =msg["princeList_Num"]
		singleBeauty["princeList"] = msg["princeList"]
		
		table.insert(self.m_beautiArrList["unbattleList"], singleBeauty)
		--发送事件回调（更新CD值和剩余次数）
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RECEIVE_XUANXIU_SELECT_BACK_CALL)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JIXIANG)
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getKejumingchenList
-- 获取科举名臣list
-------------------------------------------------
function f_user_info_manager:getKejumingchenList()
	return self.m_keju_mingchen_list
end

-- @function [parent=#f_user_info_manager] receivePvpPlayerZhenrong
-- 接受pvp 玩家的阵容数据
-------------------------------------------------
function f_user_info_manager:receivePvpPlayerZhenrong(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	self.m_pvpPlayerZhenrong = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PLAYER_ZHENRONG)
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getPvpPlayerZhenrong
-- player 阵容 data
-------------------------------------------------
function f_user_info_manager:getPvpPlayerZhenrong()
	return self.m_pvpPlayerZhenrong
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getUserPvpRank
-- user pvp data
-------------------------------------------------
function f_user_info_manager:getUserPvpRank()
	return	self.m_userPvpRank
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getXuanxiuxiunvList
-- 获取选秀秀女list
-------------------------------------------------
function f_user_info_manager:getXuanxiuxiunvList()
	return self.m_xuanxiu_xiunv_list
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveXuanxiuCDTimeAndTimes
-- 获取当前选秀的次数和CD时间
-------------------------------------------------
function f_user_info_manager:receiveXuanxiuCDTimeAndTimes(msg)

	if msg["result"] == 1 then
		self.m_xuanxiu_info = msg["beautyList"]
		
		for i = 1, #self.m_xuanxiu_info do
			if 	self.m_xuanxiu_info[i]["type"] == 1 then
				g_game.g_recoverManager:setShopTime(4,self.m_xuanxiu_info[i]["time"])
			elseif self.m_xuanxiu_info[i]["type"] == 2 then
				g_game.g_recoverManager:setShopTime(5,self.m_xuanxiu_info[i]["time"])
			elseif self.m_xuanxiu_info[i]["type"] == 3 then
				g_game.g_recoverManager:setShopTime(6,self.m_xuanxiu_info[i]["time"])
			end
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE)
	else
		g_game.g_recoverManager:setShopTime(4,0)
		g_game.g_recoverManager:setShopTime(5,0)
		g_game.g_recoverManager:setShopTime(6,0)
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] isShowXuanxiuFlag
-------------------------------------------------
function f_user_info_manager:isShowXuanxiuFlag()
	if self.m_xuanxiu_info == nil then
		return false
	end
	
	for i = 1, #self.m_xuanxiu_info do
		if self.m_xuanxiu_info[i]["count"] ~= 0 and g_game.g_recoverManager:getShopTime(i+3) == 0 then
			return true
		end
	end
	
	return false
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveKejuCDTimeAndTimes
-- 获取当前科举的次数和CD时间
-------------------------------------------------
function f_user_info_manager:receiveKejuCDTimeAndTimes(msg)
	if msg["result"] == 1 then
		self.m_keju_info = msg["officerList"]
		
		for i = 1, #self.m_keju_info do
			if 	self.m_keju_info[i]["type"] == 1 then
				g_game.g_recoverManager:setShopTime(1,self.m_keju_info[i]["time"])
			elseif self.m_keju_info[i]["type"] == 2 then
				g_game.g_recoverManager:setShopTime(2,self.m_keju_info[i]["time"])
			elseif self.m_keju_info[i]["type"] == 3 then
				g_game.g_recoverManager:setShopTime(3,self.m_keju_info[i]["time"])
			end
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE)
	else
		g_game.g_recoverManager:setShopTime(1,0)
		g_game.g_recoverManager:setShopTime(2,0)
		g_game.g_recoverManager:setShopTime(3,0)
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] isShowKejuFlag
-------------------------------------------------
function f_user_info_manager:isShowKejuFlag()
	if self.m_keju_info == nil then
		return false
	end
	
	for i = 1, #self.m_keju_info do
		if self.m_keju_info[i]["count"] ~= 0 and g_game.g_recoverManager:getShopTime(i) == 0 then
			return true
		end
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveUserChongzhiYuanbao
-- 获取玩家充值元宝数量
-------------------------------------------------
function f_user_info_manager:receiveUserChongzhiYuanbao(msg)
	-- 先保留未修改前的vip等级，用于判断是否显示vip特权界面
	local isVipInfoNil = true
	local lastVipLevel = 0
	if self.m_userVipInfo ~= nil then
		isVipInfoNil = false
		lastVipLevel = self.m_userVipInfo["level"]
	end
	
	local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	self.m_vip_pac_mask = bitCal:d2b(msg["pkgMask"])
	
	self.m_vip_yuanbao = msg["gold"]
	self.m_user_info["vipLevel"] = msg["level"]
	
	self.m_userVipInfo = msg
	--关闭网络缓冲
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	--发送获取元宝数量成功信息
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_VIP_CHONGZHI_YUANBAO_CHENGGONG)
	
	-- 如果vip等级升高，弹出vip特权界面
	if isVipInfoNil == false and msg["level"] > lastVipLevel then
		require("scripts.game.main.shangcheng.f_vip_panel")
		local vipPanel = g_game.g_panelManager:getUiPanel("vip")
		if vipPanel == nil then
			vipPanel = f_vip_panel.static_create()
			vipPanel:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(vipPanel,"vip")
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserVipInfo
-------------------------------------------------
function f_user_info_manager:getUserVipInfo()
	return self.m_userVipInfo
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getVipPackMask
-------------------------------------------------
function f_user_info_manager:getVipPackMask()
	return self.m_vip_pac_mask
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setVipPackMask
-------------------------------------------------
function f_user_info_manager:setVipPackMask(index, val)
	self.m_vip_pac_mask[index] = val
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserChongzhiYuanbao
-- 获取玩家充值元宝数量
-------------------------------------------------
function f_user_info_manager:getUserChongzhiYuanbao()
	return self.m_vip_yuanbao 
end

function f_user_info_manager:setUserChongzhiYuanbao(gold)
    self.m_vip_yuanbao = gold
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getXuanxiuCDTimeAndTimes
-- 获取当前选秀的次数和CD时间
-------------------------------------------------
function f_user_info_manager:getXuanxiuCDTimeAndTimes()
	return self.m_xuanxiu_info
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getKejuCDTimeAndTimes
-- 获取当前科举的次数和CD时间
-------------------------------------------------
function f_user_info_manager:getKejuCDTimeAndTimes()
	return self.m_keju_info
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] huangZiNum
-------------------------------------------------
function f_user_info_manager:huangZiNum()
	local num = 0
	if self.m_princeData ~= nil then
		num = self.m_princeData["battleList_Num"] + self.m_princeData["unbattleList_Num"]
	end
	return num
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] battleHuangZiNum
-------------------------------------------------
function f_user_info_manager:battleHuangZiNum()
	local num = 0
	if self.m_princeData ~= nil then
		num = self.m_princeData["battleList"]
	end
	return num
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] unbattleHuangZiNum
-------------------------------------------------
function f_user_info_manager:unbattleHuangZiNum()
	local num = 0
	if self.m_princeData ~= nil then
		num = self.m_princeData["unbattleList"]
	end
	return num
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] hasHuangZiLv5
-- 是否有5级以上皇子
-------------------------------------------------
function f_user_info_manager:hasHuangZiLv5()
	local t = self.m_princeData["battleList"]
	for i = 1, #t do
		if t[i]["princeLevel"] >= 5 then
			return true
		end
	end
	local t = self.m_princeData["unbattleList"]
	for i = 1, #t do
		if t[i]["princeLevel"] >= 5 then
			return true
		end
	end
	return false
end


-------------------------------------------------

-- @function [parent=#f_user_info_manager] setDisconnectReason
-- 设置断开链接结果
-------------------------------------------------
function f_user_info_manager:setDisconnectReason(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
	
	local func1 = function()
		g_game.startup()
	end
	
	local func2 = function()
		g_game.startup()
	end
	self.m_disConnectReason = msg
	
	local type = self.m_disConnectReason["reason"]
	
	if type == 2 then
		g_game.g_utilManager:showPublicMessagePanel(type,func1)
	else
		g_game.g_utilManager:showPublicMessagePanel(1,func2)
	end
	
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getDisconnectReason
-- 返回
-------------------------------------------------
function f_user_info_manager:getDisconnectReason()
	return	self.m_disConnectReason 
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] setChongxingResult
-- 设置宠幸结果
-------------------------------------------------
function f_user_info_manager:setChongxingResult(msg)
	self.m_beautyFavorResult = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getChongxingResult
-- 获取宠幸结果
-------------------------------------------------
function f_user_info_manager:getChongxingResult()
	return self.m_beautyFavorResult
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] updateChongxingResult
-- 更新宠幸的结果
-------------------------------------------------
function f_user_info_manager:updateChongxingResult()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BEAUTY_FAVOR)
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] setPregnantTimeResult
-- 设置怀孕的时间结果
-------------------------------------------------
function f_user_info_manager:setPregnantTimeResult(msg)
	if msg["result"] == 1 then
		self.m_pregnantResult= msg
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PREGNANT_TIME)
	else
		print "pregnant time error"
	end
	
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] setBornPrinceResult
-- 设置获取出生的皇子结果
-------------------------------------------------
function f_user_info_manager:setBornPrinceResult(msg)
	if msg["result"] == 1 then
		self.m_bornPrinceResult = msg
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BORN_PRINCE)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BABY_CRY)
	else
		print "get born prince error"
	end
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getBornPrinceResult
-- 获取出生的皇子的结果
-------------------------------------------------
function f_user_info_manager:getBornPrinceResult()
	return self.m_bornPrinceResult 
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPregnantTimeResult
--返回怀孕时间结果
-------------------------------------------------
function f_user_info_manager:getPregnantTimeResult()
	return self.m_pregnantResult
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] setPalaceBattleResult
-- 设置宫斗结果
-------------------------------------------------
function f_user_info_manager:setPalaceBattleResult(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
	self.m_palaceBattleResult = msg
	
	if self.m_palaceBattleResult["result"] == 1 then
		g_game.g_panelManager:getUiPanel("gongdou_bg"):updateGongDouResult()
	else
		print "gongdou failed"
	end
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getPalaceBattleResult
--获得 宫斗结果
-------------------------------------------------
function f_user_info_manager:getPalaceBattleResult()
	return self.m_palaceBattleResult
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] setQifeiResult
--弃妃结果
-------------------------------------------------
function f_user_info_manager:setQifeiResult(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then
		g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg"):updateQifeiResult()
	else
		print "qifei failed"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setCefengResult
--册封结果
-------------------------------------------------
function f_user_info_manager:setCefengResult(msg)
	if msg["result"] == 1 then	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENGCHENGGONG)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY)
		g_game.g_utilManager:showMsg("册封成功")
	else
		print "cefeng failed"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setPrinceEducationResult
--设置皇子教育结果
-------------------------------------------------
function f_user_info_manager:setPrinceEducationResult(msg)
	 self.m_princeEducationResult = msg
	 if self.m_princeEducationResult["result"] == 1 then
	 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_EDUCATION)
	 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU)
	 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
	 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JIAOYUHUANGZI)
	 	if msg["level"] >= 5 then
	 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU)
	 	else
	 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU_TN)
	 	end
	 	if msg["levelUp"] == 1 then
	 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI)
	 	end
	 else
	 	CCLOG("price education error")
	 end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPrinceEducationResult
--获得皇子教育结果
-------------------------------------------------
function f_user_info_manager:getPrinceEducationResult()
	return self.m_princeEducationResult
end

------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] setBeautiListInfo
-- 设置 美女列表
------------------------------------------------------------------
function f_user_info_manager:setBeautiListInfo(msg)
	self.m_beautiArrList = msg
end

------------------------------------------------------------------
-- @function [parent=#f_user_info_manager]removeBeauty
-- 删除美女
------------------------------------------------------------------
function f_user_info_manager:removeBeauty(msg)
	if msg["result"] == 0 then
		local count = 0
		for i = 1, #self.m_removeBeautyList do
			local id = self.m_removeBeautyList[i]["beautyId"]
			local t = self.m_beautiArrList["unbattleList"]
			local j = 1
			while j <= #t do
				if id == t[j]["id"] then
				 	table.remove(t, j)
				 	count = count + 1
				else
					j = j + 1 
				end
			end
		end
		self.m_beautiArrList["unbattleList_Num"] = self.m_beautiArrList["unbattleList_Num"] - count
		
		self.m_user_info["silver"] = msg["silver"]
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REMOVE_BEAUTY)
		g_game.g_panelManager:showEffect(10)
		
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager]removePrince
-- 删除皇子
-------------------------------------------------
function f_user_info_manager:removePrince(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	self.m_removePrinceResult = msg
	if msg["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REMOVE_PRINCE)
		g_game.g_panelManager:showEffect(11)
	else
		print "delete prince failed"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager]removeMinChen
-- 删除名臣
-------------------------------------------------
function f_user_info_manager:removeMinChen(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	self.m_removeMingchenResult = msg
	if msg["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REMOVE_MINGCHEN)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE)
		g_game.g_panelManager:showEffect(10)
	else
		print "delete card failed"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getRemovePrinceResult
-------------------------------------------------
function f_user_info_manager:getRemovePrinceResult()
	return self.m_removePrinceResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getRemoveMingchenResult
-------------------------------------------------
function f_user_info_manager:getRemoveMingchenResult()
	return self.m_removeMingchenResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBeautiListInfo
-- 获取美女列表
-------------------------------------------------
function f_user_info_manager:getBeautiListInfo()
	return self.m_beautiArrList
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBeautyInfoById
-- 根据美女id获取美女信息
-------------------------------------------------
function f_user_info_manager:getBeautyInfoById(beautyId)
	if self.m_beautiArrList ~= nil then
		local battleList_Num = self.m_beautiArrList["battleList_Num"]
		if battleList_Num ~= nil and battleList_Num > 0 then
			for i=1,battleList_Num do
				local beautyInfo = self.m_beautiArrList["battleList"][i]
				if beautyId == beautyInfo["beautyId"] then
					return beautyInfo
				end
			end
		end
		
		local unbattleList_Num = self.m_beautiArrList["unbattleList_Num"]
		if unbattleList_Num ~= nil and unbattleList_Num > 0 then
			for i=1,unbattleList_Num do
				local beautyInfo = self.m_beautiArrList["unbattleList"][i]
				if beautyId == beautyInfo["beautyId"] then
					return beautyInfo
				end
			end
		end
	end
	
	return nil
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBeautyInfoByPriId
-- 根据美女主键id获取美女信息
-------------------------------------------------
function f_user_info_manager:getBeautyInfoByPriId(priId)
	if self.m_beautiArrList ~= nil then
		local battleList_Num = self.m_beautiArrList["battleList_Num"]
		if battleList_Num ~= nil and battleList_Num > 0 then
			for i=1,battleList_Num do
				local beautyInfo = self.m_beautiArrList["battleList"][i]
				if priId == beautyInfo["id"] then
					return beautyInfo
				end
			end
		end
		
		local unbattleList_Num = self.m_beautiArrList["unbattleList_Num"]
		if unbattleList_Num ~= nil and unbattleList_Num > 0 then
			for i=1,unbattleList_Num do
				local beautyInfo = self.m_beautiArrList["unbattleList"][i]
				if priId == beautyInfo["id"] then
					return beautyInfo
				end
			end
		end
	end
	
	return nil
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] changeBeautyInfoById
-- 根据美女id更改美女属性值
-------------------------------------------------
function f_user_info_manager:changeBeautyInfoById(beautyId, key, value)
	if self.m_beautiArrList ~= nil then
		local battleList_Num = self.m_beautiArrList["battleList_Num"]
		if battleList_Num ~= nil and battleList_Num > 0 then
			for i=1,battleList_Num do
				local beautyInfo = self.m_beautiArrList["battleList"][i]
				if beautyId == beautyInfo["id"] then
					if beautyInfo[key] ~= nil and type(beautyInfo[key]) == "number" then
						self.m_beautiArrList["battleList"][i][key] = self.m_beautiArrList["battleList"][i][key] + value
						return
					end
				end
			end
		end
		
		local unbattleList_Num = self.m_beautiArrList["unbattleList_Num"]
		if unbattleList_Num ~= nil and unbattleList_Num > 0 then
			for i=1,unbattleList_Num do
				local beautyInfo = self.m_beautiArrList["unbattleList"][i]
				if beautyId == beautyInfo["id"] then
					if beautyInfo[key] ~= nil and type(beautyInfo[key]) == "number" then
						self.m_beautiArrList["unbattleList"][i][key] = self.m_beautiArrList["unbattleList"][i][key] - value
						return
					end
				end
			end
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] hasPrince
-- 返回是否有皇子
-------------------------------------------------
function f_user_info_manager:hasPrince()
	return self.m_princeData["battleList_Num"] > 0 or self.m_princeData["unbattleList_Num"] > 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setPrinceData
-- 设置 皇子列表
-------------------------------------------------
function f_user_info_manager:setPrinceData(msg)
	self.m_princeData = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ADD)
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPrinceData
-- 获取 皇子列表
-------------------------------------------------
function f_user_info_manager:getPrinceData()
	return self.m_princeData
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] updateBeautyListInfo
-- 更新美女列表数据
-------------------------------------------------
function f_user_info_manager:updateBeautyListInfo()
	local tempTable = {}	
	for i = 1 , #self.m_beautiArrList["unbattleList"] do
		for j = 1, #self.m_eatenBeautyArr do
			if self.m_eatenBeautyArr[j]["canBeEatenSelect"] and
				self.m_eatenBeautyArr[j][1]["id"] == self.m_beautiArrList["unbattleList"][i]["id"] then
				table.insert(tempTable,i)
			end
		end
	end
	
	for i = #tempTable, 1,-1 do
		self.m_beautiArrList["unbattleList_Num"] = self.m_beautiArrList["unbattleList_Num"] -1
		table.remove(self.m_beautiArrList["unbattleList"],tempTable[i])
	end
	
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] insertBeautyToUnbattleList
-- 添加美女到未上阵美女
-------------------------------------------------
function f_user_info_manager:insertBeautyToUnbattleList(beauty)
	self.m_beautiArrList["unbattleList_Num"] = self.m_beautiArrList["unbattleList_Num"] + 1
	table.insert(self.m_beautiArrList["unbattleList"], beauty)
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] insertOfficerCardToUnbattleList
-- 添加卡牌到未上阵卡牌列表
-------------------------------------------------
function f_user_info_manager:insertOfficerCardToUnbattleList(officer)
	local unbattleList = self:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	table.insert(unbattleList, officer)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getAllBeautyArr
-- 获取 用户的所有美女
-------------------------------------------------
function f_user_info_manager:getAllBeautyArr()
	--self.m_beautiArrList 中的数据随时会有变化，必须先清空 然后再添加
	if self.m_allBeautyArr ~= nil then
		self.m_allBeautyArr = {}
	end
	
	if self.m_beautiArrList ~= nil then
		local  allBeautyNum = self.m_beautiArrList["battleList_Num"] +  self.m_beautiArrList["unbattleList_Num"]
		
		for i = 1 , allBeautyNum do
			if i <= self.m_beautiArrList["battleList_Num"]  then
				table.insert(self.m_allBeautyArr,self.m_beautiArrList["battleList"][i])		
			else
				table.insert(self.m_allBeautyArr,self.m_beautiArrList["unbattleList"][i-self.m_beautiArrList["battleList_Num"]])
			end
		end
	end
	
	return self.m_allBeautyArr
end	

-------------------------------------------------

-- @function [parent=#f_user_info_manager] updateCanbeEatenBeautyArr
-- 更新 可被吞卡的 卡牌 id
-------------------------------------------------
function f_user_info_manager:updateCanbeEatenBeautyArr(exceptionBeauty)
	--exceptionBeauty  需要检查传进来的 exceptionBeauty，即将被升级的卡牌是否在为上阵当中，如果有，需要被排除在外
	--self.m_eatenBeautyArr 队列也可能会变化，所以要先清空，重新按照规则选取
	if self.m_eatenBeautyArr ~= nil then
		self.m_eatenBeautyArr = {}
	end
	
	if self.m_beautiArrList ~= nil then
		--从未助阵中选择
		local uncheerBeautyNum = self.m_beautiArrList["unbattleList_Num"]
		
		for i = 1, uncheerBeautyNum do
			--检查是否 在怀孕中
			if self.m_beautiArrList["unbattleList"][i]["conceive"] == 0 and
				exceptionBeauty:getData()["id"] ~= self.m_beautiArrList["unbattleList"][i]["id"] then
																							--初始化一个标志位，默认每张牌都没有被选中吞卡			
				table.insert(self.m_eatenBeautyArr,{self.m_beautiArrList["unbattleList"][i], ["canBeEatenSelect"] = false})
			end
		end
	end
	
end


-------------------------------------------------

-- @function [parent=#f_user_info_manager] getDeleteableBeauty
-- 可以被删除的美女
-------------------------------------------------
function f_user_info_manager:getDeleteableBeauty()
	--从未助阵中选择
	local tab = self.m_beautiArrList["unbattleList"]
	local ret = {}
	for i = 1, #tab do
		--检查是否 在怀孕中
		if tab[i]["conceive"] == 0 then																	
			table.insert(ret, tab[i])
			tab[i]["isSelected"] = false
		end
	end
	return ret
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getCanBeEatenBeautyArr
-- 获取 用户的所有美女
-------------------------------------------------
function f_user_info_manager:getCanBeEatenBeautyArr()
	return  self.m_eatenBeautyArr
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] removeDuplicate
-- 去掉重复的奖励
-------------------------------------------------
function f_user_info_manager:removeDuplicate(list, idKey, typeKey)
	local t = {}
	for i = 1, #list do
		local has = false
		if list[i][typeKey] == 4 then
			for j = 1, #t do
				if t[j][typeKey] == list[i][typeKey] then
					has = true
					t[j] = list[i]
					break
				end
			end
		end
		if not has then
			table.insert(t, list[i])
		end
	end
	return t
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] receiveXunfang
-- 获取寻访结果
-------------------------------------------------
function f_user_info_manager:receiveXunfang(list)

	if self.m_xunfangItem == 0 then
		self.m_user_info["gold"] = self.m_user_info["gold"] - self.m_xunfangCost
			
		--sdk事件定义
		local eventData = {}
		eventData["reason"] =  "寻访"
		eventData["lost"] = self.m_xunfangCost
		eventData["left"] = self.m_user_info["gold"]
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_LOST_COINS, eventData)
	else
		self:reduceEquipDataByPropId(self.m_xunfangItem, 1)
	end
	list = self:removeDuplicate(list, "id", "type")
	local num = 0
	for i = 1, #list do
	 	local n = self:addEmptyCard(list[i]["type"], list[i]["id"], list[i]["primaryId"], list[i]["num"])
	 	if i == 1 then
	 		num = n;
	 	end
	end

	local panel = g_game.g_panelManager:getUiPanel("xunfang_panel")
	if panel ~= nil then
		panel:playAnim(list[1]["type"], list[1]["id"], num)
	end
	
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getTitleGroupBeauty
-- 获取 固定title的 group 美女
-------------------------------------------------
function f_user_info_manager:getTitleGroupBeauty(index)
	if self.m_beautyTitleGroup ~= nil then
		self.m_beautyTitleGroup = {}
	end
	
	self:getAllBeautyArr()
	for i = 1, #self.m_allBeautyArr do
		if self.m_allBeautyArr[i]["beautyTitle"] == index then
			table.insert(self.m_beautyTitleGroup,self.m_allBeautyArr[i])
		end		
	end
	
	return  self.m_beautyTitleGroup
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] updatePromoteBeautyArr
-- 更新 没有达到 某title的 所有美女
-------------------------------------------------
function f_user_info_manager:updatePromoteBeautyArr(titleIndex)
	if self.m_beautyGroupCanPromote ~= nil then
		self.m_beautyGroupCanPromote = {}
	end
	
	self:getAllBeautyArr()
	for i = 1, #self.m_allBeautyArr do
		--title index越大 表示 宫衔越低 ， 0为普通秀女
		if self.m_allBeautyArr[i]["beautyTitle"] > titleIndex or self.m_allBeautyArr[i]["beautyTitle"] == 0 then
			table.insert(self.m_beautyGroupCanPromote,self.m_allBeautyArr[i])
		end		
	end
	
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] getPromoteBeautyArr
-- 获取 没有达到 某title的 所有美女
-------------------------------------------------
function f_user_info_manager:getPromoteBeautyArr()
	return self.m_beautyGroupCanPromote
end


-------------------------------------------------

-- @function [parent=#f_user_info_manager] setChangePositionResult
-- 设置换位结果
-------------------------------------------------
function f_user_info_manager:setChangePositionResult(result)
	if result["result"] == 1 then
		g_game.g_panelManager:getUiPanel("paibinghuangzi_top"):removeHuanZhenPanel()
	else
		print "change position failed"
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setHuangJiangResult
-- 设置换将结果
-------------------------------------------------
function f_user_info_manager:setHuangJiangResult(result)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if result["battleResult"] == 1 then
		g_game.g_panelManager:getUiPanel("paibinghuangzi_top"):removeMingchanPanel()
		g_game.g_panelManager:showEffect(7)
	else
		print "change huanjiang failed!"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setChangeBeautyResult
-- 设置换妞结果
-------------------------------------------------
function f_user_info_manager:setChangeBeautyResult(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHANGE_BEAUTY)
		g_game.g_panelManager:showEffect(7)
	else
		print "change beauty failed!"
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserRoleId
-- 获取用户唯一id
-------------------------------------------------
function f_user_info_manager:getUserRoleId()
	return self.m_user_info["roleId"]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserRoleName
-- 获取用户角色名
-------------------------------------------------
function f_user_info_manager:getUserRoleName()
	return self.m_user_info["name"]
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] loginGame
-- 进入游戏，需要判断基础信息是否都已经接受
-------------------------------------------------
function f_user_info_manager:loginGame()
	if self.m_user_info ~= nil and self.m_officer_position ~= nil and
	 self.m_limit_info ~= nil and self.m_beautiArrList ~= nil and self.m_princeData ~= nil then
		
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		
		
		--数据分析sdk
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGIN)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_GAME_SERVER)
		if self.m_user_info["isFirstLogin"] == 1 then
			--数据分析sdk
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_REGISTERED)
			--进入剧情
			g_game.enterLoadingScene(4)
			g_game.g_current_loading_scene:setLoadingData({"test"})	
		else
			g_game.enterLoadingScene(2)	
			g_game.g_current_loading_scene:setLoadingData({"test"})		
			g_game.g_guidelinesManager:preInitGuidelines()
			g_game.g_secondGuidelinesManager:preInitGuidelines()
		end
		
		--数据分析sdk
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_LOGINED)
		
		local eventData = {}
		eventData["coinNum"] = self.m_user_info["gold"]
		send_lua_event_param(g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_COINS, eventData)
		
		return true
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getEquipByPrimayID
-- 根据主键id获取装备
-------------------------------------------------
function f_user_info_manager:getEquipByPrimayID(id)
	local t = self.m_equipments["equipments"]

	for i = 1, #t do
		if t[i]["primaryId"] == id then
			return t[i]
		end
	end
	return nil
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getWeaponList
-- 获得武器装备列表
-------------------------------------------------
function f_user_info_manager:getWeaponList(showEquiped)
	local w = {}
	local t = self.m_equipments["equipments"]
	for i = 1, #t do
		if g_game.g_dictConfigManager:isEuqipmentWeapon(t[i]["equip_id"]) then
			if showEquiped or t[i]["status"] == 0 then
				table.insert(w, t[i])
			end
		end
	end
	return w
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getArmorList
-- 获得防具装备列表
-------------------------------------------------
function f_user_info_manager:getArmorList(showEquiped)
	local a = {}
	local t = self.m_equipments["equipments"]
	for i = 1, #t do
		if g_game.g_dictConfigManager:isEuqipmentArmor(t[i]["equip_id"]) then
			if showEquiped or t[i]["status"] == 0 then
				table.insert(a, t[i])
			end
		end
	end
	return a
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBingfaList
-- 获得兵法装备列表
-------------------------------------------------
function f_user_info_manager:getBingfaList()
	local a = {}
	local ue = {}
	local t = self.m_equipments["equipments"]
	for i = 1, #t do
		if g_game.g_dictConfigManager:isEuqipmentBingfa(t[i]["equip_id"]) then
			table.insert(a, t[i])
			if t[i]["status"] == 0 then
				table.insert(ue, t[i])
			end
		end
	end
	return a, ue
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] refershUserLevelInfo
-- 刷新用户级别和经验
-------------------------------------------------
function f_user_info_manager:refershUserLevelInfo(newLevel, newExp)
	self.m_user_info["level"] = newLevel
	self.m_user_info["exp"] = newExp
	
	--数据分析sdk
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LEVEL)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] refershUserSilver
-- 刷新用户银两
-------------------------------------------------
function f_user_info_manager:refershUserSilver(newSilver)
	self.m_user_info["silver"] = newSilver
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] resetUserDataForLevelup
-- 设置用户基本信息为空，用于刷新升级数据
-------------------------------------------------
function f_user_info_manager:resetUserDataForLevelup()
	self.m_user_info = nil
	self.m_limit_info = nil
end


------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPrinceList
-- 进入游戏，向服务器请求皇子列表
-------------------------------------------------
function f_user_info_manager:requestPrinceList()
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_PRINCE_LIST, dataT)

end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPvpLueduo
-- 进行掠夺
-------------------------------------------------
function f_user_info_manager:requestPvpLueduo(index)
	local dataT = {}
	if index == nil then
		index = self.m_lastLueduoIndex
	end
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["position"] = index
	dataT["chipId"] = self.m_lastLueduoPiece
	self.m_lastLueduoIndex = index
	self.m_shouldGotoBingfaItem = g_game.g_dictConfigManager:getPieceCardID(self.m_lastLueduoPiece)
	g_game.g_netManager:send_message(g_network_message_type.CS_PREY_FIGHT, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	
	self.m_pveBattleData["areaId"] = 1
	self.m_pveBattleData["stageId"] = 1
	self.m_pveBattleData["levelId"] = 1
	self.m_pveBattleData["battleType"] = g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST
	self.m_pveBattleData["levelInfo"] = g_game.g_dictConfigManager:getLevelInfo(1)
end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestMergeBingfa
-- 请求合成兵法
-------------------------------------------------
function f_user_info_manager:requestMergeBingfa(id, list)
	self.m_mergeBingfaPieces = list
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["bingFaId"] = id
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	g_game.g_netManager:send_message(g_network_message_type.CS_MERGE_BING_FA, dataT)
end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRemoveBeauty
-- 删除美女
-------------------------------------------------
function f_user_info_manager:requestRemoveBeauty(list)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["beautyList_Num"] = #list
	dataT["beautyList"] = list
	self.m_removeBeautyList = list
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	g_game.g_netManager:send_message(g_network_message_type.CS_BEAUTY_CARD_PRICE_REQUEST, dataT)

end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRemovePrince
-- 删除皇子
-------------------------------------------------
function f_user_info_manager:requestRemovePrince(list)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["princeList_Num"] = #list
	dataT["princeList"] = list
	self.m_removePrinceList = list
	g_game.g_netManager:send_message(g_network_message_type.CS_PRINCE_CARD_PRICE_REQUEST, dataT)

end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRemoveMinChen
-- 删除名臣
-------------------------------------------------
function f_user_info_manager:requestRemoveMinChen(list)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["cardList_Num"] = #list
	dataT["cardList"] = list
	self.m_removeMinChenList = list
	g_game.g_netManager:send_message(g_network_message_type.CS_OFFICER_CARD_PRICE_REQUEST, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestMail
-- 向服务器请求邮件列表
-------------------------------------------------
function f_user_info_manager:requestMail(page, type)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["mail_num"] = 4
	self.m_mailRequestIndex = (page - 1) * 4
	dataT["startIndex"] = self.m_mailRequestIndex
	self.m_mailRequestType = type
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	if type == 1 then
		g_game.g_netManager:send_message(g_network_message_type.CS_GET_SYS_MAILS, dataT)
	elseif type == 2 then
		g_game.g_netManager:send_message(g_network_message_type.CS_GET_PVP_MAIL, dataT)
	end
	
end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestDeleteMail
-- 向服务器请求删除邮件
-------------------------------------------------
function f_user_info_manager:requestDeleteMail(mailID, type)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["mailId"] = mailID
	self.m_mailRequestType = type
	if type == 1 then
		g_game.g_netManager:send_message(g_network_message_type.CS_DELETE_MAIL, dataT)
	elseif type == 2 then
		g_game.g_netManager:send_message(g_network_message_type.CS_REMOVE_PVP_MAIL, dataT)
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestSellEquip
-- 向服务器请求出售装备
-------------------------------------------------
function f_user_info_manager:requestSellEquip(id)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["primaryId"] = id
	self.m_sellEquipID = id
	g_game.g_netManager:send_message(g_network_message_type.CS_SELL_EQUIPMENT, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------------------------------
-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestDealMail
-- 向服务器请求处理邮件
-------------------------------------------------
function f_user_info_manager:requestDealMail(mailID)
	local dataT = {}
	dataT["roelId"] = self.m_user_info["roleId"]
	dataT["mailId"] = mailID
	self.m_dealMailId = mailID
	g_game.g_netManager:send_message(g_network_message_type.CS_CONFIRM_MAIL_ATTACHMENT, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] recivePrinceChangeNameResult
-- 皇子改名结果
-------------------------------------------------
function f_user_info_manager:recivePrinceChangeNameResult(msg)
	self.m_changeNameResult = msg
	if msg["result"] == 1 then
		--发送刷新皇子名称事件
		g_game.g_audioManager:stopAllEffect()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME)
	elseif msg["result"] == 3 then
		g_game.g_utilManager:showMsg("此名字已经被使用")
	elseif msg["result"] == -1 then
		g_game.g_utilManager:showMsg("您输入了非法字符，请重新输入")
	else
		g_game.g_utilManager:showMsg("未知错误，命名失败")
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getChangeNameResult
-- 获得皇子改名结果
-------------------------------------------------
function f_user_info_manager:getChangeNameResult()
	return  self.m_changeNameResult 
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receivePrinceZongrenfuResult
-- 皇子宗人府升级结果
-------------------------------------------------
function f_user_info_manager:receivePrinceZongrenfuResult(msg)
	self.m_zongrenfuResult = msg
	if msg["result"] == 1 then
		--宗人府升级成功后，修改数据(删除被吞卡的皇子 修改目标皇子的信息(经验 等级)  修改用户的银两数据)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU)
		if msg["levelUp"] == 1 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI)
		end
	else
		CCLOG("zongrenfu update failed!")
	end
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] getZongrenfuResult
-------------------------------------------------
function f_user_info_manager:getZongrenfuResult()
	return	self.m_zongrenfuResult
end


--名臣升级回调
-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveMingchenShengjifuResult
-- 名臣升级结果
-------------------------------------------------
function f_user_info_manager:receiveMingchenShengjifuResult(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	self.m_cardMergResult = msg
	if msg["result"] == 1 then
		local unbattleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
		
		local tempTable = {}
		for j = 1, #unbattleList do
			for i = 1, #self.m_upgradeCostMingchen do
				if unbattleList[j]["id"] == self.m_upgradeCostMingchen[i]["oId"] then
					table.insert(tempTable,j)
				end
			end
		end
		for i = #tempTable, 1,-1 do
			table.remove(unbattleList,tempTable[i])
		end	
			
		self.m_upgradeCostMingchen = nil
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI)
	else
		CCLOG("mingchen card update failed!")
	end
end


function f_user_info_manager:getMergeCardResult()
	return self.m_cardMergResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getEquipForCard
-- 获得武器和防具
-------------------------------------------------
function f_user_info_manager:getEquipForCard(position)
	local t = self.m_equipments["equipments"]
	local w = nil
	local a = nil
	local b = nil
	
	for i = 1, #t do
		if t[i]["status"] == 1 and t[i]["position"] == position and
			t[i]["battle"] == self.m_user_info["curr_battle"] then
			local e = g_game.g_dictConfigManager:getEquipById(t[i]["equip_id"])
			if e ~= nil then
				if e[6] == 1 then
					w = t[i]
				elseif e[6] == 2 then
					a = t[i]
				else
					b = t[i]
				end 
			end
		end
	end
	return w, a, b
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] hasUnusedEquipForCard
-- 是否还有未使用的武器和防具
-------------------------------------------------
function f_user_info_manager:hasUnusedEquipForCard()
	local t = self.m_equipments["equipments"]
	local w = false
	local a = false
	local b = false
	
	for i = 1, #t do
		if t[i]["status"] == 0 or t[i]["battle"] ~= self.m_user_info["curr_battle"] then
			local e = g_game.g_dictConfigManager:getEquipById(t[i]["equip_id"])
			if e ~= nil then
				if e[6] == 1 then
					w = true
				elseif e[6] == 2 then
					a = true
				else
					b = true
				end
			end
		end
	end
	return w, a, b
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] recivePrinceChangePositionResult
-- 皇子上阵或更换结果
-------------------------------------------------
function f_user_info_manager:recivePrinceChangePositionResult(msg)
	if msg["result"] == 1 then
		--发送刷新皇子名称事件
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_LIST)
	else
		CCLOG("prince change position error!")
	end
end

-------------------------------------------------

-- @function [parent=#f_user_info_manager] setUserInfo
-- 设置用户信息，用户名称， 等级，经验等
-------------------------------------------------
function f_user_info_manager:setUserInfo(info)
	self.m_user_info = info
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserInfo
-- 获取用户信息
-------------------------------------------------
function f_user_info_manager:getUserInfo()
	return self.m_user_info
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] updateBuilding
-- 更新建筑信息
-------------------------------------------------
function f_user_info_manager:updateBuilding()
	local userLevel = g_game.g_userInfoManager:getLevel()
	self.m_building_list = g_game.g_dictConfigManager:getBuildingList(userLevel)
	
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBuildingList
-- 获取建筑信息
-------------------------------------------------
function f_user_info_manager:getBuildingList()
	return self.m_building_list
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserName
-- 获取玩家名称
-------------------------------------------------
function f_user_info_manager:getUserName()
	return self.m_user_info["name"]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserExp
-- 获取玩家经验
-------------------------------------------------
function f_user_info_manager:getUserExp()
	return self.m_user_info["exp"]
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserStrength
-- 获取玩家体力
-------------------------------------------------
function f_user_info_manager:getUserStrength()
	return self.m_user_info["strength"]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getUserLv
-- 获取玩家等级
-------------------------------------------------
function f_user_info_manager:getUserLv()
	return self.m_user_info["level"]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setOfficerInfo
-- 设置阵容信息
-------------------------------------------------
function f_user_info_manager:setOfficerInfo(info)
	self.m_officer_position = info
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getOfficerInfo
-- 获取阵容信息
-------------------------------------------------
function f_user_info_manager:getOfficerInfo()
	return self.m_officer_position
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBattleDataByType
-- 初始化当前阵容
-------------------------------------------------
function f_user_info_manager:getBattleDataByType(type)
	if type == g_game.g_f_battle_list_type.TYPE_BATTLE_ARR1 then
		return self.m_officer_position["battleList1"]
	elseif type == g_game.g_f_battle_list_type.TYPE_BATTLE_ARR2 then
		return self.m_officer_position["battleList2"]
	elseif type == g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR then
		return self.m_officer_position["unbattleList"]
	elseif type == g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR then
		if self.m_user_info["curr_battle"] == 1 then
			return self.m_officer_position["battleList1"]
		elseif self.m_user_info["curr_battle"] == 2 then
			return self.m_officer_position["battleList2"]
		end
	elseif type == g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR then
		local allOfficerArr = {}
		
		for i = 1,#self.m_officer_position["battleList1"] do
			table.insert(allOfficerArr,self.m_officer_position["battleList1"][i])
		end
		for j = 1,#self.m_officer_position["battleList2"] do
			table.insert(allOfficerArr,self.m_officer_position["battleList2"][j])
		end
		for k = 1,#self.m_officer_position["unbattleList"] do
			table.insert(allOfficerArr,self.m_officer_position["unbattleList"][k])
		end
		return allOfficerArr
	end

	return nil
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setLimitInfo
-- 设置上限信息
-------------------------------------------------
function f_user_info_manager:setLimitInfo(info)
	self.m_limit_info = info
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLimitInfo
-- 获取用户信息上限
-------------------------------------------------
function f_user_info_manager:getLimitInfo()
	return self.m_limit_info
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLevel
-- 获取用户等级
-------------------------------------------------
function f_user_info_manager:getLevel()
	if self.m_user_info then
		return self.m_user_info["level"]
	else
		return -1
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setBattleData
-- 设置服务器返回的战斗回合数据
-------------------------------------------------
function f_user_info_manager:setBattleData(data)
	self.m_pveBattleData["roundData"] = data
	self.m_user_info["military"] = data["military"]
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBattleData
-- 获取战斗回合数据
-------------------------------------------------
function f_user_info_manager:getBattleData()
	return self.m_pveBattleData
end

----------------------------------------------------
-- @function [parent=#f_user_info_manager] requestClaimQiandao
-- 领取签到奖励
-------------------------------------------------
function f_user_info_manager:requestClaimQiandao(index)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["num"] = index
	self.m_claimQiandaoIndex = index
	g_game.g_netManager:send_message(g_network_message_type.CS_ACCEPT_CHARGE_CHECKIN_REWARD, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestClaimDailyReward
-- 领取登陆奖励
-------------------------------------------------
function f_user_info_manager:requestClaimDailyReward(index)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["rewardId"] = index
	self.m_claimDailyRewardIndex = index
	g_game.g_netManager:send_message(g_network_message_type.CS_USE_LOGIN_REWARD_REQUEST, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestClaimLevelReward
-- 领取等级奖励
-------------------------------------------------
function f_user_info_manager:requestClaimLevelReward(level)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["level"] = level
	self.m_claimLevelRewardLevel = level
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_RECEIVE_LEVEL_REWARD, dataT)
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestDailyReward
-- 请求登陆奖励
-------------------------------------------------
function f_user_info_manager:requestDailyReward()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_LOGIN_REWARD_REQUEST, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestLevelReward
-- 请求等级奖励
-------------------------------------------------
function f_user_info_manager:requestLevelReward()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_USER_REWARD_LEVEL, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestWorldBoss
-- 请求 世界boss
-------------------------------------------------
function f_user_info_manager:requestWorldBoss()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	local isWorldBossBegin = self:updateSingleFlag("worldboss")
	
	self.m_refreshFightRequest = -1
	
	if isWorldBossBegin then
		self:requestWorldBossOpen()
	else
		self:requestLastKillBossInfo()
	end

end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestWorldBossOpen
----------------------------------------------
function f_user_info_manager:requestWorldBossOpen()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_CURRENT_FIGHT_INFO, dataT)
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveWorldBossOpen
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["count"] Type:INTEGER Size:4 当前参与人数
-- 		["addition"] Type:INTEGER Size:4 当前已 鼓舞加成
-- 		["hpLeft"] Type:INTEGER Size:4 BOSS 剩余血量
-- 		["hp"] Type:INTEGER Size:4 BOSS总血量
-- 		["hurt"] Type:INTEGER Size:4 当前玩家的伤害值
-- 		["rank"] Type:INTEGER Size:4 当前玩家排名  0 玩家上次没有参加击杀  非0 玩家参与击杀后的排名
-- 		["list_Num"] Type:SHORT Size:2 当前 前十名 榜单列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 当前 前十名 榜单列表
-- 				["roleName"] Type:STRING Size:4 角色名
-- 				["hurt"] Type:INTEGER Size:4 伤害值
-- 				["hurtPercent"] Type:INTEGER Size:4 伤害百分比
-- 		}
-- }
-------------------------------------------------
function f_user_info_manager:receiveWorldBossOpen(msg)
	self.m_curWorldBossInfo = msg
	
	self.m_huodongReceive["worldboss"] = 1
	self:openHuodong()
	
	if self.m_curWorldBossInfo["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_OPEN)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_BOSS_OPEN)
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

function f_user_info_manager:getWorldBossOpen()
	return self.m_curWorldBossInfo
end


function f_user_info_manager:requestWorldBossUserInfo()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_WORLD_BOOS_USER_INFO, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

function f_user_info_manager:receiveWorldBossUserInfo(msg)
	self.m_bossUserData = msg 
	if self.m_bossUserData["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BOSS_USERINFO )
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBossCourage
------------------------------------------------- 
function f_user_info_manager:requestBossCourage(times)
	local dataT = {}
	
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["type"] = 1
	if times ~= 1 then
		dataT["type"] = 2
	end
	g_game.g_netManager:send_message(g_network_message_type.CS_GU_WU_INFO, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

function f_user_info_manager:receiveBossCourage(msg)
	self.m_courageResult = msg

	if self.m_courageResult["result"] == 1 then
		self.m_user_info["gold"] = self.m_courageResult["gold"]
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_COURAGE_BOSS)
	else
		g_game.g_utilManager:showMsg("鼓舞失败")	
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

function f_user_info_manager:getCourageResult()
	return self.m_courageResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBossReborn
------------------------------------------------- 
function f_user_info_manager:requestBossReborn()
	local dataT = {}
	
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_REBORN_FIGHT, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

function f_user_info_manager:receiveBossReborn(msg)
	self.m_rebornResult	= msg
	
	if self.m_rebornResult["result"] == 1 then
		self.m_user_info["gold"] = self.m_rebornResult["gold"]
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_REBORN_BOSS)
	else
		g_game.g_utilManager:showMsg("重生失败")	
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

function f_user_info_manager:getRebornResult()
	return self.m_rebornResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getWorldBossUserInfo
------------------------------------------------- 
function f_user_info_manager:getWorldBossUserInfo()
	return self.m_bossUserData
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestLastKillBossInfo
------------------------------------------------- 
function f_user_info_manager:requestLastKillBossInfo()
	local dataT ={}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_LAST_KILL_BOSS_INFO, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveLastKillBossInfo
-- 活动未开启 时候 显示上一次击杀boss信息
--  dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["roleName"] Type:STRING Size:4 角色名
-- 		["contribution"] Type:INTEGER Size:4 获得的功绩值
-- 		["cur_contribution"] Type:INTEGER Size:4 玩家当前的功绩值
-- }
-------------------------------------------------
function f_user_info_manager:receiveLastKillBossInfo(msg)
	self.m_lastKillBossInfo = msg
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_UNOPEN)
	self.m_huodongReceive["worldboss"] = 1
	self:openHuodong()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLastKillBossInfo
-------------------------------------------------
function f_user_info_manager:getLastKillBossInfo()
	return self.m_lastKillBossInfo
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestLastRankInfo
-- 请求榜单数据
-------------------------------------------------
function f_user_info_manager:requestLastRankInfo()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["type"] = 1
	
	g_game.g_netManager:send_message(g_network_message_type.CS_RANK_LIST, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)

end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveLastRankInfo
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["hurt"] Type:INTEGER Size:4 玩家的伤害值
-- 		["percent"] Type:INTEGER Size:4 玩家的伤害值占boss总血量百分比
-- 		["rank"] Type:INTEGER Size:4 玩家排行 0 玩家上次没有参加击杀  非0 玩家参与击杀后的排名
-- 		["isBossKill"] Type:BYTE Size:1 boss是否被击杀 0 没有被击杀  1被击杀
-- 		["killBossName"] Type:STRING Size:4 击杀boss的玩家名字
-- 		["gainContribution"] Type:INTEGER Size:4 击杀boss 获得的额外功绩值
-- 		["list_Num"] Type:SHORT Size:2 榜单列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 榜单列表
-- 				["roleName"] Type:STRING Size:4 角色名
-- 				["hurt"] Type:INTEGER Size:4 伤害值
-- 				["hurtPercent"] Type:INTEGER Size:4 伤害百分比
-- 				["contribution"] Type:INTEGER Size:4 获得的功绩值
-- 		}
-- 		["rewardList_Num"] Type:SHORT Size:2 更新用户奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 更新用户奖励列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、装备主键ID
-- 				["id"] Type:INTEGER Size:4 道具、碎片的id
-- 				["value"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-------------------------------------------------
function f_user_info_manager:receiveLastRankInfo(msg)
	self.m_rankList = msg
	if msg["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOW_RANKINFO)
	else
		g_game.g_utilManager:showMsg("当前无榜单数据")	
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getWorldBossRankList
-------------------------------------------------
function f_user_info_manager:getWorldBossRankList()
	return self.m_rankList
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestWorldBossChallenge
-------------------------------------------------
function f_user_info_manager:requestWorldBossChallenge()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_WORLD_BOSS_FIGHT, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
	self.m_pveBattleData["battleType"] = g_game.g_f_battle_type.BATTLE_TYPE_WORLD_BOSS
	self.m_pveBattleData["levelInfo"] = g_game.g_dictConfigManager:getLevelInfo(47)
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBeautyChongxing
-- 请求宠幸当前美女
-------------------------------------------------
function f_user_info_manager:requestBeautyChongxing(id,beautyId)
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["beautyId"] = beautyId
	g_game.g_netManager:send_message(g_network_message_type.CS_FAVOR_BEAUTY, dataT)
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPalaceBattle
-- 宫斗
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- 		["beautyList_Num"] Type:SHORT Size:2 被吞的卡牌列表 array length
-- 		["beautyList"] = 
--		{ ------Type:ARRAY Size:8 被吞的卡牌列表
-- 				["bId"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 		}
-- }
-------------------------------------------------
function f_user_info_manager:requestPalaceBattle(id,beautyId)
	

	local beautyList = {}
	
	local eatenNum = 0
	for i = 1, #self.m_eatenBeautyArr do
		if self.m_eatenBeautyArr[i]["canBeEatenSelect"] then
			eatenNum = eatenNum + 1
			table.insert(beautyList,{["bId"] = self.m_eatenBeautyArr[i][1]["id"] , ["beautyId"] = self.m_eatenBeautyArr[i][1]["beautyId"]})
		end
	end
	
	if eatenNum < 1 then
		local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_BEAUTY_CARD_SELECT)
		g_game.g_utilManager:showMsg(tips)			
		return 	
	end
	
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["beautyId"] = beautyId
	
	dataT["beautyList"] = beautyList
	dataT["beautyList_Num"] = eatenNum
	
	g_game.g_netManager:send_message(g_network_message_type.CS_PALACE_BATTLE, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestQiFei
-- 发送弃妃消息
-------------------------------------------------
function f_user_info_manager:requestQiFei(id, beautyId)
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["beautyId"] = beautyId
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	g_game.g_netManager:send_message(g_network_message_type.CS_WASTER_PRINCESS, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPromoteBeauty
-- 发送册封消息
-------------------------------------------------
function f_user_info_manager:requestPromoteBeauty(id, beautyId,title)
	
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["beautyId"] = beautyId
	dataT["title"] = title
	g_game.g_netManager:send_message(g_network_message_type.CS_BEAUTY_CEFENG, dataT)
	
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBeautyArr
-- 进入战斗，向服务器发送挑战副本消息
-------------------------------------------------
function f_user_info_manager:requestBeautyArr()
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_BEAUTY_LIST, dataT)
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestGonggao
-- login之后，向服务器请求公告列表
-------------------------------------------------
function f_user_info_manager:requestGonggao()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_ANNOUNCEMENTS, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPregnantTime
-- 请求当前美女怀孕时间
-------------------------------------------------
function f_user_info_manager:requestPregnantTime(beautyMainId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["id"] = beautyMainId
	
	g_game.g_netManager:send_message(g_network_message_type.CS_BEAUTY_CONCEIVE, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestMergePiece
-- 请求合成碎片
-------------------------------------------------
function f_user_info_manager:requestMergePiece(id)
	self.m_mergePieceId = id
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["fragmentId"] = id
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_FRAGMENT_MERGE, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestObtainBornPrinceId
-- 请求获得出生的皇子
-------------------------------------------------
function f_user_info_manager:requestObtainBornPrinceId(beautyMainId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["id"] = beautyMainId
	
	g_game.g_netManager:send_message(g_network_message_type.CS_OBTAIN_PRINCE,dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPveBattle
-- 进入战斗，向服务器发送挑战副本消息
-------------------------------------------------
function f_user_info_manager:requestPveBattle(areaId, stageId, levelId)

	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["areaId"] = areaId
	dataT["stageId"] = stageId
	dataT["levelId"] = levelId	
	g_game.g_netManager:send_message(g_network_message_type.CS_PVE_FIGHT, dataT)
	
	self.m_pveBattleData["areaId"] = areaId
	self.m_pveBattleData["stageId"] = stageId
	self.m_pveBattleData["levelId"] = levelId
	self.m_pveBattleData["battleType"] = g_game.g_f_battle_type.BATTLE_TYPE_PVE
	
	if self.m_userPveLevelProgress ~= nil then
		self.m_pveBattleData["isAlreadyFight"] = levelId <self.m_userPveLevelProgress["level"]
	else
		self.m_pveBattleData["isAlreadyFight"] = false
	end

	self.m_pveBattleData["levelInfo"] = g_game.g_dictConfigManager:getLevelInfo(levelId)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

---------------------------------------------------
-- @function [parent=#f_user_info_manager] requestEliteBattle
-- 精英副本
---------------------------------------------------
function f_user_info_manager:requestEliteBattle(areaId, stageId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["areaId"] = areaId
	dataT["stageId"] = stageId
	g_game.g_netManager:send_message(g_network_message_type.CS_ELITE_FIGHT, dataT)

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
	self.m_pveBattleData["areaId"] = areaId
	self.m_pveBattleData["stageId"] = stageId
	self.m_pveBattleData["battleType"] = g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE
	self.m_pveBattleData["isAlreadyFight"] = true
	
	self.m_pveBattleData["levelInfo"] = g_game.g_dictConfigManager:getEliteStageData(stageId)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] canSkipBattle
-- 能否跳过战斗
-------------------------------------------------
function f_user_info_manager:canSkipBattle()
	if self.m_pveBattleData["battleType"] ~= g_game.g_f_battle_type.BATTLE_TYPE_PVE
		and  self.m_pveBattleData["battleType"] ~= g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
		self.m_isFirstFight = false
		return true
	end
	self.m_isFirstFight = not self.m_pveBattleData["isAlreadyFight"]
	return not self.m_isFirstFight
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangePosition
-- 更换某阵容的卡牌位置数据
-------------------------------------------------
function f_user_info_manager:requestChangePosition()
	local dataT = {}
	local attList = self:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	dataT["officer_Num"] = table.getn(attList)
	dataT["officer"] = {}
	
	for i = 1,table.getn(attList) do
		dataT["officer"][i] ={ ["id"] = attList[i]["id"], ["officerId"] = attList[i]["officerId"]}
	end
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_CHANGE_BATTLE_ARRAY, dataT)
	
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangeMingchen
-- 更换阵容发送更换数据
-------------------------------------------------
function f_user_info_manager:requestChangeMingchen(id,officerid,position)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["id"] = id
    dataT["officerId"] = officerid
	dataT["position"] = position
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_OFFICER_CARD_BATTLE, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangeCheerBeauty
-- 更换美女助阵
-------------------------------------------------
function f_user_info_manager:requestChangeCheerBeauty(id,beautyId,position)
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
    dataT["beautyId"] = beautyId
	dataT["position"] = position
	
	g_game.g_netManager:send_message(g_network_message_type.CS_BEAUTY_BATTLE, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangePrinceName
-- 更改皇子名称
-- 
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["princeId"] Type:INTEGER Size:4 皇子ID
-- 		["name"] Type:STRING Size:8 皇子名称
-------------------------------------------------
function f_user_info_manager:requestChangePrinceName(id, name)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["princeId"] = id
    dataT["name"] = name

	g_game.g_netManager:send_message(g_network_message_type.CS_PRINCE_CHANGE_NAME, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestZongrenfuShengji
-- 宗人府升级
-------------------------------------------------
function f_user_info_manager:requestZongrenfuShengji(id, prince_num, prince_list)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["id"] = id
    dataT["princeList_Num"] = prince_num
    dataT["princeList"] = prince_list

	g_game.g_netManager:send_message(g_network_message_type.CS_PRINCE_ZONG_REN_FU, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestMingchenShengji
-- 名臣吞卡升级
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 名臣卡牌主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["officerId"] Type:SHORT Size:2 名臣卡牌ID
-- 		["officerList_Num"] Type:SHORT Size:2 被合并的卡牌列表 array length
-- 		["officerList"] = 
--		{ ------Type:ARRAY Size:8 被合并的卡牌列表
-- 				["oId"] Type:INTEGER Size:4 名臣卡牌主键ID
-- 				["mergeOfficerId"] Type:SHORT Size:2 被合并的卡牌ID
-- 		}
-- }
-------------------------------------------------
function f_user_info_manager:requestMingchenShengji(id, officer_id, officer_num, officer_list)
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["officerId"] = officer_id
    dataT["officerList_Num"] = officer_num
    dataT["officerList"] = officer_list
    
    self.m_upgradeCostMingchen = officer_list

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_MERGE_CARD_REQUEST, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangePrincePosition
-- 更改皇子上阵位置
-------------------------------------------------
function f_user_info_manager:requestChangePrincePosition(id, position)
	local dataT = {}
	dataT["id"] = id
	dataT["roleId"] = self.m_user_info["roleId"]
    dataT["position"] = position

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_PRINCE_BATTLE, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPrinceEducation
-- 教育皇子
-------------------------------------------------
function f_user_info_manager:requestPrinceEducation(princeId,beautyNum,beautyList)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["id"] = princeId
	dataT["beautyList_Num"] = beautyNum
	dataT["beautyList"] = beautyList
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_PRINCE_SHANG_SHU_FANG, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUserPvpPlayerList
--请求  pvp  玩家排名列表
-------------------------------------------------
function f_user_info_manager:requestUserPvpPlayerList()
	local dataT = {}
	dataT["roleId"] =  self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_PVP_RANK, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestKejumingchenList
-- 请求 科举获取四个名臣列表（依据考试类型）
-------------------------------------------------
function f_user_info_manager:requestKejumingchenList(kejuType)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"] 
	dataT["type"]   = kejuType
	
	g_game.g_netManager:send_message(g_network_message_type.CS_SHOP_OFFICER, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestXuanxiuxiunvList
-- 请求 选秀获取四个秀女列表（依据选秀类型）
-------------------------------------------------
function f_user_info_manager:requestXuanxiuxiunvList(xuanxiuType)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"] 
	dataT["type"]   = xuanxiuType
	
	g_game.g_netManager:send_message(g_network_message_type.CS_SHOP_BEAUTY, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] sendKejuMingchenSelectResult
-- 科举界面的名臣选择（发送名臣卡片选择的索引）
-------------------------------------------------
function f_user_info_manager:sendKejuMingchenSelectResult(type,selectIndex)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"] 
	dataT["type"]  = type
	dataT["index"]   = selectIndex
	
	g_game.g_netManager:send_message(g_network_message_type.CS_SHOP_EXTRACT_OFFICER, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] sendXuanxiuXiunvSelectResult
-- 选秀界面的美女选择（发送美女卡片选择的索引）
-------------------------------------------------
function f_user_info_manager:sendXuanxiuXiunvSelectResult(type, selectIndex)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["type"]  = type
	dataT["index"]   = selectIndex
	
	g_game.g_netManager:send_message(g_network_message_type.CS_SHOP_EXTRACT_BEAUTY, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] sendToGetXuanxiuCDTimeAndTimes
-- 发送消息获取当前选秀的次数和CD时间
-------------------------------------------------
function f_user_info_manager:sendToGetXuanxiuCDTimeAndTimes()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"] 
	
	g_game.g_netManager:send_message(g_network_message_type.CS_SHOP_XUAN_XIU, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] sendToGetKejuCDTimeAndTimes
-- 发送消息获取当前科举的次数和CD时间
-------------------------------------------------
function f_user_info_manager:sendToGetKejuCDTimeAndTimes()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"] 
	
	g_game.g_netManager:send_message(g_network_message_type.CS_SHOP_KE_JU, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPvpPlayerZhenrong
--根据玩家id 请求玩家 阵容数据
-------------------------------------------------
function f_user_info_manager:requestPvpPlayerZhenrong(id)
	local dataT = {}
	dataT["roleId"] =  id
	
	g_game.g_netManager:send_message(g_network_message_type.CS_PVP_VIEW_BATTLE, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPvpMessage
--战斗 pvp
-------------------------------------------------
function f_user_info_manager:requestPvpMessage(challengedId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["challengeRoleId"] = challengedId
	
	g_game.g_netManager:send_message(g_network_message_type.CS_PVP_FIGHT, dataT)
	
	self.m_pveBattleData["areaId"] = 1
	self.m_pveBattleData["stageId"] = 1
	self.m_pveBattleData["levelId"] = 1
	self.m_pveBattleData["battleType"] = g_game.g_f_battle_type.BATTLE_TYPE_PVP
	self.m_pveBattleData["levelInfo"] = g_game.g_dictConfigManager:getLevelInfo(1)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUserPveProgress
--发送 pve 玩家进度 请求
-------------------------------------------------
function f_user_info_manager:requestUserPveProgress()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_LEVEL_INFO, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLianhuaMingchen
--获取炼化名臣数据列表
-------------------------------------------------
function f_user_info_manager:getLianhuaMingchen()
	local t = self.m_officer_position["unbattleList"]
	local ret = {}
	for i = 1, #t do
		if g_game.g_dictConfigManager:getCardQuality(t[i]["officerId"]) >= 3 and t[i]["officerId"] ~= 3045 then
			table.insert(ret, t[i])
		end
	end
	
	local com = function(i1, i2)
		local star1 = g_game.g_dictConfigManager:getCardQuality(i1["officerId"])
		local star2 = g_game.g_dictConfigManager:getCardQuality(i2["officerId"])
		if star1 == star2 then
			return i1["officerId"] < i2["officerId"]
		end
		return  star1 < star2
	end
	
	table.sort(ret, com)
	return ret
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLianhuaMeinv
--获取炼化美女数据列表
-------------------------------------------------
function f_user_info_manager:getLianhuaMeinv()
	local t = self.m_beautiArrList["unbattleList"]
	local ret = {}
	for i = 1, #t do
		if g_game.g_dictConfigManager:getBeautyQuality(t[i]["beautyId"]) >= 3 and t[i]["beautyId"] ~= 3025 and t[i]["conceive"] == 0 then
			table.insert(ret, t[i])
		end
	end
	local com = function(i1, i2)
		local star1 = g_game.g_dictConfigManager:getBeautyQuality(i1["beautyId"])
		local star2 = g_game.g_dictConfigManager:getBeautyQuality(i2["beautyId"])
		if star1 == star2 then
			return i1["beautyId"] < i2["beautyId"]
		end
		return star1 < star2
	end
	table.sort(ret, com)
	return ret
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getLianhuaEquip
--获取炼化装备数据列表
-------------------------------------------------
function f_user_info_manager:getLianhuaEquip()
	local t = self.m_equipments["equipments"]
	local ret = {}
	for i = 1, #t do
		if t[i]["status"] == 0 and g_game.g_dictConfigManager:getEquipStar(t[i]["equip_id"]) >= 3 and not g_game.g_dictConfigManager:isEuqipmentBingfa(t[i]["equip_id"]) then
			table.insert(ret, t[i])
		end
	end
	local com = function(i1, i2)
		local star1 = g_game.g_dictConfigManager:getEquipStar(i1["equip_id"])
		local star2 = g_game.g_dictConfigManager:getEquipStar(i2["equip_id"])
		if star1 == star2 then
			return i1["equip_id"] < i2["equip_id"]
		end
		return star1 < star2
	end
	table.sort(ret, com)
	return ret
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPveLevelsNum
--发送 pve 请求玩家 小关卡的 数目
-------------------------------------------------
function f_user_info_manager:requestPveLevelsNum(areaId,bigStageId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["areaId"] = areaId
	dataT["stageId"] = bigStageId
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_LEVEL_FIGHT_INFO, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUserEquipBag
--发送请求  用户背包数据
-------------------------------------------------
function f_user_info_manager:requestUserEquipBag()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_PROP_LIST, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUserEquipBag
--发送请求  用户碎片数据
-------------------------------------------------
function f_user_info_manager:requestUserPieces()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_FRAGMENT_INFO, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBuyItem
--购买道具
-------------------------------------------------
function f_user_info_manager:requestBuyItem(itemId,num)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["propId"] = itemId
	dataT["propNum"] = num
	g_game.g_netManager:send_message(g_network_message_type.CS_BUY_PROP, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUseAllItem
--使用所有道具道具
-------------------------------------------------
function f_user_info_manager:requestUseAllItem(data)
	local dataT = {}
	dataT["roleId"] =self.m_user_info["roleId"]
	dataT["propList_Num"] = 1
	dataT["propList"] = {}
	table.insert(dataT["propList"],{["propId"] =data["propId"] ,["propNum"] = data["propNum"]})
	
	g_game.g_netManager:send_message(g_network_message_type.CS_USE_PROP, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUseSelectItem
--使用指定道具 一次
-------------------------------------------------
function f_user_info_manager:requestUseSelectItem(data)
	local dataT = {}
	dataT["roleId"] =self.m_user_info["roleId"]
	dataT["propList_Num"] = 1
	dataT["propList"] = {}
	table.insert(dataT["propList"],{["propId"] =data["propId"] ,["propNum"] = 1})
	
    g_game.g_netManager:send_message(g_network_message_type.CS_USE_PROP, dataT)
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUserCombination
--请求缘分数据
-------------------------------------------------
function f_user_info_manager:requestUserCombination()
	local dataT = {}
	
	dataT["uid"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_CARD_COMBINA_INFO, dataT)
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] sendToGetVipYuanbao
-- 请求获取到玩家充值元宝数量
-------------------------------------------------
function f_user_info_manager:sendToGetVipYuanbao()
	local dataT = {}
	dataT["roleId"] =self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_VIP_INFO, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestAlterNianhao
-- 发送玩家更新年号请求
-------------------------------------------------
function f_user_info_manager:requestAlterNianhao(nianhao)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["reign"]  = nianhao
	g_game.g_netManager:send_message(g_network_message_type.CS_CHANGE_REIGN, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestMonthCard
-- 请求月卡数据
-------------------------------------------------
function f_user_info_manager:requestMonthCard()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_MONTH_CARD, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getHuangdiNianhao
-- 获得皇帝年号
-------------------------------------------------
function f_user_info_manager:getHuangdiNianhao()
	local nianhao = self.m_user_info["reign"]
	if nianhao ~= nil and nianhao ~= "" then
		return nianhao
	else
		print("error:年号为空！")
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveAlterNianhaoResult
-- 获取收到年号结果
-------------------------------------------------
function f_user_info_manager:receiveAlterNianhaoResult(msg)
	if msg["result"] == 1 then
		--关闭网络缓冲
		--修改年号信息
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_HUANGDI_NIANHAO)
	else
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestGongjizhiDuihuan
-- 发送功绩值兑换请求
-------------------------------------------------
function f_user_info_manager:requestGongjizhiDuihuan(duihuanId, duihuanNum)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["exchangeId"]  = duihuanId
	dataT["exchangeNum"]  = duihuanNum
	g_game.g_netManager:send_message(g_network_message_type.CS_EXCHANGE, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestEquipmentList
-- 获取装备列表
-------------------------------------------------
function f_user_info_manager:requestEquipmentList()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_EQUIPMENTS, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveGongjizhiDuihuanResult 
-- 获取功绩值兑换结果
-------------------------------------------------
function f_user_info_manager:receiveGongjizhiDuihuanResult(msg)
	self.exchangeResult = msg
	if msg["result"] == 0 then
		--关闭网络缓冲
		
		--发送功绩值兑换成功后的更新事件
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI_DUIHUAN)
		g_game.g_panelManager:showEffect(9)
	else
		print("数据库返回功绩值兑换失败！")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

function f_user_info_manager:getExchangeResult()
	return self.exchangeResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveServerConfigInfo 
-- 接收服务器的动态配置信息
-------------------------------------------------
function f_user_info_manager:receiveServerConfigInfo(msg)
	self.m_server_dyn_config = msg
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] beautySoundEffectIsEnable 
-- 后宫美女宠幸音效是否开启
-------------------------------------------------
function f_user_info_manager:beautySoundEffectIsEnable()
	if self.m_server_dyn_config then
		return self.m_server_dyn_config["audioEnable"] == 1
	end
	
	return false
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRecordGuidleStep
-- 记录新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestRecordGuidleStep(step)
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["guideStep"] Type:SHORT Size:2 新手引导步骤
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["guideStep"]  = step
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_GUIDE_STEP, dataT)

	self.m_user_info["guideStep"] = step
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBingfaPiece
-- 请求兵法碎片
-------------------------------------------------
function f_user_info_manager:requestBingfaPiece()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_PIECE_LIST, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangeEquip
-- 更换装备
-------------------------------------------------
function f_user_info_manager:requestChangeEquip(old, keyID, position, type)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["primaryId"]  = keyID
	dataT["battle"]  = self.m_user_info["curr_battle"]
	dataT["position"]  = position
	dataT["type"] = type
	self.m_changedEquipPosition = position
	self.m_changedOldEquip = old
	local t = self.m_equipments["equipments"]
	for i = 1, #t do
		if keyID == t[i]["primaryId"] then
			self.m_changedNewEquip = t[i]
			break  
		end
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_USE_EQUIPMENT, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUnloadEquip
-- 卸下装备
-------------------------------------------------
function f_user_info_manager:requestUnloadEquip(data, type)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["primaryId"]  = data["primaryId"]
	dataT["type"] = type
	self.m_unloadedEquip = data
	self.m_changedNewEquip = nil
	self.m_upgradeEquip = nil
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING   )
	g_game.g_netManager:send_message(g_network_message_type.CS_REMOVE_EQUIPMENT, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUpgradeEquip
-- 升级装备
-------------------------------------------------
function f_user_info_manager:requestUpgradeEquip(data)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["primaryId"]  = data["primaryId"]
	self.m_upgradeEquip = data
	self.m_changedNewEquip = nil
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_netManager:send_message(g_network_message_type.CS_EQUIPMENT_LEVEL_UP, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] responeseRecordGuidleStep
-- 接收记录新手指引步骤 返回结果
-------------------------------------------------
function f_user_info_manager:responeseRecordGuidleStep(msg)
-- 		["result"] Type:BYTE Size:1 1-成功,0-失败
	if msg["result"] == 1 then
		
	else
	
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBuzhenGuidleStep
-- 获取布阵新手指引步骤
-------------------------------------------------
function f_user_info_manager:getBuzhenGuidleStep()
	return self.m_user_info["buzhen"] == 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPieceList
-- 获取碎片列表
-------------------------------------------------
function f_user_info_manager:getPieceNumber(type, id)
	local t = nil
	if type == 1 then -- 名臣
		t = self.m_mingChenPiece
	elseif type == 2 then --美女
		t = self.m_beautyPiece
	elseif type == 3 then --装备
		t = self.m_equipmentPiece
	elseif type == 4 then --兵法
		t = self.m_bingfaPiece
	end
	for i = 1, #t do
		if t[i]["fragmentId"] == id then
			return t[i]["count"]
		end
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getPieceList
-- 获取碎片列表
-------------------------------------------------
function f_user_info_manager:getPieceList(type)
	if type == 1 then -- 名臣
		return self.m_mingChenPiece
	elseif type == 2 then --美女
		return self.m_beautyPiece
	elseif type == 3 then --装备
		return self.m_equipmentPiece
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBuzhenGuidleStepToServer
-- 向服务器更新布阵新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestBuzhenGuidleStepToServer()
-- 		["uid"] Type:INTEGER Size:4 角色ID
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_BU_ZHEN, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getHuangziGuidleStep
-- 获取第一步皇子新手指引步骤
-------------------------------------------------
function f_user_info_manager:getHuangziGuidleStep()
	return self.m_user_info["princeLevelUp"] == 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] openHuodong
-- 尝试打开活动面板
-------------------------------------------------
function f_user_info_manager:openHuodong()
	for k, v in pairs(self.m_huodongReceive) do
		if v ~= 1 then
			return
		end
	end
	
	if self.m_canRequestInBoss then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_BACK_TOWORLD_BOSS)
		self.m_canRequestInBoss = false
	end
	
	if not self.m_shouldOpenHuodong then
		self:updateHuodongFlag()
		self.m_shouldOpenHuodong = true
		return
	end
	if g_game.g_panelManager:getUiPanel("reward_panel") == nil then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_OPEN_REWARD)
	end
end

-------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] updateHuodongFlag
-------------------------------------------------------------------
function f_user_info_manager:updateHuodongFlag()
	self.m_hasHuodongFlag = self:updateSingleFlag("monthcard") or self:updateSingleFlag("wugu") or self:updateSingleFlag("level") or self:updateSingleFlag("chongzhi") 
	or self:updateSingleFlag("daily") or self:updateSingleFlag("choujiang") or self:updateSingleFlag("worldboss") or (self.m_huodongData[g_game.g_huodong_box] ~= nil and not self.m_hasClickFBox)

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_HUODONG_FLAG)
end

-------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] updateSingleFlag
-------------------------------------------------------------------
function f_user_info_manager:updateSingleFlag(btnName)
	local isShow = false
	if btnName == "monthcard" then
		if self.m_monthCardReward["hasMonthCard"] == 1 and self.m_monthCardReward["rewardMask"][self.m_monthCardReward["day"]] == 0 then
			isShow = true
		end
	elseif btnName == "worldboss" then
		local userLv = self.m_user_info["level"] 
		if userLv >= g_game.OPEN_WORLD_BOSS_LV then
			local curTime = g_game.g_gameManager:getCurrentTime()
			local t = os.date("*t",curTime)
			local time = t["hour"] * 3600 + t["min"] * 60 + t["sec"]
			
			if time >= g_game.WORLD_BOSS_START_TIME2*3600 and time < g_game.WORLD_BOSS_START_TIME2*3600 + g_game.WORLD_BOSS_LAST_TIME then
				isShow = true
			end
			
			if self.m_curWorldBossInfo ~= nil and self.m_curWorldBossInfo["hpLeft"] == 0 then
				isShow = false
			end
		else
			isShow = false
		end
	elseif btnName == "wugu" then
		local getFlag = g_game.g_userInfoManager:getRewardFlag()
		local curTime = g_game.g_utilManager:getServerTime()
		
		local rewardTimeFlag = -1
		
		if getFlag == nil then
			return
		end
		
		if curTime ~= nil then
			if curTime["hour"] >= 12 and curTime["hour"] < 14 then
				rewardTimeFlag = 1
			elseif curTime["hour"] >= 18 and curTime["hour"] < 20 then
				rewardTimeFlag = 2
			end
		end
		
		if getFlag["reward1"] == 1 and getFlag["reward2"] == 1 then
			isShow = false
		else
			if rewardTimeFlag == -1 then
				isShow = false
			else
				if rewardTimeFlag == 1 and getFlag["reward1"] == 0 then
					isShow = true
				elseif  rewardTimeFlag == 2 and getFlag["reward2"] == 0 then
					isShow = true
				else
					isShow = false
				end
			end
		end
	elseif btnName == "level" then
		isShow = g_game.g_userInfoManager:hasLevelRewrd()
	elseif btnName == "chongzhi" then
		local data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_chongzhi)
		if data == nil then
			isShow = false
		else
			isShow = data["rewardMask"] ~= data["acceptRewardMask"]
		end
	elseif btnName == "daily" then
		isShow = g_game.g_userInfoManager:hasDailyRewrd()
	elseif btnName == "choujiang" then
		local data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_choujiang)
		if data == nil then
			isShow = false
		else
			isShow = data["freeTime"] < 1
		end
	end
	return isShow
end
-------------------------------------------------
-- @function [parent=#f_user_info_manager] addPiece
-- 获得碎片
-------------------------------------------------
function f_user_info_manager:addPiece(id, num)
	local type = g_game.g_dictConfigManager:getPieceType(id)
	local t = {}
	if type == 1 then
		t = self.m_mingChenPiece
	elseif type == 2 then
		t = self.m_beautyPiece
	elseif type == 3 then
		t = self.m_equipmentPiece
	end
	for i = 1, #t do
		if t[i]["fragmentId"] == id then
			t[i]["count"] = t[i]["count"] + num
			break
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestHuangziGuidleStepToServer
-- 向服务器更新第一步皇子新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestHuangziGuidleStepToServer()
-- 		["uid"] Type:INTEGER Size:4 角色ID
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_PRINCE_LEVEL_UP, dataT)
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] getSecondHuangziGuidleStep
-- 获取第二步皇子新手指引步骤
-------------------------------------------------
function f_user_info_manager:getSecondHuangziGuidleStep()
	return self.m_user_info["princeSecLevelUp"] == 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getEliteBattleGuideStep
-- 获取支线精英副本挑战
-------------------------------------------------
function f_user_info_manager:getEliteBattleGuideStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestEliteGuideStepToServer
-- 向服务器更新精英副本指引步骤
-------------------------------------------------
function f_user_info_manager:requestEliteGuideStepToServer()
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getArr2GuideStep
-- 获取支线阵容2指引步骤
-------------------------------------------------
function f_user_info_manager:getArr2GuideStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestArr2GuideStepToServer
-- 向服务器更新阵容2指引步骤
-------------------------------------------------
function f_user_info_manager:requestArr2GuideStepToServer()
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getQiangduoGuideStep
-- 向服务器更新抢夺指引步骤
-------------------------------------------------
function f_user_info_manager:getQiangduoGuideStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getHuodongData
-- 获取活动数据
-------------------------------------------------
function f_user_info_manager:getHuodongData(type)
	return self.m_huodongData[type]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestQiangduoGuideStepToServer
-- 向服务器更新抢夺指引步骤
-------------------------------------------------
function f_user_info_manager:requestQiangduoGuideStepToServer()
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] get3StarGuideStep
-- 3星通关指引步骤
-------------------------------------------------
function f_user_info_manager:get3StarGuideStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] request3StarGuideStep
-- 3星通关指引步骤
-------------------------------------------------
function f_user_info_manager:request3StarGuideStep()
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getXuanXiuGuildStep
-- 选秀
-------------------------------------------------
function f_user_info_manager:getXuanXiuGuildStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBaogeGuildStep
-- 宝阁引导
-------------------------------------------------
function f_user_info_manager:getBaogeGuildStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getTaxGuildStep
-- 征税引导
-------------------------------------------------
function f_user_info_manager:getTaxGuildStep()
	return true
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getHechengGuideStep
-- 向服务器更新合成指引步骤
-------------------------------------------------
function f_user_info_manager:getHechengGuideStep()
	return self.m_user_info["chipMerge"] == 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestHechengGuideStep
-- 向服务器更新合成指引步骤
-------------------------------------------------
function f_user_info_manager:requestHechengGuideStep()
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestSecondHuangziGuidleStepToServer
-- 向服务器更新第二步皇子新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestSecondHuangziGuidleStepToServer()
-- 		["uid"] Type:INTEGER Size:4 角色ID
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_PRINCE_SECOND_LEVEL_UP, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getJingjichangGuidleStep
-- 获取竞技场新手指引步骤
-------------------------------------------------
function f_user_info_manager:getJingjichangGuidleStep()
	return self.m_user_info["arena"] == 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestJingjichangGuidleStepToServer
-- 向服务器更新竞技场新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestJingjichangGuidleStepToServer()
-- 		["uid"] Type:INTEGER Size:4 角色ID
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_ARENA, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] removeEquipments
-- 删除装备
-------------------------------------------------
function f_user_info_manager:removeEquipments(idList)
	local t = self.m_equipments["equipments"]
	for j = 1, #idList do
		local id = idList[j]
		for i = 1, #t do
			if t[i]["primaryId"] == id then
				table.remove(t,i)
				break
			end
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestJingjichangGuidleStepToServer
-- 向服务器更新竞技场新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestBingfaUpgrade(id, list)
-- 		["uid"] Type:INTEGER Size:4 角色ID
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["chipId"] = id
	local t = {}
	self.m_bingfaUpgradeCostList = {}
	for i = 1, #list do
		local temp = {["bingFaId"] = list[i]["primaryId"], ["cardId"] = list[i]["equip_id"]}
		table.insert(t, temp)
		table.insert(self.m_bingfaUpgradeCostList, list[i]["primaryId"])
	end
	dataT["mergeList_Num"] = #t
	dataT["mergeList"] = t
	self.m_bingfaUpgradeId = id
	g_game.g_netManager:send_message(g_network_message_type.CS_UPGRADE_BING_FA, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestSellBingfa
-- 出售兵法
-------------------------------------------------
function f_user_info_manager:requestSellBingfa(list)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	dataT["bookList_Num"] = #list
	local t = {}
	self.m_selledBingfa = {}
	for i = 1, #list do
		table.insert(t, {["id"] = list[i]["primaryId"]})
		table.insert(self.m_selledBingfa, list[i]["primaryId"])
	end
	dataT["bookList"] = t
	g_game.g_netManager:send_message(g_network_message_type.CS_BOOK_PRICE, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getZhuangbeiGuidleStep
-- 获取装备新手指引步骤
-------------------------------------------------
function f_user_info_manager:getOfficerPosition(id)
	local battleList = self:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	for i = 1, #battleList do
		if battleList[i]["id"] == id then
			return i
		end
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getZhuangbeiGuidleStep
-- 获取装备新手指引步骤
-------------------------------------------------
function f_user_info_manager:getZhuangbeiGuidleStep()
	return self.m_user_info["wearEquip"] == 0
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestZhuangbeiGuidleStepToServer
-- 向服务器更新装备新手指引步骤
-------------------------------------------------
function f_user_info_manager:requestZhuangbeiGuidleStepToServer()
-- 		["uid"] Type:INTEGER Size:4 角色ID
	local dataT = {}
	dataT["uid"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_WEAR_EQUIP, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getCurrentGuidleStep
-- 获取当前新手指引步骤
-------------------------------------------------
function f_user_info_manager:getCurrentGuidleStep()
	return self.m_user_info["guideStep"]
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getCurrentHuodong
-- 获取当前活动
-------------------------------------------------
function f_user_info_manager:getCurrentHuodong()
	return self.m_huodongList
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRecoverTime
--获取各种恢复时间
--type 1 后宫  2 国情
-------------------------------------------------
function f_user_info_manager:requestRecoverTime()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]	
	g_game.g_netManager:send_message(g_network_message_type.CS_RECOVER_LIST_REQUEST, dataT)
--	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING   )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRecoverData
--获取各种回复值
-------------------------------------------------
function f_user_info_manager:requestRecoverData()
	local dataT = {}
	dataT["roleId"]	= self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_RECOVER_STRENGTH_REQUEST, dataT)
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestGetStageReward
--请求获取关卡完美过关奖励
-------------------------------------------------
function f_user_info_manager:requestGetStageReward(areaId,stageId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["areaId"] = areaId
	dataT["stageId"] = stageId
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	g_game.g_netManager:send_message(g_network_message_type.CS_PASS_STAGE_GIFT, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveStageReward
--获取关卡完美过关奖励
-------------------------------------------------
function f_user_info_manager:receiveStageReward(msg)
	self.passStageResult = msg
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_STAGE_REWARD)
	else
		print "get pass stage result failed"
	end
end

function f_user_info_manager:getPassStageReward()
	return self.passStageResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestResetPveChallengeNum
--重置当前关卡
-------------------------------------------------
function f_user_info_manager:requestResetPveChallengeNum(levelId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["pveLevel"] = levelId
						 
	g_game.g_netManager:send_message(g_network_message_type.CS_PURCHASE_FUBEN, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveResetPveChallengeNum
--返回重置当前关卡结果
-------------------------------------------------
function f_user_info_manager:receiveResetPveChallengeNum(msg)
	self.m_buyPveNumResult = msg
	
	if msg["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_PVE_NUM_RESULT)
	elseif msg["result"] == 1 then
		g_game.g_utilManager:showMsg("关卡无效！")
	elseif msg["result"] == 2 then
		g_game.g_utilManager:showMsg("元宝不足，无法重置关卡次数")
	elseif msg["result"] == 3 then
		g_game.g_utilManager:showMsg("当前重置关卡次数达到上限")
	else
		g_game.g_utilManager:showMsg("其他错误")
	end
						 
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getChallengeNumResult
-------------------------------------------------
function f_user_info_manager:getChallengeNumResult()
	return self.m_buyPveNumResult
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBuyChallengeNumCondition
--查看当前关卡 重置需要花费的元宝  还可购买多少次
-------------------------------------------------
function f_user_info_manager:requestBuyChallengeNumCondition(levelId)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["pveLevel"] = levelId
	
	g_game.g_netManager:send_message(g_network_message_type.CS_PURCHASE_FUBEN_INFO, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestAdvanceCard
--进阶卡牌
-------------------------------------------------
function f_user_info_manager:requestAdvanceCard(data)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["cardId"] = data["officerId"]
	dataT["id"] = data["id"]
	self.m_advanceCardId = data["id"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_CARD_ADVANCED, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveChallengeNumCondition
--查看当前关卡 重置需要花费的元宝  还可购买多少次 返回
-------------------------------------------------
function f_user_info_manager:receiveChallengeNumCondition(msg)
	self.m_buyPveNumCondition = msg
	if msg["canPurchase"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_POP_BUY_PVE_NUM)
	elseif msg["canPurchase"] == 1 then
		g_game.g_utilManager:showMsg("关卡无效！")
	elseif msg["canPurchase"] == 2 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_POP_BUY_PVE_NUM)
--		g_game.g_utilManager:showMsg("元宝不足，无法重置关卡次数")
	elseif msg["canPurchase"] == 3 then
--		g_game.g_utilManager:showMsg("当前重置关卡次数达到上限")
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")	
		quickCharge:setTipString("重置关卡次数达到上限，是否前往充值？")
	else
		g_game.g_utilManager:showMsg("其他错误")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getChallengeNumCondition
-------------------------------------------------
function f_user_info_manager:getChallengeNumCondition()
	return self.m_buyPveNumCondition
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestStoryProgress
-------------------------------------------------
function f_user_info_manager:requestStoryProgress()
	local dataT = {}
	dataT["uid"]	= self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_UPDATE_FIRST_LOGIN, dataT)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] insertEquip
-------------------------------------------------
function f_user_info_manager:insertEquip(equipData)
	local temp = {}
	temp["equip_id"] = equipData["equipId"]
	temp["primaryId"] = equipData["id"]
	temp["status"] = 0
	temp["battle"] = 0
	temp["position"] = 0
	temp["equip_level"] = 1
	table.insert(self.m_equipments["equipments"], temp)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getBingfaList
-- 获取兵法列表 返回所有兵法和未装备的兵法
-------------------------------------------------
function f_user_info_manager:getBingfaList()
	local all = {}
	local unequip = {}
	local t = self.m_equipments["equipments"]
	for i = 1, #t do
		local type = g_game.g_dictConfigManager:getEquipType(t[i]["equip_id"])
		if type == 3 or type == 4 or type == 5 then
			table.insert(all, t[i])
			if t[i]["status"] == 0 then
				table.insert(unequip, t[i])
			end
		end
	end
	return all, unequip
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] insertProp
-------------------------------------------------
function f_user_info_manager:insertProp(propData)
	local propList = self.m_userEquipBagData["propList"]
	local isRepeat = false
	for i = 1, #propList do
		if propList[i]["propId"] == propData["propId"] then
			propList[i]["propNum"] = propList[i]["propNum"] + 1
			isRepeat = true
			break
		end
	end
	
	if isRepeat == false then
		table.insert(propList, {["propId"] = propData["propId"], ["propNum"] = 1})
	end
	self.m_userEquipBagData["propList_Num"] = #propList
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] hasFiveLevelPrince
-- 判断玩家当前是否有5级皇子
-------------------------------------------------
function f_user_info_manager:hasFiveLevelPrince()
	local unbattleList = self.m_princeData["unbattleList"]
	for i = 1, #unbattleList do		
		if unbattleList[i]["princeLevel"] >= 5 then
			return true
		end
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestGetVipPack
-- 请求当前vip礼包
-------------------------------------------------
function f_user_info_manager:requestGetVipPack(vipLv)
	local dataT = {}
	dataT["roleId"]	= self.m_user_info["roleId"]
	dataT["vip_level"] = vipLv
	g_game.g_netManager:send_message(g_network_message_type.CS_BUY_VIP_PACKAGE, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveVipPack
-- 请求当前vip礼包
-------------------------------------------------
function f_user_info_manager:receiveVipPack(msg)
	self.m_vipPack = msg
	
	if self.m_vipPack["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GET_VIP_PACK)
	elseif self.m_vipPack["result"] == 1 then
		g_game.g_utilManager:showMsg("vip等级不够，充值后可快速提升vip等级哦！")
	elseif self.m_vipPack["result"] == 2 then
		g_game.g_utilManager:showMsg("该礼包已购买过,不能重复购买")
	elseif self.m_vipPack["result"] == 3 then
		g_game.g_utilManager:showMsg("元宝不足")
	else
		g_game.g_utilManager:showMsg("未知错误")
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] getVipPackResult
-- vip界面领取vip礼包的结果
-------------------------------------------------
function f_user_info_manager:getVipPackResult()
	return self.m_vipPack
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestLianHuaShop
-- 祭天商店列表
-------------------------------------------------
function f_user_info_manager:requestLianHuaShop(isRefresh)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	if isRefresh then
		dataT["type"] = 1
	else
		dataT["type"] = 0
	end
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_JITIAN_SHOP_INFO, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestRankShop
-- 积分商店列表
-------------------------------------------------
function f_user_info_manager:requestRankShop(isRefresh)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	if isRefresh then
		dataT["refresh"] = 1
	else
		dataT["refresh"] = 0
	end

	g_game.g_netManager:send_message(g_network_message_type.CS_CHOUJIANG_SHOP, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestUseVipPack
-- 请求使用vip礼包
-------------------------------------------------
function f_user_info_manager:requestUseVipPack(data)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
 	dataT["propId"] =data["propId"]
	dataT["propNum"] =data["propNum"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_USE_PROP_PACKAGE, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveUseVipPack
-- 返回vip礼包的使用结果
-------------------------------------------------
function f_user_info_manager:receiveUseVipPack(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	self.m_vipPackUseResult = msg
	
	if self.m_vipPackUseResult["result"] == 0 then
		self:updateVipPackToBag()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_USE_VIP_PACK)
	else
		g_game.g_utilManager:showMsg("vip礼包使用失败")
	end
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] updateVipPackToBag
--使用vip礼包后，vip礼包物品内入库
--1-普通道具，2-美女卡牌道具，3-名臣卡牌道具  4-元宝，5-银两，6-装备，7-vip元宝
-------------------------------------------------
function f_user_info_manager:updateVipPackToBag()
	local dataNum = self.m_vipPackUseResult["propList_Num"]
	local dataList = self.m_vipPackUseResult["propList"]
	
	self:updatePackToUser(dataNum,dataList)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] updatePackToUser
-- 用于各种礼包奖励
-------------------------------------------------
function f_user_info_manager:updatePackToUser(dataNum,dataList)
	for i = 1 , dataNum do
		if dataList[i]["type"] == 1 then
			local propList = self.m_userEquipBagData["propList"]
			local isRepeat = false
			for j = 1, #propList do
				if propList[j]["propId"] == dataList[i]["id"] then
					propList[j]["propNum"] =  dataList[i]["num"]
					isRepeat = true
					break
				end
			end
	
			if isRepeat == false then
				table.insert(propList, {["propId"] = dataList[i]["id"], ["propNum"] = dataList[i]["num"]})
			end
			self.m_userEquipBagData["propList_Num"] = #propList
		
		elseif dataList[i]["type"] == 2 then
			for j = 1, dataList[i]["num"] do
				self:addEmptyCard(2, dataList[i]["id"], dataList[i]["primaryId"],1)
			end
		elseif dataList[i]["type"] == 3 then
			for j = 1, dataList[i]["num"] do
				self:addEmptyCard(3, dataList[i]["id"], dataList[i]["primaryId"],1)
			end
		elseif dataList[i]["type"] == 4 or dataList[i]["type"] == 7 then
			self:updateUserGold(dataList[i]["num"])
		elseif dataList[i]["type"] == 5 then
			self:updateUserSilver(dataList[i]["num"])
		elseif dataList[i]["type"] == 6 then
			for j = 1,dataList[i]["num"] do
				self:addEmptyCard(6, dataList[i]["id"], dataList[i]["primaryId"],1)
			end
		end
	end
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChoujiang
-- 请求抽奖
-------------------------------------------------
function f_user_info_manager:requestChoujiang(times)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["times"] = times
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	self.m_isChoujiangFree = false
	if times == 1 and self.m_huodongData[g_game.g_huodong_choujiang]["freeTime"] < 1  then
		self.m_isChoujiangFree = true
	end
	g_game.g_netManager:send_message(g_network_message_type.CS_CHOUJIANG, dataT)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBuyLianhuaItem
-- 请求兑换炼化商品
-------------------------------------------------
function f_user_info_manager:requestBuyLianhuaItem(index)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["index"] = index
	self.m_lianHuaShopBuyIndex = index
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	g_game.g_netManager:send_message(g_network_message_type.CS_JITIAN_SHOP_BUY, dataT)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBuyRankItem
-- 请求兑换积分礼物
-------------------------------------------------
function f_user_info_manager:requestBuyRankItem(index)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["index"] = index
	self.m_rankShopBuyIndex = index
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
	g_game.g_netManager:send_message(g_network_message_type.CS_CHOUJIANG_SHOP_BUY, dataT)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestHuodongList
-- 请求活动列表
-------------------------------------------------
function f_user_info_manager:requestHuodongList()
	
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_HUODONG_INFO, dataT)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestStrengthReward
-- 请求定点活动
-------------------------------------------------
function f_user_info_manager:requestStrengthReward(index)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["num"] = index
	
	g_game.g_netManager:send_message(g_network_message_type.CS_USE_STRENGTH_REWARD, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveStrengthReward
-- 接受定点活动结果
-------------------------------------------------
function f_user_info_manager:receiveStrengthReward(msg)
	self.m_strengthReward = msg
	
	if self.m_strengthReward["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_GET_RESULT_FLAG)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG)
	elseif self.m_strengthReward["result"] == 1 then
		g_game.g_utilManager:showMsg("活动时间未到")
	elseif self.m_strengthReward["result"] == 2 then
		g_game.g_utilManager:showMsg("活动已经过期")
	elseif self.m_strengthReward["result"] == 3 then
		g_game.g_utilManager:showMsg("已经领取过此活动奖励")
	else
		g_game.g_utilManager:showMsg("未知错误")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

function f_user_info_manager:getStrengthReward()
	return self.m_strengthReward 
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] getRewardFlag
-- 定点活动  奖励领取标记
-------------------------------------------------
function f_user_info_manager:getRewardFlag()
	return self.m_todayRewardFlag
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestAskTax
-- 征税
-------------------------------------------------
function f_user_info_manager:requestAskTax()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_TEX, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPvpLeaderboard
-- 请求pvp排行榜
-------------------------------------------------
function f_user_info_manager:requestPvpLeaderboard(startIndex)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["startIndex"] = startIndex - 1
	dataT["num"] = 20
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_PVP_RANK_LIST, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestPvpLeaderboard
-- 请求pvp排行榜
-------------------------------------------------
function f_user_info_manager:requestLevelRankLeaderboard(startIndex)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["startIndex"] = startIndex - 1
	dataT["num"] = 20
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_PVE_LEVEL_LIST, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveAskTaxResult
-- 征税结果
-------------------------------------------------
function f_user_info_manager:receiveAskTaxResult(msg)
	self.m_askTaxResult = msg
	
	if self.m_askTaxResult["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ASK_TAX)
	elseif self.m_askTaxResult["result"] == 1 then
		g_game.g_utilManager:showMsg("征税次数不足")
	elseif self.m_askTaxResult["result"] == 2 then
		g_game.g_utilManager:showMsg("元宝不足")
	else
		g_game.g_utilManager:showMsg("其他错误")
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] getTaxResult
-- 返回征税结果
-------------------------------------------------
function f_user_info_manager:getTaxResult()
	return self.m_askTaxResult
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] getFirstChargeFlag
-- 首冲奖励标记
-------------------------------------------------
function f_user_info_manager:getFirstChargeFlag()
	return self.m_isFirstCharge
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveFirstChargeFlag
--接收 首冲结果
-------------------------------------------------
function f_user_info_manager:receiveFirstChargeFlag(msg)
	self.m_isFirstCharge = msg
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG)

end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestFirstChargeFlag
--请求是否有首冲奖励
-------------------------------------------------
function f_user_info_manager:requestFirstChargeFlag()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_CHARGE_REWARD_INFO, dataT)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestGetFirstChargReward
--请求获取 首次充值奖励列表
-------------------------------------------------
function f_user_info_manager:requestGetFirstChargReward()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_USE_CHARGE_REWARD, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestXunfang
--请求寻访
-------------------------------------------------
function f_user_info_manager:requestXunfang(index, item, cost)
	local dataT = {}
	self.m_xunfangCost = cost
	self.m_xunfangItem = item
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["level"] = index
	g_game.g_netManager:send_message(g_network_message_type.CS_VISIT, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveGetFirstChargReward
--获取 首次充值奖励列表
-------------------------------------------------
function f_user_info_manager:receiveGetFirstChargReward(msg)
	self.m_firstChargeReward = msg
	
	if self.m_firstChargeReward["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE)
	else
		g_game.g_utilManager:showMsg("获取失败")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] getFirstChargReward
--返回 首次充值奖励列表
-------------------------------------------------
function f_user_info_manager:getFirstChargReward()
	return self.m_firstChargeReward
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] setMovingMsg
--设置走马灯消息内容
--dataT = {
--	 ["messageiList_Num"] -- 推送的消息数目
-- 	 ["messageiList"] --走马灯消息列表
--   {
--   	["content"] String 内容
--	 	["count"] Byte 显示滚动次数
--   }
--}
-------------------------------------------------
function f_user_info_manager:setMovingMsg(msg)
	if msg == nil then
		return
	end
	--缓存消息超过100条不继续缓存
	if #self.m_userMovingMsg > g_game.MAX_MOVING_MSG_NUM then
		return
	end

	for i = 1, msg["messageiList_Num"] do
		table.insert(self.m_userMovingMsg,msg["messageiList"][i])
	end
	g_game.g_utilManager:showMovingMsg()
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] getMovingMsg
------------------------------------------------
function f_user_info_manager:getMovingMsg()
	return self.m_userMovingMsg
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChoujiangRank
-- 请求排行榜
------------------------------------------------
function f_user_info_manager:requestChoujiangRank()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_CHOUJIANG_RANK, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChangeBattleArr
-- 更换当前阵容
------------------------------------------------
function f_user_info_manager:requestChangeBattleArr()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_CHANGE_BATTLE, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveChangeBattleArr
------------------------------------------------
function f_user_info_manager:receiveChangeBattleArr(msg)
	if msg["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CHANGE_BATTLE_ARR)
	else
		g_game.g_utilManager:showMsg("切换阵容失败")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBattleArr2FirstCard
------------------------------------------------
function f_user_info_manager:requestBattleArr2FirstCard()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_SEC_BATTLE_CARD, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveBattleArr2FirstCard
------------------------------------------------
function f_user_info_manager:receiveBattleArr2FirstCard(msg)
	self.battleArr2Card = msg
	if msg["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UP_CARD_TO_ARR2)
	else 
		g_game.g_utilManager:showMsg("当前阵容2无卡牌")	
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING )
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] recoverBeautyIntimacy
-- 从本地表中恢复美女兴趣点
-------------------------------------------------
function f_user_info_manager:recoverBeautyIntimacy(intimacy)
	if self.m_beautiArrList ~= nil then
		local battleList_Num = self.m_beautiArrList["battleList_Num"]
		if battleList_Num ~= nil and battleList_Num > 0 then
			for i=1,battleList_Num do
				local beautyInfo = self.m_beautiArrList["battleList"][i]
				beautyInfo["beautyIntimacy"] = intimacy
			end
		end
		
		local unbattleList_Num = self.m_beautiArrList["unbattleList_Num"]
		if unbattleList_Num ~= nil and unbattleList_Num > 0 then
			for i=1,unbattleList_Num do
				local beautyInfo = self.m_beautiArrList["unbattleList"][i]
				beautyInfo["beautyIntimacy"] = intimacy
			end
		end
	end
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestReplay
-- 获取战斗回放
-------------------------------------------------
function f_user_info_manager:requestReplay(mailId, name)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["mailId"] = mailId
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_PVP_FIGHT_DATA, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	self.m_pveBattleData["areaId"] = 1
	self.m_pveBattleData["stageId"] = 1
	self.m_pveBattleData["levelId"] = 1
	self.m_pveBattleData["battleType"] = g_game.g_f_battle_type.BATTLE_TYPE_REPLAY
	self.m_pveBattleData["enemyReplayName"] = name
	self.m_pveBattleData["levelInfo"] = g_game.g_dictConfigManager:getLevelInfo(1)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestFortuneBox
-- 获取福袋信息
-------------------------------------------------
function f_user_info_manager:requestFortuneBox()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_FORTUNE_BOX, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end


-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestBuyFortuneBox
-- 购买福袋
-------------------------------------------------
function f_user_info_manager:requestBuyFortuneBox(index)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["index"] = index
	self.m_boxIndex = index
	
	g_game.g_netManager:send_message(g_network_message_type.CS_BUY_FORTUNE_BOX, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestQiandaoInfo
-- 获取签到信息
-------------------------------------------------
function f_user_info_manager:requestQiandaoInfo()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_CHARGE_CHECKIN_INFO, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestChoujiangInfo
-- 获取抽奖信息
-------------------------------------------------
function f_user_info_manager:requestChoujiangInfo()
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	
	g_game.g_netManager:send_message(g_network_message_type.CS_CHOUJIANG_INFO, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] recoverPvpChallengeNum
-- 从本地表中恢复pvp挑战次数
-------------------------------------------------
function f_user_info_manager:recoverPvpChallengeNum(num)
	if self.m_userPvpRank ~= nil then
		self.m_userPvpRank["challengeNum"] = num
	end
	
	if self.m_user_info ~= nil then
		self.m_user_info["challengeNum"] = num
	end
end

function f_user_info_manager:recoverRewardFlag()
	if self.m_todayRewardFlag ~= nil then
		self.m_todayRewardFlag["reward1"] = 0
		self.m_todayRewardFlag["reward2"] = 0
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] recoverKejuXuanxiuNum
-- 回复 乡选 抽卡免费次数
-------------------------------------------------
function f_user_info_manager:recoverKejuXuanxiuNum(num)
	if self.m_xuanxiu_info ~= nil then
		self.m_xuanxiu_info[1]["count"] = num
	end
	
	if self.m_keju_info ~= nil then
		self.m_keju_info[1]["count"] = num
	end
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestExchangeReward
--请求兑换码
-------------------------------------------------
function f_user_info_manager:requestExchangeReward(reward_code)
	if reward_code == "" then
		g_game.g_utilManager:showMsg("兑换码不存在，请重新输入")
	else
		local dataT = {}
		dataT["roleId"] = self.m_user_info["roleId"]
		dataT["exchange_code"] = reward_code
		
		g_game.g_netManager:send_message(g_network_message_type.CS_USE_EXCHANGE_CODE, dataT)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	end
	
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveExchangeReward
--获得兑换奖励
-------------------------------------------------
function f_user_info_manager:receiveExchangeReward(msg)
	self.m_exchangeCodeReward = msg
	if msg["result"] == 0 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_EXCHANGE_REWARD)
	elseif msg["result"] == 1 or msg["result"] == 2 then
		g_game.g_utilManager:showMsg("该兑换码无效，请重新输入")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

function f_user_info_manager:getExchangeReward()
	return self.m_exchangeCodeReward
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestLianhua
--请求祭天
-------------------------------------------------
function f_user_info_manager:requestLianhua(list, type)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["type"] = type
	dataT["cardList_Num"] = #list
	dataT["cardList"] = list
	
	self.m_lianhuaList = list
	self.m_lianhuaType = type
	
	g_game.g_netManager:send_message(g_network_message_type.CS_CARD_JITIAN, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] requestSaodang
--请求扫荡
-------------------------------------------------
function f_user_info_manager:requestSaodang(areaid,stageid,levelid,times)
	local dataT = {}
	dataT["roleId"] = self.m_user_info["roleId"]
	dataT["areaId"] = areaid
	dataT["stageId"] = stageid
	dataT["level"] = levelid
	dataT["sweepCount"] = times
	
	g_game.g_netManager:send_message(g_network_message_type.CS_LEVEL_SWEEP, dataT)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
end


-- 服务器返回-------绑定账户
function f_user_info_manager:rBindAccountHandler( msg )
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then
		g_game.g_utilManager:showMsg("綁定成功")
		send_lua_event(g_game.g_f_lua_game_event.F_SDK_BIND_ACCOUNT)
	else
		g_game.g_utilManager:showMsg("綁定失敗")
	end
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] receiveSaoDang
-------------------------------------------------
function f_user_info_manager:receiveSaoDang(msg)
	self.m_saodang_result = msg
	if self.m_saodang_result["result"] == 1 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE)
	else
		g_game.g_utilManager:showMsg("扫荡失败")
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] getSaodangResult
-------------------------------------------------
function f_user_info_manager:getSaodangResult()
	return self.m_saodang_result
end

---------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] getTujianOfficerTable
---------------------------------------------------------------------
function f_user_info_manager:getTujianOfficerTable()
	return self.m_officer_tujian_table
end

---------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] getTujianBeautyTable
---------------------------------------------------------------------
function f_user_info_manager:getTujianBeautyTable()
	return self.m_beauty_tujian_table
end

---------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] getTujianEquipTable
---------------------------------------------------------------------
function f_user_info_manager:getTujianEquipTable()
	return self.m_equip_tujian_table
end

---------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] getTujianBingfaTable
---------------------------------------------------------------------
function f_user_info_manager:getTujianBingfaTable()
	return self.m_bingfa_tujian_table
end

---------------------------------------------------------------------
-- @function [parent=#f_user_info_manager] getMonthCardReward
---------------------------------------------------------------------
function f_user_info_manager:getMonthCardReward()
	return self.m_monthCardReward
end

-------------------------------------------------
-- @function [parent=#f_user_info_manager] setMonthCardRewardMask
-------------------------------------------------
function f_user_info_manager:setMonthCardRewardMask(index, maskVal)
	self.m_monthCardReward["rewardMask"][index] = maskVal
end

return f_user_info_manager