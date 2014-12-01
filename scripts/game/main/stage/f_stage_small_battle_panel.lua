require("scripts.auto.auto_zhanyi_waikuang")
require("scripts.game.main.card.f_card_paibing_huangzi")
require("scripts.game.main.stage.f_stage_reward_popup")
require("scripts.game.main.stage.f_stage_reset_num_popup")
require("scripts.game.main.shangcheng.f_vip_package_item")

require("scripts.auto.auto_zhanyi_atk_panel")
require("scripts.auto.auto_zhanyi_def_panel")
--[[--
名臣选择 界面
--]]--
f_stage_small_battle_panel = class("f_stage_small_battle_panel")
f_stage_small_battle_panel.__index = f_stage_small_battle_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_stage_small_battle_panel.static_create()
	local smallBattle_table = createzhanyi_waikuang()
	local smallBattle_panel = smallBattle_table["zhanyi_waikuang"]

	local funTable = {}
	tolua.setpeer(smallBattle_panel, funTable)
	setmetatable(funTable, f_stage_small_battle_panel)

	smallBattle_panel.m_battlePanel_title = smallBattle_table
	return smallBattle_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:panelInitBeforePopup()
	self:registerNodeEvent()

	self.m_chapterId = 0
	self.m_bigStageId = 0
	self.m_smallStageId = 0

	self.m_stage_list = nil
	self.m_rewardList = nil
	self.m_atkPanelTable = nil
	self.m_defPanelTable = nil
	self.m_rewardItemArr = {}
	
	self.m_isFightThrough = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] setSmallBattleData
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:setSmallBattleData(chapterId, bigBattleId)
	self.m_chapterId = chapterId
	self.m_bigStageId = bigBattleId

	self:updateBigBattleInfo()
	self:initSmallBattleList()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] setGuideLineSmallBattleData
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:setGuideLineSmallBattleData(chapterId, bigBattleId, smallBattleId)
	self.m_chapterId = chapterId
	self.m_bigStageId = bigBattleId

	self:updateBigBattleInfo()
	self:initGuideLineSmallBattleList(smallBattleId)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] updateBigBattleInfo
-- 更新界面显示
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:updateBigBattleInfo()
	local bigBattleName = g_game.g_dictConfigManager:getBigBattleName(self.m_bigStageId)
	
	self.m_battlePanel_title["zy_name_label"]:setString(bigBattleName)
	
	local userStrength = g_game.g_userInfoManager:getUserStrength()
	local userLv = g_game.g_userInfoManager:getUserLv()
	local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userLv)
--	self.m_battlePanel_title["zy_tili_num_label"]:setString(userStrength.."/"..userStrengthLimit)
	local func = function()
	end
	self.m_battlePanel_title["zy_tili_num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,0]"..userStrength.."[250,255,165]/"..userStrengthLimit, cc.c3b(250,255,165)), func)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] initSmallBattleList
-- 初始化底部的list
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:initSmallBattleList()
	self.m_battlePanel_title["zy_paibing_button"]:setComponentZOrder(4)
	
	self.m_stage_list = require("scripts.game.main.stage.f_stage_small_battle_list").new()
	self.m_battlePanel_title["zhanyi_waikuang"]:appendComponent(self.m_stage_list)
	self.m_stage_list:setSize(cc.size(850,260))
	self.m_stage_list:setListInfo(1,35,2,114,250)
	self.m_stage_list:setAnchorPoint(cc.p(0,1))
	self.m_stage_list:setComponentZOrder(2)
	self.m_stage_list:enableClipping(false)
	self.m_stage_list:setPositionInContainer(cc.p(0, 365))	
	self.m_stage_list:setListData(self.m_bigStageId)
	
	local updateSmallStageReward = function(smallStage)
		self:updateDropInfo(smallStage:getSmallStageId())
	end
	self.m_stage_list:setSmallBattleRewardCallBack(updateSmallStageReward)
	
	local gotoBattle = function(smallStage)
		self:gotoSmallStageBattle(smallStage)
	end
	self.m_stage_list:setGotoBattleCallBack(gotoBattle)
	
	--定义战役关卡 通关奖励弹出
	local popupStageReward = function(smallStage)
		self:popupStageReward(smallStage)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_STAGE_REWARD_PRESS)
	end
	self.m_stage_list:setStageRewardCallBack(popupStageReward)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] initGuideLineSmallBattleList
