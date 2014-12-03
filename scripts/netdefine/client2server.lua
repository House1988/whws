-- client to server message
-- Table:
g_network_client_sendto_server = {}
-- message:测试网络链接是否可用
--	Table:
-- dataT =
-- {
-- send message to server
function g_network_client_sendto_server.CS_IS_ALIVE_TEST_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_IS_ALIVE_TEST_REQUEST, sendMsg)

end

-- message:获取公告
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_ANNOUNCEMENTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_ANNOUNCEMENTS, sendMsg)

end

-- message:发送或更新公告
--	Table:
-- dataT =
-- {
-- 		["gmid"] Type:INTEGER Size:4 gm公告ID
-- 		["server_id"] Type:INTEGER Size:4 服务器ID
-- 		["channel"] Type:INTEGER Size:4 渠道掩码
-- 		["seq_num"] Type:INTEGER Size:4 序列编号
-- 		["title"] Type:STRING Size:4 公告标题
-- 		["content"] Type:STRING Size:4 公告内容
-- 		["is_open"] Type:BYTE Size:1 公告是否打开标识
-- 		["new"] Type:BYTE Size:1 是否是new公告
-- }
-- send message to server
function g_network_client_sendto_server.CS_SEND_ANNOUNCEMENTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_SEND_ANNOUNCEMENTS, sendMsg)

end

-- message:删除公告
--	Table:
-- dataT =
-- {
-- 		["gmid"] Type:INTEGER Size:4 gm公告ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_DELETE_ANNOUNCEMENTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_DELETE_ANNOUNCEMENTS, sendMsg)

end

-- message:改变名臣卡牌位置
--	Table:
-- dataT =
-- {
-- 		["officer_Num"] Type:SHORT Size:2 卡牌改变阵容后的位置信息 array length
-- 		["officer"] = 
--		{ ------Type:ARRAY Size:4 卡牌改变阵容后的位置信息
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["officerId"] Type:INTEGER Size:4 名臣ID
-- 		}
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHANGE_BATTLE_ARRAY(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHANGE_BATTLE_ARRAY, sendMsg)

end

-- message:名臣卡牌上阵与换将
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["id"] Type:INTEGER Size:4 主键ID
-- 		["officerId"] Type:SHORT Size:2 名臣卡牌ID
-- 		["position"] Type:BYTE Size:1 上阵位置
-- }
-- send message to server
function g_network_client_sendto_server.CS_OFFICER_CARD_BATTLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_OFFICER_CARD_BATTLE, sendMsg)

end

-- message:上阵第二阵容第一张卡
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_SEC_BATTLE_CARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_SEC_BATTLE_CARD, sendMsg)

end

-- message:切换当前阵容
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHANGE_BATTLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHANGE_BATTLE, sendMsg)

end

-- message:获得美女列表
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_BEAUTY_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_BEAUTY_LIST, sendMsg)

end

-- message:美女助阵和更换
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- 		["position"] Type:BYTE Size:1 位置
-- }
-- send message to server
function g_network_client_sendto_server.CS_BEAUTY_BATTLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_BEAUTY_BATTLE, sendMsg)

end

-- message:册封美女
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- 		["title"] Type:BYTE Size:1 册封称号
-- }
-- send message to server
function g_network_client_sendto_server.CS_BEAUTY_CEFENG(sendMsg)
	g_network.send_message(g_network_message_type.CS_BEAUTY_CEFENG, sendMsg)

end

-- message:宠幸美女
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_FAVOR_BEAUTY(sendMsg)
	g_network.send_message(g_network_message_type.CS_FAVOR_BEAUTY, sendMsg)

end

-- message:宫斗 吞并其它美女卡
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- 		["beautyList_Num"] Type:SHORT Size:2 被吞的卡牌列表 array length
-- 		["beautyList"] = 
--		{ ------Type:ARRAY Size:4 被吞的卡牌列表
-- 				["bId"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_PALACE_BATTLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_PALACE_BATTLE, sendMsg)

end

-- message:废妃
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_WASTER_PRINCESS(sendMsg)
	g_network.send_message(g_network_message_type.CS_WASTER_PRINCESS, sendMsg)

end

-- message:美女怀孕
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["id"] Type:INTEGER Size:4 美女主键ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_BEAUTY_CONCEIVE(sendMsg)
	g_network.send_message(g_network_message_type.CS_BEAUTY_CONCEIVE, sendMsg)

end

-- message:领取皇子
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["id"] Type:INTEGER Size:4 美女主键ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_OBTAIN_PRINCE(sendMsg)
	g_network.send_message(g_network_message_type.CS_OBTAIN_PRINCE, sendMsg)

end

-- message:碎片列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PIECE_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PIECE_LIST, sendMsg)

end

-- message:请求兵法列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_BOOKS_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_BOOKS_LIST, sendMsg)

end

