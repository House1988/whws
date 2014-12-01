--[[--
美女赏赐
--]]--

require("scripts.auto.auto_charge_reward_detail_panel")
require("scripts.game.main.reward.f_charge_reward_detail_item")

f_charge_reward_detail_panel = class("f_charge_reward_detail_panel")
f_charge_reward_detail_panel.__index = f_charge_reward_detail_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel.static_create()
	local mainPanelTable = createcharge_reward_detail_panel()
	local mainPanel = mainPanelTable["charge_reward_detail_panel"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_charge_reward_detail_panel)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_charge_reward_detail_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] onEnter
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:onEnter()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] onExit
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] onCleanup
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:initAllComponent()
	local cpTable = self.m_componentTable
	
	self.m_peroidId = 0
	self.m_rewardNumber = 0
	
	-- 奖品列表
	self.m_rewardItemTable = {}
	
	-- 确定按钮
	local confirmBtnEvent = function()
		if g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_chongzhi] then
			g_game.g_panelManager:removeUiPanel("charge_reward_detail_panel")
			local sendMsg = {}
			local userInfo = g_game.g_userInfoManager:getUserInfo()
			sendMsg["roleId"] = userInfo["roleId"]
		 	sendMsg["peroidId"] = self.m_peroidId
		 	sendMsg["rewardNumber"] = self.m_rewardNumber
			g_game.g_netManager:send_message(g_network_message_type.CS_ACCEPT_PEROID_CHARGE_REWARD, sendMsg)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
		else
			g_game.g_utilManager:showMsg("活动已结束")
		end
	end
	cpTable["crd_confirm_btn"]:addHandleOfcomponentEvent(confirmBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("charge_reward_detail_panel")
	end
	cpTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_panel] refreshRewardDetailPanel
-------------------------------------------------------------------------------
function f_charge_reward_detail_panel:refreshRewardDetailPanel(peroidId, rewardNumber, rewardData)
	self.m_peroidId = peroidId
	self.m_rewardNumber = rewardNumber
	 	
	local cpTable = self.m_componentTable
	self:clearRewardItemTable()
	
	if LANGUAGE_TYPE == 3 then
		cpTable["crd_title_label"]:setString("累計充值"..rewardData["money"] .. "元")
	else
		cpTable["crd_title_label"]:setString("累计充值"..rewardData["money"] .. "元")
	end
	
	for i=1,rewardData["reward"]["num"] do
		local itemPanel = f_charge_reward_detail_item.static_create()
	    itemPanel:setAnchorPoint(cc.p(0.5,0.5))
	    cpTable["crd_panel"]:appendComponent(itemPanel)
	    local x = 142 + (i-1)%3*125
	    local y = 180 + math.floor((i-1)/3)*156
	    itemPanel:setPositionInContainer(cc.p(x,y))
	    table.insert(self.m_rewardItemTable, itemPanel)
	    
		local detail = rewardData["reward"]["list"][i]
		local imagePath, qulity, name = g_game.g_dictConfigManager:getResByType(tonumber(detail["type"]), tonumber(detail["id"]))
		itemPanel:setName(name)
		itemPanel:setCount(tostring(detail["num"]))
		itemPanel:setImage(imagePath)
		itemPanel:setQulityBg(g_game.g_f_quality_image[qulity])
	end
end

function f_charge_reward_detail_panel:setBtnState(state)
 	self.m_componentTable["crd_confirm_btn"]:setButtonState(state)
end

---------------------------------------------------------------------------------
---- @function [parent=#f_charge_reward_detail_panel] clearRewardItemTable
---------------------------------------------------------------------------------
function f_charge_reward_detail_panel:clearRewardItemTable()
	for _,item in pairs(self.m_rewardItemTable) do
		self.m_componentTable["crd_panel"]:deleteComponent(item)
	end
	self.m_rewardItemTable = {}
end

