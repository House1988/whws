require("scripts.auto.auto_guo_qing")

--[[--
国情 界面
--]]--
f_emperor_guoqing_panel = class("f_emperor_guoqing_panel")
f_emperor_guoqing_panel.__index = f_emperor_guoqing_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_emperor_guoqing_panel.static_create()
	local base_table = createguo_qing()
	local base_panel = base_table["guo_qing"]

	local funTable = {}
	tolua.setpeer(base_panel, funTable)
	setmetatable(funTable, f_emperor_guoqing_panel)

	base_panel.m_componentTable = base_table
	return base_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.liangcaoTime = g_game.g_recoverManager:getRecoverTime(2)
	self.junlingTime = g_game.g_recoverManager:getRecoverTime(3)
	self.jingliTime = g_game.g_recoverManager:getRecoverTime(1)
	
	local outputLiangcao = g_game.g_utilManager:getExportTime(self.liangcaoTime)
	local outputJunling = g_game.g_utilManager:getExportTime(self.junlingTime)
	local outputJingli = g_game.g_utilManager:getExportTime(self.jingliTime)
	
	self.m_componentTable["liangcao_cd_value"]:setString(outputLiangcao)
	self.m_componentTable["junling_cd_value"]:setString(outputJunling)
	self.m_componentTable["jingli_cd_value"]:setString(outputJingli)
	
	self.m_isLockUpdate = false
	self.m_deltaTime = 0
end


