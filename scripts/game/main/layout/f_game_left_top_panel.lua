require("scripts.game.main.layout.f_emperor_guoqing_panel")
require("scripts.game.main.shangcheng.f_shangcheng_chongzhi_panel")

--[[--
    主界面左上角面板扩展类
--]]--
f_game_left_top_panel = class("f_game_left_top_panel")
f_game_left_top_panel.__index = f_game_left_top_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_left_top_panel.static_create()
	local leftTopPanelTable = g_game.g_panelManager:create_panel("main_ui_top_left")
	local leftTopPanel = leftTopPanelTable["main_ui_top_left"]
	
	local funTable = {}
	tolua.setpeer(leftTopPanel, funTable)
	setmetatable(funTable, f_game_left_top_panel)
	
	leftTopPanel.m_componentTable = leftTopPanelTable
	   
	return leftTopPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_game_left_top_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.LEFT_TOP)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(0, 1))   
  	self:setPositionInContainer(cc.p(0, 0))
 
  	self:initAllComponent()--初始化各个组件
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_left_top_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_left_top_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_left_top_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] onEnter
-------------------------------------------------------------------------------
function f_game_left_top_panel:onEnter()	
	local guoqingcallback = function()
	  	if g_game.g_guidelinesManager:canBtnClick("guoqing") then
			--g_game.g_userInfoManager:requestRecoverTime(2)
			self:popupGuoqing()
			g_game.g_panelManager:removeUiPanel("main_popup")
	--		self:popupGuoqing()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["emperor_btn"]:addHandleOfcomponentEvent(guoqingcallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local chongzhi = function()
	  	if g_game.g_guidelinesManager:canBtnClick("chongzhi") then
	  		-- 如果vip level == 0 弹出受宠翻倍界面
	  		local userInfo = g_game.g_userInfoManager:getUserInfo()
	  		if userInfo["vipLevel"] == 0 then
	  			if g_game.g_panelManager:isUiPanelShow("public_first_charge_pop") == false then
					require("scripts.game.main.common.f_first_charge_popup")
			  		local firstCharge = f_first_charge_popup.static_create()
				    firstCharge:panelInitBeforePopup()
					g_game.g_panelManager:showUiPanel(firstCharge,"public_first_charge_pop")
	  			end
	  		else
				local shangcheng_chongzhi = f_shangcheng_chongzhi_panel.static_create()
			    shangcheng_chongzhi:panelInitBeforePopup()
			    g_game.g_panelManager:showUiPanel(shangcheng_chongzhi,"shangcheng_chongzhi")	
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	  		end
		end
	end
	self.m_componentTable["chongzhi_btn"]:addHandleOfcomponentEvent(chongzhi, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--注册宗人府升级回调，修改银两值
	self.event_updateZongrenfuShengji = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS, self.event_updateZongrenfuShengji)
	
	--注册宗人府升级回调，修改银两值
	self.event_refresh = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_MAINUI, self.event_refresh)
	
	--注册上书房升级回调，修改银两值
	self.event_updateShangshufangJiaoyu = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS, self.event_updateShangshufangJiaoyu)
	
	--注册名臣升级回调，修改银两值
	self.event_updateMingchenShengji = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)

	--注册宫斗回调，修改银两值
	self.event_updateGongdou = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateGongdou)
	
	--注册册封回调，修改银两值
	self.event_updateCefeng = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefeng)
	
	--注册商城 科举 和 选秀 在CD事件内消耗元宝的更新事件
	self.event_updateCDXiaohaoYuanbao = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD, self.event_updateCDXiaohaoYuanbao)
	
	--更新 购买道具消耗银两
	self.event_updateBuyItemCost = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_updateBuyItemCost)
	
	--更新 购买道具消耗银两
--	self.event_gotoGuoqing = function()
--		self:popupGuoqing()
--	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END, self.event_gotoGuoqing)
	
	self.event_updateRecover  = function()
		self:refersh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateRecover)
	
	------
	self.event_updateEuipAdd  = function()
		self:refreshAddtion()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_EQUIPPOSITION, self.event_updateEuipAdd)
	
	self.event_updatePrinceAdd  = function()
		self:refreshAddtion()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ADD, self.event_updatePrinceAdd)
	
	self.event_updateCombiAdd  = function()
		self:refreshAddtion()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_COMBINATION, self.event_updateCombiAdd)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] popupGuoqing
-------------------------------------------------------------------------------
function f_game_left_top_panel:popupGuoqing()
	if not g_game.g_panelManager:isUiPanelShow("qgyd_bottom") then
		local guoqing = f_emperor_guoqing_panel.static_create()
	    guoqing:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(guoqing,"guo_qing")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] onExit
