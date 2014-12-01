require("scripts.auto.auto_equipDetial")
--[[--
     装备详情界面
--]]--
f_equipDetial_panel = class("f_equipDetial_panel")
f_equipDetial_panel.__index = f_equipDetial_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_equipDetial_panel.static_create()
	local userEquip_table = createequipDetial()
	local userEquip_panel = userEquip_table["equipDetial"]
	
	local funTable = {}
	tolua.setpeer(userEquip_panel, funTable)
	setmetatable(funTable, f_equipDetial_panel)
	
	userEquip_panel.m_componentTable = userEquip_table
	   
	return userEquip_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_equipDetial_panel:panelInitBeforePopup(data, hasButton)
	self.m_data = data
	self.m_hasButton = hasButton
	
	self:registerNodeEvent()	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_equipDetial_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_equipDetial_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_equipDetial_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] onEnter
-------------------------------------------------------------------------------
function f_equipDetial_panel:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[1])
	
	self.m_lastAnimLevel = self.m_data["equip_level"]
	self.m_lastID = self.m_data["primaryId"]
	self.m_lastValue = 0
	self:setStopTouchEvent(true)
	self.m_shouldUpdate = false
	self.m_autoUpgrade = false
	self.m_needSetDisplay = false
	self.refresh = function()
		if self.m_type ~= 3 then
			self.m_data = g_game.g_userInfoManager.m_changedNewEquip
			local upgrade = false
			if self.m_data == nil then
				self.m_data = g_game.g_userInfoManager.m_upgradeEquip
				upgrade = true
			end
			if self.m_data == nil then
				g_game.g_panelManager:removeUiPanel("equip_detial_panel")
			else
				if upgrade then
--					if not g_game.g_panelManager:isUiPanelShow("effect_popup") then
--						g_game.g_panelManager:showUpgradeEffect(3 + self.m_data["equip_level"] - self.m_lastLevel)
--					else
--						self.m_shouldUpdate = true
--					end
					g_game.g_panelManager:showUpgradeEffect(3 + self.m_data["equip_level"] - self.m_lastLevel, self.m_imagePath, self.m_equipQ)
					self.m_hasReceive = true
				end
			
				self.m_needSetDisplay = true
			end
			g_game.g_userInfoManager.m_changedNewEquip = nil
			g_game.g_userInfoManager.m_upgradeEquip = nil
		else
			if g_game.g_userInfoManager.m_changedNewEquip ~= nil then
				self.m_data = g_game.g_userInfoManager.m_changedNewEquip
			end
			self:setDisplay()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP, self.refresh)
	
	self.m_onStop = function()
		self.m_autoUpgrade = false
	end 
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_STOP_UPDATE_EQUIP, self.m_onStop)
	
	g_game.g_gameManager:addUpdateObj(self)
	self:initAllComponent()
	
end

function f_equipDetial_panel:update()
--	if self.m_shouldUpdate and not g_game.g_panelManager:isUiPanelShow("effect_popup") then
--		self.m_shouldUpdate = false
--		g_game.g_panelManager:showUpgradeEffect(3 + self.m_data["equip_level"] - self.m_lastLevel)
--	end
	if self.m_needSetDisplay and not g_game.g_panelManager:isUiPanelShow("effect_popup") then
		self.m_needSetDisplay = false
	 	self:setDisplay()
	end
	if self.m_autoUpgrade and self.m_hasReceive and self.m_type ~= 3 and not g_game.g_panelManager:isUiPanelShow("effect_popup") then
		self:doUpdate()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] canUpgrade
-- 能否升级
-------------------------------------------------------------------------------
function f_equipDetial_panel:canUpgrade()
	return self.m_data["equip_level"] < self.m_maxLevel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] setDisplay
