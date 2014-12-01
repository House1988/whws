require("scripts.auto.auto_genghuanzhenrong_title")
require("scripts.auto.auto_genghuanzhenrong_bottom")

require("scripts.game.main.card.f_card_mingchen_detail")
--[[--
更换阵容界面 标题
--]]--
f_card_genghuanzhenrong = class("f_card_genghuanzhenrong")
f_card_genghuanzhenrong.__index = f_card_genghuanzhenrong

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_card_genghuanzhenrong.static_create()
	local genghuanzhenrong_title_table = creategenghuanzhenrong_title()
	local genghuanzhenrong_panel = genghuanzhenrong_title_table["genghuanzhenrong_title"]

	local funTable = {}
	tolua.setpeer(genghuanzhenrong_panel, funTable)
	setmetatable(funTable, f_card_genghuanzhenrong)

	genghuanzhenrong_panel.m_genghuan_zhenrongTitleTable = genghuanzhenrong_title_table
	return genghuanzhenrong_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:panelInitBeforePopup()
	self:registerNodeEvent()

	self.m_genghuan_zhenrong_bottomTable = nil

	self.m_zhenrong1 = nil
	self.m_zhenrong2 = nil
	
	self.m_curBattleArrIndex = 1
	self.m_panelIndex = 1
	self.m_pageRadioBtnArr = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] setCurrentBattleArrIndex
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:setCurrentBattleArrIndex(index)
	self.m_curBattleArrIndex = index
	
	if self.m_curBattleArrIndex == 1 then
		self.m_genghuan_zhenrongTitleTable["top_already_use1_image"]:setVisible(true)
		self.m_genghuan_zhenrongTitleTable["top_already_use2_image"]:setVisible(false)
	else
		self.m_genghuan_zhenrongTitleTable["top_already_use1_image"]:setVisible(false)
		self.m_genghuan_zhenrongTitleTable["top_already_use2_image"]:setVisible(true)
	end
	
	self:setPanelIndex(self.m_curBattleArrIndex)
  	self:updatePagePanel()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:registerNodeEvent(handler)
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
-- @function [parent=#f_card_genghuanzhenrong] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] onEnter
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:onEnter()

	self.m_genghuan_zhenrong_bottomTable =  creategenghuanzhenrong_bottom()
	local genghuanzhenrong_bottom_panel =  self.m_genghuan_zhenrong_bottomTable["genghuanzhenrong_bottom"]
	self:appendComponent(genghuanzhenrong_bottom_panel)
	genghuanzhenrong_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
	genghuanzhenrong_bottom_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
	CONFIG_SCREEN_HEIGHT/2))
	
	self.m_genghuan_zhenrongTitleTable["top_close_image"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self.m_pageRadioBtnArr[1] = self.m_genghuan_zhenrongTitleTable["zhenrong1_button"] --阵容1
  	self.m_pageRadioBtnArr[2] = self.m_genghuan_zhenrongTitleTable["zhenrong2_button"] --阵容2
   	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] setPanelIndex
-- 设置默认显示panel index  1 阵容1  2 阵容2
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:setPanelIndex(index)
	self.m_panelIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] updatePagePanel
-- 更新每个切页 界面
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:updatePagePanel()
	-- 1 stand for radio btn bright ,2 stand for radio btn dark
	for i = 1, #self.m_pageRadioBtnArr do
		if self.m_panelIndex == i then
			self.m_pageRadioBtnArr[i]:setIsEnabled(true)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
		else
			self.m_pageRadioBtnArr[i]:setIsEnabled(false)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
		end
	end
	
	self:showZhenrongById()

	if  self.m_panelIndex == self.m_curBattleArrIndex then
		self.m_genghuan_zhenrong_bottomTable["change_button"]:setVisible(false)
		self.m_genghuan_zhenrong_bottomTable["ui_geng"]:setVisible(false)
		self.m_genghuan_zhenrong_bottomTable["ui_huan"]:setVisible(false)
	else
		self.m_genghuan_zhenrong_bottomTable["change_button"]:setVisible(true)
		self.m_genghuan_zhenrong_bottomTable["ui_geng"]:setVisible(true)
		self.m_genghuan_zhenrong_bottomTable["ui_huan"]:setVisible(true)
	end
	self:updateZhenrongData()
end

