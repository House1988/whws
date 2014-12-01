--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_FortuneBox")

local f_fortuneBox = class("f_fortuneBox", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_fortuneBox")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBox] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_fortuneBox:ctor()    
    self:registerNodeEvent()   
   	
   	self:setSize(cc.size(960, 640))
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBox] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_fortuneBox:onEnter() 
--	self:enableClipping(true)
	g_game.g_gameManager:addUpdateObj(self)
	g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_box] = true
	self.m_countDownTime = g_game.g_recoverManager:getHuodongCountDownTime(g_game.g_huodong_box)
	self.m_timer = 0
	
		
	self.m_onRefresh = function()
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_BOX, self.m_onRefresh)
end


function f_fortuneBox:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_BOX, self.m_onRefresh)
end

function f_fortuneBox:onEnterTransitionFinish()
end

function f_fortuneBox:onExitTransitionStart()
end

function f_fortuneBox:onCleanup()
end


function f_fortuneBox:registerNodeEvent(handler)
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

function f_fortuneBox:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBox] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_fortuneBox:initAllComponent()	
	self.m_data = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_box)
	self.m_isOpen = true
	self.m_currentPage = 1

	local dailyRewardTable = createFortuneBox()
	self.dailyReward = dailyRewardTable["FortuneBox"]	
	self.m_componentTable = dailyRewardTable
	
	self:appendComponent(self.dailyReward)
	
	self.dailyReward:setAnchorPoint(cc.p(0.5, 0.5))
	self.dailyReward:setPositionInContainer(cc.p(480, 320))
	local datas = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_box)
	self.m_maxLevel = #datas
	
	self.m_items = {}
	for i = 1, 6 do
		local item = require("scripts.game.main.reward.f_fortuneBoxItem").new()
		self:appendComponent(item)
		table.insert(self.m_items, item)
		item:setAnchorPoint(cc.p(0.5,0.5))
   		item:setPositionInContainer(self.m_componentTable["pos" .. i]:getPositionInContainer())
	end
	
	self:refresh()
end

function f_fortuneBox:refresh()	
	local datas = g_game.g_userInfoManager:getHuodongData(g_game.g_huodong_box)
	if #datas > self.m_maxLevel then
		self.m_currentPage = self.m_currentPage + 1
	end
	local config = g_game.g_dictConfigManager:getFortuneBoxConfig(self.m_currentPage)
	for i = 1, #self.m_items do
		self.m_items[i]:setData(config[i], i, datas[i]["num"], self.m_currentPage)
	end
end

function f_fortuneBox:setCountDownLabel()
	if self.m_countDownTime <= 0 then
		self.m_componentTable["countDownTimer"]:setString("活动已结束")
		g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_box] = false
	else
		local t = self.m_countDownTime
		local d = math.floor(t / 86400)
		t = t - d * 86400
		local h = math.floor(t / 3600)
		t = t - h * 3600
		local m = math.floor(t / 60)
		t = t - m * 60
		
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["countDownTimer"]:setString(string.format("%d天%d時%d分%d秒", d, h, m, t))
		else
			self.m_componentTable["countDownTimer"]:setString(string.format("%d天%d时%d分%d秒", d, h, m, t))
		end
	end
end

function f_fortuneBox:update(dt)
	self.m_timer = self.m_timer + dt
	if self.m_timer >= 1 then
		self.m_countDownTime = self.m_countDownTime - 1
		self:setCountDownLabel()
		self.m_timer = self.m_timer - 1
	end
end	

return f_fortuneBox
