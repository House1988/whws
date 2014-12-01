--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_choujiang_panel")

local f_choujiang_panel = class("f_choujiang_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_choujiang_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_choujiang_panel:ctor()    
    self:registerNodeEvent()   
   	
   	self:setSize(cc.size(960, 640))
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_choujiang_panel:onEnter() 
--	self:enableClipping(true)
	g_game.g_gameManager:addUpdateObj(self)
	g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_choujiang] = true
end


function f_choujiang_panel:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK, self.m_refresh)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFESH_CHOUJIANG_FREE, self.m_freeTimeUp)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_CHOUJIANG_AGAIN, self.m_agagin)
end

function f_choujiang_panel:onEnterTransitionFinish()
end

function f_choujiang_panel:onExitTransitionStart()
end

function f_choujiang_panel:onCleanup()
end


function f_choujiang_panel:registerNodeEvent(handler)
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

function f_choujiang_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

function f_choujiang_panel:clickChoujiang(times)
	g_game.g_userInfoManager:requestChoujiang(times)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_choujiang_panel:initAllComponent()	
	self.m_data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_choujiang)
	self.m_isOpen = true
	self.m_isClick1 = true

	local dailyRewardTable = createchoujiang_panel()
	self.dailyReward = dailyRewardTable["choujiang_panel"]	
	self.m_componentTable = dailyRewardTable
	
	self:appendComponent(self.dailyReward)
	
	self.dailyReward:setAnchorPoint(cc.p(0.5, 0.5))
	self.dailyReward:setPositionInContainer(cc.p(480, 320))
	
	local btnClickRank = function()
		if g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_choujiang] then
			g_game.g_userInfoManager:requestChoujiangRank()
		else
			g_game.g_utilManager:showMsg("活动已结束")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnRank"]:addHandleOfcomponentEvent(btnClickRank,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local btnClickShop = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_choujiang] then
			g_game.g_userInfoManager:requestRankShop(false)
		else
			g_game.g_utilManager:showMsg("活动已结束")
		end
	end
	self.m_componentTable["btnShop"]:addHandleOfcomponentEvent(btnClickShop,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local btnClickRankReward = function()
		require("scripts.game.main.reward.f_rankRewardPreview")
		local panel = f_rankRewardPreview.static_create()
		panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(panel,"rank_reward_detial")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnRankReward"]:addHandleOfcomponentEvent(btnClickRankReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local btnClickReward = function()
		require("scripts.game.main.bingfa.f_xunfang_rewardDetial")
		local panel = f_xunfang_rewardDetial.static_create()
		panel:panelInitBeforePopup(g_game.g_dictConfigManager:getChoujiangReward())
		g_game.g_panelManager:showUiPanel(panel,"xunfang_reward_detial")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnReward"]:addHandleOfcomponentEvent(btnClickReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_btnClick1 = function()
		if g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_choujiang] then
			local num = 0
			if self.m_data["freeTime"] >= 1 then
				num = self.m_data["price1"]
			end
			if self:checkYuanbao(num) then
				self:clickChoujiang(1)
			end
			self.m_isClick1 = true
		else
			g_game.g_utilManager:showMsg("活动已结束")
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn1"]:addHandleOfcomponentEvent(self.m_btnClick1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_btnClick10 = function()
		if g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_choujiang] then
			if self:checkYuanbao(self.m_data["price10"]) then
				self:clickChoujiang(10)
			end
		else
			g_game.g_utilManager:showMsg("活动已结束")
		end
		self.m_isClick1 = false
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn10"]:addHandleOfcomponentEvent(self.m_btnClick10,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	self.m_componentTable["number10"]:setString(self.m_data["price10"] .. "")
	self:refresh()
	
	self.m_refresh = function()
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK, self.m_refresh)
	
	self.m_freeTimeUp = function()
		self.m_data["freeTime"] = 0
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFESH_CHOUJIANG_FREE, self.m_freeTimeUp)
	
	self.m_agagin = function()
		if self.m_isClick1 then
			self.m_btnClick1()
		else
			self.m_btnClick10()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CHOUJIANG_AGAIN, self.m_agagin)
end

function f_choujiang_panel:checkYuanbao(num)
	if g_game.g_userInfoManager.m_user_info["gold"] >= num then
		return true
	end
	require("scripts.game.main.common.f_quick_charge_popup")
	local quickCharge = f_quick_charge_popup.static_create()
    quickCharge:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")	
	return false
end

function f_choujiang_panel:refresh()	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["leiji_label"]:setString("累計獲得積分：" .. self.m_data["score"])
		self.m_componentTable["jifen_label"]:setString("當前可用積分：" .. self.m_data["currentScore"])
	else
		self.m_componentTable["leiji_label"]:setString("累计获得积分：" .. self.m_data["score"])
		self.m_componentTable["jifen_label"]:setString("当前可用积分：" .. self.m_data["currentScore"])
	end
	
	if self.m_data["freeTime"] < 1 then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["number1"]:setString("免費")
		else
			self.m_componentTable["number1"]:setString("免费")
		end
	else
		local date = os.date("*t", g_game.g_gameManager:getCurrentTime())
		local s = 86400 - date["hour"] * 3600 - date["min"] * 60 - date["sec"]
		g_game.g_recoverManager:setCustomTimer("choujiang_free", s, g_game.g_f_lua_game_event.F_LUA_REFESH_CHOUJIANG_FREE)
		self.m_componentTable["number1"]:setString(self.m_data["price1"] .. "")
	end
	self.m_countDownTime = g_game.g_recoverManager:getHuodongCountDownTime(g_game.g_huodong_choujiang)
	self.m_timer = 0
	self:setCountDownLabel()
end

function f_choujiang_panel:setCountDownLabel()
	if self.m_countDownTime <= 0 then
		self.m_componentTable["fr_countdown_lbl"]:setString("活动已结束")
		g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_choujiang] = false
	else
		local t = self.m_countDownTime
		local d = math.floor(t / 86400)
		t = t - d * 86400
		local h = math.floor(t / 3600)
		t = t - h * 3600
		local m = math.floor(t / 60)
		t = t - m * 60
		
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["fr_countdown_lbl"]:setString(string.format("活動倒計時：%d天%d時%d分%d秒", d, h, m, t))
		else
			self.m_componentTable["fr_countdown_lbl"]:setString(string.format("活动倒计时：%d天%d时%d分%d秒", d, h, m, t))
		end
	end
end

function f_choujiang_panel:update(dt)
	self.m_timer = self.m_timer + dt
	if self.m_timer >= 1 then
		self.m_countDownTime = self.m_countDownTime - 1
		self:setCountDownLabel()
		self.m_timer = self.m_timer - 1
	end
end	

return f_choujiang_panel
