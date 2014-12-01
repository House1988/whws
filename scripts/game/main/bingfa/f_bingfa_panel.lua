require("scripts.auto.auto_bingfaBg")
require("scripts.auto.auto_bingfaCanYe")
require("scripts.auto.auto_bingfaList")
require("scripts.auto.auto_canYeRound")
require("scripts.game.main.common.f_jump_tip_popup")

--[[--
公告面板
--]]--

f_bingfa_panel = class("f_bingfa_panel")
f_bingfa_panel.__index = f_bingfa_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_bingfa_panel.static_create()
	local gonggaoTable = createbingfaBg()
	local gonggao = gonggaoTable["bingfaBg"]

	local funTable = {}
	tolua.setpeer(gonggao, funTable)
	setmetatable(funTable, f_bingfa_panel)

	gonggao.m_componentTable = gonggaoTable

	return gonggao
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] setData
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_bingfa_panel:setData()
	self.m_canyeList, self.m_ownCanyeList = g_game.g_userInfoManager:getCanYeList()
	self.m_allBingfa, self.m_unequipBingfa = g_game.g_userInfoManager:getBingfaList()
	
--	if #self.m_canyeList <= 0 then
--		self:changePage(1)
--	else
--		self:changePage(2)
--		self:fillCanYeList()
--	end
	
	if #self.m_canyeList > 0 then
		self:fillCanYeList()
	end

	if self.m_upgradeItem ~= nil then
		self.m_upgradeBingfa = {}
		for i = 1, #self.m_unequipBingfa do
			if self.m_unequipBingfa[i] ~= self.m_upgradeItem then
				table.insert(self.m_upgradeBingfa, self.m_unequipBingfa[i])
			end
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_bingfa_panel:setCloseType(type)
	self.m_closeType = type
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_bingfa_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_closeType = 0
	self.m_upgragePrieces = {200, 400, 800, 1600, 3200}
	self.m_upgrageExps = {10, 20, 50, 100, 500}
	self.m_pageRadioBtnArr = {}
	self.m_bottomPage = {}
	
	self.m_pageRadioBtnArr[1] = self.m_componentTable["btnBingFa"] --兵法
	self.m_pageRadioBtnArr[2] = self.m_componentTable["btnCanYe"] --残叶
	
	self.m_pages = {}
	self.m_currentPage = 1
	
	self.m_bingFaTable = createbingfaList()
	local item = self.m_bingFaTable["bingfaList"]
	self:appendComponent(item)
	item:setAnchorPoint(cc.p(0.5,0.5))
	item:setPositionInContainer(cc.p(480, 320))
	table.insert(self.m_pages, item)
	table.insert(self.m_bottomPage, self.m_bingFaTable["xuanzePanel"])
	table.insert(self.m_bottomPage, self.m_bingFaTable["shengjiPanel"])
	table.insert(self.m_bottomPage, self.m_bingFaTable["sellPanel"])
	
	self:changeBottomPage(1)
	
	self.m_canyeTable = createbingfaCanYe()
	item = self.m_canyeTable["bingfaCanYe"]
	self:appendComponent(item)
	item:setAnchorPoint(cc.p(0.5,0.5))
	item:setPositionInContainer(cc.p(480, 320))
	table.insert(self.m_pages, item)
	
	self.m_list = fc.FContainerList:create(2)
    self.m_list:setSize(cc.size(820,150))
    self.m_list:setAnchorPoint(cc.p(0,1))
    item:appendComponent(self.m_list)
    self.m_list:setPositionInContainer(cc.p(70, 480))
    self.m_list:enableClipping(true)
	self.m_list:setListInfo(7, 0, 10, 104, 150);
	
	self:createRound(item)
	
	local close = function()
		if self.m_currentBottom == 1 or self.m_currentPage == 2 then
			g_game.g_panelManager:removeUiPanel("bing_fa")
		else
			if self.m_closeType == 0 then
				self:changeBottomPage(1)
				self:updateBingfaPage()
			elseif self.m_closeType == 1 then
				g_game.g_panelManager:removeUiPanel("bing_fa")
			elseif self.m_closeType == 2 then
				require("scripts.game.main.equipBag.f_equipDetial_panel")
				local panel = f_equipDetial_panel.static_create()
				panel:panelInitBeforePopup(self.m_upgradeItem, false)
				g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
				self:changeBottomPage(1)
				self:updateBingfaPage()
			end
			self.m_closeType = 0
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickPage1 = function()
		if #self.m_allBingfa <= 0 then
			local panel = f_jump_tip_popup.static_create()
			panel:setPanelByType(12)
			local leftBtnCallback = function()
				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			end
			local rightBtnCallback = function()
				g_game.g_panelManager:removeAllUiPanel()