-- message:兵法出售
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["bookList_Num"] Type:SHORT Size:2 要出售的兵法 array length
-- 		["bookList"] = 
--		{ ------Type:ARRAY Size:4 要出售的兵法
-- 				["id"] Type:INTEGER Size:4 要出售兵法的主键
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_BOOK_PRICE(sendMsg)
	g_network.send_message(g_network_message_type.CS_BOOK_PRICE, sendMsg)

end

-- message:兵法升级
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["chipId"] Type:INTEGER Size:4 碎片主键ID
-- 		["mergeList_Num"] Type:SHORT Size:2 被消耗的列表 array length
-- 		["mergeList"] = 
--		{ ------Type:ARRAY Size:4 被消耗的列表
-- 				["bingFaId"] Type:INTEGER Size:4 消耗兵法的主键ID
-- 				["cardId"] Type:SHORT Size:2 消耗兵法的碎片ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPGRADE_BING_FA(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPGRADE_BING_FA, sendMsg)

end

-- message:兵法合成
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["bingFaId"] Type:SHORT Size:2 兵法ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_MERGE_BING_FA(sendMsg)
	g_network.send_message(g_network_message_type.CS_MERGE_BING_FA, sendMsg)

end

-- message:卡牌进阶
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 用户角色ID
-- 		["id"] Type:INTEGER Size:4 要进阶的卡牌主键ID
-- 		["cardId"] Type:SHORT Size:2 要进阶的卡牌
-- }
-- send message to server
function g_network_client_sendto_server.CS_CARD_ADVANCED(sendMsg)
	g_network.send_message(g_network_message_type.CS_CARD_ADVANCED, sendMsg)

end

-- message:获得卡牌组合信息
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 用户角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_CARD_COMBINA_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_CARD_COMBINA_INFO, sendMsg)

end

-- message:卡牌炼化
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 卡牌类型：1-名臣，2-美女，3-装备
-- 		["cardList_Num"] Type:SHORT Size:2 炼化卡牌列表 array length
-- 		["cardList"] = 
--		{ ------Type:ARRAY Size:4 炼化卡牌列表
-- 				["primaryId"] Type:INTEGER Size:4 卡牌主键ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_CARD_JITIAN(sendMsg)
	g_network.send_message(g_network_message_type.CS_CARD_JITIAN, sendMsg)

end

-- message:获取神秘商店商品列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 类型：0-请求列表，1-刷新列表
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_JITIAN_SHOP_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_JITIAN_SHOP_INFO, sendMsg)

end

-- message:兑换神秘商店物品
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["index"] Type:INTEGER Size:4 索引
-- }
-- send message to server
function g_network_client_sendto_server.CS_JITIAN_SHOP_BUY(sendMsg)
	g_network.send_message(g_network_message_type.CS_JITIAN_SHOP_BUY, sendMsg)

end

-- message:获取角色祭天信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_USER_JITIAN_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_USER_JITIAN_INFO, sendMsg)

end

-- message:名臣卡牌出售
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["cardList_Num"] Type:SHORT Size:2 要出售的卡牌列表 array length
-- 		["cardList"] = 
--		{ ------Type:ARRAY Size:4 要出售的卡牌列表
-- 				["cardId"] Type:INTEGER Size:4 要出售的卡牌主键ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_OFFICER_CARD_PRICE_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_OFFICER_CARD_PRICE_REQUEST, sendMsg)

end

-- message:美女卡牌出售
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyList_Num"] Type:SHORT Size:2 要出售的美女列表 array length
-- 		["beautyList"] = 
--		{ ------Type:ARRAY Size:4 要出售的美女列表
-- 				["beautyId"] Type:INTEGER Size:4 要出售的美女主键ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_BEAUTY_CARD_PRICE_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_BEAUTY_CARD_PRICE_REQUEST, sendMsg)

end

-- message:皇子卡出售
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["princeList_Num"] Type:SHORT Size:2 要出售的皇子列表 array length
-- 		["princeList"] = 
--		{ ------Type:ARRAY Size:4 要出售的皇子列表
-- 				["princeId"] Type:INTEGER Size:4 要出售的皇子主键ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_PRINCE_CARD_PRICE_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_PRINCE_CARD_PRICE_REQUEST, sendMsg)

end

-- message:请求商城物品
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_SHOP_ITEM(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_SHOP_ITEM, sendMsg)

end

-- message:挑战副本
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["areaId"] Type:INTEGER Size:4 区域ID
-- 		["stageId"] Type:INTEGER Size:4 阶段ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_ELITE_FIGHT(sendMsg)
	g_network.send_message(g_network_message_type.CS_ELITE_FIGHT, sendMsg)

end

-- message:获取用户装备列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_EQUIPMENTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_EQUIPMENTS, sendMsg)

end

-- message:使用或更换装备
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- 		["primaryId"] Type:INTEGER Size:4 主键Id
-- 		["battle"] Type:BYTE Size:1 装备所在阵容
-- 		["position"] Type:BYTE Size:1 装备所在位置
-- 		["type"] Type:BYTE Size:1 装备类型：0-普通装备，1-兵法
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_EQUIPMENT(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_EQUIPMENT, sendMsg)

end

