--[[--
	商城 主面板
--]]--
f_shangcheng_panel = class("f_shangcheng_panel")
f_shangcheng_panel.__index = f_shangcheng_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_shangcheng_panel.static_create()
	local shangcheng_Table = g_game.g_panelManager:create_panel("shangcheng")
	local shangcheng_Panel = shangcheng_Table["shangcheng"]
	  
	local funTable = {}
	tolua.setpeer(shangcheng_Panel, funTable)
	setmetatable(funTable, f_shangcheng_panel)
	
	shangcheng_Panel.m_componentTable = shangcheng_Table
	return shangcheng_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_shangcheng_panel:panelInitBeforePopup()
	self.m_items = nil
	self:registerNodeEvent()
	
	self.m_popupBuy = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_shangcheng_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] onEnter
-------------------------------------------------------------------------------
function f_shangcheng_panel:onEnter()
	self:initAllComponent()
	self:setStopTouchEvent(true)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] onExit
-------------------------------------------------------------------------------
function f_shangcheng_panel:onExit()  
    self:unregisterNodeEvent()
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM, self.event_updateBuyItem)
  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_shangcheng_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_shangcheng_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] onCleanup
-------------------------------------------------------------------------------
function f_shangcheng_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangcheng_panel:initAllComponent()
	
	self.m_componentTable["shangcheng_bg"]:setImage(g_game.g_resourceManager:getUiMap("chongzhi_ditu"))
	self.m_componentTable["shangcheng_bg"]:setExtensionsTextureRect(cc.rect(0,62,960,578))
	self.m_componentTable["shangcheng_bg"]:setSize(cc.size(CONFIG_SCREEN_WIDTH, 640))
	
--	self.m_componentTable["shangcheng_meinv"]:setExtensionsTextureRect(cc.rect(90,0,207,487))
--	self.m_componentTable["shangcheng_meinv"]:setSize(cc.size(242,578))
	
	
	self:initSellItems()
	
	self.event_updateBuyItem = function()
		self:updateBuyItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM, self.event_updateBuyItem)
	
	
	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] updateBuyItem
-- 更新购买结果
-------------------------------------------------------------------------------
function f_shangcheng_panel:updateBuyItem()
    local popPanel = g_game.g_panelManager:getUiPanel("item_pop_up")
	local num = popPanel.m_itemCount
	local costType = popPanel.m_costType --1silver 2gold
	local cost = popPanel.m_cost
    
    local userInfo = g_game.g_userInfoManager:getUserInfo()
    if costType == 1 then
   		userInfo["silver"] = userInfo["silver"] - cost
   	end
   	
   	if costType == 2 then
   		userInfo["gold"] = userInfo["gold"] - cost
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD)
   	end
   	
   	g_game.g_panelManager:removeUiPanel("item_pop_up")
   	
   	local result = g_game.g_userInfoManager:getBuyItemResult()
   	local num2 = result["propList_Num"]
   	
   	for i = 1, num2 do
   		--3名臣  2美女
   		if result["propList"][i]["type"] == 3 then
   			g_game.g_userInfoManager:addEmptyCard(3,result["propList"][i]["id"],result["propList"][i]["primaryId"],1)
   		elseif result["propList"][i]["type"] == 2 then
   			g_game.g_userInfoManager:addEmptyCard(2,result["propList"][i]["id"],result["propList"][i]["primaryId"],1)
   		else -- 所有的道具
   			g_game.g_userInfoManager:addEmptyCard(1,result["propList"][i]["id"],result["propList"][i]["primaryId"],result["propList"][i]["num"])
   		end
   	end
	
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] initSellItems
-- 初始化所有 售出 道具
-------------------------------------------------------------------------------
function f_shangcheng_panel:initSellItems()
	self.m_items  = require("scripts.game.main.shangcheng.f_shangcheng_items_table").new()
	self.m_items:setSize(cc.size(719,569))
	self.m_items:setTableInfo(3,2,5,5,344,228)
	self:appendComponent(self.m_items)
	self.m_items:setStopTouchEvent(true)	
	self.m_items:enableClipping(true)
	self.m_items:setAnchorPoint(cc.p(0,1))
	self.m_items:setPositionInContainer(cc.p(233,2))
	
	local buySelectItem = function(item)
		self:buyItem(item)
	end
	self.m_items:setBuyCallBack(buySelectItem)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_panel] buyItem
-- 购买道具
-------------------------------------------------------------------------------
function f_shangcheng_panel:buyItem(item)
	
	local data = item:getData()
	local sendBuyItemMsg = function()
		self:sendBuyItemMsg()
	end
	
	local popupBuy = require("scripts.game.main.equipBag.f_game_item_popup").new()	
	g_game.g_panelManager:showUiPanel(popupBuy,"item_pop_up")
	popupBuy:setItemData(data)
	popupBuy:setBuyCallback(sendBuyItemMsg)
	
end

function f_shangcheng_panel:sendBuyItemMsg()
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
--		    g_game.g_utilManager:showMsg("元宝不足！")
		else
			g_game.g_userInfoManager:requestBuyItem(id,num)
		end
	end
	
end