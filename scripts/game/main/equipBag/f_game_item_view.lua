require("scripts.auto.auto_user_item_view")

local f_game_item_view = class("f_game_item_view", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_item_view")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_item_view:ctor()
    self.m_itemBottomTable = nil
    
    self.m_itemList = nil
    self.m_isUseAll = false
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] setType
-- 设置面板类型
-------------------------------------------------------------------------------
function f_game_item_view:setType(type, isSelect)
	self.m_type = type
	self.m_isSelect = isSelect
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_item_view:onEnter()   
	self.m_itemBottomTable = createuser_item_view()
	local itemBottomView = self.m_itemBottomTable["user_item_view"]
    self:appendComponent(itemBottomView)
    itemBottomView:setAnchorPoint(cc.p(0,1))
    itemBottomView:setPositionInContainer(cc.p(0,0))
      
    self:initItems()
    
    if self.m_type ~= 3 then
 		self:initEquipView()
    else
    	self:initItemView()
    end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] initItemView
-- 初始化道具
-------------------------------------------------------------------------------
function f_game_item_view:initItemView()
    local items = g_game.g_userInfoManager:getUserEquipData()
	local num = items["propList_Num"]
	if num ~= 0  then
		local type = g_game.g_dictConfigManager:getItemRewardType(items["propList"][1]["propId"])
		if type == 1 or type == 2 or type == 3 then
	    	self.m_itemBottomTable["all_use_btn"]:setVisible(false)
	    else
	    	self.m_itemBottomTable["all_use_btn"]:setVisible(true)
	    end
	end
    
    --use all items
    local  useAllItem = function()
		self:useAllItem(true)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
    self.m_itemBottomTable["all_use_btn"]:addHandleOfcomponentEvent(useAllItem,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    self.m_itemBottomTable["all_use_btn"]:setText("全部使用", cc.c3b(166,72,29))
	
    local useSelect = function()
		self:useAllItem(false)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
    self.m_itemBottomTable["use_select_btn"]:addHandleOfcomponentEvent(useSelect,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    self.m_itemBottomTable["use_select_btn"]:setText("使用", cc.c3b(166,72,29))
    
    self.m_itemBottomTable["upgrade_btn"]:setVisible(false)
	
	--除了vip道具以外其他道具的使用返回
	self.event_updateUseItem = function()
		self:updateUseItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM,self.event_updateUseItem)
	
	--使用vip道具的结果返回更新
	self.event_updateUseVipPack = function()
		self:updateUseVipPack()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_USE_VIP_PACK,self.event_updateUseVipPack)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] initEquipView