-- message:卸下装备
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- 		["primaryId"] Type:INTEGER Size:4 主键Id
-- 		["type"] Type:BYTE Size:1 装备类型：0-普通装备，1-兵法
-- }
-- send message to server
function g_network_client_sendto_server.CS_REMOVE_EQUIPMENT(sendMsg)
	g_network.send_message(g_network_message_type.CS_REMOVE_EQUIPMENT, sendMsg)

end

-- message:装备升级
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- 		["primaryId"] Type:INTEGER Size:4 主键Id
-- }
-- send message to server
function g_network_client_sendto_server.CS_EQUIPMENT_LEVEL_UP(sendMsg)
	g_network.send_message(g_network_message_type.CS_EQUIPMENT_LEVEL_UP, sendMsg)

end

-- message:装备出售
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- 		["primaryId"] Type:INTEGER Size:4 主键Id
-- }
-- send message to server
function g_network_client_sendto_server.CS_SELL_EQUIPMENT(sendMsg)
	g_network.send_message(g_network_message_type.CS_SELL_EQUIPMENT, sendMsg)

end

-- message:使用兑换码
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["exchange_code"] Type:STRING Size:4 兑换码
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_EXCHANGE_CODE(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_EXCHANGE_CODE, sendMsg)

end

-- message:用户功绩兑换物品
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["exchangeId"] Type:INTEGER Size:4 兑换ID
-- 		["exchangeNum"] Type:INTEGER Size:4 兑换个数
-- }
-- send message to server
function g_network_client_sendto_server.CS_EXCHANGE(sendMsg)
	g_network.send_message(g_network_message_type.CS_EXCHANGE, sendMsg)

end

-- message:请求碎片列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_FRAGMENT_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_FRAGMENT_INFO, sendMsg)

end

-- message:碎片合成请求
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["fragmentId"] Type:INTEGER Size:4 碎片ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_FRAGMENT_MERGE(sendMsg)
	g_network.send_message(g_network_message_type.CS_FRAGMENT_MERGE, sendMsg)

end

-- message:当前活动
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_HUODONG_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_HUODONG_INFO, sendMsg)

end

-- message:抽奖信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHOUJIANG_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHOUJIANG_INFO, sendMsg)

end

-- message:抽奖排行榜信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHOUJIANG_RANK(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHOUJIANG_RANK, sendMsg)

end

-- message:玩家抽奖
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["times"] Type:BYTE Size:1 抽奖次数1或10
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHOUJIANG(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHOUJIANG, sendMsg)

end

-- message:抽奖商店
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["refresh"] Type:BYTE Size:1 是否刷新商店，1刷新，0不刷新
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHOUJIANG_SHOP(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHOUJIANG_SHOP, sendMsg)

end

-- message:抽奖商店购买
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["index"] Type:INTEGER Size:4 索引
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHOUJIANG_SHOP_BUY(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHOUJIANG_SHOP_BUY, sendMsg)

end

-- message:福袋信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_FORTUNE_BOX(sendMsg)
	g_network.send_message(g_network_message_type.CS_FORTUNE_BOX, sendMsg)

end

-- message:购买福袋
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["index"] Type:BYTE Size:1 第几个
-- }
-- send message to server
function g_network_client_sendto_server.CS_BUY_FORTUNE_BOX(sendMsg)
	g_network.send_message(g_network_message_type.CS_BUY_FORTUNE_BOX, sendMsg)

end

-- message:请求玩家已经领取奖励的等级列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_USER_REWARD_LEVEL(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_USER_REWARD_LEVEL, sendMsg)

end

-- message:领取等级奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["level"] Type:INTEGER Size:4 领取奖励等级
-- }
-- send message to server
function g_network_client_sendto_server.CS_RECEIVE_LEVEL_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_RECEIVE_LEVEL_REWARD, sendMsg)

end

-- message:更改年号
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["reign"] Type:STRING Size:4 年号描述
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHANGE_REIGN(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHANGE_REIGN, sendMsg)

end

-- message:接收定点活动粮草奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["num"] Type:BYTE Size:1 活动序号1,2
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_STRENGTH_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_STRENGTH_REWARD, sendMsg)

end

-- message:购买副本
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["pveLevel"] Type:INTEGER Size:4 副本ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PURCHASE_FUBEN(sendMsg)
	g_network.send_message(g_network_message_type.CS_PURCHASE_FUBEN, sendMsg)

end

-- message:请求购买副本信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["pveLevel"] Type:INTEGER Size:4 副本ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PURCHASE_FUBEN_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_PURCHASE_FUBEN_INFO, sendMsg)

end

-- message:征税
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_TEX(sendMsg)
	g_network.send_message(g_network_message_type.CS_TEX, sendMsg)

end

-- message:寻访
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["level"] Type:BYTE Size:1 寻访档次：1,2,3
-- }
-- send message to server
function g_network_client_sendto_server.CS_VISIT(sendMsg)
	g_network.send_message(g_network_message_type.CS_VISIT, sendMsg)

end

