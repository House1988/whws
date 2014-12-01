require("scripts.game.main.junjichu.f_mingchen_shengji_card")
require("scripts.game.main.common.f_common_floating_notice")
require("scripts.game.main.common.f_card_lv_up_popup")

--[[--
名臣升级 界面
--]]--
f_mingchen_shengji_panel = class("f_mingchen_shengji_panel")
f_mingchen_shengji_panel.__index = f_mingchen_shengji_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel.static_create()
	local mingchen_shengji_table = createmingchen_shengji()
	local mingchen_shengji_panel = mingchen_shengji_table["mingchen_shengji"]

	local funTable = {}
	tolua.setpeer(mingchen_shengji_panel, funTable)
	setmetatable(funTable, f_mingchen_shengji_panel)

	mingchen_shengji_panel.m_componentTable = mingchen_shengji_table
	return mingchen_shengji_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.TYPE_LV_UP = 1 --升级
	self.TYPE_SAIL = 2 --出售
    self.m_type = 0
	
	self.m_total_pages	= 0
	self.m_current_page = 0	
	self.m_mingchen_count= 0
	self.COL			= 5
	self.ROW			= 2
	
	self.m_page_container = nil
	self.m_danye_mingchen_array	= {}
	self.m_mingchen_array = {}
	
	self.m_selectCardNum = 0 --记录当前选中名臣的个数
	self.m_canLvupTo = 0 --记录可升到的等级
	self.m_costSilver = 0 --记录需要消耗的银两
	self.m_kede_silver = 0--当type是出售的时候  可得到的 银两
	self.m_gainExp = 0
	
	self.m_pageRecord = {}
	
	self.m_targetMingchenData = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] onEnter
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:onEnter()
	self.m_componentTable["shengji_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["shengji_back_page_button"]:setComponentZOrder(10)
	self.m_componentTable["sj_quanxuan_check_box"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_componentTable["sj_quanxuan_check_box"]:setComponentZOrder(10)	
--	self.m_componentTable["shengji_shengji_button"]:setComponentZOrder(10)

	if self.m_type == self.TYPE_LV_UP then
		self.m_componentTable["shengji_down_panel"]:setVisible(true)
		self.m_componentTable["delete_down_panel"]:setVisible(false)
		self.m_componentTable["delete_button"]:setVisible(false)
		self.m_componentTable["shengji_shengji_button"]:setVisible(true)
		self.m_componentTable["delete_title_image"]:setVisible(false)
		self.m_componentTable["shengji_title_image"]:setVisible(true)
	elseif self.m_type == self.TYPE_SAIL then
		self.m_componentTable["delete_down_panel"]:setVisible(true)
		self.m_componentTable["shengji_down_panel"]:setVisible(false)
		self.m_componentTable["delete_button"]:setVisible(true)
		self.m_componentTable["shengji_shengji_button"]:setVisible(false)
		self.m_componentTable["delete_title_image"]:setVisible(true)
		self.m_componentTable["shengji_title_image"]:setVisible(false)
	end
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	self.m_componentTable["shengji_yinliang_num"]:setString(userSilver)
	
    self:loadMingchenData()
	--初始化更新底部显示信息
	self:resetBottomInfo()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] resetBottomInfo
-- 重置底部显示信息
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:resetBottomInfo()
	if self.m_type == self.TYPE_LV_UP then
		self.m_componentTable["shengji_bottom_xiaohao_num_label"]:setString(0)
		self.m_componentTable["shengji_bottom_dejingyan_num_label"]:setString(0)
		self.m_componentTable["shengji_bottom_xuyaoyinliang_num_label"]:setString(0)
		self.m_canLvupTo = self.m_targetMingchenData["officerLevel"]
		self.m_componentTable["shengji_bottom_keshengzhi_num_label"]:setString(self.m_canLvupTo .. "/" .. g_game.g_userInfoManager:getUserInfo()["level"])
	elseif self.m_type == self.TYPE_SAIL then
		self.m_componentTable["delete_get_silver"]:setString(0)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:initAllComponent()
	--显示前页
	local sellCards = function()
		self:sellCards()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["delete_button"]:addHandleOfcomponentEvent(sellCards,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
	--显示前页
	local showPrePage = function()
		self.m_page_container:showPrePage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shengji_pre_page_button"]:addHandleOfcomponentEvent(showPrePage,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--显示后页
	local showBackPage = function()
		self.m_page_container:showNextPage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shengji_back_page_button"]:addHandleOfcomponentEvent(showBackPage,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	--关闭名臣升级
	local closeCurrentPanel = function()
		if g_game.g_guidelinesManager:canBtnClick("officerCardLvupClose") then
			g_game.g_panelManager:removeUiPanel("mingchen_shengji")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["shengji_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--升级
	local shengjiClick = function()
		self:shengjiClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_JUNJICHU_SHENGJI)
	end
	self.m_componentTable["shengji_shengji_button"]:addHandleOfcomponentEvent(shengjiClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
	--全选事件处理
	local quanxuanClick = function()
		if self.m_componentTable["sj_quanxuan_check_box"]:isCheckBoxSelectYes() then
			self:setIsSelectAllMingchen(true)
		else
			self:setIsSelectAllMingchen(false)
		end
	end
	self.m_componentTable["sj_quanxuan_check_box"]:addHandleOfcomponentEvent(quanxuanClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.event_updateMingchenSell = function()
		self:updateMingchenSell()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REMOVE_MINGCHEN, self.event_updateMingchenSell)
	
	--注册升级成功后监听函数
	self.event_updateMingchenShengji = function()
		self:updateMingchenShengji()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI, self.event_updateMingchenShengji)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] setType
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:setType(type)
	 self.m_type = type
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] loadMingchenData
-- 加载名臣信息（未上阵名臣 并且 不是目标名臣）
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:loadMingchenData()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_selectCardNum = 0 
	self.m_canLvupTo = 0 
	self.m_costSilver = 0 
	self.m_kede_silver = 0
	self.m_pageRecord  = {}
	self.m_gainExp = 0

	self.m_total_pages	= 0
	self.m_current_page = 1	
	self.m_mingchen_count= 0
	
	self.m_danye_mingchen_array	= {}
	self.m_mingchen_array = {}
	
	--获取到所有需要显示名臣列表（未上阵 && 不是目标名臣）
	local unbattleList   =  g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)

	for i = 1, #unbattleList do
		if self.m_type == self.TYPE_LV_UP then
			if self.m_targetMingchenData["id"] ~= unbattleList[i]["id"] then 
				self.m_mingchen_count = self.m_mingchen_count + 1
				table.insert(self.m_mingchen_array, {["data"] = unbattleList[i],["item_flag"] = 0})
			end
		elseif self.m_type == self.TYPE_SAIL then
			self.m_mingchen_count = self.m_mingchen_count + 1
			table.insert(self.m_mingchen_array, {["data"] = unbattleList[i], ["item_flag"] = 0})
		end
	end
	
	--排序名臣列表（第一关键字：星级 第二关键字：等级）
	local compFunc = function(mingchen1, mingchen2)
		--获取到名臣星级
		local mingchenStar1 = g_game.g_dictConfigManager:getCardQuality(mingchen1["data"]["officerId"])
		local mingchenStar2 = g_game.g_dictConfigManager:getCardQuality(mingchen2["data"]["officerId"])
		if mingchenStar1 == mingchenStar2 then
			if mingchen1["data"]["officerLevel"] == mingchen2["data"]["officerLevel"] then
				return mingchen1["data"]["officerId"] > mingchen2["data"]["officerId"]
			else
				return mingchen1["data"]["officerLevel"] < mingchen2["data"]["officerLevel"]
			end
		else
			return mingchenStar1 < mingchenStar2
		end
	end
	table.sort(self.m_mingchen_array,compFunc)
	
	--设置选中页的标致位
	self.m_total_pages = math.ceil(self.m_mingchen_count / (self.COL * self.ROW))	
	for i = 1,self.m_total_pages do
		table.insert(self.m_pageRecord,{["page_flag"] = 0})
	end
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(884, 443))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(45,80))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    local updatePageNum = function()
    	self:updatePageNum()
    end      
    self.m_page_container:registMovePageCallback(updatePageNum)
	
	self.m_page_container:setPageInfo(self.m_mingchen_count, self.ROW, self.COL, 10, 13, 162,204)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] loadPageData
