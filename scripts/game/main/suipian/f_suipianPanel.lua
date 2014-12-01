require("scripts.auto.auto_suipianPanel")
require("scripts.game.main.beauty.f_game_beauty_card_detail")
require("scripts.game.main.common.f_less_silver_tip_popup")

--[[
	碎片面板 
]]--


local f_suipian_panel = class("f_suipian_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_suipian_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_suipian_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_suipian_panel:ctor()
    
    self:registerNodeEvent()   
    
   self.m_datas = {}

end

-------------------------------------------------------------------------------
-- @function [parent=#f_suipian_panel] panelInitBeforePopup
-- type 1：名臣   2：美女 3:装备
-------------------------------------------------------------------------------
function f_suipian_panel:panelInitBeforePopup(type)
	self.m_type = type	
	self.m_pageContain = 8
	

	self.m_componentTable = createsuipianPanel()
	local chuxiugong = self.m_componentTable["suipianPanel"]
	local str = ""
	if LANGUAGE_TYPE == 3 then
		str = "不同星級招募所需魂魄數量不同，消耗銀兩也不同"
	else
		str = "不同星级招募所需魂魄数量不同，消耗银两也不同"
	end
    self:appendComponent(chuxiugong)
    chuxiugong:setAnchorPoint(cc.p(0.5, 0.5))
    chuxiugong:setPositionInContainer(cc.p(480, 320))
    
    
    if self.m_type == 3 then
		self.m_pageContain = 4
		if LANGUAGE_TYPE == 3 then
			str = "不同星級合成所需碎片數量不同，消耗銀兩也不同"
		else
			str = "不同星级合成所需碎片数量不同，消耗银两也不同"
		end
	end
	self.m_componentTable["btnMerge"]:setVisible(self.m_type == 3)
	self.m_componentTable["btnZhaomu"]:setVisible(self.m_type ~= 3)
	self.m_componentTable["bottomText"]:setString(str)
	
	self:updatePage()
    
    local detial = function()
		self:showDetial()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnDetial"]:addHandleOfcomponentEvent(detial,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local merge = function()
		self:merge()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnMerge"]:addHandleOfcomponentEvent(merge,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["btnZhaomu"]:addHandleOfcomponentEvent(merge,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_suipian_panel:updatePage()
	
	self.m_datas = g_game.g_userInfoManager:getPieceList(self.m_type)
	self.m_total_page = math.ceil(#self.m_datas / self.m_pageContain)

	local page = 1
	if self.m_page ~= nil then
		page = self.m_page:getCurrentPageIndex()
		self:deleteComponent(self.m_page)
		self.m_page = nil
	end
	
	if page > self.m_total_page then
		page = self.m_total_page
	end
	self.m_page = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page)
	if self.m_type == 3 then
		self.m_page:setSize(cc.size(940,458))
	else
		self.m_page:setSize(cc.size(780,520))
	end
	self.m_page:setAnchorPoint(cc.p(0.5, 0.5))

	if self.m_type == 3 then
		self.m_page:setPositionInContainer(cc.p(480, 300))
	else
		self.m_page:setPositionInContainer(cc.p(480, 330))
	end
    self.m_page:setStopTouchEvent(true) 
    self.m_page:enableClipping(true)
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end
    self.m_items = {}
    self.m_page:registLoadPageCallback(load)
    
    if self.m_type == 3 then
    	self.m_page:setPageInfoAndIndex(#self.m_datas, 1, 4, 5, 0, 234,458, page)
    else
    	self.m_page:setPageInfoAndIndex(#self.m_datas, 2, 4, 7, 0, 195,248, page)
    end	
end

--------------------------------------------------------------
-- @function [parent=#f_suipian_panel] showJumpTipPopup
--------------------------------------------------------------
function f_suipian_panel:showJumpTipPopup()
	local panel = f_jump_tip_popup.static_create()
	if self.m_type == 3 then	
		panel:setPanelByType(11)
	else
		panel:setPanelByType(17)
	end
	local leftBtnCallback = function()
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(6)
		if getOpenLv > g_game.g_userInfoManager:getUserLv() then
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			local str = g_game.g_dictConfigManager:getLanTextById(436)
			g_game.g_utilManager:showMsg(getOpenLv .. str)
		else
			g_game.g_panelManager:removeAllUiPanel()
			require("scripts.game.main.bingfa.f_xunfang_panel")
			local panel = f_xunfang_panel.static_create()
			panel:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
		end
	end
	local rightBtnCallback = function()
--		if g_game.OPEN_ELITE_LV > g_game.g_userInfoManager:getUserLv() then
--			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
--			g_game.g_utilManager:showMsg(g_game.OPEN_ELITE_LV .. "级开启。挑战精英BOSS，拿丰厚奖励！")
--		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
			g_game.g_userInfoManager:requestUserPveProgress()
--		end
	end
	panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
	g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
end

function f_suipian_panel:merge()
	if self.m_selectIndex <= 0 then
		self:showJumpTipPopup()
		return
	end
	local data = self.m_datas[self.m_selectIndex]
	local cost = g_game.g_dictConfigManager:getPieceCost(data["fragmentId"])
	local num = g_game.g_dictConfigManager:getPieceMergeNumber(data["fragmentId"])
	if num > g_game.g_userInfoManager:getPieceNumber(self.m_type, data["fragmentId"]) then
--		g_game.g_utilManager:showMsg("数量不足")
		self:showJumpTipPopup()
		return
	end
	if cost > g_game.g_userInfoManager.m_user_info["silver"] then
--		g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
		return
	end 
	g_game.g_userInfoManager:requestMergePiece(data["fragmentId"])
end

function f_suipian_panel:showDetial()
	if self.m_selectIndex <= 0 then
		return
	end
	local data = self.m_datas[self.m_selectIndex]
	if self.m_type == 1 then
		local detailPanel = f_card_mingchen_detail.static_create()
		detailPanel:panelInitBeforePopup()
		local data = g_game.g_utilManager:fakeMingChenData(g_game.g_dictConfigManager:getPieceCardID(data["fragmentId"]))
		detailPanel:setDetail(data)
		
		g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")

	elseif self.m_type == 2 then
		local detailPanel = f_game_beauty_card_detail.static_create()
		detailPanel:panelInitBeforePopup()
		detailPanel:setStopTouchEvent(true)
		g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
		local beauty = require("scripts.game.main.suipian.f_fake_beauty").new()
		beauty:setData(g_game.g_dictConfigManager:getPieceCardID(data["fragmentId"]))
		detailPanel:setDetail(beauty)
	elseif self.m_type == 3 then
		require("scripts.game.main.equipBag.f_equipDetial_panel")
		local panel = f_equipDetial_panel.static_create()
		local data = g_game.g_utilManager:fakeEquipment(g_game.g_dictConfigManager:getPieceCardID(data["fragmentId"]))
		panel:panelInitBeforePopup(data, false)
		g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_suipian_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_suipian_panel:onEnter()   
	self.m_selectItem = nil
	self.m_selectIndex = 0
	
	self.event_updatePveElite = function()
		g_game.g_panelManager:removeAllUiPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO)
		self:jumpToElite()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SUIPIAN_TO_ELITE, self.event_updatePveElite)
	
	self.m_refresh = function()
		self:updatePage()
		if self.m_type == 3 then
			g_game.g_utilManager:showMsg("合成成功")
		else
			g_game.g_utilManager:showMsg("招募成功")
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
end


function f_suipian_panel:jumpToElite()
	local chapterPanel = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
	
	if chapterPanel then
		chapterPanel:updateLastEliteChapterFromServer()
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_suipian_panel] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_suipian_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_page then
		return
	end
	
	if not self.m_page:needLoadPage(pageIndex) then
		return
	end
		
	local startIndex = (pageIndex-1) * self.m_pageContain + 1
	local endIndex = math.min(startIndex + self.m_pageContain - 1, #self.m_datas)
	
	local onClickItem = function(item)
		self:onSelectItem(item)
	end
	
	local onRemoveItem = function(item)
		self:onRemoveItem(item)
	end
	
	for i = startIndex, endIndex do
		local card = nil
		card = require("scripts.game.main.suipian.f_suipianItem").new()
		card:setType(self.m_type)
		if self.m_type == 3 then
			card:setSize(cc.size(251, 458))
		else
			card:setSize(cc.size(192, 264))
		end
		self.m_page:addComponentToPage(card, pageIndex)
		card:setData(self.m_datas[i], i)
		card:setItemSelectClick(onClickItem)
		card:setRemoveCallback(onRemoveItem)
		
		if i == 1 then
			self.m_selectItem = card
			self.m_selectIndex = i
			card:setSelect(true)
		else
			card:setSelect(false)
		end
		
		table.insert(self.m_items, card)
	end
end

function f_suipian_panel:onRemoveItem(item)
	for i = 1, #self.m_items do
		if item.m_index == self.m_items[i].m_index then
			table.remove(self.m_items,i)
			break
		end
	end
end

function f_suipian_panel:onSelectItem(item)
	if item.m_index ~= self.m_selectIndex then
		self.m_selectItem = item
		self.m_selectIndex = item.m_index
		for i = 1, #self.m_items do
			self.m_items[i]:setSelect(self.m_items[i].m_index == self.m_selectIndex)
		end
	end
end

function f_suipian_panel:onExit()    
    self:unregisterNodeEvent()
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SUIPIAN_TO_ELITE, self.event_updatePveElite)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
end

function f_suipian_panel:onEnterTransitionFinish()
end

function f_suipian_panel:onExitTransitionStart()
end

function f_suipian_panel:onCleanup()
end


function f_suipian_panel:registerNodeEvent(handler)
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

function f_suipian_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_suipian_panel