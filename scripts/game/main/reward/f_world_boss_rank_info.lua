require("scripts.auto.auto_world_boss_rank_show")
require("scripts.auto.auto_world_boss_info2")
--[[--
世界boss 伤害详情
--]]--
f_world_boss_rank_info = class("f_world_boss_rank_info")
f_world_boss_rank_info.__index = f_world_boss_rank_info

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_world_boss_rank_info.static_create()
							 
	local skillInfoTable = createworld_boss_rank_show()
	local skillInfo = skillInfoTable["world_boss_rank_show"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_world_boss_rank_info)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_world_boss_rank_info:panelInitBeforePopup()
	self:registerNodeEvent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] registerNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_rank_info:registerNodeEvent(handler)
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
-- @function [parent=#f_world_boss_rank_info] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_world_boss_rank_info:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] onEnter
-------------------------------------------------------------------------------
function f_world_boss_rank_info:onEnter()
	local rankList = g_game.g_userInfoManager:getWorldBossRankList()
	
	self.m_componentTable["shuchu_hurt"]:setString(rankList["hurt"])
	local percent = rankList["percent"]/100
	self.m_componentTable["xueliang_percent"]:setString(percent.."%")
	
	if rankList["rank"] == 0 then
		self.m_componentTable["rank_rank"]:setString("未上榜")
	else
		self.m_componentTable["rank_rank"]:setString(rankList["rank"])
	end
	
	local showContributeNum = math.floor(rankList["hurt"] / 2)   --显示奖励功绩值 是当前伤害的 1/2
	local rewardList = rankList["rewardList"]
	
	local showTable = {}
	--功绩值不需要id
	local imagePath1,quality1,name1 = g_game.g_dictConfigManager:getResByType(8,8)
	table.insert(showTable,{["id"] = 8,["type"] = 8,["imagePath"] = imagePath1,["quality"] = quality1,["name"] = name1,["value"] = showContributeNum})
	for i = 1,#rewardList do
		local imagePath,quality,name = g_game.g_dictConfigManager:getResByType(rewardList[i]["type"],rewardList[i]["id"])
		table.insert(showTable,{["id"] = rewardList[i]["id"],["type"] = rewardList[i]["type"],["imagePath"] = imagePath,["quality"] = quality,["name"] = name,["value"] = rewardList[i]["value"]})
	end
	
	for j = 1, 4 do
		if j > #showTable then
			self.m_componentTable["reward_"..j]:setVisible(false)
			self.m_componentTable["reward_card"..j]:setVisible(false)
			self.m_componentTable["num"..j]:setVisible(false)
			self.m_componentTable["reward_name"..j]:setVisible(false)
		    self.m_componentTable["flag"..j]:setVisible(false)
		    self.m_componentTable["reward_namedi"..j]:setVisible(false)
		else
		    self.m_componentTable["reward_"..j]:setImage(g_game.g_f_quality_image[showTable[j]["quality"]])
			self.m_componentTable["reward_"..j]:setSize(cc.size(73,73))
			
			self.m_componentTable["reward_card"..j]:setImage(showTable[j]["imagePath"])
			self.m_componentTable["reward_card"..j]:setExtensionsTextureRect(cc.rect(0,0,90,90))
			self.m_componentTable["reward_card"..j]:setSize(cc.size(63,63))
			
			self.m_componentTable["num"..j]:setScale(0.3)
			self.m_componentTable["num"..j]:setTextWithInt(showTable[j]["value"])
			self.m_componentTable["reward_name"..j]:setScale(0.7)
			self.m_componentTable["reward_name"..j]:setString(showTable[j]["name"])
			
			if showTable[j]["type"] >= 9 and showTable[j]["type"] <= 13 then
				local type = g_game.g_dictConfigManager:getPieceType(showTable[j]["id"])
				
				if type == 1 or type == 2 then
				    self.m_componentTable["flag"..j]:setImage("batch_ui/hunpi_biaozhi.png")
				    self.m_componentTable["flag"..j]:setSize(cc.size(30,49))
				elseif type == 3 or type == 4 then
				    self.m_componentTable["flag"..j]:setImage("batch_ui/suipian_junjichu.png")
				    self.m_componentTable["flag"..j]:setSize(cc.size(49,34))
				end
			end
		end
	end
	
	if rankList["isBossKill"] == 1 then
		self.m_componentTable["killName"]:setString(rankList["killBossName"])
		self.m_componentTable["ewai_get"]:setString(rankList["gainContribution"])
	else
		self.m_componentTable["myTip4"]:setVisible(false)
		self.m_componentTable["myTip5"]:setVisible(false)
		self.m_componentTable["killName"]:setVisible(false)
		self.m_componentTable["ewai_get"]:setVisible(false)
	end
	
	self:initKillList()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] initKillList
-------------------------------------------------------------------------------
function f_world_boss_rank_info:initKillList()
	local killList = g_game.g_userInfoManager:getWorldBossRankList()["list"]
	
	for i = 1,#killList do
		local killItemTable = createworld_boss_info2()
		local item = killItemTable["world_boss_info2"]
		
		killItemTable["animlabel1"]:setTextWithInt(i)
		killItemTable["name_label1"]:setString(killList[i]["roleName"])
		killItemTable["sub_label11"]:setString(killList[i]["hurt"])
		local hurtPer = killList[i]["hurtPercent"]/100
		killItemTable["sub_label22"]:setString("("..hurtPer.."%)")
		killItemTable["cur_player_contri"]:setString(killList[i]["contribution"])
		
		item:setAnchorPoint(cc.p(0.5,0.5))
		self:appendComponent(item)
		
		item:setPositionInContainer(cc.p(604,140.5+(i-1)*39))
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] onExit
-------------------------------------------------------------------------------
function f_world_boss_rank_info:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_world_boss_rank_info:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] onExitTransitionStart
-------------------------------------------------------------------------------
function f_world_boss_rank_info:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] onCleanup
-------------------------------------------------------------------------------
function f_world_boss_rank_info:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_world_boss_rank_info] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_world_boss_rank_info:initAllComponent()
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("world_boss_rank_info")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
    self.m_componentTable["popClose"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    self.m_componentTable["sure_btn"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
end


