require("scripts.auto.auto_tujian_card")

f_tujian_card = class("f_tujian_card")
f_tujian_card.__index = f_tujian_card

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_card] static_create
-------------------------------------------------------------------------------
function f_tujian_card.static_create()
	local infoTable = createtujian_card()
	local panel = infoTable["tujian_card"]
	
	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_tujian_card)
	panel.m_componentTable = infoTable
	panel:initAllComponent()
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_tujian_card:initAllComponent()
	local press = function()
		if not self.m_isClick then
			return
		end	
   		
		self.m_isClick = false
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_type == 1 then
			if g_game.g_panelManager:isUiPanelShow("mingchen_xiangqing") == false then
				require("scripts.game.main.card.f_card_mingchen_detail")
				local detailPanel = f_card_mingchen_detail.static_create()
				detailPanel:panelInitBeforePopup()
				local data = g_game.g_utilManager:fakeMingChenData(self.m_id)
				detailPanel:setDetail(data)
				g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")
			end
		elseif self.m_type == 2 then
			if g_game.g_panelManager:isUiPanelShow("meinvshuxing_title") == false then
				require("scripts.game.main.beauty.f_game_beauty_card_detail")
				local detailPanel = f_game_beauty_card_detail.static_create()
				detailPanel:panelInitBeforePopup()
				detailPanel:setStopTouchEvent(true)
				g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
				local beauty = require("scripts.game.main.suipian.f_fake_beauty").new()
				beauty:setData(self.m_id)
				detailPanel:setDetail(beauty)
			end
		elseif self.m_type == 3 then
			if g_game.g_panelManager:isUiPanelShow("equip_detial_panel") == false then
				require("scripts.game.main.equipBag.f_equipDetial_panel")
				local panel = f_equipDetial_panel.static_create()
				local data = g_game.g_utilManager:fakeEquipment(self.m_id)
				panel:panelInitBeforePopup(data, false)
				g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
			end
		elseif self.m_type == 4 then
			if g_game.g_panelManager:isUiPanelShow("equip_detial_panel") == false then
				require("scripts.game.main.equipBag.f_equipDetial_panel")
				local panel = f_equipDetial_panel.static_create()
				local data = g_game.g_utilManager:fakeEquipment(self.m_id)
				panel:panelInitBeforePopup(data, false)
				g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
			end
		end
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(press, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local downCallback = function()	
		self.m_isClick = true
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )
	local downCallback = function()		
		self.m_isClick = false
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE )

end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_card] initAllComponent
-- type 1名臣 2  美女  3 装备 4兵法
-------------------------------------------------------------------------------
function f_tujian_card:setIdAndType(id, type)
	self.m_id = id
	self.m_type = type
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_card] setCardBg
-------------------------------------------------------------------------------
function f_tujian_card:setCardBg(imagePath)
	self.m_componentTable["tjc_item_bg"]:setImage(imagePath)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_card] setCardImage
-------------------------------------------------------------------------------
function f_tujian_card:setCardImage(imagePath, isGrey)
	self.m_componentTable["tjc_item_image"]:setImage(imagePath)
	self.m_componentTable["tjc_item_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	if isGrey == true then
		self.m_componentTable["tjc_item_image"]:setImageType(2)
	else
		self.m_componentTable["tjc_item_image"]:setImageType(1)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_tujian_card] setCardName
-------------------------------------------------------------------------------
function f_tujian_card:setCardName(name)
	self.m_componentTable["tjc_name_lbl"]:setString(name)
end
