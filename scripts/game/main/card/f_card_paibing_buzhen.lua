require("scripts.auto.auto_paibing_card")
require("scripts.auto.auto_paibing_card_prop")
require("scripts.auto.auto_paibing_card_array_bottom")
require("scripts.game.main.card.f_card_mingchenxuanze_panel")
require("scripts.game.main.card.f_card_genghuanzhenrong")
require("scripts.game.main.card.f_card_mingchen_detail")
require("scripts.game.main.junjichu.f_mingchen_shengji_panel")
require("scripts.game.main.card.f_card_soldier_info")
require("scripts.game.main.card.f_card_skill_info")
require("scripts.game.main.jinjie.f_mingchen_jinjie")
require("scripts.game.main.common.f_jump_tip_popup")


--[[--
   排兵布阵  主界面
--]]--
local f_card_paibing_buzhen = class("f_card_paibing_buzhen", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_card_paibing_buzhen")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:ctor()
	self:registerNodeEvent()
	
	self.onSelect = function()
		self:updateCardInfo()
		self:updateTeamAtkAndDef()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP, self.onSelect)
	
	self.m_paibing_huangzi_cardTable = nil
	self.m_paibing_huangzi_cardPropTable = nil
	self.m_paibing_huangzi_bottomArrTable = nil
	
	self.m_card_head_list = nil
	
	self.m_combinationList = nil
	
	self.m_selectCardInfo = nil
	self.genghuanzhenrong_panel = nil
	
	self.m_lastAtk = -1
	self.m_lastDef = -1
	
	self.m_hasSecondSkill = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:registerNodeEvent(handler)
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
-- @function [parent=#f_card_paibing_buzhen] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] onEnter
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:onEnter()
    
    self.m_paibing_huangzi_cardTable = createpaibing_card()
	local paibing_card_panel = self.m_paibing_huangzi_cardTable["paibing_card"]
    self:appendComponent(paibing_card_panel)
    paibing_card_panel:setAnchorPoint(cc.p(0,1))
    paibing_card_panel:setPositionInContainer(cc.p(210,65))
    
    self.m_paibing_huangzi_cardPropTable = createpaibing_card_prop()
    local paibing_card_prop_panel = self.m_paibing_huangzi_cardPropTable["paibing_card_prop"]
    self:appendComponent(paibing_card_prop_panel)
    paibing_card_prop_panel:setAnchorPoint(cc.p(0,1))
    paibing_card_prop_panel:setPositionInContainer(cc.p(-2,
    90))
    
    self.m_paibing_huangzi_bottomArrTable = createpaibing_card_array_bottom()
	local paibing_card_arr_bottom_panel = self.m_paibing_huangzi_bottomArrTable["paibing_card_array_bottom"]
	self:appendComponent(paibing_card_arr_bottom_panel)
	paibing_card_arr_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
	paibing_card_arr_bottom_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    
    self:initAllComponent()
    
	self:updateCombination()
end

function f_card_paibing_buzhen:checkSkill(data)
	self.m_lockSkill = nil
	self.m_showLock = false
	
	self.m_hasSecondSkill = false
	
	local star = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
	if star < 3 or not g_game.g_dictConfigManager:isCardCanAdvance(data["officerId"]) then
		return
	end
	
	self.m_showLock = true
	local skills = g_game.g_dictConfigManager:getAdvanceSkill(data["officerId"])
	local adv = data["advanced"]
	local lvsT = g_game.g_dictConfigManager:getUnlockTianFuArr()
	for i = 1, 6 do
		if i < 3 and skills[i][4] == 8 and skills[i][5] == 2 then
			self.m_lockSkill = g_game.g_dictConfigManager:getLanTextById(skills[i][2])
		end
		
		if adv >= lvsT[i] and i < 3 then
			if skills[i][4] == 8 and skills[i][5] == 2 then
				self.m_hasSecondSkill = true
			end
		end	
	end
	if self.m_hasSecondSkill then
		self.m_lockSkill = nil
	end
end	

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] updateCombination
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:updateCombination()	

	if self.m_combinationList ~= nil then
		self:deleteComponent(self.m_combinationList)
	end
	self.m_combinationList = nil 

	self.m_combinationList = fc.FContainerList:create(1)
    self.m_combinationList:setSize(cc.size(180,200))
    self.m_combinationList:setAnchorPoint(cc.p(0,1))
    self:appendComponent(self.m_combinationList)
    self.m_combinationList:setPositionInContainer(cc.p(20,138))
    self.m_combinationList:enableClipping(true)
	self.m_combinationList:setListInfo(15, 3, 0, 178, 27);

	local combinationList = g_game.g_userInfoManager:getUserCombination()
    local num = combinationList["cardCombinaList_Num"]
    
    if self.m_selectCardInfo == nil then
    	return
    end
   
    local curCardCombinationArr = g_game.g_dictConfigManager:getCardCombinationArr(self.m_selectCardInfo["officerId"])
    
    for j = 1, #curCardCombinationArr do
    	local combiId = curCardCombinationArr[j] 
    	
    	if combiId ~= 0 then
	    	local bgContainer = fc.FContainerPanel:create()
	    	bgContainer:setSize(cc.size(178,27))
	    	
	    	local bgImage = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(12,12,2,2))
		    bgImage:setSize(cc.size(178,27))
		    bgImage:setAnchorPoint(cc.p(0.5,0.5))
		    bgContainer:appendComponent(bgImage)
		    bgImage:setPositionInContainer(cc.p(89,13))
		    
		    local textLabel = fc.FLabel:createBMFont()
		    textLabel:setFontSize(20)
		   	textLabel:setColor(cc.c3b(66,197,199))
		 	textLabel:setSize(cc.size(178,27))
		 	local str = g_game.g_dictConfigManager:getCombinationName(combiId)
		    textLabel:setString(str)
		 	textLabel:setAnchorPoint(cc.p(0.5,0.5))
		 	bgContainer:appendComponent(textLabel)
		 	textLabel:setPositionInContainer(cc.p(89,10))
		    
		    for i = 1 , num do
		    	local id = combinationList["cardCombinaList"][i]["combinaId"]
		    	if id == combiId then
		    		bgImage:setVisible(false)
		    		textLabel:setVisible(false)
		    		local bgImage2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang2.png",cc.rect(12,12,2,2))
				    bgImage2:setSize(cc.size(178,27))
				    bgImage2:setAnchorPoint(cc.p(0.5,0.5))
				    bgContainer:appendComponent(bgImage2)
				    bgImage2:setPositionInContainer(cc.p(89,13))
				    
				    local textLabel2 = fc.FLabel:createBMFont()
				    textLabel2:setFontSize(20)
				   	textLabel2:setColor(cc.c3b(0,255,255))
				 	textLabel2:setSize(cc.size(178,27))
				 	local str = g_game.g_dictConfigManager:getCombinationName(combiId)
				    textLabel2:setString(str)
				 	textLabel2:setAnchorPoint(cc.p(0.5,0.5))
				 	bgContainer:appendComponent(textLabel2)
				 	textLabel2:setPositionInContainer(cc.p(89,10))
		    	end
		    end
		    
		    self.m_combinationList:appendComponent(bgContainer)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] onExit
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:onExit()  
  self:unregisterNodeEvent()
  
  --移除注册的监听函数
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_TEAM_ATKDEF, self.event_updateTeamAtkDef)
	
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_EQUIPPOSITION, self.event_updateEuipAdd1)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.event_updateAdvance)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_CHANGE_BATTLE_ARR, self.event_updateZhenrong)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP, self.event_updateEquipLvup)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_COMBINATION, self.event_updateCombination)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP, self.onSelect)  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] onCleanup
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:initAllComponent()
	
	self:initCardHeadList()
	self:showDefaultCardInfo()   
	
  --向底部 list 设置更新选中时的 回调函数	
    local headListUpdateSelectInfoCallBack = function()
    	self:updateCardInfo()
    end
    self.m_card_head_list:setUpdateSelectInfoCallBack(headListUpdateSelectInfoCallBack)
    
  --向底部list 设置空位置时，点击跳转进入名臣界面 回调函数
    local headListJumpToMingChenCallBack = function()
    	self:popUpMingchenXuanzeUi()
    end
    self.m_card_head_list:setJumpToMingChenCallBack(headListJumpToMingChenCallBack)