-- 初始化装备
-------------------------------------------------------------------------------
function f_game_item_view:initEquipView()

	self.onSelect = function()
		g_game.g_panelManager:removeUiPanel("user_equip_bag_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP, self.onSelect)
    --use all items
    local  detial = function()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
   	 	local data = self.m_itemList:getSelectData()
		if data ~= nil then
    		if not self.m_isSelect then
				require("scripts.game.main.equipBag.f_equipDetial_panel")
				local panel = f_equipDetial_panel.static_create()
				panel:panelInitBeforePopup(data, false)
				g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
			else
				local t = 0
				if self.m_type == 5 then
					t = 1
				end
				g_game.g_userInfoManager:requestChangeEquip(g_game.g_userInfoManager.m_changeEquipData, data["primaryId"], g_game.g_userInfoManager.m_changeEquipPosition, t)
			end
		end
	end
	
	self.m_itemBottomTable["all_use_btn"]:setVisible(not self.m_isSelect)
    self.m_itemBottomTable["all_use_btn"]:addHandleOfcomponentEvent(detial,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    if LANGUAGE_TYPE ==3 then
	    self.m_itemBottomTable["all_use_btn"]:setText("裝備詳情", cc.c3b(166,72,29))
    else
	    self.m_itemBottomTable["all_use_btn"]:setText("装备详情", cc.c3b(166,72,29))
    end
    
    self.m_doSell = function()
   		local data = self.m_itemList:getSelectData()
   		if data ~= nil then
    		g_game.g_userInfoManager:requestSellEquip(data["primaryId"])
    	end
    end
	
	local sell = function()
		local data = self.m_itemList:getSelectData()
		if data ~= nil then
			if not self.m_isSelect then
				g_game.g_utilManager:showSellPopup(g_game.g_dictConfigManager:getEquipName(data["equip_id"]), g_game.g_dictConfigManager:getEquipPrice(data["equip_id"], data["equip_level"]), self.m_doSell)
			else
				local t = 0
				if self.m_type == 5 then
					t = 1
				end
				g_game.g_userInfoManager:requestChangeEquip(g_game.g_userInfoManager.m_changeEquipData, data["primaryId"], g_game.g_userInfoManager.m_changeEquipPosition, t)
			end
		elseif self.m_isSelect then
			if LANGUAGE_TYPE == 3 then
				g_game.g_utilManager:showMsg("當前沒有可用裝備")
			else
				g_game.g_utilManager:showMsg("当前没有可用装备")
			end
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
    self.m_itemBottomTable["use_select_btn"]:addHandleOfcomponentEvent(sell,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    if self.m_isSelect then
    	if LANGUAGE_TYPE ==3 then
    		self.m_itemBottomTable["use_select_btn"]:setText("裝備", cc.c3b(166,72,29))    	
    	else
	    	self.m_itemBottomTable["use_select_btn"]:setText("装备", cc.c3b(166,72,29))
    	end
    else
		self.m_itemBottomTable["use_select_btn"]:setText("出售", cc.c3b(166,72,29))
    end
    
    self.m_itemBottomTable["upgrade_btn"]:setVisible(not self.m_isSelect)
    
    self.m_itemBottomTable["upgrade_btn"]:addHandleOfcomponentEvent(detial,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] initItems
-- 显示道具
-------------------------------------------------------------------------------
function f_game_item_view:initItems()
	print "items"
	self.m_itemList = require("scripts.game.main.equipBag.f_game_item_list").new()	
	self.m_itemList:setType(self.m_type, self.m_isSelect)
	self:appendComponent(self.m_itemList)
	self.m_itemList:setSize(cc.size(940,520))
	self.m_itemList:setAnchorPoint(cc.p(0,1))
	self.m_itemList:setPositionInContainer(cc.p(15,0))
		
	local selectCallback = function(selectItem)
		self:setUseButtonState(selectItem)
	end
	self.m_itemList:setSelectCallback(selectCallback)
	
	local setPageText = function(text)
		self.m_itemBottomTable["pageText"]:setString(text)
	end
	self.m_itemList:setTextCallback(setPageText)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] setUseButtonState
-- 设置某些select item的显示
-------------------------------------------------------------------------------
function f_game_item_view:setUseButtonState(selectItem)
	local data = selectItem:getData()
	self.m_selectData = data
	if self.m_type ~= 3 then
		self.m_itemBottomTable["use_select_btn"]:setVisible(data["status"] == 0)
		return
	end
	local type = g_game.g_dictConfigManager:getItemRewardType(data["propId"])
	
	self.m_itemBottomTable["use_select_btn"]:setText("使用", cc.c3b(166,72,29))
	self.m_itemBottomTable["all_use_btn"]:setText("全部使用", cc.c3b(166,72,29))
	
	self.m_itemBottomTable["use_select_btn"]:setVisible(true)
	
	if type == 1 or type == 2 or type == 3 or type == 10 then
		self.m_itemBottomTable["all_use_btn"]:setVisible(false)
	else
		self.m_itemBottomTable["all_use_btn"]:setVisible(true)
	end
	
	if not g_game.g_dictConfigManager:isItemCanUse(data["propId"]) then
		self.m_itemBottomTable["all_use_btn"]:setVisible(false)
		self.m_itemBottomTable["use_select_btn"]:setVisible(false)
	else
		self.m_itemBottomTable["use_select_btn"]:setVisible(true)
		self.m_itemBottomTable["all_use_btn"]:setVisible(g_game.g_dictConfigManager:isItemCanUseAll(data["propId"]))
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] judgeIsArriveLimit
-- 判断是否达到上限
-------------------------------------------------------------------------------
function f_game_item_view:judgeIsArriveLimit()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	
	local data = self.m_itemList:getSelectData()
	
	local isPopup = false
	local des = nil
	
	local type = g_game.g_dictConfigManager:getItemRewardType(data["propId"])
	
	if type == 1 then
		local userStrengthLimit = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
		if userInfo["strength"] >= userStrengthLimit then
			des = "粮草已达上限，无法使用"
			isPopup = true
		end
	elseif type == 2 then
		local userMilitaryLimit = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
		if userInfo["military"] >= userMilitaryLimit then
			des = "军令已达上限，无法使用"
			isPopup = true
		end
	elseif type == 3 then
		local userJingliLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
		if userInfo["energy"] >= userJingliLimit then
			des = "精力已达上限，无法使用"
			isPopup = true
		end
	elseif type == 5 then
		if userInfo["challengeNum"] >= g_game.MAX_CHALLENGE_NUM then
			des = "挑战次数已达上限，无法使用"
			isPopup = true
		end 
	end

	if isPopup then
	    g_game.g_utilManager:showMsg(des)
	end

	return isPopup
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] useAllItem
-- 使用道具
-------------------------------------------------------------------------------
function f_game_item_view:useAllItem(isUseAll)
	local items = g_game.g_userInfoManager:getUserEquipData()
	local num = items["propList_Num"]
	if num == 0 then
		return
	end

	self.m_isUseAll = isUseAll
	
	if self:judgeIsArriveLimit() then
		return
	end

	local data = self.m_itemList:getSelectData()
	--vip礼包道具区别于其他的 道具 发送的消息不同
	local vipStartIndex = 22 
	local vipEndIndex = 36
	if data["propId"] >= vipStartIndex and data["propId"]<= vipEndIndex then
		g_game.g_userInfoManager:requestUseVipPack(data)
	else
		if self.m_isUseAll then
			g_game.g_userInfoManager:requestUseAllItem(data)
		else
			g_game.g_userInfoManager:requestUseSelectItem(data)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] updateUseVipPack