-- message:赏赐美女
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:INTEGER Size:4 美女卡牌主键ID
-- 		["propId"] Type:INTEGER Size:4 奖励道具id
-- }
-- send message to server
function g_network_client_sendto_server.CS_REWARD_BEAUTY(sendMsg)
	g_network.send_message(g_network_message_type.CS_REWARD_BEAUTY, sendMsg)

end

-- message:加速怀孕
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["beautyId"] Type:INTEGER Size:4 美女ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_ACCEL_CONCEIVE(sendMsg)
	g_network.send_message(g_network_message_type.CS_ACCEL_CONCEIVE, sendMsg)

end

-- message:获取充值签到信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_CHARGE_CHECKIN_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_CHARGE_CHECKIN_INFO, sendMsg)

end

-- message:领取充值签到奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["num"] Type:BYTE Size:1 领取奖励次数
-- }
-- send message to server
function g_network_client_sendto_server.CS_ACCEPT_CHARGE_CHECKIN_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_ACCEPT_CHARGE_CHECKIN_REWARD, sendMsg)

end

-- message:玩家登陆
--	Table:
-- dataT =
-- {
-- 		["account"] Type:STRING Size:4 账号
-- 		["deviceSign"] Type:STRING Size:4 设备标识
-- 		["channel"] Type:BYTE Size:1 渠道标识
-- 		["id"] Type:STRING Size:4 平台ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_LOGIN_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_LOGIN_INFO, sendMsg)

end

-- message:玩家登陆
--	Table:
-- dataT =
-- {
-- 		["account"] Type:STRING Size:4 账号
-- 		["type"] Type:BYTE Size:1 1-idfa 2-mac
-- 		["deviceSign"] Type:STRING Size:4 设备标识
-- 		["channel"] Type:BYTE Size:1 渠道标识
-- 		["id"] Type:STRING Size:4 平台ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_LOGIN_INFO_IOS(sendMsg)
	g_network.send_message(g_network_message_type.CS_LOGIN_INFO_IOS, sendMsg)

end

-- message:创建角色
--	Table:
-- dataT =
-- {
-- 		["account"] Type:STRING Size:4 账号
-- 		["roleName"] Type:STRING Size:4 角色名
-- 		["deviceSign"] Type:STRING Size:4 设备标识
-- 		["channel"] Type:BYTE Size:1 渠道标识
-- 		["platformId"] Type:STRING Size:4 平台ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CREATE_ROLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_CREATE_ROLE, sendMsg)

end

-- message:更新新手引导步骤
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["guideStep"] Type:SHORT Size:2 新手引导步骤
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_GUIDE_STEP(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_GUIDE_STEP, sendMsg)

end

-- message:重新链接请求
--	Table:
-- dataT =
-- {
-- 		["account"] Type:STRING Size:4 账号
-- 		["deviceSign"] Type:STRING Size:4 设置标识
-- 		["channel"] Type:BYTE Size:1 渠道标识
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_RECONNECT_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_RECONNECT_REQUEST, sendMsg)

end

-- message:更新首次登陆请求
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_FIRST_LOGIN(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_FIRST_LOGIN, sendMsg)

end

-- message:更新角色布阵状态
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_BU_ZHEN(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_BU_ZHEN, sendMsg)

end

-- message:更新皇子升级状态
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_PRINCE_LEVEL_UP(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_PRINCE_LEVEL_UP, sendMsg)

end

-- message:更新竞技场状态
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_ARENA(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_ARENA, sendMsg)

end

-- message:更新穿戴装备状态
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_WEAR_EQUIP(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_WEAR_EQUIP, sendMsg)

end

-- message:更新皇子第二次升级状态
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_UPDATE_PRINCE_SECOND_LEVEL_UP(sendMsg)
	g_network.send_message(g_network_message_type.CS_UPDATE_PRINCE_SECOND_LEVEL_UP, sendMsg)

end

-- message:登陆奖励请求
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_LOGIN_REWARD_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_LOGIN_REWARD_REQUEST, sendMsg)

end

-- message:使用奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["rewardId"] Type:INTEGER Size:4 奖励的主键ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_LOGIN_REWARD_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_LOGIN_REWARD_REQUEST, sendMsg)

end

-- message:获取邮件数量
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["mail_type"] Type:BYTE Size:1 邮件类型：0-系统邮件，1-用户邮件
-- 		["flag"] Type:BYTE Size:1 获取标识：对于系统邮件，0-请求所有，1-请求未接受过的
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_MAIL_COUNT(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_MAIL_COUNT, sendMsg)

end

-- message:获取用户邮件列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["startIndex"] Type:INTEGER Size:4 起始邮件索引
-- 		["mail_num"] Type:INTEGER Size:4 请求返回的邮件数量
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_USER_MAILS(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_USER_MAILS, sendMsg)

end

-- message:获取系统邮件列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["startIndex"] Type:INTEGER Size:4 起始邮件索引
-- 		["mail_num"] Type:INTEGER Size:4 请求返回的邮件数量
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_SYS_MAILS(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_SYS_MAILS, sendMsg)

end