--    
    --显示装备详情
    local itemPress1 = function()
   		self:showItemInfo(1)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardTable["item_panel_1"]:addHandleOfcomponentEvent(itemPress1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
  
    local itemPress2 = function()
   		self:showItemInfo(2)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardTable["item_panel_2"]:addHandleOfcomponentEvent(itemPress2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
    local itemPress3 = function()
  		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(7)
		if getOpenLv > g_game.g_userInfoManager:getUserLv() then
			local str = g_game.g_dictConfigManager:getLanTextById(437)
			local msg = getOpenLv .. str
			g_game.g_utilManager:showMsg(msg)
    	else
   			self:showItemInfo(5)
   		end
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardTable["item_panel_3"]:addHandleOfcomponentEvent(itemPress3,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
    --显示技能详情
    local skillInfoPress1 = function()
   		self:showCurSkillInfo(1)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardTable["skill_panel_1"]:addHandleOfcomponentEvent(skillInfoPress1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local skillInfoPress2 = function()
   		self:showCurSkillInfo(2)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardTable["skill_panel_2"]:addHandleOfcomponentEvent(skillInfoPress2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local skillInfoPress3 = function()
   		self:showCurSkillInfo(3)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardTable["skill_panel_3"]:addHandleOfcomponentEvent(skillInfoPress3,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

  --显示更换阵容界面回调
    local genghuan_zhenrongCallBack = function()
    	if g_game.g_utilManager:allGuidelinesIsFinish() then
	   		self:popUpGenghuanZhenrongUi()
	   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	   	end
    end
    self.m_paibing_huangzi_bottomArrTable["paibing_card_array_huanzhen_button"]:addHandleOfcomponentEvent(genghuan_zhenrongCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

 	--显示名臣选择界面
	local mingchen_xuanzeCallBack = function()
   		self:popUpMingchenXuanzeUi()
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_paibing_huangzi_cardPropTable["paibing_card_huanjiang_button"]:addHandleOfcomponentEvent(mingchen_xuanzeCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    --查看当前选中卡牌详情
    local popupCardDetail = function()
    	self:showCurrentCardDetail()
    end
    self.m_paibing_huangzi_cardPropTable["paibing_card_detail_button"]:addHandleOfcomponentEvent(popupCardDetail,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local checkoutCurSolderInfo = function()
    	if g_game.g_utilManager:allGuidelinesIsFinish() then
	    	self:showCurSoldierInfo()
	    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	    end
    end
    self.m_paibing_huangzi_cardTable["soldier_btn"]:addHandleOfcomponentEvent(checkoutCurSolderInfo,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    --显示升级
	local showShengji = function()
		self:showShengji()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_paibing_huangzi_cardTable["paibing_card_shengji_button"]:addHandleOfcomponentEvent(showShengji,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local showJinJie = function()
		self:showJinJie()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_paibing_huangzi_cardTable["btn_advance"]:addHandleOfcomponentEvent(showJinJie,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--注册名臣升级回调，重新显示经验和等级
	self.event_updateMingchenShengji = function()
--		self:reShowMingchenInfo()
		self:updateCardInfo()
		self:updateList()
		self:updateTeamAtkAndDef()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)
    
    --注册 组合更新
	self.event_updateCombination = function()
		self:updateCombination()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_COMBINATION, self.event_updateCombination)
  
  	--注册更新 更换阵容
  	self.event_updateZhenrong = function()
		self:updateZhenrong()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CHANGE_BATTLE_ARR, self.event_updateZhenrong)
  
  	self.event_updateEquipLvup = function()
  		self:updateCardInfo()
  		self:updateTeamAtkAndDef()
  	end
  	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP, self.event_updateEquipLvup)
  	
	self.event_updateAdvance = function()
  		self:updateCardInfo()
  		self:updateTeamAtkAndDef()
  	end
    g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.event_updateAdvance)

	self.event_updateEuipAdd1  = function()
		self:updateList()
		self:updateCardInfo()
		self:updateTeamAtkAndDef()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_EQUIPPOSITION, self.event_updateEuipAdd1)
	
	self.event_updateTeamAtkDef  = function()
		self:updateTeamAtkAndDef()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_TEAM_ATKDEF, self.event_updateTeamAtkDef)
	
	self.m_attAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_attAnim:setup(self.m_paibing_huangzi_cardTable["flabel_paibing_zong_gongji_num"], 42, "%d", true, true)
	self.m_paibing_huangzi_cardTable["paibing_card_panel"]:appendComponent(self.m_attAnim)
	local p = self.m_paibing_huangzi_cardTable["flabel_paibing_zong_gongji_num"]:getPositionInContainer()
--	p.x = p.x - 10
	self.m_attAnim:setPositionInContainer(p)
	
	self.m_defAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_defAnim:setup(self.m_paibing_huangzi_cardTable["flabel_paibing_zong_fangyu_num"], 42, "%d", true, true)
	self.m_paibing_huangzi_cardTable["paibing_card_panel"]:appendComponent(self.m_defAnim)
	p = self.m_paibing_huangzi_cardTable["flabel_paibing_zong_fangyu_num"]:getPositionInContainer()
--	p.x = p.x - 10
	self.m_defAnim:setPositionInContainer(p)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showItemInfo
-- 显示当前装备详情
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showItemInfo(type)
	local data = nil
	if type == 1 then
		data = self.m_weapon
	elseif type == 2 then
		data = self.m_armor
	elseif type == 5 then
		data = self.m_bingfa
	end
	g_game.g_userInfoManager.m_changeEquipPosition = self.m_card_head_list:getSelectCard():getIndexInList()
	if data ~= nil then
		require("scripts.game.main.equipBag.f_equipDetial_panel")
		local panel = f_equipDetial_panel.static_create()
		panel:panelInitBeforePopup(data, true)
		g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
	else
		local equipTable = {}
		if type == 1 then
			equipTable = g_game.g_userInfoManager:getWeaponList(false)
		elseif type == 2 then
			equipTable = g_game.g_userInfoManager:getArmorList(false)
		elseif type == 5 then
			equipTable = g_game.g_userInfoManager:getBingfaList(false)
		end
		if equipTable == nil or #equipTable <= 0 then
			local panel = f_jump_tip_popup.static_create()
			panel:setPanelByType(10)
			local leftBtnCallback = function()
				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			end
			local rightBtnCallback = function()
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
			panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
			g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		else
			g_game.g_userInfoManager.m_changeEquipData = data
			require("scripts.game.main.equipBag.f_game_equip_bag_panel")
			local equipPanel = f_game_equip_bag_panel.static_create()
		    equipPanel:panelInitBeforePopup(type, true)
			g_game.g_panelManager:showUiPanel(equipPanel,"user_equip_bag_panel")
		end
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showCurSkillInfo
-- 显示当前技能详情
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showCurSkillInfo(type)
	if self.m_selectCardInfo == nil then return end
	
	local skillIdGroup = g_game.g_dictConfigManager:getOfficerSkillIdGroup(self.m_selectCardInfo["officerId"])
	
	if skillIdGroup[type] ~= 0 then
		local skillInfo = g_game.g_panelManager:getUiPanel("skill_info_panel")
		if skillInfo ~= nil then
			return
		end
		
	    skillInfo = f_card_skill_info.static_create()
	    skillInfo:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(skillInfo,"skill_info_panel")
		if type == 2 then
			skillInfo:setLock(not self.m_hasSecondSkill, self.m_lockSkill)
		else
			skillInfo:setLock(false, nil)
		end
		skillInfo:setData(skillIdGroup[type])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showCurSoldierInfo
-- 显示当前 兵种详情
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showCurSoldierInfo()
	if self.m_selectCardInfo == nil then return end
	
	local soldierInfo = g_game.g_panelManager:getUiPanel("soldier_info_panel")
	if soldierInfo ~= nil then
		return
	end
	
	soldierInfo = f_card_soldier_info.static_create()
    soldierInfo:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(soldierInfo,"soldier_info_panel")
	soldierInfo:setData(self.m_selectCardInfo)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] reShowMingchenInfo
-- 重新显示经验等级（名臣升级更新）
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:reShowMingchenInfo()
	--获取到目标名臣
	local targetMingchenData = self.m_card_head_list:getSelectCard():getData()
	--获取到当前名臣信息
	local battleList   = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local data = nil

	for i = 1, #battleList do
		if battleList[i]["id"] == targetMingchenData["id"] then
			data = battleList[i]
			break
		end		
	end
	if data ~= nil then
		self.m_paibing_huangzi_cardTable["flabel_card_lv"]:setString(data["officerLevel"])
	   
	   self.m_paibing_huangzi_cardTable["flabel_attack_num"]:setString(data["attack"])
   	   self.m_paibing_huangzi_cardTable["flabel_defense_num"]:setString(data["defense"])
	   
	   targetMingchenData["officerLevel"] = data["officerLevel"]
	   targetMingchenData["officerExp"]   = data["officerExp"]
	   targetMingchenData["attack"]   = data["attack"]
	   targetMingchenData["defense"]   = data["defense"]
	end   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showShengji
-- 升级当前卡牌
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showShengji()
	--获取到目标名臣
	local targetMingchenData = self.m_card_head_list:getSelectCard():getData()
	--获取到当前名臣信息
	local battleList   =g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local data = nil
	
	for i = 1, #battleList do
		if battleList[i]["id"] == targetMingchenData["id"] then
			data = battleList[i]
			break
		end
	end

    if data ~= nil then
		local mingchen_shengji_panel = f_mingchen_shengji_panel.static_create()	
		mingchen_shengji_panel:panelInitBeforePopup()
		mingchen_shengji_panel:setTargetMingchenData(data)
		mingchen_shengji_panel:setType(1)
		g_game.g_panelManager:showUiPanel(mingchen_shengji_panel, "mingchen_shengji")
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showJinJie
-- 进阶当前卡牌
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showJinJie()
	--获取到目标名臣
	local targetMingchenData = self.m_card_head_list:getSelectCard():getData()
	--获取到当前名臣信息
	local battleList   = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	local data = nil
	
	for i = 1, #battleList do
		if battleList[i]["id"] == targetMingchenData["id"] then
			data = battleList[i]
			break
		end
	end

    if data ~= nil then
		if 10 > g_game.g_userInfoManager:getUserLv() then
			local str = g_game.g_dictConfigManager:getLanTextById(440)
			g_game.g_utilManager:showMsg(str)
			return
		end
    	local star = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
		if star < 3 then
			local str = g_game.g_dictConfigManager:getLanTextById(425)
			g_game.g_utilManager:showMsg(str)
			return
		end
		if not g_game.g_dictConfigManager:isCardCanAdvance(data["officerId"]) then
			local str = g_game.g_dictConfigManager:getLanTextById(426)
			g_game.g_utilManager:showMsg(str)
			return
		end
		if data["advanced"] >= g_game.g_dictConfigManager:getMaxAdvanceLevel() then
			local str = g_game.g_dictConfigManager:getLanTextById(360)
			g_game.g_utilManager:showMsg(str)
			return
		end
		local panel = f_mingchen_jinjie.static_create()	
		panel:panelInitBeforePopup()
		panel:setData(data)
		g_game.g_panelManager:showUiPanel(panel, "jin_jie")
	end	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showCurrentCardDetail
-- 查看当前 card的 详情
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showCurrentCardDetail()
	
--	self.m_paibing_huangzi_cardTable["card_select_rect_image"]:setVisible(false)
	
	local detailPanel = f_card_mingchen_detail.static_create()
    detailPanel:panelInitBeforePopup()
    local data = self.m_card_head_list:getSelectCard():getData()
    detailPanel:setDetail(data)
	g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] showDefaultCardInfo
-- 显示阵容里默认第一张卡牌的数据
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:showDefaultCardInfo()
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	
	self.m_paibing_huangzi_cardTable["card_image"]:setVisible(false)
	if battleList[1] == nil then
		return
	end
	
	self.m_selectCardInfo = battleList[1]
	if LANGUAGE_TYPE == 3 then
		self.m_paibing_huangzi_cardTable["guanzhi"]:setString(g_game.g_advance_level_name2[self.m_selectCardInfo["advanced"]])
	else
		self.m_paibing_huangzi_cardTable["guanzhi"]:setString(g_game.g_advance_level_name1[self.m_selectCardInfo["advanced"]])
	end
	self.m_weapon, self.m_armor, self.m_bingfa = g_game.g_userInfoManager:getEquipForCard(1)
	self.m_paibing_huangzi_cardTable["equipLV1"]:setAlignment(2)
	self.m_paibing_huangzi_cardTable["equipLV2"]:setAlignment(2)
	self.m_paibing_huangzi_cardTable["equipLV3"]:setAlignment(2)
	
	--使用装备加号显示
	local hasw, hasa, hasb = g_game.g_userInfoManager:hasUnusedEquipForCard()
	self.m_paibing_huangzi_cardTable["plus_img_1"]:setVisible(hasw)
	self.m_paibing_huangzi_cardTable["label_kezhuangbei1"]:setVisible(hasw)
	self.m_paibing_huangzi_cardTable["plus_img_2"]:setVisible(hasa)
	self.m_paibing_huangzi_cardTable["label_kezhuangbei2"]:setVisible(hasa)
	
	if self.m_weapon ~= nil then
		self.m_paibing_huangzi_cardTable["item_1"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV1"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equip_frame1"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV1"]:setString(self.m_weapon["equip_level"])
		self.m_paibing_huangzi_cardTable["equip_frame1"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(self.m_weapon["equip_id"])])
		self.m_paibing_huangzi_cardTable["item_1"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(self.m_weapon["equip_id"])))
	else
		self.m_paibing_huangzi_cardTable["item_1"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equip_frame1"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equipLV1"]:setVisible(false)
	end
	
	if self.m_armor ~= nil then
		self.m_paibing_huangzi_cardTable["item_2"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV2"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equip_frame2"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV2"]:setString(self.m_armor["equip_level"])
		self.m_paibing_huangzi_cardTable["equip_frame2"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(self.m_armor["equip_id"])])
		self.m_paibing_huangzi_cardTable["item_2"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(self.m_armor["equip_id"])))
	else
		self.m_paibing_huangzi_cardTable["item_2"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equipLV2"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equip_frame2"]:setVisible(false)
	end
	
--	self.m_paibing_huangzi_cardTable["kaiqi_text1"]:setVisible(false)
--	self.m_paibing_huangzi_cardTable["kaiqi_text2"]:setVisible(false)
	
	if self.m_bingfa ~= nil then
		self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["item_3"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV3"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equip_frame3"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV3"]:setString(self.m_bingfa["equip_level"])
		self.m_paibing_huangzi_cardTable["equip_frame3"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(self.m_bingfa["equip_id"])])
		self.m_paibing_huangzi_cardTable["item_3"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(self.m_bingfa["equip_id"])))
	else
		self.m_paibing_huangzi_cardTable["item_3"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equip_frame3"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equipLV3"]:setVisible(false)
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(7)
		if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
			self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setVisible(false)
			self.m_paibing_huangzi_cardTable["plus_img_3"]:setVisible(hasb)
			self.m_paibing_huangzi_cardTable["label_kezhuangbei3"]:setVisible(hasb)
		else
			self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setVisible(true)
			if LANGUAGE_TYPE == 3 then
				self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setString(getOpenLv .. "級\n開啟")
			else
				self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setString(getOpenLv .. "级\n开启")
			end
			self.m_paibing_huangzi_cardTable["label_kezhuangbei3"]:setVisible(false)
			self.m_paibing_huangzi_cardTable["plus_img_3"]:setVisible(false)
		end
	end
	
	
	local  officerId = self.m_selectCardInfo["officerId"]
	local  officerQuality = g_game.g_dictConfigManager:getCardQuality(officerId)
	local  cardLv = self.m_selectCardInfo["officerLevel"]
	local  attack = self.m_selectCardInfo["attack"]
	local  defense = self.m_selectCardInfo["defense"]
    local  cardName = g_game.g_dictConfigManager:getCardName(officerId)
    
    --获取加成
    local atkAdd,defAdd = g_game.g_dictConfigManager:getCardAddition(1,self.m_selectCardInfo)
    
    --不显示额外加成了
    self.m_paibing_huangzi_cardTable["add_1"]:setVisible(false)
    self.m_paibing_huangzi_cardTable["add_2"]:setVisible(false)
    self.m_paibing_huangzi_cardTable["flabel_attack_num"]:setString(tostring(math.floor(attack+atkAdd)))
    self.m_paibing_huangzi_cardTable["flabel_defense_num"]:setString(tostring(math.floor(defense+defAdd)))
