require("scripts.auto.auto_mailAttachment")
require("scripts.auto.auto_attachmentItem")
	
--[[--
关卡奖励弹出面板
--]]--

f_stage_reward_popup = class("f_stage_reward_popup")
f_stage_reward_popup.__index = f_stage_reward_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_reward_popup.static_create()
	local rewardTable = createmailAttachment()
	local reward = rewardTable["mailAttachment"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_stage_reward_popup)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_reward_popup:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_data = nil
	self.m_list = nil
	self.flag = nil
end

function f_stage_reward_popup:setData(data)
	self.m_data = data
end

function f_stage_reward_popup:fillList()
	if  self.m_data["silver"] ~= 0 then
		local item = require("scripts.game.main.stage.f_stage_reward_item").new()
		self.m_list:appendComponent(item)
		item:setSilver(self.m_data["silver"])
	end
	
	if  self.m_data["gold"] ~= 0 then
		local item = require("scripts.game.main.stage.f_stage_reward_item").new()
		self.m_list:appendComponent(item)
		item:setGold(self.m_data["gold"])
	end

	if  self.m_data["prop1"]["propId"] ~= 0 then
		local item = require("scripts.game.main.stage.f_stage_reward_item").new()
		self.m_list:appendComponent(item)
		item:setItem(self.m_data["prop1"])
	end
	
	if  self.m_data["prop2"]["propId"] ~= 0 then
		local item = require("scripts.game.main.stage.f_stage_reward_item").new()
		self.m_list:appendComponent(item)
		item:setItem(self.m_data["prop2"])
	end
	
end

function f_stage_reward_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_reward_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_reward_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] onEnter
-------------------------------------------------------------------------------
function f_stage_reward_popup:onEnter()
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["title_label"]:setString("所有關卡3星評分後可領取")
	else
		self.m_componentTable["title_label"]:setString("所有关卡3星评分后可领取")
	end

	self.m_list = fc.FContainerList:create(2)
	self:appendComponent(self.m_list)
	self.m_list:setSize(cc.size(376, 210))
	self.m_list:setAnchorPoint(cc.p(0.5,0.5))
	self.m_list:setPositionInContainer(cc.p(479, 322))
	self.m_list:setStopTouchEvent(true) 
	self.m_list:enableClipping(true)
	
	self.m_list:setListInfo(10, 0, 3, 150, 200);
	
	self:fillList()
	
	self.flag = fc.FExtensionsImage:create()
    self.flag:setImage("batch_ui/yilingqu_huodong.png")
    self.flag:setSize(cc.size(114,81))
    self.flag:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.flag)
    self.flag:setPositionInContainer(cc.p(480,459))
    self.flag:setVisible(false)
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] onExit
-------------------------------------------------------------------------------
function f_stage_reward_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_STAGE_REWARD, self.event_updateStageReward)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_reward_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_reward_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] onCleanup
-------------------------------------------------------------------------------
function f_stage_reward_popup:onCleanup()
end

function f_stage_reward_popup:setCloseVisible(b)
	self.m_componentTable["close_btn"]:setVisible(b)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_reward_popup:initAllComponent()
	self.m_componentTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local getReward = function()
		g_game.g_userInfoManager:requestGetStageReward(self.m_data["areaId"],self.m_data["stageId"])
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_LIQU_PRESS)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(getReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local closeCallback = function()
		g_game.g_panelManager:removeUiPanel("mail_attachment")
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(closeCallback,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.event_updateStageReward = function()
		self:updateStageReward()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_STAGE_REWARD, self.event_updateStageReward)
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] updateStageReward
-------------------------------------------------------------------------------
function f_stage_reward_popup:updateStageReward()
	g_game.g_panelManager:removeUiPanel("mail_attachment")
	local strT = g_game.g_dictConfigManager:getLanTextById(369)
	g_game.g_utilManager:showMsg(strT)
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local result = g_game.g_userInfoManager:getPassStageReward()
	if self.m_data["gold"] ~= 0 then
		userInfo["gold"] = result["gold"] 
	end
	
	if self.m_data["silver"] ~= 0 then
		userInfo["silver"] = result["silver"]
	end
	
	local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()
	smallStageNumsData["flag"] = 2
	--道具列表不用更新 在背包里道具列表会重新请求
	
	for i = 1,self.m_data["prop1"]["num"] do
		local dataT = {["propId"] = self.m_data["prop1"]["propId"]}
		g_game.g_userInfoManager:insertProp(dataT)
	end
	
	for j = 1,self.m_data["prop2"]["num"] do
		local dataT = {["propId"] = self.m_data["prop2"]["propId"]}
		g_game.g_userInfoManager:insertProp(dataT)
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_reward_popup] setGetFlag
-------------------------------------------------------------------------------
function f_stage_reward_popup:setGetFlag(flag)
	if flag == -1 then
		g_game.g_utilManager:showMsg("通过奖励返回错误")
		return 
	end

	if flag == 0 then
		self.m_componentTable["btn"]:setVisible(true)
		self.m_componentTable["btn"]:setButtonState(8)
		
	elseif flag == 1 then
		self.m_componentTable["btn"]:setVisible(true)
		self.m_componentTable["btn"]:setButtonState(2)
		
	elseif flag == 2 then	
		self.m_componentTable["btn"]:setVisible(false)
		self.flag:setVisible(true)
	end
end