-- 刷新名臣显示列表
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local itemCallback = function(card)
		self:updateSelectItem(card)
	end
	
	local removeItem = function(card)
		self:removeItem(card)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if self.m_mingchen_count >= i then
			local item = f_mingchen_shengji_card.static_create()
			item:panelInitBeforePopup()
			item:setSize(cc.size(162,204))
			self.m_page_container:addComponentToPage(item, pageIndex)
			
			item:setIndex(i)			
			item:setData(self.m_mingchen_array[i]["data"])							
			item:setMingchenCardEventCallBack(itemCallback)
			item:setMingchenRemoveFromListCallback(removeItem)			
			
			table.insert(self.m_danye_mingchen_array, item)	
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] updateSelectItem
-- 刷新选中名臣的状态
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:updateSelectItem(card)
	local data = card:getData()	
	
	for j = 1, #self.m_mingchen_array do
		if self.m_mingchen_array[j]["data"]["id"] == data["id"] then
			
			if self.m_mingchen_array[j]["item_flag"] == 0 then
				self.m_mingchen_array[j]["item_flag"] = 1
				card:setDuigouVisible(true)
			else
				self.m_mingchen_array[j]["item_flag"] = 0
				card:setDuigouVisible(false)
				
				self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(false)
				self.m_pageRecord[self.m_current_page]["page_flag"] = 0
			end
		end
	end
	
	self:updateBottomInfo()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] removeItem