--    if atkAdd  ~= 0 then
--		self.m_paibing_huangzi_cardTable["add_1"]:setVisible(true)
--		self.m_paibing_huangzi_cardTable["add_1"]:setString("+"..atkAdd)
--	else
--		self.m_paibing_huangzi_cardTable["add_1"]:setVisible(false)
--	end
--    
--    if defAdd ~= 0 then
--    	self.m_paibing_huangzi_cardTable["add_2"]:setVisible(true)
--    	self.m_paibing_huangzi_cardTable["add_2"]:setString("+"..defAdd)
--    else
--    	self.m_paibing_huangzi_cardTable["add_2"]:setVisible(false)
--    end
    
    local skillIdGroup = g_game.g_dictConfigManager:getOfficerSkillIdGroup(officerId)
    for i= 1, #skillIdGroup do
    	if skillIdGroup[i] ~= 0 then
    		local skillIconName = g_game.g_dictConfigManager:getSkillIcon(skillIdGroup[i])
    		local skillIconRes = g_game.g_resourceManager:getSkillIconImage(skillIconName)
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setImage(skillIconRes)
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setSize(cc.size(90,90))
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setVisible(true)
    		self.m_paibing_huangzi_cardTable["skill_frame"..i]:setVisible(true)
    		self.m_paibing_huangzi_cardTable["skill_frame"..i]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getSkillQuality(skillIdGroup[i])])
    	else
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setVisible(false)
    		self.m_paibing_huangzi_cardTable["skill_frame"..i]:setVisible(false)
    	end
    	self.m_paibing_huangzi_cardTable["skillLocak" .. i]:setVisible(false)
    end
    
    self:checkSkill(self.m_selectCardInfo)
    self.m_paibing_huangzi_cardTable["skillLocak2"]:setVisible(not self.m_hasSecondSkill and self.m_showLock)
    if self.m_hasSecondSkill then
		self.m_paibing_huangzi_cardTable["skill_2"]:setOpacity(255)
	else
		self.m_paibing_huangzi_cardTable["skill_2"]:setOpacity(128)
	end
  
	if officerId ~= nil then
		local cardRes = g_game.g_dictConfigManager:getCardFile(officerId)
		local cardImage = g_game.g_resourceManager:getCard(cardRes)
		
		local soldierType = self.m_selectCardInfo["soldierType"]
		
		local sinfo = g_game.g_dictConfigManager:getSoldierInfo(self.m_selectCardInfo["officerId"], self.m_selectCardInfo["advanced"])
		self.m_paibing_huangzi_cardTable["soldier_btn"]:setButtonImage("nobatch/" .. sinfo[14])
		self.m_paibing_huangzi_cardTable["card_image"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["card_image"]:setImage(cardImage)
		self.m_paibing_huangzi_cardTable["card_image"]:setSize(cc.size(465,350))
		--310 350
		
	end
   
   self.m_paibing_huangzi_cardTable["flabel_card_lv"]:setString(cardLv)
   
   self.m_paibing_huangzi_cardTable["flabel_card_name"]:setString(cardName)
   
   for i = 1, 5 do
   	   if i <= officerQuality then
   	     self.m_paibing_huangzi_cardTable["star"..i]:setVisible(true)
   	   else
   	     self.m_paibing_huangzi_cardTable["star"..i]:setVisible(false)
   	   end
   end
   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] updateList