--				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
				require("scripts.game.main.bingfa.f_xunfang_panel")
				local panel = f_xunfang_panel.static_create()
				panel:panelInitBeforePopup()
				g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
			end
			panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
			g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		end
		self:changePage(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(clickPage1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickPage2 = function()
		if #self.m_canyeList <= 0 then
			self:changePage(1)
--			g_game.g_utilManager:showMsg("没有任何兵法残页")
			local panel = f_jump_tip_popup.static_create()
			panel:setPanelByType(13)
			local leftBtnCallback = function()
				local getOpenLv = g_game.g_dictConfigManager:getOpenLv(6)
				if getOpenLv > g_game.g_userInfoManager:getUserLv() then
					g_game.g_panelManager:removeUiPanel("jump_tip_popup")
					local str = g_game.g_dictConfigManager:getLanTextById(436)
					g_game.g_utilManager:showMsg(getOpenLv ..  str)
				else
					g_game.g_panelManager:removeAllUiPanel()
					require("scripts.game.main.bingfa.f_xunfang_panel")
					local panel = f_xunfang_panel.static_create()
					panel:panelInitBeforePopup()
					g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
				end
			end
			local rightBtnCallback = function()
				g_game.g_panelManager:removeAllUiPanel()
				local beautyPalace = f_game_beauty_main.static_create()
				beautyPalace:panelInitBeforePopup()
				g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
			end
			panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
			g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		else
			self:changePage(2)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(clickPage2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickArrowL = function()
		local page = self.m_bingfaPage:getCurrentPageIndex()
		if page > 1 then
			self.m_bingfaPage:showPrePage()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	local clickArrowR = function()
		local page = self.m_bingfaPage:getCurrentPageIndex()
		if page < self.m_maxPage then
			self.m_bingfaPage:showNextPage()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_bingFaTable["arrowL"]:addHandleOfcomponentEvent(clickArrowL,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_bingFaTable["arrowR"]:addHandleOfcomponentEvent(clickArrowR,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickSell = function()
		self:changeBottomPage(3)
		self:updateBingfaPage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_bingFaTable["sell"]:addHandleOfcomponentEvent(clickSell,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local merge = function()
		if self.m_selectCanye ~= nil then
			if self.m_canMergeCanYe then
				local data = self.m_selectCanye.m_data
				g_game.g_userInfoManager:requestMergeBingfa(data["id"], data["piece"])
			else
				g_game.g_utilManager:showMsg("残叶不足")
			end
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_canyeTable["btn"]:addHandleOfcomponentEvent(merge,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickShengji = function()
		if self.m_selectItems[1] ~= nil then
			if self.m_selectItems[1]["equip_level"] >= g_game.g_userInfoManager:getLevel() then
				g_game.g_utilManager:showMsg("兵法等级不能超过皇帝等级")
				return
			end
			self.m_upgradeBingfa = {}
			self.m_upgradeItem = self.m_selectItems[1]
			for i = 1, #self.m_unequipBingfa do
				if self.m_unequipBingfa[i] ~= self.m_selectItems[1] then
					table.insert(self.m_upgradeBingfa, self.m_unequipBingfa[i])
				end
			end
			
			self:changeBottomPage(2)
			self:updateBingfaPage()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_bingFaTable["upgrade"]:addHandleOfcomponentEvent(clickShengji,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickDetial = function()
		self:showDetial()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_bingFaTable["detail"]:addHandleOfcomponentEvent(clickDetial,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickUpgrade = function()
		if self.m_targetLv >= g_game.g_userInfoManager:getLevel() then
			g_game.g_utilManager:showMsg("兵法等级不能超过皇帝等级")
			return
		end
		
		if #self.m_selectItems == 0 then
			g_game.g_utilManager:showMsg("您还没有选中兵法哦")
			return
		end
		
		g_game.g_userInfoManager:requestBingfaUpgrade(self.m_upgradeItem["primaryId"], self.m_selectItems)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_bingFaTable["btnUpgrade"]:addHandleOfcomponentEvent(clickUpgrade,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickSell = function()
		g_game.g_userInfoManager:requestSellBingfa(self.m_selectItems)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_bingFaTable["btnSell"]:addHandleOfcomponentEvent(clickSell,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	local allSelectCallBack = function()
		if self.m_bingFaTable["sellCheck"]:isCheckBoxSelectYes() then
			self:selectAll(true)
		else
			self:selectAll(false)
		end
	end
	self.m_bingFaTable["sellCheck"]:addHandleOfcomponentEvent(allSelectCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	allSelectCallBack = function()
		if self.m_bingFaTable["shengjiCheck"]:isCheckBoxSelectYes() then
			self:selectAll(true)
		else
			self:selectAll(false)
		end
	end
	self.m_bingFaTable["shengjiCheck"]:addHandleOfcomponentEvent(allSelectCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_refresh = function()
		self:setData()
	   self:updateDisplay()
	   self:updateBingfaPage()
	end
	
	self.m_refreshMerge = function()
		for i = 1, self.m_roundNumber do
			self.m_canyeAnims[i]:runAnimation(g_game.g_f_main_ui_effect.UI_HE_CHENG[2], g_game.g_f_main_ui_effect.UI_HE_CHENG[3])
		end
		
		local allFinish = function()
			self.m_refresh()
			self.m_blockPanel:setVisible(false)
			self:setPageAndBottom(1, nil)
		end
		self.m_canyeCenterAnim:registeAnimationFinishCallback(allFinish)
		
		local finish = function()
			self.m_canyeCenterAnim:runAnimation(g_game.g_f_main_ui_effect.UI_HE_CHENG[2], g_game.g_f_main_ui_effect.UI_HE_CHENG[4])
		end
		local sq = {}
		table.insert(sq, cc.DelayTime:create(0.2))
		table.insert(sq, cc.CallFunc:create(finish))
		self:runAction(g_game.g_transition.sequence(sq))
		self.m_blockPanel:setVisible(true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA, self.m_refresh)
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA_MERGE, self.m_refreshMerge)
   
   self:setData()
   self:updateDisplay()
   self:updateBingfaPage()
end

function f_bingfa_panel:showDetial()
	if self.m_currentBottom ~= 1 then
		return
	end
	local data = self.m_selectItems[1]
	if data ~= nil then
		require("scripts.game.main.equipBag.f_equipDetial_panel")
		local panel = f_equipDetial_panel.static_create()
		panel:panelInitBeforePopup(data, false)
		g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
	end
end

function f_bingfa_panel:updateBingfaPage()
	if self.m_bingfaPage ~= nil then
		self.m_bingFaTable["bingfaList"]:deleteComponent(self.m_bingfaPage)
	end
	self.m_bingfaPage = nil
	
	self.m_cardItems = {}
	self.m_componentTable["junLingValue"]:setString(g_game.g_userInfoManager.m_user_info["military"])
	self.m_bingfaPage = fc.FContainerPage:create(1)
	self.m_bingFaTable["bingfaList"]:appendComponent(self.m_bingfaPage)
	self.m_bingfaPage:setSize(cc.size(880,480))
	self.m_bingfaPage:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_bingfaPage:setPositionInContainer(cc.p(470, 310))
    self.m_bingfaPage:setStopTouchEvent(true) 
    
   	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end
    
    local datas = self.m_allBingfa
     if self.m_currentBottom == 2 then
    	datas = self.m_upgradeBingfa
    elseif self.m_currentBottom == 3 then
    	datas = self.m_unequipBingfa
    end
    
    self.m_maxPage = math.ceil(#datas / 8)
    self.m_selectItems ={}
    
    self.m_bingfaPage:registLoadPageCallback(load)
    
    if self.m_currentBottom == 1 then
    	self.m_bingfaPage:setPageInfo(#datas, 2, 4, 0, 24, 195,248)
    else 
    	self.m_bingfaPage:setPageInfo(#datas, 2, 4, 20, 56, 155,204)
    end
    
   	local updatePageNum = function()
    	self:updatePageNum()
    	self.m_bingFaTable["pageText"]:setString(self.m_bingfaPage:getCurrentPageIndex() .. "/" .. self.m_maxPage)
    end      
    self.m_bingfaPage:registMovePageCallback(updatePageNum)
    
    self:updateBottom()
    if self.m_currentBottom == 1 and #self.m_cardItems > 0 then
    	self:onSelectItem(self.m_cardItems[1])
    end
    
    self.m_bingFaTable["pageText"]:setString(self.m_bingfaPage:getCurrentPageIndex() .. "/" .. self.m_maxPage)
end

function f_bingfa_panel:loadPageData(pageIndex)
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_maxPage then
		return
	end
	
	if not self.m_bingfaPage:needLoadPage(pageIndex) then
		return
	end
	
	local datas = self.m_allBingfa
	if self.m_currentBottom == 2 then
		datas = self.m_upgradeBingfa
	elseif self.m_currentBottom == 3 then
		datas = self.m_unequipBingfa
	end
	
	local onClickItem = function(item)
		self:onSelectItem(item)
	end
	
	local onRemoveItem = function(item)
		self:onRemoveItem(item)
	end
	
	local start = (pageIndex - 1) * 8 + 1
	local e = math.min(start + 7, #datas)
	for i = start, e do
		local item = require("scripts.game.main.bingfa.f_bingfa_card").new()
		item:isSelect(self.m_currentBottom ~= 1)
		item:setData(datas[i], i)
		item:setItemSelectClick(onClickItem)
		item:setRemoveCallback(onRemoveItem)
		local isSelect = self:isDataSelect(datas[i])
		item:setSelect(isSelect)
		table.insert(self.m_cardItems, item)
		self.m_bingfaPage:addComponentToPage(item, pageIndex)
	end
end

function f_bingfa_panel:updatePageNum()
	if self.m_currentBottom ~= 1 then
		local datas = self.m_allBingfa
		if self.m_currentBottom == 2 then
			datas = self.m_upgradeBingfa
		elseif self.m_currentBottom == 3 then
			datas = self.m_unequipBingfa
		end
		local start = (self.m_bingfaPage:getCurrentPageIndex() - 1) * 8 + 1
		local e = math.min(start + 7, #datas)
		local isSelectAll = true
		for i = start, e do
			if not self:isDataSelect(datas[i]) then
				isSelectAll = false
				break
			end
		end
		self.m_bingFaTable["shengjiCheck"]:setCheckBoxSelect(isSelectAll)
		self.m_bingFaTable["sellCheck"]:setCheckBoxSelect(isSelectAll)
	end
end

function f_bingfa_panel:isDataSelect(data)
	if self.m_currentBottom == 1 then
		return data == self.m_selectItems[1] 
	end
	for i = 1, #self.m_selectItems do
		if data == self.m_selectItems[i] then
			return true
		end
	end
	return false
end

function f_bingfa_panel:selectAll(isSelect)
	local page = self.m_bingfaPage:getCurrentPageIndex()
	local s = (page - 1) * 8 + 1
	local e = s + 7
	if isSelect then
		for i = 1, #self.m_cardItems do
			local item = self.m_cardItems[i]
			if item.m_index >= s and item.m_index <= e then
				if not item:isSelected() then
					table.insert(self.m_selectItems, item.m_data)
				end
				item:setSelect(isSelect)
			end
		end
	else
		for i = 1, #self.m_cardItems do
			local item = self.m_cardItems[i]
			if item.m_index >= s and item.m_index <= e then
				if item:isSelected() then
					self:removeSelect(item.m_data)
				end
				item:setSelect(isSelect)
			end
		end
	end
	self:updateBottom()
end

function f_bingfa_panel:removeSelect(data)
	for i = 1, #self.m_selectItems do
		if data == self.m_selectItems[i] then
			table.remove(self.m_selectItems,i)
			return
		end
	end
end

function f_bingfa_panel:onSelectItem(item)
	if self.m_currentBottom == 1 then
		for i = 1, #self.m_cardItems do
			if self.m_cardItems[i].m_index == item.m_index then
				self.m_cardItems[i]:setSelect(true)
				self.m_selectItems[1] = item.m_data
			else
				self.m_cardItems[i]:setSelect(false)
			end
		end
	else
		for i = 1, #self.m_cardItems do
			if self.m_cardItems[i].m_index == item.m_index then
				if self.m_cardItems[i]:isSelected() then
					self.m_cardItems[i]:setSelect(false)
					self:removeSelect(self.m_cardItems[i].m_data)
				else
					self.m_cardItems[i]:setSelect(true)
					table.insert(self.m_selectItems, self.m_cardItems[i].m_data)
				end
			end
		end
		self:updateBottom()
	end
end

function f_bingfa_panel:updateBottom()
	if self.m_currentBottom == 3 then
		local price = 0
		for i = 1, #self.m_selectItems do
			price = price + g_game.g_dictConfigManager:getBingfaPrice(self.m_selectItems[i]["equip_id"], self.m_selectItems[i]["equip_level"])
		end
		self.m_bingFaTable["sellLabel"]:setString("出售后可获得银两：" .. price)
	elseif self.m_currentBottom == 2 then
		self.m_upgradeCost = 0
		local exp = 0
		for i = 1, #self.m_selectItems do
			local id = self.m_selectItems[i]["equip_id"]
			local lv = self.m_selectItems[i]["equip_level"]
			local star = g_game.g_dictConfigManager:getEquipStar(id)
			self.m_upgradeCost = self.m_upgradeCost + g_game.g_dictConfigManager:getBingfaUpgradePrice(id)
			exp = exp + (g_game.g_dictConfigManager:getBingfaBaseExp(id) + self:getBingfaTotalExp(lv, star) + self.m_selectItems[i]["bookExp"]) * 0.8
		end 
		exp = math.floor(exp)
		self.m_targetLv = self:getExpTargetLv(exp, g_game.g_dictConfigManager:getEquipStar(self.m_upgradeItem["equip_id"]), self.m_upgradeItem["equip_level"], 0)
		self.m_bingFaTable["xiaohaobingfaText"]:setString("" .. #self.m_selectItems)
		self.m_bingFaTable["xuyaoyinliangText"]:setString("" .. self.m_upgradeCost)
		self.m_bingFaTable["dengjiText"]:setString("" .. self.m_targetLv .. "/" .. g_game.g_userInfoManager:getLevel())
		self.m_bingFaTable["jingyanText"]:setString("" .. exp)
	end
end

function f_bingfa_panel:getExpTargetLv(exp, star, curLv, curExp)
	local target = g_game.g_dictConfigManager:getBingfaUpgradeExp(curLv, star)
	target = target - curExp
	local max = g_game.g_dictConfigManager:getBingfaUpgradeMaxLv()
	exp = exp - target
	while exp > 0 do
		curLv = curLv + 1
		if curLv >= max then
			return max
		end
		target = g_game.g_dictConfigManager:getBingfaUpgradeExp(curLv, star)
		exp = exp - target
	end
	return curLv
end

function f_bingfa_panel:getBingfaTotalExp(level, star)
	local exp = 0
	for i = 1, level - 1 do
		exp = exp + g_game.g_dictConfigManager:getBingfaUpgradeExp(level, star)
	end
	return exp
end

function f_bingfa_panel:onRemoveItem(item)
	for i = 1, #self.m_cardItems do
		if item.m_index == self.m_cardItems[i].m_index then
			table.remove(self.m_cardItems,i)
			return
		end
	end
end

function f_bingfa_panel:changeBottomPage(index)
	self.m_currentBottom = index
	for i = 1, #self.m_bottomPage do
		self.m_bottomPage[i]:setVisible(i == index)
	end
	self.m_componentTable["shengji_label"]:setVisible(self.m_currentBottom == 2)
	self.m_componentTable["chushou_label"]:setVisible(self.m_currentBottom == 3)
	for i = 1, #self.m_pageRadioBtnArr do
		self.m_pageRadioBtnArr[i]:setVisible(self.m_currentBottom == 1)
	end
	self.m_componentTable["label_canye"]:setVisible(self.m_currentBottom == 1)
	self.m_componentTable["label_bingfa"]:setVisible(self.m_currentBottom == 1)
	self:updateBottom()
end

function f_bingfa_panel:setLueduoBingfa(id)
	if #self.m_canyeList > 0 then
		for i = 1, #self.m_canyeList do
			if self.m_canyeList[i]["id"] == id then
				self.m_selectCanye = self.m_canyeItems[i]
				for j = 1, #self.m_canyeItems do
					self.m_canyeItems[j]:setSelect(self.m_canyeItems[j].m_index == i)
				end
				self:updateDisplay()
				return
			end
		end
	end
end

function f_bingfa_panel:setPageAndBottom(page, data)
	if #self.m_canyeList <= 0 then
		self:changePage(1)
	else
		self:changePage(page)
	end
	if data == nil then
		self:changeBottomPage(1)
	else
		self.m_selectItems = {}
		self.m_upgradeItem = data
		self.m_upgradeBingfa = {}
		for i = 1, #self.m_unequipBingfa do
			if self.m_unequipBingfa[i] ~= self.m_upgradeItem then
				table.insert(self.m_upgradeBingfa, self.m_unequipBingfa[i])
			end
		end
		self:changeBottomPage(2)
		self:updateBingfaPage()
	end
end

function f_bingfa_panel:updateDisplay()
	if self.m_selectCanye ~= nil then
		local data = self.m_selectCanye.m_data
		self:updateRound(data)
		local id = data["id"]
		local type = g_game.g_dictConfigManager:getEquipType(id)
		local att = g_game.g_dictConfigManager:getWeaponAddition(id, 1)
		local def = g_game.g_dictConfigManager:getArmorAddition(id, 1)
		local str = ""
		if att > 0 then
			str = str .. string.format("攻击： +%.1f", att) .. "%"
			if def > 0 then
				str = str .. "\n"
			end
		end
		if def > 0 then
			str = str .. string.format("防御： +%.1f", def) .. "%"
		end
		self.m_canyeTable["attackLabel"]:setString(str)
		self.m_canyeTable["des"]:setString(g_game.g_dictConfigManager:getEquipDes(id))
		self.m_canyeTable["titleLabel"]:setString(g_game.g_dictConfigManager:getEquipName(id))
		self.m_canyeTable["centerIcon"]:setVisible(true)
		self.m_canyeTable["centerFrame"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(id)])
		local im = g_game.g_dictConfigManager:getEquipResource(id)
		self.m_canyeTable["centerIcon"]:setImage(g_game.g_resourceManager:getItemImage(im))
		self.m_canyeTable["centerIcon"]:setSize(cc.size(90, 90))
		self.m_canyeTable["btn"]:setVisible(true)
		self.m_canMergeCanYe = true 
		for i = 1, #data["piece"] do
			if self.m_ownCanyeList[data["piece"][i]] == 0 then
				self.m_canMergeCanYe = false
				break
			end
		end
		if self.m_canMergeCanYe then
			self.m_canyeTable["btn"]:setButtonState(2)
		else
			self.m_canyeTable["btn"]:setButtonState(8)
		end
	else
		self.m_canyeTable["des"]:setString("")
		self.m_canyeTable["titleLabel"]:setString("")
		self.m_canyeTable["attackLabel"]:setString("")
		self.m_canyeTable["btn"]:setVisible(false)
		self.m_canyeTable["centerIcon"]:setVisible(false)
	end
end

function f_bingfa_panel:emptyPositionStaticClone()
	return self.m_emptyRound
end

function f_bingfa_panel:createRound(father)
	self.m_canyeRoundItems = {}
	self.m_canyeImages = {}
	self.m_canyeNumbers = {}
	self.m_canyeAnims = {}
	
	local click1 = function()
		self:clickLueduo(1)
	end
	local click2 = function()
		self:clickLueduo(2)
	end
	local click3 = function()
		self:clickLueduo(3)
	end
	local click4 = function()
		self:clickLueduo(4)
	end
	local click5 = function()
		self:clickLueduo(5)
	end
	local click6 = function()
		self:clickLueduo(6)
	end
	local click7 = function()
		self:clickLueduo(7)
	end
	local click8 = function()
		self:clickLueduo(8)
	end
	
	self.m_canyeCenterAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.m_canyeCenterAnim)	
	self.m_canyeCenterAnim:setSize(cc.size(100, 100))
	self.m_canyeCenterAnim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_canyeCenterAnim:setPositionInContainer(cc.p(311, 270))	
	self.m_canyeCenterAnim:setLoop(false)	
	self.m_canyeCenterAnim:setAnimationScale(1)
	self.m_canyeCenterAnim:setAnimationSpeedScale(0.3)

	local t = {click1, click2, click3, click4, click5, click6, click7, click8}
	for i = 1, 8 do
		local itemT = createcanYeRound()
		local item = itemT["canYeRound"]
		father:appendComponent(item)
		item:setAnchorPoint(cc.p(0.5,0.5))
		item:setPositionInContainer(cc.p(0, 0))
		table.insert(self.m_canyeRoundItems, itemT)
		table.insert(self.m_canyeImages, itemT["itemIcon"])
		table.insert(self.m_canyeNumbers, itemT["number_text"])
		itemT["lueduoBtn"]:addHandleOfcomponentEvent(t[i], g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
		
		local anim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self:appendComponent(anim)	
		anim:setSize(cc.size(100, 20))
		anim:setAnchorPoint(cc.p(0.5,0))
		anim:setPositionInContainer(cc.p(311, 270))	
		anim:setLoop(false)	
		anim:setAnimationScale(1)
		anim:setAnimationSpeedScale(0.3)
		anim:setVisible(false)
		table.insert(self.m_canyeAnims, anim)
	end
end

function f_bingfa_panel:clickLueduo(index)
	if self.m_selectCanye ~= nil then
		local data = self.m_selectCanye.m_data
		if self.m_ownCanyeList[data["piece"][index]] == 0 then
			g_game.g_userInfoManager:showLueduo(true, data["piece"][index])
		end
	end
end

function f_bingfa_panel:updateRound(data)
	local r = 150
	local num = g_game.g_dictConfigManager:getPieceMergeNumber(data["piece"][1])
	local rad = 360 / num
	local curRad = 0
	self.m_emptyRound = nil
	self.m_roundNumber = num
	for i = 1, 8 do
		if i <= num then
			local x = math.sin(math.rad(curRad)) * r + 311
			local y = 270 - math.cos(math.rad(curRad)) * r 
			self.m_canyeRoundItems[i]["canYeRound"]:setPositionInContainer(cc.p(x, y))
			self.m_canyeRoundItems[i]["canYeRound"]:setVisible(true)
			self.m_canyeAnims[i]:setVisible(true)
			self.m_canyeAnims[i]:setRotation(curRad)
			curRad = curRad + rad
			local image = g_game.g_dictConfigManager:getBingfaIconSmall(data["piece"][i])
			self.m_canyeImages[i]:setImage(g_game.g_resourceManager:getItemImage(image))
			self.m_canyeNumbers[i]:setString(g_game.g_userInfoManager:getBingfaPieceNumber(data["piece"][i]))
			if self.m_ownCanyeList[data["piece"][i]] ~= 0 then
				self.m_canyeImages[i]:setImageType(0)
			else
				self.m_canyeImages[i]:setImageType(2)
				self.m_emptyRound = self.m_canyeRoundItems[i]
				self.m_emptyRound["imagePath"] = g_game.g_resourceManager:getItemImage(image)
			end
		else
			self.m_canyeRoundItems[i]["canYeRound"]:setVisible(false)
			self.m_canyeAnims[i]:setVisible(false)
		end
	end
end

function f_bingfa_panel:changePage(index)
	self.m_currentPage = index
	for i = 1, #self.m_pages do
		if self.m_currentPage == i then
			self.m_pageRadioBtnArr[i]:setIsEnabled(true)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
			self.m_pages[i]:setVisible(true)
		else
			self.m_pageRadioBtnArr[i]:setIsEnabled(false)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
			self.m_pages[i]:setVisible(false)
		end
	end
end

function f_bingfa_panel:fillCanYeList()
	if self.m_list ~= nil and self.m_canyeItems ~= nil then
		for i = 1, #self.m_canyeItems do
			self.m_list:deleteComponent(self.m_canyeItems[i])
		end
	end
	
	self.m_canyeItems = {}
	
	local callback = function(index)
		local needUpdate = self.m_selectCanye == nil or self.m_selectCanye.m_index ~= index
		self.m_selectCanye = self.m_canyeItems[index]
		for i = 1, #self.m_canyeItems do
			self.m_canyeItems[i]:setSelect(self.m_canyeItems[i].m_index == index)
		end
		if needUpdate then
			self:updateDisplay()
		end
	end
	
	for i = 1, #self.m_canyeList do
		local item = require("scripts.game.main.bingfa.f_bingfa_canyeItem").new()
		item:setData(self.m_canyeList[i])
		item:setIndex(i)
		item:setItemSelectClick(callback)
		self.m_list:appendComponent(item)	
		table.insert(self.m_canyeItems, item)	
	end
	
	self.m_canyeItems[1]:setSelect(true)
	self.m_selectCanye = self.m_canyeItems[1]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_bingfa_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_bingfa_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_bingfa_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] onEnter
-------------------------------------------------------------------------------
function f_bingfa_panel:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_HE_CHENG[1])
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] onExit
-------------------------------------------------------------------------------
function f_bingfa_panel:onExit()
	self:unregisterNodeEvent()
	for i = 1, #self.m_canyeAnims do
		self:deleteComponent(self.m_canyeAnims[i])
	end
	self:deleteComponent(self.m_canyeCenterAnim)
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_HE_CHENG[1])
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA, self.m_refresh)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA_MERGE, self.m_refreshMerge)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_bingfa_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_bingfa_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] onCleanup
-------------------------------------------------------------------------------
function f_bingfa_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_bingfa_panel:initAllComponent()
	self.m_blockPanel = fc.FContainerPanel:create()
	self.m_blockPanel:setSize(cc.size(2000, 2000))
    self.m_blockPanel:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.m_blockPanel)
    self.m_blockPanel:setPositionInContainer(cc.p(480, 320))
 	self.m_blockPanel:setVisible(false)
 	self.m_blockPanel:setStopTouchEvent(true)
end