-- message:发送用户邮件
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["receiver"] Type:STRING Size:4 接受者
-- 		["content"] Type:STRING Size:4 邮件内容
-- }
-- send message to server
function g_network_client_sendto_server.CS_SEND_MAIL(sendMsg)
	g_network.send_message(g_network_message_type.CS_SEND_MAIL, sendMsg)

end

-- message:删除邮件
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["mail_type"] Type:BYTE Size:1 邮件类型：0-系统邮件，1-用户邮件
-- 		["mailId"] Type:INTEGER Size:4 邮件ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_DELETE_MAIL(sendMsg)
	g_network.send_message(g_network_message_type.CS_DELETE_MAIL, sendMsg)

end

-- message:确认系统邮件附件
--	Table:
-- dataT =
-- {
-- 		["roelId"] Type:INTEGER Size:4 角色ID
-- 		["mailId"] Type:INTEGER Size:4 邮件ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CONFIRM_MAIL_ATTACHMENT(sendMsg)
	g_network.send_message(g_network_message_type.CS_CONFIRM_MAIL_ATTACHMENT, sendMsg)

end

-- message:发送系统邮件
--	Table:
-- dataT =
-- {
-- 		["gmMailId"] Type:INTEGER Size:4 GM邮件ID
-- 		["userList_Num"] Type:SHORT Size:2 邮件发送用户列表 array length
-- 		["userList"] = 
--		{ ------Type:ARRAY Size:4 邮件发送用户列表
-- 				["uid"] Type:INTEGER Size:4 用户ID
-- 		}
-- 		["hasContent"] Type:BYTE Size:1 是否包含邮件内容
-- 		["content"] Type:STRING Size:4 邮件内容
-- 		["expire"] Type:INTEGER Size:4 邮件有效期，以秒为单位
-- 		["isAllUserMail"] Type:BYTE Size:1 0：部分系统邮件 1：全体系统邮件
-- 		["server_id"] Type:INTEGER Size:4 服务器ID
-- 		["channel"] Type:INTEGER Size:4 渠道掩码
-- 		["attachment_Num"] Type:SHORT Size:2 附件数据 array length
-- 		["attachment"] = 
--		{ ------Type:ARRAY Size:4 附件数据
-- 				["amType"] Type:BYTE Size:1 奖励物品类型
-- 				["amID"] Type:INTEGER Size:4 奖励物品ID
-- 				["amNum"] Type:INTEGER Size:4 奖励物品数量
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_SEND_SYS_MAILS(sendMsg)
	g_network.send_message(g_network_message_type.CS_SEND_SYS_MAILS, sendMsg)

end

-- message:请求PVP邮件
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["startIndex"] Type:INTEGER Size:4 起始邮件索引
-- 		["mailNum"] Type:INTEGER Size:4 请求返回的邮件数量
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PVP_MAIL(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PVP_MAIL, sendMsg)

end

-- message:请求战斗回放数据
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["mailId"] Type:INTEGER Size:4 邮件主键ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PVP_FIGHT_DATA(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PVP_FIGHT_DATA, sendMsg)

end

-- message:删除PVP邮件
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["mailId"] Type:INTEGER Size:4 邮件主键ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_REMOVE_PVP_MAIL(sendMsg)
	g_network.send_message(g_network_message_type.CS_REMOVE_PVP_MAIL, sendMsg)

end

-- message:合并卡牌请求
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 名臣卡牌主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["officerId"] Type:SHORT Size:2 名臣卡牌ID
-- 		["officerList_Num"] Type:SHORT Size:2 被合并的卡牌列表 array length
-- 		["officerList"] = 
--		{ ------Type:ARRAY Size:4 被合并的卡牌列表
-- 				["oId"] Type:INTEGER Size:4 名臣卡牌主键ID
-- 				["mergeOfficerId"] Type:SHORT Size:2 被合并的卡牌ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_MERGE_CARD_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_MERGE_CARD_REQUEST, sendMsg)

end

-- message:获取当前限时充值活动信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_CURRENT_PEROID_CHARGE_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_CURRENT_PEROID_CHARGE_INFO, sendMsg)

end

-- message:获取限时充值奖励信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PEROID_CHARGE_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PEROID_CHARGE_INFO, sendMsg)

end

-- message:领取限时充值奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["peroidId"] Type:INTEGER Size:4 活动ID
-- 		["rewardNumber"] Type:INTEGER Size:4 奖励序号：1-4
-- }
-- send message to server
function g_network_client_sendto_server.CS_ACCEPT_PEROID_CHARGE_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_ACCEPT_PEROID_CHARGE_REWARD, sendMsg)

end

-- message:掠夺列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["chipId"] Type:SHORT Size:2 碎片ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PREY_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_PREY_LIST, sendMsg)

end

-- message:掠夺
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["position"] Type:BYTE Size:1 抢夺列表的下标
-- 		["chipId"] Type:SHORT Size:2 碎片ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PREY_FIGHT(sendMsg)
	g_network.send_message(g_network_message_type.CS_PREY_FIGHT, sendMsg)

end

