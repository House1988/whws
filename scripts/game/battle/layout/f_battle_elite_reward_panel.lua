require("scripts.auto.auto_mailAttachment")
require("scripts.auto.auto_attachmentItem")
require("scripts.game.battle.layout.f_battle_emperor_lvup")
--[[--
精英副本弹出面板
--]]--

f_battle_elite_reward_panel = class("f_battle_elite_reward_panel")
f_battle_elite_reward_panel.__index = f_battle_elite_reward_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel.static_create()
	local rewardTable = createmailAttachment()
	local reward = rewardTable["mailAttachment"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_battle_elite_reward_panel)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_list = nil
	self.m_battle_manager = nil
	self.m_shining = nil
end

function f_battle_elite_reward_panel:setBattleManager(manager)
	self.m_battle_manager = manager
end


function f_battle_elite_reward_panel:fillList()
	local beautyRewardArr = self.m_battle_manager.m_battle_data["roundData"]["beautyReward"]
	local officerRewardArr = self.m_battle_manager.m_battle_data["roundData"]["officerReward"]
	local equipRewardArr = self.m_battle_manager.m_battle_data["roundData"]["equipReward"]
	local chipRewardArr = self.m_battle_manager.m_battle_data["roundData"]["chipReward"]
	local propRewardArr = self.m_battle_manager.m_battle_data["roundData"]["propReward"]

	local rewardTable = {}
	--1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
	if beautyRewardArr ~= nil then
		for i = 1,#beautyRewardArr do
			table.insert(rewardTable,{["type"] = 2,["showId"] = beautyRewardArr[i]["beautyId"]})
		end
	end
	
	if officerRewardArr ~= nil then
		for i = 1,#officerRewardArr do
			table.insert(rewardTable,{["type"] = 3,["showId"] = officerRewardArr[i]["officerId"]})
		end
	end
	
	if equipRewardArr ~= nil then
		for i = 1,#equipRewardArr do
			table.insert(rewardTable,{["type"] = 6,["showId"] = equipRewardArr[i]["equipId"]})
		end
	end
	
	if chipRewardArr ~= nil then
		for i = 1,#chipRewardArr do
			table.insert(rewardTable,{["type"] = chipRewardArr[i]["type"]+9,["showId"] = chipRewardArr[i]["chipId"]})
		end
	end
	
	if propRewardArr ~= nil then
		for i = 1,#propRewardArr do
			table.insert(rewardTable,{["type"] = 1,["showId"] = propRewardArr[i]["propId"]})
		end
	end
	
	for j = 1, #rewardTable do
		if rewardTable[j]["showId"] ~= 0 then
			local item = require("scripts.game.battle.layout.f_battle_elite_reward_item").new()
			self.m_list:appendComponent(item)
			item:setData(rewardTable[j])
		end
	end
	
end

function f_battle_elite_reward_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_elite_reward_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] onEnter
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:onEnter()
	self.m_shining =  g_game.g_classFactory.newFLuaAnimationComponent("FAC")
  	self:appendComponent(self.m_shining)
	self.m_shining:setPositionInContainer(cc.p(960/2, 640/2))
	self.m_shining:setAnimationScale(1.0)
	self.m_shining:setLoop(true)
	self.m_shining:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[4])
	self.m_shining:setComponentZOrder(1)
	self.m_componentTable["mailAttackmentBottom"]:setComponentZOrder(2)

	self.m_componentTable["title_label"]:setVisible(false)
	self.m_componentTable["close_btn"]:setVisible(false)
	self.m_componentTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_list = fc.FContainerList:create(2)
	self:appendComponent(self.m_list)
	self.m_list:setSize(cc.size(376, 210))
	self.m_list:setAnchorPoint(cc.p(0.5,0.5))
	self.m_list:setPositionInContainer(cc.p(479, 322))
	self.m_list:setStopTouchEvent(true) 
	self.m_list:enableClipping(true)
	self.m_list:setComponentZOrder(3)
	
	self.m_list:setListInfo(10, 0, 3, 150, 200);
	
	self:fillList()
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] onExit
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] onCleanup
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_elite_reward_panel:initAllComponent()
	local getReward = function()
		if  self.m_battle_manager.m_battle_data["roundData"]["levelUp"] == 1 then
			local preLv = g_game.g_userInfoManager:getLevel()
			local curLv = self.m_battle_manager.m_battle_data["roundData"]["currLevel"]
			local isOpenPosition = g_game.g_dictConfigManager:isOpenPosition(preLv,curLv)
			--1 名臣 2美女 3皇子 0没有开启位置
			self:setVisible(false)
		
			local emperorlvupBoard = f_battle_emperor_lvup.static_create()
		    emperorlvupBoard:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(emperorlvupBoard,"pve_emperor_lvup")
			emperorlvupBoard:setBattleManager(self.m_battle_manager)
			emperorlvupBoard:setOpenPosType(isOpenPosition)
			
		else
			self.m_battle_manager:requestLevelUp()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(getReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local closeCallback = function()
		g_game.g_panelManager:removeUiPanel("mail_attachment")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(closeCallback,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end


