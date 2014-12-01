require("scripts.auto.auto_lianhuaPanel")
require("scripts.auto.auto_lianhuaItem")
require("scripts.game.main.lianhua.f_lianhuaSelectPanel")
--[[--
邮件面板
--]]--

f_lianhua_panel = class("f_lianhua_panel")
f_lianhua_panel.__index = f_lianhua_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_lianhua_panel.static_create()
	local mailTable = createlianhuaPanel()
	local mail = mailTable["lianhuaPanel"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_lianhua_panel)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_lianhua_panel:panelInitBeforePopup()

	self.m_page = 1;
	self.m_radioBtns = {self.m_componentTable["mingchengbtn"], self.m_componentTable["meimvbtn"], self.m_componentTable["zhuangbeibtn"]}
	
	self:registerNodeEvent()
	self.m_selectedItems = {{}, {}, {}}
	self.m_items = {}
	self.m_rewards = {}
	self.m_dataList = {{}, {}, {}}
	self.m_rewardDatas = {{}, {}, {}}
	
	self.m_baoyinAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_baoyinAnim:setup(self.m_componentTable["num"], 21, "%d", false, false)
	self:appendComponent(self.m_baoyinAnim)
	local p = self.m_componentTable["num"]:getPositionInContainer()
	self.m_baoyinAnim:setPositionInContainer(p)
	self.m_baoyinAnim:setLastValue(g_game.g_userInfoManager.m_baoyin)
	
	self.m_animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.m_animation)	
	local btn = self.m_componentTable["jitianBtn"]
	local p = btn:getPositionInContainer()
	p.y = p.y + 9
	self.m_animation:setSize(btn:getSize())
	self.m_animation:setAnchorPoint(cc.p(0.5,0.5))
	self.m_animation:setPositionInContainer(p)	
	self.m_animation:setLoop(false)	
	self.m_animation:setAnimationScale(1)
	self.m_animation:setAnimationSpeedScale(0.3)
	self.m_animation:setVisible(true)
		
	local click = function()
		local panel = f_lianhuaSelectPanel.static_create()
	    panel:panelInitBeforePopup(self.m_dataList[self.m_page], self.m_selectedItems[self.m_page], self.m_page)
	    g_game.g_panelManager:showUiPanel(panel,"lianhua_select")	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	for i = 1, 8 do
		local itemT = createlianhuaItem()
		local item = itemT["lianhuaItem"]
		item:setSize(cc.size(94,125))
		item:setScale(0.8)
	    item:setAnchorPoint(cc.p(0.5,0.5))
	    self:appendComponent(item)
	    item:setPositionInContainer(self.m_componentTable["pos" .. i]:getPositionInContainer())
	   	table.insert(self.m_items, itemT)
	   	itemT["level"]:setAlignment(2)
	   	item:addHandleOfcomponentEvent(click,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	end
	
	for i = 1, 6 do
		local itemT = createlianhuaItem()
		local item = itemT["lianhuaItem"]
		item:setSize(cc.size(94,125))
	    item:setAnchorPoint(cc.p(0.5,0.5))
	    self:appendComponent(item)
	    item:setPositionInContainer(self.m_componentTable["rp" .. i]:getPositionInContainer())
	   	table.insert(self.m_rewards, itemT)
	   	itemT["levelbg"]:setVisible(false)
	   	item:setVisible(false)
	   	itemT["level"]:setAlignment(2)
	end

	self:changePage(self.m_page)
	
	local clickMinchen = function()
		if self.m_page ~= 1 then
			self:changePage(1)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
		end
		self.m_radioBtns[1]:setRadioButtonState(1)
	end
	self.m_componentTable["mingchengbtn"]:addHandleOfcomponentEvent(clickMinchen,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickMeinv = function()
		if self.m_page ~= 2 then
			self:changePage(2)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
		end
		self.m_radioBtns[2]:setRadioButtonState(1)
	end
	self.m_componentTable["meimvbtn"]:addHandleOfcomponentEvent(clickMeinv,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickEquip = function()
		if self.m_page ~= 3 then
			self:changePage(3)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
		end
		self.m_radioBtns[3]:setRadioButtonState(1)
	end
	self.m_componentTable["zhuangbeibtn"]:addHandleOfcomponentEvent(clickEquip,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local quickSet = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self.m_selectedItems[self.m_page] = {}
		for i = 1, #self.m_dataList[self.m_page] do
			if #self.m_selectedItems[self.m_page] >= 8 then
				break
			end
			table.insert(self.m_selectedItems[self.m_page], self.m_dataList[self.m_page][i])
		end
		if #self.m_selectedItems[self.m_page] <= 0 then
			g_game.g_utilManager:showMsg("您当前没有合适的卡牌")	
			return
		end
		self:computeReward()
		self:refresh()
	end
	self.m_componentTable["btnYijian"]:addHandleOfcomponentEvent(quickSet,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local reset = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self.m_selectedItems[self.m_page] = {}
		self:computeReward()
		self:refresh()
	end
	self.m_componentTable["btnChongzhi"]:addHandleOfcomponentEvent(reset,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local close = function()
		g_game.g_panelManager:removeUiPanel("lianhua_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local shop = function()
		g_game.g_userInfoManager:requestLianHuaShop(false)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local jitian = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if #self.m_selectedItems[self.m_page] <= 0 then
			g_game.g_utilManager:showMsg("请选择卡牌")	
			return
		end
		local t = {}
		for i = 1, #self.m_selectedItems[self.m_page] do
			local data = self.m_selectedItems[self.m_page][i]
			if self.m_page == 1 then
				table.insert(t, {["primaryId"] = data["id"]})
			elseif self.m_page == 2 then
				table.insert(t, {["primaryId"] = data["id"]})
			elseif self.m_page == 3 then
				table.insert(t, {["primaryId"] = data["primaryId"]})
			end
		end
		g_game.g_userInfoManager:requestLianhua(t, self.m_page)
	end
	self.m_componentTable["jitianBtn"]:addHandleOfcomponentEvent(jitian,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	self.m_finish = function()
		local onFinish = function()
			self:refresh()
			self.m_componentTable["jitianBtn"]:setVisible(true)
			for i = 1, #self.m_items do
				self.m_items[i]["lianhuaItem"]:setVisible(true)
			end
			require("scripts.game.main.mail.f_mail_attachment")
			local mail = f_mail_attachment.static_create()
			mail:panelInitBeforePopup(self.m_showRewards)
			g_game.g_panelManager:showUiPanel(mail, "mail_attachment")
		end 
		self.m_animation:registeAnimationFinishCallback(onFinish)
		self:getData()
		self.m_selectedItems[self.m_page] = {}
		self:computeReward()
		self.m_animation:runAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[2], g_game.g_f_main_ui_effect.UI_SHENG_ZHI[4])
		self.m_componentTable["jitianBtn"]:setVisible(false)
		for i = 1, #self.m_items do
			self.m_items[i]["lianhuaItem"]:setVisible(false)
		end
		
		local panel = g_game.g_panelManager:getUiPanel("lianhua_shop")
		if panel ~= nil then
			panel:setBaoyin()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_FINISH_JITIAN, self.m_finish)
end

function f_lianhua_panel:setReward(reward)
	self.m_showRewards = reward
end

function f_lianhua_panel:getData()
	if self.m_page == 1 then
		self.m_dataList[self.m_page] = g_game.g_userInfoManager:getLianhuaMingchen()
	elseif self.m_page == 2 then
		self.m_dataList[self.m_page] = g_game.g_userInfoManager:getLianhuaMeinv()
	elseif self.m_page == 3 then
		self.m_dataList[self.m_page] = g_game.g_userInfoManager:getLianhuaEquip()
	end
end

function f_lianhua_panel:computeReward()
	local t = {}
	local baozhu = 0
	local coin = 0
	local item = 0
	for i = 1, #self.m_selectedItems[self.m_page] do
		local level = 0
		local star = 0
		local adv = 0
		local data = self.m_selectedItems[self.m_page][i]
		if self.m_page == 1 then
			level = data["officerLevel"]
			star = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
			adv = data["advanced"]
		elseif self.m_page == 2 then
			level = data["beautyLevel"]
			star = g_game.g_dictConfigManager:getBeautyQuality(data["beautyId"])
			adv = data["beautyTitle"]
		elseif self.m_page == 3 then
			level = data["equip_level"]
			star = g_game.g_dictConfigManager:getEquipStar(data["equip_id"])
		end
		coin = coin + g_game.g_dictConfigManager:getLianhuaCard(star, level, self.m_page)
		baozhu = baozhu + g_game.g_dictConfigManager:getLianhuaBaozhu(star, self.m_page) * math.max(1, g_game.g_dictConfigManager:getLianhuaAdvTimes(adv, self.m_page))
		item = item + g_game.g_dictConfigManager:getLianhuaItem(star, adv, self.m_page)
	end
	if baozhu > 0 then
		table.insert(t, {["type"] = 14, ["num"] = baozhu, ["id"] = 0})
	end
	if coin > 0 then
		if self.m_page == 3 then
			table.insert(t, {["type"] = 5, ["num"] = coin, ["id"] = 0})
		elseif self.m_page == 1 then
			table.insert(t, {["type"] = 3, ["num"] = coin, ["id"] = 3045})
		elseif self.m_page == 2 then
			table.insert(t, {["type"] = 2, ["num"] = coin, ["id"] = 3025})
		end
	end
	if item > 0 then
		if self.m_page == 1 then
			table.insert(t, {["type"] = 1, ["num"] = item, ["id"] = 21})
		elseif self.m_page == 2 then
			table.insert(t, {["type"] = 1, ["num"] = item, ["id"] = 40})
		end
	end
	self.m_rewardDatas[self.m_page] = t
end

function f_lianhua_panel:setSelects(datas)
	self.m_selectedItems[self.m_page] = datas
	self:computeReward()
end

function f_lianhua_panel:changePage(page)
	self.m_page = page
	self:getData()
	self:refresh()
end

function f_lianhua_panel:refresh()
	self.m_componentTable["num"]:setString(g_game.g_userInfoManager.m_baoyin .. "")
	self.m_baoyinAnim:playWhenLarger(g_game.g_userInfoManager.m_baoyin, 0.8)
	for i = 1, #self.m_radioBtns do
		if i == self.m_page then
			self.m_radioBtns[i]:setRadioButtonState(1)
		else
			self.m_radioBtns[i]:setRadioButtonState(2)
		end
	end

	local t = self.m_selectedItems[self.m_page]
	for i = 1, 8 do
		local itemT = self.m_items[i]
		if t[i] == nil then
			itemT["image"]:setVisible(false)
		   	itemT["name"]:setVisible(false)
		   	itemT["level"]:setVisible(false)
		   	itemT["frame"]:setImage(g_game.g_f_quality_image[1])
			itemT["frame"]:setSize(cc.size(90, 90))
		else
			itemT["image"]:setVisible(true)
		   	itemT["name"]:setVisible(true)
		   	itemT["level"]:setVisible(true)
		   	local type = 1
		   	local id = 0
		   	if self.m_page == 1 then
		   		itemT["level"]:setString(t[i]["officerLevel"])
		   		type = 3
		   		id = t[i]["officerId"]
		   	elseif self.m_page == 2 then
		   		itemT["level"]:setString(t[i]["beautyLevel"])
		   		type = 2
		   		id = t[i]["beautyId"]
		   	elseif self.m_page == 3 then
		   		itemT["level"]:setString(t[i]["equip_level"])
		   		type = 6
		   		id = t[i]["equip_id"]
		   	end
		   	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
		   	itemT["image"]:setImage(imagePath)

			itemT["image"]:setExtensionsTextureRect(cc.rect(5,5,75,75))
			itemT["image"]:setSize(cc.size(75, 75))
			itemT["name"]:setString(name)
			itemT["frame"]:setImage(g_game.g_f_quality_image[q])
			itemT["frame"]:setSize(cc.size(90, 90))
		end
	end
	t = self.m_rewardDatas[self.m_page]
	for i = 1, 6 do
		local itemT = self.m_rewards[i]
		if t[i] == nil then
			itemT["lianhuaItem"]:setVisible(false)
		else
			itemT["lianhuaItem"]:setVisible(true)
			local imagePath, q, name = g_game.g_dictConfigManager:getResByType(t[i]["type"], t[i]["id"])
			itemT["image"]:setImage(imagePath)

			itemT["image"]:setExtensionsTextureRect(cc.rect(5,5,75,75))
			itemT["image"]:setSize(cc.size(75, 75))
			itemT["name"]:setString(name)
			itemT["frame"]:setImage(g_game.g_f_quality_image[q])
			itemT["frame"]:setSize(cc.size(90, 90))
			itemT["level"]:setString("" .. t[i]["num"])
		end
	end
end

function f_lianhua_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_lianhua_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lianhua_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] onEnter
-------------------------------------------------------------------------------
function f_lianhua_panel:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[1])
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] onExit
-------------------------------------------------------------------------------
function f_lianhua_panel:onExit()
	self:deleteComponent(self.m_animation)
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[1])
	
	self:unregisterNodeEvent()
	self:deleteComponent(self.m_animation)
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[1])
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_FINISH_JITIAN, self.m_finish)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_lianhua_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_lianhua_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] onCleanup
-------------------------------------------------------------------------------
function f_lianhua_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lianhua_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lianhua_panel:initAllComponent()

end