--[[--
    本地server，用于离线模拟服务器
--]]--

local f_lua_native_server = class("f_lua_native_server")
f_lua_native_server.__index = f_lua_native_server

-------------------------------------------------
-- @function [parent=#f_lua_native_server] ctor
-------------------------------------------------
function f_lua_native_server:ctor()	
	self.m_server = {}
	self.m_server[g_network_message_type.CS_CHANGE_BATTLE_ARRAY] = function()  end
	self.m_server[g_network_message_type.CS_OFFICER_CARD_BATTLE] = function()  end
	self.m_server[g_network_message_type.CS_LOGIN_INFO] = function() self:reiceve_login_info();self:reiceve_limit_info();self:reiceve_battle_info();  end
	self.m_server[g_network_message_type.CS_PVE_FIGHT] = function() self:reiceve_pve_fight()  end
	self.m_server[g_network_message_type.CS_GET_BEAUTY_LIST] = function() self:receive_beauti_arr() end
	self.m_server[g_network_message_type.CS_PALACE_BATTLE] = function() self:receive_palace_battle() end
	self.m_server[g_network_message_type.CS_WASTER_PRINCESS] = function() self:receive_qifei() end
	self.m_server[g_network_message_type.CS_BEAUTY_CEFENG] = function() self:receive_cefeng() end
	self.m_server[g_network_message_type.CS_FAVOR_BEAUTY] = function() self:receive_favor() end
	self.m_server[g_network_message_type.CS_GET_PROP_LIST] = function() self:receive_prop_list()  end
	self.m_server[g_network_message_type.CS_BUY_PROP] = function() self:receive_buy_prop() end
	self.m_server[g_network_message_type.CS_USE_PROP] = function() self:receive_use_item() end
	self.m_server[g_network_message_type.CS_GET_CARD_COMBINA_INFO] = function() self:receive_combination() end

end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] send_message
-- 发送消息到本地server
-------------------------------------------------
function f_lua_native_server:send_message(messageType, sendMessage)
	if self.m_server[messageType] ~= nil then
		self.m_server[messageType]()
	end
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server]receive_combination 
-- 获取缘分
-------------------------------------------------
function f_lua_native_server:receive_combination()
-- dataT =
-- {
-- 		["cardCombinaList_Num"] Type:SHORT Size:2 卡牌组合列表数据 array length
-- 		["cardCombinaList"] = 
--		{ ------Type:ARRAY Size:8 卡牌组合列表数据
-- 				["combinaId"] Type:INTEGER Size:4 组合ID
-- 		}
-- }

	local dataT = 
	{
		msg_type = 30045,
		["cardCombinaList_Num"] = 6,
		["cardCombinaList"] = 
		{
			{["combinaId"] = 1},
			{["combinaId"] = 2},
			{["combinaId"] = 3},
			{["combinaId"] = 4},
			{["combinaId"] = 5},
			{["combinaId"] = 6},
		}
	}
	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_use_item
-- 使用道具
-------------------------------------------------
function f_lua_native_server:receive_use_item()
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["propUseResultList_Num"] Type:SHORT Size:2 道具使用结果列表 array length
-- 		["propUseResultList"] = 
--		{ ------Type:ARRAY Size:8 道具使用结果列表
-- 				["propType"] Type:SHORT Size:2 道具类型
-- 				["propValue"] Type:INTEGER Size:4 道具使用值
-- 		}

	local dataT = 
	{
		msg_type = 30042,
		["result"] = 1,
		["propUseResultList_Num"] = 5,
		["propUseResultList"] = 
		{
			{["propType"] = 1 ,["propValue"] =100 },
			{["propType"] = 2 ,["propValue"] =100 },
			{["propType"] = 1 ,["propValue"] =100 },
			{["propType"] = 2 ,["propValue"] =100 },
			{["propType"] = 1 ,["propValue"] =100 },
		}
		
	}
	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_buy_prop
-- 接收购买道具
-------------------------------------------------
function f_lua_native_server:receive_buy_prop()
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
	local dataT = 
	{
		msg_type = 30043,
		["result"] = 1
	}
	g_game.g_netManager:message_handler(dataT)
end


-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_prop_list
-- 接收 道具列表
-------------------------------------------------
function f_lua_native_server:receive_prop_list()
	-- dataT =