-- 删除名臣
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:removeItem(card)
	local data = card:getData()
	
	for i = #self.m_danye_mingchen_array,1,-1 do
		if data["id"] == self.m_danye_mingchen_array[i]:getData()["id"] then
			table.remove(self.m_danye_mingchen_array, i)
			break
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] updateBottomInfo
-- 更新底部显示信息
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:updateBottomInfo()
	if self.m_type == self.TYPE_LV_UP then
		self.m_selectCardNum = 0
		self.m_costSilver = 0
		self.m_gainExp = 0
		local gainLv = 0
		for i = 1 , self.m_mingchen_count do
			if self.m_mingchen_array[i]["item_flag"] == 1 then
			
				self.m_selectCardNum = self.m_selectCardNum +1
				
				local officerId = self.m_mingchen_array[i]["data"]["officerId"]
				local officerCostSilver = g_game.g_dictConfigManager:getOfficerMergeYinliang(officerId)
				
				self.m_costSilver = self.m_costSilver + officerCostSilver
				
				local  officerBaseExp = g_game.g_dictConfigManager:getOfficerMergeExp(officerId)
				local  officerQuality = g_game.g_dictConfigManager:getCardQuality(officerId)
				local  officerLv = self.m_mingchen_array[i]["data"]["officerLevel"]
				local  getUnAddExp = g_game.g_dictConfigManager:getOfficerUnAddExp(officerQuality,officerLv)
				self.m_gainExp = self.m_gainExp + (getUnAddExp + self.m_mingchen_array[i]["data"]["officerExp"] + officerBaseExp)*0.8
			end
		end
		self.m_gainExp = math.floor(self.m_gainExp)
		
		local curExp = self.m_targetMingchenData["officerExp"]
		local curLv = self.m_targetMingchenData["officerLevel"]
		local curCardId = self.m_targetMingchenData["officerId"]
		
		--当前升级的目标卡牌可以升 多少级
		local curCardCanLv = self:calculateCardLvupNums(curCardId,curLv,curExp,self.m_gainExp)
		self.m_canLvupTo = curLv + curCardCanLv
		--消耗名臣卡
		self.m_componentTable["shengji_bottom_xiaohao_num_label"]:setString(self.m_selectCardNum)
		--消耗银两
		self.m_componentTable["shengji_bottom_xuyaoyinliang_num_label"]:setString(self.m_costSilver)
		--可得经验
		self.m_componentTable["shengji_bottom_dejingyan_num_label"]:setString(self.m_gainExp)
		--可升至级别
		self.m_componentTable["shengji_bottom_keshengzhi_num_label"]:setString(self.m_canLvupTo .. "/" .. g_game.g_userInfoManager:getUserInfo()["level"])
		
		
	elseif self.m_type == self.TYPE_SAIL then
		self.m_selectCardNum = 0
		self.m_kede_silver = 0
		
		for i = 1 , self.m_mingchen_count do
			if self.m_mingchen_array[i]["item_flag"] == 1 then
				self.m_selectCardNum = self.m_selectCardNum + 1
				local cardQuality= g_game.g_dictConfigManager:getCardQuality(self.m_mingchen_array[i]["data"]["officerId"])
				local sellCardGetSilver = g_game.g_dictConfigManager:getSellCardSilver(self.m_mingchen_array[i]["data"]["officerLevel"],cardQuality)
				self.m_kede_silver = self.m_kede_silver + sellCardGetSilver
			end
		end
		
		self.m_componentTable["delete_get_silver"]:setString(self.m_kede_silver)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] calculateCardTargetLv
