-- server to client message
-- Table:
g_network_server_sendto_client = {}
-- message:返回服务器时间戳
--	Table:
-- dataT =
-- {
-- 		["serverTime"] Type:INTEGER Size:4 服务器时间 单位为秒
-- }
-- read server message
function g_network_server_sendto_client.SC_IS_ALIVE_TEST_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_IS_ALIVE_TEST_RESPONSE, call back function)

end

-- message:返回公告列表
--	Table:
-- dataT =
-- {
-- 		["announcement_list_Num"] Type:SHORT Size:2 公告列表 array length
-- 		["announcement_list"] = 
--		{ ------Type:ARRAY Size:4 公告列表
-- 				["id"] Type:INTEGER Size:4 公告ID
-- 				["seq_num"] Type:INTEGER Size:4 序列编号
-- 				["title"] Type:STRING Size:4 公告标题
-- 				["content"] Type:STRING Size:4 公告内容
-- 				["new"] Type:BYTE Size:1 是否是new公告
-- 				["timestamp"] Type:INTEGER Size:4 公告发布时间戳
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_ANNOUNCEMENTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_ANNOUNCEMENTS, call back function)

end

-- message:发送或更新公告结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 发送结果
-- }
-- read server message
function g_network_server_sendto_client.SC_SEND_ANNOUNCEMENTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SEND_ANNOUNCEMENTS, call back function)

end

-- message:删除公告结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 更新结果
-- }
-- read server message
function g_network_server_sendto_client.SC_DELETE_ANNOUNCEMENTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_DELETE_ANNOUNCEMENTS, call back function)

end

-- message:返回卡牌处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:INTEGER Size:4 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_CHANGE_BATTLE_ARRAY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHANGE_BATTLE_ARRAY, call back function)

end

-- message:卡牌上阵
--	Table:
-- dataT =
-- {
-- 		["battleResult"] Type:INTEGER Size:4 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_OFFICER_CARD_BATTLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_OFFICER_CARD_BATTLE, call back function)

end

-- message:上阵结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["pId"] Type:INTEGER Size:4 主键ID
-- 		["cardId"] Type:SHORT Size:2 卡牌ID
-- }
-- read server message
function g_network_server_sendto_client.SC_SEC_BATTLE_CARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SEC_BATTLE_CARD, call back function)

end

-- message:切换当前阵容
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- }
-- read server message
function g_network_server_sendto_client.SC_CHANGE_BATTLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHANGE_BATTLE, call back function)

end

-- message:返回美女列表
--	Table:
-- dataT =
-- {
-- 		["battleList_Num"] Type:SHORT Size:2 上阵美女列表 array length
-- 		["battleList"] = 
--		{ ------Type:ARRAY Size:4 上阵美女列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 				["beautyLevel"] Type:SHORT Size:2 美女等级
-- 				["beautyTitle"] Type:BYTE Size:1 美女称号
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 				["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 				["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 				["beautyExp"] Type:INTEGER Size:4 美女经验
-- 				["conceive"] Type:BYTE Size:1 是否怀孕0-没怀孕,1-怀孕,2-未领取出生皇子
-- 				["princeList_Num"] Type:SHORT Size:2 皇子列表 array length
-- 				["princeList"] = 
--				{ ------Type:ARRAY Size:4 皇子列表
-- 						["princeId"] Type:INTEGER Size:4 皇子ID
-- 				}
-- 		}
-- 		["unbattleList_Num"] Type:SHORT Size:2 未上阵美女列表 array length
-- 		["unbattleList"] = 
--		{ ------Type:ARRAY Size:4 未上阵美女列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 				["beautyLevel"] Type:SHORT Size:2 美女等级
-- 				["beautyTitle"] Type:BYTE Size:1 美女称号
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 				["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 				["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 				["beautyExp"] Type:INTEGER Size:4 美女经验
-- 				["conceive"] Type:BYTE Size:1 是否怀孕0-没怀孕,1-怀孕,2-未领取出生皇子
-- 				["princeList_Num"] Type:SHORT Size:2 皇子列表 array length
-- 				["princeList"] = 
--				{ ------Type:ARRAY Size:4 皇子列表
-- 						["princeId"] Type:INTEGER Size:4 皇子ID
-- 				}
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_BEAUTY_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BEAUTY_LIST, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_BEAUTY_BATTLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BEAUTY_BATTLE, call back function)

end

-- message:册封
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["consume"] Type:INTEGER Size:4 消耗银两
-- 		["remain"] Type:INTEGER Size:4 剩下的银两
-- }
-- read server message
function g_network_server_sendto_client.SC_BEAUTY_CEFENG(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BEAUTY_CEFENG, call back function)

end

-- message:宠幸美女
--	Table:
-- dataT =
-- {
-- 		["rewardId"] Type:SHORT Size:2 奖励ID
-- 		["rewardValue"] Type:SHORT Size:2 奖励值
-- 		["intimate"] Type:SHORT Size:2 宠幸美女增加的亲密度
-- 		["energy"] Type:BYTE Size:1 皇帝精力
-- 		["savor"] Type:BYTE Size:1 美女兴趣点
-- 		["id"] Type:INTEGER Size:4 主键ID
-- }
-- read server message
function g_network_server_sendto_client.SC_FAVOR_BEAUTY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_FAVOR_BEAUTY, call back function)

end

-- message:宫斗结果
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
-- read server message
function g_network_server_sendto_client.SC_PALACE_BATTLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PALACE_BATTLE, call back function)

end

-- message:废妃
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_WASTER_PRINCESS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_WASTER_PRINCESS, call back function)

end

-- message:怀孕
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["remainTime"] Type:SHORT Size:2 怀孕倒计时
-- 		["id"] Type:INTEGER Size:4 皇子主键ID
-- 		["princeResource"] Type:BYTE Size:1 皇子资源
-- 		["princeStar"] Type:BYTE Size:1 皇子星级
-- 		["princeLevel"] Type:BYTE Size:1 皇子等级
-- 		["exp"] Type:INTEGER Size:4 皇子经验
-- 		["mother"] Type:INTEGER Size:4 皇子母亲
-- 		["alive"] Type:BYTE Size:1 皇子母亲是否活着
-- 		["princeTitle"] Type:BYTE Size:1 皇子称号
-- 		["position"] Type:BYTE Size:1 位置
-- 		["princeSkill"] Type:SHORT Size:2 皇子技能
-- 		["passiveSkillId"] Type:SHORT Size:2 皇子被动技能ID
-- 		["princeName"] Type:STRING Size:4 皇子名字
-- 		["beautyId"] Type:SHORT Size:2 皇子母亲的卡牌ID
-- 		["princeDes"] Type:BYTE Size:1 皇子描述
-- }
-- read server message
function g_network_server_sendto_client.SC_BEAUTY_CONCEIVE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BEAUTY_CONCEIVE, call back function)

end

-- message:处理领取皇子
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["id"] Type:INTEGER Size:4 皇子主键ID
-- 		["princeResource"] Type:BYTE Size:1 皇子资源
-- 		["princeStar"] Type:BYTE Size:1 皇子星级
-- 		["princeLevel"] Type:BYTE Size:1 皇子等级
-- 		["exp"] Type:INTEGER Size:4 皇子经验
-- 		["mother"] Type:INTEGER Size:4 皇子母亲
-- 		["alive"] Type:BYTE Size:1 皇子母亲是否活着
-- 		["princeTitle"] Type:BYTE Size:1 皇子称号
-- 		["position"] Type:BYTE Size:1 位置
-- 		["princeSkill"] Type:SHORT Size:2 皇子技能
-- 		["passiveSkillId"] Type:SHORT Size:2 皇子被动技能ID
-- 		["princeName"] Type:STRING Size:4 皇子名字
-- 		["beautyId"] Type:SHORT Size:2 皇子母亲的卡牌ID
-- 		["princeDes"] Type:BYTE Size:1 皇子描述
-- }
-- read server message
function g_network_server_sendto_client.SC_OBTAIN_PRINCE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_OBTAIN_PRINCE, call back function)

end

-- message:返回列表
--	Table:
-- dataT =
-- {
-- 		["pieceList_Num"] Type:SHORT Size:2 拥有的碎片列表 array length
-- 		["pieceList"] = 
--		{ ------Type:ARRAY Size:4 拥有的碎片列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["fragmentId"] Type:SHORT Size:2 碎片ID
-- 				["count"] Type:INTEGER Size:4 拥有数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_PIECE_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_PIECE_LIST, call back function)

end

-- message:返回兵法列表
--	Table:
-- dataT =
-- {
-- 		["bookList_Num"] Type:SHORT Size:2 兵法列表 array length
-- 		["bookList"] = 
--		{ ------Type:ARRAY Size:4 兵法列表
-- 				["primaryId"] Type:INTEGER Size:4 主键ID
-- 				["equip_id"] Type:SHORT Size:2 兵法ID
-- 				["bookExp"] Type:INTEGER Size:4 兵法经验
-- 				["equip_level"] Type:BYTE Size:1 兵法等级
-- 				["status"] Type:BYTE Size:1 状态
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["battle"] Type:BYTE Size:1 阵容
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_BOOKS_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_BOOKS_LIST, call back function)

end

-- message:出售结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["silver"] Type:INTEGER Size:4 用户银两
-- }
-- read server message
function g_network_server_sendto_client.SC_BOOK_PRICE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BOOK_PRICE, call back function)

end

-- message:升级结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["silver"] Type:INTEGER Size:4 用户银两数
-- 		["level"] Type:BYTE Size:1 兵法等级
-- 		["exp"] Type:INTEGER Size:4 兵法经验
-- 		["obtainExp"] Type:INTEGER Size:4 总共获得的经验
-- }
-- read server message
function g_network_server_sendto_client.SC_UPGRADE_BING_FA(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPGRADE_BING_FA, call back function)

end

-- message:合成结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功,0-失败
-- 		["bingFaId"] Type:SHORT Size:2 合成的兵法ID
-- 		["bId"] Type:INTEGER Size:4 兵法主键ID
-- }
-- read server message
function g_network_server_sendto_client.SC_MERGE_BING_FA(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_MERGE_BING_FA, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果0-成功,1-银两不足,2-没有同名卡牌,3-角色错误,4-未指定要进阶的卡牌,5-卡牌错误
-- 		["offical"] Type:BYTE Size:1 官职
-- 		["silver"] Type:INTEGER Size:4 用户剩下的银两
-- 		["cardId"] Type:INTEGER Size:4 被吞掉的卡牌主键ID
-- }
-- read server message
function g_network_server_sendto_client.SC_CARD_ADVANCED(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CARD_ADVANCED, call back function)

end