-- 更新下排的list
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:updateList()
	local userLevel = g_game.g_userInfoManager:getLevel()
	local openedNum = g_game.g_dictConfigManager:getOpenedCardNum(userLevel)
	local createNum = openedNum+1
	
	local num1,num2,num3 = g_game.g_dictConfigManager:getMaxLimitNum()
	if createNum > num1 then
		createNum = num1
	end
	
	self.m_card_head_list:fillData(createNum, openedNum)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] updateCardInfo
-- 显示阵容里默认第一张卡牌的数据
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:updateCardInfo()
	local curSelectCard = self.m_card_head_list:getSelectCard()
		
	self.m_selectCardInfo = curSelectCard.m_data
	local curSelectCardInfo = curSelectCard.m_data

	
	self.m_weapon, self.m_armor, self.m_bingfa = g_game.g_userInfoManager:getEquipForCard(curSelectCard:getIndexInList())
	if LANGUAGE_TYPE == 3 then
		self.m_paibing_huangzi_cardTable["guanzhi"]:setString(g_game.g_advance_level_name2[curSelectCardInfo["advanced"]])
	else
		self.m_paibing_huangzi_cardTable["guanzhi"]:setString(g_game.g_advance_level_name1[curSelectCardInfo["advanced"]])
	end
	
	self.m_paibing_huangzi_cardTable["equipLV1"]:setAlignment(2)
	self.m_paibing_huangzi_cardTable["equipLV2"]:setAlignment(2)
	self.m_paibing_huangzi_cardTable["equipLV3"]:setAlignment(2)
	
	--使用装备加号显示
	local hasw, hasa, hasb = g_game.g_userInfoManager:hasUnusedEquipForCard()
	self.m_paibing_huangzi_cardTable["plus_img_1"]:setVisible(hasw)
	self.m_paibing_huangzi_cardTable["label_kezhuangbei1"]:setVisible(hasw)
	self.m_paibing_huangzi_cardTable["plus_img_2"]:setVisible(hasa)
	self.m_paibing_huangzi_cardTable["label_kezhuangbei2"]:setVisible(hasa)
	
	if self.m_weapon ~= nil then
		self.m_paibing_huangzi_cardTable["item_1"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV1"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equip_frame1"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV1"]:setString(self.m_weapon["equip_level"])
		self.m_paibing_huangzi_cardTable["equip_frame1"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(self.m_weapon["equip_id"])])
		self.m_paibing_huangzi_cardTable["item_1"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(self.m_weapon["equip_id"])))
	else
		self.m_paibing_huangzi_cardTable["item_1"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equip_frame1"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equipLV1"]:setVisible(false)
	end
	
	if self.m_armor ~= nil then
		self.m_paibing_huangzi_cardTable["item_2"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV2"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equip_frame2"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV2"]:setString(self.m_armor["equip_level"])
		self.m_paibing_huangzi_cardTable["equip_frame2"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(self.m_armor["equip_id"])])
		self.m_paibing_huangzi_cardTable["item_2"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(self.m_armor["equip_id"])))
	else
		self.m_paibing_huangzi_cardTable["item_2"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equip_frame2"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equipLV2"]:setVisible(false)
	end
