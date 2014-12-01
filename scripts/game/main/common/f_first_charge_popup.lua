require("scripts.auto.auto_public_first_charge_pop")

f_first_charge_popup = class("f_first_charge_popup")
f_first_charge_popup.__index = f_first_charge_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_first_charge_popup.static_create()
							 
	local infoTable = createpublic_first_charge_pop()
	local info = infoTable["public_first_charge_pop"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_first_charge_popup)

	info.m_componentTable = infoTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_first_charge_popup:panelInitBeforePopup()
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_first_charge_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_first_charge_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_first_charge_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] onEnter
-------------------------------------------------------------------------------
function f_first_charge_popup:onEnter()
	self:setStopTouchEvent(true)
	
	-- 灯笼
	local lantern_effect_left = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(lantern_effect_left)
	lantern_effect_left:setAnchorPoint(cc.p(0.5,0.5))
	lantern_effect_left:setLoop(true)
	lantern_effect_left:setAnimationScale(0.4)
	lantern_effect_left:setScale(2.05)
	lantern_effect_left:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[2])
	lantern_effect_left:setPositionInContainer(cc.p(486, 238))
	
	self.m_refresh = function()
		self.m_componentTable["lingqu_btn"]:setButtonState(2)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_VIP_CHONGZHI_YUANBAO_CHENGGONG, self.m_refresh)
	
	self:initRewardList()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] initRewardList
-------------------------------------------------------------------------------
function f_first_charge_popup:initRewardList()
	local cpTable = self.m_componentTable
	
	-- 元宝翻倍
	cpTable["item1"]:setImage(g_game.g_resourceManager:getItemImage("yuanbaofanbei"))
	cpTable["item1"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	cpTable["reward_item1"]:setImage(g_game.g_f_quality_image[5])
	
	-- 奖励物品
--	local rewardList = g_game.g_userInfoManager:getFirstChargReward()["propList"]
	local rewardList = 
	{
		{["id"] = 0,["num"] = 200000,["type"] = 5},
		{["id"] = 5029,["num"] = 1,["type"] = 3},
		{["id"] = 4018,["num"] = 1,["type"] = 6}
	}
	
	local clickMingchen = function()
		require("scripts.game.main.card.f_card_mingchen_detail")
		local detailPanel = f_card_mingchen_detail.static_create()
		detailPanel:panelInitBeforePopup()
		local data = g_game.g_utilManager:fakeMingChenData(5029)
		detailPanel:setDetail(data)
		g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")
	end
	
	local clickEquip = function()
		require("scripts.game.main.equipBag.f_equipDetial_panel")
		local panel = f_equipDetial_panel.static_create()
		local data = g_game.g_utilManager:fakeEquipment(4018)
		panel:panelInitBeforePopup(data, false)
		g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
	end
	
	for i = 1, 4 do
		if i ~= 2  then
			local anim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
			cpTable["btn" .. i]:appendComponent(anim)
			anim:setAnchorPoint(cc.p(0.5,0.5))
			anim:setLoop(true)
			anim:setScale(0.5)
			anim:setAnimationScale(1.5)
			anim:setPositionInContainer(cc.p(52, 52))
			anim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[6])
		end
	end
	
	for i = 2, #rewardList+1 do
		if i <= 4 then
			local type = rewardList[i-1]["type"]
			local id = rewardList[i-1]["id"]
			
			local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
			
			local icon = cpTable["item"..i]
			icon:setImage(imagePath)
			icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
			
			cpTable["label"..i]:setString(name)
			cpTable["reward_item"..i]:setImage(g_game.g_f_quality_image[q])
			cpTable["fc_item_count"..i]:setTextWithInt(rewardList[i-1]["num"])
			
			if type == 3 then
				cpTable["btn"..i]:addHandleOfcomponentEvent(clickMingchen, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			end
			
			if type == 6 then
				cpTable["btn"..i]:addHandleOfcomponentEvent(clickEquip, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			end
		end
	end
	
	local flag = g_game.g_userInfoManager:getFirstChargeFlag()
	if flag["result"]== 0 then
		self.m_componentTable["lingqu_btn"]:setButtonState(8)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] getRewardItems
-------------------------------------------------------------------------------
function f_first_charge_popup:getRewardItems()
	local rewardList = g_game.g_userInfoManager:getFirstChargReward()["propList"]
	local rewardListNum = g_game.g_userInfoManager:getFirstChargReward()["propList_Num"]
	
	g_game.g_userInfoManager:updatePackToUser(rewardListNum,rewardList)
	g_game.g_panelManager:removeUiPanel("public_first_charge_pop")
	local strT = g_game.g_dictConfigManager:getLanTextById(369)
	g_game.g_utilManager:showMsg(strT)
	
	local flag = g_game.g_userInfoManager:getFirstChargeFlag()
	flag["result"] = 2
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] onExit
-------------------------------------------------------------------------------
function f_first_charge_popup:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE, self.event_updateFirstChargeResult)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_VIP_CHONGZHI_YUANBAO_CHENGGONG, self.m_refresh)

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_first_charge_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_first_charge_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] onCleanup
-------------------------------------------------------------------------------
function f_first_charge_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_first_charge_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_first_charge_popup:initAllComponent()
    local lingqu = function()
		g_game.g_userInfoManager:requestGetFirstChargReward()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["lingqu_btn"]:addHandleOfcomponentEvent(lingqu, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local chongzhiCallback = function()
		local shangcheng_chongzhi = f_shangcheng_chongzhi_panel.static_create()
	    shangcheng_chongzhi:panelInitBeforePopup()
	    g_game.g_panelManager:showUiPanel(shangcheng_chongzhi,"shangcheng_chongzhi")	
	    send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
	self.m_componentTable["chongzhi_btn"]:addHandleOfcomponentEvent(chongzhiCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("public_first_charge_pop")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["fc_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_componentTable["fc_close_btn"]:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	self.event_updateFirstChargeResult = function()
		self:getRewardItems()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE, self.event_updateFirstChargeResult)
	
end