-- 初始化底部的list 用于新手指引
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:initGuideLineSmallBattleList(smallBattleId)
	self.m_battlePanel_title["zy_paibing_button"]:setComponentZOrder(4)
	
	self.m_stage_list = require("scripts.game.main.stage.f_stage_small_battle_list").new()
	self.m_battlePanel_title["zhanyi_waikuang"]:appendComponent(self.m_stage_list)
	self.m_stage_list:setSize(cc.size(850,260))
	self.m_stage_list:setListInfo(1,35,2,112,230)
	self.m_stage_list:setAnchorPoint(cc.p(0,1))
	self.m_stage_list:setComponentZOrder(2)
	self.m_stage_list:enableClipping(false)
	self.m_stage_list:setPositionInContainer(cc.p(0, 380))	
	self.m_stage_list:setGuideLineListData(self.m_bigStageId,smallBattleId)
	
	local updateSmallStageReward = function(smallStage)
		self:updateDropInfo(smallStage:getSmallStageId())
	end
	self.m_stage_list:setSmallBattleRewardCallBack(updateSmallStageReward)
	
	local gotoBattle = function(smallStage)
		self:gotoSmallStageBattle(smallStage)
	end
	self.m_stage_list:setGotoBattleCallBack(gotoBattle)
	
	--定义战役关卡 通关奖励弹出
	local popupStageReward = function(smallStage)
		self:popupStageReward(smallStage)
	end
	self.m_stage_list:setStageRewardCallBack(popupStageReward)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] popupStageReward
-- 弹出奖励信息
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:popupStageReward(smallStage)
	local data = smallStage:getRewardData()
	data["areaId"] = self.m_chapterId
	data["stageId"] = self.m_bigStageId
	
	local rewardPop = f_stage_reward_popup.static_create()
	rewardPop:panelInitBeforePopup()
	rewardPop:setData(data)
	
	g_game.g_panelManager:showUiPanel(rewardPop, "mail_attachment")
	local flag = self:isRewardCanBeGet()
	rewardPop:setGetFlag(flag)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] isRewardCanBeGet
