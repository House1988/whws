require("scripts.auto.auto_chuxiugong_bg")
require("scripts.game.main.beauty.f_game_beauty_card_detail")
require("scripts.game.main.beauty.f_delete_beauty")
require("scripts.game.main.beauty.f_game_beauty_cefeng")
require("scripts.game.main.beauty.f_game_beauty_allbeauty_card")

--[[
	储秀宫 
]]--

local f_game_beauty_chuxiugong = class("f_game_beauty_chuxiugong", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_chuxiugong")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:ctor()
    
    self:registerNodeEvent()   
    
    self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_allBeauty_data = {}
	
	self.COL			= 5
	self.ROW			= 2
	
	self.m_selectBeauty = nil
	self.m_selectBeautyData = nil
    
  	self.m_chuxiugong_table = nil
  	
  	self.m_cefengPanel = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:onEnter()   
	self.m_chuxiugong_table = createchuxiugong_bg()
	local chuxiugong = self.m_chuxiugong_table["chuxiugong_bg"]
    self:appendComponent(chuxiugong)
    chuxiugong:setAnchorPoint(cc.p(0,1))
    chuxiugong:setPositionInContainer(cc.p(0,0))

	self:initAllBeautyList()
	
	local showCardDetail = function()
		self:showSelectCardDetail()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_chuxiugong_table["cxg_xiangqing_button"]:addHandleOfcomponentEvent(showCardDetail,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local gongdouCard = function()
		self:gongDouSelectCard()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_chuxiugong_table["cxg_gongdou_button"]:addHandleOfcomponentEvent(gongdouCard,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
		
	local cefengCard = function()
		self:cefengSelectCard()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_chuxiugong_table["cxg_cefeng_button"]:addHandleOfcomponentEvent(cefengCard,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local delete = function()
		self:deleteSelectCard()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_chuxiugong_table["cxg_delete_button"]:addHandleOfcomponentEvent(delete,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
		
	self.event_updateSelectGouDouCallBack = function()
		self:initAllBeautyList()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateSelectGouDouCallBack)
	
	self.event_updateSelectCefengCallback = function()
		local card = self:getItemByData(self.m_selectBeautyData)
		if card ~= nil then
			card:updateBeautyData()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateSelectCefengCallback)
	
	self.event_updateBeautyOnboard1 = function()
		self:updateOnBoardBeautyFlag()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHANGE_BEAUTY, self.event_updateBeautyOnboard1)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] updateOnBoardBeautyFlag
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:updateOnBoardBeautyFlag()
	self:initAllBeautyList()
end

function f_game_beauty_chuxiugong:getItemByData(data)
	for i = 1, #self.m_item_array do
		if self.m_item_array[i]:getData() == data then
			return self.m_item_array[i]
		end
	end
	return nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] initAllBeautyList
-- 初始化所有  美女卡牌的  page
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:initAllBeautyList()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil

	self.m_item_array = {}
	self.m_allBeauty_data = {}
	self.m_item_count = 0
	self.m_total_pages = 0	
	self.m_selectBeautyData = nil
	
	local beautyListInfoFromServer = g_game.g_userInfoManager:getBeautiListInfo()
	self.m_item_count = beautyListInfoFromServer["battleList_Num"] + beautyListInfoFromServer["unbattleList_Num"] 
	
	if self.m_item_count == 0 then
		return
	end
	
	local beautyListData = g_game.g_userInfoManager:getAllBeautyArr()
	for i = 1, self.m_item_count do
		table.insert(self.m_allBeauty_data,beautyListData[i])
	end
	
	--美女按照 星级排序
	local compFunc = function(beauty1, beauty2)
		--获取到名臣星级
		local beauty1Quality = g_game.g_dictConfigManager:getBeautyQuality(beauty1["beautyId"])
		local beauty2Quality = g_game.g_dictConfigManager:getBeautyQuality(beauty2["beautyId"])
		
		if beauty1Quality == beauty2Quality then
			if beauty1["beautyLevel"] == beauty2["beautyLevel"] then
				return beauty1["beautyId"] > beauty2["beautyId"]
			else
				return beauty1["beautyLevel"] > beauty2["beautyLevel"]
			end
		else
			return beauty1Quality > beauty2Quality
		end
	end
	table.sort(self.m_allBeauty_data,compFunc)
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(915,500))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(20,0))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
    
    local pageText = function()
    	self.m_chuxiugong_table["pageText"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
    end
    self.m_page_container:registMovePageCallback(pageText)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 8, 10, 169,238)	
	
	self.m_chuxiugong_table["pageText"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local beautyClickCallback = function(card)
		self:selectBeautyEvent(card)
	end
	
	local removeItem = function(card)
		self:removeItem(card)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if #self.m_allBeauty_data >= i then
			local beautyCard = f_game_beauty_allbeauty_card.static_create()
			beautyCard:panelInitBeforePopup()
			beautyCard:setSize(cc.size(169,238))
			
			beautyCard:setBeautyIndex(i)
			beautyCard:setIsGongDou(false)
			beautyCard:setData(self.m_allBeauty_data[i])
			
			beautyCard:setRemoveCallback(removeItem)
			beautyCard:setBeautyClickCallback(beautyClickCallback)
			
			if i == 1 then
				self.m_selectBeautyData = beautyCard:getData()
				beautyCard.m_componentTable["chuxiugong_xuanzhong"]:setVisible(true)
			else
				beautyCard.m_componentTable["chuxiugong_xuanzhong"]:setVisible(false)
			end
			
			self.m_page_container:addComponentToPage(beautyCard, pageIndex)
			
			table.insert(self.m_item_array, beautyCard)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] selectBeautyEvent
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:selectBeautyEvent(card)
	self.m_selectBeautyData = card:getData()
	local index = card:getBeautyIndex()

	for i = 1 ,#self.m_item_array do
		if index ==self.m_item_array[i]:getBeautyIndex()  then
			self.m_item_array[i].m_componentTable["chuxiugong_xuanzhong"]:setVisible(true)
		else
			self.m_item_array[i].m_componentTable["chuxiugong_xuanzhong"]:setVisible(false)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] removeItem
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:removeItem(card)
	local index = card:getBeautyIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getBeautyIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] showSelectCardDetail
