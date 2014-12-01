require("scripts.auto.auto_user_item_card")
--[[--
显示章节 界面
--]]--
f_game_item = class("f_game_item")
f_game_item.__index = f_game_item

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_item.static_create()
	local user_itemTable = createuser_item_card()
	local user_itemPanel = user_itemTable["user_item_card"]

	local funTable = {}
	tolua.setpeer(user_itemPanel, funTable)
	setmetatable(funTable, f_game_item)

	user_itemPanel.m_componentTable = user_itemTable

	return user_itemPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_item:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_isSelect = false
	self.m_isClick = false
	
	self.m_index = 0
	self.m_data = 0
	self.m_clickCallback = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_item:registerNodeEvent(handler)
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
-- @function [parent=#f_game_item] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_item:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] onEnter
-------------------------------------------------------------------------------
function f_game_item:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] onExit
-------------------------------------------------------------------------------
function f_game_item:onExit()
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self)
	end 
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setIndex
-------------------------------------------------------------------------------
function f_game_item:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] getIndex
-------------------------------------------------------------------------------
function f_game_item:getIndex(index)
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setClickCallback
-------------------------------------------------------------------------------
function f_game_item:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setClickCallback
-------------------------------------------------------------------------------
function f_game_item:setData(data, type)
	self.m_data =  data
	
	if type == 3 then
		self:setItemData(data) 
	else
		self:setEquipData(data)
	end

	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setItemData
-------------------------------------------------------------------------------
function f_game_item:setItemData(data)
	local itemId = self.m_data["propId"]
	local itemName = g_game.g_dictConfigManager:getItemName(itemId)
	self.m_componentTable["item_name"]:setString(itemName)
	
	local itemResName = g_game.g_dictConfigManager:getItemResName(itemId)
	local itemImage = g_game.g_resourceManager:getItemImage(itemResName)
	self.m_componentTable["item"]:setImage(itemImage)
	self.m_componentTable["item"]:setSize(cc.size(90,90))
	
	local itemDes = g_game.g_dictConfigManager:getItemDes(itemId)
--	self.m_componentTable["des_label"]:setAlignment(0)
	self.m_componentTable["des_label"]:setString(itemDes)
	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["num_label"]:setString("擁有數量："..self.m_data["propNum"])
	else
		self.m_componentTable["num_label"]:setString("拥有数量："..self.m_data["propNum"])
	end
	
	
	self.m_componentTable["des_label"]:setVisible(true)
	self.m_componentTable["level_label"]:setVisible(false)
	self.m_componentTable["star_label"]:setVisible(false)
	self.m_componentTable["yinliang_label"]:setVisible(false)
	for i = 1, 5 do
		self.m_componentTable["star" .. i]:setVisible(false)
	end
	
	self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getItemQuality(itemId)])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setEquipData