-- 判断当前奖励是否可以领取
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:isRewardCanBeGet()
	local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()
	
	for i = 1, #smallStageNumsData["levelDate"] do
		if smallStageNumsData["levelDate"][i]["star"] < 3 then
			return 0 --不满足三星条件 不可领
		end
	end
	--是否已领取判断
	if smallStageNumsData["flag"] == 0 then
		return 0 --不可领
	elseif smallStageNumsData["flag"] == 1 then
		return 1 --可领
	elseif smallStageNumsData["flag"] == 2 then
		return 2 --领过了
	end
	
	return -1
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] updateDropInfo
-- 更新掉落信息
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:updateDropInfo(smallStageId)
	self.m_smallStageId = smallStageId
	
	local stageCostStrength = g_game.g_dictConfigManager:getCostStrength(self.m_smallStageId)
	
	local obtainSilver = g_game.g_dictConfigManager:getObtainSilver(self.m_smallStageId)
	local obtainExp = g_game.g_dictConfigManager:getObtainExp(self.m_smallStageId)
	
	self.m_battlePanel_title["cost_liangcao"]:setString(stageCostStrength)
	self.m_battlePanel_title["reward_yinliang"]:setString(obtainSilver)
	self.m_battlePanel_title["reward_jingyan"]:setString(obtainExp)
	
	local pve_level_info = g_game.g_dictConfigManager:getLevelInfo(smallStageId)
	
	--攻击还是防御关卡
	local type = pve_level_info[4]
	if type == 1 then
		self.m_battlePanel_title["atk_type_image"]:setImage("batch_ui/gongji_tubiao.png")
		self.m_battlePanel_title["atk_type_image"]:setSize(cc.size(30,36))
	else
		self.m_battlePanel_title["atk_type_image"]:setImage("batch_ui/fangyu_tubiao.png")
		self.m_battlePanel_title["atk_type_image"]:setSize(cc.size(30,36))
	end
	
	if self.m_rewardList ~= nil then
		self:deleteComponent(self.m_rewardList)
	end
	self.m_rewardList = nil
	self.m_rewardItemArr = {}
	
	if self.m_rewardList == nil then
		self.m_rewardList = fc.FContainerList:create(2)
	    self.m_rewardList:setSize(cc.size(284,140))
	    self.m_rewardList:setAnchorPoint(cc.p(0.5,0.5))
	    self:appendComponent(self.m_rewardList)
	    self.m_rewardList:enableClipping(true)
	    self.m_rewardList:setPositionInContainer(cc.p(478,244))
		self.m_rewardList:setListInfo(10, 0, 10, 104, 140)
	end
	
	local rewardData = g_game.g_dictConfigManager:getPveStageRewardData(self.m_smallStageId)
	for i = 1, #rewardData do
		local item = f_vip_package_item.static_create()
	    item:panelInitBeforePopup()
		item:setData(rewardData[i])
		item:setNumVisible(false)
		self.m_rewardList:appendComponent(item)
		table.insert(self.m_rewardItemArr,item)
	end
	
	self:updateEnemyPosition()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] updateEnemyPosition
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:updateEnemyPosition()
	local pve_level_info = g_game.g_dictConfigManager:getLevelInfo(self.m_smallStageId)
	local levelType = pve_level_info[4]
	
	local enemyPositionData = g_game.g_dictConfigManager:getLevelEnemyData(self.m_smallStageId)
	
	if levelType == 2 then
		self.m_atkPanelTable["zhanyi_atk_panel"]:setVisible(true)
		self.m_defPanelTable["zhanyi_def_panel"]:setVisible(false)
		for i = 1,7 do
			if #enemyPositionData >= i then
				local soldierResType = g_game.g_dictConfigManager:getSoldierType(enemyPositionData[i])
				self.m_atkPanelTable["enemy_pos1"..i]:setVisible(true)
    			self.m_atkPanelTable["enemy_pos1"..i]:setImage(g_game.g_f_soldier_flage_image[soldierResType])
    			self.m_atkPanelTable["enemy_pos1"..i]:setSize(cc.size(35,35))
    		else
    			self.m_atkPanelTable["enemy_pos1"..i]:setVisible(false)
			end
		end
	else
		self.m_atkPanelTable["zhanyi_atk_panel"]:setVisible(false)
		self.m_defPanelTable["zhanyi_def_panel"]:setVisible(true)
		for i = 1,7 do
			if #enemyPositionData >= i then
				local soldierResType = g_game.g_dictConfigManager:getSoldierType(enemyPositionData[i])
				self.m_defPanelTable["enemy_pos2"..i]:setVisible(true)
    			self.m_defPanelTable["enemy_pos2"..i]:setImage(g_game.g_f_soldier_flage_image[soldierResType])
    			self.m_defPanelTable["enemy_pos2"..i]:setSize(cc.size(35,35))
    		else
    			self.m_defPanelTable["enemy_pos2"..i]:setVisible(false)
			end
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] gotoSmallStageBattle
-- 进入战斗
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:gotoSmallStageBattle(smallStage)
	self.m_smallStageId = smallStage:getSmallStageId()

	if not smallStage:getIsAtkNumEnough() then
		g_game.g_userInfoManager:requestBuyChallengeNumCondition(self.m_smallStageId)
		return
	end
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local userStrength = userInfo["strength"]
	local needStrength = g_game.g_dictConfigManager:getNeedStrength(self.m_smallStageId)
	
	if userStrength < needStrength then
		--粮草快速购买
		g_game.g_utilManager:popupQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_STRENGTH)
		return
	end
	
	if g_game.g_utilManager:allGuidelinesIsFinish() then
		g_game.g_dataManager:saveBattleState(1,0)
		g_game.g_dataManager:savePveProgress(self.m_chapterId, self.m_bigStageId, self.m_smallStageId)
	end	
	
	g_game.g_userInfoManager:requestPveBattle(self.m_chapterId, self.m_bigStageId, self.m_smallStageId)
	g_game.g_userInfoManager:requestRecoverTime()
			
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] popupBuyChallengeNum
-- 弹出购买次数面板
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:popupBuyChallengeNum()
	local resetChallenge = f_stage_reset_num_popup.static_create()
    resetChallenge:panelInitBeforePopup()
    resetChallenge:setSmallStageId(self.m_smallStageId)
	g_game.g_panelManager:showUiPanel(resetChallenge,"stage_buy_challenge")
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] guideLinePveInitSmallBattle
-- 新手指引 更新上一个打的小关卡
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:guideLinePveInitSmallBattle(bigBattleId,levelId)
	local smallBattleDataTable = g_game.g_dictConfigManager:getSmallBattleArr(bigBattleId)
	
	local lastSmallBattleId = levelId
	
	self.m_isFightThrough = false
	local len = #smallBattleDataTable
	if smallBattleDataTable[len][1] < lastSmallBattleId then
		lastSmallBattleId = smallBattleDataTable[len][1]
		self.m_isFightThrough = true
	end
	
