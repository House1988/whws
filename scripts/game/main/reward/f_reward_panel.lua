require("scripts.auto.auto_reward")

--[[--
奖励面板
--]]--

require("scripts.game.main.reward.f_first_recharge_reward_panel")
require("scripts.game.main.reward.f_monthCardActive")

f_reward_panel = class("f_reward_panel")
f_reward_panel.__index = f_reward_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_reward_panel.static_create()
	local rewardTable = createreward()
	local reward = rewardTable["reward"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_reward_panel)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_reward_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_radioButtons = {}
	self.m_pages = {}

	self.m_currentPageName = ""
	
	self.m_levelList = g_game.g_dictConfigManager:getLevelRewardTable()
	self.m_maxPage = math.ceil(#self.m_levelList / 3)
	
	local close = function()
		g_game.g_userInfoManager:updateHuodongFlag()
		g_game.g_panelManager:removeUiPanel("reward_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self:fillBtnList()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] clickRadioBtn
-------------------------------------------------------------------------------
function f_reward_panel:clickRadioBtn(name)
	for i = 1, #self.m_radioButtons do
		self.m_radioButtons[i]:clickBtn(name)
		if name ~= self.m_radioButtons[i].m_name and self.m_pages[self.m_radioButtons[i].m_name] ~= nil then
			self.m_pages[self.m_radioButtons[i].m_name]:setVisible(false)
		end
	end
	self:showPage(name)
end

function f_reward_panel:setChargeRewardBtnState()
	if self.m_pages["chongzhi"] ~= nil then
		self.m_pages["chongzhi"]:setAcceptBtnState()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showPage
-------------------------------------------------------------------------------
function f_reward_panel:showPage(name)
	if self.m_pages[name] ~= nil then
		self.m_pages[name]:setVisible(true)
	else
		local page = nil
		if name == "monthcard" then
			page = self:showMonthCardPanel()
		elseif name == "level" then
			page = self:showLevelReward()
		elseif name == "daily" then
			page = self:showDailyReward()
		elseif name == "wugu" then
			page = self:showStrengthActivity()
		elseif name == "chongzhi" then
			page = self:showChargeRewardPanel()
		elseif name == "choujiang" then
			page = self:showChoujiang()
		elseif name == "box" then
			page = self:showBox()
			local item = self:getBtn(name)
			g_game.g_userInfoManager.m_hasClickFBox = true
			item:setFlagAnimVisible(false)
		elseif name == "worldboss" then
			page = self:showWorldBoss()
		end
		self.m_pages[name] = page
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] fillBtnList
-------------------------------------------------------------------------------
function f_reward_panel:fillBtnList()
	local click = function(name)
		self:clickRadioBtn(name)
	end
	
	-- 月卡必有
	self:createBtn("yuekalibao.png", "monthcard", click)
	
	local list = g_game.g_userInfoManager:getCurrentHuodong()
	self.m_componentTable["btnList"]:setListInfo(6, 0, 30, 100, 100)
	local item = nil
	for i = 1, #list do
		if list[i] == g_game.g_huodong_chongzhi then
			item = self:createBtn("chongzhiyouli.png", "chongzhi", click)
		elseif list[i] == g_game.g_huodong_choujiang then
			item = self:createBtn("minglushuangshou.png", "choujiang", click)
		elseif list[i] == g_game.g_huodong_box then
			item = self:createBtn("xianshiqianggou.png", "box", click)
			item:setFlagAnimVisible(not g_game.g_userInfoManager.m_hasClickFBox)
			g_game.g_userInfoManager:updateHuodongFlag()
		end
	end
	item = self:createBtn("denglujiangli.png", "daily", click)
	item = self:createBtn("dengjijiangli.png", "level", click)
	item = self:createBtn("wugufengdeng.png", "wugu", click)
	
	local userLv = g_game.g_userInfoManager:getUserInfo()["level"] 
	if userLv >= g_game.OPEN_WORLD_BOSS_LV then
		item = self:createBtn("diwangzhan.png", "worldboss", click)
	end
	
end

function f_reward_panel:getBtn(name)
	for i = 1, #self.m_radioButtons do
		if self.m_radioButtons[i].m_name == name then
			return self.m_radioButtons[i]
		end
	end
	return nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] createBtn
-------------------------------------------------------------------------------
function f_reward_panel:createBtn(image, name, click)
	local item = require("scripts.game.main.reward.f_rewardBtn").new()
	item:setData(image, name, click)
	table.insert(self.m_radioButtons, item)
	self.m_componentTable["btnList"]:appendComponent(item)
	return item
end

--------------------------------------------------------------
-- @function [parent=#f_reward_panel] fillLevelPage
--------------------------------------------------------------
function f_reward_panel:fillLevelPage(pageIndex)
	if pageIndex < 1 or pageIndex > self.m_maxPage then
		return
	end
	
	local page = self.m_levelPage
	if not page:needLoadPage(pageIndex) then
		return
	end
	
	local i = (pageIndex - 1) * 3 + 1
	local e = math.min(i + 2, #self.m_levelList)
	for i = i, e do
		if i <= #self.m_levelList then
			local item = require("scripts.game.main.reward.f_levelReward_item").new()
			item:setData(i)
			page:addComponentToPage(item, pageIndex)		
		end
	end
end

--------------------------------------------------------------
-- @function [parent=#f_reward_panel] registerNodeEvent
--------------------------------------------------------------
function f_reward_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_reward_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_reward_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] onEnter
-------------------------------------------------------------------------------
function f_reward_panel:onEnter()
	self:initAllComponent()
	
	self:clickRadioBtn(self.m_radioButtons[1].m_name)
	
	self:updateFlag()
	
	self.m_updateStrengthActivity = function()
		self:updateFlag()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG, self.m_updateStrengthActivity)

	self.m_updateBossDie = function()
		for i = 1, #self.m_radioButtons do
			if self.m_radioButtons[i].m_name == "worldboss" then
				 self.m_radioButtons[i]:setFlagAnimVisible(false)
			end
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_WORLD_BOSS_OVER, self.m_updateBossDie)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] updateRewardFlag
-------------------------------------------------------------------------------
function f_reward_panel:updateRewardFlag(targetItem)
	local btnName = targetItem.m_name
	local isShow = false
	
	isShow = g_game.g_userInfoManager:updateSingleFlag(btnName)
	if isShow then
		g_game.g_userInfoManager.m_hasHuodongFlag = true
	end
	targetItem:setFlagAnimVisible(isShow)