-- message:卡牌组合数据
--	Table:
-- dataT =
-- {
-- 		["cardCombinaList_Num"] Type:SHORT Size:2 卡牌组合列表数据 array length
-- 		["cardCombinaList"] = 
--		{ ------Type:ARRAY Size:4 卡牌组合列表数据
-- 				["combinaId"] Type:INTEGER Size:4 组合ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_CARD_COMBINA_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_CARD_COMBINA_INFO, call back function)

end

-- message:卡牌炼化结果
--	Table:
-- dataT =
-- {
-- 		["res"] Type:BYTE Size:1 结果：0-成功，-1：失败
-- 		["baoyin"] Type:INTEGER Size:4 真龙宝珠数量
-- 		["jitianList_Num"] Type:SHORT Size:2 炼化结果列表 array length
-- 		["jitianList"] = 
--		{ ------Type:ARRAY Size:4 炼化结果列表
-- 				["type"] Type:BYTE Size:1 类型
-- 				["primaryId"] Type:INTEGER Size:4 主键ID
-- 				["id"] Type:INTEGER Size:4 类型ID
-- 				["num"] Type:INTEGER Size:4 数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_CARD_JITIAN(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CARD_JITIAN, call back function)

end

-- message:返回商店商品列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 1成功，0失败
-- 		["gold"] Type:INTEGER Size:4 用户元宝数
-- 		["itemNum"] Type:INTEGER Size:4 刷新令个数
-- 		["nextFlushTime"] Type:INTEGER Size:4 下次刷新时间
-- 		["shopItemMask"] Type:INTEGER Size:4 商品购买掩码
-- 		["list_Num"] Type:SHORT Size:2 商品列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 商品列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["id"] Type:INTEGER Size:4 物品id
-- 				["num"] Type:INTEGER Size:4 物品数量
-- 				["score"] Type:INTEGER Size:4 积分价格
-- 				["des"] Type:STRING Size:4 商品描述
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_JITIAN_SHOP_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_JITIAN_SHOP_INFO, call back function)

end

-- message:返回兑换结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["type"] Type:BYTE Size:1 物品类型
-- 		["id"] Type:INTEGER Size:4 物品id
-- 		["num"] Type:INTEGER Size:4 数量
-- 		["primaryId"] Type:INTEGER Size:4 主键id
-- 		["baoyin"] Type:INTEGER Size:4 玩家真龙宝印数量
-- }
-- read server message
function g_network_server_sendto_client.SC_JITIAN_SHOP_BUY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_JITIAN_SHOP_BUY, call back function)

end

-- message:返回角色祭天信息，登录主动推送
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- 		["baoyin"] Type:INTEGER Size:4 真龙宝印数量
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_USER_JITIAN_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_USER_JITIAN_INFO, call back function)

end

-- message:名臣卡出售结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["obtainSilver"] Type:INTEGER Size:4 出售卡牌得到的银两
-- 		["silver"] Type:INTEGER Size:4 账户现有的银两
-- }
-- read server message
function g_network_server_sendto_client.SC_OFFICER_CARD_PRICE_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_OFFICER_CARD_PRICE_RESPONSE, call back function)

end

-- message:美女卡牌出售结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["obtainSilver"] Type:INTEGER Size:4 出售美女得到的银两
-- 		["silver"] Type:INTEGER Size:4 账户现有的银两
-- }
-- read server message
function g_network_server_sendto_client.SC_BEAUTY_CARD_PRICE_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BEAUTY_CARD_PRICE_RESPONSE, call back function)

end

-- message:皇子卡出售结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["obtainSilver"] Type:INTEGER Size:4 出售卡牌得到的银两
-- 		["silver"] Type:INTEGER Size:4 账户现有的银两
-- }
-- read server message
function g_network_server_sendto_client.SC_PRINCE_CARD_PRICE_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PRINCE_CARD_PRICE_RESPONSE, call back function)

end

-- message:商城物品列表
--	Table:
-- dataT =
-- {
-- 		["itemList_Num"] Type:SHORT Size:2 物品列表 array length
-- 		["itemList"] = 
--		{ ------Type:ARRAY Size:4 物品列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["gold"] Type:INTEGER Size:4 元宝
-- 				["price"] Type:INTEGER Size:4 原价
-- 				["discount"] Type:INTEGER Size:4 折扣价
-- 				["isDiscount"] Type:BYTE Size:1 是否打折
-- 				["itemKey"] Type:STRING Size:4 物品标识
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_ITEM_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_ITEM_LIST, call back function)

end

-- message:战斗数据
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名称
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 怪物ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["selfSkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["enemyPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["selfId"] Type:INTEGER Size:4 主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["enemyId"] Type:INTEGER Size:4 敌方主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["currLevel"] Type:BYTE Size:1 用户等级
-- 		["emperorExp"] Type:INTEGER Size:4 用户经验
-- 		["obtainExp"] Type:INTEGER Size:4 打关卡获得的经验
-- 		["silver"] Type:INTEGER Size:4 用户银两
-- 		["energy"] Type:INTEGER Size:4 用户精力
-- 		["strength"] Type:INTEGER Size:4 用户体力
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["beautyReward_Num"] Type:SHORT Size:2 美女奖励 array length
-- 		["beautyReward"] = 
--		{ ------Type:ARRAY Size:4 美女奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 		}
-- 		["officerReward_Num"] Type:SHORT Size:2 名臣奖励 array length
-- 		["officerReward"] = 
--		{ ------Type:ARRAY Size:4 名臣奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 		}
-- 		["equipReward_Num"] Type:SHORT Size:2 装备奖励 array length
-- 		["equipReward"] = 
--		{ ------Type:ARRAY Size:4 装备奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["equipId"] Type:INTEGER Size:4 装备ID
-- 		}
-- 		["chipReward_Num"] Type:SHORT Size:2 碎片奖励 array length
-- 		["chipReward"] = 
--		{ ------Type:ARRAY Size:4 碎片奖励
-- 				["type"] Type:BYTE Size:1 碎片类型 1-名臣,2-美女,3-装备
-- 				["chipId"] Type:SHORT Size:2 碎片ID
-- 		}
-- 		["propReward_Num"] Type:SHORT Size:2 道具奖励 array length
-- 		["propReward"] = 
--		{ ------Type:ARRAY Size:4 道具奖励
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_ELITE_FIGHT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ELITE_FIGHT, call back function)

end

-- message:返回用户装备列表
--	Table:
-- dataT =
-- {
-- 		["equipments_Num"] Type:SHORT Size:2 装备列表 array length
-- 		["equipments"] = 
--		{ ------Type:ARRAY Size:4 装备列表
-- 				["primaryId"] Type:INTEGER Size:4 主键Id
-- 				["equip_id"] Type:INTEGER Size:4 装备Id
-- 				["status"] Type:BYTE Size:1 装备状态0：未装备，1：装备
-- 				["battle"] Type:BYTE Size:1 装备所在阵容
-- 				["position"] Type:BYTE Size:1 装备所在位置
-- 				["equip_level"] Type:INTEGER Size:4 装备等级
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_EQUIPMENTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_EQUIPMENTS, call back function)

end

-- message:使用或装备结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_EQUIPMENTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_EQUIPMENTS, call back function)

end

-- message:卸下装备结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- }
-- read server message
function g_network_server_sendto_client.SC_REMOVE_EQUIPMENTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_REMOVE_EQUIPMENTS, call back function)

end

-- message:装备升级结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["level"] Type:INTEGER Size:4 升级的等级
-- 		["silver"] Type:INTEGER Size:4 用户当前的银两
-- }
-- read server message
function g_network_server_sendto_client.SC_EQUIPMENT_LEVEL_UP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_EQUIPMENT_LEVEL_UP, call back function)

end

-- message:装备出售结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["silver"] Type:INTEGER Size:4 用户当前的银两
-- }
-- read server message
function g_network_server_sendto_client.SC_SELL_EQUIPMENT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SELL_EQUIPMENT, call back function)

end

-- message:断开链接原因
--	Table:
-- dataT =
-- {
-- 		["reason"] Type:SHORT Size:2 原因 1-服务端主动断开连接 2-被踢下线
-- }
-- read server message
function g_network_server_sendto_client.SC_DISCONNECT_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_DISCONNECT_INFO, call back function)

end

-- message:使用兑换码结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果：0-成功，1-已经被使用过了 2-激活码库中找不到匹配的
-- 		["rewardList_Num"] Type:SHORT Size:2 更新用户奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 更新用户奖励列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、装备主键ID
-- 				["id"] Type:INTEGER Size:4 道具、碎片的id
-- 				["value"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_EXCHANGE_CODE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_EXCHANGE_CODE, call back function)

end

-- message:返回兑换结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 兑换结果
-- 		["updateInfo_Num"] Type:SHORT Size:2 兑换刷新数据 array length
-- 		["updateInfo"] = 
--		{ ------Type:ARRAY Size:4 兑换刷新数据
-- 				["type"] Type:BYTE Size:1 更新信息的物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备的主键ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具、装备的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_EXCHANGE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_EXCHANGE, call back function)

end

-- message:碎片列表
--	Table:
-- dataT =
-- {
-- 		["fragmentList_Num"] Type:SHORT Size:2 碎片 array length
-- 		["fragmentList"] = 
--		{ ------Type:ARRAY Size:4 碎片
-- 				["fragmentId"] Type:INTEGER Size:4 碎片ID
-- 				["count"] Type:SHORT Size:2 拥有个数
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_FRAGMENT_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_FRAGMENT_INFO, call back function)

end

-- message:处理碎片合成
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果 0-失败,1-成功
-- 		["id"] Type:INTEGER Size:4 主键ID
-- }
-- read server message
function g_network_server_sendto_client.SC_FRAGMENT_MERGE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_FRAGMENT_MERGE, call back function)

end

-- message:返回当前活动列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果，1有活动，0无活动
-- 		["list_Num"] Type:SHORT Size:2 当前活动的列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 当前活动的列表
-- 				["type"] Type:BYTE Size:1 活动类型
-- 				["endTime"] Type:INTEGER Size:4 活动结束时间
-- 				["data"] Type:STRING Size:4 活动配置表
-- 		}
-- 		["time"] Type:INTEGER Size:4 下一次请求时间
-- }
-- read server message
function g_network_server_sendto_client.SC_HUODONG_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_HUODONG_INFO, call back function)

end

-- message:抽奖信息
--	Table:
-- dataT =
-- {
-- 		["rank"] Type:INTEGER Size:4 玩家排名
-- 		["score"] Type:INTEGER Size:4 玩家累计积分
-- 		["currentScore"] Type:INTEGER Size:4 玩家当前积分
-- 		["price1"] Type:INTEGER Size:4 抽奖一次价格
-- 		["price10"] Type:INTEGER Size:4 抽奖10次价格
-- 		["refreshPrice"] Type:INTEGER Size:4 刷新商店价格
-- 		["freeTime"] Type:BYTE Size:1 今天免费抽了几次
-- }
-- read server message
function g_network_server_sendto_client.SC_CHOUJIANG_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHOUJIANG_INFO, call back function)

end

-- message:抽奖排行榜信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 1成功，0失败
-- 		["list_Num"] Type:SHORT Size:2 排行榜列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 排行榜列表
-- 				["name"] Type:STRING Size:4 玩家名字
-- 				["nianhao"] Type:STRING Size:4 玩家年号
-- 				["score"] Type:INTEGER Size:4 玩家积分
-- 		}
-- 		["rank"] Type:INTEGER Size:4 玩家排名
-- 		["score"] Type:INTEGER Size:4 玩家累计积分
-- }
-- read server message
function g_network_server_sendto_client.SC_CHOUJIANG_RANK(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHOUJIANG_RANK, call back function)

end

-- message:玩家抽奖
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 1成功，0失败
-- 		["list_Num"] Type:SHORT Size:2 奖励列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 奖励列表
-- 				["type"] Type:BYTE Size:1 类型
-- 				["id"] Type:INTEGER Size:4 物品id
-- 				["num"] Type:INTEGER Size:4 物品数量
-- 				["primaryId"] Type:INTEGER Size:4 物品主键id
-- 				["rewardNum"] Type:INTEGER Size:4 实际奖励数
-- 		}
-- 		["gold"] Type:INTEGER Size:4 玩家元宝数
-- 		["score"] Type:INTEGER Size:4 玩家累计积分
-- 		["currentScore"] Type:INTEGER Size:4 玩家当前积分
-- 		["rank"] Type:INTEGER Size:4 玩家排名
-- }
-- read server message
function g_network_server_sendto_client.SC_CHOUJIANG(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHOUJIANG, call back function)

