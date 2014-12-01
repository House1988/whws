require("scripts.auto.auto_strengthActivity")
--[[--
五谷丰登
--]]--
local f_strength_activity = class("f_strength_activity", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_strength_activity")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_strength_activity:ctor()    
    self:registerNodeEvent()   
   	self.m_componentTable = nil
   	self:setSize(cc.size(960, 640))
	self.m_serverTime = nil	
	self.m_timeFlag = -1
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] registerNodeEvent
-------------------------------------------------------------------------------
function f_strength_activity:registerNodeEvent(handler)
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
-- @function [parent=#f_strength_activity] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_strength_activity:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] refreshView
-------------------------------------------------------------------------------
function f_strength_activity:refreshView()
	--是否已经领取标志位
	local getFlag = g_game.g_userInfoManager:getRewardFlag()

	self.m_serverTime = g_game.g_utilManager:getServerTime()
	
	self.m_timeFlag = -1
	
	if self.m_serverTime ~= nil then
		if self.m_serverTime["hour"] >= 12 and self.m_serverTime["hour"] < 14 then
			self.m_timeFlag = 1
		elseif self.m_serverTime["hour"] >= 18 and self.m_serverTime["hour"] < 20 then
			self.m_timeFlag = 2
		end
	end
	
	if self.m_timeFlag == 1 then
		self.m_componentTable["get_panel"]:setVisible(true)
		self.m_componentTable["cant_get_panel"]:setVisible(false)
		self.m_componentTable["content_get_label1"]:setString("    ".."皇上，今日里风调雨顺，天下太平，各地粮食收成不错，")
		self.m_componentTable["shouxia_btn"]:setText("收  下",cc.c3b(254,255,232))
		self.m_componentTable["qidai_btn"]:setText("敬 请 稍 候",cc.c3b(254,255,232))
		self.m_componentTable["qidai_btn"]:setTextButtonState(8)
	elseif self.m_timeFlag == 2 then
		self.m_componentTable["get_panel"]:setVisible(true)
		self.m_componentTable["cant_get_panel"]:setVisible(false)
		self.m_componentTable["content_get_label1"]:setString("    ".."皇上，今日里风调雨顺，天下太平，各地粮食收成不错，")
		self.m_componentTable["shouxia_btn"]:setText("敬 请 稍 候",cc.c3b(254,255,232))
		self.m_componentTable["shouxia_btn"]:setTextButtonState(8)
		self.m_componentTable["qidai_btn"]:setText("收  下",cc.c3b(254,255,232))
	elseif self.m_timeFlag == -1 then
		self.m_componentTable["get_panel"]:setVisible(false)
		self.m_componentTable["cant_get_panel"]:setVisible(true)
		self.m_componentTable["shouxia_btn"]:setText("敬 请 稍 候",cc.c3b(254,255,232))
		self.m_componentTable["shouxia_btn"]:setTextButtonState(8)
		self.m_componentTable["qidai_btn"]:setText("敬 请 稍 候",cc.c3b(254,255,232))
		self.m_componentTable["qidai_btn"]:setTextButtonState(8)
	end
	
	if getFlag["reward1"] == 1 then
		self.m_componentTable["shouxia_btn"]:setText("已 领 取",cc.c3b(254,255,232))
		self.m_componentTable["shouxia_btn"]:setTextButtonState(8)
	end
	
	if getFlag["reward2"] == 1 then
		self.m_componentTable["qidai_btn"]:setText("已 领 取",cc.c3b(254,255,232))
		self.m_componentTable["qidai_btn"]:setTextButtonState(8)
	end
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] onEnter
-------------------------------------------------------------------------------
function f_strength_activity:onEnter()
	self.m_componentTable = createstrengthActivity()
	local panel = self.m_componentTable["strengthActivity"]	
	self:appendComponent(panel)
	panel:setAnchorPoint(cc.p(0.5, 0.5))
	panel:setPositionInContainer(cc.p(480, 320))
	
	self:refreshView()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] onExit
-------------------------------------------------------------------------------
function f_strength_activity:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_GET_RESULT_FLAG, self.m_updateGetResult)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG, self.m_updateRewardFlag2)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_strength_activity:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] onExitTransitionStart
-------------------------------------------------------------------------------
function f_strength_activity:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] onCleanup
-------------------------------------------------------------------------------
function f_strength_activity:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_strength_activity] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_strength_activity:initAllComponent()
	--是否已经领取标志位
	local getFlag = g_game.g_userInfoManager:getRewardFlag()
	
	local getNoonReward = function()
		if self.m_timeFlag == 1 and getFlag["reward1"] == 0 then
			g_game.g_userInfoManager:requestStrengthReward(1)
		end
	end
	self.m_componentTable["shouxia_btn"]:addHandleOfcomponentEvent(getNoonReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local getAfternoonReward = function()
		if self.m_timeFlag == 2 and getFlag["reward2"] == 0 then
			g_game.g_userInfoManager:requestStrengthReward(2)
		end
	end
	self.m_componentTable["qidai_btn"]:addHandleOfcomponentEvent(getAfternoonReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--领取结果
	self.m_updateGetResult = function()
		self:updateGetResult()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REWARD_GET_RESULT_FLAG, self.m_updateGetResult)
	
	--服务器时间回调
	self.m_updateRewardFlag2 = function()
		self:updateServerTime()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG, self.m_updateRewardFlag2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_top_panel] updateServerTime
-- 如果当前有道具可以领 但是没有领 过了领取时间 则显示时间过了
-------------------------------------------------------------------------------
function f_strength_activity:updateServerTime()
	local curTime = g_game.g_utilManager:getServerTime()
	local getFlag = g_game.g_userInfoManager:getRewardFlag()
	
	if getFlag == nil then
		return
	end
	
	if getFlag["reward1"] ~= 1 and self.m_timeFlag == 1 
		and curTime["hour"] >= 14 then
		self.m_componentTable["shouxia_btn"]:setText("时 间 过 了",cc.c3b(254,255,232))
		self.m_componentTable["shouxia_btn"]:setTextButtonState(8)
	end
	
	if getFlag["reward2"] ~= 1 and self.m_timeFlag == 2
		and curTime["hour"] >= 20 then
		self.m_componentTable["qidai_btn"]:setText("时 间 过 了",cc.c3b(254,255,232))
		self.m_componentTable["qidai_btn"]:setTextButtonState(8)
	end
end


function f_strength_activity:updateGetResult()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local getFlag = g_game.g_userInfoManager:getRewardFlag()
	local strBefore = userInfo["strength"]
	local strNow = g_game.g_userInfoManager:getStrengthReward()["strength"]
	local add = strNow - strBefore
	g_game.g_utilManager:showMsg("粮草+"..add)
	
	userInfo["strength"] = strNow
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
	
	if self.m_timeFlag == 1 then
		getFlag["reward1"] = 1
		self.m_componentTable["shouxia_btn"]:setText("已 领 取",cc.c3b(254,255,232))
		self.m_componentTable["shouxia_btn"]:setTextButtonState(8)
	end
	
	if self.m_timeFlag == 2 then
		getFlag["reward2"] = 1
		self.m_componentTable["qidai_btn"]:setText("已 领 取",cc.c3b(254,255,232))
		self.m_componentTable["qidai_btn"]:setTextButtonState(8)
	end
end



return f_strength_activity