--	self:updateSaoDangbtn()
	self:updateDropInfo(lastSmallBattleId)
	local index = self.m_stage_list:guideLineUpdateLastSmallBattle(lastSmallBattleId)
	self.m_stage_list:setScrollOffset(cc.p(math.min(0, 850 - index * 112 - 2 * (index + 1)), 0))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] updateLastSmallBattleFromServer
-- 更新上一个打的小关卡
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:updateLastSmallBattleFromServer()
	local areaId,stageId,levelId = g_game.g_dataManager:getPveProgress()
	
	local smallBattleDataTable = g_game.g_dictConfigManager:getSmallBattleArr(self.m_bigStageId)
	
	local lastSmallBattleId = g_game.g_userInfoManager:getUserPveProgress()["level"]
	
	self.m_isFightThrough = false --该stage 是否已打穿
	
	local len = #smallBattleDataTable
	if smallBattleDataTable[len][1] < lastSmallBattleId then
		lastSmallBattleId = smallBattleDataTable[len][1]
		
		if levelId ~= "" and levelId < smallBattleDataTable[len][1] then
			lastSmallBattleId = levelId
		end
		self.m_isFightThrough = true
	end
	
	self:updateDropInfo(lastSmallBattleId)
	self.m_stage_list:setFightThrough(self.m_isFightThrough)
	
--	self:updateSaoDangbtn()
	
	local index = self.m_stage_list:updateLastSmallBattle(lastSmallBattleId)
	if index == len then
		index = index + 1
	end
	self.m_stage_list:setScrollOffset(cc.p(math.min(0, 850 - index * 112 - 2 * (index + 1)), 0))
	
	
	self:judge3StarGuideStep()
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] judge3StarGuideStep
-- 判断 3星奖励 分支引导
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:judge3StarGuideStep()
	local isCanGet = true
	local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()
	if smallStageNumsData["flag"] ~= 1 then
		isCanGet = false
	end
		
	for i = 1, #smallStageNumsData["levelDate"] do
		if smallStageNumsData["levelDate"][i]["star"] < 3 then
			isCanGet = false
		end
	end
	
	if self.m_isFightThrough and isCanGet and self.m_bigStageId == 1 then--乌兰木通 
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_3STAR_GUIDE)
	end
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] updateSaoDangbtn
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:updateSaoDangbtn()
	if self.m_isFightThrough  then
		self.m_battlePanel_title["button_saodang"]:setButtonState(2)
	else
		self.m_battlePanel_title["button_saodang"]:setButtonState(8)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_small_battle_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] onEnter
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:onEnter()
	
	self.m_atkPanelTable =  createzhanyi_atk_panel()
	local atkPanel = self.m_atkPanelTable["zhanyi_atk_panel"]
    self:appendComponent(atkPanel)
    atkPanel:setAnchorPoint(cc.p(0,1))
    atkPanel:setPositionInContainer(cc.p(645,205))
    atkPanel:setVisible(false)
	
	self.m_defPanelTable = createzhanyi_def_panel()
	local defPanel = self.m_defPanelTable["zhanyi_def_panel"]
    self:appendComponent(defPanel)
    defPanel:setAnchorPoint(cc.p(0,1))
    defPanel:setPositionInContainer(cc.p(645,205))
    defPanel:setVisible(false)
	
	self.m_battlePanel_title["zy_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self:initAllComponent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SMALL_BATTLE)
	
	local userStrength = g_game.g_userInfoManager:getUserStrength()
	local userLv = g_game.g_userInfoManager:getUserLv()
	local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userLv)
	
	self.m_liangcaoAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_liangcaoAnim:setup(self.m_battlePanel_title["zy_tili_num_label"], 21, "[0,255,0]%d/[250,255,165]" .. userStrengthLimit, false, false)
	self.m_battlePanel_title["zhanyi_waikuang"]:appendComponent(self.m_liangcaoAnim)
	local p = self.m_battlePanel_title["zy_tili_num_label"]:getPositionInContainer()
	self.m_liangcaoAnim:useColor(true)
	self.m_liangcaoAnim:setPositionInContainer(p)
	self.m_liangcaoAnim:setLastValue(userStrength)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] onExit
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:onExit()
	self:unregisterNodeEvent()
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateRecover1)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_POP_BUY_PVE_NUM, self.event_updatePopBuyNum)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_PVE_NUM_RESULT, self.event_updateBuyNumResult2)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_updateUserInfo5)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_STAGE_REWARD, self.event_updateStageRewardFlag)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE_NUM, self.event_updateBattleNum)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] onCleanup
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:onCleanup()
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] saodang
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:saodang(isMore)
--	local userLv = g_game.g_userInfoManager:getUserLv()
--	if userLv < g_game.OPEN_SAODANG_LV then
--		if isMore then
--			g_game.g_utilManager:showMsg(g_game.OPEN_SAODANG_LV.."级达到VIP3开启扫荡多次，体验非一般的爽快战斗！")
--		else
--			g_game.g_utilManager:showMsg(g_game.OPEN_SAODANG_LV.."级达到VIP2开启扫荡一次，体验非一般的爽快战斗！")
--		end
--	
--	else
		self:saoDangCurStageLevel(isMore)
