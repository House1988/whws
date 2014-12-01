require("scripts.auto.auto_user_equip_bag_panel")
--[[--
     装备界面
--]]--
f_game_equip_bag_panel = class("f_game_equip_bag_panel")
f_game_equip_bag_panel.__index = f_game_equip_bag_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_equip_bag_panel.static_create()
	local userEquip_table = createuser_equip_bag_panel()
	local userEquip_panel = userEquip_table["user_equip_bag_panel"]
	
	local funTable = {}
	tolua.setpeer(userEquip_panel, funTable)
	setmetatable(funTable, f_game_equip_bag_panel)
	
	userEquip_panel.m_componentTable = userEquip_table
	   
	return userEquip_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:panelInitBeforePopup(page, isSelect)
	self.m_weaponView = nil
	self.m_defenseView = nil
	self.m_itemView = nil
	self.m_bingfaView = nil
	
	self.m_btnIndex = 0
	
	self.m_isSelect = isSelect
	self.m_panelIndex = 3
	if self.m_isSelect then
		self.m_panelIndex = page
	end
	self.m_pageRadioBtnArr = {}
	
	self:registerNodeEvent()	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_equip_bag_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] onEnter
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:onEnter()
	self:setStopTouchEvent(true)
	
	self.m_pageRadioBtnArr[1] = self.m_componentTable["weapon_btn"] --武器
   	self.m_pageRadioBtnArr[2] = self.m_componentTable["defense_btn"] --防具
   	self.m_pageRadioBtnArr[3] = self.m_componentTable["item_btn"] --道具
   	self.m_pageRadioBtnArr[4] = self.m_componentTable["piece_btn"] --碎片
   	
   	for i = 1, 4 do
   		self.m_pageRadioBtnArr[i]:setVisible(not self.m_isSelect)
   	end
   	self.m_componentTable["wuqi_label"]:setVisible(not self.m_isSelect)
   	self.m_componentTable["fangju_label"]:setVisible(not self.m_isSelect)
   	self.m_componentTable["daoju_label"]:setVisible(not self.m_isSelect)
   	self.m_componentTable["suipian_label"]:setVisible(not self.m_isSelect)
   	
   	self.m_componentTable["title"]:setVisible(self.m_isSelect and self.m_panelIndex ~= 5)
   	self.m_componentTable["bingfa_title"]:setVisible(self.m_isSelect and self.m_panelIndex == 5)
   	--当前默认显示防具
	self.m_viewArr = {}
   	self:updatePagePanel()
	
	self:initAllComponent()

	self.m_refresh = function()
		if self.m_weaponView ~= nil then
			self:deleteComponent(self.m_weaponView)
			self.m_weaponView = nil
		end
		if self.m_defenseView ~= nil then
			self:deleteComponent(self.m_defenseView)
			self.m_defenseView = nil
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
	
	self.event_updatePveElite = function()
		g_game.g_panelManager:removeAllUiPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO)
		self:jumpToElite()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SUIPIAN_TO_ELITE, self.event_updatePveElite)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] jumpToElite
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:jumpToElite()
	local chapterPanel = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
	
	if chapterPanel then
		chapterPanel:updateLastEliteChapterFromServer()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] updatePagePanel
-- 更新每个切页 界面
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:updatePagePanel()
	-- 1 stand for radio btn bright ,2 stand for radio btn dark
	
	for i = 1, #self.m_pageRadioBtnArr do
		if self.m_panelIndex == i then
			self.m_pageRadioBtnArr[i]:setIsEnabled(true)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
		else
			self.m_pageRadioBtnArr[i]:setIsEnabled(false)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
		end
		if self.m_viewArr[i] ~= nil then
			self.m_viewArr[i]:setVisible(self.m_panelIndex == i)
		end
	end
	
	if self.m_btnIndex == self.m_panelIndex then
		return
	end
	self.m_btnIndex = self.m_panelIndex
	
	local panelType = 0
	local equipTable = {}
	local leftBtnCallback = nil
	local rightBtnCallback = nil
	if self.m_panelIndex == 1 then
		panelType = 10
		equipTable = g_game.g_userInfoManager:getWeaponList(true)
		
		leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		rightBtnCallback = function()
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
	elseif self.m_panelIndex == 2 then
		panelType = 10
		equipTable = g_game.g_userInfoManager:getArmorList(true)
		
		leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		rightBtnCallback = function()
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
	elseif self.m_panelIndex == 3 then
		panelType = 10
		local items = g_game.g_userInfoManager:getUserEquipData()
		equipTable = items["propList"]
		
		leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		rightBtnCallback = function()
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
	elseif self.m_panelIndex == 4 then
		panelType = 11
		equipTable = g_game.g_userInfoManager:getPieceList(3)
		
		leftBtnCallback = function()
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
		rightBtnCallback = function()
