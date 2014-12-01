require("scripts.auto.auto_mingchenjinjie")
require("scripts.auto.auto_mingChenJinJieCard")
require("scripts.game.main.common.f_jump_tip_popup")

--[[--
   名臣进阶
--]]--

f_mingchen_jinjie = class("f_mingchen_jinjie")
f_mingchen_jinjie.__index = f_mingchen_jinjie


-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_mingchen_jinjie.static_create()
	local mingchenDetail_table = createmingchenjinjie()
	local mingchen_detailPanel = mingchenDetail_table["mingchenjinjie"]
	 
	local funTable = {}
	tolua.setpeer(mingchen_detailPanel, funTable)
	setmetatable(funTable, f_mingchen_jinjie)
	
	mingchen_detailPanel.m_componentTable = mingchenDetail_table
	return mingchen_detailPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_mingchen_jinjie:panelInitBeforePopup()
	self:registerNodeEvent()	

	local clickCiGuan = function()
    	self:onClickCiGuan()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_componentTable["btn"]:addHandleOfcomponentEvent(clickCiGuan,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local close = function()
    	g_game.g_panelManager:removeUiPanel("jin_jie")
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_componentTable["xiangqing_close_button"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    self.m_refresh = function()
    	g_game.g_userInfoManager:reduceEquipDataByPropId(21, self.m_costItem)
    	self:display()
    end
    g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.m_refresh)
    
    self.update = function()
    	self:display()
    end
    g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHAOZHU_NUM, self.update)
    
    --播放进阶特效
	self.event_mingchen_jinjie_effect = function()
		self.m_jinjie_effect1 = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self:appendComponent(self.m_jinjie_effect1)
		self.m_jinjie_effect1:setAnchorPoint(cc.p(0.5,0.5))
		self.m_jinjie_effect1:setLoop(false)
		self.m_jinjie_effect1:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[17])
		self.m_jinjie_effect1:setPositionInContainer(cc.p(486, 320))
		local jinjie_effect1_finish = function()
			self:deleteComponent(self.m_jinjie_effect1)
		end
		self.m_jinjie_effect1:registeAnimationFinishCallback(jinjie_effect1_finish)
		
		self.m_jinjie_effect2 = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self:appendComponent(self.m_jinjie_effect2)
		self.m_jinjie_effect2:setAnchorPoint(cc.p(0.5,0.5))
		self.m_jinjie_effect2:setLoop(false)
		self.m_jinjie_effect2:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[16])
		self.m_jinjie_effect2:setPositionInContainer(cc.p(504, 304))
		local jinjie_effect2_finish = function()
			self:deleteComponent(self.m_jinjie_effect2)
		end
		self.m_jinjie_effect2:registeAnimationFinishCallback(jinjie_effect2_finish)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_MINGCHEN_JINJIE_EFFECT, self.event_mingchen_jinjie_effect)
end

function f_mingchen_jinjie:onClickCiGuan()
	if self.m_cost > g_game.g_userInfoManager:getUserInfo()["silver"] then
--		g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		require("scripts.game.main.common.f_less_silver_tip_popup")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
		return
	end
	if not self.m_isItemEnough then
--		g_game.g_utilManager:showMsg("朝珠数量不足，进行寻访或挑战关卡都可获得大量朝珠哦！")
		local panel = f_jump_tip_popup.static_create()
		panel:setPanelByType(16)
		local leftBtnCallback = function()
			local userLv = g_game.g_userInfoManager:getUserInfo()["level"]
			if userLv < 10 then
				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
				g_game.g_utilManager:showPublicFloatingMsg(g_game.g_f_error_msg_def.F_LUA_ERROR_PVP_NOT_OPEN)
			else
				g_game.g_panelManager:removeAllUiPanel()
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
				g_game.g_userInfoManager:requestUserPvpPlayerList()
			end
		end
		local rightBtnCallback = function()
			local getOpenLv = g_game.g_dictConfigManager:getOpenLv(8)
			if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
				g_game.g_userInfoManager:requestLianHuaShop(false)
			else
				local str = g_game.g_dictConfigManager:getLanTextById(435)
				g_game.g_utilManager:showMsg(getOpenLv .. str)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--			local getOpenLv = g_game.g_dictConfigManager:getOpenLv(6)