-- 更新vip pack使用结果
-------------------------------------------------------------------------------
function f_game_item_view:updateUseVipPack()
	g_game.g_utilManager:showMsg("使用成功！")
	local data = self.m_itemList:getSelectData()
	data["propNum"] = 0
	
	local listInfo = g_game.g_userInfoManager:getUserEquipData()
	local itemsList = listInfo["propList"]
	for i = 1,#itemsList do
		if itemsList[i]["propNum"] == 0 then
			table.remove(itemsList,i)
			listInfo["propList_Num"] = listInfo["propList_Num"] -1
			break
		end
	end
	self.m_itemList:updateDisplay()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] updateUseItem
-- 更新使用结果
-------------------------------------------------------------------------------
function f_game_item_view:updateUseItem(item)
--	local notice = require("scripts.game.main.common.f_common_floating_notice").new()
--	notice:setSize(cc.size(343, 48))
--    self:appendComponent(notice)
--    notice:setNoticeString("使用成功！")
--    notice:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
	
	local userItemResults = g_game.g_userInfoManager:getUseItemResult()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	
	local data = self.m_itemList:getSelectData()
	local selectItem = self.m_itemList:getItemByData(data)
	if self.m_isUseAll then
		data["propNum"] = 0
	else
		data["propNum"] = data["propNum"] - 1
	end
	if selectItem ~= nil then
		selectItem:setData(data, self.m_type)
	end
	
	local num = userItemResults["propUseResultList_Num"]
	local resultList =userItemResults["propUseResultList"]
	
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	
	for i = 1, num do
		if resultList[i]["propType"] == 1 then -- 回复体力
			userInfo["strength"] = userInfo["strength"] + resultList[i]["propValue"]
			vipInfo["use_strength_times"] = vipInfo["use_strength_times"] + 1
		elseif resultList[i]["propType"] == 2 then --回复军令
			userInfo["military"] = userInfo["military"] + resultList[i]["propValue"]
			vipInfo["use_military_times"] = vipInfo["use_military_times"] + 1
		elseif resultList[i]["propType"] == 3 then --回复精力
			userInfo["energy"] = userInfo["energy"] + resultList[i]["propValue"]
			vipInfo["use_energy_times"] = vipInfo["use_energy_times"] + 1
		elseif resultList[i]["propType"] == 4 then
			--微服私访 指南针
		elseif resultList[i]["propType"] == 5 then --回复挑战次数
			userInfo["challengeNum"] = userInfo["challengeNum"] + resultList[i]["propValue"]
		elseif resultList[i]["propType"] == 6 then --回复银两
			userInfo["silver"] = userInfo["silver"] + resultList[i]["propValue"]
		elseif resultList[i]["propType"] == 7 then
			g_game.g_userInfoManager:addEmptyCard(3,resultList[i]["propValue"],resultList[i]["primaryID"],1)
			--名臣
		elseif resultList[i]["propType"] == 8 then
			--装备
		elseif resultList[i]["propType"] == 9 then
			local singleBeauty = {}
			singleBeauty["id"] = resultList[i]["primaryID"]
			singleBeauty["beautyId"] = resultList[i]["propValue"]
			singleBeauty["beautyLevel"] =1
			singleBeauty["beautyTitle"] =0
			singleBeauty["position"] =0
			singleBeauty["beautyIntimacy"] =0
			singleBeauty["beautyEducation"] =0
			singleBeauty["beautySavor"] =2
			singleBeauty["beautyExp"] =0
			singleBeauty["conceive"] =0
			singleBeauty["princeList_Num"] =0
			singleBeauty["princeList"] ={}
			g_game.g_userInfoManager:insertBeautyToUnbattleList(singleBeauty)
			--美女
		elseif resultList[i]["propType"] == 10 then --vip礼包
			
		elseif resultList[i]["propType"] == 11 then --名臣进阶消耗
			
		end
	end
	
	local listInfo = g_game.g_userInfoManager:getUserEquipData()
	local itemsList = listInfo["propList"]
	for i = 1,#itemsList do
		if itemsList[i]["propNum"] == 0 then
			table.remove(itemsList,i)
			listInfo["propList_Num"] = listInfo["propList_Num"] -1
			break
		end
	end
	self.m_itemList:updateDisplay()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] onExit
-- exit
-------------------------------------------------------------------------------
function f_game_item_view:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM,self.event_updateUseItem)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP, self.onSelect)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_USE_VIP_PACK,self.event_updateUseVipPack)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_game_item_view:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_game_item_view:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_game_item_view:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_view] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_game_item_view:registerNodeEvent(handler)
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
-- @function [parent=#f_game_item_view] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_game_item_view:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


return f_game_item_view