-- 计算目标可升到多少级
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:calculateCardLvupNums(curCardId,curLv,curExp,gainExp)
	local canLvup = 0
	
	--加了获得经验后的经验值
	local targetMaxExp = curExp + gainExp
	--当前等级  达到 下一级时需的 卡牌经验值
	local quality = g_game.g_dictConfigManager:getCardQuality(curCardId)
	
	local referenceLv = curLv
	
	local targetNextLvNeedExp = g_game.g_dictConfigManager:getExpLimitByLv(referenceLv,quality)
	
	while targetMaxExp >= targetNextLvNeedExp do
		if referenceLv == g_game.MAX_USER_LV then
			canLvup = canLvup + 1
			print "reach the max card LV!!"
			break
		end	
		
		canLvup = canLvup + 1
	
		referenceLv = referenceLv + 1
		targetNextLvNeedExp = targetNextLvNeedExp + g_game.g_dictConfigManager:getExpLimitByLv(referenceLv,quality)
	end
	
	return canLvup
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] getFirstMingchenComponent
-- 获取当前列表中第一个组件
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:getFirstMingchenComponent()
	return self.m_danye_mingchen_array[1]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] setTargetMingchenData
-- 设置当前名臣的信息
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:setTargetMingchenData(data)
	if self.m_targetMingchenData == data then
		return
	end
	self.m_targetMingchenData = data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] updatePageNum
-- 更新页码
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:updatePageNum()
	--更新page num信息
	self.m_current_page = self.m_page_container:getCurrentPageIndex()
	print ("current page num::"..self.m_current_page)
	
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_mingchen_count then
		endIndex = 	self.m_mingchen_count
	end
	print("start index::"..startIndex.."endIndex"..endIndex)
	
	for i = startIndex,endIndex do
		if self.m_mingchen_array[i]["item_flag"] == 1 then
			for j = 1, #self.m_danye_mingchen_array do
				if self.m_mingchen_array[i]["data"] == self.m_danye_mingchen_array[j]:getData() then
					self.m_danye_mingchen_array[j]:setDuigouVisible(true)
					break
				end
			end
		else
			for j = 1, #self.m_danye_mingchen_array do
				if self.m_mingchen_array[i]["data"] == self.m_danye_mingchen_array[j]:getData() then
					self.m_danye_mingchen_array[j]:setDuigouVisible(false)
					break
				end
			end
		end
		
	end
	
	if self.m_pageRecord[self.m_current_page]["page_flag"] == 1 then
		self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(true)
	else
		self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(false)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] setIsSelectAllMingchen