--	self.m_paibing_huangzi_cardTable["kaiqi_text1"]:setVisible(false)
--	self.m_paibing_huangzi_cardTable["kaiqi_text2"]:setVisible(false)
	
	if self.m_bingfa ~= nil then
		self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["item_3"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV3"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equip_frame3"]:setVisible(true)
		self.m_paibing_huangzi_cardTable["equipLV3"]:setString(self.m_bingfa["equip_level"])
		self.m_paibing_huangzi_cardTable["equip_frame3"]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getEquipStar(self.m_bingfa["equip_id"])])
		self.m_paibing_huangzi_cardTable["item_3"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(self.m_bingfa["equip_id"])))
	else
		self.m_paibing_huangzi_cardTable["item_3"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equip_frame3"]:setVisible(false)
		self.m_paibing_huangzi_cardTable["equipLV3"]:setVisible(false)
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(7)
		if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
			self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setVisible(false)
			self.m_paibing_huangzi_cardTable["plus_img_3"]:setVisible(hasb)
			self.m_paibing_huangzi_cardTable["label_kezhuangbei3"]:setVisible(hasb)
		else
			self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setVisible(true)
			if LANGUAGE_TYPE == 3 then
				self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setString(getOpenLv .. "級\n開啟")
			else
				self.m_paibing_huangzi_cardTable["kaiqi_text3"]:setString(getOpenLv .. "级\n开启")
			end
			self.m_paibing_huangzi_cardTable["label_kezhuangbei3"]:setVisible(false)
			self.m_paibing_huangzi_cardTable["plus_img_3"]:setVisible(false)
		end
	end
	
    local cardRes = g_game.g_dictConfigManager:getCardFile(curSelectCardInfo["officerId"])
    local soldierType = curSelectCardInfo["soldierType"]
	local cardName = g_game.g_dictConfigManager:getCardName(curSelectCardInfo["officerId"])
	
	local cardImage = g_game.g_resourceManager:getCard(cardRes)
	
	local cardLv = curSelectCardInfo["officerLevel"]
    local attack = curSelectCardInfo["attack"]
	local defense = curSelectCardInfo["defense"]
	local officerQuality = g_game.g_dictConfigManager:getCardQuality(curSelectCardInfo["officerId"])
	
	self.m_paibing_huangzi_cardTable["card_image"]:setImage(cardImage)
	self.m_paibing_huangzi_cardTable["card_image"]:setSize(cc.size(465,350))
	
	local skillIdGroup = g_game.g_dictConfigManager:getOfficerSkillIdGroup(curSelectCardInfo["officerId"])
    for i= 1, #skillIdGroup do
    	if skillIdGroup[i] ~= 0 then
    		local skillIconName = g_game.g_dictConfigManager:getSkillIcon(skillIdGroup[i])
    		local skillIconRes = g_game.g_resourceManager:getSkillIconImage(skillIconName)
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setImage(skillIconRes)
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setSize(cc.size(90,90))
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setVisible(true)
    		self.m_paibing_huangzi_cardTable["skill_frame"..i]:setVisible(true)
    		self.m_paibing_huangzi_cardTable["skill_frame"..i]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getSkillQuality(skillIdGroup[i])])
    	else
    		self.m_paibing_huangzi_cardTable["skill_"..i]:setVisible(false)
    		self.m_paibing_huangzi_cardTable["skill_frame"..i]:setVisible(false)
    	end
    	self.m_paibing_huangzi_cardTable["skillLocak" .. i]:setVisible(false)
    end
    self:checkSkill(self.m_selectCardInfo)
    self.m_paibing_huangzi_cardTable["skillLocak2"]:setVisible(not self.m_hasSecondSkill and self.m_showLock)
    if self.m_hasSecondSkill then
		self.m_paibing_huangzi_cardTable["skill_2"]:setOpacity(255)
	else
		self.m_paibing_huangzi_cardTable["skill_2"]:setOpacity(128)
	end
	
	--显示兵种 icon	
	local sinfo = g_game.g_dictConfigManager:getSoldierInfo(curSelectCardInfo["officerId"], curSelectCardInfo["advanced"])
	self.m_paibing_huangzi_cardTable["soldier_btn"]:setButtonImage("nobatch/" .. sinfo[14])
	
    self.m_paibing_huangzi_cardTable["flabel_card_lv"]:setString(cardLv)
    
    self.m_paibing_huangzi_cardTable["flabel_card_name"]:setString(cardName)
   
    for i = 1, 5 do
   	   if i <= officerQuality then
   	     self.m_paibing_huangzi_cardTable["star"..i]:setVisible(true)
   	   else
   	     self.m_paibing_huangzi_cardTable["star"..i]:setVisible(false)
   	   end
    end
    
    local atkAdd,defAdd = g_game.g_dictConfigManager:getCardAddition(curSelectCard:getIndexInList(),curSelectCardInfo)
	--不显示额外加成值
	self.m_paibing_huangzi_cardTable["add_1"]:setVisible(false)
	self.m_paibing_huangzi_cardTable["add_2"]:setVisible(false)
	
	self.m_paibing_huangzi_cardTable["flabel_attack_num"]:setString(tostring(math.floor(attack+atkAdd)))
    self.m_paibing_huangzi_cardTable["flabel_defense_num"]:setString(tostring(math.floor(defense+defAdd)))