--			if getOpenLv > g_game.g_userInfoManager:getUserLv() then
--				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
--				g_game.g_utilManager:showMsg(getOpenLv ..  "级开启。带上藏宝图，发掘天下宝藏！")
--			else
--				g_game.g_panelManager:removeAllUiPanel()
--				require("scripts.game.main.bingfa.f_xunfang_panel")
--				local panel = f_xunfang_panel.static_create()
--				panel:panelInitBeforePopup()
--				g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
--			end
		end
		panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		
		return
	end
	if not self.m_hasSame then
		g_game.g_utilManager:showMsg("您没有相同的名臣")
		return
	end
	g_game.g_userInfoManager:requestAdvanceCard(self.m_data)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] registerNodeEvent
-------------------------------------------------------------------------------
function f_mingchen_jinjie:registerNodeEvent(handler)
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
-- @function [parent=#f_mingchen_jinjie] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_mingchen_jinjie:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] onEnter
-------------------------------------------------------------------------------
function f_mingchen_jinjie:onEnter()
	self.m_leftCardTable = createmingChenJinJieCard()
	local item = self.m_leftCardTable["mingChenJinJieCard"]
	self:appendComponent(item)
	item:setAnchorPoint(cc.p(0.5,0.5))
	item:setPositionInContainer(cc.p(149, 335))
	
	self.m_rightCardTable = createmingChenJinJieCard()
	item = self.m_rightCardTable["mingChenJinJieCard"]
	self:appendComponent(item)
	item:setAnchorPoint(cc.p(0.5,0.5))
	item:setPositionInContainer(cc.p(809, 335))
	
--	self:appendComponent(item)
--	self.m_leftCard:setAnchorPoint(cc.p(0.5,0.5))
--	self.m_leftCard:setPositionInContainer(cc.p(146, 336))
--	
--	self.m_rightCard = require("scripts.game.main.jinjie.f_jinjie_crad").new()
--	self:appendComponent(self.m_rightCard)
--	self.m_rightCard:setAnchorPoint(cc.p(0.5,0.5))
--	self.m_rightCard:setPositionInContainer(cc.p(813, 336))
	
	self:display()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] setData
-------------------------------------------------------------------------------
function f_mingchen_jinjie:setData(data)
	self.m_data = data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] setCardData
-------------------------------------------------------------------------------
function f_mingchen_jinjie:setCardData(table, adv)	
	local data = self.m_data
	local image = g_game.g_dictConfigManager:getCardResource(data["officerId"])
	table["image"]:setImage(g_game.g_resourceManager:getCard(image))
	table["image"]:setExtensionsTextureRect(cc.rect(123.5, 0, 265, 330))
	local words = g_game.g_advance_level_font[adv]
	for i = 1, 3 do
		table["zi" .. i]:setImage("batch_ui/" .. words[i] .. ".png")
	end
	table["levelText"]:setString(data["officerLevel"])
	table["nameText"]:setString(g_game.g_dictConfigManager:getCardName(data["officerId"]))

	
	local star = g_game.g_dictConfigManager:getOfficerStar(data["officerId"])
	for i = 1, 5 do
		if star >= i then
			table["star"..i]:setImage("batch_ui/xingxing.png")
		else
			table["star"..i]:setImage("batch_ui/xingxing_dark.png")
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] display
-------------------------------------------------------------------------------
function f_mingchen_jinjie:display()
	local data = self.m_data
	
	local id = data["officerId"]
	local lv = data["officerLevel"]
	local adv = data["advanced"]

	local max = g_game.g_dictConfigManager:getMaxAdvanceLevel()
		
	if adv >= max then
		local str = g_game.g_dictConfigManager:getLanTextById(360)
		g_game.g_utilManager:showMsg(str)
		g_game.g_panelManager:removeUiPanel("jin_jie")
		return
	end
	local afterAdv = math.min(adv + 1, max)
	self.m_componentTable["yinliangNumber"]:setString(g_game.g_userInfoManager:getUserInfo()["silver"] .. "")
	self:setCardData(self.m_leftCardTable, adv)
	self:setCardData(self.m_rightCardTable, afterAdv)
	
	local skill = g_game.g_dictConfigManager:getAdvanceSkillAtLevel(id, afterAdv)
	if skill == nil then
		self.m_componentTable["unlock"]:setString("")
	else