-- message:获得皇子列表
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PRINCE_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PRINCE_LIST, sendMsg)

end

-- message:皇子督军或更换
--	Table:
-- dataT =
-- {
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["position"] Type:BYTE Size:1 位置
-- }
-- send message to server
function g_network_client_sendto_server.CS_PRINCE_BATTLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_PRINCE_BATTLE, sendMsg)

end

-- message:尚书房
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["id"] Type:INTEGER Size:4 皇子主键ID
-- 		["beautyList_Num"] Type:SHORT Size:2 美女列表 array length
-- 		["beautyList"] = 
--		{ ------Type:ARRAY Size:4 美女列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_PRINCE_SHANG_SHU_FANG(sendMsg)
	g_network.send_message(g_network_message_type.CS_PRINCE_SHANG_SHU_FANG, sendMsg)

end

-- message:宗人府
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["id"] Type:INTEGER Size:4 皇子主键ID
-- 		["princeList_Num"] Type:SHORT Size:2 皇子列表 array length
-- 		["princeList"] = 
--		{ ------Type:ARRAY Size:4 皇子列表
-- 				["pid"] Type:INTEGER Size:4 被吞噬的皇子主键ID
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_PRINCE_ZONG_REN_FU(sendMsg)
	g_network.send_message(g_network_message_type.CS_PRINCE_ZONG_REN_FU, sendMsg)

end

-- message:皇子改名
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["princeId"] Type:INTEGER Size:4 皇子ID
-- 		["name"] Type:STRING Size:4 皇子名称
-- }
-- send message to server
function g_network_client_sendto_server.CS_PRINCE_CHANGE_NAME(sendMsg)
	g_network.send_message(g_network_message_type.CS_PRINCE_CHANGE_NAME, sendMsg)

end

-- message:获得用户道具列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PROP_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PROP_LIST, sendMsg)

end

-- message:使用道具
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["propList_Num"] Type:SHORT Size:2 道具列表 array length
-- 		["propList"] = 
--		{ ------Type:ARRAY Size:4 道具列表
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 				["propNum"] Type:INTEGER Size:4 道具数目
-- 		}
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_PROP(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_PROP, sendMsg)

end

-- message:购买道具
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["propId"] Type:SHORT Size:2 道具ID
-- 		["propNum"] Type:INTEGER Size:4 道具数目
-- }
-- send message to server
function g_network_client_sendto_server.CS_BUY_PROP(sendMsg)
	g_network.send_message(g_network_message_type.CS_BUY_PROP, sendMsg)

end

-- message:使用道具包
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["propId"] Type:SHORT Size:2 道具包Id
-- 		["propNum"] Type:INTEGER Size:4 道具包数量，当前只能一个一个使用道具包，因此propNum应该为1
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_PROP_PACKAGE(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_PROP_PACKAGE, sendMsg)

end

-- message:挑战副本
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["areaId"] Type:INTEGER Size:4 区域ID
-- 		["stageId"] Type:INTEGER Size:4 阶段ID
-- 		["levelId"] Type:INTEGER Size:4 副本ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PVE_FIGHT(sendMsg)
	g_network.send_message(g_network_message_type.CS_PVE_FIGHT, sendMsg)

end

-- message:副本扫荡
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["areaId"] Type:INTEGER Size:4 区域
-- 		["stageId"] Type:INTEGER Size:4 阶段
-- 		["level"] Type:INTEGER Size:4 关卡
-- 		["sweepCount"] Type:INTEGER Size:4 扫荡次数
-- }
-- send message to server
function g_network_client_sendto_server.CS_LEVEL_SWEEP(sendMsg)
	g_network.send_message(g_network_message_type.CS_LEVEL_SWEEP, sendMsg)

end

-- message:获得战役信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_LEVEL_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_LEVEL_INFO, sendMsg)

end

-- message:获得关卡的战斗信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["areaId"] Type:BYTE Size:1 区域ID
-- 		["stageId"] Type:BYTE Size:1 阶段ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_LEVEL_FIGHT_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_LEVEL_FIGHT_INFO, sendMsg)

end

-- message:通关礼包
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["areaId"] Type:BYTE Size:1 区域
-- 		["stageId"] Type:BYTE Size:1 阶段ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PASS_STAGE_GIFT(sendMsg)
	g_network.send_message(g_network_message_type.CS_PASS_STAGE_GIFT, sendMsg)

end

-- message:获得排名列表
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PVP_RANK(sendMsg)
	g_network.send_message(g_network_message_type.CS_PVP_RANK, sendMsg)

end

-- message:查看玩家阵容
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 玩家ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PVP_VIEW_BATTLE(sendMsg)
	g_network.send_message(g_network_message_type.CS_PVP_VIEW_BATTLE, sendMsg)

end

-- message:玩家VS玩家
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 玩家角色ID
-- 		["challengeRoleId"] Type:INTEGER Size:4 要挑战的角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_PVP_FIGHT(sendMsg)
	g_network.send_message(g_network_message_type.CS_PVP_FIGHT, sendMsg)

end

