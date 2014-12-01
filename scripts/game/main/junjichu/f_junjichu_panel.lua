require("scripts.game.main.card.f_card_mingchenxuanze_card")
require("scripts.game.main.card.f_card_mingchen_detail")
require("scripts.game.main.junjichu.f_mingchen_shengji_panel")

--[[--
军机处 界面
--]]--
f_junjichu_panel = class("f_junjichu_panel")
f_junjichu_panel.__index = f_junjichu_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_junjichu_panel.static_create()
	local junjichu_title_table = createjunjichu_title()
	local junjichu_title_panel = junjichu_title_table["junjichu_title"]

	local funTable = {}
	tolua.setpeer(junjichu_title_panel, funTable)
	setmetatable(funTable, f_junjichu_panel)

	junjichu_title_panel.m_componentTable = junjichu_title_table
	return junjichu_title_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_junjichu_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self:refersh()
	
	self.m_componentTable["pageBtn1"]:setIsEnabled(false)
	self.m_componentTable["pageBtn1"]:setRadioButtonState(1)
	
	self.m_componentTable["pageBtn2"]:setIsEnabled(true)
	self.m_componentTable["pageBtn2"]:setRadioButtonState(2)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] refersh
-- 重新加载数据显示
-------------------------------------------------------------------------------
function f_junjichu_panel:refersh()
	self.m_total_pages	= 0	
	self.m_mingchen_count	= 0
	self.COL			= 4
	self.ROW			= 2
	
	self.m_danye_mingchen_array	= {}
	self.m_mingchen_array = {}
	
	self.m_select_mingchenData	= nil
	self.m_current_page = 0
	self.m_update_callback	= nil
	self:loadMingchenData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] loadMingchenData
-- 加载名称数据
-------------------------------------------------------------------------------
function f_junjichu_panel:loadMingchenData()
	local visible = true
	if self.m_page_container ~= nil then
		visible = self.m_page_container:isVisible()
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	

	self.m_total_pages	= 0	
	self.m_mingchen_count = 0
	self.m_danye_mingchen_array	= {}
	self.m_mingchen_array = {}
	self.m_current_page = 1

	--获取到所有名臣列表
	local mingchenInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR)
		
	self.m_mingchen_count = #mingchenInfo
	
	for i = 1, self.m_mingchen_count do
		table.insert(self.m_mingchen_array, mingchenInfo[i])
	end
	
	--排序名臣列表（第一关键字：星级 第二关键字：等级）
	local compFunc = function(mingchen1, mingchen2)
		--获取到名臣星级
		local mingchenStar1 = g_game.g_dictConfigManager:getCardQuality(mingchen1["officerId"])
		local mingchenStar2 = g_game.g_dictConfigManager:getCardQuality(mingchen2["officerId"])
		if mingchenStar1 == mingchenStar2 then
			if mingchen1["officerLevel"] == mingchen2["officerLevel"] then
				return mingchen1["officerId"] > mingchen2["officerId"]
			else
				return mingchen1["officerLevel"] > mingchen2["officerLevel"]
			end
		else
			return mingchenStar1 > mingchenStar2
		end
	end
	table.sort(self.m_mingchen_array,compFunc)
	
	self.m_total_pages = math.ceil(self.m_mingchen_count / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(820, 500))
	self.m_page_container:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, 310))
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
	
	self.m_page_container:setPageInfo(self.m_mingchen_count, self.ROW, self.COL, 12, 18, 185,228)	
	self.m_page_container:setVisible(visible)
	
	self.m_componentTable["pageText"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] updatePageNum
-- 更新页数
-------------------------------------------------------------------------------
function f_junjichu_panel:updatePageNum()
	self.m_current_page = self.m_page_container:getCurrentPageIndex()
	print ("current page num::"..self.m_current_page)
	
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_mingchen_count then
		endIndex = 	self.m_mingchen_count
	end
	
	print("start index::"..startIndex.."endIndex"..endIndex)
	
	self.m_componentTable["pageText"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_junjichu_panel:loadPageData(pageIndex)	
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
			local item = f_card_mingchenxuanze_card.static_create()
			item:panelInitBeforePopup()
			self.m_page_container:addComponentToPage(item, pageIndex)
			
			item:setMingchenIndex(i)
			item:setData(self.m_mingchen_array[i])				
			item:setMingchenCardEventCallBack(itemCallback)
			item:setMingchenRemoveFromListCallback(removeItem)
			
			if i == 1 then
				self.m_select_mingchenData = item:getData()
				item:setSelectState(true)
			else
				item:setSelectState(false)
			end
				
			table.insert(self.m_danye_mingchen_array, item)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] updateSelectItem
