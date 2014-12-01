--[[--
   皇帝升级面板
--]]--
f_battle_emperor_lvup = class("f_battle_emperor_lvup")
f_battle_emperor_lvup.__index = f_battle_emperor_lvup

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_emperor_lvup.static_create()
	local emperorPop = g_game.g_panelManager:create_panel("pve_emperor_lvup")
	local emperorPanel = emperorPop["pve_emperor_lvup"]
	  
	local funTable = {}
	tolua.setpeer(emperorPanel, funTable)
	setmetatable(funTable, f_battle_emperor_lvup)
	
	emperorPanel.m_componentTable = emperorPop
	return emperorPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_battleManager = nil
	self.m_positionType = 0
	
	self.m_show_action_is_finish = false
	
	
	self.TYPE_BATTLE = 1
	self.TYPE_REPORT = 2
	self.TYPE_SAODANG = 3
	self.TYPE_NONE = 4
	self.m_lvupType = self.TYPE_NONE
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] showActionIsFinish
-- 新手引导，面板显示action完成标志位
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:showActionIsFinish()
	return self.m_show_action_is_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] lvupType
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:lvupType()
	return	self.m_lvupType
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_emperor_lvup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] onEnter
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:onEnter()
	-- 升级时候将奏章批阅次数加满
	g_game.g_userInfoManager:setZouZhangFullNum()