-- 设置data的显示
-------------------------------------------------------------------------------
function f_equipDetial_panel:setDisplay()
	local isBingfa = g_game.g_dictConfigManager:isEuqipmentBingfa(self.m_data["equip_id"])
	local config = g_game.g_dictConfigManager:getEquipById(self.m_data["equip_id"])
	local level = self.m_data["equip_level"]
	local att = g_game.g_dictConfigManager:getWeaponAddition(self.m_data["equip_id"], level)
	local def = g_game.g_dictConfigManager:getArmorAddition(self.m_data["equip_id"], level)
	local nextAtt = g_game.g_dictConfigManager:getWeaponAddition(self.m_data["equip_id"], level + 1)
	local nextDef = g_game.g_dictConfigManager:getArmorAddition(self.m_data["equip_id"], level + 1)
	
	self.m_componentTable["title"]:setVisible(not isBingfa)
	self.m_componentTable["bingfaTitle"]:setVisible(isBingfa)
	if isBingfa then
		self.m_componentTable["jieshaoLabel"]:setString("兵法介绍")
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["jieshaoLabel"]:setString("裝備介紹")		
		else
			self.m_componentTable["jieshaoLabel"]:setString("装备介绍")
		end
	end
		
	local value = 0
	if isBingfa then
		local str = ""
		if att > 0 then
			str = str .. string.format("攻击: +%.1f", att) .. "%"
			if def > 0 then
				str = str .. "   "
			end
		end
		if def > 0 then
			str = str .. string.format("防御: +%.1f", def) .. "%"
		end
		self.m_componentTable["zhuangBeiLabel"]:setString(str)
		self.m_componentTable["icon"]:setImage("batch_ui/IMG_0259.PNG")
		self.m_maxLevel = g_game.g_userInfoManager.m_user_info["level"]
		self.m_componentTable["yinliangLabel"]:setVisible(false)
		self.m_componentTable["yinliangIcon1"]:setVisible(false)
		self.m_componentTable["yinliangNumber"]:setVisible(false)
	else
		if config[6] == 1 then
			self.m_componentTable["icon"]:setImage("batch_ui/wuqi_zhuangbeixianqing.png")
			self.m_componentTable["zhuangBeiLabel"]:setString("攻击: +" .. math.floor(att))
			value = math.floor(att)
		else
			self.m_componentTable["icon"]:setImage("batch_ui/fangju_zhuangbeixianqing.png")
			self.m_componentTable["zhuangBeiLabel"]:setString("防御: +" .. math.floor(def))
			value = math.floor(def)
		end
		self.m_maxLevel = math.min(g_game.g_userInfoManager.m_user_info["level"] * 3, g_game.max_equip_level)
		self.m_componentTable["yinliangLabel"]:setVisible(true)
		self.m_componentTable["yinliangIcon1"]:setVisible(true)
		self.m_componentTable["yinliangNumber"]:setVisible(true)
	end
	
	self.m_componentTable["levelLabel"]:setString("等级: " .. level .. "/" .. self.m_maxLevel)
	if not isBingfa and self.m_lastID == self.m_data["primaryId"] and self.m_data["equip_level"] > self.m_lastAnimLevel then
		self.m_levelAnim:play(self.m_lastAnimLevel, self.m_data["equip_level"], 0.8)
		self.m_valueAnim:play(self.m_lastValue, value, 0.8)
	end
	self.m_lastAnimLevel = self.m_data["equip_level"]
	self.m_lastID = self.m_data["primaryId"]
	
	self.m_type = config[6]
	
	local textName = g_game.g_dictConfigManager:getLanTextById(config[2])
	self.m_componentTable["nameLabel"]:setString(textName)
	local frame = self.m_componentTable["frame"]
	if self.m_icon == nil then
		self.m_icon = fc.FExtensionsImage:create()
		self:appendComponent(self.m_icon)
	end
	local s = frame:getSize()
	local p = frame:getPositionInContainer()
	self.m_imagePath = g_game.g_resourceManager:getItemImage(config[13])
	self.m_icon:setImage(self.m_imagePath)
	self.m_icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
	self.m_icon:setSize(cc.size(s.width - 10, s.height - 10))
	self.m_icon:setAnchorPoint(cc.p(0.5,0.5))
	self.m_icon:setPositionInContainer(p)
	self.m_equipQ = config[3]
	frame:setImage(g_game.g_f_quality_image[config[3]])
	
	self.m_componentTable["totalYinliangLabel"]:setString(g_game.g_userInfoManager.m_user_info["silver"])
	
	for i = 1, 5 do
		if i <= config[3] then
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing.png")
		else
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing_dark.png")
		end
	end
	
	local desT = g_game.g_dictConfigManager:getLanTextById(config[9])
	self.m_componentTable["desLabel"]:setString(desT)
	self.m_componentTable["desLabel"]:setAlignment(0)
	if self.m_officers == nil then
		self.m_officers = {}
		for i = 1, 3 do
			self.m_officers[i] = fc.FExtensionsImage:create()
			self:appendComponent(self.m_officers[i])
		end
	end
	for i = 1, 3 do
		local officer = config[9 + i]
		officer =g_game.g_dictConfigManager:getOfficerCardData(officer)
		if officer == nil then
			self.m_componentTable["name" .. i]:setVisible(false)
			self.m_componentTable["officer" .. i]:setVisible(false)
			self.m_componentTable["line" .. (i * 2 - 1)]:setVisible(false)
			self.m_componentTable["line" .. (i * 2)]:setVisible(false)
			self.m_officers[i]:setVisible(false)
		else
			self.m_componentTable["name" .. i]:setVisible(true)
			self.m_officers[i]:setVisible(true)
			self.m_componentTable["officer" .. i]:setVisible(true)
			self.m_componentTable["line" .. (i * 2 - 1)]:setVisible(true)
			self.m_componentTable["line" .. (i * 2)]:setVisible(true)
			frame = self.m_componentTable["officer" .. i]
			s = frame:getSize()
			p = frame:getPositionInContainer()
			self.m_officers[i]:setImage(g_game.g_resourceManager:getCardHead(officer[2]))
			self.m_officers[i]:setExtensionsTextureRect(cc.rect(0,0,90,90))
			self.m_officers[i]:setSize(cc.size(s.width - 10, s.height - 10))
			self.m_officers[i]:setAnchorPoint(cc.p(0.5,0.5))
			self.m_officers[i]:setPositionInContainer(p)
			frame:setImage(g_game.g_f_quality_image[officer[5]])
			
			local textName = g_game.g_dictConfigManager:getLanTextById(officer[3])
			self.m_componentTable["name" .. i]:setString(textName)
		end
	end
	self.m_price = 0
	if level >= g_game.max_equip_level then
		self.m_componentTable["rightLevelLabel"]:setVisible(false)
		self.m_componentTable["rightZhuangBeiLabel"]:setVisible(false)
		self.m_componentTable["yinliangNumber"]:setString("0")
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["rightLevelLabel"]:setString("等級: " .. (level + 1) .. "/" .. self.m_maxLevel)
		else
			self.m_componentTable["rightLevelLabel"]:setString("等级: " .. (level + 1) .. "/" .. self.m_maxLevel)
		end
		if isBingfa then
			local str = ""
			if nextAtt > 0 then
				if LANGUAGE_TYPE == 3 then
					str = str .. string.format("攻擊: +%.1f", nextAtt) .. "%"
				else
					str = str .. string.format("攻击: +%.1f", nextAtt) .. "%"
				end
				if nextDef > 0 then
					str = str .. "   "
				end
			end
			if nextDef > 0 then
				if LANGUAGE_TYPE == 3 then
					str = str .. string.format("防禦: +%.1f", nextDef) .. "%"
				else
					str = str .. string.format("防御: +%.1f", nextDef) .. "%"
				end
			end
			self.m_componentTable["rightZhuangBeiLabel"]:setString(str)
		else
			if LANGUAGE_TYPE == 3 then
				if config[6] == 1 then
					self.m_componentTable["rightZhuangBeiLabel"]:setString("攻擊: +" .. math.floor(nextAtt))
				else
					self.m_componentTable["rightZhuangBeiLabel"]:setString("防禦: +" .. math.floor(nextDef))
				end
			else
				if config[6] == 1 then
					self.m_componentTable["rightZhuangBeiLabel"]:setString("攻击: +" .. math.floor(nextAtt))
				else
					self.m_componentTable["rightZhuangBeiLabel"]:setString("防御: +" .. math.floor(nextDef))
				end
			end
			
		end
		self.m_componentTable["rightLevelLabel"]:setVisible(true)
		self.m_componentTable["rightZhuangBeiLabel"]:setVisible(true)
		self.m_price = g_game.g_dictConfigManager:getEquipUpgradPrice(level, config[3])
		self.m_componentTable["yinliangNumber"]:setString(self.m_price)
	end
	self.m_componentTable["btnRemove"]:setVisible(self.m_hasButton)
	self.m_componentTable["btnChange"]:setVisible(self.m_hasButton)
	
	local hasButton = self.m_data["primaryId"] ~= 0
	self.m_componentTable["btnUpgrade"]:setVisible(hasButton and isBingfa)
	self.m_componentTable["btnUpgradel"]:setVisible(hasButton and not isBingfa)
	self.m_componentTable["btnUpgradeR"]:setVisible(hasButton and not isBingfa)
	if config[6] == 1 then
		self.m_lastValue = math.floor(att)
	else
		self.m_lastValue = math.floor(def)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] onExit
