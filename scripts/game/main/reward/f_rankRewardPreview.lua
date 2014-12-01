require("scripts.auto.auto_rank_reward")
--[[--
奖励面板
--]]--

require("scripts.game.main.reward.f_first_recharge_reward_panel")

f_rankRewardPreview = class("f_rankRewardPreview")
f_rankRewardPreview.__index = f_rankRewardPreview

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_rankRewardPreview.static_create()
	local rewardTable = createrank_reward()
	local reward = rewardTable["rank_reward"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_rankRewardPreview)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_rankRewardPreview:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.clickIndex = 1
	
	-- 关闭按钮
	local close = function()
		g_game.g_panelManager:removeUiPanel("rank_reward_detial")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_componentTable["list"]:setListInfo(3, 0, 0, 600, 160)
	self.m_componentTable["list"]:enableClipping(true)
	
	self:fillList()
end

function f_rankRewardPreview:fillList()
	local count = g_game.g_dictConfigManager:getRankRewardCount()
	for i = 1, count do
		local item = require("scripts.game.main.reward.f_rankRewardPreviewItem").new()
		item:setData(i)
		self.m_componentTable["list"]:appendComponent(item)
	end
end

--------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] registerNodeEvent
--------------------------------------------------------------
function f_rankRewardPreview:registerNodeEvent(handler)
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
-- @function [parent=#f_rankRewardPreview] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_rankRewardPreview:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] onEnter
-------------------------------------------------------------------------------
function f_rankRewardPreview:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] onExit
-------------------------------------------------------------------------------
function f_rankRewardPreview:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG, self.m_updateRewardFlag1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_rankRewardPreview:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] onExitTransitionStart
-------------------------------------------------------------------------------
function f_rankRewardPreview:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] onCleanup
-------------------------------------------------------------------------------
function f_rankRewardPreview:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreview] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_rankRewardPreview:initAllComponent()

end