-- 刷新选中名臣
-------------------------------------------------------------------------------
function f_junjichu_panel:updateSelectItem(card)	
	local data = card:getData()	
	print ("index::"..card:getMingchenIndex())
	
	for i = 1, #self.m_danye_mingchen_array do
		if data["id"] == self.m_danye_mingchen_array[i]:getData()["id"] then
			self.m_danye_mingchen_array[i]:setSelectState(true)	
			self.m_select_mingchenData = self.m_danye_mingchen_array[i]:getData()
		else
			self.m_danye_mingchen_array[i]:setSelectState(false)
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] removeItem
-- 删除名臣
-------------------------------------------------------------------------------
function f_junjichu_panel:removeItem(card)	
	local data = card:getData()
	
	for i = #self.m_danye_mingchen_array,1,-1 do
		if data["id"] == self.m_danye_mingchen_array[i]:getData()["id"] then
			table.remove(self.m_danye_mingchen_array, i)
			break
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_junjichu_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_junjichu_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_junjichu_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] onEnter
-------------------------------------------------------------------------------
function f_junjichu_panel:onEnter()
	self.m_componentTable["jjc_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["jjc_back_page_button"]:setComponentZOrder(10)
    self:setStopTouchEvent(true)
    self.m_isSuipianView = false
    
    self.m_componentTable["jjc_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
    
	self:initAllComponent()
	--新手指引
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_JUNJICHU_OPEN)
	
	self.m_refresh = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
    g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.m_refresh)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] onExit
-------------------------------------------------------------------------------
function f_junjichu_panel:onExit()
	self:unregisterNodeEvent()
	
	self.m_page_container = nil
	self.m_danye_mingchen_array	= nil
	self.m_mingchen_array = nil	
	self.m_update_callback	= nil
	self.m_piece = nil
	--移除注册的监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.m_refresh)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_junjichu_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_junjichu_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] onCleanup
-------------------------------------------------------------------------------
function f_junjichu_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] popCardDeleteView
-------------------------------------------------------------------------------
function f_junjichu_panel:popCardDeleteView()

	if self.m_select_mingchenData == nil  then
		local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT)
		g_game.g_utilManager:showMsg(tips)	
		return 
	end
		
	local mingchen_shengji_panel = f_mingchen_shengji_panel.static_create()	
	mingchen_shengji_panel:panelInitBeforePopup()
--	mingchen_shengji_panel:setTargetMingchenData(self.m_select_mingchen:getData())
	mingchen_shengji_panel:setType(2)
	g_game.g_panelManager:showUiPanel(mingchen_shengji_panel, "mingchen_shengji")
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] showSuipianView
-------------------------------------------------------------------------------
function f_junjichu_panel:showSuipianView()
	if self.m_piece == nil then
		self.m_piece = require("scripts.game.main.suipian.f_suipianPanel").new()	
		self:appendComponent(self.m_piece)
		self.m_piece:setSize(cc.size(960, 640))	  
		self.m_piece:panelInitBeforePopup(1)
		self.m_piece:setAnchorPoint(cc.p(0,1))
		self.m_piece:setPositionInContainer(cc.p(0, 0))
	else
		self.m_piece:setVisible(true)
	end
	self.m_page_container:setVisible(false)
	self.m_componentTable["jjc_delete_button"]:setVisible(false)
	self.m_componentTable["jjc_details_button"]:setVisible(false)
	self.m_componentTable["jjc_shengji_button"]:setVisible(false)
	self.m_componentTable["ciguan_button"]:setVisible(false)
	self.m_isSuipianView = true
	
	if not self.m_componentTable["pageBtn2"]:getIsEnabled() then
		self.m_componentTable["pageBtn2"]:setIsEnabled(true)
		self.m_componentTable["pageBtn2"]:setRadioButtonState(1)
	end
	
	self.m_componentTable["pageBtn1"]:setIsEnabled(false)
	self.m_componentTable["pageBtn1"]:setRadioButtonState(2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] showMinChenView