-- 显示当前卡牌详情
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:showSelectCardDetail()

	if self.m_selectBeautyData == nil then
		return
	end
	
	local detailPanel = f_game_beauty_card_detail.static_create()
	detailPanel:panelInitBeforePopup()
	detailPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
	local item = self:createFakeBeautyItem(self.m_selectBeautyData)
	detailPanel:setDetail(item)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] createFakeBeautyItem
-- 创建假的数据对象
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:createFakeBeautyItem(data)
	local item = require("scripts.game.main.suipian.f_fake_beauty").new()
	item:setWholeData(data)
	return item
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] gongDouSelectCard
-- 宫斗当前卡牌
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:gongDouSelectCard()
	if self.m_selectBeautyData == nil then
		return
	end

	if self.m_selectBeautyData["beautyLevel"] >= g_game.g_userInfoManager:getUserInfo()["level"] then
		g_game.g_utilManager:showMsg("卡牌等级不能超过皇帝等级")
	end
	local item = self:createFakeBeautyItem(self.m_selectBeautyData)
	 --需要将升级的对象 排除在 吞卡队列之外
	g_game.g_userInfoManager:updateCanbeEatenBeautyArr(item)
	
	local gongdouPanel = f_game_beauty_gongdou.static_create()
	gongdouPanel:panelInitBeforePopup()
	gongdouPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(gongdouPanel,"gongdou_bg")
    gongdouPanel:setLvupTargetBeauty(item)
   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] deleteSelectCard
-- 选择删除卡牌
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:deleteSelectCard()

	 --需要将升级的对象 排除在 吞卡队列之外
	
	local gongdouPanel = f_delete_beauty.static_create()
	gongdouPanel:panelInitBeforePopup()
	gongdouPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(gongdouPanel,"gongdou_bg")
   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chuxiugong] cefengSelectCard
-- 册封当前卡牌
-------------------------------------------------------------------------------
function f_game_beauty_chuxiugong:cefengSelectCard()
	if self.m_selectBeautyData == nil then
		return
	end
	
	if g_game.g_userInfoManager:getUserLv() < 25 then
		local str = g_game.g_dictConfigManager:getLanTextById(408)
		g_game.g_utilManager:showMsg(str)
		return
	end
	
	local cefengPanel = f_game_beauty_cefeng.static_create()
	cefengPanel:panelInitBeforePopup()
	cefengPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(cefengPanel,"hougong_cefeng_bg")
    cefengPanel:setCefengBeauty(self:createFakeBeautyItem(self.m_selectBeautyData))
	cefengPanel:initCefengTitleList()

end


function f_game_beauty_chuxiugong:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateSelectGouDouCallBack)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateSelectCefengCallback)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHANGE_BEAUTY, self.event_updateBeautyOnboard1)
	
end

function f_game_beauty_chuxiugong:onEnterTransitionFinish()
end

function f_game_beauty_chuxiugong:onExitTransitionStart()
end

function f_game_beauty_chuxiugong:onCleanup()
end


function f_game_beauty_chuxiugong:registerNodeEvent(handler)
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

function f_game_beauty_chuxiugong:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_game_beauty_chuxiugong