-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_emperor_guoqing_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] onEnter
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:onEnter()
    self:setStopTouchEvent(true)
    
    self.m_vipNumLabel = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(self.m_vipNumLabel)	
	self.m_vipNumLabel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_vipNumLabel:setPositionInContainer(cc.p(254, 183))	
	self.m_vipNumLabel:setTextWithInt(15)
	self.m_vipNumLabel:setScale(0.8)
    
    self:updateEmperorInfo()
	self:initAllComponent()
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()	
	local limitStrength = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
	local limitJunling = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
	local jingliLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
	
	self.m_liangcaoAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_liangcaoAnim:setup(self.m_componentTable["cur_liangcao_label"], 21, "%d/" .. (limitStrength * 100), false, false)
	self.m_componentTable["guo_qing"]:appendComponent(self.m_liangcaoAnim)
	local p = self.m_componentTable["cur_liangcao_label"]:getPositionInContainer()
	self.m_liangcaoAnim:setPositionInContainer(p)
	self.m_liangcaoAnim:setLastValue(userInfo["strength"])

	self.m_energyAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_energyAnim:setup(self.m_componentTable["cur_jingli_label"], 21, "%d/" .. (jingliLimit * 100), false, false)
	self.m_componentTable["guo_qing"]:appendComponent(self.m_energyAnim)
	local p = self.m_componentTable["cur_jingli_label"]:getPositionInContainer()
	self.m_energyAnim:setPositionInContainer(p)
	self.m_energyAnim:setLastValue(userInfo["energy"])
	
	self.m_junlingAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_junlingAnim:setup(self.m_componentTable["cur_junling_label"], 21, "%d/" .. (limitJunling * 100), false, false)
	self.m_componentTable["guo_qing"]:appendComponent(self.m_junlingAnim)
	local p = self.m_componentTable["cur_junling_label"]:getPositionInContainer()
	self.m_junlingAnim:setPositionInContainer(p)
	self.m_junlingAnim:setLastValue(userInfo["military"])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] updateEmperorInfo
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:updateEmperorInfo()
	--年号
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	if userInfo["reign"] ~= nil and userInfo["reign"] ~= "" then
		self.m_componentTable["year_str"]:setString(userInfo["reign"])
	end	
	--username
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	self.m_componentTable["user_str"]:setString(userInfo["name"])
	
	self.m_vipNumLabel:setTextWithInt(userInfo["vipLevel"])
	
	self.m_componentTable["level_value"]:setString(userInfo["level"])
	self.m_componentTable["exp_value"]:setString(userInfo["exp"] .. "/" .. g_game.g_dictConfigManager:getLevelExpLimit(userInfo["level"]))
	self.m_componentTable["silver_value"]:setString(userInfo["silver"])
	self.m_componentTable["yuanbao_value"]:setString(userInfo["gold"])
	
	--粮草
	local limitStrength = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
	self.m_componentTable["liangcao_loading"]:setPercent(userInfo["strength"] / limitStrength * 100)
	self.m_componentTable["cur_liangcao_label"]:setString(userInfo["strength"] .. "/" .. limitStrength)
	
	if userInfo["strength"]  >= limitStrength then
		self.m_componentTable["liangcao_cd_value"]:setVisible(false)
		self.m_componentTable["liangcao_des"]:setVisible(false)
	end
	
	--军令
	local junling = userInfo["military"]
	local limitJunling = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
	self.m_componentTable["junling_loading"]:setPercent(junling / limitJunling * 100)
	self.m_componentTable["cur_junling_label"]:setString(junling .. "/" .. limitJunling)
	
	if junling >= limitJunling then
		self.m_componentTable["junling_cd_value"]:setVisible(false)
		self.m_componentTable["junling_des"]:setVisible(false)
	end
	
	--精力
	local jingliLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
	self.m_componentTable["jingli_loading"]:setPercent(userInfo["energy"]/jingliLimit * 100)
	self.m_componentTable["cur_jingli_label"]:setString(userInfo["energy"] .. "/" .. jingliLimit)
	
	if userInfo["energy"] >= jingliLimit then
		self.m_componentTable["jingli_cd_value"]:setVisible(false)
		self.m_componentTable["jingli_des"]:setVisible(false)
	end
	
	local battleCardInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	
	local userLv = userInfo["level"]
	local openNum = g_game.g_dictConfigManager:getOpenedCardNum(userLv)
	self.m_componentTable["mingchen_num"]:setString(#battleCardInfo.."/"..openNum)
	
	local cardStar1_num = 0
	local cardStar2_num = 0
	local cardStar3_num = 0
	local cardStar4_num = 0
	local cardStar5_num = 0
	
	local totalAtk = 0
	local totalDef = 0
	
	local allCardNum = #battleCardInfo  
	for i = 1, allCardNum do
		local cardId = 0
		
		local atkAddition,defAddition = g_game.g_dictConfigManager:getCardAddition(i,battleCardInfo[i])
		totalAtk = totalAtk + battleCardInfo[i]["attack"] + atkAddition
		totalDef = totalDef + battleCardInfo[i]["defense"] + defAddition
		cardId = battleCardInfo[i]["officerId"]
		
		local cardQuality = g_game.g_dictConfigManager:getCardQuality(cardId)
		
		if cardQuality == 1 then
			cardStar1_num  = cardStar1_num +1
		elseif cardQuality == 2 then
			cardStar2_num = cardStar2_num +1
		elseif cardQuality == 3 then
			cardStar3_num = cardStar3_num +1
		elseif cardQuality == 4 then
			cardStar4_num = cardStar4_num +1
		else
			cardStar5_num = cardStar5_num +1
		end
	end
	
	self.m_componentTable["mingcheng_5_num"]:setString(cardStar5_num)
	self.m_componentTable["mingcheng_4_num"]:setString(cardStar4_num)
	self.m_componentTable["mingcheng_3_num"]:setString(cardStar3_num)
	self.m_componentTable["mingcheng_2_num"]:setString(cardStar2_num)
	self.m_componentTable["mingcheng_1_num"]:setString(cardStar1_num)
	self.m_componentTable["total_def"]:setString(math.floor(totalDef))
	self.m_componentTable["total_atk"]:setString(math.floor(totalAtk))
	
	local beautyCardInfo = g_game.g_userInfoManager:getBeautiListInfo()
	local userLv = userInfo["level"]
	local openNum = g_game.g_dictConfigManager:getOpenedBeautiNum(userLv)
	self.m_componentTable["meinv_num"]:setString(beautyCardInfo["battleList_Num"].."/"..openNum)
	
	allCardNum = beautyCardInfo["battleList_Num"]--+ beautyCardInfo["unbattleList_Num"]
	cardStar1_num = 0
	cardStar2_num = 0
	cardStar3_num = 0
	cardStar4_num = 0
	cardStar5_num = 0
	for i = 1, allCardNum do
		local cardId = 0
		
--		if i <= beautyCardInfo["battleList_Num"] then
			cardId = beautyCardInfo["battleList"][i]["beautyId"]
--		else
--			cardId = beautyCardInfo["unbattleList"][i-beautyCardInfo["battleList_Num"]]["beautyId"]
--		end
		local cardQuality = g_game.g_dictConfigManager:getBeautyQuality(cardId)
		
		if cardQuality == 1 then
			cardStar1_num  = cardStar1_num +1
		elseif cardQuality == 2 then
			cardStar2_num = cardStar2_num +1
		elseif cardQuality == 3 then
			cardStar3_num = cardStar3_num +1
		elseif cardQuality == 4 then
			cardStar4_num = cardStar4_num +1
		else
			cardStar5_num = cardStar5_num +1
		end
	end
	self.m_componentTable["meinv_5_num"]:setString(cardStar5_num)
	self.m_componentTable["meinv_4_num"]:setString(cardStar4_num)
	self.m_componentTable["meinv_3_num"]:setString(cardStar3_num)
	self.m_componentTable["meinv_2_num"]:setString(cardStar2_num)
	self.m_componentTable["meinv_1_num"]:setString(cardStar1_num)
	
	local princeCardInfo = g_game.g_userInfoManager:getPrinceData()
	local userLv = userInfo["level"]
	local openNum = g_game.g_dictConfigManager:getOpenedPrinceNum(userLv)
	self.m_componentTable["huangzi_num"]:setString(princeCardInfo["battleList_Num"].."/"..openNum)
	
	allCardNum = princeCardInfo["battleList_Num"]--+ princeCardInfo["unbattleList_Num"]
	cardStar1_num = 0
	cardStar2_num = 0
	cardStar3_num = 0
	cardStar4_num = 0
	cardStar5_num = 0
	for i = 1, allCardNum do
		local cardQuality = 0
--		if i <= princeCardInfo["battleList_Num"] then
			cardQuality = princeCardInfo["battleList"][i]["princeStar"]
--		else
--			cardQuality = princeCardInfo["unbattleList"][i-princeCardInfo["battleList_Num"]]["princeStar"]
--		end
		
		if cardQuality == 1 then
			cardStar1_num  = cardStar1_num +1
		elseif cardQuality == 2 then
			cardStar2_num = cardStar2_num +1
		elseif cardQuality == 3 then
			cardStar3_num = cardStar3_num +1
		elseif cardQuality == 4 then
			cardStar4_num = cardStar4_num +1
		else
			cardStar5_num = cardStar5_num +1
		end
	end
	
	self.m_componentTable["huangzi_5_num"]:setString(cardStar5_num)
	self.m_componentTable["huangzi_4_num"]:setString(cardStar4_num)
	self.m_componentTable["huangzi_3_num"]:setString(cardStar3_num)
	self.m_componentTable["huangzi_2_num"]:setString(cardStar2_num)
	self.m_componentTable["huangzi_1_num"]:setString(cardStar1_num)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] onExit
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:onExit()
	self:unregisterNodeEvent()
	g_game.g_gameManager:removeUpdateObj(self)
	
	--移除玩家获得元宝充值成功后的事件
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_isNeedUpdate)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_UserInfo1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] onCleanup
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:initAllComponent()
	--关闭
	local close = function()
		self:closeCurrentPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close_button"]:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local popupVip = function()
		self:popupVip()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["vip_btn"]:addHandleOfcomponentEvent(popupVip, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local showQuickBuy1 = function()
		self:showQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_STRENGTH)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["add_liangcao_btn"]:addHandleOfcomponentEvent(showQuickBuy1, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local showQuickBuy2 = function()
		self:showQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_MILITARY)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["add_junling_btn"]:addHandleOfcomponentEvent(showQuickBuy2, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local showQuickBuy3 = function()
		self:showQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_ENERGY)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["add_jingli_btn"]:addHandleOfcomponentEvent(showQuickBuy3, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self.event_isNeedUpdate  = function()
		self:updateCall()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_isNeedUpdate)
	
	self.event_UserInfo1  = function()
		self:updateCall()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_UserInfo1)
	
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] updateCall
-- 更新
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:updateCall()
	self.m_isLockUpdate = false
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	--粮草
	local limitStrength = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
	self.m_componentTable["liangcao_loading"]:setPercent(userInfo["strength"] / limitStrength * 100)
	self.m_componentTable["cur_liangcao_label"]:setString(userInfo["strength"] .. "/" .. limitStrength)
	
	--军令
	local junling = userInfo["military"]
	local limitJunling = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
	self.m_componentTable["junling_loading"]:setPercent(junling / limitJunling * 100)
	self.m_componentTable["cur_junling_label"]:setString(junling .. "/" .. limitJunling)
	
	--精力
	local jingliLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
	self.m_componentTable["jingli_loading"]:setPercent(userInfo["energy"]/jingliLimit * 100)
	self.m_componentTable["cur_jingli_label"]:setString(userInfo["energy"] .. "/" .. jingliLimit)
	
	if self.m_liangcaoAnim ~= nil then
		self.m_liangcaoAnim:playWhenLarger(userInfo["strength"], 0.8)
		self.m_energyAnim:playWhenLarger(userInfo["energy"], 0.8)
		self.m_junlingAnim:playWhenLarger(userInfo["military"], 0.8)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] update