-------------------------------------------------------------------------------
function f_junjichu_panel:showMinChenView()
	if self.m_piece ~= nil then
		self.m_piece:setVisible(false)
	end
	
	if self.m_page_container == nil then
		self:loadMingchenData()
	end
	
	self.m_page_container:setVisible(true)
	self.m_componentTable["jjc_delete_button"]:setVisible(true)
	self.m_componentTable["jjc_details_button"]:setVisible(true)
	self.m_componentTable["jjc_shengji_button"]:setVisible(true)
	self.m_componentTable["ciguan_button"]:setVisible(true)
	self.m_isSuipianView = false
	
	if not self.m_componentTable["pageBtn1"]:getIsEnabled() then
		self.m_componentTable["pageBtn1"]:setIsEnabled(true)
		self.m_componentTable["pageBtn1"]:setRadioButtonState(1)
	end
	
	self.m_componentTable["pageBtn2"]:setIsEnabled(false)
	self.m_componentTable["pageBtn2"]:setRadioButtonState(2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_junjichu_panel:initAllComponent()
	
	--名臣出售
	local showCardDelete = function()
		self:popCardDeleteView()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jjc_delete_button"]:addHandleOfcomponentEvent(showCardDelete,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
	--名臣碎片
	local showMingchen = function()
		self:showMinChenView()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_componentTable["pageBtn1"]:addHandleOfcomponentEvent(showMingchen,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
		--名臣碎片
	local showSuipian = function()
		self:showSuipianView()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_componentTable["pageBtn2"]:addHandleOfcomponentEvent(showSuipian,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
	--显示前页
	local showPrePage = function()
		self.m_page_container:showPrePage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["jjc_pre_page_button"]:addHandleOfcomponentEvent(showPrePage,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--显示后页
	local showBackPage = function()
		self.m_page_container:showNextPage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["jjc_back_page_button"]:addHandleOfcomponentEvent(showBackPage,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	--关闭军机处
	local closeCurrentPanel = function()
		self:closeCurrentPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jjc_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--查看详情
	local showDetails = function()
		self:showDetails()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jjc_details_button"]:addHandleOfcomponentEvent(showDetails,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local showciguan = function()
		self:showCiGuan()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["ciguan_button"]:addHandleOfcomponentEvent(showciguan,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--显示升级
	local showShengji = function()
		self:showShengji()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jjc_shengji_button"]:addHandleOfcomponentEvent(showShengji,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--注册名臣升级回调，重新显示数据（吞掉了一部分名臣）
	self.event_updateMingchenShengji = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] closeCurrentPanel
-- 从父节点删除
-------------------------------------------------------------------------------
function f_junjichu_panel:closeCurrentPanel()
	g_game.g_panelManager:removeUiPanel("junjichu_title")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] showCiGuan
-- 显示赐官
-------------------------------------------------------------------------------
function f_junjichu_panel:showCiGuan()
	--获取到当前名臣信息	

	if self.m_select_mingchenData == nil then
		local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT)
		g_game.g_utilManager:showMsg(tips)	
		return 
	end
	local data = self.m_select_mingchenData
	if 10 > g_game.g_userInfoManager:getUserLv() then
		local str = g_game.g_dictConfigManager:getLanTextById(440)
		g_game.g_utilManager:showMsg(str)
		return
	end
	
	local star = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
	if star < 3 then
		local str = g_game.g_dictConfigManager:getLanTextById(425)
		g_game.g_utilManager:showMsg(str)
		return
	end
	if not g_game.g_dictConfigManager:isCardCanAdvance(data["officerId"]) then
		local str = g_game.g_dictConfigManager:getLanTextById(426)
		g_game.g_utilManager:showMsg(str)
		return
	end
	if data["advanced"] >= g_game.g_dictConfigManager:getMaxAdvanceLevel() then
		local str = g_game.g_dictConfigManager:getLanTextById(360)
		g_game.g_utilManager:showMsg(str)
		return
	end
	local mingchen_shengji_panel = f_mingchen_jinjie.static_create()	
	mingchen_shengji_panel:panelInitBeforePopup()
	mingchen_shengji_panel:setData(data)
	g_game.g_panelManager:showUiPanel(mingchen_shengji_panel, "jin_jie")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] showDetails
-- 显示详细信息
-------------------------------------------------------------------------------
function f_junjichu_panel:showDetails()
	--获取到当前名臣信息	
	if self.m_select_mingchenData == nil then
		local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT)
		g_game.g_utilManager:showMsg(tips)	
		return 
	end

	
	local detailPanel = f_card_mingchen_detail.static_create()
	detailPanel:panelInitBeforePopup()
--	detailPanel:setComponentZOrder(20)
	detailPanel:setDetail(self.m_select_mingchenData)
	g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")

end

-------------------------------------------------------------------------------
-- @function [parent=#f_junjichu_panel] showShengji
-- 显示升级界面
-------------------------------------------------------------------------------
function f_junjichu_panel:showShengji()

	if self.m_select_mingchenData == nil then
		local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT)
		g_game.g_utilManager:showMsg(tips)	
		return 
	end

		
	local data = self.m_select_mingchenData
	if data["officerLevel"] >= g_game.g_userInfoManager:getUserInfo()["level"] then
		g_game.g_utilManager:showMsg("卡牌等级不能超过皇帝等级")
		return
	end
	local mingchen_shengji_panel = f_mingchen_shengji_panel.static_create()	
	mingchen_shengji_panel:panelInitBeforePopup()
	mingchen_shengji_panel:setTargetMingchenData(data)
	mingchen_shengji_panel:setType(1)
	g_game.g_panelManager:showUiPanel(mingchen_shengji_panel, "mingchen_shengji")
end



