--[[--
    恢复数值管理
--]]--

local f_recover_manager = class("f_recover_manager")
f_recover_manager.__index = f_recover_manager

-------------------------------------------------
-- @function [parent=#f_recover_manager] ctor
-------------------------------------------------
function f_recover_manager:ctor()	
	g_game.g_gameManager:addUpdateObj(self)

	self.m_recoverTarget = {}
	table.insert(self.m_recoverTarget, 0)
	table.insert(self.m_recoverTarget, 0)
	table.insert(self.m_recoverTarget, 0)
	table.insert(self.m_recoverTarget, 0)
	
	self.m_updateLueduo = false
	self.m_lueduoCountDown = 0
	
	self.m_requestHuodongTime = -1
	
	self.m_countTime = 1
	self.m_isStart = false
	self.m_huodongEndTime = {}
	
	--商城倒计时
	self.m_shopTime = {}
	self.m_requestShopTime = 0
	self.m_needRequestShop = false
	for i =1, 6 do
		table.insert(self.m_shopTime,0) -- 1xiangshi 2huishi 3dianshi 4xiangxuan 5huixuan 6dianxuan
	end
	
	self.event_requestRecoverTime = function()
	 	self:requestRecorverFromForground()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_FOREGROUND, self.event_requestRecoverTime)
	
	--本地事件
	self.event_refershNativeRecoverData = function()
		self:refershNativeRecoverData()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFERSH_RECOVER_DATA, self.event_refershNativeRecoverData)
	
	
	self.m_timer = {}
	self.m_timer2 = {}
	self.m_timerSecond = 1
	self.m_bossCdTime = 0
end