function f_card_genghuanzhenrong:showZhenrongById(index)
	if self.m_zhenrong1 == nil  then
		self.m_zhenrong1 = require("scripts.game.main.card.f_card_genghuanzhenrong_cardsPanel").new()
		self.m_genghuan_zhenrongTitleTable["genghuanzhenrong_title"]:appendComponent(self.m_zhenrong1)
		self.m_zhenrong1:setSize(cc.size(950,380))
		self.m_zhenrong1:setAnchorPoint(cc.p(0,1))
		self.m_zhenrong1:setPositionInContainer(cc.p(5,100))
		self.m_zhenrong1:setComponentType(1)
	end
	
	if self.m_zhenrong2 == nil  then
		self.m_zhenrong2 = require("scripts.game.main.card.f_card_genghuanzhenrong_cardsPanel").new()
		self.m_genghuan_zhenrongTitleTable["genghuanzhenrong_title"]:appendComponent(self.m_zhenrong2)
		self.m_zhenrong2:setSize(cc.size(950,380))
		self.m_zhenrong2:setAnchorPoint(cc.p(0,1))
		self.m_zhenrong2:setPositionInContainer(cc.p(5,100))
		self.m_zhenrong2:setComponentType(2)
	end
	
	if self.m_panelIndex == 1 then
		self.m_zhenrong1:setVisible(true)
		self.m_zhenrong2:setVisible(false)
	else
		self.m_zhenrong1:setVisible(false)
		self.m_zhenrong2:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] updateZhenrongData
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:updateZhenrongData()
	local battleList = g_game.g_userInfoManager:getBattleDataByType(self.m_panelIndex)
	local battleAttNum = #battleList
	
	local allAtk = 0
	local allDef = 0

	for i = 1 , table.getn(battleList) do
		local atkAddition,defAddition = g_game.g_dictConfigManager:getCardAddition(i,battleList[i])
		allAtk = allAtk + battleList[i]["attack"]+atkAddition
		allDef = allDef + battleList[i]["defense"]+defAddition
	end

	self.m_genghuan_zhenrong_bottomTable["bottom_attack_num_label"]:setString("" .. math.floor(allAtk))

	self.m_genghuan_zhenrong_bottomTable["bottom_xueliang_num_label"]:setString(""..math.floor(allDef))

	local userLevel = g_game.g_userInfoManager:getLevel()
	local  openedNum = g_game.g_dictConfigManager:getOpenedCardNum(userLevel)
	self.m_genghuan_zhenrong_bottomTable["bottom_zhenrong_num_label"]:setString(battleAttNum.."/"..openedNum)
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] onExit
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UP_CARD_TO_ARR2, self.event_firstEnterArr2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] onCleanup
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:initAllComponent()
	local delete_genghuan_zhenrongCallBack = function()
		self:sendChangePositionMessage()
		g_game.g_userInfoManager:requestEquipmentList()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_genghuan_zhenrongTitleTable["top_close_image"]:addHandleOfcomponentEvent(delete_genghuan_zhenrongCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local triggerZhenrong1 = function()
		self.m_panelIndex = 1
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_genghuan_zhenrongTitleTable["zhenrong1_button"]:addHandleOfcomponentEvent(triggerZhenrong1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local triggerZhenrong2 = function()
		local userLv = g_game.g_userInfoManager:getUserInfo()["level"]
		if userLv < g_game.OPEN_BATTLE_ARR2_LV then
			local str =  g_game.g_dictConfigManager:getLanTextById(423)
			g_game.g_utilManager:showMsg(g_game.OPEN_BATTLE_ARR2_LV..str)
			self.m_pageRadioBtnArr[2]:setIsEnabled(false)
			self.m_pageRadioBtnArr[2]:setRadioButtonState(2)
		else
			local battleArr2 = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_BATTLE_ARR2)
			
			if #battleArr2 == 0 then
				g_game.g_userInfoManager:requestBattleArr2FirstCard()
			else
				self.m_panelIndex = 2
				self:updatePagePanel()
			end
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_genghuan_zhenrongTitleTable["zhenrong2_button"]:addHandleOfcomponentEvent(triggerZhenrong2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local genghuanCaLLBack = function()
		self:sendChangeZhenrongMessage()
		g_game.g_userInfoManager:requestEquipmentList()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_genghuan_zhenrong_bottomTable["change_button"]:addHandleOfcomponentEvent(genghuanCaLLBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local showCardDetailCallback = function()
		self:showCurrentCardDetail()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_genghuan_zhenrong_bottomTable["details_button"]:addHandleOfcomponentEvent(showCardDetailCallback,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.event_firstEnterArr2 = function()	
		self:insertCardToArr2()
		self.m_panelIndex = 2
		self:updatePagePanel()
		self.m_zhenrong2:setComponentType(2)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UP_CARD_TO_ARR2, self.event_firstEnterArr2)
	
end

function f_card_genghuanzhenrong:insertCardToArr2()
	local cardData = g_game.g_userInfoManager.battleArr2Card
	local arr2 = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_BATTLE_ARR2)
	
	local temp = {}
	local data = g_game.g_dictConfigManager:getOfficerCardData(cardData["cardId"])
	temp["id"] = cardData["pId"]
	temp["officerId"] = cardData["cardId"]
	temp["officerLevel"] = 1
	temp["officerExp"] = 0
	temp["attack"] = math.round(data[7] / 100)
	temp["defense"] = math.round(data[6] / 100)
	temp["intellect"] = data[8]
	temp["soldierType"] = data[14]
	temp["advanced"] = 1
	temp["battle"] = 2
	table.insert(arr2, temp)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] showCurrentCardDetail
-- 查看当前 card的 详情
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:showCurrentCardDetail()
	local card = nil 
	if self.m_panelIndex == 1 then
		card = self.m_zhenrong1:getSelectCard()
	else
		card = self.m_zhenrong2:getSelectCard()
	end
	if not card then
		return
	end
	local detailData = card:getData()
	local detailPanel = f_card_mingchen_detail.static_create()
	detailPanel:panelInitBeforePopup()
	detailPanel:setDetail(detailData)
	
	g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] sendChangeZhenrongMessage
-- 发送更换 阵容信息
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:sendChangeZhenrongMessage()
	g_game.g_userInfoManager:requestChangeBattleArr()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong] sendChangePositionMessage
-- 点击关闭按钮 发送阵容换位 信息
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong:sendChangePositionMessage()
	g_game.g_userInfoManager:requestChangePosition()
end