--	print("升级后奏章：", g_game.g_userInfoManager:getLeftReportsNum())
	
	self.m_componentTable["bg_panel"]:setComponentZOrder(100)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGDISHENGJI)
	
	local showShengjiAnim = function()
		local shengjiAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		shengjiAnim:setSize(cc.size(200,200))
		self:appendComponent(shengjiAnim)
		shengjiAnim:setPositionInContainer(cc.p(self:getSize().width/2,100))
		shengjiAnim:setLoop(false)
		shengjiAnim:setComponentZOrder(101)
		shengjiAnim:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[3])
		
		self.m_show_action_is_finish = true
	end

	local shining =  g_game.g_classFactory.newFLuaAnimationComponent("FAC")
  	self:appendComponent(shining)
	shining:setPositionInContainer(cc.p(self:getSize().width/2, self:getSize().height/2))
	shining:setAnimationScale(1.0)
	shining:setLoop(true)
	shining:setComponentZOrder(99)
	shining:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[2],g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[8])
	
	shining:setScale(0.1)
	local actionTo1 = CCScaleTo:create(0.3,1)
	local actions = g_game.g_transition.sequence({cc.EaseBackOut:create(actionTo1),cc.CallFunc:create(showShengjiAnim)})
	shining:runAction(actions)
	
	self:initAllComponent()	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] setSaoDangPosType
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:setSaoDangPosType(type,userLv,userStrength,userMilitary,userEnergy)
	self.m_lvupType = self.TYPE_SAODANG
	self.m_positionType = type
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local preLv = g_game.g_userInfoManager:getLevel()
	local curLv = userLv

	if type == 0 then
		self.m_componentTable["mingchen_label"]:setVisible(false)
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("卡牌與裝備等級上限也提升了哦")
		else
			self.m_componentTable["tip_label"]:setString("卡牌与装备等级上限也提升了哦")
		end
		self.m_componentTable["mingchen_detail"]:setVisible(false)
		self.m_componentTable["yes_btn"]:setVisible(true)
		self.m_componentTable["qianwang_text_btn"]:setVisible(false)
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("名臣陣容有變化，可前往查看")
		else
			self.m_componentTable["tip_label"]:setString("名臣阵容有变化，可前往查看")
		end
		self.m_componentTable["yes_btn"]:setVisible(false)
		self.m_componentTable["qianwang_text_btn"]:setVisible(true)
	end
	
	self.m_componentTable["lv_detail"]:setString(preLv .. "→"..curLv)
	local preLiangcao = userInfo["strength"]
	local curLiangcao = userStrength
	local addLiangcao = curLiangcao - preLiangcao
	self.m_componentTable["liangcao_detail"]:setString("+"..g_game.g_dictConfigManager:getStrengthRecover(curLv))
	
	local preJunling = userInfo["military"]
	local curJunling = userMilitary
	local addJunling = curJunling - preJunling
	self.m_componentTable["junling_detail"]:setString("+"..g_game.g_dictConfigManager:getJunlingRecover(curLv))
	
	local preJingli = userInfo["energy"]
	local curJingli = userEnergy
	local addJingli = curJingli - preJingli
	self.m_componentTable["jingli_detail"]:setString("+"..g_game.g_dictConfigManager:getEnergyRecover(curLv))
	
	if self.m_positionType == 1 then--名臣
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("名臣陣容有變化，可前往查看")
		else
			self.m_componentTable["tip_label"]:setString("名臣阵容有变化，可前往查看")
		end
		
		local str2 = g_game.g_dictConfigManager:getLanTextById(197)
		self.m_componentTable["mingchen_label"]:setString(str2)
		local preCardNum = g_game.g_dictConfigManager:getOpenedCardNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedCardNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	elseif self.m_positionType == 2 then--美女
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("美女陣容有變化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上陣美女數：")
		else
			self.m_componentTable["tip_label"]:setString("美女阵容有变化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上阵美女数：")
		end
		local preCardNum = g_game.g_dictConfigManager:getOpenedBeautiNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedBeautiNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	elseif self.m_positionType == 3 then--皇子
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("皇子陣容有變化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上陣皇子數：")
		else
			self.m_componentTable["tip_label"]:setString("皇子阵容有变化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上阵皇子数：")
		end
		
		local preCardNum = g_game.g_dictConfigManager:getOpenedPrinceNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedPrinceNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] setReportsPosType
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:setReportsPosType(type,userLv,userStrength,userMilitary,userEnergy)
	self.m_lvupType = self.TYPE_REPORT
	self.m_positionType = type
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local preLv = g_game.g_userInfoManager:getLevel()
	local curLv = userLv

	if type == 0 then
		self.m_componentTable["mingchen_label"]:setVisible(false)
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("卡牌與裝備等級上限也提升了哦")
		else
			self.m_componentTable["tip_label"]:setString("卡牌与装备等级上限也提升了哦")
		end
		
		self.m_componentTable["mingchen_detail"]:setVisible(false)
		self.m_componentTable["yes_btn"]:setVisible(true)
		self.m_componentTable["qianwang_text_btn"]:setVisible(false)
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("名臣陣容有變化，可前往查看")
		else	
			self.m_componentTable["tip_label"]:setString("名臣阵容有变化，可前往查看")
		end
		self.m_componentTable["yes_btn"]:setVisible(false)
		self.m_componentTable["qianwang_text_btn"]:setVisible(true)
	end
	
	self.m_componentTable["lv_detail"]:setString(preLv .. "→"..curLv)
	local preLiangcao = userInfo["strength"]
	local curLiangcao = userStrength
	local addLiangcao = curLiangcao - preLiangcao
	self.m_componentTable["liangcao_detail"]:setString("+"..g_game.g_dictConfigManager:getStrengthRecover(curLv))
	
	local preJunling = userInfo["military"]
	local curJunling = userMilitary
	local addJunling = curJunling - preJunling
	self.m_componentTable["junling_detail"]:setString("+"..g_game.g_dictConfigManager:getJunlingRecover(curLv))
	
	local preJingli = userInfo["energy"]
	local curJingli = userEnergy
	local addJingli = curJingli - preJingli
	self.m_componentTable["jingli_detail"]:setString("+"..g_game.g_dictConfigManager:getEnergyRecover(curLv))
	
	if self.m_positionType == 1 then--名臣
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("名臣陣容有變化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上陣名臣數：")
		else
			self.m_componentTable["tip_label"]:setString("名臣阵容有变化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上阵名臣数：")
		end
		
		local preCardNum = g_game.g_dictConfigManager:getOpenedCardNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedCardNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	elseif self.m_positionType == 2 then--美女
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("美女陣容有變化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上陣美女數：")
		else
			self.m_componentTable["tip_label"]:setString("美女阵容有变化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上阵美女数：")
		end
		
		local preCardNum = g_game.g_dictConfigManager:getOpenedBeautiNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedBeautiNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	elseif self.m_positionType == 3 then--皇子
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("皇子陣容有變化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上陣皇子數：")
		else
			self.m_componentTable["tip_label"]:setString("皇子阵容有变化，可前往查看")
			self.m_componentTable["mingchen_label"]:setString("可上阵皇子数：")
		end
		local preCardNum = g_game.g_dictConfigManager:getOpenedPrinceNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedPrinceNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] setOpenPosType
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:setOpenPosType(type)
	self.m_positionType = type
	self.m_lvupType = self.TYPE_BATTLE
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local preLv = g_game.g_userInfoManager:getLevel()
	local curLv = 0
	
	if self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE or
		self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE  then
		curLv = self.m_battleManager.m_battle_data["roundData"]["currLevel"]
	elseif self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP or self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST then
		curLv = self.m_battleManager.m_battle_data["roundData"]["level"]
	end
	
	if type == 0 or curLv == 2 then
		self.m_componentTable["yes_btn"]:setVisible(true)
		self.m_componentTable["qianwang_text_btn"]:setVisible(false)
		self.m_componentTable["mingchen_label"]:setVisible(false)
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("卡牌與裝備等級上限也提升了哦")
		else
			self.m_componentTable["tip_label"]:setString("卡牌与装备等级上限也提升了哦")
		end
		self.m_componentTable["mingchen_detail"]:setVisible(false)
		
	else
		self.m_componentTable["yes_btn"]:setVisible(false)
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("名臣陣容有變化，點此立即前往")
		else
			self.m_componentTable["tip_label"]:setString("名臣阵容有变化，点此立即前往")
		end
		self.m_componentTable["qianwang_text_btn"]:setVisible(true)
	end
	
	self.m_componentTable["lv_detail"]:setString(preLv .. "→"..curLv)
	local preLiangcao = userInfo["strength"]
	local curLiangcao = self.m_battleManager.m_battle_data["roundData"]["strength"]
	local addLiangcao = curLiangcao - preLiangcao
	self.m_componentTable["liangcao_detail"]:setString("+"..g_game.g_dictConfigManager:getStrengthRecover(curLv))
	
	local preJunling = userInfo["military"]
	local curJunling = self.m_battleManager.m_battle_data["roundData"]["military"]
	local addJunling = curJunling - preJunling
	self.m_componentTable["junling_detail"]:setString("+"..g_game.g_dictConfigManager:getJunlingRecover(curLv))
	
	local preJingli = userInfo["energy"]
	local curJingli = self.m_battleManager.m_battle_data["roundData"]["energy"]
	local addJingli = curJingli - preJingli
	self.m_componentTable["jingli_detail"]:setString("+"..g_game.g_dictConfigManager:getEnergyRecover(curLv))
	
	if self.m_positionType == 1 then--名臣
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("名臣陣容有變化，點此立即前往")
			self.m_componentTable["mingchen_label"]:setString("可上陣名臣數：")
		else
			self.m_componentTable["tip_label"]:setString("名臣阵容有变化，点此立即前往")
			self.m_componentTable["mingchen_label"]:setString("可上阵名臣数：")
		end
		
		local preCardNum = g_game.g_dictConfigManager:getOpenedCardNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedCardNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	elseif self.m_positionType == 2 then--美女
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("美女陣容有變化，點此立即前往")
			self.m_componentTable["mingchen_label"]:setString("可上陣美女數：")
		else
			self.m_componentTable["tip_label"]:setString("美女阵容有变化，点此立即前往")
			self.m_componentTable["mingchen_label"]:setString("可上阵美女数：")
		end
		local preCardNum = g_game.g_dictConfigManager:getOpenedBeautiNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedBeautiNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	elseif self.m_positionType == 3 then--皇子
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["tip_label"]:setString("皇子陣容有變化，点此立即前往")
			self.m_componentTable["mingchen_label"]:setString("可上陣皇子數：")
		else
			self.m_componentTable["tip_label"]:setString("皇子阵容有变化，点此立即前往")
			self.m_componentTable["mingchen_label"]:setString("可上阵皇子数：")
		end
		local preCardNum = g_game.g_dictConfigManager:getOpenedPrinceNum(preLv)
		local curCardNum = g_game.g_dictConfigManager:getOpenedPrinceNum(curLv)
		self.m_componentTable["mingchen_detail"]:setString(preCardNum.."→"..curCardNum)
	end
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] setBattleManager
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:setBattleManager(manager)
	self.m_battleManager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] onExit
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] onCleanup
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:onCleanup()
end

