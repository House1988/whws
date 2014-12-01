--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_lianhuaShop")
require("scripts.game.main.qianguyidi.f_gongjizhiduihuan_card")

f_lianhuaShop = class("f_lianhuaShop")
f_lianhuaShop.__index = f_lianhuaShop

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_lianhuaShop.static_create()
	local rewardTable = createlianhuaShop()
	local reward = rewardTable["lianhuaShop"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_lianhuaShop)

	reward.m_componentTable = rewardTable

	return reward
end

function f_lianhuaShop:setData(datas, nextTime)
	self.m_datas = datas
	self.m_nextTime = nextTime
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_lianhuaShop:panelInitBeforePopup(datas, nextTime)
	self:registerNodeEvent()
	
	self.m_datas = datas
	self.m_nextTime = nextTime
	
	-- 关闭按钮
	local refresh = function()
		local num = g_game.g_userInfoManager:getPropNum(47)
		if num < 1 and g_game.g_userInfoManager.m_user_info["gold"] < 20 then
			require("scripts.game.main.common.f_quick_charge_popup")
			local quickCharge = f_quick_charge_popup.static_create()
		    quickCharge:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		else
			g_game.g_userInfoManager:requestLianHuaShop(true)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["refreshBtn"]:addHandleOfcomponentEvent(refresh,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHAOZHU_NUM)
		g_game.g_panelManager:removeUiPanel("lianhua_shop")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gjzdh_close_button"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local gotoJitian = function()
		require("scripts.game.main.lianhua.f_lianhua_panel")
		local panel = f_lianhua_panel.static_create()
		panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(panel, "lianhua_panel")
		g_game.g_panelManager:removeUiPanel("main_popup")
	end
	self.m_componentTable["jitianBtn"]:addHandleOfcomponentEvent(gotoJitian,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self:refresh()

	self.m_refresh = function()
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_LIANHUA_SHOP, self.m_refresh)
	
	self.m_requestRefresh = function()
		g_game.g_userInfoManager:requestLianHuaShop(false)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFESH_LIANHUA_SHOP, self.m_requestRefresh)
end

function f_lianhuaShop:setTimerText()
	local s = self.m_timer
	local h = math.floor(s / 3600)
	s = s - h * 3600
	local m = math.floor(s / 60)
	s = math.floor(s - m * 60)
	self.m_componentTable["shuaxin_num"]:setString(h .. ":" .. m .. ":" .. s)
end

function f_lianhuaShop:update(dt)
	self.m_second = self.m_second - dt
	if self.m_second <= 0 then
		self.m_timer = self.m_timer - 1
		self.m_second = self.m_second + 1
		self:setTimerText()
	end
end

function f_lianhuaShop:setBaoyin()
	self.m_componentTable["gjzdh_dangqian_num_label"]:setString("" .. g_game.g_userInfoManager.m_baoyin)
end

function f_lianhuaShop:refresh()
	self.m_rewards = g_game.g_userInfoManager.m_lianhuaShopMask
	self.m_componentTable["gjzdh_dangqian_num_label"]:setString("" .. g_game.g_userInfoManager.m_baoyin)
	local count = g_game.g_userInfoManager:getPropNum(47)
	if count > 0 then
		self.m_componentTable["shuaxinlingNum"]:setString("" .. count)
	else
		self.m_componentTable["shuaxinLing"]:setString("元宝：")
		self.m_componentTable["shuaxinlingNum"]:setString("20")
	end
	
	self.m_timer = self.m_nextTime - g_game.g_gameManager:getCurrentTime()
	self.m_second = 1
	self:setTimerText()
	g_game.g_recoverManager:setCustomTimer("lianhua_shop", self.m_timer, g_game.g_f_lua_game_event.F_LUA_REFESH_LIANHUA_SHOP)
	
	self:fillList()
end

function f_lianhuaShop:fillList()
	if self.m_list ~= nil then
		self:deleteComponent(self.m_list)
		self.m_list = nil
	end
	
	local onclick = function(item)
		self:buyItem(item)
	end

    local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	local rewardMask = bitCal:d2b(self.m_rewards)
	
	if self.m_list == nil then
		self.m_items = {}
		self.m_list = fc.FContainerList:create(2)
	    self.m_list:setSize(cc.size(960,460))
	    self.m_list:setAnchorPoint(cc.p(0.5,0.5))
	    self:appendComponent(self.m_list)
	    self.m_list:setPositionInContainer(cc.p(480,384))
	    self.m_list:enableClipping(true)
   		self.m_list:setListInfo(5, 0, 0, 225, 460)
   		
   		
		for i = 1, #self.m_datas do
			local data = self.m_datas[i]
			local item = f_gongjizhiduihuan_card.static_create()
			item:panelInitBeforePopup()	
			item:setIndex(i)
			item:setData2(data["type"], data["id"], data["des"], data["score"], data["num"], rewardMask[i] == 1, "真龙宝印")
			item:setCardDuihuanCallback(onclick)				
			self.m_list:appendComponent(item)
			table.insert(self.m_items, item)
		end
	else
		for i = 1, #self.m_datas do
			local data = self.m_datas[i]
			self.m_items[i]:setData2(data["type"], data["id"], data["des"], data["score"], data["num"], rewardMask[i] == 1, "真龙宝印")
		end
	end

end

function f_lianhuaShop:buyItem(data)
	local index = data.m_index
	data = self.m_datas[index]
	local price = data["score"]
	local cd = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_choujiang)
	if g_game.g_userInfoManager.m_baoyin < price then
		g_game.g_utilManager:showMsg("真龙宝印不足")
		return
	end
	g_game.g_userInfoManager:requestBuyLianhuaItem(index)
end

--------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] registerNodeEvent
--------------------------------------------------------------
function f_lianhuaShop:registerNodeEvent(handler)
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
-- @function [parent=#f_lianhuaShop] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lianhuaShop:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] onEnter
-------------------------------------------------------------------------------
function f_lianhuaShop:onEnter()
	self:initAllComponent()
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] onExit
-------------------------------------------------------------------------------
function f_lianhuaShop:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_LIANHUA_SHOP, self.m_refresh)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFESH_LIANHUA_SHOP, self.m_requestRefresh)
	g_game.g_gameManager:removeUpdateObj(self)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_lianhuaShop:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] onExitTransitionStart
-------------------------------------------------------------------------------
function f_lianhuaShop:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] onCleanup
-------------------------------------------------------------------------------
function f_lianhuaShop:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaShop] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lianhuaShop:initAllComponent()

end