-------------------------------------------------------------------------------
function f_game_item:setEquipData(data)
	local itemId = self.m_data["equip_id"]
	local itemName = g_game.g_dictConfigManager:getEquipName(itemId)
	self.m_componentTable["item_name"]:setString(itemName)
	
	local itemResName = g_game.g_dictConfigManager:getEquipImage(itemId)
	local itemImage = g_game.g_resourceManager:getItemImage(itemResName)
	self.m_componentTable["item"]:setImage(itemImage)
	self.m_componentTable["item"]:setSize(cc.size(90,90))
	local fun = function()
	end
	if self.m_data["status"] == 0 then
		self.m_componentTable["num_label"]:setString("")	
	else
		local officer = g_game.g_userInfoManager:getEquipmentBelong(self.m_data["position"], self.m_data["battle"])
		local color = "[0,113,48]"
		local config = g_game.g_dictConfigManager:getEquipById(itemId)
		for i = 1,3 do
			if officer["officerId"] == config[9 + i] then
				color = "[180,0,255]"
				break
			end
		end
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[111,70,20]裝備於: \n" .. color .. g_game.g_dictConfigManager:getCardName(officer["officerId"]), cc.c3b(0,0,0)), fun)
		else
			self.m_componentTable["num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[111,70,20]装备于: \n" .. color .. g_game.g_dictConfigManager:getCardName(officer["officerId"]), cc.c3b(0,0,0)), fun)
		end
	end
	
	self.m_componentTable["des_label"]:setVisible(false)
	self.m_componentTable["level_label"]:setVisible(true)
	self.m_componentTable["star_label"]:setVisible(true)
	self.m_componentTable["yinliang_label"]:setVisible(true)
	
	local star = g_game.g_dictConfigManager:getEquipStar(itemId)
	for i = 1, 5 do
		self.m_componentTable["star" .. i]:setVisible(true)
		if star >= i then
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing.png")
		else
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing_dark.png")
		end
	end

	self.m_componentTable["level_label"]:setAlignment(0)
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["level_label"]:setString("\n等級: ".. data["equip_level"])
	else
		self.m_componentTable["level_label"]:setString("\n等级: ".. data["equip_level"])
	end
	
	
	self.m_componentTable["star_label"]:setAlignment(0)
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["star_label"]:setString("星級:")
	else
		self.m_componentTable["star_label"]:setString("星级:")
	end
	
	
	self.m_componentTable["yinliang_label"]:setAlignment(0)
	if g_game.g_dictConfigManager:isEuqipmentBingfa(self.m_data["equip_id"]) then
		local str = ""
		local att = g_game.g_dictConfigManager:getWeaponAddition(self.m_data["equip_id"], data["equip_level"])
		local def = g_game.g_dictConfigManager:getArmorAddition(self.m_data["equip_id"], data["equip_level"])
		if att > 0 then
			if LANGUAGE_TYPE == 3 then
				str = str .. string.format("攻擊: +%.1f", att) .. "%"
			else	
				str = str .. string.format("攻击: +%.1f", att) .. "%"
			end
			
			if def > 0 then
				str = str .. "\n"
			end
		end
		if def > 0 then
			if LANGUAGE_TYPE == 3 then
				str = str .. string.format("防禦: +%.1f", def) .. "%"
			else
				str = str .. string.format("防御: +%.1f", def) .. "%"
			end
			
		end
		self.m_componentTable["yinliang_label"]:setString(str)
	elseif g_game.g_dictConfigManager:isEuqipmentWeapon(self.m_data["equip_id"]) then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["yinliang_label"]:setString("攻擊   :+".. math.floor(g_game.g_dictConfigManager:getWeaponAddition(self.m_data["equip_id"], data["equip_level"])))
		else
			self.m_componentTable["yinliang_label"]:setString("攻击   :+".. math.floor(g_game.g_dictConfigManager:getWeaponAddition(self.m_data["equip_id"], data["equip_level"])))
		end
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["yinliang_label"]:setString("防禦   :+".. math.floor(g_game.g_dictConfigManager:getArmorAddition(self.m_data["equip_id"], data["equip_level"])))
		else
			self.m_componentTable["yinliang_label"]:setString("防御   :+".. math.floor(g_game.g_dictConfigManager:getArmorAddition(self.m_data["equip_id"], data["equip_level"])))
		end
	end
	self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[star])
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setClickCallback
-------------------------------------------------------------------------------
function f_game_item:setClickCallback(callback)
	self.m_clickCallback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] setClickCallback
-------------------------------------------------------------------------------
function f_game_item:setRemoveCallback(callback)
	self.m_remove_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_item:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_item:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] onCleanup
-------------------------------------------------------------------------------
function f_game_item:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_item:initAllComponent()
	local downCallback = function()
		self.m_isClick = true
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )

	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE )

	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE )
	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER )
	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT )
	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE )


	local downCallback = function()
		if self.m_isClick == true then
			self:setSelect(true)
			self.m_isClick = false
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_item:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		self.m_clickCallback(self)
	end
end



