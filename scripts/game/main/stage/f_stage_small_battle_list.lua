require("scripts.game.main.stage.f_stage_small_battle_head")

--[[
	继承自container list, 实现小关卡 list
]]--

local f_stage_small_battle_list = class("f_stage_small_battle_list", function()
    return g_game.g_classFactory.newFLuaContainerList("f_stage_small_battle_list", 2)
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_stage_small_battle_list:ctor()      
 
    self.m_componetsArr = {}
    self.gotoBattleCallBack = nil
    self.rewardCallBack = nil
    self.rewardPopCallback = nil
    self.m_bigStageId = 0
    
    self:registerNodeEvent()   
    
    self.m_selectStage = nil
    self.isFightThrough = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] onEnter
-- on
-------------------------------------------------------------------------------
function f_stage_small_battle_list:onEnter()   
	self:setStopTouchEvent(true)	
	self:enableClipping(true)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] setGuideLineListData
--设置list data
-------------------------------------------------------------------------------
function f_stage_small_battle_list:setGuideLineListData(bigBattleId,smallBattleId)
	local smallBattleDataTable = g_game.g_dictConfigManager:getSmallBattleArr(bigBattleId)
	self.m_bigStageId = bigBattleId
	
	local lastSmallBattleId = smallBattleId
	local num = #smallBattleDataTable
	
	for i = 1, num do
		--限制 最多只创建一个 未开启关卡
		if smallBattleDataTable[i][1] <= lastSmallBattleId+1  then
			local smallStageHead =  f_stage_small_battle_head.static_create()
			smallStageHead:panelInitBeforePopup()
			smallStageHead:setSize(cc.size(112,230))
			
			smallStageHead:setDataForGuideLine(smallBattleDataTable[i])
			
			local smallStageSelectedCallBack = function(selectStage)
				self:smallStageSelectCallBack(selectStage)
			end
			smallStageHead:setSelectCallBack(smallStageSelectedCallBack)
			
			local smallStageBeganWarCallback = function(selectStage)
				self:gotoStage(selectStage)
			end
			smallStageHead:setBeginWarCallBack(smallStageBeganWarCallback)
		
			self:appendComponent(smallStageHead)
			table.insert(self.m_componetsArr,smallStageHead)
			
			if smallBattleDataTable[i][1] == lastSmallBattleId then
				self.m_selectStage = smallStageHead
			end
		end
	end
	
	--单独添加一个奖励按钮
	self:addRewardStage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] setListData
--设置list data
-------------------------------------------------------------------------------
function f_stage_small_battle_list:setListData(bigBattleId)
	local smallBattleDataTable = g_game.g_dictConfigManager:getSmallBattleArr(bigBattleId)
	self.m_bigStageId = bigBattleId
	
	local lastSmallBattleId = g_game.g_userInfoManager:getUserPveProgress()["level"]
	local num = #smallBattleDataTable
	
	for i = 1, num do
		--限制 最多只创建一个 未开启关卡
		if smallBattleDataTable[i][1] <= lastSmallBattleId+1  then
			local smallStageHead =  f_stage_small_battle_head.static_create()
			smallStageHead:panelInitBeforePopup()
			smallStageHead:setSize(cc.size(112,230))
			
			smallStageHead:setData(smallBattleDataTable[i])
			
			local smallStageSelectedCallBack = function(selectStage)
				self:smallStageSelectCallBack(selectStage)
			end
			smallStageHead:setSelectCallBack(smallStageSelectedCallBack)
			
			local smallStageBeganWarCallback = function(selectStage)
				self:gotoStage(selectStage)
			end
			smallStageHead:setBeginWarCallBack(smallStageBeganWarCallback)
		
			self:appendComponent(smallStageHead)
			table.insert(self.m_componetsArr,smallStageHead)
			
			if i == 1 then
				self.m_selectStage = smallStageHead
			end
		end
	end
	
	--单独添加一个奖励按钮
	self:addRewardStage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] addRewardStage
-- 单独添加一个奖励的图标
-------------------------------------------------------------------------------
function f_stage_small_battle_list:addRewardStage()
	local smallStageHead =  f_stage_small_battle_head.static_create()
	smallStageHead:panelInitBeforePopup()
	smallStageHead:setSize(cc.size(112,230))
	
	local rewardData = g_game.g_dictConfigManager:getBigBattleRewardData(self.m_bigStageId)
	smallStageHead:setRewardData(rewardData)
	
	local rewardCallBack = function(selectStage)
		self:rewardPopupCallBack(selectStage)
	end
	smallStageHead:setRewardPopupCallBack(rewardCallBack)
	
	self:appendComponent(smallStageHead)
	table.insert(self.m_componetsArr,smallStageHead)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] getRewardStage