end

-- message:抽奖商店
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 1成功，0失败
-- 		["gold"] Type:INTEGER Size:4 玩家元宝数
-- 		["list_Num"] Type:SHORT Size:2 商品列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 商品列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["id"] Type:INTEGER Size:4 物品id
-- 				["num"] Type:INTEGER Size:4 物品数量
-- 				["score"] Type:INTEGER Size:4 积分价格
-- 				["des"] Type:STRING Size:4 商品描述
-- 		}
-- 		["nextFlushTime"] Type:INTEGER Size:4 下一次刷新时间
-- 		["shopItemMask"] Type:INTEGER Size:4 商店购买物品掩码
-- }
-- read server message
function g_network_server_sendto_client.SC_CHOUJIANG_SHOP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHOUJIANG_SHOP, call back function)

end

-- message:抽奖商店购买
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["type"] Type:BYTE Size:1 物品类型
-- 		["id"] Type:INTEGER Size:4 物品id
-- 		["num"] Type:INTEGER Size:4 数量
-- 		["primaryId"] Type:INTEGER Size:4 主键id
-- 		["currentScore"] Type:INTEGER Size:4 玩家当前积分
-- }
-- read server message
function g_network_server_sendto_client.SC_CHOUJIANG_SHOP_BUY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHOUJIANG_SHOP_BUY, call back function)

end

-- message:福袋信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果, 1成功
-- 		["list_Num"] Type:SHORT Size:2 数据列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 数据列表
-- 				["num"] Type:INTEGER Size:4 物品剩余数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_FORTUNE_BOX(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_FORTUNE_BOX, call back function)

end

-- message:购买福袋
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果, 1成功
-- 		["gold"] Type:INTEGER Size:4 元宝总数
-- 		["type"] Type:BYTE Size:1 物品类型
-- 		["id"] Type:INTEGER Size:4 物品id
-- 		["num"] Type:INTEGER Size:4 物品数量
-- 		["primaryId"] Type:INTEGER Size:4 物品主键
-- 		["left"] Type:INTEGER Size:4 宝箱剩余数量
-- }
-- read server message
function g_network_server_sendto_client.SC_BUY_FORTUNE_BOX(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BUY_FORTUNE_BOX, call back function)

end

-- message:返回玩家已经领取奖励的等级列表
--	Table:
-- dataT =
-- {
-- 		["reward_level_list_Num"] Type:SHORT Size:2 玩家已领取奖励的等级列表 array length
-- 		["reward_level_list"] = 
--		{ ------Type:ARRAY Size:4 玩家已领取奖励的等级列表
-- 				["level"] Type:INTEGER Size:4 等级
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_USER_REWARD_LEVEL(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_USER_REWARD_LEVEL, call back function)

end

-- message:返回领取等级奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 领取奖励结果
-- 		["updateInfo_Num"] Type:SHORT Size:2 奖励结果的更新信息 array length
-- 		["updateInfo"] = 
--		{ ------Type:ARRAY Size:4 奖励结果的更新信息
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新加卡牌、道具、装备的主键id
-- 				["id"] Type:INTEGER Size:4 卡牌、道具、装备id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_RECEIVE_LEVEL_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_RECEIVE_LEVEL_REWARD, call back function)

end

-- message:上限信息
--	Table:
-- dataT =
-- {
-- 		["list_Num"] Type:SHORT Size:2 背包列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 背包列表
-- 				["status"] Type:BYTE Size:1 背包状态 0-未满,1-已满
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_LIMIT_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_LIMIT_INFO, call back function)

end

-- message:返回更改年号结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 更改年号结果
-- }
-- read server message
function g_network_server_sendto_client.SC_CHANGE_REIGN(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHANGE_REIGN, call back function)

end

-- message:返回接收活动奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 服务器操作结果：0-成功，1-活动时间未到，2-活动已经过期，3-已经领取过此活动奖励，-1-其他错误
-- 		["strength"] Type:INTEGER Size:4 用户当前粮草数
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_STRENGTH_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_STRENGTH_REWARD, call back function)

end

-- message:服务器推送用户接收定时活动奖励信息
--	Table:
-- dataT =
-- {
-- 		["reward1"] Type:BYTE Size:1 是否领取奖励1
-- 		["reward2"] Type:BYTE Size:1 是否领取奖励2
-- }
-- read server message
function g_network_server_sendto_client.SC_USER_STRENGTH_REWARD_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USER_STRENGTH_REWARD_INFO, call back function)

end

-- message:返回购买副本结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 购买结果：0-成功，1-关卡无效，2-元宝不够，3-购买次数达到上限，4-关卡未打完，-1-其他错误
-- 		["gold"] Type:INTEGER Size:4 用户当前元宝数
-- }
-- read server message
function g_network_server_sendto_client.SC_PURCHASE_FUBEN(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PURCHASE_FUBEN, call back function)

end

-- message:返回购买副本信息
--	Table:
-- dataT =
-- {
-- 		["canPurchase"] Type:BYTE Size:1 是否可以购买：0-可以购买，1-关卡无效，2-元宝不足，3-购买次数达到上限，4-关卡未打完，-1-其他错误
-- 		["needgold"] Type:INTEGER Size:4 本次购买需要的元宝
-- 		["purchaseTimes"] Type:INTEGER Size:4 剩余购买次数
-- }
-- read server message
function g_network_server_sendto_client.SC_PURCHASE_FUBEN_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PURCHASE_FUBEN_INFO, call back function)

end

-- message:返回征税结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，1-征税次数不足，2-元宝不足，-1：其他错误
-- 		["gold"] Type:INTEGER Size:4 当前元宝数
-- 		["silver"] Type:INTEGER Size:4 当前银两
-- }
-- read server message
function g_network_server_sendto_client.SC_TEX(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_TEX, call back function)

end

-- message:返回寻访结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 寻访结果：0-成功，1-错误
-- 		["rewardList_Num"] Type:SHORT Size:2 寻访奖励结果 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 寻访奖励结果
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_VISIT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_VISIT, call back function)

end

-- message:赏赐美女结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 赏赐结果：0-成功，-1-失败
-- }
-- read server message
function g_network_server_sendto_client.SC_REWARD_BEAUTY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_REWARD_BEAUTY, call back function)

end

-- message:加速怀孕
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["gold"] Type:INTEGER Size:4 用户当前元宝
-- }
-- read server message
function g_network_server_sendto_client.SC_ACCEL_CONCEIVE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ACCEL_CONCEIVE, call back function)

end

-- message:返回充值签到信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- 		["money"] Type:INTEGER Size:4 今日已充值金额
-- 		["checkNum"] Type:INTEGER Size:4 已经签到次数
-- 		["mask"] Type:INTEGER Size:4 已领取奖励掩码
-- 		["rewardDes"] Type:STRING Size:4 奖励描述
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_CHARGE_CHECKIN_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_CHARGE_CHECKIN_INFO, call back function)

end

-- message:返回领取充值签到奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- 		["rewardList_Num"] Type:SHORT Size:2 奖励结果 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 奖励结果
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_ACCEPT_CHARGE_CHECKIN_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ACCEPT_CHARGE_CHECKIN_REWARD, call back function)

end

