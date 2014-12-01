require("scripts.auto.auto_zouzang_reward_pop")
--[[--
奏章奖励
--]]--

f_zouzhang_reward_panel = class("f_zouzhang_reward_panel")
f_zouzhang_reward_panel.__index = f_zouzhang_reward_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel.static_create()
	local mainPanelTable = createzouzang_reward_pop()
	local mainPanel = mainPanelTable["zouzang_reward_pop"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_zouzhang_reward_panel)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:registerNodeEvent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_zouzhang_reward_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] onEnter
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] onExit
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] onCleanup
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:initAllComponent()
	self:setStopTouchEvent(true)
	local cpTable = self.m_componentTable
	
	-- 收下按钮
	local acceptBtnEvent = function()
		g_game.g_panelManager:removeUiPanel("zouzhang_reward_pop")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	cpTable["accept_btn"]:addHandleOfcomponentEvent(acceptBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_panel] setData
-------------------------------------------------------------------------------
function f_zouzhang_reward_panel:setData(dataTable)
	local cpTable = self.m_componentTable
	
	local listNum = dataTable["rewardList_Num"]
	if listNum ~= nil and listNum > 0 then
		-- 此处奖励只有1类
		local rewardInfo = dataTable["rewardList"][1]
		local imagePath, q, name = g_game.g_dictConfigManager:getResByType(rewardInfo["type"], rewardInfo["id"])
		cpTable["zr_count_lbl"]:setString(rewardInfo["num"]) -- 个数
		
		cpTable["reward_name_label"]:setString(name)
		if imagePath ~= nil then
			cpTable["head_image"]:setImage(imagePath)
			cpTable["head_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		end
		cpTable["item_q_bg"]:setImage(g_game.g_f_quality_image[q])
		
		-- 更新数据
		g_game.g_userInfoManager:updatePackToUser(listNum,dataTable["rewardList"])
	end
end