--获取 通关奖励 stage
-------------------------------------------------------------------------------
function f_stage_small_battle_list:getRewardStage()
	local lastIndex = #self.m_componetsArr
	return self.m_componetsArr[lastIndex]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] rewardPopupCallBack
--奖励小头像弹出
-------------------------------------------------------------------------------
function f_stage_small_battle_list:rewardPopupCallBack(selectStage)
	self.m_selectStage = selectStage
	
	if self.rewardPopCallback ~= nil then
		self.rewardPopCallback(selectStage)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] gotoStage
-- 进入某小关卡
-------------------------------------------------------------------------------
function f_stage_small_battle_list:gotoStage(stage)
	self.gotoBattleCallBack(stage)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] setGotoBattleCallBack
--小关卡开打
-------------------------------------------------------------------------------
function f_stage_small_battle_list:setGotoBattleCallBack(callback)
	self.gotoBattleCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] setSmallBattleRewardCallBack
--刷新  小关卡奖励
-------------------------------------------------------------------------------
function f_stage_small_battle_list:setSmallBattleRewardCallBack(callback)
	self.rewardCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] setStageRewardCallBack
--关卡奖励弹出
-------------------------------------------------------------------------------
function f_stage_small_battle_list:setStageRewardCallBack(callback)
	self.rewardPopCallback = callback
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] smallStageSelectCallBack
--小关卡选择回调
-------------------------------------------------------------------------------
function f_stage_small_battle_list:smallStageSelectCallBack(selectStage)
    self.m_selectStage = selectStage
    
	local selectId = self.m_selectStage:getSmallStageId()
	
	for i = 1, #self.m_componetsArr do
	--2stand for unopen
		if self.m_componetsArr[i].m_smallBattleState ~= 2 then
			if self.m_componetsArr[i]:getSmallStageId() == selectId then
			--3 equals in war
				self.m_componetsArr[i]:setSmallBattleState(3)
			else
			--1 equals already pass
				self.m_componetsArr[i]:setSmallBattleState(1)
			end
		end
	end
	
	self.rewardCallBack(self.m_selectStage)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] getSelectStage
-------------------------------------------------------------------------------
function f_stage_small_battle_list:getSelectStage()
	return self.m_selectStage
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] guideLineUpdateLastSmallBattle
--新手指引  更新上一次能打 最后一个小关卡 id
-------------------------------------------------------------------------------
function f_stage_small_battle_list:guideLineUpdateLastSmallBattle(lastSmallBattleId)
	local index = 0
	for i = 1, #self.m_componetsArr do
		if self.m_componetsArr[i]:getSmallStageId() == lastSmallBattleId then
			self.m_selectStage = self.m_componetsArr[i]
			index = i
		end
		self.m_componetsArr[i]:guideLineUpdateLastSmallBattle(lastSmallBattleId)
	end
	return index
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] updateLastSmallBattle
-------------------------------------------------------------------------------
function f_stage_small_battle_list:setFightThrough(fightThrough)
	self.isFightThrough = fightThrough
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_list] updateLastSmallBattle
--更新上一次能打 最后一个小关卡 id
-------------------------------------------------------------------------------
function f_stage_small_battle_list:updateLastSmallBattle(lastSmallBattleId)
	local index = 0
	for i = 1, #self.m_componetsArr do
		if self.m_componetsArr[i]:getSmallStageId() == lastSmallBattleId then
			self.m_selectStage = self.m_componetsArr[i]
			index = i
		end
		self.m_componetsArr[i]:setFightThrough(self.isFightThrough)
		self.m_componetsArr[i]:updateLastSmallBattle(lastSmallBattleId)
	end
	return index
end


function f_stage_small_battle_list:onExit()    
    self:unregisterNodeEvent()
    self.m_componetsArr = {}
end

function f_stage_small_battle_list:onEnterTransitionFinish()
end

function f_stage_small_battle_list:onExitTransitionStart()
end

function f_stage_small_battle_list:onCleanup()
end


function f_stage_small_battle_list:registerNodeEvent(handler)
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

function f_stage_small_battle_list:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


return f_stage_small_battle_list