--	end
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] saoDangCurStageLevel
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:saoDangCurStageLevel(isMore)
	local stage = self.m_stage_list:getSelectStage()	
	
	if stage.m_type == 1 then
		return
	elseif stage.m_type == 2 then
		local stageId = stage:getSmallStageId()
		
		--副本次数不够 重置次数
		local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()
		local atkNum = 0 
		for i = 1, #smallStageNumsData["levelDate"] do
			if 	smallStageNumsData["levelDate"][i]["level"] == self.m_smallStageId then
				atkNum = smallStageNumsData["levelDate"][i]["count"]
				break
			end
		end
		if atkNum <= 0 then
			g_game.g_userInfoManager:requestBuyChallengeNumCondition(stageId)
			return
		end
		
		--不是三星
		for i = 1, #smallStageNumsData["levelDate"] do
			if smallStageNumsData["levelDate"][i]["level"] == self.m_smallStageId 
				and smallStageNumsData["levelDate"][i]["star"] < 3 then
					if LANGUAGE_TYPE == 3 then
						g_game.g_utilManager:showMsg("本關卡三星評價後方可進行掃蕩！")
					else
						g_game.g_utilManager:showMsg("本关卡三星评价后方可进行扫荡！")
					end
				return
			end
		end
		
		local vipLv = g_game.g_userInfoManager:getUserVipInfo()["level"]
		local limitVip = 0
		local tip = nil
		if isMore then
			limitVip = g_game.OPEN_SAODANG_MORE_VIP_LV
			tip = "扫荡多次VIP"..limitVip.."开启，您目前VIP等级不足。充值元宝可升级VIP，是否立即前往？"
		else
			limitVip = g_game.OPEN_SAODANG1_VIP_LV
			tip = "扫荡一次VIP"..limitVip.."开启，您目前VIP等级不足。充值元宝可升级VIP，是否立即前往？"
		end
		
		if vipLv < limitVip then
			require("scripts.game.main.common.f_quick_charge_popup")
			local quickCharge = f_quick_charge_popup.static_create()
		    quickCharge:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")	
			quickCharge:setTipString(tip)
			return
		end
		
		require("scripts.game.main.stage.f_saodang_popup")
		local saodang = f_saodang_popup.static_create()
		saodang:panelInitBeforePopup(isMore)
		g_game.g_panelManager:showUiPanel(saodang,"saodang")
		saodang:setUseId(self.m_chapterId, self.m_bigStageId,stageId)
		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:initAllComponent()
	--扫荡1次
	local saodangOnce = function()
		self:saodang(false)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_battlePanel_title["button_saodangOnce"]:addHandleOfcomponentEvent(saodangOnce, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--扫荡多次
	local saodangMore = function()
		self:saodang(true)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_battlePanel_title["button_saodang"]:addHandleOfcomponentEvent(saodangMore, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local openPaibingBuzhen = function()
		self:popupBuZhen()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_battlePanel_title["zy_paibing_button"]:addHandleOfcomponentEvent(openPaibingBuzhen, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local closeCallBack = function()
		if g_game.g_utilManager:allGuidelinesIsFinish() then
			self:deleteFromParent()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_battlePanel_title["zy_close_button"]:addHandleOfcomponentEvent(closeCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	self.event_updatePopBuyNum  = function()
		self:popupBuyChallengeNum()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_POP_BUY_PVE_NUM, self.event_updatePopBuyNum)
	
	local func = function()
	end
	self.event_updateRecover1  = function()
		local userStrength = g_game.g_userInfoManager:getUserStrength()
		local userLv = g_game.g_userInfoManager:getUserLv()
		local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userLv)
--		self.m_battlePanel_title["zy_tili_num_label"]:setString(userStrength.."/"..userStrengthLimit)
		self.m_battlePanel_title["zy_tili_num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,0]"..userStrength.."[250,255,165]/"..userStrengthLimit, cc.c3b(250,255,165)), func)
	
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateRecover1)
	
	--更新战斗次数
	self.event_updateBuyNumResult2  = function()
		local selectStage = self.m_stage_list:getSelectStage()
		if selectStage.m_type == 2 then --表示当前类型是关卡类型，不是通过奖励类型
			selectStage:resetAtkNums()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_PVE_NUM_RESULT, self.event_updateBuyNumResult2)
	
	self.event_updateStageRewardFlag = function()
		local selectStage = self.m_stage_list:getSelectStage()
		if selectStage.m_type == 1 then --表示当前类型通关奖励类型
			selectStage:setFlagInvisible()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_STAGE_REWARD, self.event_updateStageRewardFlag)
	
	self.event_updateUserInfo5  = function()
		local userStrength = g_game.g_userInfoManager:getUserStrength()
		local userLv = g_game.g_userInfoManager:getUserLv()
		local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userLv)
