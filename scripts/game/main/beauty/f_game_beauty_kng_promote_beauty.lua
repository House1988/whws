require("scripts.auto.auto_meinvxuanze_title")

--[[
	选择美女  册封 界面
]]--

local f_game_beauty_kng_promote_beauty = class("f_game_beauty_kng_promote_beauty", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_kng_promote_beauty")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:ctor()
    self:registerNodeEvent()   
    
    self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_unpromote_data = {}
	
	self.COL			= 4
	self.ROW			= 2
    
    self.m_selectBeauty = nil
    self.m_titleGroupIndex = 0
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] setTitleGroupIndex
-- 设置title group index
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:setTitleGroupIndex(index)
	self.m_titleGroupIndex = index
	
	self:initTitleGroupCards()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:onEnter()   

	self.m_meinvxuanze_title_table = createmeinvxuanze_title()
	local meinvPanel = self.m_meinvxuanze_title_table["meinvxuanze_title"]
    self:appendComponent(meinvPanel)
    meinvPanel:setAnchorPoint(cc.p(0,1))
    meinvPanel:setPositionInContainer(cc.p(0,0))
    
    self.m_meinvxuanze_title_table["meinvxuanze_xiangqing_button"]:setVisible(false)
    self.m_meinvxuanze_title_table["mvxz_word_label"]:setString("皇上，想提拔哪位娘娘呢？")
    
    self.m_meinvxuanze_title_table["mnxz_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
    
    local closePanel = function()
    	self:deleteFromParent()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_meinvxuanze_title_table["mnxz_close_button"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	
	local btnYes = function()
    	self:promoteSure()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
	self.m_meinvxuanze_title_table["meinvxuanze_queding_button"]:addHandleOfcomponentEvent(btnYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.event_updateCefengInKunningong = function()
		self:deleteFromParent()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefengInKunningong)
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] initTitleGroupCards
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:initTitleGroupCards()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil

	g_game.g_userInfoManager:updatePromoteBeautyArr(self.m_titleGroupIndex)
	
	self.m_item_array = {}
	self.m_unpromote_data = {}
	
	local canbePromoteBeautyArr = g_game.g_userInfoManager:getPromoteBeautyArr()
	self.m_item_count = #canbePromoteBeautyArr
	if self.m_item_count == 0 then
		return
	end
	
	for i = 1, self.m_item_count do
		table.insert(self.m_unpromote_data,canbePromoteBeautyArr[i])
	end
	
	local sort = function(beauty1, beauty2)
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
	
	table.sort(self.m_unpromote_data, sort)
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(850,500))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(50,50))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 2, 35, 169,250)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:loadPageData(pageIndex)	
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
		if #self.m_unpromote_data >= i then
			local beautyCard = f_game_beauty_uncheer_card.static_create()
			beautyCard:panelInitBeforePopup()
			beautyCard:setSize(cc.size(169,250))
			self.m_page_container:addComponentToPage(beautyCard, pageIndex)
			
			beautyCard:setBeautyIndex(i)
			beautyCard:setData(self.m_unpromote_data[i])
			
			beautyCard:setBeautyClickCallback(beautyClickCallback)
			beautyCard:setRemoveCallback(removeItem)
			
			--默认都不显示
			if i == 1 then
				self.m_selectBeauty = beautyCard
				beautyCard.m_componentTable["mvxz_guangquan_image"]:setVisible(true)
			else
				beautyCard.m_componentTable["mvxz_guangquan_image"]:setVisible(false)
			end
			
			table.insert(self.m_item_array, beautyCard)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] removeItem
-- 删除美女
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:removeItem(beauty)	
	local index = beauty:getBeautyIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getBeautyIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] selectBeautyEvent
-- 选择美女回调
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:selectBeautyEvent(beauty)
	self.m_selectBeauty = beauty
	local index = beauty:getBeautyIndex()
	
	for i = 1,#self.m_item_array do
		if  index == self.m_item_array[i]:getBeautyIndex() then
			self.m_item_array[i].m_componentTable["mvxz_guangquan_image"]:setVisible(true)
		else
			self.m_item_array[i].m_componentTable["mvxz_guangquan_image"]:setVisible(false)
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] promoteSure
-- 确定册封
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:promoteSure()
	local data = self.m_selectBeauty:getData()
	
	local titleQinmidu = g_game.g_dictConfigManager:getTitleQinmidu(self.m_titleGroupIndex)
	
	if data["beautyIntimacy"] < titleQinmidu then
	    g_game.g_utilManager:showMsg("娘娘的亲密度不足")
	else
	
		local getCostSilver = g_game.g_dictConfigManager:getTitleCostSilver(self.m_titleGroupIndex)
		local getCostQinmidu = g_game.g_dictConfigManager:getTitleQinmidu(self.m_titleGroupIndex)
		
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		userInfo["silver"] = userInfo["silver"] - getCostSilver
		
		data["beautyTitle"] = self.m_titleGroupIndex
	
		g_game.g_userInfoManager:requestPromoteBeauty(data["id"],data["beautyId"],self.m_titleGroupIndex)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] getPromoteBeauty
-- 获得册封的美女
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:getPromoteBeauty()
	return self.m_selectBeauty
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_promote_beauty] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_game_beauty_kng_promote_beauty:deleteFromParent()
	g_game.g_panelManager:removeUiPanel("meinv_promote_ui")
end

function f_game_beauty_kng_promote_beauty:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefengInKunningong)
	
end

function f_game_beauty_kng_promote_beauty:onEnterTransitionFinish()
end

function f_game_beauty_kng_promote_beauty:onExitTransitionStart()
end

function f_game_beauty_kng_promote_beauty:onCleanup()
end


function f_game_beauty_kng_promote_beauty:registerNodeEvent(handler)
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

function f_game_beauty_kng_promote_beauty:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_game_beauty_kng_promote_beauty