-------------------------------------------------------------------------------
function f_game_left_top_panel:onExit()  
  	self:unregisterNodeEvent()
  	self.m_vipNumLabel = nil
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_EQUIPPOSITION, self.event_updateEuipAdd)
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_COMBINATION, self.event_updateCombiAdd)
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ADD, self.event_updatePrinceAdd)
	
  	--移除上书房皇子升级界面的元宝更新回调
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU, self.event_updateShangshufangJiaoyu)
  	--移除宗人府皇子升级界面的元宝更新回调
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU, self.event_updateZongrenfuShengji)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateGongdou)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefeng)
	
	--移除商城 科举 和 选秀 在CD事件内消耗元宝的更新事件
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD, self.event_updateCDXiaohaoYuanbao)
	--移除名臣升级界面的元宝更新回调
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_updateBuyItemCost)
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateRecover)
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END, self.event_gotoGuoqing)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_MAINUI, self.event_refresh)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_left_top_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_left_top_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_left_top_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_left_top_panel:initAllComponent()
	--添加用户vip等级的label
	self.m_vipNumLabel = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(self.m_vipNumLabel)	
	self.m_vipNumLabel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_vipNumLabel:setPositionInContainer(cc.p(203, 76))	
	self.m_vipNumLabel:setTextWithInt(15)
	self.m_vipNumLabel:setScale(0.5)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] getTeamAtkAndDef
-- 矫正整体队伍实力
-------------------------------------------------------------------------------
function f_game_left_top_panel:getTeamAtkAndDef()
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local battleAttNum = 0
	if battleList ~= nil then
		battleAttNum = #battleList
	end
	
	if battleAttNum == 0 then
		return 0,0
	end
	
    local allAtk = 0
	local allDef = 0
	
	local advAtt = 0
   	local advDef = 0
   	local bingfaAtt = 1
	local bingfaDef = 1
	for i = 1 , table.getn(battleList) do
		bingfaAtt = 1
		bingfaDef = 1
		advAtt = 0
		advDef = 0
		local weapon,armor, bingfa = g_game.g_userInfoManager:getEquipForCard(i)
		
		if bingfa ~= nil then
			bingfaAtt = g_game.g_dictConfigManager:getWeaponAddition(bingfa["equip_id"],bingfa["equip_level"]) / 100 + 1
			bingfaDef = g_game.g_dictConfigManager:getArmorAddition(bingfa["equip_id"],bingfa["equip_level"]) / 100 + 1
		end
	
	
		local adv = battleList[i]["advanced"]
		local effect = g_game.g_dictConfigManager:getCardAdvanceEffect(battleList[i]["officerId"])
		if effect > 0 then
			advAtt = g_game.g_dictConfigManager:getAdvanceEffect()[adv][2 * effect]
			advDef = g_game.g_dictConfigManager:getAdvanceEffect()[adv][2 * effect + 1]
		end
		allAtk = allAtk + advAtt + battleList[i]["attack"]*bingfaAtt
		allDef = allDef + advDef + battleList[i]["defense"]*bingfaDef
	end
	