-- message:登陆成功后返回的主场景信息
--	Table:
-- dataT =
-- {
-- 		["mainCity_Num"] Type:SHORT Size:2 主场景 array length
-- 		["mainCity"] = 
--		{ ------Type:ARRAY Size:4 主场景
-- 				["cityId"] Type:INTEGER Size:4 宫殿
-- 		}
-- 		["roleId"] Type:INTEGER Size:4 角色ID
-- 		["image"] Type:INTEGER Size:4 头像
-- 		["name"] Type:STRING Size:4 角色名
-- 		["reign"] Type:STRING Size:4 年号
-- 		["vipLevel"] Type:INTEGER Size:4 vip等级
-- 		["level"] Type:INTEGER Size:4 玩家等级
-- 		["exp"] Type:INTEGER Size:4 经验
-- 		["attack"] Type:INTEGER Size:4 攻击力
-- 		["defense"] Type:INTEGER Size:4 防御力
-- 		["silver"] Type:INTEGER Size:4 银两
-- 		["gold"] Type:INTEGER Size:4 元宝
-- 		["strength"] Type:INTEGER Size:4 体力
-- 		["energy"] Type:INTEGER Size:4 精力
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["challengeNum"] Type:INTEGER Size:4 挑战次数
-- 		["guideStep"] Type:SHORT Size:2 新手引导步骤
-- 		["buzhen"] Type:BYTE Size:1 布阵 0-没有 1-布过阵
-- 		["princeLevelUp"] Type:BYTE Size:1 皇子升级 0-没有升过级，1-升过级
-- 		["arena"] Type:BYTE Size:1 是否进过竞技场 0-没有进过竞技场,1-进过竞技场
-- 		["wearEquip"] Type:BYTE Size:1 是否装备过装备 0-没有装备过,1-装备过
-- 		["isFirstLogin"] Type:BYTE Size:1 是否首次登陆0-不是首次登陆,1-是首次登陆
-- 		["princeSecLevelUp"] Type:BYTE Size:1 皇子第二次升级 0-没有升过级,1-升过级
-- 		["curr_battle"] Type:BYTE Size:1 当前阵容：1,2
-- 		["chipMerge"] Type:BYTE Size:1 是否进行过碎片合成 0-没有合成过 1-合成过
-- }
-- read server message
function g_network_server_sendto_client.SC_LOGIN_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_LOGIN_INFO, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 1-无角色,2-同名
-- }
-- read server message
function g_network_server_sendto_client.SC_CREATE_ROLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CREATE_ROLE, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 1-成功,0-失败
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_GUIDE_STEP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_GUIDE_STEP, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- }
-- read server message
function g_network_server_sendto_client.SC_RECONNECT_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_RECONNECT_RESPONSE, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-失败,1-成功
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_FIRST_LOGIN(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_FIRST_LOGIN, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_BU_ZHEN(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_BU_ZHEN, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_PRINCE_LEVEL_UP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_PRINCE_LEVEL_UP, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_ARENA(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_ARENA, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_WEAR_EQUIP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_WEAR_EQUIP, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- }
-- read server message
function g_network_server_sendto_client.SC_UPDATE_PRINCE_SECOND_LEVEL_UP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_UPDATE_PRINCE_SECOND_LEVEL_UP, call back function)

end

-- message:奖励列表
--	Table:
-- dataT =
-- {
-- 		["days"] Type:BYTE Size:1 连续登陆天数
-- 		["rewardList_Num"] Type:SHORT Size:2 列表 没有奖励时数组长度为 0 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 列表 没有奖励时数组长度为 0
-- 				["rewardId"] Type:INTEGER Size:4 奖励ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_LOGIN_REWARD_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_LOGIN_REWARD_RESPONSE, call back function)

end

-- message:使用结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-失败 1-成功
-- 		["resultList_Num"] Type:SHORT Size:2 使用奖励后返回的数据 array length
-- 		["resultList"] = 
--		{ ------Type:ARRAY Size:4 使用奖励后返回的数据
-- 				["type"] Type:BYTE Size:1 类型标识 2-美女卡牌,3-名臣卡牌,6-装备
-- 				["cardId"] Type:INTEGER Size:4 和类型相关 2-美女卡牌,3-名臣卡牌,6-装备
-- 				["uniquId"] Type:INTEGER Size:4 主键ID
-- 				["totalNum"] Type:INTEGER Size:4 更新数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_LOGIN_REWARD_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_LOGIN_REWARD_RESPONSE, call back function)

end

-- message:返回邮件数量
--	Table:
-- dataT =
-- {
-- 		["mail_num"] Type:INTEGER Size:4 邮件数量
-- 		["mail_type"] Type:BYTE Size:1 邮件类型：0-系统邮件，1-用户邮件
-- 		["flag"] Type:BYTE Size:1 获取标识：对于系统邮件，0-请求所有，1-请求未接受过的
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_MAIL_COUNT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_MAIL_COUNT, call back function)

end

-- message:返回指定范围用户邮件列表
--	Table:
-- dataT =
-- {
-- 		["mail_num"] Type:INTEGER Size:4 邮件总数
-- 		["server_timestamp"] Type:INTEGER Size:4 当前服务器时间戳
-- 		["mail_list_Num"] Type:SHORT Size:2 邮件列表 array length
-- 		["mail_list"] = 
--		{ ------Type:ARRAY Size:4 邮件列表
-- 				["mailID"] Type:INTEGER Size:4 邮件ID
-- 				["sendUser"] Type:STRING Size:4 发件人
-- 				["timestamp"] Type:INTEGER Size:4 邮件时间戳
-- 				["content"] Type:STRING Size:4 邮件内容
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_USER_MAILS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_USER_MAILS, call back function)

end

-- message:返回指定范围系统邮件列表
--	Table:
-- dataT =
-- {
-- 		["mail_num"] Type:INTEGER Size:4 邮件总数
-- 		["server_timestamp"] Type:INTEGER Size:4 当前服务器时间戳
-- 		["mail_list_Num"] Type:SHORT Size:2 邮件列表 array length
-- 		["mail_list"] = 
--		{ ------Type:ARRAY Size:4 邮件列表
-- 				["mailID"] Type:INTEGER Size:4 邮件ID
-- 				["timestamp"] Type:INTEGER Size:4 邮件时间戳
-- 				["content"] Type:STRING Size:4 邮件内容
-- 				["hasConfirmedAm"] Type:BYTE Size:1 是否已经确认过附件
-- 				["attachment_Num"] Type:SHORT Size:2 附件数据 array length
-- 				["attachment"] = 
--				{ ------Type:ARRAY Size:4 附件数据
-- 						["amType"] Type:BYTE Size:1 奖励物品类型
-- 						["amID"] Type:INTEGER Size:4 奖励物品ID
-- 						["amNum"] Type:INTEGER Size:4 奖励物品数量
-- 				}
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_SYS_MAILS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_SYS_MAILS, call back function)

end

-- message:返回发送用户邮件结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 发送邮件结果
-- }
-- read server message
function g_network_server_sendto_client.SC_SEND_MAIL(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SEND_MAIL, call back function)

end

-- message:返回删除邮件结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 删除邮件结果
-- }
-- read server message
function g_network_server_sendto_client.SC_DELETE_MAIL(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_DELETE_MAIL, call back function)

end

-- message:返回确认系统邮件附件结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 确认邮件附件结果
-- 		["updateInfo_Num"] Type:SHORT Size:2 应用附加刷新数据 array length
-- 		["updateInfo"] = 
--		{ ------Type:ARRAY Size:4 应用附加刷新数据
-- 				["type"] Type:BYTE Size:1 更新信息的物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备的主键ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具、装备的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_CONFIRM_MAIL_ATTACHMENT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CONFIRM_MAIL_ATTACHMENT, call back function)

end

-- message:返回发送邮件列表结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 发送系统邮件结果
-- }
-- read server message
function g_network_server_sendto_client.SC_SEND_SYS_MAILS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SEND_SYS_MAILS, call back function)

end

-- message:返回PVP邮件列表
--	Table:
-- dataT =
-- {
-- 		["mail_num"] Type:INTEGER Size:4 邮件总数
-- 		["server_timestamp"] Type:INTEGER Size:4 当前服务器时间戳
-- 		["mail_list_Num"] Type:SHORT Size:2 邮件列表 array length
-- 		["mail_list"] = 
--		{ ------Type:ARRAY Size:4 邮件列表
-- 				["mailID"] Type:INTEGER Size:4 邮件ID
-- 				["timestamp"] Type:INTEGER Size:4 邮件时间戳
-- 				["roleName"] Type:STRING Size:4 挑战角色名
-- 				["level"] Type:BYTE Size:1 等级
-- 				["type"] Type:BYTE Size:1 类型 0-pvp, 1-掠夺
-- 				["status"] Type:BYTE Size:1 状态 0-胜利,1-失败,2-胜利且抢到碎片,3-胜利但未抢到碎片
-- 				["chipId"] Type:INTEGER Size:4 碎片ID 成功抢到碎片时该值为非0 否则为0
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_PVP_MAIL(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_PVP_MAIL, call back function)

end

-- message:删除PVP邮件
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 0-成功,1-失败
-- }
-- read server message
function g_network_server_sendto_client.SC_REMOVE_PVP_MAIL(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_REMOVE_PVP_MAIL, call back function)

end

-- message:合卡结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["consume"] Type:INTEGER Size:4 消耗银两
-- 		["remain"] Type:INTEGER Size:4 剩下银两
-- 		["exp"] Type:INTEGER Size:4 名臣经验
-- 		["officerLevel"] Type:INTEGER Size:4 等级
-- }
-- read server message
function g_network_server_sendto_client.SC_MERGE_CARD_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_MERGE_CARD_RESPONSE, call back function)

end

-- message:走马灯消息列
--	Table:
-- dataT =
-- {
-- 		["messageiList_Num"] Type:SHORT Size:2 走马灯 array length
-- 		["messageiList"] = 
--		{ ------Type:ARRAY Size:4 走马灯
-- 				["content"] Type:STRING Size:4 内容
-- 				["count"] Type:BYTE Size:1 滚动次数
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_MOVING_MSG(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_MOVING_MSG, call back function)

end

-- message:返回当前限时活动充值信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0=没有活动，-1-错误，1-有活动信息
-- 		["peroidId"] Type:INTEGER Size:4 活动id
-- 		["day"] Type:INTEGER Size:4 活动天数
-- 		["start"] Type:INTEGER Size:4 活动起始时间
-- 		["money"] Type:INTEGER Size:4 当前活动已充值金额
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_CURRENT_PEROID_CHARGE_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_CURRENT_PEROID_CHARGE_INFO, call back function)

end

-- message:返回限时充值奖励信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1：失败
-- 		["peroidRewardList_Num"] Type:SHORT Size:2 活动奖励信息，最大长度100 array length
-- 		["peroidRewardList"] = 
--		{ ------Type:ARRAY Size:4 活动奖励信息，最大长度100
-- 				["peroidId"] Type:INTEGER Size:4 活动ID
-- 				["day"] Type:INTEGER Size:4 活动天数
-- 				["money"] Type:INTEGER Size:4 活动累计充值金额
-- 				["rewardMask"] Type:INTEGER Size:4 活动可领取奖励掩码
-- 				["acceptRewardMask"] Type:INTEGER Size:4 活动已领取奖励掩码
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_PERIOD_CHARGE_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_PERIOD_CHARGE_INFO, call back function)

end

-- message:返回领取限时充值奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- 		["rewardList_Num"] Type:SHORT Size:2 奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 奖励列表
-- 				["type"] Type:BYTE Size:1 奖励类型
-- 				["primaryId"] Type:INTEGER Size:4 主键Id
-- 				["id"] Type:INTEGER Size:4 物品Id
-- 				["num"] Type:INTEGER Size:4 奖励数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_ACCEPT_PEROID_CHARGE_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ACCEPT_PEROID_CHARGE_REWARD, call back function)

end

-- message:列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功,0-失败
-- 		["list_Num"] Type:SHORT Size:2 列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 列表
-- 				["index"] Type:BYTE Size:1 下标
-- 				["name"] Type:STRING Size:4 姓名
-- 				["nianhao"] Type:STRING Size:4 年号
-- 				["level"] Type:BYTE Size:1 等级
-- 				["battle_Num"] Type:SHORT Size:2 阵容 array length
-- 				["battle"] = 
--				{ ------Type:ARRAY Size:4 阵容
-- 						["cardId"] Type:SHORT Size:2 名臣ID
-- 				}
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PREY_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PREY_LIST, call back function)

end