--		self.m_componentTable["unlock"]:setString("解锁天赋：" .. skill[2])
		self.m_componentTable["unlock"]:setString("")
	end
	local addAtk, addDef = g_game.g_dictConfigManager:getCardAddition(g_game.g_userInfoManager:getOfficerPosition(self.m_data["id"]), self.m_data, adv)
	local afterAddAtk, afterAddDef = g_game.g_dictConfigManager:getCardAddition(g_game.g_userInfoManager:getOfficerPosition(self.m_data["id"]), self.m_data, afterAdv)
	local atk = ""..math.floor(self.m_data["attack"] + addAtk) 
	local def = ""..math.floor(self.m_data["defense"] + addDef)
	
	self.m_componentTable["attText1"]:setString(atk)
	self.m_componentTable["defText1"]:setString(def)
	
	atk = ""..math.floor(self.m_data["attack"] + afterAddAtk) 
	def = ""..math.floor(self.m_data["defense"] + afterAddDef)
	self.m_componentTable["attText2"]:setString(atk)
	self.m_componentTable["defText2"]:setString(def)
	
	local star = g_game.g_dictConfigManager:getCardQuality(id)
	local money = g_game.g_dictConfigManager:getAdvanceSilver(afterAdv, star)
	self.m_cost = money
	local itemNumber = g_game.g_dictConfigManager:getAdvanceProp(afterAdv, star)
	self.m_costItem = itemNumber
	local needSame = g_game.g_dictConfigManager:advanceNeedSameCard(afterAdv)
	local itemId = 21
	self.m_componentTable["item1"]:setImage(g_game.g_resourceManager:getItemImage("yinliang_icon"))
	self.m_componentTable["item1"]:setSize(cc.size(90, 90))
	self.m_componentTable["frame1"]:setImage(g_game.g_f_quality_image[2])
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["itmeName1"]:setString("銀兩")
	else
		self.m_componentTable["itmeName1"]:setString("银两")
	end
	self.m_componentTable["number1"]:setString(""..money)
	
	if self.m_cost <= g_game.g_userInfoManager:getUserInfo()["silver"] then
		self.m_componentTable["number1"]:setColor(cc.c3b(139,255,240))
	else
		self.m_componentTable["number1"]:setColor(cc.c3b(254, 156, 255))
	end

	self.m_componentTable["item2"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getPropsResource(itemId)))
	self.m_componentTable["item2"]:setSize(cc.size(90, 90))
	self.m_componentTable["frame2"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getItemQuality(itemId)])
	self.m_componentTable["itmeName2"]:setString(g_game.g_dictConfigManager:getItemName(itemId))
	local count = g_game.g_userInfoManager:getItemCount(itemId)
	self.m_isItemEnough = count >= itemNumber
	self.m_componentTable["number2"]:setString(count .. "/" .. itemNumber)
	if self.m_isItemEnough then
		self.m_componentTable["number2"]:setColor(cc.c3b(139,255,240))
	else
		self.m_componentTable["number2"]:setColor(cc.c3b(254, 156, 255))
	end
	
	if needSame then
		self.m_componentTable["itempanel3"]:setVisible(true)
		self.m_componentTable["item3"]:setImage(g_game.g_resourceManager:getCardHead(g_game.g_dictConfigManager:getCardResource(id)))
		self.m_componentTable["item3"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["frame3"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getCardQuality(id)])
		self.m_componentTable["itmeName3"]:setString(g_game.g_dictConfigManager:getCardName(id))
		local count = g_game.g_userInfoManager:getAdvSameCardCount(id, data["id"])
		self.m_hasSame = count >= 1
		self.m_componentTable["number3"]:setString(count .. "/" .. 1)
		if self.m_hasSame then
			self.m_componentTable["number3"]:setColor(cc.c3b(139,255,240))
		else
			self.m_componentTable["number3"]:setColor(cc.c3b(254, 156, 255))
		end
	else
		self.m_componentTable["itempanel3"]:setVisible(false)
		self.m_hasSame = true
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] onExit
-------------------------------------------------------------------------------
function f_mingchen_jinjie:onExit()  
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHAOZHU_NUM, self.update)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.m_refresh)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_MINGCHEN_JINJIE_EFFECT, self.event_mingchen_jinjie_effect)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_mingchen_jinjie:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] onExitTransitionStart
-------------------------------------------------------------------------------
function f_mingchen_jinjie:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_jinjie] onCleanup
-------------------------------------------------------------------------------
function f_mingchen_jinjie:onCleanup()
end

