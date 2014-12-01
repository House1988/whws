--[[--
    策划配置数据管理类
--]]--

local f_dict_config_manager = class("f_dict_config_manager")
f_dict_config_manager.__index = f_dict_config_manager

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] ctor
-------------------------------------------------
function f_dict_config_manager:ctor()
	self.m_dict_config = require("scripts.common.f_dict_config_export")
	
	self.m_dict_lan_data = require("scripts.common.f_dict_mult_lan")
	
	self.m_remoteConfig = {}
	
	self.m_startServerReward = nil
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] 
-------------------------------------------------
function f_dict_config_manager:getLanTextById(id)
	return self.m_dict_lan_data[id][LANGUAGE_TYPE]
end

function f_dict_config_manager:setRemoteConfig(key, jsonStr)
	local t = json.decode(jsonStr)
	self.m_remoteConfig[key] = t
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOpenedCardNum
-- 获取玩家当前级别所开启的卡牌个数
-------------------------------------------------
function f_dict_config_manager:getOpenedCardNum(level)
	local temp = self.m_dict_config.f_dict_emperor[level]
	if temp ~= nil then
		return temp[9]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getRandomName
-- 随机起名
-------------------------------------------------
function f_dict_config_manager:getRandomName()
	local t = self.m_dict_config.f_dict_name
	local f = math.random(1, #t)
	local s = math.random(1, #t)
	
	local start = self:getLanTextById(t[f][2])
	local last	= self:getLanTextById(t[s][3])
	return  start..last 
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceType
-- 获取碎片类型
-------------------------------------------------
function f_dict_config_manager:getPieceType(id)
	return self.m_dict_config.f_dict_piece[id][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceList
-- 获取所有碎片
-------------------------------------------------
function f_dict_config_manager:getPieceList()
	return self.m_dict_config.f_dict_piece
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceCost
-- 获取碎片花费金钱
-------------------------------------------------
function f_dict_config_manager:getPieceCost(id)
	return self.m_dict_config.f_dict_piece[id][6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceMergeNumber
-- 获取碎片合成数量
-------------------------------------------------
function f_dict_config_manager:getPieceMergeNumber(id)
	return self.m_dict_config.f_dict_piece[id][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceIcon
-- 获取碎片图标
-------------------------------------------------
function f_dict_config_manager:getPieceIcon(id)
	local a = id
	return self.m_dict_config.f_dict_piece[id][7]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBingfaIconSmall
-- 获取兵法碎片圆形图标
-------------------------------------------------
function f_dict_config_manager:getBingfaIconSmall(id)
	return self.m_dict_config.f_dict_piece[id][7] .. "_small"
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceCardID
-- 获取碎片卡牌id
-------------------------------------------------
function f_dict_config_manager:getPieceCardID(id)
	return self.m_dict_config.f_dict_piece[id][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceStar
-- 获取碎片星级
-------------------------------------------------
function f_dict_config_manager:getPieceStar(id)
	local card = self.m_dict_config.f_dict_piece[id][4]
	local type = self.m_dict_config.f_dict_piece[id][3]
	if type == 1 then
		return self:getCardQuality(card)
	elseif type == 2 then
		return self:getBeautyQuality(card)
	elseif type == 3 then
		return self:getEquipStar(card)
	elseif type == 4 then
		return self:getEquipStar(card)
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceName
-- 获取碎片名称
-------------------------------------------------
function f_dict_config_manager:getPieceName(id)
	local card = self.m_dict_config.f_dict_piece[id][4]
	local type = self.m_dict_config.f_dict_piece[id][3]
	if type == 1 then
		return self:getCardName(card)
	elseif type == 2 then
		return self:getBeautiName(card)
	elseif type == 3 then
		return self:getEquipName(card)
	elseif type == 4 then 
		local id = self.m_dict_config.f_dict_piece[id][2]
		return self:getLanTextById(id)
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPieceImage
-- 获取碎片名称
-------------------------------------------------
function f_dict_config_manager:getPieceImage(id)
	local card = self.m_dict_config.f_dict_piece[id][4]
	local type = self.m_dict_config.f_dict_piece[id][3]
	if type == 1 then
		return g_game.g_resourceManager:getCardHead(self:getCardHeadFile(card))
	elseif type == 2 then
		return g_game.g_resourceManager:getBeautyCardHead(self:getBeautyResource(card))
	elseif type == 3 then
		return g_game.g_resourceManager:getItemImage(self:getEquipImage(card))
	elseif type == 4 then
		return g_game.g_resourceManager:getItemImage(self.m_dict_config.f_dict_piece[id][7])
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getRandomNianHao
-- 随机年号
-------------------------------------------------
function f_dict_config_manager:getRandomNianHao()
	local t = self.m_dict_config.f_dict_reign
	local f = math.random(1, #t)
	local name = self:getLanTextById(t[f][2])
	return name
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dict_config_manager] getXunfangRewardList
-- 获取寻访奖励列表
-------------------------------------------------------------------------------
function f_dict_config_manager:getXunfangRewardList(index)
	local t = {}
	for i = 1, #self.m_dict_config.f_dict_xunfang_reward do
		if self.m_dict_config.f_dict_xunfang_reward[i][2] == index then
			local temp = {}
			temp["image"] = self.m_dict_config.f_dict_xunfang_reward[i][3]
			local id = self.m_dict_config.f_dict_xunfang_reward[i][5]
			temp["name"] = self:getLanTextById(id)
			temp["star"] = self.m_dict_config.f_dict_xunfang_reward[i][4]
			table.insert(t, temp)
		end
	end
	return t
end


-------------------------------------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLoadingTip
-- 获取loading tip
-------------------------------------------------------------------------------
function f_dict_config_manager:getLoadingTip()
	local t = self.m_dict_config.f_loading_tip
	for i = 1, #t do
		local i1 = math.random(1, #t)
		local i2 = math.random(1, #t)
		local temp = t[i1]
		t[i1] = t[i2]
		t[i2] = temp
	end
	return t
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPingbiWord
-- 获取敏感词
-------------------------------------------------------------------------------
function f_dict_config_manager:getPingbiWord(isCH)
	if isCH then
		if LANGUAGE_TYPE == 3 then
			return self.m_dict_config.f_dict_taboo_TW
		else
			return self.m_dict_config.f_dict_ping_bi_word
		end
	else
		return self.m_dict_config.f_dict_ping_bi_word_2
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isEuqipmentWeapon
-- 是否是武器装备
-------------------------------------------------
function f_dict_config_manager:isEuqipmentWeapon(id)
	local temp = self.m_dict_config.f_dict_equipment[id]
	if temp ~= nil then
		return temp[6] == 1
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isEuqipmentArmor
-- 是否是防具装备
-------------------------------------------------
function f_dict_config_manager:isEuqipmentArmor(id)
	local temp = self.m_dict_config.f_dict_equipment[id]
	if temp ~= nil then
		return temp[6] == 2
	end
	return false
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isEuqipmentBingfa
-- 是否是兵法装备
-------------------------------------------------
function f_dict_config_manager:isEuqipmentBingfa(id)
	local temp = self.m_dict_config.f_dict_equipment[id]
	if temp ~= nil then
		return temp[6] == 3
	end
	return false
end

function f_dict_config_manager:getQiandaoData(day)
	return self.m_remoteConfig["qiandao"][1][day]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLoginRewardData
-- 获取登陆奖励
-------------------------------------------------
function f_dict_config_manager:getLoginRewardData(day)
	local temp = self.m_dict_config.f_dict_login_reward[day]
	return temp
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLevelRewardTable
-- 获取等级奖励
-------------------------------------------------
function f_dict_config_manager:getLevelRewardTable()
	return self.m_dict_config.f_dict_level_reward
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOpenedBeautiNum
-- 获取玩家当前级别所开启的美女个数
-------------------------------------------------
function f_dict_config_manager:getOpenedBeautiNum(level)
	local temp = self.m_dict_config.f_dict_emperor[level]
	if temp ~= nil then
		return temp[10]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBingfaBaseExp
-- 获取兵法升级基础经验
-------------------------------------------------
function f_dict_config_manager:getBingfaBaseExp(id)	
	return self.m_dict_config.f_dict_bingfa_merge[id][2]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBingfaUpgradePrice
-- 获取兵法升级价格
-------------------------------------------------
function f_dict_config_manager:getBingfaUpgradePrice(id)	
	return self.m_dict_config.f_dict_bingfa_merge[id][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isOpenPosition
-------------------------------------------------
function f_dict_config_manager:isOpenPosition(prelv,curlv)
	local preOpenOfficerNum = self.m_dict_config.f_dict_emperor[prelv][9]
	local preOpenBeauyNum = self.m_dict_config.f_dict_emperor[prelv][10]
	local preOpenPrinceNum = self.m_dict_config.f_dict_emperor[prelv][11]
	
	local curOpenOfficerNum = self.m_dict_config.f_dict_emperor[curlv][9]
	local curOpenBeautyNum = self.m_dict_config.f_dict_emperor[curlv][10]
	local curOpenPrinceNum = self.m_dict_config.f_dict_emperor[curlv][11]
	
	if preOpenOfficerNum < curOpenOfficerNum then
		return 1
	end
	
	if preOpenBeauyNum < curOpenBeautyNum then
		return 2
	end
	
	if preOpenPrinceNum < curOpenPrinceNum then
		return 3
	end
	
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOpenedPrinceNum
-- 获取指定级别所开启的皇子个数
-------------------------------------------------
function f_dict_config_manager:getOpenedPrinceNum(level)
	local temp = self.m_dict_config.f_dict_emperor[level]
	if temp ~= nil then
		return temp[11]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSellPrinceSilver
-- 获取皇子出售的价格
-------------------------------------------------
function f_dict_config_manager:getSellPrinceSilver(level,star)
	return self.m_dict_config.f_dict_prince_exp[level][6+star]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSellCardSilver
-- 获取卡牌出售的价格
-------------------------------------------------
function f_dict_config_manager:getSellCardSilver(level,star)
	return self.m_dict_config.f_dict_card_level_up[level][6+star]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLevelExpLimit
-- 获取指定级别经验上限
-------------------------------------------------
function f_dict_config_manager:getLevelExpLimit(level)
	local temp = self.m_dict_config.f_dict_emperor[level]
	if temp ~= nil then
		return temp[2]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLimitJingli
-- 获取 精力 上限
-------------------------------------------------
function f_dict_config_manager:getLimitJingli(level)
	return self.m_dict_config.f_dict_emperor[level][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getZouZhangReward
-- 批阅奏章获取的银两和经验值奖励
-------------------------------------------------
function f_dict_config_manager:getZouZhangReward(level)
	local silver = self.m_dict_config.f_dict_emperor[level][12]
	local exp = self.m_dict_config.f_dict_emperor[level][13]
	return silver, exp
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOpenLv
-- 获取建筑物开启的等级
-------------------------------------------------
function f_dict_config_manager:getOpenLv(type)
	return self.m_dict_config.f_dict_scene[type][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLimitJunling
-- 获取 军令 上限
-------------------------------------------------
function f_dict_config_manager:getLimitJunling(level)
	return self.m_dict_config.f_dict_emperor[level][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPvelevelDes
-- 获取 pve小关卡的 描述
-------------------------------------------------
function f_dict_config_manager:getPvelevelName(level)
	local id = self.m_dict_config.f_dict_pve_level[level][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPvelevelDes
-- 获取 pve小关卡的 描述
-------------------------------------------------
function f_dict_config_manager:getPvelevelDes(level)
	return self.m_dict_config.f_dict_pve_level[level][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getObtainExp
-- 获取 pve获得经验值
-------------------------------------------------
function f_dict_config_manager:getObtainExp(level)
	return self.m_dict_config.f_dict_pve_level[level][13]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getObtainSilver
-- 获取 pve银两
-------------------------------------------------
function f_dict_config_manager:getObtainSilver(level)
	return self.m_dict_config.f_dict_pve_level[level][14]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCostStrength
-------------------------------------------------
function f_dict_config_manager:getCostStrength(level)
	return self.m_dict_config.f_dict_pve_level[level][15]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPveStageRewardData
-------------------------------------------------
function f_dict_config_manager:getPveStageRewardData(level)
	local reward = {}
	for i = 17,21 do
	-- type指定道具类型：1-普通道具，2-美女卡牌道具，3-名臣卡牌道具   4-元宝，5-银两，6-装备，7-vip元宝 8-功绩值 9-碎片 10-名臣碎片 11-美女碎片 12装备碎片 13-兵法碎片
	-- 17-->officer 18-->beauty 19-->equipment 20-->chip 21-->prop
		local type = 0
		local order = 0
		if i== 17 then type = 3 order = 3
		elseif i== 18 then type = 2 order = 4
		elseif i == 19 then type = 6 order = 2
		elseif i == 20 then type = 9 order = 1
		else type = 1  order = 5 end
	
		if self.m_dict_config.f_dict_pve_level[level][i] ~= 0 and
				self.m_dict_config.f_dict_pve_level[level][i]~= "" then
			table.insert(reward,{[3] = type, [4]=self.m_dict_config.f_dict_pve_level[level][i],[5]=1,[6]= order})	
		end
	end
	
	--美女碎片
	if self.m_dict_config.f_dict_pve_level[level][27] ~= 0 and
				self.m_dict_config.f_dict_pve_level[level][27]~= "" then
		table.insert(reward,{[3] = 11, [4]=self.m_dict_config.f_dict_pve_level[level][27],[5]=1,[6]= 6})	
	end
	--装备碎片
	if self.m_dict_config.f_dict_pve_level[level][28] ~= 0 and
			self.m_dict_config.f_dict_pve_level[level][28]~= "" then
		table.insert(reward,{[3] = 12, [4]=self.m_dict_config.f_dict_pve_level[level][28],[5]=1,[6]= 7})	
	end
	
	local compFunc = function(data1, data2)
		return	data1[6] < data2[6]
	end	
	table.sort(reward,compFunc)
	
	return reward
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLevelEnemyData
-------------------------------------------------
function f_dict_config_manager:getLevelEnemyData(level)
	local t = string.split(self.m_dict_config.f_dict_pve_level[level][5], ",")
	local enemyArr = {}
	for i,v in ipairs(t) do
		table.insert(enemyArr,toint(v))
	end
	
	return enemyArr
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLimitStrength
-- 获取 体力值 上限
-------------------------------------------------
function f_dict_config_manager:getLimitStrength(level)
	return self.m_dict_config.f_dict_emperor[level][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getStrengthRecover
-- 获取 体力值 回复值
-------------------------------------------------
function f_dict_config_manager:getStrengthRecover(level)
	return self.m_dict_config.f_dict_emperor[level][7]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEnergyRecover
-- 获取 精力值值 回复值
-------------------------------------------------
function f_dict_config_manager:getEnergyRecover(level)
	return self.m_dict_config.f_dict_emperor[level][6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getJunlingRecover
-- 获取 军令 回复值
-------------------------------------------------
function f_dict_config_manager:getJunlingRecover(level)
	return self.m_dict_config.f_dict_emperor[level][8]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardFile
-- 获取卡牌头像文件名，不包括扩展名
-------------------------------------------------
function f_dict_config_manager:getCardFile(cardId)
	local temp = self.m_dict_config.f_dict_officer_card[cardId]
	if temp ~= nil then
		return temp[2]
	end
	return ""
end


-------------------------------------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardAddition
-- 获取装备和卡牌缘分的加成
-------------------------------------------------------------------------------
function f_dict_config_manager:getCardAddition(position,cardData, adv)
	local weaponAdd = 0
	local armorAdd = 0
	local bingfaAtt = 1
	local bingfaDef = 1
	
	if adv == nil then
		adv = cardData["advanced"]
	end
	
	local advAtt = 0
   	local advDef = 0
   	local effect = self.m_dict_config.f_dict_officer_card[cardData["officerId"]][31]
	if effect > 0 then
		advAtt = self.m_dict_config.f_dict_advanced_effect[adv][2 * effect]
		advDef = self.m_dict_config.f_dict_advanced_effect[adv][2 * effect + 1]
	end
	
	local tianfuAtt = 0
	local tianfuDef = 0
	
	local star = self:getCardQuality(cardData["officerId"])
	if star >= 3 or self:isCardCanAdvance(cardData["officerId"]) then
		if adv > 1 then
			local skills = self:getAdvanceSkill(cardData["officerId"])
			local lvsT = self:getUnlockTianFuArr()
			for i = 1, 2 do
				if adv >= lvsT[i] then
					if skills[i][4] == 1 then
						tianfuAtt = tianfuAtt + skills[i][5]
					elseif skills[i][4] == 2 then
						tianfuDef = tianfuDef + skills[i][5]
					elseif skills[i][4] == 3 then
						tianfuAtt = tianfuAtt + skills[i][5]
						tianfuDef = tianfuDef + skills[i][5]
					end
				end
			end
		end
	end
	
	
	if position ~= 0 then
		local weapon,armor, bingfa = g_game.g_userInfoManager:getEquipForCard(position)
		
		if weapon ~= nil then
			weaponAdd = g_game.g_dictConfigManager:getWeaponAddition(weapon["equip_id"],weapon["equip_level"])
		end
		if armor ~= nil then
		    armorAdd = g_game.g_dictConfigManager:getArmorAddition(armor["equip_id"],armor["equip_level"])
		end
		if bingfa ~= nil then
			bingfaAtt = g_game.g_dictConfigManager:getWeaponAddition(bingfa["equip_id"],bingfa["equip_level"]) / 100 + 1
			bingfaDef = g_game.g_dictConfigManager:getArmorAddition(bingfa["equip_id"],bingfa["equip_level"]) / 100 + 1
		end
	else
		return advAtt, advDef
	end
    
    local atkAddition,defAddition = g_game.g_dictConfigManager:getCombinationAddition(cardData["officerId"],cardData["officerLevel"])
    atkAddition = cardData["attack"]*atkAddition/100
    defAddition = cardData["defense"]*defAddition/100
    
    atkAddition = weaponAdd + atkAddition
    defAddition = armorAdd + defAddition
    
    --皇子上阵加成
   	local soldierType = cardData["soldierType"]
   	--1 2 3 4 步弓骑枪
   	local atkPrinceAdditon,defPrinceAddition = self:getPrinceAddition(soldierType)
   	atkPrinceAdditon = atkPrinceAdditon
   	defPrinceAddition = defPrinceAddition
   	
   	
   	atkAddition = atkAddition + atkPrinceAdditon + advAtt + cardData["attack"] * bingfaAtt - cardData["attack"] + tianfuAtt
    defAddition = defAddition + defPrinceAddition + advDef + cardData["defense"] * bingfaDef- cardData["defense"] + tianfuDef
    
    return atkAddition, defAddition
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceAddition
-- 皇子加成值  是百分比  需要乘以  兵种的攻击力和防御力
-------------------------------------------------
function f_dict_config_manager:getPrinceAddition(soldierType)
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	local battleList = princeInfo["battleList"]
	
	local atkAdd = 0
	local defAdd = 0
	for i = 1, #battleList do
		local level = battleList[i]["princeLevel"]
		local passiveSkillId = battleList[i]["passiveSkillId"]
	    local passiveSkillValue = g_game.g_dictConfigManager:getPassiveSkillValue(passiveSkillId) / 100
		local passiveSkillGrow = g_game.g_dictConfigManager:getPassiveSkillGrow(passiveSkillId) / 100	
		local passiveSkillAddtionNum = passiveSkillValue + (level - 1) * passiveSkillGrow	
		
		local skillEffectType  = self:getPassiveSkillEffect(passiveSkillId)
		local targetType = self:getPrinceAdditionTargetType(skillEffectType)
		local addType = self:getPrinceAdditionEffectType(skillEffectType)
		
		local type = self:getSoliderInfo(soldierType)[3]
		if type == targetType then
			if addType == 1 then
				atkAdd = atkAdd + passiveSkillAddtionNum
			elseif addType == 2 then
				defAdd =  defAdd + passiveSkillAddtionNum
			else
				atkAdd = atkAdd + passiveSkillAddtionNum
				defAdd =  defAdd + passiveSkillAddtionNum
			end
		elseif targetType == 5 then
			atkAdd = atkAdd + passiveSkillAddtionNum
			defAdd =  defAdd + passiveSkillAddtionNum
		end
		
	end
	
	return atkAdd,defAdd
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceAdditionTargetType
-- 皇子加成目标类型 1步兵 2弓兵  3骑兵  4枪兵 5全体
-------------------------------------------------
function f_dict_config_manager:getPrinceAdditionTargetType(skillEffect)
	local targetType = skillEffect - math.floor(skillEffect/10)*10
	return targetType
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceAdditionEffectType
-- 皇子加成目标类型  1加攻击  2加防御  3加攻防
-------------------------------------------------
function f_dict_config_manager:getPrinceAdditionEffectType(skillEffect)
	return math.floor(skillEffect/ 10)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinationAddition
-- 缘分
-------------------------------------------------
function f_dict_config_manager:getCombinationAddition(officerid,cardLv)
	local curCombinationData = g_game.g_userInfoManager:getUserCombination()
	
	local attAdd = 0
	local defAdd = 0
	
	if curCombinationData["cardCombinaList_Num"] == 0 then
		return attAdd,defAdd
	end
	
	local combinationBaseData= self.m_dict_config.f_dict_card_merge
	local combinationArr = {}
	for i= 1, curCombinationData["cardCombinaList_Num"] do
		table.insert(combinationArr,combinationBaseData[curCombinationData["cardCombinaList"][i]["combinaId"]])
	end
	
	local cardType = self:getCardType(officerid)
	local attGrow = self.m_dict_config.f_dict_officer_card[officerid][10]
	local defGrow = self.m_dict_config.f_dict_officer_card[officerid][9]
	
	for i = 1, #combinationArr do
		for j = 4,13 do
			if combinationArr[i][j] == officerid then
				if cardType == 1 then attAdd = attAdd + combinationArr[i][14]  end
				if cardType == 2 then defAdd = defAdd + combinationArr[i][14]  end
			end
		end
	end
	
	return attAdd, defAdd
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardCombination
-- 获取card的所有组合信息
-------------------------------------------------
function f_dict_config_manager:getCardCombinationArr(cardId)
	local combinationArr = {}
	
	for i = 1,7 do
		table.insert(combinationArr,self.m_dict_config.f_dict_officer_card[cardId][i+15])
	end
	return combinationArr
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardType
-- 获取card的 type
-------------------------------------------------
function  f_dict_config_manager:getCardType(cardId)
	return self.m_dict_config.f_dict_officer_card[cardId][15]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerIntell
-- 获取对应名臣的对应等级的智力
-------------------------------------------------
function f_dict_config_manager:getOfficerIntell(officerId, officerLevel)
	local init = self.m_dict_config.f_dict_officer_card[officerId][8]
	local grow = self.m_dict_config.f_dict_officer_card[officerId][11]
	local actual = math.round((init + (officerLevel - 1) * grow)/100)
	return actual
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerAttack
-- 获取对应名臣的对应等级的攻击
-------------------------------------------------
function f_dict_config_manager:getOfficerAttack(officerId, officerLevel, adv)
	if adv == nil then
		adv = 1
	end
	local init = self.m_dict_config.f_dict_officer_card[officerId][7]
	local grow = self.m_dict_config.f_dict_officer_card[officerId][10]
	local effect = self.m_dict_config.f_dict_officer_card[officerId][31]
	if effect > 0 then
		effect = self.m_dict_config.f_dict_advanced_effect[adv][2 * effect]
	else
		effect = 0
	end
	local actual = math.round((init + (officerLevel - 1) * grow)/100) + effect
	return actual
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerDefense
-- 获取对应名臣的对应等级的防御
-------------------------------------------------
function f_dict_config_manager:getOfficerDefense(officerId, officerLevel, adv)
	if adv == nil then
		adv = 1
	end
	local init = self.m_dict_config.f_dict_officer_card[officerId][6]
	local grow = self.m_dict_config.f_dict_officer_card[officerId][9]
	local effect = self.m_dict_config.f_dict_officer_card[officerId][31]
	if effect > 0 then
		effect = self.m_dict_config.f_dict_advanced_effect[adv][2 * effect + 1]
	else
		effect = 0
	end
	local actual = math.round((init + (officerLevel - 1) * grow)/100) + effect
	return actual
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerCardData
-- 获取卡牌data
-------------------------------------------------
function f_dict_config_manager:getOfficerCardData(cardId)
	return self.m_dict_config.f_dict_officer_card[cardId]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardHeadFile
-- 获取卡牌头像文件名，不包括扩展名
-------------------------------------------------
function f_dict_config_manager:getCardHeadFile(cardId)
	local temp = self.m_dict_config.f_dict_officer_card[cardId]
	if temp ~= nil then
		return temp[2]
	end
	return ""
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerCardNumOpenedLv
-- 获取 某数目名臣卡牌 开启的 等级
-------------------------------------------------
function f_dict_config_manager:getOfficerCardNumOpenedLv(num)
	local arr = self.m_dict_config.f_dict_emperor
	
	for i = 1, table.getn(arr) do
		if arr[i][9] == num then
			return i
		end
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyNumOpenedLv
-- 获取 某数目美女卡牌 开启的 等级
-------------------------------------------------
function f_dict_config_manager:getBeautyNumOpenedLv(num)
	local arr = self.m_dict_config.f_dict_emperor
	
	for i = 1, table.getn(arr) do
		if arr[i][10] == num then
			return i
		end
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChapterNum
--获得chapterNum
-------------------------------------------------
function f_dict_config_manager:getChapterNum()
	return table.getn(self.m_dict_config.f_dict_area)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBigBattleRewardData
-------------------------------------------------
function f_dict_config_manager:getBigBattleRewardData(bigStageId)
	local rewardData = {}
	rewardData["silver"] = self.m_dict_config.f_dict_stage[bigStageId][6]
	rewardData["gold"] = self.m_dict_config.f_dict_stage[bigStageId][7]
	rewardData["prop1"] = {["propId"] = self.m_dict_config.f_dict_stage[bigStageId][8],["num"] = self.m_dict_config.f_dict_stage[bigStageId][9]}
	rewardData["prop2"] = {["propId"] = self.m_dict_config.f_dict_stage[bigStageId][10],["num"] = self.m_dict_config.f_dict_stage[bigStageId][11]}
	
	return rewardData
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEliteStageArr
-------------------------------------------------
function f_dict_config_manager:getEliteStageArr(chapterId)
	local startStage = self.m_dict_config.f_dict_area[chapterId][4]
	local endStage = self.m_dict_config.f_dict_area[chapterId][5]
	
	local eliteArr = {}

	for i = startStage,endStage do
		table.insert(eliteArr, self.m_dict_config.f_dict_elite_level[i])			
	end
	
	return eliteArr
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEliteStageData
-------------------------------------------------
function f_dict_config_manager:getEliteStageData(stageId)
	return self.m_dict_config.f_dict_elite_level[stageId]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChapterBigBattleArr
-------------------------------------------------
function f_dict_config_manager:getChapterBigBattleArr(chapterid)
	local startStage = self.m_dict_config.f_dict_area[chapterid][4]
	local endStage = self.m_dict_config.f_dict_area[chapterid][5]
	
	local bigBattleArr = {}

	for i = startStage,endStage do
		table.insert(bigBattleArr, self.m_dict_config.f_dict_stage[i])			
	end
	
	--[[local bigBattleArr = {
		self.m_dict_config.f_dict_stage[1 + (chapterid-1)*5],
		self.m_dict_config.f_dict_stage[2 + (chapterid-1)*5],
		self.m_dict_config.f_dict_stage[3 + (chapterid-1)*5],
		self.m_dict_config.f_dict_stage[4 + (chapterid-1)*5],
		self.m_dict_config.f_dict_stage[5 + (chapterid-1)*5],
	}]]--
	 
	return bigBattleArr
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLastLevelOfStage
--获得该stage的最后一个关卡
-------------------------------------------------
function f_dict_config_manager:getLastLevelOfStage( stageId)
	return self.m_dict_config.f_dict_stage[stageId][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSmallBattleArr
--获得chapterNum
-------------------------------------------------
function f_dict_config_manager:getSmallBattleArr( bigBattleid)
	local smallStageStart = self.m_dict_config.f_dict_stage[bigBattleid][4]
	local smallStageEnd = self.m_dict_config.f_dict_stage[bigBattleid][5]
	
	local smallBattleArr = {}

	for i = smallStageStart,smallStageEnd do
		table.insert(smallBattleArr, self.m_dict_config.f_dict_pve_level[i])			
	end
	
	return  smallBattleArr
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChapterDataByIndex
--获取chapterData
-------------------------------------------------
function f_dict_config_manager:getChapterDataByIndex(index)
	return self.m_dict_config.f_dict_area[index]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChapterName
-- 获取章节的名字
-------------------------------------------------
function f_dict_config_manager:getChapterName(chapterId)
	local id = self.m_dict_config.f_dict_area[chapterId][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBigBattleName
-- 获取大战役名字
-------------------------------------------------
function f_dict_config_manager:getBigBattleName(bigbattleId)
	local id = self.m_dict_config.f_dict_stage[bigbattleId][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getNeedStrength
-- 获取攻打关卡需要的数据
-------------------------------------------------
function f_dict_config_manager:getNeedStrength(smallbattleId)
	return self.m_dict_config.f_dict_pve_level[smallbattleId][15]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBigBattleDes
--大战役的描述
-------------------------------------------------
function f_dict_config_manager:getBigBattleDes(bigBattleId)
	return self.m_dict_config.f_dict_stage[bigBattleId][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyDesc
-- 获取美女描述
-------------------------------------------------
function f_dict_config_manager:getBeautyDesc(beautyId)
	local id = self.m_dict_config.f_dict_beauty[beautyId][3]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyEatenSilverCost
-- 获取美女被宫斗 需要花费多少银两
-------------------------------------------------
function f_dict_config_manager:getBeautyEatenSilverCost(beautyId)
	return self.m_dict_config.f_dict_beauty[beautyId][8]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyEatenBaseExp
-- 获取美女被宫斗时候的 吞卡经验 基础值
-------------------------------------------------
function f_dict_config_manager:getBeautyEatenBaseExp(beautyId)
	return self.m_dict_config.f_dict_beauty[beautyId][7]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyAddition
-- 获取加成
-------------------------------------------------
function f_dict_config_manager:getBeautyAddition(id)
	return self.m_dict_config.f_dict_beauty_skill[id]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyAdditionId
-- 获取加成
-------------------------------------------------
function f_dict_config_manager:getBeautyAdditionId(beautyId)
	return self.m_dict_config.f_dict_beauty[beautyId][6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyResource
-------------------------------------------------
function f_dict_config_manager:getBeautyResource(beautyId)
	return self.m_dict_config.f_dict_beauty[beautyId][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautySkillName
-- 获取技能名字
-------------------------------------------------
function f_dict_config_manager:getBeautySkillName(beautyId)
	local skillId = self.m_dict_config.f_dict_beauty[beautyId][6]
	
	if skillId == 0 then
		if LANGUAGE_TYPE == 3 then
			return "無技能"
		elseif LANGUAGE_TYPE == 2 then
			return "无技能"
		else
			return "无技能"
		end
	else
		local id = self.m_dict_config.f_dict_beauty_skill[skillId][2]
		return self:getLanTextById(id)
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyQuality
-- 获取美女的品质
-------------------------------------------------
function f_dict_config_manager:getBeautyQuality(beautyId)
	return self.m_dict_config.f_dict_beauty[beautyId][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautiName
-- 获取美女的名字
-------------------------------------------------
function f_dict_config_manager:getBeautiName(beautyId)
	local id = self.m_dict_config.f_dict_beauty[beautyId][2]
	
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitle
-- 获得美女title
-------------------------------------------------
function f_dict_config_manager:getTitle(type)
	return self.m_dict_config.f_dict_cefeng[type][2]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitleDes
-- 获得美女titlt 描述
-------------------------------------------------
function f_dict_config_manager:getTitleDes(type)
	local id = self.m_dict_config.f_dict_cefeng[type][8]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChongxingRewardType
-- 获取宠幸奖励的type
-------------------------------------------------
function f_dict_config_manager:getChongxingRewardType(id)
	return self.m_dict_config.f_dict_beauty_reward[id][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitleQinmidu
-- 获得title 亲密度
-------------------------------------------------
function f_dict_config_manager:getTitleQinmidu(type)
	return self.m_dict_config.f_dict_cefeng[type][6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitleLen
-- 获得title 的总长度
-------------------------------------------------
function f_dict_config_manager:getTitleLen()
	return #self.m_dict_config.f_dict_cefeng
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCefengTitleList
-- 获得title 列表
-------------------------------------------------
function f_dict_config_manager:getCefengTitleList()
	return self.m_dict_config.f_dict_cefeng
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitleCostSilver
-- 获得美女title消耗银两
-------------------------------------------------
function f_dict_config_manager:getTitleCostSilver(type)
	return self.m_dict_config.f_dict_cefeng[type][7]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitlePrincessAddition
-- 获得美女加成
-------------------------------------------------
function f_dict_config_manager:getTitlePrincessAddition(type)
	return self.m_dict_config.f_dict_cefeng[type][4]
end

--tmp(未添加和配置装备图片)
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipResource
-- 获得装备资源
-------------------------------------------------
function f_dict_config_manager:getEquipResource(equipId)
	return self.m_dict_config.f_dict_equipment[equipId][13]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getWeaponAddition
-------------------------------------------------
function f_dict_config_manager:getWeaponAddition(equipId,level)
	local atkGrow = self.m_dict_config.f_dict_equipment[equipId][4]
	local atkBase = self.m_dict_config.f_dict_equipment[equipId][7]
	
	local add = (level-1)*atkGrow + atkBase 
	return add/100
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getArmorAddition
-------------------------------------------------
function f_dict_config_manager:getArmorAddition(equipId,level)
	local defGrow = self.m_dict_config.f_dict_equipment[equipId][5]
	local defBase = self.m_dict_config.f_dict_equipment[equipId][8]
	
	local add = (level-1)*defGrow + defBase 
	return add/100
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipUpgradPrice
-- 获得装备升级价格
-------------------------------------------------
function f_dict_config_manager:getEquipUpgradPrice(level, star)
	return self.m_dict_config.f_dict_equipment_exp[level][star + 1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipType
-- 获得装备类型
-------------------------------------------------
function f_dict_config_manager:getEquipType(id)
	return self.m_dict_config.f_dict_equipment[id][6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipDes
-- 获得装备描述
-------------------------------------------------
function f_dict_config_manager:getEquipDes(id)
	local id = self.m_dict_config.f_dict_equipment[id][9]
	return self:getLanTextById(id)
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipName
-- 获得装备名称
-------------------------------------------------
function f_dict_config_manager:getEquipName(equipId)
	local id = self.m_dict_config.f_dict_equipment[equipId][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipPrice
-- 获得装备价格
-------------------------------------------------
function f_dict_config_manager:getEquipPrice(equipId, level)
	local star = self.m_dict_config.f_dict_equipment[equipId][3]
	return self.m_dict_config.f_dict_equipment_exp[level][star + 6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBingfaPrice
-- 获得兵法价格
-------------------------------------------------
function f_dict_config_manager:getBingfaPrice(equipId, level)
	local star = self.m_dict_config.f_dict_equipment[equipId][3]
	return self.m_dict_config.f_dict_book_exp[level][star + 6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipById
-- 获得装备信息
-------------------------------------------------
function f_dict_config_manager:getEquipById(equipId)
	return self.m_dict_config.f_dict_equipment[equipId]
end

--tmp(未添加碎片图片和配置碎片表)
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChipResource
-- 获得碎片资源
-------------------------------------------------
function f_dict_config_manager:getChipResource(chipId)
	return "baosi.png"
end

--tmp(未添加碎片图片和配置碎片表)
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChipName
-- 获得碎片名称
-------------------------------------------------
function f_dict_config_manager:getChipName(chipId)
	return "步非烟"
end

--tmp(未添加和配置道具图片)
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropsResource
-- 获得道具资源
-------------------------------------------------
function f_dict_config_manager:getPropsResource(propsId)
	return self.m_dict_config.f_dict_props[propsId][10]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropsOrder
-- 获得道具排序
-------------------------------------------------
function f_dict_config_manager:getPropsOrder(propsId)
	return self.m_dict_config.f_dict_props[propsId][14]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropsQuality
-- 获得道具品质
-------------------------------------------------
function f_dict_config_manager:getPropsQuality(propsId)
	return self.m_dict_config.f_dict_props[propsId][9]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropsName
-- 获得道具名称
-------------------------------------------------
function f_dict_config_manager:getPropsName(propsId)
	local id = self.m_dict_config.f_dict_props[propsId][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropsType
-- 获得道具类型
-------------------------------------------------
function f_dict_config_manager:getPropsType(propsId)
	return self.m_dict_config.f_dict_props[propsId][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropsByType
-- 根据道具类型返回数据
-------------------------------------------------
function f_dict_config_manager:getPropsByType(type)
	local props = {}
	for _,prop in pairs(self.m_dict_config.f_dict_props) do
		if prop[4] == type then
			table.insert(props, prop)
		end
	end
	return props
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropById
-- 获得道具信息
-------------------------------------------------
function f_dict_config_manager:getPropById(propsId)
	return self.m_dict_config.f_dict_props[propsId]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitlePrinceAddition
-- 获得皇子加成
-------------------------------------------------
function f_dict_config_manager:getTitlePrinceAddition(type)
	return self.m_dict_config.f_dict_cefeng[type][5]
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceDesc
-- 获得皇子描述
-------------------------------------------------
function f_dict_config_manager:getPrinceDesc(descId)
	local id = self.m_dict_config.f_dict_prince_des[tostring(descId)][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceEducationCostSilver
-- 获得教育一次所消耗的银两
-------------------------------------------------
function f_dict_config_manager:getPrinceEducationCostSilver(quality)
	return self.m_dict_config.f_dict_prince[quality][2]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getTitleLimit
-- 获得title的上限
-------------------------------------------------
function f_dict_config_manager:getTitleLimit(type)
	return self.m_dict_config.f_dict_cefeng[type][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBuildingList
-- 获取当前级别开启的建筑列表
-------------------------------------------------
function f_dict_config_manager:getBuildingList(level)
--	local buildList = {}
--	local temp = self.m_dict_config.f_dict_scene
--	for i,v in ipairs(temp) do
--		if tonumber(v[3]) <= level then
--			buildList[v[1]] = v
--		end
--	end
--	return buildList
	return self.m_dict_config.f_dict_scene
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLianhuaBaozhu
-- 获取炼化宝珠数
-------------------------------------------------
function f_dict_config_manager:getLianhuaBaozhu(star, type)
	return self.m_dict_config.f_dict_jitian_star[star][type + 1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLianhuaAdvTimes
-- 获取炼化宝珠倍数
-------------------------------------------------
function f_dict_config_manager:getLianhuaAdvTimes(adv, type)
	if adv == 0 then
		return 0
	end
	if type == 1 then
		return self.m_dict_config.f_dict_jitian_advanced[adv][5]
	end
	if type == 2 then
		return self.m_dict_config.f_dict_jitian_advanced[adv][7]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLianhuaItem
-- 获取炼化道具数量
-------------------------------------------------
function f_dict_config_manager:getLianhuaItem(star, adv, type)
	if adv == 0 then
		return 0
	end
	if type == 1 then
		return self.m_dict_config.f_dict_jitian_advanced[adv][star - 1]
	end
	if type == 2 then
		return self.m_dict_config.f_dict_jitian_advanced[adv][6]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLianhuaCard
-- 获取炼化经验卡
-------------------------------------------------
function f_dict_config_manager:getLianhuaCard(star, level, type)
	if type ~= 3 then
		return self.m_dict_config.f_dict_jitian_level[level][star - 1]
	else
		return self.m_dict_config.f_dict_jitian_level[level][star + 2]
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getExpLimitByLv
-- 根据当前卡牌品质，等级 获取该等级的经验上限
-------------------------------------------------
function f_dict_config_manager:getExpLimitByLv(level,quality)
	return self.m_dict_config.f_dict_card_level_up[level][quality+1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautiExpLimitByLv
-- 根据当前卡牌品质，等级 获取该等级的经验上限
-------------------------------------------------
function f_dict_config_manager:getBeautiExpLimitByLv(level,quality)
	return self.m_dict_config.f_dict_beauty_exp[level][quality+1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSaleBeautyValue
-- 根据当前卡牌品质，等级 获取该等级的经验上限
-------------------------------------------------
function f_dict_config_manager:getSaleBeautyValue(level,quality)
	return self.m_dict_config.f_dict_beauty_exp[level][quality+6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLevelInfo
-- 获取当前关卡信息，最低层关卡
-------------------------------------------------
function f_dict_config_manager:getLevelInfo(levelId)
	return self.m_dict_config.f_dict_pve_level[levelId]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getLevelAtkNumLimit
-- 获取关卡 攻击 限制 次数
-------------------------------------------------
function f_dict_config_manager:getLevelAtkNumLimit(levelId)
	return self.m_dict_config.f_dict_pve_level[levelId][16]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getStageIcon
-- 获取stage icon
-------------------------------------------------
function f_dict_config_manager:getStageIcon(stageId)
	return self.m_dict_config.f_dict_pve_level[stageId][24]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSoliderInfo
-- 获取指定兵种的配置信息
-------------------------------------------------
function f_dict_config_manager:getSoliderInfo(soldier_id)
	return self.m_dict_config.f_dict_soldier[soldier_id]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSoldierName
-- 获得兵种名字
-------------------------------------------------
function f_dict_config_manager:getSoldierName(officerId)
	local typeBig = self.m_dict_config.f_dict_officer_card[officerId][14]
	local id = self.m_dict_config.f_dict_soldier[typeBig][2]
	return self:getLanTextById(id)
end


function f_dict_config_manager:getSoldierBigType(officerId)
	return self.m_dict_config.f_dict_officer_card[officerId][14]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinationId
-- 获取组合id
-------------------------------------------------
function f_dict_config_manager:getCombinationId(officerId,combinationIndex)
	return self.m_dict_config.f_dict_officer_card[officerId][15+combinationIndex]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinationName
-- 获取组合名字
-------------------------------------------------
function f_dict_config_manager:getCombinationName(id)
	local id = self.m_dict_config.f_dict_card_merge[id][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinationValue
-- 获取组合加成值
-------------------------------------------------
function f_dict_config_manager:getCombinationValue(id)
	return self.m_dict_config.f_dict_card_merge[id][14]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinationType
-- 获取组合类型
-------------------------------------------------
function f_dict_config_manager:getCombinationType(id)
	return self.m_dict_config.f_dict_card_merge[id][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinDes
-- 获取组合描述
-------------------------------------------------
function f_dict_config_manager:getCombinDes(id)
	local id = self.m_dict_config.f_dict_card_merge[id][15]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCombinationMemberIds
-- 获取组合各卡牌id组
-------------------------------------------------
function f_dict_config_manager:getCombinationMemberIds(id)
	local arr = {}
	
	for i = 1, 10 do
		table.insert(arr,self.m_dict_config.f_dict_card_merge[id][3+i])
	end
	
	return arr
	
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerSkillIdGroup
-- 获取officer card skill id
-------------------------------------------------
function f_dict_config_manager:getOfficerSkillIdGroup(officerId)
	local group = {}
	
	for i = 1, 3 do
		table.insert(group,self.m_dict_config.f_dict_officer_card[officerId][22+i])
	end
	
	return group
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSoldierInfo
-- 获得soldier info
-------------------------------------------------
function f_dict_config_manager:getSoldierInfo(officerId, adv)
	
	local star = self:getCardQuality(officerId)
	if star >= 3 or self:isCardCanAdvance(officerId) then
		if adv > 1 then
			local skills = self:getAdvanceSkill(officerId)
			local lvsT = self:getUnlockTianFuArr()
			for i = 1, 2 do
				if adv >= lvsT[i] and skills[i][4] == 7 then
					return  self.m_dict_config.f_dict_soldier[skills[i][5]]
				end
			end
		end
	end
	
	return  self.m_dict_config.f_dict_soldier[self.m_dict_config.f_dict_officer_card[officerId][14]]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSoldierType
-- 获得soldier type
-------------------------------------------------
function f_dict_config_manager:getSoldierType(officerId)
	local typeBig = self.m_dict_config.f_dict_officer_card[officerId][14]
	return self.m_dict_config.f_dict_soldier[typeBig][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSoliderHeadIcon
-- 获取兵种icon
-------------------------------------------------
function f_dict_config_manager:getSoliderHeadIcon(soldier_id)
	return self.m_dict_config.f_dict_soldier[soldier_id][6]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardQuality
-- 获取卡牌品质
-------------------------------------------------
function f_dict_config_manager:getCardQuality(officerId)
	if self.m_dict_config.f_dict_officer_card[officerId] == nil then
		local a = 1
	end
	return self.m_dict_config.f_dict_officer_card[officerId][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getAdvanceSilver
-- 获取进阶需要银两
-------------------------------------------------
function f_dict_config_manager:getAdvanceSilver(adv, star)
	return self.m_dict_config.f_dict_card_advanced[adv][(star - 2) * 2]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getAdvanceSkill
-- 获取进阶天赋
-------------------------------------------------
function f_dict_config_manager:getAdvanceSkill(officerID)
	local t = {}
	for i = 0, 5 do
		local skill = self.m_dict_config.f_dict_officer_card[officerID][i + 32]
		table.insert(t, self.m_dict_config.f_dict_advanced_special[skill])
	end
	return t
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMaxTaxNum
-- 获取当前vip征税最大征税次数
-------------------------------------------------
function f_dict_config_manager:getMaxTaxNum(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][17]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMaxBuyStageNum
-- 获取当前vip最大购买副本次数
-------------------------------------------------
function f_dict_config_manager:getMaxBuyStageNum(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][11]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMaxAddReportsNum
-- 获取当前vip能增加批阅奏章次数
-------------------------------------------------
function f_dict_config_manager:getMaxAddReportsNum(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][18]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMaxReportsNum
-- 获取当前vip拥有奏章最大数
-------------------------------------------------
function f_dict_config_manager:getMaxReportsNum(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][19]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getStrengthUseLimit
-- 获取当前vip粮草道具当天使用最大次数
-------------------------------------------------
function f_dict_config_manager:getStrengthUseLimit(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][10]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMilitaryUseLimit
-- 获取当前vip军令道具当天使用最大次数
-------------------------------------------------
function f_dict_config_manager:getMilitaryUseLimit(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][9]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEnergyUseLimit
-- 获取当前vip精力道具当天使用最大次数
-------------------------------------------------
function f_dict_config_manager:getEnergyUseLimit(vipLv)
	return self.m_dict_config.f_dict_vip[vipLv+1][8]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isCardCanAdvance
-- 卡牌能否被进阶
-------------------------------------------------
function f_dict_config_manager:isCardCanAdvance(id)
	return self.m_dict_config.f_dict_officer_card[id][31] ~= 0
end

function f_dict_config_manager:getCardAdvanceEffect(id)
	return self.m_dict_config.f_dict_officer_card[id][31]
end

function f_dict_config_manager:getAdvanceEffect()
	return  self.m_dict_config.f_dict_advanced_effect
end

function f_dict_config_manager:getUnlockTianFuArr()
	local t ={}
	
	for i = 1, #self.m_dict_config.f_dict_card_advanced do
		if self.m_dict_config.f_dict_card_advanced[i][8] == 1 then
			table.insert(t,i)
		end
	end
	
	return t
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getAdvanceSkillAtLevel
-- 获取当前官阶的天赋
-------------------------------------------------
function f_dict_config_manager:getAdvanceSkillAtLevel(officerID, adv)
	local i = 1
	local find = false
	for i = 1, #g_game.g_advance_skill_level do
		if g_game.g_advance_skill_level[i] == adv then
			find = true
			break
		end
	end
	if not find then
		return nil, nil
	end
	local skill = self.m_dict_config.f_dict_officer_card[officerID][i + 31]
	return self.m_dict_config.f_dict_advanced_special[skill], i
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMaxAdvanceLevel
-- 获取最大进阶等级
-------------------------------------------------
function f_dict_config_manager:getMaxAdvanceLevel()
	return #self.m_dict_config.f_dict_card_advanced
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getAdvanceProp
-- 获取进阶需要道具
-------------------------------------------------
function f_dict_config_manager:getAdvanceProp(adv, star)
	return self.m_dict_config.f_dict_card_advanced[adv][(star - 2) * 2 + 1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] advanceNeedSameCard
-- 获取进阶是否需要同名卡
-------------------------------------------------
function f_dict_config_manager:advanceNeedSameCard(adv)
	return self.m_dict_config.f_dict_card_advanced[adv][8] == 1
end

--------------------------------
-- @function [parent=#f_dict_config_manager] getSkillInfo
-- 获取指定技能信息
-------------------------------------------------
function f_dict_config_manager:getSkillInfo(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId]
end

--------------------------------
-- @function [parent=#f_dict_config_manager] getSkillIcon
-- 获取skill icon
-------------------------------------------------
function f_dict_config_manager:getSkillIcon(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId][9]
end

-----------------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSkillNameResource
-- 获取技能名字图片
-----------------------------------------------------------
function f_dict_config_manager:getSkillNameResource(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId][21]
end

-----------------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceSkillBgResource
-- 获取皇子技能背景图片
-----------------------------------------------------------
function f_dict_config_manager:getPrinceSkillBgResource(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId][13]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSkillIcon
-- 获取指定主动技能图标
-------------------------------------------------
function f_dict_config_manager:getSkillIcon(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId][9]
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSkillAddtion
-- 获取指定主动技能加成
-------------------------------------------------
function f_dict_config_manager:getSkillAddtion(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId][7]
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSkillName
-- 获取指定主动技能名称
-------------------------------------------------
function f_dict_config_manager:getSkillName(skillId)
	local id = self.m_dict_config.f_dict_card_skill[skillId][2]
	return self:getLanTextById(id)
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSkillDesc
-- 获取指定主动技能描述
-------------------------------------------------
function f_dict_config_manager:getSkillDesc(skillId)
	local id = self.m_dict_config.f_dict_card_skill[skillId][8]
	return self:getLanTextById(id)
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getSkillQuality
-- 获取指定主动技能星级
-------------------------------------------------
function f_dict_config_manager:getSkillQuality(skillId)
	return self.m_dict_config.f_dict_card_skill[skillId][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillEffect
-- 获取指定被动技能类型
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillEffect(skillId)
	return self.m_dict_config.f_dict_prince_skill[skillId][5]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillName
-- 获取指定被动技能名称
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillName(skillId)
	local id = self.m_dict_config.f_dict_prince_skill[skillId][2]
	return self:getLanTextById(id)
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillDesc
-- 获取指定被动技能描述
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillDesc(skillId)
	local id = self.m_dict_config.f_dict_prince_skill[skillId][3]
	return self:getLanTextById(id)
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillValue
-- 获取指定被动技能基础值
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillValue(skillId)
	return self.m_dict_config.f_dict_prince_skill[skillId][6]
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillGrow
-- 获取指定被动技能变化值
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillGrow(skillId)
	return self.m_dict_config.f_dict_prince_skill[skillId][7]
end
-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillQuality
-- 获取指定被动技能品质
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillQuality(skillId)
	return self.m_dict_config.f_dict_prince_skill[skillId][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPassiveSkillAddition
-- 获取指定被动技能加成值
-------------------------------------------------
function f_dict_config_manager:getPassiveSkillAddition(skillId)
	return self.m_dict_config.f_dict_prince_skill[skillId][7]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardName
-- 获取卡牌名字
-------------------------------------------------
function f_dict_config_manager:getCardName(officerId)
	local id = self.m_dict_config.f_dict_officer_card[officerId][3]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardResource
-- 获取卡牌资源
-------------------------------------------------
function f_dict_config_manager:getCardResource(officerId)
	return self.m_dict_config.f_dict_officer_card[officerId][2]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getCardDescription
-- 获取卡牌描述
-------------------------------------------------
function f_dict_config_manager:getCardDescription(officerId)
	local id = self.m_dict_config.f_dict_officer_card[officerId][4]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerMergeExp
-- 获取卡牌合卡经验
-------------------------------------------------
function f_dict_config_manager:getOfficerMergeExp(officerId)
	return self.m_dict_config.f_dict_officer_card[officerId][29]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerMergeYinliang
-- 获取卡牌合卡消耗银两
-------------------------------------------------
function f_dict_config_manager:getOfficerMergeYinliang(officerId)
	return self.m_dict_config.f_dict_officer_card[officerId][30]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerUnAddExp
-------------------------------------------------
function f_dict_config_manager:getOfficerUnAddExp(quality,lv)
	local unadd = 0
	
	if lv - 1 == 0 then return unadd end
	
	for i = 1,lv-1 do
		unadd = unadd + self.m_dict_config.f_dict_card_level_up[i][quality+1]
	end
	
	return unadd
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceUnAddExp
-------------------------------------------------
function f_dict_config_manager:getPrinceUnAddExp(quality,lv)
	local unadd = 0
	
	if lv - 1 == 0 then return unadd end
	
	for i = 1,lv-1 do
		unadd = unadd + self.m_dict_config.f_dict_prince_exp[i][quality+1]
	end
	
	return unadd
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyUnAddExp
-------------------------------------------------
function f_dict_config_manager:getBeautyUnAddExp(quality,lv)
	local unadd = 0
	
	if lv - 1 == 0 then return unadd end
	
	for i = 1, lv-1 do
		unadd = unadd + self.m_dict_config.f_dict_beauty_exp[i][quality+1]
	end
	
	return unadd
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerStar
-- 获取卡牌品质
-------------------------------------------------
function f_dict_config_manager:getOfficerStar(officerId)
	return self.m_dict_config.f_dict_officer_card[officerId][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerExp
-- 获取卡牌升级需要的经验
-------------------------------------------------
function f_dict_config_manager:getOfficerExp(level,star)
	return self.m_dict_config.f_dict_card_level_up[level][star+1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerLevelMax
-- 获取到名臣的最大级别
-------------------------------------------------
function f_dict_config_manager:getOfficerLevelMax()
	return #self.m_dict_config.f_dict_card_level_up
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceLevelMax
-- 获取到当前皇子的升级信息
-------------------------------------------------
function f_dict_config_manager:getPrinceLevelMax()
	return #self.m_dict_config.f_dict_prince_exp
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceImage
-- 获取皇子图片
-------------------------------------------------
function f_dict_config_manager:getPrinceImage(star, resourceCol, level)
	local col = 0
--	math.randomseed(resourceCol)
	if level < 5 then
--		col = math.random(6,7)
		col = 6
	else
--		col = math.random(8,15)
		col = resourceCol + 7
	end
--	math.randomseed(os.time())
	return self.m_dict_config.f_dict_prince[star][col]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceExp
-- 获取皇子指定等级和星级的经验
-------------------------------------------------
function f_dict_config_manager:getPrinceExp(level, star)
	return self.m_dict_config.f_dict_prince_exp[level][1+star]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceMergeExp
-- 获取皇子被吞并可以贡献的基础经验
-------------------------------------------------
function f_dict_config_manager:getPrinceMergeExp(star)
	return self.m_dict_config.f_dict_prince[star][5]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPrinceMergeYinliang
-- 获取皇子被吞并时需要消耗的银两
-------------------------------------------------
function f_dict_config_manager:getPrinceMergeYinliang(star)
	return self.m_dict_config.f_dict_prince[star][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getContributeNumByRank
-- 获取皇子被吞并时需要消耗的银两
-------------------------------------------------
function f_dict_config_manager:getContributeNumByRank(rank)
	for i = #self.m_dict_config.f_dict_pvp_contribution, 1,-1 do
		if self.m_dict_config.f_dict_pvp_contribution[i][2] <= rank and
			rank <= self.m_dict_config.f_dict_pvp_contribution[i][3] then
			return self.m_dict_config.f_dict_pvp_contribution[i][4]
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] userChallengeJudge
-- 玩家挑战判定
-------------------------------------------------
function f_dict_config_manager:userChallengeJudge(userRank, pvpRank)	
    for k, v in pairs(self.m_dict_config.f_dict_pvp_interval) do
        if userRank >= v[1] and userRank <= v[2] then
        	local judegeLowLimit = userRank - v[3]
        	local judegeUpLimit = judegeLowLimit + v[3] - 1
        	
        	if judegeLowLimit < 1 then
        		judegeLowLimit = 1
        	end
        	
        	if pvpRank >= judegeLowLimit and pvpRank <= judegeUpLimit then
        		return true
        	end
        	return false
        end
    end
    
	return false
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getItemName
-- 获取道具名字
-------------------------------------------------
function f_dict_config_manager:getItemName(itemId)
	local id = self.m_dict_config.f_dict_props[itemId][2]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipName
-- 获取装备名字
-------------------------------------------------
function f_dict_config_manager:getEquipImage(id)
	return self.m_dict_config.f_dict_equipment[id][13]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipStar
-- 获取装备星级
-------------------------------------------------
function f_dict_config_manager:getEquipStar(id)
	return self.m_dict_config.f_dict_equipment[id][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBingfaUpgradeExp
-- 获取兵法升级经验
-------------------------------------------------
function f_dict_config_manager:getBingfaUpgradeExp(level, star)
	return self.m_dict_config.f_dict_book_exp[level][star + 1]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBingfaUpgradeMaxLv
-- 获取兵法最大等级
-------------------------------------------------
function f_dict_config_manager:getBingfaUpgradeMaxLv()
	return #self.m_dict_config.f_dict_book_exp + 1
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getItemValue
-- 获取道具 值
-------------------------------------------------
function f_dict_config_manager:getItemValue(itemId)
	return self.m_dict_config.f_dict_props[itemId][8]
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getItemResName
-- 获取道具图片的名字
-------------------------------------------------
function f_dict_config_manager:getItemResName(itemId)
	return self.m_dict_config.f_dict_props[itemId][10]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getItemRewardType
-- 获取道具奖励类型
-------------------------------------------------
function f_dict_config_manager:getItemRewardType(itemId)
	return self.m_dict_config.f_dict_props[itemId][4]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getItemDes
-- 获取道具描述
-------------------------------------------------
function f_dict_config_manager:getItemDes(itemId)
	local id = self.m_dict_config.f_dict_props[itemId][7]
	return self:getLanTextById(id)
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getItemQuality
-------------------------------------------------
function f_dict_config_manager:getItemQuality(itemId)
	return self.m_dict_config.f_dict_props[itemId][9]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPropData
-- 获取道具描述
-------------------------------------------------
function f_dict_config_manager:getPropData(itemId)
	return self.m_dict_config.f_dict_props[itemId]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getShopItems
-- 获取商店的 道具
-------------------------------------------------
function f_dict_config_manager:getShopItems()
	local itemsTable = self.m_dict_config.f_dict_props
	
	local showItems = {}
	for i = 1,#itemsTable do
		if itemsTable[i][3] == 1 then
			table.insert(showItems,itemsTable[i])
		end 
	end
	return showItems
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getVipInfo
-- 获取vip信息
-------------------------------------------------
function f_dict_config_manager:getVipInfo()
	return self.m_dict_config.f_dict_vip
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isItemCanUse
-- 道具能否被使用
-------------------------------------------------
function f_dict_config_manager:isItemCanUse(id)
	return self.m_dict_config.f_dict_props[id][12] == 1
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] isItemCanUseAll
-- 道具能否被全部使用
-------------------------------------------------
function f_dict_config_manager:isItemCanUseAll(id)
	return self.m_dict_config.f_dict_props[id][13] == 1
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getVipRewardByViplv
-------------------------------------------------
function f_dict_config_manager:getVipRewardByViplv(lv)
	local infoTable = {}
	for i = 1, #self.m_dict_config.f_dict_vip_package do
		if self.m_dict_config.f_dict_vip_package[i][2] == lv then
			table.insert(infoTable,self.m_dict_config.f_dict_vip_package[i])
		end
	end
	return infoTable
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getVipNeedYuanbao
-- 获取vip信息
-------------------------------------------------
function f_dict_config_manager:getVipNeedYuanbao(level)
	return self.m_dict_config.f_dict_vip[level+1][3]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getVipNeedYuanbao
-- 获取vip道具的 信息
-------------------------------------------------
function f_dict_config_manager:getVipPropInfo(vipIndex)
	return self.m_dict_config.f_dict_props[21+vipIndex]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getServerStartReward
-- 获取开服有礼奖励列表
-------------------------------------------------
function f_dict_config_manager:getServerStartReward()
	if self.m_startServerReward == nil then
		self.m_startServerReward = {["num"]=0,["reward_list"]={}}
		for _,rewardInfo in pairs(self.m_dict_config.f_dict_server_start_reward) do
			if self.m_startServerReward["reward_list"][rewardInfo[2]] == nil then
				self.m_startServerReward["reward_list"][rewardInfo[2]] = {}
				self.m_startServerReward["reward_list"][rewardInfo[2]]["list"] = {}
				self.m_startServerReward["reward_list"][rewardInfo[2]]["num"] = 0
				self.m_startServerReward["num"] = self.m_startServerReward["num"] + 1
			end
			local reward = {}
			reward["type"] = rewardInfo[3]
			reward["id"] = rewardInfo[1]
			reward["gid"] = rewardInfo[4]
			reward["num"] = rewardInfo[5]
			reward["effect"] = rewardInfo[6]
			table.insert(self.m_startServerReward["reward_list"][rewardInfo[2]]["list"], reward)
			self.m_startServerReward["reward_list"][rewardInfo[2]]["num"] = self.m_startServerReward["reward_list"][rewardInfo[2]]["num"] + 1
		end
	end
	
	return self.m_startServerReward
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getUserExtraYuanbaoByLevel
-- 通过玩家等级，获取到下一等级需要的元宝数量
-------------------------------------------------
function f_dict_config_manager:getUserExtraYuanbaoByLevel(level)
	local vipInfo = self.m_dict_config.f_dict_vip
	return vipInfo[level+2]["gold_price"] - vipInfo[level+1]["gold_price"]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getGongjizhiDuihuanInfo
-- 获取到功绩值兑换表
-------------------------------------------------
function f_dict_config_manager:getGongjizhiDuihuanInfo()
	return self.m_dict_config.f_dict_exchange
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getNpcList
-- 获取主场景 npc的 列表
-------------------------------------------------
function f_dict_config_manager:getNpcList()
	return self.m_dict_config.f_dict_effect
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEffectSplitPos
-- 获取主场景 npc的 列表
-------------------------------------------------
function f_dict_config_manager:getEffectSplitPos(index)
	local posStr = self.m_dict_config.f_dict_effect[index][3]
	local posTable = {}
	local t = string.split(posStr, "|")
	
	for i = 1,#t do
		local subPos = string.split(t[1],",")
		table.insert(posTable,cc.p(toint(subPos[1]),toint(subPos[2])))
	end
	
	return posTable
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] animationNeedBlend
-- 动画是否需要进行混合
-------------------------------------------------
function f_dict_config_manager:animationNeedBlend(animate, animation)
	local flashAnimate = self.m_dict_config.f_flash[animate]
	if flashAnimate == nil then
		return false
	end
    for key, value in pairs(flashAnimate) do
		if value == animation then
			return true
		end
	end
	
	return false
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getResByType
-- 根据类型获取资源路径
-------------------------------------------------
function f_dict_config_manager:getResByType(type, id)
	local imagePath = nil -- 图片路径
	local qulity = nil -- 品质
	local name = "" -- 路径
	if type ~= nil then
		if type == 1 then --物品
			local image = g_game.g_dictConfigManager:getPropsResource(id)
			imagePath = g_game.g_resourceManager:getItemImage(image)
			qulity = g_game.g_dictConfigManager:getPropsQuality(id)
			name = g_game.g_dictConfigManager:getPropsName(id)
		elseif type == 2 then --美女
			local image = g_game.g_dictConfigManager:getBeautyResource(id)
			imagePath = g_game.g_resourceManager:getBeautyCardHead(image)
			qulity = g_game.g_dictConfigManager:getBeautyQuality(id)
			name = g_game.g_dictConfigManager:getBeautiName(id)
		elseif type == 3 then --名臣
			local image = g_game.g_dictConfigManager:getCardResource(id)
			imagePath = g_game.g_resourceManager:getCardHead(image)
			qulity = g_game.g_dictConfigManager:getOfficerStar(id)
			name = g_game.g_dictConfigManager:getCardName(id)
		elseif type == 4 then --元宝
			imagePath = g_game.g_resourceManager:getItemImage("yuanbao_icon")
			qulity = 5
			name = "元宝"
			if LANGUAGE_TYPE==3  then
				name="元寶"
			end
		elseif type == 5 then --银两
			imagePath = g_game.g_resourceManager:getItemImage("yinliang_icon")
			qulity = 2
			name = "银两"
			if LANGUAGE_TYPE==3  then
				name ="銀兩"
			end
		elseif type == 6 then --装备
			local image = g_game.g_dictConfigManager:getEquipImage(id)
			imagePath = g_game.g_resourceManager:getItemImage(image)
			qulity = g_game.g_dictConfigManager:getEquipStar(id)
			name = g_game.g_dictConfigManager:getEquipName(id)
		elseif type == 7 then --vip元宝
			imagePath = g_game.g_resourceManager:getItemImage("yuanbao_icon")
			qulity = 5
			name = "元宝"
			if LANGUAGE_TYPE==3  then
				name="元寶"
			end
		elseif type == 8 then -- 功绩值
			imagePath = g_game.g_resourceManager:getItemImage("gongji")
			qulity = 4
			name = "功绩值"
			if LANGUAGE_TYPE==3  then
				name="功績值"
			end
		elseif type == 9 then -- 碎片
			imagePath = self:getPieceImage(id)
			qulity = self:getPieceStar(id)
			name = self:getPieceName(id)
		elseif type == 10 then -- 名臣碎片
			imagePath = self:getPieceImage(id)
			qulity = self:getPieceStar(id)
			name = self:getPieceName(id)
		elseif type == 11 then -- 美女碎片
			imagePath = self:getPieceImage(id)
			qulity = self:getPieceStar(id)
			name = self:getPieceName(id)
		elseif type == 12 then -- 装备碎片
			imagePath = self:getPieceImage(id)
			qulity = self:getPieceStar(id)
			name = self:getPieceName(id)
		elseif type == 13 then -- 兵法碎片
			imagePath = self:getPieceImage(id)
			qulity = self:getPieceStar(id)
			name = self:getPieceName(id)
		elseif type == 14 then -- 真龙宝印
			imagePath = g_game.g_resourceManager:getItemImage("zhenlongbaoyin")
			qulity = 5
			name = "真龙宝印"
			if LANGUAGE_TYPE==3 then
				name="真龍寶印"
			end
		end
	end
	
	return imagePath, qulity, name
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getFortuneBoxConfig
-- 获得福袋配置列表
-------------------------------------------------
function f_dict_config_manager:getFortuneBoxConfig(page)
	local s = (page - 1) * 6 + 1
	local e = s + 5
	local t = {}
	local config = self.m_remoteConfig[g_game.g_huodong_box][1]
	for i = s, e do
		table.insert(t, config[i])
	end
	return t
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getChoujiangReward
-- 获得抽奖奖励列表
-------------------------------------------------
function f_dict_config_manager:getChoujiangReward()
	if self.m_remoteConfig[g_game.g_huodong_choujiang] ~= nil then
		local t = self.m_remoteConfig[g_game.g_huodong_choujiang][2]
		local ret = {}
		for i = 1, #t do
			table.insert(ret, {["image"] = t[i][2], ["name"] = t[i][4], ["star"] = t[i][3]})
		end
		return ret
	end
	return nil
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getRankRewardCount
-- 排名奖励总数
-------------------------------------------------
function f_dict_config_manager:getRankRewardCount()
	if self.m_remoteConfig[g_game.g_huodong_choujiang] ~= nil then
		return #self.m_remoteConfig[g_game.g_huodong_choujiang][1]
	end
	return 0
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getRankReward
-- 排名奖励
-------------------------------------------------
function f_dict_config_manager:getRankReward(index)
	if self.m_remoteConfig[g_game.g_huodong_choujiang] ~= nil then
		return self.m_remoteConfig[g_game.g_huodong_choujiang][1][index]
	end
	return nil
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getPeroidChargeReward
-- 限时充值奖励
-------------------------------------------------
function f_dict_config_manager:getPeroidChargeReward()
	local tempTable = {}
	tempTable["num"] = 0
	tempTable["list"] = {}
	
	local t = self.m_remoteConfig[g_game.g_huodong_chongzhi][1]
	for i = 1, #t do
		local data = t[i]
		if tempTable["list"][data[2]] == nil then
			tempTable["num"] = tempTable["num"] + 1
			tempTable["list"][data[2]] = {}
			tempTable["list"][data[2]]["num"] = 0
			tempTable["list"][data[2]]["list"] = {}
		end
		
		local dayReward = {}
		dayReward["money"] = data[3]
		dayReward["reward"] = {}
		dayReward["reward"]["num"] = 0
		dayReward["reward"]["list"] = {}
		
		local t = string.split(data[4], "|")
		for i = 1,#t do
			local rewardInfo = {}
			local subInfo = string.split(t[i],",")
			rewardInfo["type"] = subInfo[1]
			rewardInfo["id"] = subInfo[2]
			rewardInfo["num"] = subInfo[3]
			table.insert(dayReward["reward"]["list"], rewardInfo)
			dayReward["reward"]["num"] = dayReward["reward"]["num"] + 1
		end
		
		table.insert(tempTable["list"][data[2]]["list"], dayReward)
		tempTable["list"][data[2]]["num"] = tempTable["list"][data[2]]["num"] + 1
	end
	return tempTable
end


-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getNativeRecoverData
-- 获取本地缓存恢复数据表
-------------------------------------------------
function f_dict_config_manager:getNativeRecoverData()
	return self.m_dict_config.f_dict_recover
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMaxLimitNum
-- 获取当前皇帝等级开放的最大的 名臣  美女 皇子 位置数目
-------------------------------------------------
function f_dict_config_manager:getMaxLimitNum()
	local data = self.m_dict_config.f_dict_emperor[g_game.MAX_USER_LV]
	return data[9],data[10],data[11]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getStageStoryDataById
-- 获取某一关卡剧情 数据
-------------------------------------------------
function f_dict_config_manager:getStageStoryDataById(stageid)
	return self.m_dict_config.f_dict_levelstory[stageid]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getStageStoryPersonData
-- 获取某一关卡人物的剧情数据
-------------------------------------------------
function f_dict_config_manager:getStageStoryPersonData(stageid)
	local storyData =  self.m_dict_config.f_dict_levelstory[stageid]
	local dataT = {}
	for i = 4,#storyData do
		if storyData[i] ~= 0 and storyData[i] ~= "" then
			local str = self:getLanTextById(storyData[i])  
			local splitT = string.split(str, "|")
			table.insert(dataT,{["path"] = splitT[1],["pos"] =splitT[2],["name"] = splitT[3],["content"] = splitT[4] })
		end
	end
	return dataT
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] hasStageStory
-- 是否展示剧情
-------------------------------------------------
function f_dict_config_manager:hasStageStory(stageid)
	return self.m_dict_config.f_dict_levelstory[stageid][3] == 1
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBossInfoByDay
-------------------------------------------------
function f_dict_config_manager:getBossInfoByDay()
	local serverTime = g_game.g_utilManager:getServerTime()
	local weekDay = serverTime["wday"]
	local index = 0
	if weekDay == 1 then
		index = 7
	else
		index = weekDay -1
	end
	
	return self.m_dict_config.f_dict_world_boss[index]
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getOfficerCardTable
-------------------------------------------------
function f_dict_config_manager:getOfficerCardTable()
	return self.m_dict_config.f_dict_officer_card
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getBeautyCardTable
-------------------------------------------------
function f_dict_config_manager:getBeautyCardTable()
	return self.m_dict_config.f_dict_beauty
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getEquipmentCardTable
-------------------------------------------------
function f_dict_config_manager:getEquipmentCardTable()
	return self.m_dict_config.f_dict_equipment
end

-------------------------------------------------
-- @function [parent=#f_dict_config_manager] getMonthCardTable
-------------------------------------------------
function f_dict_config_manager:getMonthCardTable()
	return self.m_dict_config.f_dict_month_card
end

return f_dict_config_manager