-------------------------------------------------
-- @function [parent=#f_recover_manager] setShopTime
-------------------------------------------------
function f_recover_manager:setShopTime(index,value)
	self.m_shopTime[index] = value
end

-------------------------------------------------
-- @function [parent=#f_recover_manager] getRecoverTime
-------------------------------------------------
function f_recover_manager:getShopTime(index)
	return self.m_shopTime[index]
end

function f_recover_manager:getLueduoBtnCD()
	return self.m_lueduoCountDown
end

function f_recover_manager:setLueduoBtnCD()
	self.m_lueduoCountDown = 10
	self.m_lueduoSecondTime = 0
	self.m_updateLueduo = true
end

function f_recover_manager:setTargetTime(t)
	self.m_recoverTarget = t
end

function f_recover_manager:setHuodongTime(t)
	self.m_requestHuodongTime = t
end

function f_recover_manager:setHuodongEndTime(t, time)
	self.m_huodongEndTime[t] = time
end

function f_recover_manager:getHuodongCountDownTime(t)
	return self.m_huodongEndTime[t] - g_game.g_gameManager:getCurrentTime()
end

function f_recover_manager:startTimer(isStart)
	self.m_isStart = isStart
	self.m_countTime = 1
	if isStart then
		g_game.g_userInfoManager:requestRecoverTime()
		g_game.g_userInfoManager:requestRecoverData()
		
		g_game.g_userInfoManager:sendToGetKejuCDTimeAndTimes()
		g_game.g_userInfoManager:sendToGetXuanxiuCDTimeAndTimes()
	end
end

function f_recover_manager:setSteadyActivityTimer(id,time,event)
	local t = {["id"] = id, ["time"] = time + g_game.g_gameManager:getCurrentTime() ,["event"] = event}
	if id =="worldboss" then
		self.m_bossCdTime = time
	end
	for i = 1, #self.m_timer2 do
		if self.m_timer2[i]["id"] == id then
			self.m_timer2[i] = t
			return
		end
	end
	table.insert(self.m_timer2, t)
end

function f_recover_manager:setCustomTimer(id, time, event)
	local t = {["id"] = id, ["time"] = time + g_game.g_gameManager:getCurrentTime(), ["event"] = event}
	for i = 1, #self.m_timer do
		if self.m_timer[i]["id"] == id then
			self.m_timer[i] = t
			return
		end
	end
	table.insert(self.m_timer, t)
end

function f_recover_manager:getCustomTimerLeftTime(id)
	for i = 1, #self.m_timer do
		if self.m_timer[i]["id"] == id then
			return self.m_timer[i]["time"] - g_game.g_gameManager:getCurrentTime()
		end
	end
	return nil
end

-------------------------------------------------
-- @function [parent=#f_recover_manager] getRecoverTime
-- 获取恢复时间， 1精力 2粮草 3军令 4功绩值
-------------------------------------------------
function f_recover_manager:getRecoverTime(type)
	return math.ceil(self.m_recoverTarget[type])
end

function f_recover_manager:update(dt)
	if not self.m_isStart then
		return
	end
	self.m_countTime = self.m_countTime - dt
	
	local needRequest = false
	if self.m_countTime <= 0 then
		for i = 1, #self.m_recoverTarget do
			self.m_recoverTarget[i] = self.m_recoverTarget[i] - 1 
			if self.m_recoverTarget[i] <= 0 then
				needRequest = true
				break
			end
		end
		
		--商城
		for i = 1, #self.m_shopTime do
			self.m_shopTime[i] = self.m_shopTime[i] - 1 
			if self.m_shopTime[i] <= 0 then
				self.m_shopTime[i] = 0
			end
		end
		self.m_requestShopTime = self.m_requestShopTime + 1
		if self.m_requestShopTime > 600 then
			self.m_requestShopTime = 0
			self.m_needRequestShop = true
		end
		
		if self.m_requestHuodongTime > 0 then
			self.m_requestHuodongTime = self.m_requestHuodongTime - 1
			if self.m_requestHuodongTime <= 0 then
				g_game.g_userInfoManager:requestHuodongList()
			end
		end
		
		self.m_countTime = self.m_countTime + 1
	end
	
	if self.m_updateLueduo then
		self.m_lueduoSecondTime = self.m_lueduoSecondTime + dt
		if self.m_lueduoSecondTime > 1 then
			self.m_lueduoSecondTime = self.m_lueduoSecondTime - 1
			self.m_lueduoCountDown = self.m_lueduoCountDown - 1
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_LUEDUO_COUNT_DOWN)
			if self.m_lueduoCountDown <= 0 then
				self.m_updateLueduo = false
			end
		end
	end
	
	if needRequest then
		g_game.g_userInfoManager:requestRecoverTime()
		g_game.g_userInfoManager:requestRecoverData()
	end
	
	if self.m_needRequestShop then
		g_game.g_userInfoManager:sendToGetKejuCDTimeAndTimes()
		g_game.g_userInfoManager:sendToGetXuanxiuCDTimeAndTimes()
		self.m_needRequestShop = false
	end
	
	self.m_timerSecond = self.m_timerSecond - dt
	if self.m_timerSecond <= 0 then
		self.m_timerSecond = self.m_timerSecond + 1
		local time = g_game.g_gameManager:getCurrentTime()
		local del = {}
		for i = 1, #self.m_timer do
			if self.m_timer[i]["time"] <= time then
				table.insert(del, i)
				send_lua_event(self.m_timer[i]["event"])
			end
		end
		for i = #del, 1, -1 do
			table.remove(self.m_timer, del[i])
		end
		
		self.m_bossCdTime = self.m_bossCdTime -1
		--定点活动  世界boss  五谷丰登
		for j =1,#self.m_timer2 do
			 if self.m_timer2[j]["time"] <= time then
			 	self.m_bossCdTime = 0
			 	send_lua_event(self.m_timer2[j]["event"])
			 end
		end
	end
end

function f_recover_manager:getBossCdTime()
	return self.m_bossCdTime 
end

-------------------------------------------------
-- @function [parent=#f_recover_manager] requestRecorverFromForground
-- 游戏切换到前台，手动触发时间刷新
-------------------------------------------------
function f_recover_manager:requestRecorverFromForground()
	if not self.m_isStart then
		return
	end
	
	if g_game.m_isDisconnectTrigger then
		return
	end
	
	g_game.g_userInfoManager:requestRecoverTime()
	g_game.g_userInfoManager:requestRecoverData()
	
	g_game.g_userInfoManager:sendToGetKejuCDTimeAndTimes()
	g_game.g_userInfoManager:sendToGetXuanxiuCDTimeAndTimes()
end


------------------------------------------------
-- @function [parent=#f_recover_manager] refershNativeRecoverData
-- 每天跨天的时候  从本地数据表读取信息并恢复数据
------------------------------------------------
function f_recover_manager:refershNativeRecoverData()
	local dataTable = g_game.g_dictConfigManager:getNativeRecoverData()
	
	--恢复美女兴趣点
	g_game.g_userInfoManager:recoverBeautyIntimacy(dataTable[3][3])
	g_game.g_userInfoManager:recoverPvpChallengeNum(dataTable[4][3])
	g_game.g_userInfoManager:recoverKejuXuanxiuNum(dataTable[5][3])
	g_game.g_userInfoManager:recoverRewardFlag()--跨天回复 定点活动
end


return f_recover_manager