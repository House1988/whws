require("scripts.auto.auto_world_boss_open_ui")
require("scripts.auto.auto_world_boss_info1")
--[[--
世界boss开启
--]]--
f_world_boss_open = class("f_world_boss_open")
f_world_boss_open.__index = f_world_boss_open

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_world_boss_open.static_create()
							 
	local skillInfoTable = createworld_boss_open_ui()
	local skillInfo = skillInfoTable["world_boss_open_ui"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_world_boss_open)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_world_boss_open:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_rankList = {}
	
	self.m_courageTimes = 0
	self.m_RebornTime = 0
	
	self.m_isFightColdDown = false
	
	self.m_timer = 1
	
	self.m_lastAdd = 0
	
	self.m_warterBallAnim = nil
	self.m_shuimian = nil
	
	self.progressPanel = nil
	self.m_baseShuiMianPos = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] registerNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_open:registerNodeEvent(handler)
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
-- @function [parent=#f_world_boss_open] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_open:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] createCourageEffect
-------------------------------------------------------------------------------
function f_world_boss_open:createCourageEffect()
	local pos = self.m_componentTable["challenge_btn"]:getPositionInContainer()
	
	if self.progressPanel ~= nil then
		self:deleteComponent(self.progressPanel)
	end
	if self.m_shuimian ~= nil then
		self:deleteComponent(self.m_shuimian)
	end
	
	self.progressPanel = fc.FContainerPanel:create()
    self.progressPanel:setSize(cc.size(106,self.m_courageTimes*106/20))

	self.m_warterBallAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
	self.progressPanel:appendComponent(self.m_warterBallAnim)
	self.m_warterBallAnim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_warterBallAnim:setLoop(true)
	self.m_warterBallAnim:runAnimation(g_game.g_f_main_ui_effect.UI_BOSS[1], g_game.g_f_main_ui_effect.UI_BOSS[3])
	self.m_warterBallAnim:setPositionInContainer(cc.p(106/2,106/2))
	self.m_warterBallAnim:setScale(-1)
	
	self:appendComponent(self.progressPanel)
	
	self.progressPanel:setAnchorPoint(cc.p(0.5,1))
	self.progressPanel:setPositionInContainer(cc.p(pos.x,pos.y+53))
	self.progressPanel:enableClipping(true)
	self.progressPanel:setComponentZOrder(2)
    self.progressPanel:setScaleY(-1)
    
    if self.m_courageTimes < g_game.MAX_COURAGE_TIMES then 
    	self.m_shuimian = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self:appendComponent(self.m_shuimian)
		self.m_shuimian:setAnchorPoint(cc.p(0.5,0))
		self.m_shuimian:setLoop(true)
		self.m_shuimian:runAnimation(g_game.g_f_main_ui_effect.UI_BOSS[1], g_game.g_f_main_ui_effect.UI_BOSS[2])
		self.m_shuimian:setComponentZOrder(2)
		self.m_baseShuiMianPos ={["x"] = pos.x,["y"] = pos.y+53} 
		
		self.m_shuimian:setPositionInContainer(cc.p(self.m_baseShuiMianPos.x,self.m_baseShuiMianPos.y - self.m_courageTimes*106/20+1))
    	
    end
		
	self.m_componentTable["challenge_btn"]:setComponentZOrder(3)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] onEnter
-------------------------------------------------------------------------------
function f_world_boss_open:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_BOSS[1])
	
	local bossInfo = g_game.g_dictConfigManager:getBossInfoByDay()
	local textInfo = g_game.g_dictConfigManager:getLanTextById(bossInfo[3])  
	self.m_componentTable["open_des4"]:setString(textInfo)
	
	if bossInfo[5] == 1 then 
		self.m_componentTable["boss_arr_atk_flag"]:setImage("batch_ui/gongji_tubiao.png")
		self.m_componentTable["boss_arr_atk_flag"]:setSize(cc.size(43,60))
	else
		self.m_componentTable["boss_arr_atk_flag"]:setImage("batch_ui/fangyu_tubiao.png")
		self.m_componentTable["boss_arr_atk_flag"]:setSize(cc.size(43,60))
	end

	self:initAllComponent()
	
	self.event_refreshBossOpen = function()
		self:updateOpenData()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_BOSS_OPEN, self.event_refreshBossOpen)
	
	self.event_refreshUserBoss = function()
		self:updateBossFightInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BOSS_USERINFO , self.event_refreshUserBoss)
	
	self.event_refreshCourage = function()
		self:refreshCourage()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_COURAGE_BOSS , self.event_refreshCourage)
	
	self.event_refreshReborn = function()
		self:refreshReborn()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_REBORN_BOSS , self.event_refreshReborn)
	
	g_game.g_userInfoManager:requestWorldBossUserInfo()
	
	g_game.g_gameManager:addUpdateObj(self)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] refreshCourage
