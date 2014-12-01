require("scripts.auto.auto_mingchenxiangqing_title")
require("scripts.auto.auto_mingchenxiangqing_card")
require("scripts.auto.auto_mingchenxiangqing_word")
require("scripts.game.main.jinjie.f_mingchen_jinjie")

require("scripts.game.main.card.f_card_soldier_info")
require("scripts.game.main.card.f_card_skill_info")
require("scripts.auto.auto_mingchenZuhe_item")
--[[--
   名臣详情
--]]--

f_card_mingchen_detail = class("f_card_mingchen_detail")
f_card_mingchen_detail.__index = f_card_mingchen_detail


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_card_mingchen_detail.static_create()
	local mingchenDetail_table = createmingchenxiangqing_title()
	local mingchen_detailPanel = mingchenDetail_table["mingchenxiangqing_title"]
	 
	local funTable = {}
	tolua.setpeer(mingchen_detailPanel, funTable)
	setmetatable(funTable, f_card_mingchen_detail)
	
	mingchen_detailPanel.m_mingchen_detailTitleTable = mingchenDetail_table
	return mingchen_detailPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_mingchen_detail:panelInitBeforePopup()
	self:registerNodeEvent()	
	
	self.m_targetData = nil
	
	self.m_pageRadioBtnArr = {}
	self.m_pagePanels = {}
	self.m_tianfuList = nil
	
	
    self.m_cardDetailCardTable = createmingchenxiangqing_card()
    local cardDetailCard = self.m_cardDetailCardTable["mingchenxiangqing_card"]
    self:appendComponent(cardDetailCard)
    cardDetailCard:setAnchorPoint(cc.p(0,1))
    cardDetailCard:setPositionInContainer(cc.p(15,85))
    
    self.m_cardWordTable = createmingchenxiangqing_word()
    local cardWord = self.m_cardWordTable["mingchenxiangqing_word"]
    self:appendComponent(cardWord)
    cardWord:setAnchorPoint(cc.p(0,1))
    cardWord:setPositionInContainer(cc.p(338,85))
end