-- message:战斗结果
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名字
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 敌方ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["selfSkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["enemyPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["selfId"] Type:INTEGER Size:4 主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["enemyId"] Type:INTEGER Size:4 敌方主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["level"] Type:BYTE Size:1 用户等级
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["energy"] Type:INTEGER Size:4 用户精力
-- 		["strength"] Type:INTEGER Size:4 用户体力
-- 		["expAddition"] Type:INTEGER Size:4 掠夺增加的经验
-- 		["totalExp"] Type:INTEGER Size:4 用户总经验
-- 		["silverAddition"] Type:INTEGER Size:4 掠夺增加的银两
-- 		["totalSilver"] Type:INTEGER Size:4 用户总银两
-- 		["beautyReward_Num"] Type:SHORT Size:2 美女奖励 array length
-- 		["beautyReward"] = 
--		{ ------Type:ARRAY Size:4 美女奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 		}
-- 		["officerReward_Num"] Type:SHORT Size:2 名臣奖励 array length
-- 		["officerReward"] = 
--		{ ------Type:ARRAY Size:4 名臣奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 		}
-- 		["equipReward_Num"] Type:SHORT Size:2 装备奖励 array length
-- 		["equipReward"] = 
--		{ ------Type:ARRAY Size:4 装备奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["equipId"] Type:INTEGER Size:4 装备ID
-- 		}
-- 		["chipReward_Num"] Type:SHORT Size:2 碎片奖励 array length
-- 		["chipReward"] = 
--		{ ------Type:ARRAY Size:4 碎片奖励
-- 				["type"] Type:BYTE Size:1 碎片类型 1-名臣,2-美女,3-装备,4-兵法
-- 				["chipId"] Type:SHORT Size:2 碎片ID
-- 		}
-- 		["propReward_Num"] Type:SHORT Size:2 道具奖励 array length
-- 		["propReward"] = 
--		{ ------Type:ARRAY Size:4 道具奖励
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PREY_FIGHT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PREY_FIGHT, call back function)

end

-- message:战斗结果
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名字
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 敌方ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["enemySkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["selfPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["enemyId"] Type:INTEGER Size:4 主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["selfId"] Type:INTEGER Size:4 敌方主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["level"] Type:BYTE Size:1 用户等级
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["energy"] Type:INTEGER Size:4 用户精力
-- 		["strength"] Type:INTEGER Size:4 用户体力
-- 		["expAddition"] Type:INTEGER Size:4 掠夺增加的经验
-- 		["totalExp"] Type:INTEGER Size:4 用户总经验
-- 		["silverAddition"] Type:INTEGER Size:4 掠夺增加的银两
-- 		["totalSilver"] Type:INTEGER Size:4 用户总银两
-- 		["beautyReward_Num"] Type:SHORT Size:2 美女奖励 array length
-- 		["beautyReward"] = 
--		{ ------Type:ARRAY Size:4 美女奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 		}
-- 		["officerReward_Num"] Type:SHORT Size:2 名臣奖励 array length
-- 		["officerReward"] = 
--		{ ------Type:ARRAY Size:4 名臣奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 		}
-- 		["equipReward_Num"] Type:SHORT Size:2 装备奖励 array length
-- 		["equipReward"] = 
--		{ ------Type:ARRAY Size:4 装备奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["equipId"] Type:INTEGER Size:4 装备ID
-- 		}
-- 		["chipReward_Num"] Type:SHORT Size:2 碎片奖励 array length
-- 		["chipReward"] = 
--		{ ------Type:ARRAY Size:4 碎片奖励
-- 				["type"] Type:BYTE Size:1 碎片类型 1-名臣,2-美女,3-装备,4-兵法
-- 				["chipId"] Type:SHORT Size:2 碎片ID
-- 		}
-- 		["propReward_Num"] Type:SHORT Size:2 道具奖励 array length
-- 		["propReward"] = 
--		{ ------Type:ARRAY Size:4 道具奖励
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PREY_FIGHT_REPLAY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PREY_FIGHT_REPLAY, call back function)

end

-- message:返回皇子列表
--	Table:
-- dataT =
-- {
-- 		["battleList_Num"] Type:SHORT Size:2 上阵皇子列表 array length
-- 		["battleList"] = 
--		{ ------Type:ARRAY Size:4 上阵皇子列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["princeResource"] Type:BYTE Size:1 皇子资源
-- 				["princeStar"] Type:BYTE Size:1 皇子星级
-- 				["princeLevel"] Type:BYTE Size:1 皇子等级
-- 				["exp"] Type:INTEGER Size:4 皇子经验
-- 				["mother"] Type:INTEGER Size:4 皇子母亲
-- 				["alive"] Type:BYTE Size:1 皇子母亲是否活着
-- 				["princeTitle"] Type:BYTE Size:1 皇子称号
-- 				["position"] Type:BYTE Size:1 位置
-- 				["princeSkill"] Type:SHORT Size:2 皇子技能
-- 				["passiveSkillId"] Type:SHORT Size:2 皇子被动技能ID
-- 				["princeName"] Type:STRING Size:4 皇子名字
-- 				["beautyId"] Type:SHORT Size:2 皇子母亲的卡牌ID
-- 				["princeDes"] Type:BYTE Size:1 皇子描述
-- 		}
-- 		["unbattleList_Num"] Type:SHORT Size:2 未上阵皇子列表 array length
-- 		["unbattleList"] = 
--		{ ------Type:ARRAY Size:4 未上阵皇子列表
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["princeResource"] Type:BYTE Size:1 皇子资源
-- 				["princeStar"] Type:BYTE Size:1 皇子星级
-- 				["princeLevel"] Type:BYTE Size:1 皇子等级
-- 				["exp"] Type:INTEGER Size:4 皇子经验
-- 				["mother"] Type:INTEGER Size:4 皇子母亲
-- 				["alive"] Type:BYTE Size:1 皇子母亲是否活着
-- 				["princeTitle"] Type:BYTE Size:1 皇子称号
-- 				["position"] Type:BYTE Size:1 位置
-- 				["princeSkill"] Type:SHORT Size:2 皇子主动技能
-- 				["passiveSkillId"] Type:SHORT Size:2 皇子被动技能ID
-- 				["princeName"] Type:STRING Size:4 皇子名字
-- 				["beautyId"] Type:SHORT Size:2 皇子母亲的卡牌ID
-- 				["princeDes"] Type:BYTE Size:1 皇子描述
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PRINCE_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PRINCE_LIST, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- }
-- read server message
function g_network_server_sendto_client.SC_PRINCE_BATTLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PRINCE_BATTLE, call back function)

end

-- message:尚书房处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["level"] Type:BYTE Size:1 皇子等级
-- 		["levelGrow"] Type:BYTE Size:1 等级增加值
-- 		["expGrow"] Type:INTEGER Size:4 经验增加值
-- 		["silverConsume"] Type:INTEGER Size:4 消耗银两
-- 		["silverRemain"] Type:INTEGER Size:4 剩下的银两
-- 		["currExp"] Type:INTEGER Size:4 当前经验
-- }
-- read server message
function g_network_server_sendto_client.SC_PRINCE_SHANG_SHU_FANG(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PRINCE_SHANG_SHU_FANG, call back function)

end

-- message:宗人府处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["level"] Type:BYTE Size:1 皇子等级
-- 		["levelGrow"] Type:BYTE Size:1 等级增加值
-- 		["expGrow"] Type:INTEGER Size:4 经验增加值
-- 		["silverConsume"] Type:INTEGER Size:4 消耗的银两
-- 		["silverRemain"] Type:INTEGER Size:4 剩下的银两
-- 		["currExp"] Type:INTEGER Size:4 当前经验
-- }
-- read server message
function g_network_server_sendto_client.SC_PRINCE_ZONG_REN_FU(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PRINCE_ZONG_REN_FU, call back function)

end

-- message:改名处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果 0-失败未知错误 1-成功  2-名字长度为0 3-名字重复
-- }
-- read server message
function g_network_server_sendto_client.SC_PRINCE_CHANGE_NAME(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PRINCE_CHANGE_NAME, call back function)

end

