require("scripts.auto.auto_saodang_result_popup")
require("scripts.game.main.shangcheng.f_vip_package_item")
--[[--
扫荡结果弹出
--]]--
f_saodang_result_popup = class("f_saodang_result_popup")
f_saodang_result_popup.__index = f_saodang_result_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_saodang_result_popup.static_create()
							 
	local skillInfoTable = createsaodang_result_popup()
	local skillInfo = skillInfoTable["saodang_result_popup"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_saodang_result_popup)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_saodang_result_popup:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.sweepAnim = nil
	self.m_items = {}
	
	self.STATE_SWEEP_INIT = 0
	self.STATE_SWEEPING  = 1
	self.STATE_SHOW_REWARD = 2
	self.STATE_GET_REWARD = 3
	self.STATE_NONE = 4
	self.m_state = self.STATE_NONE
end


-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_saodang_result_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_saodang_result_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_saodang_result_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] onEnter
-------------------------------------------------------------------------------
function f_saodang_result_popup:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_SWEEP[1])
	
	self:initAllComponent()
	
	self:setState(self.STATE_SWEEP_INIT)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] onEnter
-------------------------------------------------------------------------------
function f_saodang_result_popup:setState(state)
	if self.m_state == state then
		return
	end
	self.m_state = state
	
	self:updateState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] updateState
-------------------------------------------------------------------------------
function f_saodang_result_popup:updateState()
	if self.m_state == self.STATE_SWEEP_INIT then
		local saodangResult = g_game.g_userInfoManager:getSaodangResult()
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		local addSilver = saodangResult["silver"] - userInfo["silver"]
		self.m_componentTable["sr_yinliang_num"]:setString(addSilver)
		self.m_componentTable["sr_exp_num"]:setString(saodangResult["obtainExp"])
		
		self:fillRewardList()
		self:setComponentsVisible(false)
		
		self:setState(self.STATE_SWEEPING)
	elseif self.m_state == self.STATE_SWEEPING then
		
		local goToNext = function()
			self:setState(self.STATE_SHOW_REWARD)
		end
		
		self.sweepAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.sweepAnim)
		self.sweepAnim:setAnchorPoint(cc.p(0,0))
		self.sweepAnim:setPositionInContainer(cc.p(480, 308))
		self.sweepAnim:runAnimation(g_game.g_f_main_ui_effect.UI_SWEEP[2], g_game.g_f_main_ui_effect.UI_SWEEP[3])
		self.sweepAnim:registeAnimationFinishCallback(goToNext)
	elseif self.m_state == self.STATE_SHOW_REWARD then
		self.sweepAnim:setVisible(false)
		self:setComponentsVisible(true)
		local goToNext = function()
			self:setState(self.STATE_GET_REWARD)
		end
		
		g_game.g_director:setProjection(0)
		for i = 1, #self.m_items do
			local delayTime = cc.DelayTime:create(0.15*i)
			local actionIconIn  = nil
			if i == #self.m_items then
				actionIconIn = g_game.g_transition.sequence({delayTime,CCShow:create(),cc.OrbitCamera:create(0.2, 1, 0, 90, 270, 0, 0),cc.DelayTime:create(0.2),CCCallFunc:create(goToNext)})		
			else
				actionIconIn = g_game.g_transition.sequence({delayTime,CCShow:create(),cc.OrbitCamera:create(0.2, 1, 0, 90, 270, 0, 0)})		
			end
			self.m_items[i]:runAction(actionIconIn)
		end
	elseif self.m_state == self.STATE_GET_REWARD then
		
		for i = 1, #self.m_items do
			self.m_items[i]:setLabelVisible(true)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] setComponentsVisible
-------------------------------------------------------------------------------
function f_saodang_result_popup:setComponentsVisible(b)
	self.m_componentTable["sr_title_zi"]:setVisible(b)
	self.m_componentTable["sr_yuanbao"]:setVisible(b)
	self.m_componentTable["sr_label_di2"]:setVisible(b)
	self.m_componentTable["sr_label_di"]:setVisible(b)
	self.m_componentTable["sr_exp"]:setVisible(b)
	self.m_componentTable["sr_exp_num"]:setVisible(b)
	self.m_componentTable["sr_yinliang_num"]:setVisible(b)
	
	if b == true then
		self.m_componentTable["sr_queding_btn"]:setButtonState(2)	
	else
		self.m_componentTable["sr_queding_btn"]:setButtonState(8)	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] fillRewardList