-- 全选按钮的事件处理
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:setIsSelectAllMingchen(isSelectAllMingchen)
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_mingchen_count then
		endIndex = 	self.m_mingchen_count
	end

	if isSelectAllMingchen then
		for i = startIndex,endIndex do
			self.m_mingchen_array[i]["item_flag"] = 1
			for j = 1, #self.m_danye_mingchen_array do
				if 	self.m_danye_mingchen_array[j]:getIndex() == i then
					self.m_danye_mingchen_array[j]:setDuigouVisible(true)
					break
				end			
			end
		end
		self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(true)
		self.m_pageRecord[self.m_current_page]["page_flag"] = 1
	else
		for i = startIndex,endIndex do
			self.m_mingchen_array[i]["item_flag"] = 0
			for j = 1, #self.m_danye_mingchen_array do
				if 	self.m_danye_mingchen_array[j]:getIndex() == i then
					self.m_danye_mingchen_array[j]:setDuigouVisible(false)
					break
				end			
			end
		end
		
		self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(false)
		self.m_pageRecord[self.m_current_page]["page_flag"] = 0
	end
	
	self:updateBottomInfo()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_mingchen_shengji_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] onExit
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:onExit()
	self:unregisterNodeEvent()
	
	self.m_page_container = nil
	self.m_danye_mingchen_array	= nil
	self.m_mingchen_array = nil
	self.m_targetMingchenData = nil
	
	--移除注册的监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REMOVE_MINGCHEN, self.event_updateMingchenSell)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI, self.event_updateMingchenShengji)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] onCleanup
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] sellCards
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:sellCards()
	local eatenArr = {}
	for i = 1,self.m_mingchen_count do
		if self.m_mingchen_array[i]["item_flag"] == 1 then
			table.insert(eatenArr,{["cardId"] = self.m_mingchen_array[i]["data"]["id"]})
		end
	end
	
	if #eatenArr == 0 then
		return
	end
	
	local hasLv3 = false
	for i = 1,self.m_mingchen_count do
		if self.m_mingchen_array[i]["item_flag"] == 1 and g_game.g_dictConfigManager:getCardQuality(self.m_mingchen_array[i]["data"]["officerId"]) >= 3 then
			hasLv3 = true
		end
	end
	
	if g_game.g_userInfoManager.m_isPopMingchenSell  then
		
		if  hasLv3 then
			local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
			g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
	   		--27 stand for 吞卡三星以上时
	   		popupEatLv3:popUpNotice(32)
	   		--1 stand for scale action
	   		popupEatLv3:setActionType(1)
	   		
	   		local yesEvent = function()
	   			g_game.g_userInfoManager:requestRemoveMinChen(eatenArr)
	   		end
	   		popupEatLv3:setYesCallBack(yesEvent)
		
		else
			g_game.g_userInfoManager:requestRemoveMinChen(eatenArr)
		end
	else  
		g_game.g_userInfoManager:requestRemoveMinChen(eatenArr)
	end
	
	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] updateMingchenSell
-- 更新出售后的名臣信息
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:updateMingchenSell()
 	local unbattleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	
	local tempTable = {}	
	for i = 1 , #unbattleList do
		for j = 1, #self.m_mingchen_array do
			if self.m_mingchen_array[j]["item_flag"] == 1 and
				self.m_mingchen_array[j]["data"]["id"] == unbattleList[i]["id"] then
				table.insert(tempTable,i)
			end
		end
	end
	
	for i = #tempTable, 1,-1 do
		table.remove(unbattleList,tempTable[i])
	end
	
	--修改用户银两
	local resultInfo = g_game.g_userInfoManager:getRemoveMingchenResult()
	g_game.g_utilManager:showMsg("获得银两"..resultInfo["obtainSilver"])
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["silver"] = resultInfo["silver"]
	
	self.m_componentTable["shengji_yinliang_num"]:setString(userInfo["silver"])
	--重新加载数据
	self:resetBottomInfo()
	self:loadMingchenData()
	
	--恢复全选框未选中
	self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(false)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] updateMingchenShengji