-- message:返回用户道具列表
--	Table:
-- dataT =
-- {
-- 		["propList_Num"] Type:SHORT Size:2 道具列表 array length
-- 		["propList"] = 
--		{ ------Type:ARRAY Size:4 道具列表
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 				["propNum"] Type:INTEGER Size:4 道具数目
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PROP_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PROP_LIST, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["propUseResultList_Num"] Type:SHORT Size:2 道具使用结果列表 array length
-- 		["propUseResultList"] = 
--		{ ------Type:ARRAY Size:4 道具使用结果列表
-- 				["propType"] Type:SHORT Size:2 道具类型
-- 				["propValue"] Type:INTEGER Size:4 道具使用值
-- 				["primaryID"] Type:INTEGER Size:4 主键ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_PROP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_PROP, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["propList_Num"] Type:SHORT Size:2 更新用户装备列表 array length
-- 		["propList"] = 
--		{ ------Type:ARRAY Size:4 更新用户装备列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_BUY_PROP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BUY_PROP, call back function)

end

-- message:使用道具包结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果：0-成功，1-失败
-- 		["propList_Num"] Type:SHORT Size:2 更新用户装备列表 array length
-- 		["propList"] = 
--		{ ------Type:ARRAY Size:4 更新用户装备列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_PROP_PACKAGE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_PROP_PACKAGE, call back function)

end

-- message:战斗数据
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名称
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 怪物ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["selfSkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["enemyPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["selfId"] Type:INTEGER Size:4 主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["enemyId"] Type:INTEGER Size:4 敌方主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["currLevel"] Type:BYTE Size:1 用户等级
-- 		["emperorExp"] Type:INTEGER Size:4 用户经验
-- 		["obtainExp"] Type:INTEGER Size:4 打关卡获得的经验
-- 		["silver"] Type:INTEGER Size:4 用户银两
-- 		["energy"] Type:INTEGER Size:4 用户精力
-- 		["strength"] Type:INTEGER Size:4 用户体力
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["beautyReward_Num"] Type:SHORT Size:2 美女奖励 array length
-- 		["beautyReward"] = 
--		{ ------Type:ARRAY Size:4 美女奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 				["beautyLevel"] Type:SHORT Size:2 美女等级
-- 				["beautyTitle"] Type:BYTE Size:1 美女称号
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 				["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 				["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 				["beautyExp"] Type:INTEGER Size:4 美女经验
-- 				["conceive"] Type:BYTE Size:1 是否怀孕0-没怀孕,1-怀孕,2-未领取出生皇子
-- 				["princeList_Num"] Type:SHORT Size:2 皇子列表 array length
-- 				["princeList"] = 
--				{ ------Type:ARRAY Size:4 皇子列表
-- 						["princeId"] Type:INTEGER Size:4 皇子ID
-- 				}
-- 		}
-- 		["officerReward_Num"] Type:SHORT Size:2 名臣奖励 array length
-- 		["officerReward"] = 
--		{ ------Type:ARRAY Size:4 名臣奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["officerLevel"] Type:BYTE Size:1 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["equipReward_Num"] Type:SHORT Size:2 装备奖励 array length
-- 		["equipReward"] = 
--		{ ------Type:ARRAY Size:4 装备奖励
-- 				["id"] Type:INTEGER Size:4 主键
-- 				["equipId"] Type:INTEGER Size:4 装备ID
-- 		}
-- 		["chipReward_Num"] Type:SHORT Size:2 碎片奖励 array length
-- 		["chipReward"] = 
--		{ ------Type:ARRAY Size:4 碎片奖励
-- 				["chipId"] Type:SHORT Size:2 碎片ID
-- 				["type"] Type:BYTE Size:1 碎片类型 1-名臣,2-美女,3-装备,4-兵法
-- 		}
-- 		["propReward_Num"] Type:SHORT Size:2 道具奖励 array length
-- 		["propReward"] = 
--		{ ------Type:ARRAY Size:4 道具奖励
-- 				["propId"] Type:SHORT Size:2 道具ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PVE_FIGHT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PVE_FIGHT, call back function)

end

-- message:扫荡结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-失败, 1-成功
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["currLevel"] Type:BYTE Size:1 用户等级
-- 		["emperorExp"] Type:INTEGER Size:4 用户经验
-- 		["obtainExp"] Type:INTEGER Size:4 打关卡获得的经验
-- 		["silver"] Type:INTEGER Size:4 用户银两
-- 		["energy"] Type:INTEGER Size:4 用户精力
-- 		["strength"] Type:INTEGER Size:4 用户体力
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["rewardList_Num"] Type:SHORT Size:2 扫荡的奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 扫荡的奖励列表
-- 				["type "] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、装备主键ID
-- 				["id"] Type:INTEGER Size:4 道具、碎片的id
-- 				["value"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_LEVEL_SWEEP(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_LEVEL_SWEEP, call back function)

end

-- message:返回战役信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["areaId"] Type:BYTE Size:1 区域
-- 		["stageId"] Type:BYTE Size:1 阶段
-- 		["level"] Type:SHORT Size:2 关卡
-- 		["eliteAreaId"] Type:BYTE Size:1 精英副本区域
-- 		["eliteStageId"] Type:BYTE Size:1 精英副本阶段
-- 		["remainCount"] Type:BYTE Size:1 精英副本剩余挑战次数
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_LEVEL_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_LEVEL_INFO, call back function)

end

-- message:返回关卡的战斗信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["levelDate_Num"] Type:SHORT Size:2 关卡数据 array length
-- 		["levelDate"] = 
--		{ ------Type:ARRAY Size:4 关卡数据
-- 				["level"] Type:SHORT Size:2 关卡
-- 				["count"] Type:BYTE Size:1 闯关剩余次数
-- 				["star"] Type:BYTE Size:1 星级
-- 		}
-- 		["flag"] Type:BYTE Size:1 是否可领取 0-不可领,1-可领
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_LEVEL_FIGHT_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_LEVEL_FIGHT_INFO, call back function)

end

-- message:领取结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果 0-失败, 1-成功
-- 		["silver"] Type:INTEGER Size:4 银两
-- 		["gold"] Type:INTEGER Size:4 元宝
-- }
-- read server message
function g_network_server_sendto_client.SC_PASS_STAGE_GIFT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PASS_STAGE_GIFT, call back function)

end

-- message:pvp玩家排名列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["selfRank"] Type:INTEGER Size:4 玩家自己的排名
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["contribution"] Type:INTEGER Size:4 功绩值
-- 		["challengeNum"] Type:BYTE Size:1 今日挑战次数
-- 		["challengeList_Num"] Type:SHORT Size:2 可挑战的玩家列表 array length
-- 		["challengeList"] = 
--		{ ------Type:ARRAY Size:4 可挑战的玩家列表
-- 				["id"] Type:INTEGER Size:4 玩家主键ID
-- 				["rank"] Type:INTEGER Size:4 玩家排名
-- 				["level"] Type:INTEGER Size:4 用户等级
-- 				["name"] Type:STRING Size:4 玩家名字
-- 		}
-- 		["topTen_Num"] Type:SHORT Size:2 1-12名的玩家列表 array length
-- 		["topTen"] = 
--		{ ------Type:ARRAY Size:4 1-12名的玩家列表
-- 				["id"] Type:INTEGER Size:4 玩家主键ID
-- 				["rank"] Type:INTEGER Size:4 玩家排名
-- 				["level"] Type:INTEGER Size:4 用户等级
-- 				["name"] Type:STRING Size:4 玩家名字
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PVP_RANK(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PVP_RANK, call back function)

end

-- message:玩家功绩值
--	Table:
-- dataT =
-- {
-- 		["rank"] Type:INTEGER Size:4 排名
-- 		["contribution"] Type:INTEGER Size:4 功绩值
-- }
-- read server message
function g_network_server_sendto_client.SC_PLAY_CONTRIBUTION(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PLAY_CONTRIBUTION, call back function)

end

-- message:玩家阵容数据
--	Table:
-- dataT =
-- {
-- 		["battleList_Num"] Type:SHORT Size:2 已上阵列表 array length
-- 		["battleList"] = 
--		{ ------Type:ARRAY Size:4 已上阵列表
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["officerLevel"] Type:BYTE Size:1 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 				["advanced"] Type:BYTE Size:1 官职
-- 				["battle"] Type:INTEGER Size:4 阵容
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_PVP_VIEW_BATTLE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PVP_VIEW_BATTLE, call back function)

end

-- message:战斗结果
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名字
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 敌方ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["selfSkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["enemyPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["selfId"] Type:INTEGER Size:4 主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["enemyId"] Type:INTEGER Size:4 敌方主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["currRank"] Type:INTEGER Size:4 当前排名
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["level"] Type:BYTE Size:1 用户等级
-- 		["military"] Type:INTEGER Size:4 用户的军令
-- 		["energy"] Type:INTEGER Size:4 用户的精力
-- 		["strength"] Type:INTEGER Size:4 用户的体力
-- 		["expAddition"] Type:INTEGER Size:4 打PVP增加的经验
-- 		["totalExp"] Type:INTEGER Size:4 用户总经验
-- 		["silverAddition"] Type:INTEGER Size:4 打PVP增加的银两
-- 		["totalSilver"] Type:INTEGER Size:4 用户总银两
-- 		["contributionAddition"] Type:INTEGER Size:4 打PVP增加的功绩值
-- 		["totalContribution"] Type:INTEGER Size:4 用户总功绩值
-- }
-- read server message
function g_network_server_sendto_client.SC_PVP_FIGHT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PVP_FIGHT, call back function)

end

-- message:战斗结果
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名字
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 敌方ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["enemySkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["selfPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["enemyId"] Type:INTEGER Size:4 主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["selfId"] Type:INTEGER Size:4 敌方主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["currRank"] Type:INTEGER Size:4 当前排名
-- 		["levelUp"] Type:BYTE Size:1 是否升级
-- 		["level"] Type:BYTE Size:1 用户等级
-- 		["military"] Type:INTEGER Size:4 用户的军令
-- 		["energy"] Type:INTEGER Size:4 用户的精力
-- 		["strength"] Type:INTEGER Size:4 用户的体力
-- 		["expAddition"] Type:INTEGER Size:4 打PVP增加的经验
-- 		["totalExp"] Type:INTEGER Size:4 用户总经验
-- 		["silverAddition"] Type:INTEGER Size:4 打PVP增加的银两
-- 		["totalSilver"] Type:INTEGER Size:4 用户总银两
-- 		["contributionAddition"] Type:INTEGER Size:4 打PVP增加的功绩值
-- 		["totalContribution"] Type:INTEGER Size:4 用户总功绩值
-- }
-- read server message
function g_network_server_sendto_client.SC_PVP_REPLAY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PVP_REPLAY, call back function)

end

-- message:PVP错误消息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 错误消息 1-敌方排名发生变化 2-军令不足 3-用户数据错误 4-挑战次数已用尽
-- }
-- read server message
function g_network_server_sendto_client.SC_PVP_ERROR_MESSAGE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PVP_ERROR_MESSAGE, call back function)

end

-- message:霸业榜单
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-失败 1-成功
-- 		["listNum"] Type:INTEGER Size:4 榜单列表总数
-- 		["selfRank"] Type:INTEGER Size:4 自己排名
-- 		["startRank"] Type:INTEGER Size:4 起始排名
-- 		["rankList_Num"] Type:SHORT Size:2 榜单列表 array length
-- 		["rankList"] = 
--		{ ------Type:ARRAY Size:4 榜单列表
-- 				["reign"] Type:STRING Size:4 年号
-- 				["roleName"] Type:STRING Size:4 角色名
-- 				["vipLevel"] Type:BYTE Size:1 vip等级
-- 				["level"] Type:BYTE Size:1 等级
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_PVP_RANK_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_PVP_RANK_LIST, call back function)

end

-- message:关卡排行榜单
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-失败 1-成功
-- 		["listNum"] Type:INTEGER Size:4 榜单列表总数
-- 		["selfRank"] Type:INTEGER Size:4 自己排名
-- 		["startRank"] Type:INTEGER Size:4 起始排名
-- 		["selfLevelNum"] Type:INTEGER Size:4 自身关卡总数
-- 		["rankList_Num"] Type:SHORT Size:2 榜单列表 array length
-- 		["rankList"] = 
--		{ ------Type:ARRAY Size:4 榜单列表
-- 				["reign"] Type:STRING Size:4 年号
-- 				["roleName"] Type:STRING Size:4 角色名
-- 				["vipLevel"] Type:BYTE Size:1 vip等级
-- 				["current"] Type:INTEGER Size:4 当前关卡
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_PVE_LEVEL_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_PVE_LEVEL_LIST, call back function)

end

-- message:恢复用户数据
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["energyRemainTime"] Type:INTEGER Size:4 恢复精力剩余时间
-- 		["strengthRemainTime"] Type:INTEGER Size:4 恢复体力剩余时间
-- 		["militaryRemainTime"] Type:INTEGER Size:4 恢复军令剩余时间
-- 		["contributionRemainTime"] Type:INTEGER Size:4 恢复功绩值剩余时间
-- }
-- read server message
function g_network_server_sendto_client.SC_RECOVER_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_RECOVER_LIST, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果
-- 		["energy"] Type:INTEGER Size:4 精力
-- 		["strength"] Type:INTEGER Size:4 体力
-- 		["military"] Type:INTEGER Size:4 军令
-- 		["contribution"] Type:INTEGER Size:4 功绩值
-- }
-- read server message
function g_network_server_sendto_client.SC_RECOVER_STRENGTH_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_RECOVER_STRENGTH_RESPONSE, call back function)

end

-- message:批阅奏折结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，1-未到恢复时间，-1：失败
-- 		["silver"] Type:INTEGER Size:4 当前银两
-- 		["multiply"] Type:INTEGER Size:4 暴击倍数
-- 		["level"] Type:BYTE Size:1 当前等级
-- 		["strength"] Type:INTEGER Size:4 当前体力
-- 		["military"] Type:INTEGER Size:4 当前军令
-- 		["energy"] Type:INTEGER Size:4 当前精力
-- 		["exp"] Type:INTEGER Size:4 当前经验
-- 		["rewardList_Num"] Type:SHORT Size:2 奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 奖励列表
-- 				["type"] Type:BYTE Size:1 物品类型，见dict_arg的reward_type参数
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_READ_REPORTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_READ_REPORTS, call back function)

end

-- message:添加奏折结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，1-当前奏折数不为0，-1-失败
-- 		["report_nums"] Type:INTEGER Size:4 当前可用奏章次数
-- 		["gold"] Type:INTEGER Size:4 当前元宝数量
-- }
-- read server message
function g_network_server_sendto_client.SC_ADD_REPORTS(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ADD_REPORTS, call back function)

end

-- message:用户批阅奏折信息，登录时会主动推送一次
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- 		["reportsNum"] Type:INTEGER Size:4 当前可批阅奏折数
-- 		["addReportsNum"] Type:INTEGER Size:4 今日可添加奏折次数
-- 		["recoverStart"] Type:INTEGER Size:4 上一次奏章批阅时间，即本次奏章恢复起始倒计时时间戳，-1表示不需恢复，即奏章已达上限
-- }
-- read server message
function g_network_server_sendto_client.SC_USER_REPORTS_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USER_REPORTS_INFO, call back function)

end

-- message:处理结果
--	Table:
-- dataT =
-- {
-- 		["audioEnable"] Type:BYTE Size:1 宠幸美女声音开关 0-关闭 1-开启
-- }
-- read server message
function g_network_server_sendto_client.SC_SERVER_CONFIG_RESPONSE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SERVER_CONFIG_RESPONSE, call back function)

end

-- message:返回开服奖励信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，1-没有开服有礼活动，-1：失败
-- 		["startTime"] Type:INTEGER Size:4 开服时间
-- 		["acceptRewardMask"] Type:INTEGER Size:4 已领取奖励掩码
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_SERVER_START_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_SERVER_START_REWARD, call back function)

end

-- message:返回领取开服奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1：失败
-- 		["rewardList_Num"] Type:SHORT Size:2 奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 奖励列表
-- 				["type"] Type:BYTE Size:1 物品类型，见dict_arg的reward_type参数
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_ACCEPT_SERVER_START_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ACCEPT_SERVER_START_REWARD, call back function)

end

-- message:返回新玩家签到奖励
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0：成功，-1：失败
-- 		["day"] Type:INTEGER Size:4 签到天数，可领取奖励天数
-- 		["mask"] Type:INTEGER Size:4 已领取奖励掩码
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_CHECKIN_REWARD_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_CHECKIN_REWARD_INFO, call back function)

end

-- message:领取签到奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0：成功，-1：失败
-- 		["rewardList_Num"] Type:SHORT Size:2 奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 奖励列表
-- 				["type"] Type:BYTE Size:1 类型
-- 				["primaryId"] Type:INTEGER Size:4 主键ID
-- 				["id"] Type:INTEGER Size:4 id
-- 				["num"] Type:INTEGER Size:4 数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_ACCEPT_CHECKIN_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_ACCEPT_CHECKIN_REWARD, call back function)

end