--    if atkAdd  ~= 0 then
--		self.m_paibing_huangzi_cardTable["add_1"]:setVisible(true)
--		self.m_paibing_huangzi_cardTable["add_1"]:setString("+"..atkAdd)
--	else
--		self.m_paibing_huangzi_cardTable["add_1"]:setVisible(false)
--	end
--    
--    if defAdd ~= 0 then
--    	self.m_paibing_huangzi_cardTable["add_2"]:setVisible(true)
--    	self.m_paibing_huangzi_cardTable["add_2"]:setString("+"..defAdd)
--    else
--    	self.m_paibing_huangzi_cardTable["add_2"]:setVisible(false)
--    end
	
	self:updateCombination()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] initCardHeadList
-- 初始化list，添加到界面
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:initCardHeadList()
	self.m_paibing_huangzi_bottomArrTable["paibing_card_array_bg_image"]:setComponentZOrder(3)
	self.m_paibing_huangzi_bottomArrTable["paibing_card_array_huanzhen_button"]:setComponentZOrder(4)
	self.m_paibing_huangzi_bottomArrTable["pb_huan_uizi"]:setComponentZOrder(4)
	self.m_paibing_huangzi_bottomArrTable["pb_zhen_uizi"]:setComponentZOrder(4)
	self.m_paibing_huangzi_bottomArrTable["jiang_imag"]:setComponentZOrder(4)
	
	self.m_card_head_list = require("scripts.game.main.card.fluacardheadlist").new()	
	self.m_paibing_huangzi_bottomArrTable["paibing_card_array_bottom"]:appendComponent(self.m_card_head_list)
	self.m_card_head_list:setSize(cc.size(807,102))
	self.m_card_head_list:setListInfo(1, 0, 30, 104, 104)
	self.m_card_head_list:enableClipping(true)
	self.m_card_head_list:setAnchorPoint(cc.p(0,1))
	self.m_card_head_list:setPositionInContainer(cc.p(140, 510))	
	self.m_card_head_list:setComponentZOrder(2)
	
	self:updateTeamAtkAndDef()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] updateTeamAtkAndDef