-------------------------------------------------------------------------------
function f_saodang_result_popup:fillRewardList()
	local rewardList = g_game.g_userInfoManager:getSaodangResult()["rewardList"]
	
	self.m_items = {}
	
	--1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
	
	local rewardTable = {}
	for i = 1,#rewardList do
		table.insert(rewardTable,{[3] = rewardList[i]["type "],[4] = rewardList[i]["id"],[5] = 1})
	end

	for j = 1, #rewardTable do
		local item = f_vip_package_item.static_create()
	    item:panelInitBeforePopup()
		item:setData(rewardTable[j])
		item:setScale(0.9)
		self:appendComponent(item)
		item:setLabelVisible(false)
		
		if j <= 5 then
			item:setPositionInContainer(cc.p(155+j*108,246))
		else
			item:setPositionInContainer(cc.p(155+(j-5)*108,246+143))
		end
		
		table.insert(self.m_items,item)
		
		item:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] onExit
-------------------------------------------------------------------------------
function f_saodang_result_popup:onExit()
	self:unregisterNodeEvent()
	if self.sweepAnim ~= nil then
		self:deleteComponent(self.sweepAnim)
	end
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_SWEEP[1])
	
	g_game.g_director:setProjection(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_saodang_result_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_saodang_result_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] onCleanup
-------------------------------------------------------------------------------
function f_saodang_result_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_saodang_result_popup:initAllComponent()
	local shouxia = function()
		if self.m_state == self.STATE_GET_REWARD then
			self:getSaodangReward()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["sr_queding_btn"]:addHandleOfcomponentEvent(shouxia, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_saodang_result_popup] getSaodangReward
-------------------------------------------------------------------------------
function f_saodang_result_popup:getSaodangReward()
	g_game.g_panelManager:removeUiPanel("saodang_result")
	
	local saodangResult = g_game.g_userInfoManager:getSaodangResult()
	
	local rewardList = saodangResult["rewardList"]
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	--1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
	for i = 1, #rewardList do
		if rewardList[i]["type "] == 1 then
			--道具要返回 该道具当前的 总数目 而不是增量
			g_game.g_userInfoManager:insertProp({["propId"] = rewardList[i]["id"] })
		elseif rewardList[i]["type "] == 2 then
			g_game.g_userInfoManager:addEmptyCard(2,rewardList[i]["id"],
				rewardList[i]["primaryId"],1)
		elseif rewardList[i]["type "] == 3 then
			g_game.g_userInfoManager:addEmptyCard(3,rewardList[i]["id"],
				rewardList[i]["primaryId"],1)
		elseif rewardList[i]["type "] == 4 then
			userInfo["gold"] = userInfo["gold"] +rewardList[i]["value"]
		elseif rewardList[i]["type "] == 5 then
			userInfo["silver"] = userInfo["silver"] +rewardList[i]["value"]
		elseif rewardList[i]["type "] == 6 then
			g_game.g_userInfoManager:addEmptyCard(6,rewardList[i]["id"],
				rewardList[i]["primaryId"],1)
		elseif rewardList[i]["type "] == 7 then
			vipInfo["gold"] = vipInfo["gold"] + rewardList[i]["value"]
			g_game.g_userInfoManager:setUserChongzhiYuanbao(vipInfo["gold"])
		elseif rewardList[i]["type "] == 8 then
			g_game.g_userInfoManager:addEmptyCard(8,0,
				0,rewardList[i]["value"])
		elseif rewardList[i]["type "] == 9 or rewardList[i]["type "] == 10 or 
			rewardList[i]["type "] == 11 or rewardList[i]["type "] == 12 or rewardList[i]["type "] == 13 then
			
			local type = g_game.g_dictConfigManager:getPieceType(rewardList[i]["id"])
			g_game.g_userInfoManager:insertPieceToTable(type + 9,rewardList[i]["id"])
		end
	end
	
	if saodangResult["levelUp"] == 1 then
		require("scripts.game.battle.layout.f_battle_emperor_lvup")
		local isOpenPosition = g_game.g_dictConfigManager:isOpenPosition(userInfo["level"], saodangResult["currLevel"])
		local emperorlvupBoard = f_battle_emperor_lvup.static_create()
		emperorlvupBoard:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(emperorlvupBoard,"pve_emperor_lvup")
		emperorlvupBoard:setSaoDangPosType(isOpenPosition, saodangResult["currLevel"], saodangResult["strength"], saodangResult["military"], saodangResult["energy"])
	end
	
	userInfo["level"] = saodangResult["currLevel"]
	userInfo["exp"] = saodangResult["emperorExp"]
	userInfo["silver"] = saodangResult["silver"]
	userInfo["energy"] = saodangResult["energy"]
	userInfo["strength"] = saodangResult["strength"]
	userInfo["military"] = saodangResult["military"]
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end


