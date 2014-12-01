require("scripts.game.battle.layout.f_battle_emperor_lvup")
--[[--
  奖励面板
--]]--
f_battle_reward_panel = class("f_battle_reward_panel")
f_battle_reward_panel.__index = f_battle_reward_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_reward_panel.static_create()
	local rewardTable = g_game.g_panelManager:create_panel("rewardInfo")
	local rewardPanel = rewardTable["rewardInfo"]
	  
	local funTable = {}
	tolua.setpeer(rewardPanel, funTable)
	setmetatable(funTable, f_battle_reward_panel)
	
	rewardPanel.m_componentTable = rewardTable
	return rewardPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_reward_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_shining = nil
	self.m_battleManager = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_reward_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_reward_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_reward_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] onEnter
-------------------------------------------------------------------------------
function f_battle_reward_panel:onEnter()   
    
   	self.m_shining =  g_game.g_classFactory.newFLuaAnimationComponent("FAC")
  	self:appendComponent(self.m_shining)
	self.m_shining:setPositionInContainer(cc.p(960/2, 640/2))
	self.m_shining:setAnimationScale(1.0)
	self.m_shining:setLoop(true)
	self.m_shining:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[4])
	
	local bottomPanel = self.m_componentTable["reward_bottom_panel"]
	bottomPanel:setComponentZOrder(2)
	self.m_shining:setScale(0.1)
	bottomPanel:setScale(0.1)
	
	self:initAllComponent()	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] setBattleManager
-------------------------------------------------------------------------------
function f_battle_reward_panel:setBattleManager(manager)
	self.m_battleManager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] updatePanelData