-- 更新
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:update(dt)
	self.m_deltaTime = self.m_deltaTime + dt
	
	if self.m_deltaTime >= 1 then
		self.m_deltaTime = 0
		
		self.liangcaoTime = self.liangcaoTime - 1
		self.junlingTime = self.junlingTime -1
		self.jingliTime = self.jingliTime -1
		
		if self.liangcaoTime <= 0 then
			self.liangcaoTime = g_game.UPDATE_TIME
			self.m_isLockUpdate = true
		end
		
		if self.junlingTime <= 0 then
			self.junlingTime = g_game.UPDATE_TIME
			self.m_isLockUpdate = true
		end
		
		if self.jingliTime <= 0 then
			self.jingliTime = g_game.UPDATE_TIME
			self.m_isLockUpdate = true
		end
		
		if self.m_isLockUpdate then
			 g_game.g_userInfoManager:requestRecoverData()
		end
		
		local outputLiangcao = g_game.g_utilManager:getExportTime(self.liangcaoTime)
		local outputJunling = g_game.g_utilManager:getExportTime(self.junlingTime)
		local outputJingli = g_game.g_utilManager:getExportTime(self.jingliTime)
		
		self.m_componentTable["liangcao_cd_value"]:setString(outputLiangcao)
		self.m_componentTable["junling_cd_value"]:setString(outputJunling)
		self.m_componentTable["jingli_cd_value"]:setString(outputJingli)
		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] popupVip
-- 弹出vip特权
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:popupVip()
	local vipPanel = f_vip_panel.static_create()
	vipPanel:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(vipPanel,"vip")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] showQuickBuyOrUse
-- 弹出快速使用或购买
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:showQuickBuyOrUse(type)
	g_game.g_utilManager:popupQuickBuyOrUse(type)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_emperor_guoqing_panel] closeCurrentPanel
-- 从父节点删除
-------------------------------------------------------------------------------
function f_emperor_guoqing_panel:closeCurrentPanel()
	g_game.g_panelManager:removeUiPanel("guo_qing")
end