-------------------------------------------------------------------------------
function f_world_boss_open:refreshCourage()
	local result = g_game.g_userInfoManager:getCourageResult()
--	self.m_componentTable["add_num"]:setString(result["addition"].."%")
	
	local numAnim = require("scripts.game.main.common.f_number_effect").new()
	numAnim:setup(self.m_componentTable["add_num"], 21, "%d", false, false)
	self:appendComponent(numAnim)
	local p = self.m_componentTable["add_num"]:getPositionInContainer()
	numAnim:setPositionInContainer(p)
	numAnim:play(self.m_lastAdd,result["addition"], 1)
	
	local showAdd =result["addition"] - self.m_lastAdd
	
	self.m_lastAdd = result["addition"]
	
	g_game.g_utilManager:showMsg("鼓舞成功，所有属性+"..showAdd.."%")
	self.m_courageTimes = result["courageTimes"]
	
	if self.m_courageTimes ~= 0 then
		self:createCourageEffect()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] refreshReborn
-------------------------------------------------------------------------------
function f_world_boss_open:refreshReborn()
	local result = g_game.g_userInfoManager:getRebornResult()
	
	self.m_RebornCount = result["count"]
	local cost = (self.m_RebornCount+1)*10
	self.m_componentTable["reborn_yuanbao"]:setString(cost)
	
	self.m_isFightColdDown = false
	self:updateFightBtn()
	self.m_RebornTime = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] update
-------------------------------------------------------------------------------
function f_world_boss_open:update(dt)
	if self.m_RebornTime == 0 then
		return
	end
	
	self.m_timer = self.m_timer - dt
	
	if self.m_timer <= 0 then
		self.m_RebornTime = self.m_RebornTime -1
		
		if self.m_RebornTime <= 0 then
			self.m_isFightColdDown = false	
			self:updateFightBtn()
			self.m_RebornTime = 0
		end
		self.m_componentTable["dengdai_count"]:setString(self.m_RebornTime)
		
		self.m_timer = self.m_timer + 1
	end
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] updateBossFightInfo
-------------------------------------------------------------------------------
function f_world_boss_open:updateBossFightInfo()
	local fightData = g_game.g_userInfoManager:getWorldBossUserInfo()
	
	self.m_courageTimes = fightData["courageTimes"]
	self.m_RebornTime = fightData["rebornLeftTime"]
	self.m_RebornCount = fightData["rebornTimes"]
	
	if self.m_courageTimes ~= 0 then
		self:createCourageEffect()
	end
	
	if self.m_RebornTime == 0 then
		self.m_isFightColdDown = false
	else
		self.m_isFightColdDown = true
	end
	
	self:updateFightBtn()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] updateFightBtn