-- 更新升级后的名臣信息
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:updateMingchenShengji()
	--获取到数据信息
 	local unbattleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)

	local result = g_game.g_userInfoManager:getMergeCardResult()
	if self.m_targetMingchenData["officerLevel"] == result["officerLevel"] then
		local addExp = self.m_gainExp
		if LANGUAGE_TYPE == 3 then
			g_game.g_utilManager:showMsg("此次經驗+" .. self.m_gainExp)
		else
			g_game.g_utilManager:showMsg("此次经验+" .. self.m_gainExp)
		end	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_LVUP_OFFICER)
	else
		local popupLvUp = require("scripts.game.main.common.f_common_popup_notice").new()	
		
		g_game.g_panelManager:showUiPanel(popupLvUp,"notice_popup_panel")
		
		local addLv = result["officerLevel"] - self.m_targetMingchenData["officerLevel"] 
   		if LANGUAGE_TYPE == 3 then
   			local lvupTips = "經驗+".. self.m_gainExp .. "\n等級+" .. addLv
   			popupLvUp:setNoticeContent("升級成功","恭喜您成功升級！",lvupTips,nil)
   		else
   			local lvupTips = "经验+".. self.m_gainExp .. "\n等级+" .. addLv
   			popupLvUp:setNoticeContent("升级成功","恭喜您成功升级！",lvupTips,nil)
   		end
   		
   		--13 名臣吞卡升级
   		popupLvUp:popUpNotice(13)
   		--1 stand for scale action
   		popupLvUp:setActionType(1)
   		
   		local call  = function()
   			send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_LVUP_OFFICER)
   		end
   		popupLvUp:setYesCallBack(call)

   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI)
	end

	self.m_targetMingchenData["officerLevel"] = result["officerLevel"]
	self.m_targetMingchenData["officerExp"] = result["exp"]
	
	self.m_targetMingchenData["intellect"] = g_game.g_dictConfigManager:getOfficerIntell(self.m_targetMingchenData["officerId"], result["officerLevel"])
	self.m_targetMingchenData["attack"] = g_game.g_dictConfigManager:getOfficerAttack(self.m_targetMingchenData["officerId"], result["officerLevel"])
	self.m_targetMingchenData["defense"] = g_game.g_dictConfigManager:getOfficerDefense(self.m_targetMingchenData["officerId"], result["officerLevel"])
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["silver"] = result["remain"]
	self.m_componentTable["shengji_yinliang_num"]:setString(userInfo["silver"])
	
	self:resetBottomInfo()
	self:loadMingchenData()
	
	self.m_componentTable["sj_quanxuan_check_box"]:setCheckBoxSelect(false)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] showShengji
-- 显示升级界面
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:shengjiClick()
	--等级上限限制(弹出提示面板)
	if self.m_targetMingchenData["officerLevel"] == g_game.MAX_USER_LV then
		g_game.g_utilManager:showMsg("名臣已达最大等级！")
		return
	end
	
	if self.m_canLvupTo > g_game.g_userInfoManager:getUserInfo()["level"] then
		g_game.g_utilManager:showMsg("卡牌等级不能超过皇帝等级")
		return
	end
	
	--检测银两是否足够
	local userYinliang = g_game.g_userInfoManager:getUserInfo()["silver"]
	if  self.m_selectCardNum == 0 then
		g_game.g_utilManager:showMsg("您还没选择名臣哦！")
		return 
	end
	
	if self.m_costSilver > userYinliang then
--		g_game.g_utilManager:showMsg("您的银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		require("scripts.game.main.common.f_less_silver_tip_popup")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
		return 
	end	
	
	
	local hasLv3 = false
	for i = 1,self.m_mingchen_count do
		if self.m_mingchen_array[i]["item_flag"] == 1 and g_game.g_dictConfigManager:getCardQuality(self.m_mingchen_array[i]["data"]["officerId"]) >= 3 then
			hasLv3 = true
		end
	end
	
	if g_game.g_userInfoManager.m_isPopMingchenShengjiSanxing  then
		
		if  hasLv3 then
			local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
			g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
	   		--27 stand for 吞卡三星以上时
	   		popupEatLv3:popUpNotice(27)
	   		--1 stand for scale action
	   		popupEatLv3:setActionType(1)
	   		
	   		local yesEvent = function()
	   			self:sendLvUpMessage()
	   		end
	   		popupEatLv3:setYesCallBack(yesEvent)
		
		else
			self:sendLvUpMessage()
		end
	else  
		self:sendLvUpMessage()
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_panel] sendLvUpMessage
--发送升级消息
-------------------------------------------------------------------------------
function f_mingchen_shengji_panel:sendLvUpMessage()
	local eatenArr = {}
	for i = 1,self.m_mingchen_count do
		if self.m_mingchen_array[i]["item_flag"] == 1 then
			table.insert(eatenArr,{["oId"] = self.m_mingchen_array[i]["data"]["id"],["mergeOfficerId"] = self.m_mingchen_array[i]["data"]["officerId"]})
		end
	end
	
	g_game.g_userInfoManager:requestMingchenShengji(self.m_targetMingchenData["id"], self.m_targetMingchenData["officerId"], #eatenArr, eatenArr)
end