--		self.m_battlePanel_title["zy_tili_num_label"]:setString(userStrength.."/"..userStrengthLimit)
		self.m_battlePanel_title["zy_tili_num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,0]"..userStrength.."[250,255,165]/"..userStrengthLimit, cc.c3b(250,255,165)), func)
				
		self.m_liangcaoAnim:playWhenLarger(userStrength, 0.8)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_updateUserInfo5)
	
	self.event_updateBattleNum = function()
		local saodang = g_game.g_panelManager:getUiPanel("saodang")
		if saodang then
			local selectStage = self.m_stage_list:getSelectStage()
			if selectStage.m_type == 2 then --表示当前类型是关卡类型，不是通过奖励类型
				selectStage:setSaoDangUseNum(saodang.m_battleTimes)
			end
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE_NUM, self.event_updateBattleNum)
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] popup buzhenpanel
-- 布阵按钮按下事件
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:popupBuZhen()
    self.m_paibing_huangzi_panel = f_card_paibing_huangzi.static_create()
    self.m_paibing_huangzi_panel:panelInitBeforePopup()
    
	g_game.g_panelManager:showUiPanel(self.m_paibing_huangzi_panel,"paibinghuangzi_top")
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_stage_small_battle_panel:deleteFromParent()
	g_game.g_dataManager:saveBattleState(0,0)
	g_game.g_dataManager:savePveProgress("","","")
	local parent = g_game.g_panelManager:getUiPanel("zhanyi_ditu_bg")
	if parent ~= nil then
		parent:updateLastBigBattleFromServer()
		g_game.g_panelManager:removeUiPanel("zhanyi_waikuang")
	end
end