-------------------------------------------------------------------------------
function f_world_boss_open:updateFightBtn()

	if self.m_isFightColdDown then
		self.m_componentTable["challenge_btn"]:setVisible(false)
		self.m_componentTable["reborn_btn"]:setVisible(true)
		self.m_componentTable["reborn_yuanbao"]:setVisible(true)
		self.m_componentTable["dengdai"]:setVisible(true)
		self.m_componentTable["dengdai_count"]:setVisible(true)
		
		local cost = (self.m_RebornCount+1)*10
		self.m_componentTable["reborn_yuanbao"]:setString(cost)
		self.m_componentTable["dengdai_count"]:setString(self.m_RebornTime)
		
		if self.progressPanel ~= nil then
			self:deleteComponent(self.progressPanel)
		end
		if self.m_shuimian ~= nil then
			self:deleteComponent(self.m_shuimian)
		end
	else
		self.m_componentTable["challenge_btn"]:setVisible(true)
		self.m_componentTable["reborn_btn"]:setVisible(false)
		self.m_componentTable["reborn_yuanbao"]:setVisible(false)
		self.m_componentTable["dengdai"]:setVisible(false)
		self.m_componentTable["dengdai_count"]:setVisible(false)
		
		if self.m_courageTimes ~= 0 then
			self:createCourageEffect()
		end
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] updateOpenData
-------------------------------------------------------------------------------
function f_world_boss_open:updateOpenData()
	local openData = g_game.g_userInfoManager:getWorldBossOpen()
	
	local rankList = openData["list"]
	for i=1 ,#rankList do
		if self.m_rankList[i] == nil then
			self.m_rankList[i] = createworld_boss_info1()
			local item = self.m_rankList[i]["world_boss_info1"]
			item:setAnchorPoint(cc.p(0.5,0.5))
			self:appendComponent(item)
			item:setPositionInContainer(cc.p(155,268+(i-1)*30))
		end
		
		self.m_rankList[i]["animlabel"]:setScale(0.6)
		self.m_rankList[i]["animlabel"]:setTextWithInt(i)
		self.m_rankList[i]["name_label"]:setString(rankList[i]["roleName"])
		self.m_rankList[i]["sub_label1"]:setString(rankList[i]["hurt"])
		local hurtPer = rankList[i]["hurtPercent"] /100
		self.m_rankList[i]["sub_label2"]:setString("("..hurtPer.."%)")
	end
	
	if openData["rank"] == 0 then
		self.m_componentTable["open_myrank"]:setString("未上榜")
		self.m_componentTable["open_myhurt"]:setVisible(false)
		self.m_componentTable["open_myhurtnum"]:setVisible(false)
	else
		self.m_componentTable["open_myhurt"]:setVisible(true)
		self.m_componentTable["open_myhurtnum"]:setVisible(true)
		self.m_componentTable["open_myrank"]:setString(openData["rank"])
		self.m_componentTable["open_myhurtnum"]:setString(openData["hurt"])
	end
	
	self.m_componentTable["open_cur_peoplenum"]:setString(openData["count"])
	self.m_componentTable["enemy_hurt_show"]:setString(openData["hpLeft"].."/"..openData["hp"])
	local per = openData["hpLeft"] / openData["hp"] *100
	self.m_componentTable["open_loadingBar"]:setPercent(math.floor(per))
	
	self.m_lastAdd = openData["addition"]
	self.m_componentTable["add_num"]:setString(openData["addition"])
	
	if openData["hpLeft"] == 0 then
		g_game.g_utilManager:reCalculateWorldBoss()
		g_game.g_userInfoManager.m_refreshFightRequest = g_game.REFRESH_UNOPEN_BOSS
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] onExit
-------------------------------------------------------------------------------
function f_world_boss_open:onExit()
	self:unregisterNodeEvent()
	g_game.g_gameManager:removeUpdateObj(self)
	
	if self.m_warterBallAnim ~= nil then
		self:deleteComponent(self.m_warterBallAnim)
	end
	
	if self.m_shuimian ~= nil then
		self:deleteComponent(self.m_shuimian)
	end
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_BOSS[1])
	
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_COURAGE_BOSS , self.event_refreshCourage)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_REBORN_BOSS , self.event_refreshReborn)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BOSS_USERINFO , self.event_refreshUserBoss)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_BOSS_OPEN, self.event_refreshBossOpen)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] setLeftTime
-------------------------------------------------------------------------------
function f_world_boss_open:setLeftTime(targetSec)
	local time = g_game.g_utilManager:getExportTime(targetSec)
	self.m_componentTable["open_challenge_leftTime"]:setString(time)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_world_boss_open:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] onExitTransitionStart
-------------------------------------------------------------------------------
function f_world_boss_open:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] onCleanup
-------------------------------------------------------------------------------
function f_world_boss_open:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_world_boss_open:initAllComponent()
	local guwu1 = function()
		self:encourageBattle(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["encourage_once"]:addHandleOfcomponentEvent(guwu1, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local guwu10 = function()
		self:encourageBattle(10)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["encourage_multi"]:addHandleOfcomponentEvent(guwu10, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local challenge = function()
		self:challengeBoss()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["challenge_btn"]:addHandleOfcomponentEvent(challenge, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local reborn = function()
		self:rebornToBattle()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["reborn_btn"]:addHandleOfcomponentEvent(reborn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] encourageBattle
-------------------------------------------------------------------------------
function f_world_boss_open:encourageBattle(times)
	local targetTimes = self.m_courageTimes + times
	
	if targetTimes > g_game.MAX_COURAGE_TIMES then
		g_game.g_utilManager:showMsg("每次挑战最多只能鼓舞20次")	
		return
	end
	
	local cost = 10
	if times ~= 1 then
		cost = 80
	end
	
	local userGold = g_game.g_userInfoManager:getUserInfo()["gold"]
	if userGold < cost then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		return
	end
	
	g_game.g_userInfoManager:requestBossCourage(times)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] challengeBoss
-------------------------------------------------------------------------------
function f_world_boss_open:challengeBoss()
	g_game.g_userInfoManager:requestWorldBossChallenge()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_open] rebornToBattle
-------------------------------------------------------------------------------
function f_world_boss_open:rebornToBattle()
	local cost = (self.m_RebornCount+1)*10
	
	local userGold = g_game.g_userInfoManager:getUserInfo()["gold"]
	if userGold < cost then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		return
	end

	g_game.g_userInfoManager:requestBossReborn()
end
