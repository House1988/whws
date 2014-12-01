require("scripts.auto.auto_elite_stage")
require("scripts.game.main.stage.f_stage_elite_stage_card")
require("scripts.game.main.stage.f_stage_elite_battle")
--[[--
精英副本界面
--]]--
f_stage_elite_stage = class("f_stage_elite_stage")
f_stage_elite_stage.__index = f_stage_elite_stage

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_elite_stage.static_create()
							 
	local eliteTable = createelite_stage()
	local info = eliteTable["elite_stage"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_stage_elite_stage)

	info.m_componentTable = eliteTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_elite_stage:panelInitBeforePopup()
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	
	self.COL			= 3
	self.ROW			= 1
	self.m_selectStage = nil
	
	self.m_bigBattleDataTable = nil
	self.m_eliteDataTable = nil
	
	self:registerNodeEvent()
	self.m_chapterId = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_elite_stage:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_elite_stage] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_elite_stage:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] onEnter
-------------------------------------------------------------------------------
function f_stage_elite_stage:onEnter()
	self.m_componentTable["scale_bg"]:setOpacity(175)
	local remainCount = g_game.g_userInfoManager:getUserPveProgress()["remainCount"]
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["challenge_num"]:setString("今日剩餘挑戰次數"..remainCount.."/"..g_game.MAX_ELITE_CHALLENGE_NUM)	
	else
		self.m_componentTable["challenge_num"]:setString("今日剩余挑战次数"..remainCount.."/"..g_game.MAX_ELITE_CHALLENGE_NUM)
	end
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] setChapterId
-------------------------------------------------------------------------------
function f_stage_elite_stage:setChapterId(chapterId)
	self.m_chapterId = chapterId
	
	self:initStageElite()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] initStageElite
-------------------------------------------------------------------------------
function f_stage_elite_stage:initStageElite()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_item_array = {}
	
	self.m_bigBattleDataTable = g_game.g_dictConfigManager:getChapterBigBattleArr(self.m_chapterId)
	self.m_eliteDataTable = g_game.g_dictConfigManager:getEliteStageArr(self.m_chapterId)
	self.m_item_count = #self.m_eliteDataTable
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(830,409))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(67,121))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL,0,33,231,394)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_stage_elite_stage:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local stageSelect = function(item)
		self:selectStageEvent(item)
	end
	
	local removeStage = function(item)
		self:removeItem(item)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if self.m_item_count >= i then
			local stage = f_stage_elite_stage_card.static_create()
			stage:panelInitBeforePopup()
			stage:setSize(cc.size(231,394))
			stage:setIndex(i)
			stage:setStageData(self.m_bigBattleDataTable[i])
			stage:setEliteData(self.m_eliteDataTable[i])
			self.m_page_container:addComponentToPage(stage, pageIndex)
			
			stage:setRemoveCallback(removeStage)
			stage:setSelectCallback(stageSelect)
			
			if i == 1 then
				self.m_selectStage = stage
			end
			
			table.insert(self.m_item_array, stage)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] selectStageEvent
-------------------------------------------------------------------------------
function f_stage_elite_stage:selectStageEvent(stage)
	self.m_selectStage = stage
	local index = self.m_selectStage:getIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getIndex() then
			self.m_item_array[i].m_componentTable["card_select_rect"]:setVisible(true)
		else
			self.m_item_array[i].m_componentTable["card_select_rect"]:setVisible(false)
		end	
	end	
	
	local uiPanel = g_game.g_panelManager:getUiPanel("elite_stage_battle")
	if uiPanel~= nil and uiPanel:isVisible() then
		return
	end
	
	local eliteStageBattle = f_stage_elite_battle.static_create()
    eliteStageBattle:panelInitBeforePopup()
	eliteStageBattle:setBattleInfo(self.m_chapterId,self.m_selectStage:getEliteData())
	g_game.g_panelManager:showUiPanel(eliteStageBattle,"elite_stage_battle")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] removeItem
-------------------------------------------------------------------------------
function f_stage_elite_stage:removeItem(stage)
	local index = stage:getIndex()
	
	for i = #self.m_item_array, 1,-1 do
		if index == self.m_item_array[i]:getIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] onExit
-------------------------------------------------------------------------------
function f_stage_elite_stage:onExit()
	self:unregisterNodeEvent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_elite_stage:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_elite_stage:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] onCleanup
-------------------------------------------------------------------------------
function f_stage_elite_stage:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_elite_stage:initAllComponent()
	self.m_componentTable["elite_close"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("elite_stage")
		g_game.g_dataManager:saveBattleState(0,0)
	end
	self.m_componentTable["elite_close"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
end