-- 刷新当前阵容整体的 攻击力 和防御力显示
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:updateTeamAtkAndDef()
	local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
	
	local allAtk = 0
	local allDef = 0
	
	for i = 1 , table.getn(battleList) do
		local atkAddition,defAddition =g_game.g_dictConfigManager:getCardAddition(i,battleList[i])
		allAtk = allAtk + battleList[i]["attack"] + atkAddition
		allDef = allDef + battleList[i]["defense"] + defAddition
	end
	
	allAtk = math.floor(allAtk)
	allDef = math.floor(allDef)
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["attack"] = allAtk
	userInfo["defense"] = allDef
	
	
	if self.m_lastAtk > 0 and self.m_lastAtk < allAtk then
		self.m_attAnim:play(self.m_lastAtk, allAtk, 1)
	else
		self.m_paibing_huangzi_cardTable["flabel_paibing_zong_gongji_num"]:setString("".. allAtk)
	end
	
	if self.m_lastDef > 0 and self.m_lastDef < allDef then
		self.m_defAnim:play(self.m_lastDef, allDef, 1)
	else
		self.m_paibing_huangzi_cardTable["flabel_paibing_zong_fangyu_num"]:setString("".. allDef)
	end
	
	self.m_lastAtk = allAtk
	self.m_lastDef = allDef
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] popUpMingchenXuanzeUi
-- 显示名臣
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:popUpMingchenXuanzeUi()
	local unBattleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR)
	local noBattleNum = #unBattleList
	if noBattleNum <= 0 then
		local panel = f_jump_tip_popup.static_create()
		panel:setPanelByType(9)
		local leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		local rightBtnCallback = function()
			g_game.g_panelManager:removeAllUiPanel()
			g_game.g_utilManager:enterShop(1)
		end
		panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
	else
		--更换名臣面板
		local mingchenxuanze_panel = f_card_mingchenxuanze_panel.static_create()
		mingchenxuanze_panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(mingchenxuanze_panel,"mingchenxuanze_title")
		local selectCard = self.m_card_head_list:getSelectCard()
	    mingchenxuanze_panel:setTargetExchangeCard(selectCard)
	    mingchenxuanze_panel:updateTeamAtkAndDef(nil)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] genghuan_zhenrong pop up