-- {
-- 		["propList_Num"] Type:SHORT Size:2 道具列表 array length
-- 		["propList"] = 
--		{ ------Type:ARRAY Size:8 道具列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 		}
-- }
	local dataT = 
	{
		msg_type = 30041,
		["propList_Num"] = 10,
		["propList"] = 
		{
			{["propId"] = 1,["propNum"] = 5},
			{["propId"] = 2,["propNum"] = 5},
			{["propId"] = 3,["propNum"] = 5},
			{["propId"] = 4,["propNum"] = 5},
			{["propId"] = 5,["propNum"] = 5},
			{["propId"] = 6,["propNum"] = 5},
			{["propId"] = 7,["propNum"] = 5},
			{["propId"] = 8,["propNum"] = 5},
			{["propId"] = 9,["propNum"] = 5},
			{["propId"] = 10,["propNum"] = 5},
		}
		
	}
	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_favor
-- 接受宠幸结果消息 SC_FAVOR_BEAUTY = 30011
-------------------------------------------------
function f_lua_native_server:receive_favor()
	-- dataT =
-- {
-- 		["rewardId"] Type:SHORT Size:2 奖励ID
-- 		["rewardValue"] Type:SHORT Size:2 奖励值
-- 		["intimate"] Type:SHORT Size:2 宠幸美女增加的亲密度
-- 		["energy"] Type:BYTE Size:1 皇帝精力
-- 		["savor"] Type:BYTE Size:1 美女兴趣点
-- }

	local dataT = 
	{
		msg_type = 30011,
		["rewardId"] = 14,
 		["rewardValue"] = 1,
 		["intimate"] = 11,
 		["energy"] = 10,
 		["savor"] =20,
	}
	
	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_qifei
-- 接受弃妃结果消息 SC_WASTER_PRINCESS = 30013
-------------------------------------------------
function f_lua_native_server:receive_qifei()
	--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }

	local dataT = 
	{
		msg_type = 30013,
		["result"] = 1
	}
	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_cefeng
-- 接受册封结果  SC_BEAUTY_CEFENG = 30010
-------------------------------------------------
function f_lua_native_server:receive_cefeng()
	--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["consume"] Type:INTEGER Size:4 消耗银两
-- 		["remain"] Type:INTEGER Size:4 剩下的银两
-- }

	local dataT = 
	{
		msg_type = 30010,
		["result"] = 1,
		["consume"] =20,
		["remain"] = 2000,
	}
	g_game.g_netManager:message_handler(dataT)	
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_palace_battle
-- 接受宫斗结果消息 SC_PALACE_BATTLE = 30012
-------------------------------------------------
function f_lua_native_server:receive_palace_battle()
	--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["consume"] Type:INTEGER Size:4 消耗银两
-- 		["remain"] Type:INTEGER Size:4 剩下银两
-- 		["exp"] Type:INTEGER Size:4 美女经验
-- 		["education"] Type:INTEGER Size:4 美女教育点
-- 		["intimacy"] Type:INTEGER Size:4 美女亲密度
-- }
	local dataT = 
	{
		msg_type = 30012,
		["result"] = 1,
		["consume"] =20,
		["remain"] = 2000,
		["exp"] = 60,
		["education"] = 20,
		["intimacy"] = 39
	}
	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] reiceve_login_info
-- 接受登陆消息 SC_LOGIN_INFO = 30000
-------------------------------------------------
function f_lua_native_server:reiceve_login_info()
-- dataT =
-- {
-- 		["mainCity_Num"] Type:SHORT Size:2 主场景 array length
-- 		["mainCity"] = 
--		{ ------Type:ARRAY Size:8 主场景
-- 				["cityId"] Type:INTEGER Size:4 宫殿
-- 		}
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["image"] Type:INTEGER Size:4 头像
-- 		["name"] Type:STRING Size:8 角色名
-- 		["reign"] Type:STRING Size:8 年号
-- 		["vipLevel"] Type:INTEGER Size:4 vip等级
-- 		["level"] Type:INTEGER Size:4 玩家等级
-- 		["exp"] Type:INTEGER Size:4 经验
-- 		["attack"] Type:INTEGER Size:4 攻击力
-- 		["defense"] Type:INTEGER Size:4 防御力
-- 		["silver"] Type:INTEGER Size:4 银两
-- 		["gold"] Type:INTEGER Size:4 元宝
-- 		["strength"] Type:INTEGER Size:4 体力
-- 		["energy"] Type:INTEGER Size:4 精力
-- }
	local dataT = 
	{
		msg_type = 30000,
		["mainCity_Num"] = 1,
		{1},
		["roleId"] = 1000,
		["image"] = 1000,
		["name"] = "baofei",
		["reign"] = "元年",
		["vipLevel"] = 3,
		["level"] = 5,
		["exp"] = 23,
		["attack"] = 100,
		["defense"] = 100,
		["silver"] = 100000,
		["gold"] = 23,
		["strength"] = 23,
		["energy"] = 23,
	}
	g_game.g_netManager:message_handler(dataT)