function f_battle_emperor_lvup:setYesBtnVisible(b)
	self.m_componentTable["yes_btn"]:setVisible(b)
	self.m_componentTable["qianwang_text_btn"]:setVisible(not b)
end
-------------------------------------------------------------------------------
-- @function [parent=#f_battle_emperor_lvup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_emperor_lvup:initAllComponent()
	local yesCall = function()
		if self.m_lvupType == self.TYPE_REPORT or self.m_lvupType == self.TYPE_SAODANG  then
			g_game.g_panelManager:removeUiPanel("pve_emperor_lvup")
		elseif self.m_lvupType == self.TYPE_BATTLE then
			if self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE
				or self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
				self.m_battleManager:requestLevelUp()
			elseif self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP or self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST then
				self.m_battleManager:refreshPvpReward()
			end
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["yes_btn"]:addHandleOfcomponentEvent(yesCall, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local gotoCall = function()
		if self.m_lvupType == self.TYPE_REPORT or self.m_lvupType == self.TYPE_SAODANG  then
			g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,self.m_positionType)
			g_game.g_userInfoManager.m_shouldGotoUI = true
			g_game.g_panelManager:removeUiPanel("pve_emperor_lvup")
		elseif self.m_lvupType == self.TYPE_BATTLE then
			if self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE 
				or self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE then
				self.m_battleManager:requestLvupToMainUi(self.m_positionType)
			elseif self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP or self.m_battleManager.m_battle_data["battleType"] == g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST then
				self.m_battleManager:requestpvpLvupToMainUi(self.m_positionType)
			end
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["qianwang_text_btn"]:addHandleOfcomponentEvent(gotoCall, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