-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_mingchen_detail:registerNodeEvent(handler)
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
-- @function [parent=#f_card_mingchen_detail] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_mingchen_detail:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] onEnter
-------------------------------------------------------------------------------
function f_card_mingchen_detail:onEnter()
    
    self.m_mingchen_detailTitleTable["xiangqing_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MINGCHENXIANGQING)
    
    self.m_pageRadioBtnArr[1] = self.m_cardWordTable["btnTianfu2"] --天赋
   	self.m_pageRadioBtnArr[2] = self.m_cardWordTable["btnZuhe"] --组合
   	self.m_pageRadioBtnArr[3] = self.m_cardWordTable["btnTianfu"] --兵种详情
    self.m_pageRadioBtnArr[4] = self.m_cardWordTable["btnJieshao"] --介绍
   	
   	self.m_pagePanels[1] = self.m_cardWordTable["tianfu2Panel"]
   	self.m_pagePanels[2] = self.m_cardWordTable["ZuhePanel"]
   	self.m_pagePanels[3] = self.m_cardWordTable["TianfuPanel"]
   	self.m_pagePanels[4] = self.m_cardWordTable["JieshaoPanel"]
   	
    self.m_panelIndex = 1
    
    local click = function()
		self.m_panelIndex = 1
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(click,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click = function()
		self.m_panelIndex = 2
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(click,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click = function()
		self.m_panelIndex = 3
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[3]:addHandleOfcomponentEvent(click,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click = function()
		self.m_panelIndex = 4
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[4]:addHandleOfcomponentEvent(click,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self:updatePagePanel()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] updatePagePanel
-------------------------------------------------------------------------------
function f_card_mingchen_detail:updatePagePanel()
	for i = 1, 4 do
		if i == self.m_panelIndex then
			self.m_pagePanels[i]:setVisible(true)
			self.m_pageRadioBtnArr[i]:setIsEnabled(true)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
		else
			self.m_pagePanels[i]:setVisible(false)
			self.m_pageRadioBtnArr[i]:setIsEnabled(false)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
		end
	end
	if self.m_list ~= nil then
		self.m_list:setVisible(self.m_panelIndex == 2)
	end
	
	if self.m_tianfuList ~= nil then
		self.m_tianfuList:setVisible(self.m_panelIndex == 1)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] getSkillEffType
-------------------------------------------------------------------------------
function f_card_mingchen_detail:getSoldierEffType(effectId)
	if effectId == 3 then
		return 1
	elseif effectId == 4  then
		return 0
	end
	return -1
end

function f_card_mingchen_detail:setSoliderInfo(data)
--		local name = g_game.g_dictConfigManager:getSoliderInfo(data["soldierType"])[6]
--		local imageName =  g_game.g_resourceManager:getSoldierImage(name) 
	local sinfo = g_game.g_dictConfigManager:getSoldierInfo(data["officerId"], data["advanced"])
--	self.m_cardDetailCardTable["icon_image"]:setImage(g_game.g_f_soldier_flage_image_big[stype])
--	
--	self.m_cardDetailCardTable["icon_image"]:setSize(cc.size(90,90))
	
	
	local soldierName = g_game.g_dictConfigManager:getLanTextById(sinfo[2]) 
	self.m_cardWordTable["icon_name_label"]:setString(soldierName)
	
	self.m_cardWordTable["soldier_btn"]:setImage("nobatch/" .. sinfo[14])
	
	local bigType = g_game.g_dictConfigManager:getSoldierBigType(data["officerId"])
	local soldierDes = g_game.g_dictConfigManager:getLanTextById(sinfo[13])
	local t = string.split(soldierDes, "，")
	
	if LANGUAGE_TYPE == 3 then
		self.m_cardWordTable["icon_desc1"]:setString(t[1]..",剋制效果為：")
		self.m_cardWordTable["icon_desc6"]:setString(t[2]..",被剋效果為：")
	else
		self.m_cardWordTable["icon_desc1"]:setString(t[1]..",克制效果为：")
		self.m_cardWordTable["icon_desc6"]:setString(t[2]..",被克效果为：")
	end
	
	
	
	local kezhi = sinfo[4]
	self.m_cardWordTable["icon_desc2"]:setString("提升己方攻防值")
	
	self.m_cardWordTable["num1"]:setString(kezhi.."%")
	
	local beike = sinfo[5]

	self.m_cardWordTable["icon_desc4"]:setString("降低己方攻防值")
	self.m_cardWordTable["num3"]:setString(beike.."%")
	
	local battleBeautyArr = g_game.g_userInfoManager:getBeautiListInfo()["battleList"]
	local skillEffRise = {}
	local skillEffReduce = {}
	for i = 1, #battleBeautyArr do
		local beautyId = battleBeautyArr[i]["beautyId"]
		local skillId = g_game.g_dictConfigManager:getBeautyAdditionId(beautyId)
		local skillInfo = g_game.g_dictConfigManager:getBeautyAddition(skillId)
		
		local type = self:getSoldierEffType(skillInfo[4])
		local finalAddition = 0
		if type ~= -1 then
			local addPercent = 0
		    if battleBeautyArr[i]["beautyTitle"] ~= 0 then
		    	addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(battleBeautyArr[i]["beautyTitle"])
		    end
		    finalAddition = skillInfo[5]/1000 + (battleBeautyArr[i]["beautyLevel"]-1)*skillInfo[6]/1000 + addPercent
		end
		
		if type == 1 then  -- rise
			table.insert(skillEffRise,finalAddition)
		elseif type == 0 then --0 reduce
			table.insert(skillEffReduce,finalAddition)
		end		
	end
	
	if #skillEffRise == 0 then
		if LANGUAGE_TYPE == 3 then
			self.m_cardWordTable["icon_desc3"]:setString("當前美女助陣效果提升")
		else
			self.m_cardWordTable["icon_desc3"]:setString("当前美女助阵效果提升")
		end
		self.m_cardWordTable["num2"]:setString("0%")
	else
		local compFunc = function(data1, data2)
			return data1 > data2
		end
		table.sort(skillEffRise,compFunc)
		if LANGUAGE_TYPE == 3 then
			self.m_cardWordTable["icon_desc3"]:setString("當前美女助陣效果提升")
		else
			self.m_cardWordTable["icon_desc3"]:setString("当前美女助阵效果提升")
		end
		self.m_cardWordTable["num2"]:setString(skillEffRise[1].."%")
	end
	
	if #skillEffReduce == 0 then
		if LANGUAGE_TYPE == 3 then
			self.m_cardWordTable["icon_desc5"]:setString("當前美女助陣效果降低")
		else
			self.m_cardWordTable["icon_desc5"]:setString("当前美女助阵效果降低")
		end
		
		self.m_cardWordTable["num4"]:setString("0%")
	else
		local compFunc = function(data1, data2)
			return data1 > data2
		end
		table.sort(skillEffReduce,compFunc)
		if LANGUAGE_TYPE == 3 then
			self.m_cardWordTable["icon_desc5"]:setString("當前美女助陣效果降低")
		else
			self.m_cardWordTable["icon_desc5"]:setString("当前美女助阵效果降低")
		end
		self.m_cardWordTable["num4"]:setString(skillEffReduce[1].."%")
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] setDetail
-------------------------------------------------------------------------------
function f_card_mingchen_detail:setDetail(data)
	self.m_targetData = data
	self.m_cardDetailCardTable["xiangqing_shengji_button"]:setVisible(self.m_targetData["id"] ~= nil)
	self.m_cardDetailCardTable["ciguan_button"]:setVisible(self.m_targetData["id"] ~= nil)
	if data ~= nil then
		local cardRes = g_game.g_dictConfigManager:getCardFile(data["officerId"])
		local cardImage = g_game.g_resourceManager:getCard(cardRes)
		local quality = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
		local adv = data["advanced"]
		self:setSoliderInfo(data)
		
		self:setTianfuInfo(data)
		
		self.m_cardDetailCardTable["xq_card_image"]:setImage(cardImage)
		self.m_cardDetailCardTable["xq_card_image"]:setExtensionsTextureRect(cc.rect(106, 0, 300, 329))
--		self.m_cardDetailCardTable["xq_card_image"]:setComponentZOrder(2)
		
		--检测装备位
		local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
		local position = 0
		for i = 1,#battleList do
			if battleList[i]["id"] == data["id"] then
				position = i
				break
			end
		end
		
		local func = function()
		end
		local atkAddition,defAddition = g_game.g_dictConfigManager:getCardAddition(position,data)
		if defAddition == 0 then
			self.m_cardDetailCardTable["xq_tx_fangyu_num_label"]:setColor(cc.c3b(139,255,240))
			self.m_cardDetailCardTable["xq_tx_fangyu_num_label"]:setString(tostring(data["defense"]))
		else
			self.m_cardDetailCardTable["xq_tx_fangyu_num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[139,255,240]"..data["defense"].."[0,255,0]+"..math.floor(defAddition), cc.c3b(139,255,240)), func)
		end
		
		--att
		if atkAddition == 0 then
			self.m_cardDetailCardTable["xq_tx_gongji_num_label"]:setColor(cc.c3b(139,255,240))
			self.m_cardDetailCardTable["xq_tx_gongji_num_label"]:setString(tostring(data["attack"]))
		else
			self.m_cardDetailCardTable["xq_tx_gongji_num_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[139,255,240]"..data["attack"].."[0,255,0]+"..math.floor(atkAddition), cc.c3b(139,255,240)), func)
		end
		
		self.m_cardDetailCardTable["xq_tx_dengji_num_label"]:setString(""..data["officerLevel"])
		
		local  officerQuality = g_game.g_dictConfigManager:getCardQuality(data["officerId"]) 
		local curCardExp = data["officerExp"] 		 
		local curLvExpLimit = g_game.g_dictConfigManager:getExpLimitByLv(data["officerLevel"],officerQuality)
		self.m_cardDetailCardTable["xq_tx_jingyan_num_label"]:setString(""..curCardExp .. "/" .. curLvExpLimit)
		
		if LANGUAGE_TYPE == 3 then
			self.m_cardDetailCardTable["guanzhi_label"]:setString(g_game.g_advance_level_name2[data["advanced"]])
		else
			self.m_cardDetailCardTable["guanzhi_label"]:setString(g_game.g_advance_level_name1[data["advanced"]])
		end
		
		local animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
		self.m_cardDetailCardTable["mingchenxiangqing_card"]:appendComponent(animation)
		animation:setSize(cc.size(310,341))
		animation:setComponentZOrder(1)
		animation:setAnchorPoint(cc.p(0.5,0))
		animation:setPositionInContainer(cc.p(153,372))	
		animation:setLoop(true)	
		animation:setAnimationScale(1)
		animation:setAnimationSpeedScale(0.3)
		animation:setVisible(true)
		if quality >= 3 then
			animation:setVisible(true)
	    	animation:runAnimation(g_game.g_f_main_ui_effect.UI_BIG_CARD[2], g_game.g_f_main_ui_effect.UI_CARD[quality])
	    else
	    	animation:setVisible(false)
	    end
		self:initAllComponent()
		
		for i = 1, 5 do
   	  	  if i <= officerQuality then
   	     	 self.m_cardDetailCardTable["xq_star"..i.."_image"]:setVisible(true)
   	      else
   	    	 self.m_cardDetailCardTable["xq_star"..i.."_image"]:setVisible(false)
   	  	  end
        end
		
		if data["officerLevel"] == g_game.MAX_USER_LV then
			self.m_cardDetailCardTable["xq_kapai_yimanji_image"]:setVisible(true)
		else
			self.m_cardDetailCardTable["xq_kapai_yimanji_image"]:setVisible(false)
		end
		
--		local  cardName = g_game.g_dictConfigManager:getCardName(data["officerId"])
--		self.m_cardDetailCardTable["xq_card_name"]:setVerString(cardName)
		
		local cardDes = g_game.g_dictConfigManager:getCardDescription(data["officerId"])
		self.m_cardWordTable["des_label"]:setString("    "..cardDes)
		
		local soldierType = g_game.g_dictConfigManager:getSoldierType(data["officerId"])
		
	
		local skillIdGroup = g_game.g_dictConfigManager:getOfficerSkillIdGroup(data["officerId"])
	    for i= 1, #skillIdGroup do
	    	self.m_cardWordTable["skillLocak"..i]:setVisible(false)
	    	self.m_cardWordTable["frame" .. i]:setOpacity(255)
	    	if skillIdGroup[i] ~= 0 then
	    		local skillIconName = g_game.g_dictConfigManager:getSkillIcon(skillIdGroup[i])
	    		local skillIconRes = g_game.g_resourceManager:getSkillIconImage(skillIconName)
	    		self.m_cardWordTable["skill"..i]:setImage(skillIconRes)
	    		self.m_cardWordTable["skill"..i]:setSize(cc.size(90,90))
	    		self.m_cardWordTable["skill"..i]:setVisible(true)
	    		self.m_cardWordTable["skillName"..i]:setString(g_game.g_dictConfigManager:getSkillName(skillIdGroup[i]))
	    		self.m_cardWordTable["frame"..i]:setVisible(true)
	    		self.m_cardWordTable["frame"..i]:setImage(g_game.g_f_quality_image[g_game.g_dictConfigManager:getSkillQuality(skillIdGroup[i])])
	    	else
	    		self.m_cardWordTable["skill"..i]:setVisible(false)
	    		self.m_cardWordTable["frame"..i]:setVisible(false)
	    		self.m_cardWordTable["skillName"..i]:setString("")
	    	end
	    end
	    
		self.m_cardWordTable["skillLocak2"]:setVisible(not self.m_hasSecondSkill and self.m_showLock)
		if self.m_hasSecondSkill then
			self.m_cardWordTable["skill2"]:setOpacity(255)
		else
			self.m_cardWordTable["skill2"]:setOpacity(128)
		end
		
		--已激活组合
		local combinationList = g_game.g_userInfoManager:getUserCombination()
   		local num = combinationList["cardCombinaList_Num"]
   		
   		if self.m_list == nil then
	   		self.m_list = fc.FContainerList:create(1)
			self.m_list:enableClipping(true)
			self:appendComponent(self.m_list)
		
			self.m_list:setSize(cc.size(540, 400))
			self.m_list:setAnchorPoint(cc.p(0.5,0.5))
			self.m_list:setPositionInContainer(cc.p(645, 400))
			
			self.m_list:setListInfo(5, 10, 0, 540, 60)
		
			local combinDes = ""
			for i = 1,  7 do
				local combiId = g_game.g_dictConfigManager:getCombinationId(data["officerId"],i)
				
				combinDes = ""
				local active = false
				if data["battle"] ~= 0 then
					for j = 1, num do
						if combinationList["cardCombinaList"][j]["combinaId"] == combiId then
							active = true
							break
						end
					end
				end
				
				local fun = function()
				end
				local combinName = nil
				if combiId ~= 0 then
					combinName = g_game.g_dictConfigManager:getCombinationName(combiId)
					local cardType =g_game.g_dictConfigManager:getCardType(data["officerId"])
					local addition = g_game.g_dictConfigManager:getCombinationValue(combiId)
					if cardType == 1 then
						if LANGUAGE_TYPE == 3 then
							combinDes = "攻擊"..addition.."% "
						else
							combinDes = "攻击"..addition.."% "
						end
					else
						if LANGUAGE_TYPE == 3 then
							combinDes = "防禦"..addition.."% "
						else
							combinDes = "防御"..addition.."% "
						end
					end
					combinDes = "[180,0,255]" .. combinName .. ":" .. self:getCombinNameDes(combiId, combinDes, data["officerId"])
					local itemTable = createmingchenZuhe_item()
					local item = itemTable["mingchenZuhe_item"]
					itemTable["item_label"]:setWidth(520)
					itemTable["item_label"]:setAlignment(0)
					itemTable["item_label"]:setComplexString(g_game.g_utilManager:getEncodeString(combinDes, cc.c3b(139,255,240)), fun)
					itemTable["item_bg"]:setVisible(active)
					itemTable["item_diactive_bg"]:setVisible(not active)
					if active then
						itemTable["item_label"]:setColor(cc.c3b(255,138,97))
					else
						itemTable["item_label"]:setColor(cc.c3b(0,0,0))
					end
					self.m_list:appendComponent(item)	
				end
			end
			self.m_list:setVisible(false)
		end
	end
end


function f_card_mingchen_detail:setTianfuInfo(data)
	local needCreate = false
	if self.m_tianfuList == nil then
	
		self.m_tianfuList = fc.FContainerList:create(1)
		self.m_tianfuList:enableClipping(true)
		self:appendComponent(self.m_tianfuList)
		
		self.m_tianfuList:setSize(cc.size(540, 400))
		self.m_tianfuList:setAnchorPoint(cc.p(0.5,0.5))
		self.m_tianfuList:setPositionInContainer(cc.p(645, 400))
			
		self.m_tianfuList:setListInfo(5, 10, 0, 540, 60)
		self.m_tianfuItems = {}
		needCreate = true
	end
	
	local quality = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
	local skills = g_game.g_dictConfigManager:getAdvanceSkill(data["officerId"])
	local adv = data["advanced"]
	
	local lvsT = g_game.g_dictConfigManager:getUnlockTianFuArr()
	
	local call = function()
	end
	local textlist = {"", "", "三", "四", "五", "六"}
	self.m_hasSecondSkill = false
	self.m_showLock = false
	if quality >= 3 and g_game.g_dictConfigManager:isCardCanAdvance(data["officerId"]) then
		self.m_showLock = true
		for i = 1, 6 do
			local itemTable = nil
			if needCreate then
				itemTable = createmingchenZuhe_item()
				local item = itemTable["mingchenZuhe_item"]	
				self.m_tianfuList:appendComponent(item)	
				table.insert(self.m_tianfuItems, itemTable)
			else
				itemTable = self.m_tianfuItems[i]
			end
			if i < 3 and skills[i][4] == 8 and skills[i][5] == 2 then
				self.m_lockSkill = g_game.g_dictConfigManager:getLanTextById(skills[i][2])
			end
			
			local text = ""
			if LANGUAGE_TYPE == 3 then
				if i > 2 then
					text = "[91,24,6]    （敬請期待）    [0,0,255]開啟第" .. textlist[i] .. "個武將技能"
				else
					local txt1 = g_game.g_dictConfigManager:getLanTextById(skills[i][2])
					local txt2 = g_game.g_dictConfigManager:getLanTextById(skills[i][3])
					text = "[180,0,255]"..txt1 .. " [91,24,6]（官職".. g_game.g_advance_level_name2[lvsT[i]] .. "解鎖） " 
						.."[0,0,255]"..txt2
				end
			else
				if i > 2 then
					text = "[91,24,6]    （敬请期待）    [0,0,255]开启第" .. textlist[i] .. "个武将技能"
				else
					local txt1 = g_game.g_dictConfigManager:getLanTextById(skills[i][2])
					local txt2 = g_game.g_dictConfigManager:getLanTextById(skills[i][3])
					text = "[180,0,255]"..txt1 .. " [91,24,6]（官职".. g_game.g_advance_level_name1[lvsT[i]] .. "解锁） " 
						.."[0,0,255]"..txt2
				end
			end
			
			itemTable["item_label"]:setAlignment(0)
			itemTable["item_label"]:setComplexString(g_game.g_utilManager:getEncodeString(text, cc.c3b(91,24,6)), call)
			
			if adv >= lvsT[i] and i < 3 then
				itemTable["item_bg"]:setVisible(true)
				itemTable["item_diactive_bg"]:setVisible(false)
				if skills[i][4] == 8 and skills[i][5] == 2 then
					self.m_hasSecondSkill = true
				end
			else
				itemTable["item_bg"]:setVisible(false)
				itemTable["item_diactive_bg"]:setVisible(true)
			end	
			
		end
		self.m_cardWordTable["temp_des"]:setVisible(false)
	else
		self.m_cardWordTable["temp_des"]:setVisible(true)
		if LANGUAGE_TYPE == 3 then
			self.m_cardWordTable["temp_des"]:setString("該名臣沒有天賦")
		else
			self.m_cardWordTable["temp_des"]:setString("该名臣没有天赋")
		end
	end
	
	if self.m_hasSecondSkill then
		self.m_lockSkill = nil
	end
	
	self.m_tianfuList:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] getCombinNameDes
