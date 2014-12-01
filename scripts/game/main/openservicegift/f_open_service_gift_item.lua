--[[--
开服有礼
--]]--

require("scripts.auto.auto_open_service_gift_item")

f_open_service_gift_item = class("f_open_service_gift_item")
f_open_service_gift_item.__index = f_open_service_gift_item

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_open_service_gift_item.static_create()
	local mainPanelTable = createopen_service_gift_item()
	local mainPanel = mainPanelTable["open_service_gift_item"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_open_service_gift_item)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_open_service_gift_item:initAllComponent()
	self.m_rewardInfo = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_open_service_gift_item:setData(rewardInfo)
	local cpTable = self.m_componentTable
	self.m_rewardInfo = rewardInfo
	
	cpTable["oi_count_lbl"]:setString(self.m_rewardInfo["num"]) -- 个数
	
	local type = self.m_rewardInfo["type"]
	local id = self.m_rewardInfo["gid"]
	
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
	
	cpTable["oi_name_lbl"]:setString(name)
	if imagePath ~= nil then
		cpTable["oi_item_image"]:setImage(imagePath)
		cpTable["oi_item_image"]:setExtensionsTextureRect(cc.rect(0, 0, 90, 90))
		cpTable["oi_item_image"]:setSize(cc.rect(0, 0, 70, 70))
	end
	cpTable["oi_item_bg"]:setImage(g_game.g_f_quality_image[q])
	cpTable["oi_item_bg"]:setSize(cc.rect(0, 0, 80, 80))
	
	-- 点击响应
	local press = function()
		if type == 2 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			if g_game.g_panelManager:isUiPanelShow("meinvshuxing_title") == false then
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
				require("scripts.game.main.beauty.f_game_beauty_card_detail")
				local detailPanel = f_game_beauty_card_detail.static_create()
				detailPanel:panelInitBeforePopup()
				detailPanel:setStopTouchEvent(true)
				g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
				local beauty = require("scripts.game.main.suipian.f_fake_beauty").new()
				beauty:setData(id)
				detailPanel:setDetail(beauty)
			end
		elseif type == 3 then
			if g_game.g_panelManager:isUiPanelShow("mingchen_xiangqing") == false then
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
				require("scripts.game.main.card.f_card_mingchen_detail")
				local detailPanel = f_card_mingchen_detail.static_create()
				detailPanel:panelInitBeforePopup()
				local data = g_game.g_utilManager:fakeMingChenData(id)
				detailPanel:setDetail(data)
				g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")
			end
		elseif type == 6 then
			if g_game.g_panelManager:isUiPanelShow("equip_detial_panel") == false then
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
				require("scripts.game.main.equipBag.f_equipDetial_panel")
				local panel = f_equipDetial_panel.static_create()
				local data = g_game.g_utilManager:fakeEquipment(id)
				panel:panelInitBeforePopup(data, false)
				g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
			end
		end
	end
	self:addHandleOfcomponentEvent(press, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 是否需要显示特效
	if self.m_rewardInfo["effect"] == 1 then
		self:showEffect()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_open_service_gift_item] showEffect
-------------------------------------------------------------------------------
function f_open_service_gift_item:showEffect()
	local effectAni = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(effectAni)
	effectAni:setAnchorPoint(cc.p(0.5,0.5))
    effectAni:setPositionInContainer(cc.p(49,42))
	effectAni:setLoop(true)
	effectAni:setAnimationScale(1.0)
	effectAni:runAnimation(g_game.g_f_main_ui_effect.UI_KUANG1[1], g_game.g_f_main_ui_effect.UI_KUANG1[3])
end
