require("scripts.auto.auto_elite_battle")
--[[--
精英副本开战展示
--]]--
f_stage_elite_battle = class("f_stage_elite_battle")
f_stage_elite_battle.__index = f_stage_elite_battle

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_elite_battle.static_create()
							 
	local eliteCardTable = createelite_battle()
	local info = eliteCardTable["elite_battle"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_stage_elite_battle)

	info.m_componentTable = eliteCardTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_elite_battle:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_chapterId = 0
	self.m_eliteData = 0
	self.m_list = nil
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_elite_battle:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_elite_battle] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_elite_battle:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] onEnter
-------------------------------------------------------------------------------
function f_stage_elite_battle:onEnter()
	local needGuideLine = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_TOUCH_ELITE_CARD)
	end
	
	self.m_componentTable["bottom_panel"]:setScale(0.1)
	local scaleTo = cc.ScaleTo:create(0.5, 1.0, 1.0)
	local action = g_game.g_transition.sequence({cc.EaseBounceOut:create(scaleTo), CCCallFunc:create(needGuideLine)})
	self.m_componentTable["bottom_panel"]:runAction(action)

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] onExit
-------------------------------------------------------------------------------
function f_stage_elite_battle:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_elite_battle:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_elite_battle:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] onCleanup
-------------------------------------------------------------------------------
function f_stage_elite_battle:onCleanup()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] setBattleInfo
-------------------------------------------------------------------------------
function f_stage_elite_battle:setBattleInfo(chapterId,data)
	self.m_chapterId = chapterId
	self.m_eliteData = data --elite表的data
	
	self.m_componentTable["silver_label"]:setString("+"..self.m_eliteData[22])
	self.m_componentTable["exp_label"]:setString("+"..self.m_eliteData[21])
	self.m_componentTable["title_label"]:setString("精英"..self.m_eliteData[2])
	
	self.m_list = fc.FContainerList:create(2)
	self.m_componentTable["bottom_panel"]:appendComponent(self.m_list)
	self.m_list:setSize(cc.size(376, 210))
	self.m_list:setAnchorPoint(cc.p(0.5,0.5))
	self.m_list:setPositionInContainer(cc.p(264,253))
	self.m_list:setStopTouchEvent(true) 
	self.m_list:enableClipping(true)
	
	self.m_list:setListInfo(10, 0, 3, 150, 200);
	
	self:fillList()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] fillList
-------------------------------------------------------------------------------
function f_stage_elite_battle:fillList()
	local rewardTable = {}
	
	local rewardType = 0
	--1物品 2美女 3名臣 4元宝 5银两6装备7vip元宝8功绩值9碎片10名臣碎片11美女碎片12装备碎片13兵法碎片
	for i = 1 ,15 do
		if i == 1 then
			rewardType = 5
		elseif i== 2 or i == 3 then
			rewardType = 3
		elseif  i == 4 or i == 5 then 
			rewardType = 2
		elseif  i == 6 or i== 7 then
			rewardType = 6
		elseif  i==8 or i== 9 then
			rewardType = 10
		elseif  i== 10 or i == 11 then
			rewardType = 11
		elseif  i== 12 or i == 13 then
			rewardType = 12
		elseif  i== 14 or i== 15 then
			rewardType = 1 
		end	
		
		if self.m_eliteData[21+i] ~= 0 and self.m_eliteData[21+i] ~= "" then
			table.insert(rewardTable,{["type"] = rewardType,["showId"] = self.m_eliteData[21+i]})
		end
	end
	
	for j = 1, #rewardTable do
		if rewardTable[j]["showId"] ~= 0 then
			local item = require("scripts.game.main.stage.f_stage_reward_item").new()
			self.m_list:appendComponent(item)
			item:setData(rewardTable[j])
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_battle] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_elite_battle:initAllComponent()
	self.m_componentTable["elite_close"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("elite_stage_battle")
	end
	self.m_componentTable["elite_close"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
   
	local battle = function()
		local remainCount = g_game.g_userInfoManager:getUserPveProgress()["remainCount"]
		if remainCount <= 0 then
			g_game.g_utilManager:showMsg("今日挑战次数已用尽")		
		else
			if g_game.g_utilManager:allGuidelinesIsFinish() then
				g_game.g_dataManager:saveBattleState(3,0)
				g_game.g_dataManager:saveElitePveProgress(self.m_chapterId,self.m_eliteData[1])
			end	
			g_game.g_userInfoManager:requestEliteBattle(self.m_chapterId,self.m_eliteData[1])
			g_game.g_userInfoManager:requestRecoverTime()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GOTO_ELITE)
		end 
	end
	self.m_componentTable["battle_btn"]:addHandleOfcomponentEvent(battle, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
  
end