-- message:获取霸业榜单
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["startIndex"] Type:INTEGER Size:4 榜单开始位置
-- 		["num"] Type:INTEGER Size:4 请求榜单数量
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PVP_RANK_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PVP_RANK_LIST, sendMsg)

end

-- message:获取关卡排行榜单
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["startIndex"] Type:INTEGER Size:4 榜单开始位置
-- 		["num"] Type:INTEGER Size:4 请求榜单数量
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_PVE_LEVEL_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_PVE_LEVEL_LIST, sendMsg)

end

-- message:请求恢复时间
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_RECOVER_LIST_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_RECOVER_LIST_REQUEST, sendMsg)

end

-- message:请求恢复数据
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_RECOVER_STRENGTH_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_RECOVER_STRENGTH_REQUEST, sendMsg)

end

-- message:批阅奏折
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_READ_REPORTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_READ_REPORTS, sendMsg)

end

-- message:添加奏折
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_ADD_REPORTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_ADD_REPORTS, sendMsg)

end

-- message:请求用户奏章信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_USER_REPORTS(sendMsg)
	g_network.send_message(g_network_message_type.CS_USER_REPORTS, sendMsg)

end

-- message:请求功能屏蔽
--	Table:
-- dataT =
-- {
-- 		["serverId"] Type:BYTE Size:1 服务器ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_SERVER_CONFIG_REQUEST(sendMsg)
	g_network.send_message(g_network_message_type.CS_SERVER_CONFIG_REQUEST, sendMsg)

end

-- message:获取开服奖励信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_SERVER_START_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_SERVER_START_REWARD, sendMsg)

end

-- message:领取开服奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色Id
-- 		["day"] Type:INTEGER Size:4 领取第几天的奖励
-- }
-- send message to server
function g_network_client_sendto_server.CS_ACCEPT_SERVER_START_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_ACCEPT_SERVER_START_REWARD, sendMsg)

end

-- message:获取新玩家签到奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_CHECKIN_REWARD_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_CHECKIN_REWARD_INFO, sendMsg)

end

-- message:领取签到奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["day"] Type:INTEGER Size:4 领取奖励天数
-- }
-- send message to server
function g_network_client_sendto_server.CS_ACCEPT_CHECKIN_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_ACCEPT_CHECKIN_REWARD, sendMsg)

end

-- message:选秀
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_SHOP_XUAN_XIU(sendMsg)
	g_network.send_message(g_network_message_type.CS_SHOP_XUAN_XIU, sendMsg)

end

-- message:科举
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_SHOP_KE_JU(sendMsg)
	g_network.send_message(g_network_message_type.CS_SHOP_KE_JU, sendMsg)

end

-- message:商城美女
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 类型 1-乡选 2-会选 3-殿选
-- }
-- send message to server
function g_network_client_sendto_server.CS_SHOP_BEAUTY(sendMsg)
	g_network.send_message(g_network_message_type.CS_SHOP_BEAUTY, sendMsg)

end

-- message:商城名臣卡牌
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 类型 1-乡试 2-会试 3-殿试
-- }
-- send message to server
function g_network_client_sendto_server.CS_SHOP_OFFICER(sendMsg)
	g_network.send_message(g_network_message_type.CS_SHOP_OFFICER, sendMsg)

end

-- message:美女抽卡
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 类型 1-乡选 2-会选 3-殿选
-- 		["index"] Type:BYTE Size:1 下标
-- }
-- send message to server
function g_network_client_sendto_server.CS_SHOP_EXTRACT_BEAUTY(sendMsg)
	g_network.send_message(g_network_message_type.CS_SHOP_EXTRACT_BEAUTY, sendMsg)

end

-- message:名臣抽卡
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 类型 1-乡试 2-会试 3-殿试
-- 		["index"] Type:BYTE Size:1 下标
-- }
-- send message to server
function g_network_client_sendto_server.CS_SHOP_EXTRACT_OFFICER(sendMsg)
	g_network.send_message(g_network_message_type.CS_SHOP_EXTRACT_OFFICER, sendMsg)

end

-- message:名臣图签请求
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_OFFICER_TITLE_BLOCK(sendMsg)
	g_network.send_message(g_network_message_type.CS_OFFICER_TITLE_BLOCK, sendMsg)

end

-- message:美女图签请求
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_BEAUTY_TITLE_BLOCK(sendMsg)
	g_network.send_message(g_network_message_type.CS_BEAUTY_TITLE_BLOCK, sendMsg)

end

-- message:装备图签请求
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_EQUIP_TITLE_BLOCK(sendMsg)
	g_network.send_message(g_network_message_type.CS_EQUIP_TITLE_BLOCK, sendMsg)

end