-- message:选秀数据
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["beautyList_Num"] Type:SHORT Size:2 美女数据 array length
-- 		["beautyList"] = 
--		{ ------Type:ARRAY Size:4 美女数据
-- 				["type"] Type:BYTE Size:1 类型 1-乡选 2-会选 3-殿选
-- 				["count"] Type:BYTE Size:1 剩下次数
-- 				["time"] Type:INTEGER Size:4 CD时间
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_XUAN_XIU(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_XUAN_XIU, call back function)

end

-- message:科举数据
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["officerList_Num"] Type:SHORT Size:2 名臣卡牌数据 array length
-- 		["officerList"] = 
--		{ ------Type:ARRAY Size:4 名臣卡牌数据
-- 				["type"] Type:BYTE Size:1 类型 1-乡试 2-会试 3-殿试
-- 				["count"] Type:BYTE Size:1 剩下次数
-- 				["time"] Type:INTEGER Size:4 CD时间
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_KE_JU(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_KE_JU, call back function)

end

-- message:商城美女列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["beautyList_Num"] Type:SHORT Size:2 生成的美女列表 array length
-- 		["beautyList"] = 
--		{ ------Type:ARRAY Size:4 生成的美女列表
-- 				["index"] Type:BYTE Size:1 下标
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_BEAUTY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_BEAUTY, call back function)

end

-- message:商城名臣列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["officerList_Num"] Type:SHORT Size:2 生成的名臣卡列表 array length
-- 		["officerList"] = 
--		{ ------Type:ARRAY Size:4 生成的名臣卡列表
-- 				["index"] Type:BYTE Size:1 下标
-- 				["officerId"] Type:SHORT Size:2 名臣卡牌ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_OFFICER(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_OFFICER, call back function)

end

-- message:美女抽卡结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["id"] Type:INTEGER Size:4 主键
-- 		["beautyId"] Type:SHORT Size:2 美女ID
-- 		["beautyLevel"] Type:SHORT Size:2 美女等级
-- 		["beautyTitle"] Type:BYTE Size:1 美女称号
-- 		["position"] Type:BYTE Size:1 助阵位置
-- 		["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 		["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 		["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 		["beautyExp"] Type:INTEGER Size:4 美女经验
-- 		["conceive"] Type:BYTE Size:1 是否怀孕0-没怀孕,1-怀孕,2-未领取出生皇子
-- 		["princeList_Num"] Type:SHORT Size:2 皇子列表 array length
-- 		["princeList"] = 
--		{ ------Type:ARRAY Size:4 皇子列表
-- 				["princeId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_EXTRACT_BEAUTY(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_EXTRACT_BEAUTY, call back function)

end

-- message:名臣抽卡结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果
-- 		["id"] Type:INTEGER Size:4 主键ID
-- 		["officerId"] Type:SHORT Size:2 名臣ID
-- 		["officerLevel"] Type:BYTE Size:1 名臣等级
-- 		["officerExp"] Type:INTEGER Size:4 名臣经验
-- 		["attack"] Type:SHORT Size:2 攻击力
-- 		["defense"] Type:SHORT Size:2 防御力
-- 		["intellect"] Type:SHORT Size:2 智力
-- 		["soldierType"] Type:BYTE Size:1 兵种类型
-- }
-- read server message
function g_network_server_sendto_client.SC_SHOP_EXTRACT_OFFICER(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_SHOP_EXTRACT_OFFICER, call back function)

end

-- message:商城抽卡必得还剩下次数
--	Table:
-- dataT =
-- {
-- 		["beautyCount"] Type:BYTE Size:1 商城美女次数
-- 		["officerCount"] Type:BYTE Size:1 商城名臣次数
-- }
-- read server message
function g_network_server_sendto_client.SC_REMAIN_COUNT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_REMAIN_COUNT, call back function)

end

-- message:名臣列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["list_Num"] Type:SHORT Size:2 名臣列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 名臣列表
-- 				["card"] Type:SHORT Size:2 卡牌ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_OFFICER_TITLE_BLOCK(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_OFFICER_TITLE_BLOCK, call back function)

end

-- message:美女列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["list_Num"] Type:SHORT Size:2 美女列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 美女列表
-- 				["card"] Type:SHORT Size:2 卡牌ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_BEAUTY_TITLE_BLOCK(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BEAUTY_TITLE_BLOCK, call back function)

end

-- message:装备图签列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["list_Num"] Type:SHORT Size:2 装备列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 装备列表
-- 				["card"] Type:SHORT Size:2 装备ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_EQUIP_TITLE_BLOCK(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_EQUIP_TITLE_BLOCK, call back function)

end

-- message:兵法图签列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["list_Num"] Type:SHORT Size:2 兵法图签列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 兵法图签列表
-- 				["card"] Type:SHORT Size:2 兵法ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_BING_FA_TITLE_BLOCK(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BING_FA_TITLE_BLOCK, call back function)

end

-- message:返回交易相关信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-成功，-1-失败
-- 		["serverId"] Type:INTEGER Size:4 服务器id
-- 		["transactionId"] Type:STRING Size:4 交易订单Id
-- 		["thirdTransactionId"] Type:STRING Size:4 第三方交易Id
-- 		["thirdSignture"] Type:STRING Size:4 第三方交易签名
-- }
-- read server message
function g_network_server_sendto_client.SC_TRANSACTION_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_TRANSACTION_INFO, call back function)

end

-- message:返回交易结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 对于检验订单，-1：服务器数据库错误；-2：订单处于先前的验证过程中；0：有效订单；1：凭证订单失败，未验证订单；2：无效订单；3：重复验证
-- 		["errorCode"] Type:INTEGER Size:4 失败代码，无效订单特定交易平台的错误代码
-- 		["userGold"] Type:INTEGER Size:4 用户gold数量
-- 		["transactionID"] Type:STRING Size:4 订单ID
-- 		["money"] Type:INTEGER Size:4 实际充值金额
-- 		["productId"] Type:INTEGER Size:4 产品ID
-- }
-- read server message
function g_network_server_sendto_client.SC_TRANSACTION(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_TRANSACTION, call back function)

end

-- message:返回玩家是否有首冲奖励领取
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果：0-没有奖励，1-有奖励，-1：查询出错
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_CHARGE_REWARD_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_CHARGE_REWARD_INFO, call back function)

end

-- message:返回领取首冲奖励结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 处理结果：0-成功，1-失败
-- 		["propList_Num"] Type:SHORT Size:2 更新用户物品列表 array length
-- 		["propList"] = 
--		{ ------Type:ARRAY Size:4 更新用户物品列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、道具、装备ID
-- 				["id"] Type:INTEGER Size:4 卡牌、道具的id
-- 				["num"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_USE_CHARGE_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_USE_CHARGE_REWARD, call back function)

end

-- message:用户月卡数据
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-成功 -1-失败
-- 		["hasMonthCard"] Type:BYTE Size:1 是否有月卡 0-没有 1-有
-- 		["day"] Type:INTEGER Size:4 可领取第几天的奖励
-- 		["mask"] Type:INTEGER Size:4 可领取奖励的掩码
-- 		["cdTime"] Type:INTEGER Size:4 购买月卡冷却时间
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_MONTH_CARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_MONTH_CARD, call back function)

end

-- message:领取奖励
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 0-成功 -1-失败
-- 		["rewardList_Num"] Type:SHORT Size:2 奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 奖励列表
-- 				["type"] Type:BYTE Size:1 奖励类型
-- 				["id"] Type:INTEGER Size:4 物品id
-- 				["num"] Type:INTEGER Size:4 物品数量
-- 				["primaryId"] Type:INTEGER Size:4 主键ID
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_MONTH_CARD_REWARD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_MONTH_CARD_REWARD, call back function)

end

-- message:用户上限信息
--	Table:
-- dataT =
-- {
-- 		["expLimit"] Type:INTEGER Size:4 经验上限
-- 		["energyLimit"] Type:SHORT Size:2 精力上限
-- 		["strengthLimit"] Type:SHORT Size:2 体力上限
-- 		["military"] Type:SHORT Size:2 军令上限
-- }
-- read server message
function g_network_server_sendto_client.SC_PERSON_LIMIT_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_PERSON_LIMIT_INFO, call back function)

end

-- message:玩家阵容数据
--	Table:
-- dataT =
-- {
-- 		["battleList1_Num"] Type:SHORT Size:2  阵容1 array length
-- 		["battleList1"] = 
--		{ ------Type:ARRAY Size:4  阵容1
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["officerLevel"] Type:BYTE Size:1 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 				["advanced"] Type:BYTE Size:1 卡牌进阶
-- 				["battle"] Type:INTEGER Size:4 当前阵容id
-- 		}
-- 		["battleList2_Num"] Type:SHORT Size:2  阵容2 array length
-- 		["battleList2"] = 
--		{ ------Type:ARRAY Size:4  阵容2
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["officerLevel"] Type:BYTE Size:1 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 				["advanced"] Type:BYTE Size:1 卡牌进阶
-- 				["battle"] Type:INTEGER Size:4 第2阵容id
-- 		}
-- 		["unbattleList_Num"] Type:SHORT Size:2 未上阵名臣列表 array length
-- 		["unbattleList"] = 
--		{ ------Type:ARRAY Size:4 未上阵名臣列表
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["officerLevel"] Type:BYTE Size:1 名臣等级
-- 				["officerExp"] Type:INTEGER Size:4 名臣经验
-- 				["attack"] Type:INTEGER Size:4 攻击力
-- 				["defense"] Type:INTEGER Size:4 防御力
-- 				["intellect"] Type:INTEGER Size:4 智力
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 				["advanced"] Type:BYTE Size:1 卡牌进阶
-- 				["battle"] Type:INTEGER Size:4 未上阵阵容id：0
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_CARD_BATTLE_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CARD_BATTLE_LIST, call back function)

end

-- message:返回用户道具列表
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 充值结果
-- 		["vip_level"] Type:SHORT Size:2 充值后用户的vip等级
-- }
-- read server message
function g_network_server_sendto_client.SC_CHARGE_VIP_GOLD(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CHARGE_VIP_GOLD, call back function)

end

-- message:购买vip礼包结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 购买结果：0-成功，1-vip等级不够，2-已购买过此等级的vip礼包，3-元宝不足，-1-其它错误
-- 		["primaryId"] Type:INTEGER Size:4 礼包的道具主键ID
-- 		["propId"] Type:INTEGER Size:4 礼包道具ID
-- 		["gold"] Type:INTEGER Size:4 用户当前元宝数
-- }
-- read server message
function g_network_server_sendto_client.SC_BUY_VIP_PACKAGE(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BUY_VIP_PACKAGE, call back function)

end

-- message:返回用户VIP信息
--	Table:
-- dataT =
-- {
-- 		["gold"] Type:INTEGER Size:4 用户已充值VIP元宝数
-- 		["level"] Type:INTEGER Size:4 用户当前vip等级
-- 		["pkgMask"] Type:INTEGER Size:4 用于已购买vip等级礼包掩码
-- 		["texTimes"] Type:INTEGER Size:4 今天已经征税的次数
-- 		["use_strength_times"] Type:INTEGER Size:4 今天已使用粮草次数
-- 		["use_energy_times"] Type:INTEGER Size:4 今天已使用精力次数
-- 		["use_military_times"] Type:INTEGER Size:4 今天已使用军令次数
-- }
-- read server message
function g_network_server_sendto_client.SC_GET_VIP_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GET_VIP_INFO, call back function)

end

-- message:返回结果
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["roleName"] Type:STRING Size:4 角色名
-- 		["contribution"] Type:INTEGER Size:4 获得的功绩值
-- 		["cur_contribution"] Type:INTEGER Size:4 玩家当前的功绩值
-- }
-- read server message
function g_network_server_sendto_client.SC_LAST_KILL_BOSS_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_LAST_KILL_BOSS_INFO, call back function)