end

function f_reward_panel:updateFlag()
	g_game.g_userInfoManager.m_hasHuodongFlag = false
	for i = 1, #self.m_radioButtons do
		self:updateRewardFlag(self.m_radioButtons[i])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] onExit
-------------------------------------------------------------------------------
function f_reward_panel:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_WORLD_BOSS_OVER, self.m_updateBossDie)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG, self.m_updateStrengthActivity)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_reward_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_reward_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] onCleanup
-------------------------------------------------------------------------------
function f_reward_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_reward_panel:initAllComponent()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showMonthCardPanel()
-------------------------------------------------------------------------------
function f_reward_panel:showMonthCardPanel()
	local panel = f_monthCardActive.static_create()
	self:appendComponent(panel)
	panel:setSize(cc.size(960, 640))
	panel:setAnchorPoint(cc.p(0.5,0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	panel:setVisible(true)
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] refreshMonthCardPanel()
-------------------------------------------------------------------------------
function f_reward_panel:refreshMonthCardPanel()
	if self.m_pages["monthcard"] ~= nil then
		self.m_pages["monthcard"]:refreshBuyAcceptBtnStatus()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showStrengthActivity()
-------------------------------------------------------------------------------
function f_reward_panel:showStrengthActivity()

	local panel = require("scripts.game.main.reward.f_strength_activity").new()
	self:appendComponent(panel)
	panel:setSize(cc.size(960, 640))
	panel:setAnchorPoint(cc.p(0.5,0.5))
	panel:setPositionInContainer(cc.p(480, 320))

	panel:setVisible(true)
	panel:refreshView()
	return panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showChargeRewardPanel()
-- 限时充值奖励面板
-------------------------------------------------------------------------------
function f_reward_panel:showChargeRewardPanel()
		--限时充值奖励面板
	local panel = f_first_recharge_reward_panel.static_create()
	self:appendComponent(panel)
	panel:setAnchorPoint(cc.p(0.5,0.0))
	panel:setPositionInContainer(cc.p(480.0, 640.0))

	panel:setVisible(true)
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showDailyReward()
-- 登录奖励面板
-------------------------------------------------------------------------------
function f_reward_panel:showDailyReward()

	local panel = require("scripts.game.main.reward.f_dailyReward").new()
	self:appendComponent(panel)
	panel:setSize(cc.size(960, 640))
	panel:setAnchorPoint(cc.p(0.5,0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	panel:setVisible(true)
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showWorldBoss
-- 世界boss
-------------------------------------------------------------------------------
function f_reward_panel:showWorldBoss()
	local panel = require("scripts.game.main.reward.f_world_boss").new()
	self:appendComponent(panel)
	panel:setSize(cc.size(960, 640))
	panel:setAnchorPoint(cc.p(0.5,0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showBox()
-- 抽奖面板
-------------------------------------------------------------------------------
function f_reward_panel:showBox()
	local panel = require("scripts.game.main.reward.f_fortuneBox").new()
	self:appendComponent(panel)
	panel:setSize(cc.size(960, 640))
	panel:setAnchorPoint(cc.p(0.5,0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	panel:setVisible(true)
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showChoujiang()
-- 抽奖面板
-------------------------------------------------------------------------------
function f_reward_panel:showChoujiang()
	
	local panel = require("scripts.game.main.reward.f_choujiang_panel").new()
	self:appendComponent(panel)
	panel:setSize(cc.size(960, 640))
	panel:setAnchorPoint(cc.p(0.5,0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	panel:setVisible(true)
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] showLevelReward()
-- 等级奖励面板
-------------------------------------------------------------------------------
function f_reward_panel:showLevelReward()

	local page = fc.FContainerPage:create(2)
	self.m_levelPage = page
	page:enableClipping(true)
	self:appendComponent(page)
	page:setSize(cc.size(900, 500))
	page:setAnchorPoint(cc.p(0.5,0.5))
	page:setPositionInContainer(cc.p(480, 380))
	page:setStopTouchEvent(true)
	
	local index = 1
	local lv = g_game.g_userInfoManager:getLevel()
	for i = 1, #self.m_levelList do
		if lv < self.m_levelList[i][2] or not g_game.g_userInfoManager:isReceiveLevelReward(self.m_levelList[i][2]) then
			index = i
			break
		end
	end
	
	index = math.ceil(index / 3)
	
	local fillPage = function(pageIndex)
		self:fillLevelPage(pageIndex)
	end
	page:registLoadPageCallback(fillPage)
	page:setPageInfoAndIndex(#self.m_levelList, 3, 1, 5, 0, 900, 160, index)
	page:setVisible(true)
	return page
end