end
-------------------------------------------------
-- @function [parent=#f_lua_native_server] reiceve_limit_info
-- 接受上限消息 SC_PERSON_LIMIT_INFO = 30006
-------------------------------------------------
function f_lua_native_server:reiceve_limit_info()
-- dataT =
-- {
-- 		["expLimit"] Type:INTEGER Size:4 经验上限
-- 		["energyLimit"] Type:INTEGER Size:4 精力上限
-- 		["strengthLimit"] Type:INTEGER Size:4 体力上限
-- 		["military"] Type:INTEGER Size:4 军令上限
-- }
	local dataT = 
	{
		msg_type = 30006,
		["expLimit"] = 200,
		["energyLimit"] = 200,
		["strengthLimit"] = 200,
		["military"] = 200
	}
	g_game.g_netManager:message_handler(dataT)
end
-------------------------------------------------
-- @function [parent=#f_lua_native_server] reiceve_battle_info
-- 接受登陆消息 SC_CARD_BATTLE_LIST = 30001
-------------------------------------------------
function f_lua_native_server:reiceve_battle_info()

-- {
-- 		["battleList_Num"] Type:SHORT Size:2 已上阵列表 array length
-- 		["battleList"] = 
--		{ ------Type:ARRAY Size:8 已上阵列表
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:INTEGER Size:4 名臣ID
-- 				["officerLevel"] Type:INTEGER Size:4 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:INTEGER Size:4 兵种类型
-- 		}
-- 		["unbattleList_Num"] Type:SHORT Size:2 未上阵名臣列表 array length
-- 		["unbattleList"] = 
--		{ ------Type:ARRAY Size:8 未上阵名臣列表
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:INTEGER Size:4 名臣ID
-- 				["officerLevel"] Type:INTEGER Size:4 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:INTEGER Size:4 兵种类型
-- 		}
-- }
	local dataT =
	{
		msg_type = 30001,
		["battleList_Num"] = 5,
		["battleList"] = 
		{
			{["id"] = 1,["officerId"] = 1001,["officerLevel"] = 10,["officerExp"]  = 10,["attack"] =101,["defense"] =50,["intellect"] =50,["soldierType"] =1,},
			{["id"] = 2,["officerId"] = 1002,["officerLevel"] = 10,["officerExp"]  = 10,["attack"] =102,["defense"] =50,["intellect"] =50,["soldierType"] =5,},
			{["id"] = 3,["officerId"] = 1003,["officerLevel"] = 10,["officerExp"]  = 10,["attack"] =103,["defense"] =50,["intellect"] =50,["soldierType"] =9,},
			{["id"] = 4,["officerId"] = 1004,["officerLevel"] = 10,["officerExp"]  = 10,["attack"] =104,["defense"] =50,["intellect"] =50,["soldierType"] =13,},
			{["id"] = 5,["officerId"] = 2001,["officerLevel"] = 10,["officerExp"]  = 10,["attack"] =104,["defense"] =50,["intellect"] =50,["soldierType"] =13,},
			
		},
		["unbattleList_Num"] = 4,
		["unbattleList"] = 
		{
			{["id"] = 5,["officerId"] =2001,["officerLevel"]= 10,["officerExp"] = 10,["attack"] = 101,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 6,["officerId"] =2002,["officerLevel"]= 10,["officerExp"] = 10,["attack"] = 102,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 7,["officerId"] =2003,["officerLevel"]= 10,["officerExp"] = 10,["attack"] = 103,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 8,["officerId"] =2004,["officerLevel"]= 10,["officerExp"] = 10,["attack"] = 104,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 9,["officerId"] =2005,["officerLevel"]= 10,["officerExp"] = 10,["attack"] = 105,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
	
	
	--[[		{["id"] = 10,["officerId"] =2006,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 106,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 11,["officerId"] =2007,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 107,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 12,["officerId"] =2008,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 108,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 13,["officerId"] =2009,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 109,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 14,["officerId"] =2010,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 110,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 15,["officerId"] =2011,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 111,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 16,["officerId"] =2012,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 112,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 17,["officerId"] =2013,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 113,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 18,["officerId"] =2014,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 114,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 19,["officerId"] =2015,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 115,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 20,["officerId"] =2016,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 116,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
			{["id"] = 21,["officerId"] =2017,["officerLevel"]= 2,["officerExp"] = 10,["attack"] = 117,["defense"] =50,["intellect"] =59,["soldierType"] =2,},
		]]--
		}
	}
	g_game.g_netManager:message_handler(dataT)

end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] receive_beauti_arr
-- 接受美女列表消息 SC_BEAUTY_LIST = 30008
-------------------------------------------------
function f_lua_native_server:receive_beauti_arr()
-- dataT =
-- {
-- 		["battleList_Num"] Type:SHORT Size:2 上阵美女列表 array length
-- 		["battleList"] = 
--		{ ------Type:ARRAY Size:8 上阵美女列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 				["beautyLevel"] Type:SHORT Size:2 美女等级
-- 				["beautyTitle"] Type:BYTE Size:1 美女称号
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 				["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 				["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 				["beautyAddition"] Type:INTEGER Size:4 美女加成
-- 		}
-- 		["unbattleList_Num"] Type:SHORT Size:2 未上阵美女列表 array length
-- 		["unbattleList"] = 
--		{ ------Type:ARRAY Size:8 未上阵美女列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 				["beautyLevel"] Type:SHORT Size:2 美女等级
-- 				["beautyTitle"] Type:BYTE Size:1 美女称号
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 				["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 				["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 				["beautyAddition"] Type:INTEGER Size:4 美女加成
-- 		}
-- }
	local dataT = 
	{
		msg_type = 30008,
		["battleList_Num"] = 5,
		["battleList"] = 
		{
			{ ["id"] = 1,["beautyId"] = 1002,["beautyLevel"] =1,["beautyTitle"] = 0,["position"] = 1,["beautyIntimacy"] = 1000,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =3 ,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 2,["beautyId"] = 5001,["beautyLevel"] =5,["beautyTitle"] = 4,["position"] = 2,["beautyIntimacy"] = 8,["beautyEducation"] =9,["beautySavor"] = 10,["beautyExp"] =50,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 3,["beautyId"] = 5005,["beautyLevel"] =3,["beautyTitle"] = 1,["position"] = 3,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =50,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 4,["beautyId"] = 1001,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 4,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 5,["beautyId"] = 1003,["beautyLevel"] =3,["beautyTitle"] = 4,["position"] = 5,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
--			{ ["id"] = 6,["beautyId"] = 5007,["beautyLevel"] =2,["beautyTitle"] = 4,["position"] = 6,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
--			{ ["id"] = 7,["beautyId"] = 4004,["beautyLevel"] =2,["beautyTitle"] = 4,["position"] = 7,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
--			{ ["id"] = 8,["beautyId"] = 2001,["beautyLevel"] =2,["beautyTitle"] = 4,["position"] = 8,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
--			{ ["id"] = 9,["beautyId"] = 2002,["beautyLevel"] =2,["beautyTitle"] = 4,["position"] = 9,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
--			{ ["id"] = 10,["beautyId"] = 2003,["beautyLevel"] =2,["beautyTitle"] = 4,["position"] = 10,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
		},
		["unbattleList_Num"] = 39,
		["unbattleList"] = 
		{
			{ ["id"] = 11,["beautyId"] = 2004,["beautyLevel"] =2,["beautyTitle"] = 1,["position"] = 1,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 12,["beautyId"] = 2005,["beautyLevel"] =3,["beautyTitle"] = 2,["position"] = 2,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 1,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 13,["beautyId"] = 2006,["beautyLevel"] =4,["beautyTitle"] = 3,["position"] = 3,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 2,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 14,["beautyId"] = 2007,["beautyLevel"] =5,["beautyTitle"] = 0,["position"] = 4,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 15,["beautyId"] = 2008,["beautyLevel"] =7,["beautyTitle"] = 0,["position"] = 5,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 16,["beautyId"] = 2009,["beautyLevel"] =13,["beautyTitle"] = 6,["position"] = 6,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 17,["beautyId"] = 2010,["beautyLevel"] =4,["beautyTitle"] = 7,["position"] = 7,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 18,["beautyId"] = 2011,["beautyLevel"] =5,["beautyTitle"] = 8,["position"] = 8,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 19,["beautyId"] = 2012,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 9,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 20,["beautyId"] = 2013,["beautyLevel"] =2,["beautyTitle"] = 2,["position"] = 10,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 21,["beautyId"] = 3001,["beautyLevel"] =2,["beautyTitle"] = 3,["position"] = 11,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 22,["beautyId"] = 3002,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 12,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 23,["beautyId"] = 3003,["beautyLevel"] =2,["beautyTitle"] = 5,["position"] = 13,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 24,["beautyId"] = 3004,["beautyLevel"] =2,["beautyTitle"] = 6,["position"] = 14,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 25,["beautyId"] = 3005,["beautyLevel"] =2,["beautyTitle"] = 7,["position"] = 15,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 26,["beautyId"] = 3006,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 16,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 27,["beautyId"] = 3007,["beautyLevel"] =2,["beautyTitle"] = 1,["position"] = 17,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 28,["beautyId"] = 3008,["beautyLevel"] =2,["beautyTitle"] = 2,["position"] = 18,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 29,["beautyId"] = 3009,["beautyLevel"] =2,["beautyTitle"] = 3,["position"] = 19,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 30,["beautyId"] = 3010,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 20,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 31,["beautyId"] = 3011,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 21,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 32,["beautyId"] = 3012,["beautyLevel"] =2,["beautyTitle"] = 6,["position"] = 22,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 33,["beautyId"] = 3013,["beautyLevel"] =2,["beautyTitle"] = 7,["position"] = 23,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 34,["beautyId"] = 3014,["beautyLevel"] =2,["beautyTitle"] = 8,["position"] = 24,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 35,["beautyId"] = 3015,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 25,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 36,["beautyId"] = 3016,["beautyLevel"] =2,["beautyTitle"] = 2,["position"] = 26,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 37,["beautyId"] = 3017,["beautyLevel"] =2,["beautyTitle"] = 3,["position"] = 27,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 38,["beautyId"] = 3018,["beautyLevel"] =2,["beautyTitle"] = 4,["position"] = 28,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 39,["beautyId"] = 3019,["beautyLevel"] =2,["beautyTitle"] = 5,["position"] = 29,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 40,["beautyId"] = 3020,["beautyLevel"] =2,["beautyTitle"] = 6,["position"] = 30,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 41,["beautyId"] = 3021,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 31,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 42,["beautyId"] = 3022,["beautyLevel"] =2,["beautyTitle"] = 8,["position"] = 32,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 43,["beautyId"] = 3023,["beautyLevel"] =2,["beautyTitle"] = 1,["position"] = 33,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 44,["beautyId"] = 3024,["beautyLevel"] =2,["beautyTitle"] = 2,["position"] = 34,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 45,["beautyId"] = 3025,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 35,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 46,["beautyId"] = 4001,["beautyLevel"] =2,["beautyTitle"] = 0,["position"] = 36,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 47,["beautyId"] = 4002,["beautyLevel"] =2,["beautyTitle"] = 5,["position"] = 37,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 48,["beautyId"] = 4003,["beautyLevel"] =2,["beautyTitle"] = 6,["position"] = 38,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
			{ ["id"] = 49,["beautyId"] = 4004,["beautyLevel"] =2,["beautyTitle"] = 7,["position"] = 39,["beautyIntimacy"] = 6,["beautyEducation"] =7,["beautySavor"] = 8,["beautyExp"] =103,["conceive"] = 0,["princeList_Num"] = 2,["princeList"] = { {["princeId"] = 1,} , {["princeId"] = 1,}}},
		
		},
	}
	
	

	g_game.g_netManager:message_handler(dataT)
end

-------------------------------------------------
-- @function [parent=#f_lua_native_server] reiceve_pve_fight
-- 接受pve战斗回合消息 SC_PVE_FIGHT = 30007
-------------------------------------------------
function f_lua_native_server:reiceve_pve_fight()
end

return f_lua_native_server