-- 显示 更换阵容面板
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:popUpGenghuanZhenrongUi()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	--更换阵容面板
    self.genghuanzhenrong_panel = f_card_genghuanzhenrong.static_create()
    self.genghuanzhenrong_panel:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(self.genghuanzhenrong_panel,"genghuanzhenrong")
    self.genghuanzhenrong_panel:setCurrentBattleArrIndex(userInfo["curr_battle"])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] removeHuanZhenPanel
-- 删除换阵界面
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:removeHuanZhenPanel()
	g_game.g_panelManager:removeUiPanel("genghuanzhenrong")
	self:updateList()
	self:updateCardInfo()
	self:updateTeamAtkAndDef()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] closePopUpBuzhen
-- 删除名臣 界面
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:removeMingchanPanel()
	g_game.g_panelManager:removeUiPanel("mingchenxuanze_title")
	
	local selectCard = self.m_card_head_list:getSelectCard()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI2)
	
	self:updateCardInfo()
	self:updateTeamAtkAndDef()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] updateOfficerViewToDefault
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:updateOfficerViewToDefault()
	self.m_card_head_list:setSelectToFirst()
	self:updateList()
	self:showDefaultCardInfo()
	self:updateTeamAtkAndDef()
	self:updateCombination()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_buzhen] updateZhenrong
-- 删除更换阵容界面
-------------------------------------------------------------------------------
function f_card_paibing_buzhen:updateZhenrong()
	g_game.g_panelManager:removeUiPanel("genghuanzhenrong")
	--当前阵容
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local curBattleIndex = userInfo["curr_battle"]
	
	if curBattleIndex == 1 then
		userInfo["curr_battle"] = 2
	else
		userInfo["curr_battle"] = 1
	end
	self.m_card_head_list:setSelectToFirst()
	self:updateList()
	self:updateCardInfo()
	self:updateTeamAtkAndDef()
	
end

return f_card_paibing_buzhen