-------------------------------------------------------------------------------
function f_equipDetial_panel:onExit()  
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[1])
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
  	self:unregisterNodeEvent()
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP, self.refresh)
  	g_game.g_gameManager:removeUpdateObj(self) 
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_STOP_UPDATE_EQUIP, self.m_onStop)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_equipDetial_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_equipDetial_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] onCleanup
-------------------------------------------------------------------------------
function f_equipDetial_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_equipDetial_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_equipDetial_panel:initAllComponent()
	self:setDisplay()
	local close = function()
		if g_game.g_guidelinesManager:canBtnClick("equipDetailClose") then
			g_game.g_panelManager:removeUiPanel("equip_detial_panel")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_CLOSE_EQUEP_DETAIL)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local removeEquip = function()
		if self.m_type == 3 then
			g_game.g_userInfoManager:requestUnloadEquip(self.m_data, 1)
		else
			g_game.g_userInfoManager:requestUnloadEquip(self.m_data, 0)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnRemove"]:addHandleOfcomponentEvent(removeEquip,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local upgrade = function()
		if self.m_autoUpgrade then
			return
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIANGHUA)
		self.m_autoUpgrade = false
		self:doUpdate()
	end
	self.m_componentTable["btnUpgrade"]:addHandleOfcomponentEvent(upgrade,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["btnUpgradel"]:addHandleOfcomponentEvent(upgrade,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local upgradeAuto = function()
		self.m_autoUpgrade = true
		self:doUpdate()
	end
	self.m_componentTable["btnUpgradeR"]:addHandleOfcomponentEvent(upgradeAuto,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeEquip = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_userInfoManager.m_changeEquipData = self.m_data
		require("scripts.game.main.equipBag.f_game_equip_bag_panel")
		local equipPanel = f_game_equip_bag_panel.static_create()
		if self.m_type == 3 then
	   		equipPanel:panelInitBeforePopup(5, true)
	    else
	    	equipPanel:panelInitBeforePopup(self.m_type, true)
	    end
		g_game.g_panelManager:showUiPanel(equipPanel,"user_equip_bag_panel")
	end
	self.m_componentTable["btnChange"]:addHandleOfcomponentEvent(changeEquip,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_levelAnim = require("scripts.game.main.common.f_number_effect").new()
	if LANGUAGE_TYPE == 3 then
		self.m_levelAnim:setup(self.m_componentTable["levelLabel"], 21, "等級: %d/" .. self.m_maxLevel, true, false)
	else
		self.m_levelAnim:setup(self.m_componentTable["levelLabel"], 21, "等级: %d/" .. self.m_maxLevel, true, false)
	end
	self.m_componentTable["equipDetial"]:appendComponent(self.m_levelAnim)
	local p = self.m_componentTable["levelLabel"]:getPositionInContainer()
	p.x = p.x + 5
	self.m_levelAnim:setPositionInContainer(p)
	
	local config = g_game.g_dictConfigManager:getEquipById(self.m_data["equip_id"])
	self.m_valueAnim = require("scripts.game.main.common.f_number_effect").new()
	local str = ""
	if LANGUAGE_TYPE == 3 then
		if config[6] == 1 then
			str = "攻擊: +%d"
		else
			str = "防禦: +%d"
		end
	else
		if config[6] == 1 then
			str = "攻击: +%d"
		else
			str = "防御: +%d"
		end
	end
	
	self.m_valueAnim:setup(self.m_componentTable["zhuangBeiLabel"], 21, str, true, false)
	self.m_componentTable["equipDetial"]:appendComponent(self.m_valueAnim)
	p = self.m_componentTable["zhuangBeiLabel"]:getPositionInContainer()
	p.x = p.x + 20
	self.m_valueAnim:setPositionInContainer(p)
end

function f_equipDetial_panel:doUpdate()
	if g_game.g_panelManager:isUiPanelShow("effect_popup") then
		return
	end
	if self:canUpgrade() then
		if g_game.g_userInfoManager.m_user_info["silver"] >= self.m_price then
			if self.m_type == 3 then
				local panel = nil
				if g_game.g_panelManager:isUiPanelShow("bing_fa") then
					panel = g_game.g_panelManager:getUiPanel("bing_fa")
					g_game.g_panelManager:removeUiPanel("equip_detial_panel")
					panel:setCloseType(2)
				else
					require("scripts.game.main.bingfa.f_bingfa_panel")
					panel = f_bingfa_panel.static_create()
					panel:panelInitBeforePopup()
					g_game.g_panelManager:showUiPanel(panel, "bing_fa")
					panel:setCloseType(1)
				end
				panel:setPageAndBottom(1, self.m_data)
			else
				self.m_hasReceive = false
				g_game.g_userInfoManager:requestUpgradeEquip(self.m_data)
				self.m_lastLevel = self.m_data["equip_level"]
			end
		else
--			g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")	
			require("scripts.game.main.common.f_less_silver_tip_popup")
			local panel = f_less_silver_tip_popup.static_create()
			g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
			self.m_autoUpgrade = false
		end
	else
		if LANGUAGE_TYPE == 3 then
			if self.m_type == 3 then
				g_game.g_utilManager:showMsg("兵法等級不可超過皇帝等級")
			else
				g_game.g_utilManager:showMsg("裝備等級不可超過皇帝等級的三倍")
			end
		else
			if self.m_type == 3 then
				g_game.g_utilManager:showMsg("兵法等级不可超过皇帝等级")
			else
				g_game.g_utilManager:showMsg("装备等级不可超过皇帝等级的三倍")
			end
		end
		
		self.m_autoUpgrade = false
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_CLICK_UPDATE_BTN)
end