--	for j = 1 , table.getn(battleList) do
--		allAtk = allAtk + battleList[j]["attack"] + advAtt
--		allDef = allDef + battleList[j]["defense"]+ advDef
--	end
--	
	return allAtk ,allDef
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] refreshCombiAddition
-------------------------------------------------------------------------------
function f_game_left_top_panel:refreshCombiAddition()
	
	local curCombinationData = g_game.g_userInfoManager:getUserCombination()
	if curCombinationData == nil then
		return 0,0
	end
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local battleAttNum = 0
	if battleList ~= nil then
		battleAttNum = #battleList
	end
	
	if battleAttNum == 0 then
		return 0,0 
	end
	
	local atkAddition = 0
	local defAddition = 0
	for i = 1,battleAttNum do
		local add1,add2 = g_game.g_dictConfigManager:getCombinationAddition(battleList[i]["officerId"],battleList[i]["officerLevel"])
	    atkAddition = atkAddition + battleList[i]["attack"]*add1/100
	    defAddition = defAddition + battleList[i]["defense"]*add2/100
	end
	
	return atkAddition,defAddition
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] refreshEquipAddition
-------------------------------------------------------------------------------
function f_game_left_top_panel:refreshEquipAddition()
	local curEquipData = g_game.g_userInfoManager:getEquipmentData()
	if curEquipData == nil then
		return 0,0
	end
	
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local battleAttNum = 0
	if battleList ~= nil then
		battleAttNum = #battleList
	end
	
	if battleAttNum == 0 then
		return 0,0
	end
	
	local weaponAdd = 0
	local armorAdd = 0
	for i = 1,battleAttNum do
		local weapon,armor, bingfa = g_game.g_userInfoManager:getEquipForCard(i)
		if weapon ~= nil then
			local add1 = g_game.g_dictConfigManager:getWeaponAddition(weapon["equip_id"],weapon["equip_level"])
			weaponAdd = weaponAdd + add1
		end
		if armor ~= nil then
		    local add2 = g_game.g_dictConfigManager:getArmorAddition(armor["equip_id"],armor["equip_level"])
		    armorAdd = armorAdd + add2
		end
	end
	return weaponAdd,armorAdd
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] refreshPrinceAddition
-------------------------------------------------------------------------------
function f_game_left_top_panel:refreshPrinceAddition()
	local princeData = g_game.g_userInfoManager:getPrinceData()
	if princeData == nil then
		return 0,0
	end
	
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local battleAttNum = 0
	if battleList ~= nil then
		battleAttNum = #battleList
	end
	
	local atkAddition = 0
	local defAddition = 0
	
	for i = 1,battleAttNum do
		local add1,add2 = g_game.g_dictConfigManager:getPrinceAddition(battleList[i]["soldierType"])
	    atkAddition = atkAddition + add1
	    defAddition = defAddition + add2
	end
	
	return atkAddition,defAddition
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] refreshAtkDefToUser
-------------------------------------------------------------------------------
function f_game_left_top_panel:refreshAtkDefToUser(equipAtk,equipDef,combiAtk,combiDef,princeAtk,princeDef)
	local info = g_game.g_userInfoManager:getUserInfo()
	if info == nil then
		return 
	end
	
	local teamAtk,teamDef = self:getTeamAtkAndDef()
	teamAtk = teamAtk + equipAtk + combiAtk + princeAtk
	teamDef = teamDef + equipDef + combiDef + princeDef
	
	if teamAtk ~= info["attack"] then
		info["attack"] = math.floor(teamAtk)
	end
	
	if teamDef ~= info["defense"] then
		info["defense"] = math.floor(teamDef)
	end
	
	self.m_componentTable["flabel_attack"]:setString(math.floor(info["attack"]))
	self.m_componentTable["flabel_defense"]:setString(math.floor(info["defense"] ))
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] refersh
-- 刷新界面
-------------------------------------------------------------------------------
function f_game_left_top_panel:refersh()
	local info = g_game.g_userInfoManager:getUserInfo()
	if info == nil then
		return
	end
	
	self.m_componentTable["flabel_lv"]:setString("Lv." .. info["level"])
	self.m_componentTable["flabel_user_name"]:setString(info["name"] .. "【" .. g_game.g_userInfoManager:getHuangdiNianhao() .."】")
	
	self.m_componentTable["flabel_silver"]:setString(info["silver"])
	self.m_componentTable["flabel_gold"]:setString(info["gold"])
	--设置用户vip等级
	self.m_vipNumLabel:setTextWithInt(info["vipLevel"])	
	
	local limitStrength = g_game.g_dictConfigManager:getLimitStrength(info["level"])
	self.m_componentTable["tili_loading_bar"]:setPercent(info["strength"] / limitStrength * 100)
	self.m_componentTable["flabel_tili_num"]:setString(info["strength"] .. "/" .. limitStrength)
	
	--显示的精力要用 军令替掉
	local junling = info["military"]
	local limitJunling = g_game.g_dictConfigManager:getLimitJunling(info["level"])
	self.m_componentTable["jingli_loading_bar"]:setPercent(junling / limitJunling * 100)
	self.m_componentTable["flabel_jingli_num"]:setString(junling .. "/" .. limitJunling)
	
	--update exp
	self.m_componentTable["flabel_exp"]:setVisible(false)
	local expLimit = g_game.g_dictConfigManager:getLevelExpLimit(info["level"])
	self.m_componentTable["user_exp_bar"]:setPercent(info["exp"]/expLimit * 100)
	
	self:refreshAddtion()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_top_panel] refreshAddtion
-------------------------------------------------------------------------------
function f_game_left_top_panel:refreshAddtion()
	local equipAtk,equipDef = self:refreshEquipAddition()
	local combiAtk,combiDef = self:refreshCombiAddition()
	local princeAtk,princeDef = self:refreshPrinceAddition()
	self:refreshAtkDefToUser(equipAtk,equipDef,combiAtk,combiDef,princeAtk,princeDef)
end