--			if g_game.OPEN_ELITE_LV > g_game.g_userInfoManager:getUserLv() then
--				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
--				g_game.g_utilManager:showMsg(g_game.OPEN_ELITE_LV .. "级开启。挑战精英BOSS，拿丰厚奖励！")
--			else
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
				g_game.g_userInfoManager:requestUserPveProgress()
--			end
		end
	elseif self.m_panelIndex == 5 then
		panelType = 12
		equipTable = g_game.g_userInfoManager:getBingfaList(true)
		
		leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		rightBtnCallback = function()
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
	end
	local popupPanel = nil
	if equipTable == nil or #equipTable <= 0 then
		popupPanel = f_jump_tip_popup.static_create()
		popupPanel:setPanelByType(panelType)
		popupPanel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(popupPanel, "jump_tip_popup")
	end
	
	
	if  self.m_panelIndex == 1  then
		if  self.m_weaponView == nil then
			 self.m_weaponView = require("scripts.game.main.equipBag.f_game_item_view").new()	
			 self.m_weaponView:setType(1, self.m_isSelect)
			 self.m_weaponView:setSize(cc.size(960, 578))	  
			 self:appendComponent(self.m_weaponView)
			 self.m_weaponView:setAnchorPoint(cc.p(0,1))
			 self.m_weaponView:setPositionInContainer(cc.p(0,62))
			 self.m_viewArr[1] = self.m_weaponView
		end
		
	elseif  self.m_panelIndex == 2  then
		if  self.m_defenseView == nil then
			 self.m_defenseView = require("scripts.game.main.equipBag.f_game_item_view").new()	
			 self.m_defenseView:setType(2, self.m_isSelect)
			 self.m_defenseView:setSize(cc.size(960, 578))	  
			 self:appendComponent(self.m_defenseView)
			 self.m_defenseView:setAnchorPoint(cc.p(0,1))
			 self.m_defenseView:setPositionInContainer(cc.p(0,62))
		 	self.m_viewArr[2] = self.m_defenseView
		end
		
	elseif self.m_panelIndex == 3  then
		if  self.m_itemView == nil then
			 self.m_itemView = require("scripts.game.main.equipBag.f_game_item_view").new()	
			 self.m_itemView:setType(3, self.m_isSelect)
			 self.m_itemView:setSize(cc.size(960, 578))	  
			 self:appendComponent(self.m_itemView)
			 self.m_itemView:setAnchorPoint(cc.p(0,1))
			 self.m_itemView:setPositionInContainer(cc.p(0,62))
			 self.m_viewArr[3] = self.m_itemView
		end
	elseif self.m_panelIndex == 4  then
		if  self.m_piece == nil then
			self.m_piece = require("scripts.game.main.suipian.f_suipianPanel").new()
			 self:appendComponent(self.m_piece)
			 self.m_piece:setSize(cc.size(960, 640))	  
			 self.m_piece:panelInitBeforePopup(3)
			 self.m_piece:setAnchorPoint(cc.p(0,1))
			 self.m_piece:setPositionInContainer(cc.p(0, 0))
			 self.m_viewArr[4] = self.m_piece
		end
	elseif self.m_panelIndex == 5  then
		if  self.m_bingfaView == nil then
			 self.m_bingfaView = require("scripts.game.main.equipBag.f_game_item_view").new()	
			 self:appendComponent(self.m_bingfaView)
			 self.m_bingfaView:setSize(cc.size(960, 578))	  
			 self.m_bingfaView:setType(5, true)
			 self.m_bingfaView:setAnchorPoint(cc.p(0,1))
			 self.m_bingfaView:setPositionInContainer(cc.p(0, 62))
			 self.m_viewArr[5] = self.m_bingfaView
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] onExit
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:onExit()  
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SUIPIAN_TO_ELITE, self.event_updatePveElite)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_equip_bag_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_equip_bag_panel:initAllComponent()
	self.m_componentTable["user_equip_bag_bg"]:setImage(g_game.g_resourceManager:getUiMap("chongzhi_ditu"))
	self.m_componentTable["user_equip_bag_bg"]:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self.m_componentTable["user_equip_bag_bg"]:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))

	local changeWeapon = function()
		self.m_panelIndex = 1
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(changeWeapon,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeDefense = function()
		self.m_panelIndex = 2
    	self:updatePagePanel()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(changeDefense,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeItem = function()
		self.m_panelIndex = 3
   		self:updatePagePanel()
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[3]:addHandleOfcomponentEvent(changeItem,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeItem = function()
		self.m_panelIndex = 4
   		self:updatePagePanel()
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[4]:addHandleOfcomponentEvent(changeItem,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("user_equip_bag_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if not self.m_isSelect then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(closePanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end