-------------------------------------------------------------------------------
function f_card_mingchen_detail:getCombinNameDes(combiId, tail, id)
	local idArr = g_game.g_dictConfigManager:getCombinationMemberIds(combiId)
	local nameArrDes = ""
	local des = g_game.g_dictConfigManager:getCombinDes(combiId)
	local t = {}
	
	local count = 0
	for j = 1, #idArr do
		if idArr[j] ~= 0 and idArr[j] ~= "" and (j > 7 or idArr[j] ~= id) then
			if j <= 7 then
				table.insert(t, g_game.g_dictConfigManager:getCardName(idArr[j]))
			elseif j == 8 then
				table.insert(t, g_game.g_dictConfigManager:getEquipName(idArr[j]))
			else
				table.insert(t, g_game.g_dictConfigManager:getBeautiName(idArr[j]))
			end
		end
	end

	if #t == 1 then
		nameArrDes = string.format(des, t[1], tail)
	elseif #t == 2 then
		nameArrDes = string.format(des, t[1], t[2], tail)
	elseif #t == 3 then
		nameArrDes = string.format(des, t[1], t[2], t[3], tail)
	elseif #t == 4 then
		nameArrDes = string.format(des, t[1], t[2], t[3], t[4], tail)
	elseif #t == 5 then
		nameArrDes = string.format(des, t[1], t[2], t[3], t[4], t[5], tail)
	end
	return nameArrDes
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] onExit
-------------------------------------------------------------------------------
function f_card_mingchen_detail:onExit()  
  self:unregisterNodeEvent()
  
  self.m_targetData = nil
  
  --移除注册的监听函数
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.updateAdv)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_mingchen_detail:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_mingchen_detail:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] onCleanup
-------------------------------------------------------------------------------
function f_card_mingchen_detail:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] showCurSkillInfo
-- 显示技能详情
-------------------------------------------------------------------------------
function f_card_mingchen_detail:showCurSkillInfo(type)
	
	local skillIdGroup = g_game.g_dictConfigManager:getOfficerSkillIdGroup(self.m_targetData["officerId"])
	
	if skillIdGroup[type] ~= 0 then
		local skillInfo = g_game.g_panelManager:getUiPanel("skill_info_panel")
		if skillInfo ~= nil then
			return
		end
	
		local skillInfo = f_card_skill_info.static_create()
	    skillInfo:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(skillInfo,"skill_info_panel")
		if type == 1 then
			skillInfo:setLock(false, nil)
		else
			skillInfo:setLock(not self.m_hasSecondSkill, self.m_lockSkill)
		end
		skillInfo:setData(skillIdGroup[type])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_mingchen_detail:initAllComponent()

	--显示技能详情
    local skillInfoPress1 = function()
   		self:showCurSkillInfo(1)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_cardWordTable["skill_panel1"]:addHandleOfcomponentEvent(skillInfoPress1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local skillInfoPress2 = function()
   		self:showCurSkillInfo(2)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_cardWordTable["skill_panel2"]:addHandleOfcomponentEvent(skillInfoPress2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local skillInfoPress3 = function()
   		self:showCurSkillInfo(3)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_cardWordTable["skill_panel3"]:addHandleOfcomponentEvent(skillInfoPress3,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
	--关闭当前按钮
	local closeCurrentPanel = function()
		g_game.g_panelManager:removeUiPanel("mingchen_xiangqing")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_mingchen_detailTitleTable["xiangqing_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
--	local checkoutCurSolderInfo = function()
--    	self:showCurSoldierInfo()
--    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--    end
--    self.m_cardWordTable["soldier_btn"]:addHandleOfcomponentEvent(checkoutCurSolderInfo,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--显示升级
	local showShengji = function()
		self:showShengji()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_cardDetailCardTable["xiangqing_shengji_button"]:addHandleOfcomponentEvent(showShengji,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local showCiguan = function()
		self:showCiguan()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_cardDetailCardTable["ciguan_button"]:addHandleOfcomponentEvent(showCiguan,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--注册名臣升级回调，重新显示经验和等级
	self.event_updateMingchenShengji = function()
		self:reShowMingchenInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS, self.event_updateMingchenShengji)
	
	self.updateAdv = function()
		if LANGUAGE_TYPE == 3 then
			self.m_cardDetailCardTable["guanzhi_label"]:setString(g_game.g_advance_level_name2[self.m_targetData["advanced"]])
		else
			self.m_cardDetailCardTable["guanzhi_label"]:setString(g_game.g_advance_level_name1[self.m_targetData["advanced"]])
		end
		self:setTianfuInfo(self.m_targetData)
		self:setSoliderInfo(self.m_targetData)
		self:updatePagePanel()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE, self.updateAdv)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] showCurSoldierInfo
-------------------------------------------------------------------------------
function f_card_mingchen_detail:showCurSoldierInfo()
	local soldierInfo = g_game.g_panelManager:getUiPanel("soldier_info_panel")
	if soldierInfo ~= nil then
		return
	end
	
	soldierInfo = f_card_soldier_info.static_create()
    soldierInfo:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(soldierInfo,"soldier_info_panel")
	soldierInfo:setData(self.m_targetData)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] reShowMingchenInfo
-- 重新显示经验和等级(升级回调)
-------------------------------------------------------------------------------
function f_card_mingchen_detail:reShowMingchenInfo()
	--获取到当前名臣信息
	local mingchenInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR)
	local data = nil
	for i = 1, #mingchenInfo do
		if mingchenInfo[i]["id"] == self.m_targetData["id"] then
			data = mingchenInfo[i]
			break
		end
		
	end
	

	self.m_cardDetailCardTable["xq_tx_dengji_num_label"]:setString(""..data["officerLevel"])
	
	local  officerQuality = g_game.g_dictConfigManager:getCardQuality(data["officerId"])
	local curCardExp = data["officerExp"] 		 
	local curLvExpLimit = g_game.g_dictConfigManager:getExpLimitByLv(data["officerLevel"],officerQuality)
	
	self.m_cardDetailCardTable["xq_tx_jingyan_num_label"]:setString(""..curCardExp .. "/" .. curLvExpLimit)
	self.m_cardDetailCardTable["xq_tx_fangyu_num_label"]:setString(""..data["defense"])
	self.m_cardDetailCardTable["xq_tx_gongji_num_label"]:setString(""..data["attack"])
	
	for i = 1, 5 do
   	   if i <= officerQuality then
   	     self.m_cardDetailCardTable["xq_star"..i.."_image"]:setVisible(true)
   	   else
   	     self.m_cardDetailCardTable["xq_star"..i.."_image"]:setVisible(false)
   	   end
    end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] showCiguan
-- 显示赐官界面
-------------------------------------------------------------------------------
function f_card_mingchen_detail:showCiguan()
	local mingchenInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR)
	local data = nil
	for i = 1, #mingchenInfo do
		if mingchenInfo[i]["id"] == self.m_targetData["id"] then
			data = mingchenInfo[i]
			break
		end
	end
	
	if data == nil then
		return
	end
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
	local mingchen_shengji_panel = f_mingchen_jinjie.static_create()	
	mingchen_shengji_panel:panelInitBeforePopup()
	mingchen_shengji_panel:setData(data)
	g_game.g_panelManager:showUiPanel(mingchen_shengji_panel, "jin_jie")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchen_detail] showShengji
-- 显示升级界面
-------------------------------------------------------------------------------
function f_card_mingchen_detail:showShengji()
	--获取到当前名臣信息
	local mingchenInfo = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR)
	local data = nil
	for i = 1, #mingchenInfo do
		if mingchenInfo[i]["id"] == self.m_targetData["id"] then
			data = mingchenInfo[i]
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

