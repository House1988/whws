--[[--
美女赏赐道具
--]]--

require("scripts.auto.auto_meinv_award_item")

f_game_beauty_award_item_panel = class("f_game_beauty_award_item_panel")
f_game_beauty_award_item_panel.__index = f_game_beauty_award_item_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel.static_create()
	local mainPanelTable = createmeinv_award_item()
	local mainPanel = mainPanelTable["meinv_award_item"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_game_beauty_award_item_panel)

	mainPanel.m_componentTable = mainPanelTable
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] panelInitBeforePopup
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	local cpTabel = self.m_componentTable
	
	self.m_beautyRoleId = nil
	self.m_propId = nil
	self.m_itemCount = 0
	
	cpTabel["mi_count_lbl"]:setAlignment(2)
    cpTabel["mi_add_value_lbl"]:setAlignment(0)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:initAllComponent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] setItemData
-- 设置道具数据
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:initWithItemData(itemInfo, isQinmi)
	local cpTabel = self.m_componentTable
	
	self.m_propId = itemInfo[1]
	self.m_isQinmi = isQinmi
    
    self.m_itemCount = g_game.g_userInfoManager:getItemCount(self.m_propId)
    cpTabel["mi_count_lbl"]:setString(self.m_itemCount) -- 道具个数
    self:setImageType((self.m_itemCount > 0) and 0 or 2)
    
	-- 道具图标
	cpTabel["mi_item_image"]:setImage(g_game.g_resourceManager:getItemImage(itemInfo[10]))
    cpTabel["mi_item_image"]:setExtensionsTextureRect(cc.rect(0, 0, 90, 90))
    cpTabel["mi_item_image"]:setSize(cc.size(70, 70))
    
    -- 根据品质显示道具底图
	cpTabel["mi_item_bg"]:setImage(g_game.g_f_quality_image[itemInfo[9]])
    cpTabel["mi_item_bg"]:setSize(cc.size(80,80))
    
    local itemName = g_game.g_dictConfigManager:getLanTextById(itemInfo[2])
    cpTabel["mi_name_lbl"]:setString(itemName) -- 道具名称
    cpTabel["mi_add_value_lbl"]:setString("+"..itemInfo[8]) -- 道具增加属性值
    
    -- 点击后的处理
    local itemPanelClick = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    	if self.m_itemCount > 0 then
    		local beautyInfo = g_game.g_userInfoManager:getBeautyInfoByPriId(self.m_beautyRoleId)
			local beautyQuality = g_game.g_dictConfigManager:getBeautyQuality(beautyInfo["beautyId"])
	    	local itemQuality = g_game.g_dictConfigManager:getPropsQuality(self.m_propId)
	    	if not self.m_isQinmi and itemQuality < beautyQuality then
	    		g_game.g_utilManager:showMsg("道具品质低于美女品质，不能赏赐")
	    		return
	    	end
	    	
			local userInfo = g_game.g_userInfoManager:getUserInfo()
			local sendMsg = {}
			sendMsg["roleId"] = userInfo["roleId"]
			sendMsg["beautyId"] = self.m_beautyRoleId
			sendMsg["propId"] = self.m_propId
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
			g_game.g_netManager:send_message(g_network_message_type.CS_REWARD_BEAUTY, sendMsg)
			
			local awardPanel = g_game.g_panelManager:getUiPanel("meinv_award_ui")
			if awardPanel ~= nil then
				awardPanel:setItemPropId(self.m_propId)
			end
		else
			local data = g_game.g_dictConfigManager:getPropData(self.m_propId)
			local sendBuyItemMsg = function()
				self:sendBuyItemMsg()
			end
			
			local popupBuy = require("scripts.game.main.equipBag.f_game_item_popup").new()	
			g_game.g_panelManager:showUiPanel(popupBuy,"item_pop_up")
			popupBuy:setItemData(data)
			popupBuy:setBuyCallback(sendBuyItemMsg)
			
--			g_game.g_utilManager:showMsg("道具不足")
		end
    end
    cpTabel["clickBtn"]:addHandleOfcomponentEvent(itemPanelClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] sendBuyItemMsg
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:sendBuyItemMsg()
	local popPanel = g_game.g_panelManager:getUiPanel("item_pop_up")
	
	local id = popPanel.m_itemData[1]
	local num = popPanel.m_itemCount
	local costType = popPanel.m_costType --1silver 2gold
	local cost = popPanel.m_cost
	
	if num == 0 then
		g_game.g_panelManager:removeUiPanel("item_pop_up")
	else
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		local silver = userInfo["silver"]
		local gold = userInfo["gold"]
	
		if costType == 1 and cost > silver then
--		    g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
			require("scripts.game.main.common.f_less_silver_tip_popup")
			local panel = f_less_silver_tip_popup.static_create()
			g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
		elseif costType == 2 and cost > gold then
			require("scripts.game.main.common.f_quick_charge_popup")
			local quickCharge = f_quick_charge_popup.static_create()
		    quickCharge:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		else
			g_game.g_userInfoManager:requestBuyItem(id,num)
		end
	end
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] setImageType
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:setImageType(type)
	self.m_componentTable["mi_item_image"]:setImageType(type)
	self.m_componentTable["mi_item_bg"]:setImageType(type)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] setItemData
-- 设置道具数据
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:setItemData(itemCount, beautyRoleId)
	local cpTabel = self.m_componentTable
	self.m_beautyRoleId = beautyRoleId
	
    self.m_itemCount = itemCount
    cpTabel["mi_count_lbl"]:setString(self.m_itemCount) -- 道具个数
    self:setImageType((self.m_itemCount > 0) and 0 or 2)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_panel] setItemTypeName
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:setItemTypeName(name)
	self.m_componentTable["mi_title"]:setString(name)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_award_item_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_quick_buy_popup] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:onEnter()
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] onExit
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:onExit()
	self:unregisterNodeEvent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_award_item_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_award_item_panel:onCleanup()
end
