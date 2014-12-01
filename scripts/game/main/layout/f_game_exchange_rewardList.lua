require("scripts.auto.auto_mailAttachment")
require("scripts.auto.auto_attachmentItem")
--[[--
兑换码弹出界面
--]]--

f_game_exchange_rewardList = class("f_game_exchange_rewardList")
f_game_exchange_rewardList.__index = f_game_exchange_rewardList

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_exchange_rewardList.static_create()
	local rewardTable = createmailAttachment()
	local reward = rewardTable["mailAttachment"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_game_exchange_rewardList)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_list = nil
end

function f_game_exchange_rewardList:fillList()
	local rewardList = g_game.g_userInfoManager:getExchangeReward()["rewardList"]
	
	--1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
	
	local rewardTable = {}
	for i = 1,#rewardList do
		table.insert(rewardTable,{["type"] = rewardList[i]["type"],["showId"] = rewardList[i]["id"],["num"] = rewardList[i]["value"]})
	end

	for j = 1, #rewardTable do
		local item = require("scripts.game.main.layout.f_game_exchange_reward_item").new()
		self.m_list:appendComponent(item)
		item:setData(rewardTable[j])
	end
	
end

function f_game_exchange_rewardList:registerNodeEvent(handler)
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
-- @function [parent=#f_game_exchange_rewardList] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] onEnter
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:onEnter()
	self.m_componentTable["title_label"]:setVisible(false)
	self.m_componentTable["close_btn"]:setVisible(false)
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
-- @function [parent=#f_game_exchange_rewardList] onExit
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] onCleanup
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:initAllComponent()
	local getReward = function()
		self:getReward()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(getReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_exchange_rewardList] getReward
-------------------------------------------------------------------------------
function f_game_exchange_rewardList:getReward()
	g_game.g_panelManager:removeUiPanel("mail_attachment")
	
	local rewardList = g_game.g_userInfoManager:getExchangeReward()["rewardList"]
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	--1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
	for i = 1, #rewardList do
		if rewardList[i]["type"] == 1 then
			--道具要返回 该道具当前的 总数目 而不是增量
			g_game.g_userInfoManager:addEmptyCard(1, rewardList[i]["id"],rewardList[i]["primaryId"], rewardList[i]["value"])
		elseif rewardList[i]["type"] == 2 then
			g_game.g_userInfoManager:addEmptyCard(2,rewardList[i]["id"],
				rewardList[i]["primaryId"],1)
		elseif rewardList[i]["type"] == 3 then
			g_game.g_userInfoManager:addEmptyCard(3,rewardList[i]["id"],
				rewardList[i]["primaryId"],1)
		elseif rewardList[i]["type"] == 4 then
			userInfo["gold"] = userInfo["gold"] +rewardList[i]["value"]
		elseif rewardList[i]["type"] == 5 then
			userInfo["silver"] = userInfo["silver"] +rewardList[i]["value"]
		elseif rewardList[i]["type"] == 6 then
			g_game.g_userInfoManager:addEmptyCard(6,rewardList[i]["id"],
				rewardList[i]["primaryId"],1)
		elseif rewardList[i]["type"] == 7 then
			vipInfo["gold"] = vipInfo["gold"] + rewardList[i]["value"]
			g_game.g_userInfoManager:setUserChongzhiYuanbao(vipInfo["gold"])
		elseif rewardList[i]["type"] == 8 then
			g_game.g_userInfoManager:addEmptyCard(8,0,
				0,rewardList[i]["value"])
		elseif rewardList[i]["type"] == 9 or rewardList[i]["type"] == 10 or 
			rewardList[i]["type"] == 11 or rewardList[i]["type"] == 12 or rewardList[i]["type"] == 13 then
			
			local type = g_game.g_dictConfigManager:getPieceType(rewardList[i]["id"])
			for j = 1, rewardList[i]["value"] do
				g_game.g_userInfoManager:insertPieceToTable(type + 9,rewardList[i]["id"])
			end
		end
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end