end

-- message:信息
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["count"] Type:INTEGER Size:4 当前参与人数
-- 		["addition"] Type:INTEGER Size:4 当前已 鼓舞加成
-- 		["hpLeft"] Type:INTEGER Size:4 BOSS 剩余血量
-- 		["hp"] Type:INTEGER Size:4 BOSS总血量
-- 		["hurt"] Type:INTEGER Size:4 当前玩家的伤害值
-- 		["rank"] Type:INTEGER Size:4 当前玩家排名  0 玩家上次没有参加击杀  非0 玩家参与击杀后的排名
-- 		["list_Num"] Type:SHORT Size:2 当前 前十名 榜单列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 当前 前十名 榜单列表
-- 				["roleName"] Type:STRING Size:4 角色名
-- 				["hurt"] Type:INTEGER Size:4 伤害值
-- 				["hurtPercent"] Type:INTEGER Size:4 伤害百分比
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_CURRENT_FIGHT_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_CURRENT_FIGHT_INFO, call back function)

end

-- message:鼓舞
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["addition"] Type:INTEGER Size:4 加成
-- 		["gold"] Type:INTEGER Size:4 用户剩余元宝
-- 		["courageTimes"] Type:BYTE Size:1 玩家 已鼓舞次数
-- }
-- read server message
function g_network_server_sendto_client.SC_GU_WU_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_GU_WU_INFO, call back function)

end

-- message:涅槃重生
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["gold"] Type:INTEGER Size:4 玩家剩余元宝
-- 		["count"] Type:BYTE Size:1 已购买 重生次数 
-- }
-- read server message
function g_network_server_sendto_client.SC_REBORN_FIGHT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_REBORN_FIGHT, call back function)

end

-- message:榜单
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["hurt"] Type:INTEGER Size:4 玩家的伤害值
-- 		["percent"] Type:INTEGER Size:4 玩家的伤害值占boss总血量百分比
-- 		["rank"] Type:INTEGER Size:4 玩家排行 0 玩家上次没有参加击杀  非0 玩家参与击杀后的排名
-- 		["isBossKill"] Type:BYTE Size:1 boss是否被击杀 0 没有被击杀  1被击杀
-- 		["killBossName"] Type:STRING Size:4 击杀boss的玩家名字
-- 		["gainContribution"] Type:INTEGER Size:4 击杀boss 获得的额外功绩值
-- 		["list_Num"] Type:SHORT Size:2 榜单列表 array length
-- 		["list"] = 
--		{ ------Type:ARRAY Size:4 榜单列表
-- 				["roleName"] Type:STRING Size:4 角色名
-- 				["hurt"] Type:INTEGER Size:4 伤害值
-- 				["hurtPercent"] Type:INTEGER Size:4 伤害百分比
-- 				["contribution"] Type:INTEGER Size:4 获得的功绩值
-- 		}
-- 		["rewardList_Num"] Type:SHORT Size:2 更新用户奖励列表 array length
-- 		["rewardList"] = 
--		{ ------Type:ARRAY Size:4 更新用户奖励列表
-- 				["type"] Type:BYTE Size:1 物品类型
-- 				["primaryId"] Type:INTEGER Size:4 新插入卡牌、装备主键ID
-- 				["id"] Type:INTEGER Size:4 道具、碎片的id
-- 				["value"] Type:INTEGER Size:4 更新的物品数量
-- 		}
-- }
-- read server message
function g_network_server_sendto_client.SC_RANK_LIST(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_RANK_LIST, call back function)

end

-- message:挑战结果
--	Table:
-- dataT =
-- {
-- 		["battleFlag"] Type:BYTE Size:1 阵容标识 1-防御 2-攻击
-- 		["enemyName"] Type:STRING Size:4 敌方名称
-- 		["selfPrinceList_Num"] Type:SHORT Size:2 己方皇子列表 array length
-- 		["selfPrinceList"] = 
--		{ ------Type:ARRAY Size:4 己方皇子列表
-- 				["selfPrinceId"] Type:INTEGER Size:4 皇子ID
-- 		}
-- 		["enemyPrinceList_Num"] Type:SHORT Size:2 敌方皇子列表 array length
-- 		["enemyPrinceList"] = 
--		{ ------Type:ARRAY Size:4 敌方皇子列表
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 		}
-- 		["battleArray_Num"] Type:SHORT Size:2 己方的阵容 array length
-- 		["battleArray"] = 
--		{ ------Type:ARRAY Size:4 己方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["officerId"] Type:SHORT Size:2 名臣ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["enemyBattleArray_Num"] Type:SHORT Size:2 敌方的阵容 array length
-- 		["enemyBattleArray"] = 
--		{ ------Type:ARRAY Size:4 敌方的阵容
-- 				["id"] Type:INTEGER Size:4 主键ID
-- 				["monsterId"] Type:SHORT Size:2 怪物ID
-- 				["soldierType"] Type:BYTE Size:1 兵种类型
-- 		}
-- 		["roundData_Num"] Type:SHORT Size:2 战斗回合数据 最大长度为3 array length
-- 		["roundData"] = 
--		{ ------Type:ARRAY Size:4 战斗回合数据 最大长度为3
-- 				["selfFightArray_Num"] Type:SHORT Size:2 selfFightArrayFill array length
-- 				["selfFightArray"] = 
--				{ ------Type:ARRAY Size:4 selfFightArrayFill
-- 						["selfFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["enemyFightArray_Num"] Type:SHORT Size:2 enemyFightArrayFill array length
-- 				["enemyFightArray"] = 
--				{ ------Type:ARRAY Size:4 enemyFightArrayFill
-- 						["enemyFightIndex"] Type:BYTE Size:1 位置
-- 				}
-- 				["selfPrinceId"] Type:INTEGER Size:4 己方皇子ID
-- 				["selfPrinceName"] Type:STRING Size:4 己方皇子名字
-- 				["selfPrinceStar"] Type:BYTE Size:1 己方皇子星级
-- 				["selfPrinceResource"] Type:BYTE Size:1 己方皇子资源图片
-- 				["selfPrinceSkillId"] Type:SHORT Size:2 皇子技能ID
-- 				["selfSkillReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["selfEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["selfEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["selfOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["selfPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["enemyPrinceId"] Type:INTEGER Size:4 敌方皇子ID
-- 				["enemyPrinceName"] Type:STRING Size:4 敌方皇子名字
-- 				["enemyPrinceStar"] Type:BYTE Size:1 敌方皇子星级
-- 				["enemyPrinceResource"] Type:BYTE Size:1 敌方皇子资源图片
-- 				["enemyPrinceSkillId"] Type:SHORT Size:2 敌方皇子技能ID
-- 				["enemyPrinceReleaseTarget"] Type:BYTE Size:1 技能释放目标 1-加自己 2-打敌方
-- 				["enemyEffectOfficerList_Num"] Type:SHORT Size:2 受技能影响的名臣列表 array length
-- 				["enemyEffectOfficerList"] = 
--				{ ------Type:ARRAY Size:4 受技能影响的名臣列表
-- 						["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 						["enemyPrinceSkillValue"] Type:INTEGER Size:4 技能值
-- 				}
-- 				["fightData_Num"] Type:SHORT Size:2 战斗双方数据 array length
-- 				["fightData"] = 
--				{ ------Type:ARRAY Size:4 战斗双方数据
-- 						["selfId"] Type:INTEGER Size:4 主键ID
-- 						["selfOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["selfSkillId"] Type:SHORT Size:2 技能编号
-- 						["selfSkillAddition_Num"] Type:SHORT Size:2 技能对自己的加成 array length
-- 						["selfSkillAddition"] = 
--						{ ------Type:ARRAY Size:4 技能对自己的加成
-- 								["selfOfficerIndex"] Type:BYTE Size:1 己方名臣下标
-- 								["selfAdditionValue"] Type:INTEGER Size:4 己方加成
-- 						}
-- 						["selfSkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["selfSkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能伤害值
-- 						}
-- 						["selfRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["selfRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["selfCurrValue"] Type:INTEGER Size:4 当前值
-- 						["selfRemained"] Type:INTEGER Size:4 剩下的值
-- 						["enemyId"] Type:INTEGER Size:4 敌方主键ID
-- 						["enemyOfficerId"] Type:SHORT Size:2 名臣ID
-- 						["enemySkillId"] Type:SHORT Size:2 技能编号
-- 						["enemySkillAddition_Num"] Type:SHORT Size:2 敌方技能的加成 array length
-- 						["enemySkillAddition"] = 
--						{ ------Type:ARRAY Size:4 敌方技能的加成
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 敌方名臣下标
-- 								["enemyAdditionValue"] Type:INTEGER Size:4 敌方技能加成值
-- 						}
-- 						["enemySkillHurt_Num"] Type:SHORT Size:2 技能的伤害 array length
-- 						["enemySkillHurt"] = 
--						{ ------Type:ARRAY Size:4 技能的伤害
-- 								["enemyOfficerIndex"] Type:BYTE Size:1 受技能影响的名臣下标
-- 								["enemyHurtValue"] Type:INTEGER Size:4 技能造成的伤害值
-- 						}
-- 						["enemyRestraint"] Type:BYTE Size:1 克制标志，0-没克制,1-克制敌方, 2-被敌方克制
-- 						["enemyRestraintValue"] Type:INTEGER Size:4 克制的值
-- 						["enemyCurrValue"] Type:INTEGER Size:4 当前值
-- 						["enemyRemained"] Type:INTEGER Size:4 剩下的值
-- 						["reduceValue"] Type:INTEGER Size:4 双方减少的值
-- 				}
-- 		}
-- 		["selfFinal_Num"] Type:SHORT Size:2 战斗最后玩家剩下的兵力 array length
-- 		["selfFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后玩家剩下的兵力
-- 				["selfFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["selfFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["enemyFinal_Num"] Type:SHORT Size:2 战斗最后敌方剩下的兵力 array length
-- 		["enemyFinal"] = 
--		{ ------Type:ARRAY Size:4 战斗最后敌方剩下的兵力
-- 				["enemyFinalOfficerId"] Type:SHORT Size:2 名臣ID
-- 				["enemyFinalattrData"] Type:INTEGER Size:4 属性数据
-- 		}
-- 		["fightResult"] Type:BYTE Size:1 战斗结果 0-失败 1-胜利
-- 		["bossHurt"] Type:INTEGER Size:4 对boss 造成的伤害值
-- }
-- read server message
function g_network_server_sendto_client.SC_WORLD_BOSS_FIGHT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_WORLD_BOSS_FIGHT, call back function)

end

-- message:活动期间用户数据
--	Table:
-- dataT =
-- {
-- 		["result"] Type:BYTE Size:1 结果 1-成功 0-失败
-- 		["courageTimes"] Type:BYTE Size:1 玩家 已鼓舞次数
-- 		["rebornLeftTime"] Type:BYTE Size:1 下次重生剩余时间
-- 		["rebornTimes"] Type:BYTE Size:1 已购买 重生次数 
-- }
-- read server message
function g_network_server_sendto_client.SC_WORLD_BOOS_USER_INFO(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_WORLD_BOOS_USER_INFO, call back function)

end

function g_network_server_sendto_client.SC_BIND_ACCOUNT(reciveMsg)
--	g_network.registerMessage(g_neetwork_message_type.SC_BIND_ACCOUNT, call back function)

end