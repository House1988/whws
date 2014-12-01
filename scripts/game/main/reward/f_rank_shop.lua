--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_rank_shop")
require("scripts.game.main.qianguyidi.f_gongjizhiduihuan_card")

f_rank_shop = class("f_rank_shop")
f_rank_shop.__index = f_rank_shop

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_rank_shop.static_create()
	local rewardTable = createrank_shop()
	local reward = rewardTable["rank_shop"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_rank_shop)

	reward.m_componentTable = rewardTable

	return reward
end

function f_rank_shop:setData(datas, nextTime)
	self.m_datas = datas
	self.m_nextTime = nextTime
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_rank_shop:panelInitBeforePopup(datas, nextTime)
	self:registerNodeEvent()
	
	self.m_datas = datas
	self.m_nextTime = nextTime
	
	-- 关闭按钮
	local close = function()
		local data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_choujiang)
		if g_game.g_userInfoManager:getUserInfo()["gold"] < data["refreshPrice"] then
			require("scripts.game.main.common.f_quick_charge_popup")
			local quickCharge = f_quick_charge_popup.static_create()
		    quickCharge:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		else
--			local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--			g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--			pop:setNoticeContent(nil,"是否花费" .. data["refreshPrice"] .. "元宝刷新？",nil,nil)
--			pop:popUpNotice(29)
--			pop:setActionType(1)
--	
--			local quedingClick = function()
				g_game.g_userInfoManager:requestRankShop(true)
--			end
--			pop:setYesCallBack(quedingClick)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["refreshBtn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("rank_shop")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gjzdh_close_button"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	self:refresh()

	self.m_refresh = function()
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK, self.m_refresh)
	
	self.m_requestRefresh = function()
		g_game.g_userInfoManager:requestRankShop(false)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFESH_RANK_SHOP, self.m_requestRefresh)
end

function f_rank_shop:setTimerText()
	local s = self.m_timer
	local h = math.floor(s / 3600)
	s = s - h * 3600
	local m = math.floor(s / 60)
	s = math.floor(s - m * 60)
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["timer_label"]:setString(h .. "時" .. m .. "分" .. s .. "秒")
	else
		self.m_componentTable["timer_label"]:setString(h .. "时" .. m .. "分" .. s .. "秒")
	end
	
end

function f_rank_shop:update(dt)
	self.m_second = self.m_second - dt
	if self.m_second <= 0 then
		self.m_timer = self.m_timer - 1
		self.m_second = self.m_second + 1
		self:setTimerText()
	end
end

function f_rank_shop:refresh()
	self.m_rewards = g_game.g_userInfoManager.m_shopBuyMask
	local data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_choujiang)
	self.m_componentTable["gjzdh_dangqian_num_label"]:setString("" .. data["currentScore"])
	self.m_componentTable["shuaxin_num"]:setString("" .. data["refreshPrice"])
	
	self.m_timer = self.m_nextTime - g_game.g_gameManager:getCurrentTime()
	self.m_second = 1
	self:setTimerText()
	g_game.g_recoverManager:setCustomTimer("choujiang_shop", self.m_nextTime, g_game.g_f_lua_game_event.F_LUA_REFESH_RANK_SHOP)
	
	self:fillList()
end

function f_rank_shop:fillList()
	local onclick = function(item)
		self:buyItem(item)
	end
	
	if self.m_list ~= nil then
		self:deleteComponent(self.m_list)
	end
	
	self.m_list = fc.FContainerList:create(2)
    self.m_list:setSize(cc.size(960,460))
    self.m_list:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.m_list)
    self.m_list:setPositionInContainer(cc.p(480,384))
    
    self.m_list:enableClipping(true)
    self.m_list:setListInfo(5, 0, 0, 225, 460)
    
    local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	local rewardMask = bitCal:d2b(self.m_rewards)
	
	for i = 1, #self.m_datas do
		local data = self.m_datas[i]
		local type = 0
		local temp = {i, type, data["id"], data["price"]}
		local item = f_gongjizhiduihuan_card.static_create()
		item:panelInitBeforePopup()	
		item:setIndex(i)
		if LANGUAGE_TYPE == 3 then
			item:setData2(data["type"], data["id"], data["des"], data["score"], data["num"], rewardMask[i] == 1, "積分")
		else
			item:setData2(data["type"], data["id"], data["des"], data["score"], data["num"], rewardMask[i] == 1, "积分")
		end
		item:setCardDuihuanCallback(onclick)				
		self.m_list:appendComponent(item)
	end
end

function f_rank_shop:buyItem(data)
	local index = data.m_index
	data = self.m_datas[index]
	local price = data["score"]
	local cd = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_choujiang)
	if cd["currentScore"] < price then
		g_game.g_utilManager:showMsg("积分不足")
		return
	end
	g_game.g_userInfoManager:requestBuyRankItem(index)
end

--------------------------------------------------------------
-- @function [parent=#f_rank_shop] registerNodeEvent
--------------------------------------------------------------
function f_rank_shop:registerNodeEvent(handler)
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
-- @function [parent=#f_rank_shop] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_rank_shop:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] onEnter
-------------------------------------------------------------------------------
function f_rank_shop:onEnter()
	self:initAllComponent()
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] onExit
-------------------------------------------------------------------------------
function f_rank_shop:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK, self.m_refresh)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFESH_RANK_SHOP, self.m_requestRefresh)
	g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_rank_shop:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] onExitTransitionStart
-------------------------------------------------------------------------------
function f_rank_shop:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] onCleanup
-------------------------------------------------------------------------------
function f_rank_shop:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rank_shop] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_rank_shop:initAllComponent()

end