-------------------------------------------------------------------------------
function f_battle_reward_panel:updatePanelData()
	local actionTo1 = CCScaleTo:create(0.3,1)
	local actionTo2 = CCScaleTo:create(0.3,1)
	self.m_shining:runAction(actionTo1)
	self.m_componentTable["reward_bottom_panel"]:runAction(cc.EaseBounceOut:create(actionTo2))
	
	local beautyReward_Num = self.m_battleManager.m_battle_data["roundData"]["beautyReward_Num"]
	local officerReward_Num = self.m_battleManager.m_battle_data["roundData"]["officerReward_Num"]
	local propReward_Num = self.m_battleManager.m_battle_data["roundData"]["propReward_Num"]
	local equipReward_Num = self.m_battleManager.m_battle_data["roundData"]["equipReward_Num"]
	local chipReward_Num = self.m_battleManager.m_battle_data["roundData"]["chipReward_Num"]
	
	if beautyReward_Num ~= 0 then
		local beautyId = self.m_battleManager.m_battle_data["roundData"]["beautyReward"][1]["beautyId"]
		local cardResource = g_game.g_dictConfigManager:getBeautyResource(beautyId)
		local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
		self.m_componentTable["rewardIcon"]:setImage(resourceImage)
		self.m_componentTable["rewardIcon"]:setSize(cc.size(90, 90))
		
		local quality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
		self.m_componentTable["rewardIconQuality"]:setImage(g_game.g_f_quality_image[quality])
		self.m_componentTable["rewardIconQuality"]:setSize(cc.size(104,104))
		
		local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyId)
		self.m_componentTable["itemName"]:setString(beautyName)
		return
	end
	
	if officerReward_Num ~= 0 then
		local officerId = self.m_battleManager.m_battle_data["roundData"]["officerReward"][1]["officerId"]
		local cardHeadRes = g_game.g_dictConfigManager:getCardHeadFile(officerId)
		local cardHeadImage = g_game.g_resourceManager:getCardHead(cardHeadRes)
		self.m_componentTable["rewardIcon"]:setImage(cardHeadImage)
		self.m_componentTable["rewardIcon"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["rewardIcon"]:setSize(cc.size(90, 90))
		
		local quality = g_game.g_dictConfigManager:getCardQuality(officerId)
		self.m_componentTable["rewardIconQuality"]:setImage(g_game.g_f_quality_image[quality])
		self.m_componentTable["rewardIconQuality"]:setSize(cc.size(104,104))
		
		local officerName = g_game.g_dictConfigManager:getCardName(officerId)
		self.m_componentTable["itemName"]:setString(officerName)
		return
	end
	
	if equipReward_Num ~= 0 then
		local equipId = self.m_battleManager.m_battle_data["roundData"]["equipReward"][1]["equipId"]
		local itemResName = g_game.g_dictConfigManager:getEquipResource(equipId)
		local itemImage = g_game.g_resourceManager:getItemImage(itemResName)
		self.m_componentTable["rewardIcon"]:setImage(itemImage)
		self.m_componentTable["rewardIcon"]:setSize(cc.size(90,90))
		
		local quality = g_game.g_dictConfigManager:getEquipStar(equipId)
		self.m_componentTable["rewardIconQuality"]:setImage(g_game.g_f_quality_image[quality])
		self.m_componentTable["rewardIconQuality"]:setSize(cc.size(104,104))
		
		local itemName = g_game.g_dictConfigManager:getEquipName(equipId)
		self.m_componentTable["itemName"]:setString(itemName)
		return
	end
	
	if propReward_Num ~= 0 then
		local propId = self.m_battleManager.m_battle_data["roundData"]["propReward"][1]["propId"]
		local itemResName = g_game.g_dictConfigManager:getItemResName(propId)
		local itemImage = g_game.g_resourceManager:getItemImage(itemResName)
		self.m_componentTable["rewardIcon"]:setImage(itemImage)
		self.m_componentTable["rewardIcon"]:setSize(cc.size(90,90))
		
		local quality = g_game.g_dictConfigManager:getItemQuality(propId)
		self.m_componentTable["rewardIconQuality"]:setImage(g_game.g_f_quality_image[quality])
		self.m_componentTable["rewardIconQuality"]:setSize(cc.size(104,104))
		
		local itemName = g_game.g_dictConfigManager:getItemName(propId)
		self.m_componentTable["itemName"]:setString(itemName)
		return
	end
	
	if chipReward_Num ~= 0 then
	
		local chipId = self.m_battleManager.m_battle_data["roundData"]["chipReward"][1]["chipId"]
		local chipImage = g_game.g_dictConfigManager:getPieceImage(chipId)
		self.m_componentTable["rewardIcon"]:setImage(chipImage)
		self.m_componentTable["rewardIcon"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["rewardIcon"]:setSize(cc.size(90,90))
		
		local quality = g_game.g_dictConfigManager:getPieceStar(chipId)
		self.m_componentTable["rewardIconQuality"]:setImage(g_game.g_f_quality_image[quality])
		self.m_componentTable["rewardIconQuality"]:setSize(cc.size(104,104))
		
		local type = self.m_battleManager.m_battle_data["roundData"]["chipReward"][1]["type"]
		if type == 1 or type == 2 then
		    self.m_componentTable["suipian_flag_image"]:setImage("batch_ui/hunpi_biaozhi.png")
		    self.m_componentTable["suipian_flag_image"]:setSize(cc.size(42,61))
		elseif type == 3 or type == 4 then
			self.m_componentTable["suipian_flag_image"]:setImage("batch_ui/suipian_junjichu.png")
		    self.m_componentTable["suipian_flag_image"]:setSize(cc.size(70,55))
		end
		
		local itemName = g_game.g_dictConfigManager:getPieceName(chipId)
		self.m_componentTable["itemName"]:setString(itemName)
		return
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] onExit
-------------------------------------------------------------------------------
function f_battle_reward_panel:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_reward_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_reward_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] onCleanup
-------------------------------------------------------------------------------
function f_battle_reward_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_reward_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_reward_panel:initAllComponent()
	local getPress = function()
		if  self.m_battleManager.m_battle_data["roundData"]["levelUp"] == 1 then
			local preLv = g_game.g_userInfoManager:getLevel()
			local curLv = self.m_battleManager.m_battle_data["roundData"]["currLevel"]
			local isOpenPosition = g_game.g_dictConfigManager:isOpenPosition(preLv,curLv)
				--1 名臣 2美女 3皇子 0没有开启位置
				self:setVisible(false)
		
				local emperorlvupBoard = f_battle_emperor_lvup.static_create()
			    emperorlvupBoard:panelInitBeforePopup()
				g_game.g_panelManager:showUiPanel(emperorlvupBoard,"pve_emperor_lvup")
				emperorlvupBoard:setBattleManager(self.m_battleManager)
				emperorlvupBoard:setOpenPosType(isOpenPosition)
			
		else
			self.m_battleManager:requestLevelUp()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["shouxia_btn"]:addHandleOfcomponentEvent(getPress, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end