-- message:兵法图签请求
--	Table:
-- dataT =
-- {
-- 		["uid"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_BING_FA_TITLE_BLOCK(sendMsg)
	g_network.send_message(g_network_message_type.CS_BING_FA_TITLE_BLOCK, sendMsg)

end

-- message:交易请求
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["flag"] Type:INTEGER Size:4 标志位：0-请求订单，1：二次验证
-- 		["productId"] Type:INTEGER Size:4 产品Id
-- 		["transactionID"] Type:STRING Size:4 订单ID
-- 		["receipt"] Type:STRING Size:4 凭证
-- }
-- send message to server
function g_network_client_sendto_server.CS_TRANSACTION(sendMsg)
	g_network.send_message(g_network_message_type.CS_TRANSACTION, sendMsg)

end

-- message:通知vivo交易流水信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0，-1
-- 		["transactionId"] Type:STRING Size:4 游戏交易Id
-- 		["vivoTransactionId"] Type:STRING Size:4 vivo交易Id
-- 		["vivoSignature"] Type:STRING Size:4 vivosignature
-- }
-- send message to server
function g_network_client_sendto_server.CS_VIVO_ORDER(sendMsg)
	g_network.send_message(g_network_message_type.CS_VIVO_ORDER, sendMsg)

end

-- message:通知交易订单验证结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 订单验证结果
-- 		["channel"] Type:INTEGER Size:4 渠道号
-- 		["role_name"] Type:STRING Size:4 订单角色名
-- 		["transactionId"] Type:STRING Size:4 订单Id
-- }
-- send message to server
function g_network_client_sendto_server.CS_TRANSACTION_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_TRANSACTION_INFO, sendMsg)

end

-- message:请求玩家是否有首次充值奖励领取
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_CHARGE_REWARD_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_CHARGE_REWARD_INFO, sendMsg)

end

-- message:领取首次充值奖励领取
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_USE_CHARGE_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_USE_CHARGE_REWARD, sendMsg)

end

-- message:获得月卡数据
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_MONTH_CARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_MONTH_CARD, sendMsg)

end

-- message:领取月卡奖励
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["day"] Type:INTEGER Size:4 领取指定的奖励
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_MONTH_CARD_REWARD(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_MONTH_CARD_REWARD, sendMsg)

end

-- message:MYCARD 交易请求
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["cardId"] Type:STRING Size:4 MYCARD 卡号
-- 		["password"] Type:STRING Size:4 卡号密码
-- 		["transactionId"] Type:STRING Size:4 交易号
-- 		["productId"] Type:INTEGER Size:4 产品Id
-- }
-- send message to server
function g_network_client_sendto_server.CS_MYCARD_TRANSACTION(sendMsg)
	g_network.send_message(g_network_message_type.CS_MYCARD_TRANSACTION, sendMsg)

end

-- message:给用户冲入能升VIP等级的gold
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["goldnum"] Type:INTEGER Size:4 gold数量
-- }
-- send message to server
function g_network_client_sendto_server.CS_CHARGE_VIP_GOLD(sendMsg)
	g_network.send_message(g_network_message_type.CS_CHARGE_VIP_GOLD, sendMsg)

end

-- message:购买vip礼包
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["vip_level"] Type:SHORT Size:2 购买的VIP礼包等级
-- }
-- send message to server
function g_network_client_sendto_server.CS_BUY_VIP_PACKAGE(sendMsg)
	g_network.send_message(g_network_message_type.CS_BUY_VIP_PACKAGE, sendMsg)

end

-- message:获取用户VIP信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_GET_VIP_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GET_VIP_INFO, sendMsg)

end

-- message:请求上次击杀BOSS的信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_LAST_KILL_BOSS_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_LAST_KILL_BOSS_INFO, sendMsg)

end

-- message:请求当前  世界boss 活动期间信息
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_CURRENT_FIGHT_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_CURRENT_FIGHT_INFO, sendMsg)

end

-- message:鼓舞
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 鼓舞类型 1-鼓舞一次 2-鼓舞十次
-- }
-- send message to server
function g_network_client_sendto_server.CS_GU_WU_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_GU_WU_INFO, sendMsg)

end

-- message:涅槃重生
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_REBORN_FIGHT(sendMsg)
	g_network.send_message(g_network_message_type.CS_REBORN_FIGHT, sendMsg)

end

-- message:榜单数据
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["type"] Type:BYTE Size:1 榜单类型 1-历史榜单 2-当前伤害榜单
-- }
-- send message to server
function g_network_client_sendto_server.CS_RANK_LIST(sendMsg)
	g_network.send_message(g_network_message_type.CS_RANK_LIST, sendMsg)

end

-- message:挑战世界BOSS
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_WORLD_BOSS_FIGHT(sendMsg)
	g_network.send_message(g_network_message_type.CS_WORLD_BOSS_FIGHT, sendMsg)

end

-- message:活动期间用户数据
--	Table:
-- dataT =
-- {
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- }
-- send message to server
function g_network_client_sendto_server.CS_WORLD_BOOS_USER_INFO(sendMsg)
	g_network.send_message(g_network_message_type.CS_WORLD_BOOS_USER_INFO, sendMsg)

end

-- send message to server
function g_network_client_sendto_server.CS_BIND_ACCOUNT(sendMsg)
	g_network.send_message(g_network_message_type.CS_BIND_ACCOUNT, sendMsg)

end