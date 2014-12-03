--定义touch event
g_game.g_f_touch_event = {}
g_game.g_f_touch_event.F_TOUCH_DOWN                 = 1
g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE          = 2
g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE         = 4
g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER           = 8
g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT            = 16
g_game.g_f_touch_event.F_TOUCH_UPINSIDE             = 32
g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE            = 64
g_game.g_f_touch_event.F_TOUCH_CANCEL               = 128
g_game.g_f_touch_event.F_TOUCH_CHANGED              = 256

--限时活动
g_game.g_huodong_chongzhi				= 1
g_game.g_huodong_choujiang				= 2
g_game.g_huodong_box					= 3

-----------------------------------------------------------
--字体文件预定义
g_game.g_f_image_font_type	= {}
g_game.g_f_image_font_type.F_BLUE_TYPE				= 1
g_game.g_f_image_font_type.F_RED_TYPE				= 2
g_game.g_f_image_font_type.F_YELLOW_TYPE			= 3

------------------------------------------------------------
--战斗类型预定义
g_game.g_f_battle_type = {}
g_game.g_f_battle_type.BATTLE_TYPE_PVE				= 1 -- pve普通副本
g_game.g_f_battle_type.BATTLE_TYPE_PVP				= 2 -- pvp
g_game.g_f_battle_type.BATTLE_TYPE_PVE_ELITE		= 3 -- pve精英副本
g_game.g_f_battle_type.BATTLE_TYPE_PVP_WREST		= 4 -- pvp抢夺
g_game.g_f_battle_type.BATTLE_TYPE_REPLAY			= 5 -- 回放
g_game.g_f_battle_type.BATTLE_TYPE_WORLD_BOSS		= 6 -- 世界boss

------------------------------------------------------------

--获取指定阵容类型数据
g_game.g_f_battle_list_type = {}
g_game.g_f_battle_list_type.TYPE_BATTLE_ARR1  = 1 --阵容1
g_game.g_f_battle_list_type.TYPE_BATTLE_ARR2  = 2 --阵容2
g_game.g_f_battle_list_type.TYPE_UNBATTLE_ARR = 3 --未上阵
g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR  = 4 --当前阵容
g_game.g_f_battle_list_type.TYPE_ALL_BATTLE_ARR  = 5 --当前所有名臣卡

--快速购买或使用预定义
g_game.g_f_quick_type = {}
g_game.g_f_quick_type.QUICK_TYPE_STRENGTH			= 1 -- 粮草快速购买或快速使用
g_game.g_f_quick_type.QUICK_TYPE_MILITARY			= 2 -- 军令快速购买或快速使用
g_game.g_f_quick_type.QUICK_TYPE_ENERGY				= 3 -- 精力快速购买或快速使用
g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT			= 4 -- pvp挑战次数快速购买或快速使用

--快速购买或使用预定义
g_game.g_f_bagLimit_str1 = {}
g_game.g_f_bagLimit_str1[1] = "名臣"
g_game.g_f_bagLimit_str1[2] = "美女"
g_game.g_f_bagLimit_str1[3] = "装备"
g_game.g_f_bagLimit_str1[4] = "皇子"
g_game.g_f_bagLimit_str1[5] = "卡牌数量已达上限，请及时清理！"

g_game.g_f_bagLimit_str2 = {}
g_game.g_f_bagLimit_str2[1] = "名臣"
g_game.g_f_bagLimit_str2[2] = "美女"
g_game.g_f_bagLimit_str2[3] = "裝備"
g_game.g_f_bagLimit_str2[4] = "皇子"
g_game.g_f_bagLimit_str2[5] = "卡牌數量已達上限，請及時清理！"

g_game.g_yellow_btn_text_color = cc.c3b(125,1,1)
g_game.g_red_btn_text_color = cc.c3b(254,255,232)

g_game.g_advance_level_name1 = {"未入流", "从九品", "正九品", "从八品", "正八品", "从七品", "正七品", "从六品", "正六品", "从五品", "正五品", "从四品", "正四品", "从三品", "正三品",
"从二品", "正二品", "从一品", "正一品"}

g_game.g_advance_level_name2 = {"未入流", "從九品", "正九品", "從八品", "正八品", "從七品", "正七品", "從六品", "正六品", "從五品", "正五品", "從四品", "正四品", "從三品", "正三品",
"從二品", "正二品", "從一品", "正一品"}

g_game.g_advance_level_font = {
	{"wei_uizi", "ru_uizi", "liu_uizi (2)"}, {"cong_uizi", "jiu_uizi (2)", "pin_uizi"},  {"zheng_uizi", "jiu_uizi (2)", "pin_uizi"}, 
	{"cong_uizi", "ba_uizi (2)", "pin_uizi"},  {"zheng_uizi", "ba_uizi (2)", "pin_uizi"}, 
	{"cong_uizi", "qi_uizi (3)", "pin_uizi"},  {"zheng_uizi", "qi_uizi (3)", "pin_uizi"}, 
	{"cong_uizi", "liu_uizi", "pin_uizi"},  {"zheng_uizi", "liu_uizi", "pin_uizi"}, 
	{"cong_uizi", "wu_uizi", "pin_uizi"},  {"zheng_uizi", "wu_uizi", "pin_uizi"}, 
	{"cong_uizi", "si_uizi", "pin_uizi"},  {"zheng_uizi", "si_uizi", "pin_uizi"}, 
	{"cong_uizi", "san_uizi (2)", "pin_uizi"},  {"zheng_uizi", "san_uizi (2)", "pin_uizi"}, 
	{"cong_uizi", "er_uizi", "pin_uizi"},  {"zheng_uizi", "er_uizi", "pin_uizi"}, 
	{"cong_uizi", "yi_uizi", "pin_uizi"},  {"zheng_uizi", "yi_uizi", "pin_uizi"}    
}

g_game.g_advance_skill_level = {9,11, 13, 15, 17, 19}

g_game.max_equip_level = 210


-----------------------------------------------------------
--定义lua游戏逻辑内需要使用的event code
g_game.g_f_lua_game_event = {}

--皇子界面的事件
g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME		= 1
g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_LIST		= 2

g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_EDUCATION = 4


--美女界面的事件
g_game.g_f_lua_game_event.F_LUA_UPDATE_BEAUTY_FAVOR 	= 5
g_game.g_f_lua_game_event.F_LUA_UPDATE_PREGNANT_TIME 	= 6
g_game.g_f_lua_game_event.F_LUA_UPDATE_BORN_PRINCE		= 7
g_game.g_f_lua_game_event.F_LUA_UPDATE_CHANGE_BEAUTY 	= 8
g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE 	= 9
g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY    = 10

--商城
g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_INFO 		= 15
g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_INFO 	= 16
g_game.g_f_lua_game_event.F_LUA_UPDATE_KEJU_MINGCHEN_LIST  			= 17
g_game.g_f_lua_game_event.F_LUA_UPDATE_XUANXIU_XIUNV_LIST  			= 18
g_game.g_f_lua_game_event.F_LUA_RECEIVE_KEJU_SELECT_BACK_CALL  		= 19
g_game.g_f_lua_game_event.F_LUA_RECEIVE_XUANXIU_SELECT_BACK_CALL 	= 20
g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD 		= 21

--pve level
g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO = 22
g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_NUM = 23

--euipbag 背包
g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_EQUIP_BAG = 25
g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_ITEM = 26
g_game.g_f_lua_game_event.F_LUA_UPDATE_USE_ITEM = 27
g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO = 28

--从战斗返回主场景调用
g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVE_LEVEL = 29
g_game.g_f_lua_game_event.F_LUA_UPDATE_BACK_TOPVP_UI = 30
g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD = 31

--更新缘分数据 回调
g_game.g_f_lua_game_event.F_LUA_UPDATE_COMBINATION = 32

--更新主界面银两等显示
g_game.g_f_lua_game_event.F_LUA_REFRESH_MAINUI = 35

--尚书房数据更新回调（用于主界面银两更新 养心殿等级更新  皇子督军等级和经验更新）
g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU = 40

--vip事件
g_game.g_f_lua_game_event.F_LUA_VIP_CHONGZHI_YUANBAO_CHENGGONG = 50

--快速使用（快速购买面板中）
g_game.g_f_lua_game_event.F_LUA_QUICK_USE_ITEM_CALLBACK = 51

--名臣升级
g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI = 60
g_game.g_f_lua_game_event.F_LUA_UPDATE_MINGCHEN_SHENGJI_ALTER_SUCCESS = 61

--宗人府皇子升级
g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU  = 70
g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS = 71

--修改年号成功事件
g_game.g_f_lua_game_event.F_LUA_UPDATE_HUANGDI_NIANHAO = 76

--获取回复时间结束 
g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END = 77
g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA = 78
g_game.g_f_lua_game_event.F_LUA_OPEN_HOUGONG = 79

--奏章数目恢复时间 
g_game.g_f_lua_game_event.F_LUA_ZOUZHANG_RECOVER_TIME = 300

--pvp
g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_LIST_DATA 	  = 80
g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CONTRIBUTE	  = 81
g_game.g_f_lua_game_event.F_LUA_UPDATE_PLAYER_ZHENRONG    = 82
g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_ERROR_MSG	  = 83
g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI_DUIHUAN  = 84  --功绩值兑换成功更新事件
g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI          = 85  --功绩值变化后更新事件

--各种sdk充值事件定义
g_game.g_f_lua_game_event.F_IAP_PRODUCLIST_LOAD			  = 150 --从游戏服务器获取内购列表后
g_game.g_f_lua_game_event.F_IAP_INIT_SHOP_ITEM			  = 151 --从sdk验证了产品列表后，使用产品列表刷新商店界面
g_game.g_f_lua_game_event.F_IAP_BUY_ITEM				  = 153 --正常流程购买产品
g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_NO_NORMAL		  = 154 --第一次购买验证失败，非正常流程购买产品
g_game.g_f_lua_game_event.F_IAP_BUY_ITEM_RESULT			  = 155 --购买物品结果
g_game.g_f_lua_game_event.F_IAP_CHECK_NATIVE_PAY		  = 156 --检查本地失败订单
g_game.g_f_lua_game_event.F_SDK_BIND_ACCOUNT		  	  = 157 --綁定賬戶

--公告
g_game.g_f_lua_game_event.F_LUA_RECEIVE_GONG_GAO		  = 200  --收到公告列表

--邮件
g_game.g_f_lua_game_event.F_LUA_RECEIVE_MAIL			  = 230  --收到邮件

--删除卡牌事件
g_game.g_f_lua_game_event.F_LUA_REMOVE_BEAUTY			  = 250	 --删除美女
g_game.g_f_lua_game_event.F_LUA_REMOVE_PRINCE			  = 251	 --删除皇子
g_game.g_f_lua_game_event.F_LUA_REMOVE_MINGCHEN			  = 252	 --删除名臣


--奖励
g_game.g_f_lua_game_event.F_LUA_OPEN_REWARD				  = 260  --收到奖励信息
g_game.g_f_lua_game_event.F_LUA_CLAIM_DAILY_REWARD		  = 261  --收取登陆奖励
g_game.g_f_lua_game_event.F_LUA_CLAIM_LEVEL_REWARD		  = 262  --收取等级奖励

--装备
g_game.g_f_lua_game_event.F_LUA_REFRESH_EQUIP			  = 280  --刷新装备详细界面
g_game.g_f_lua_game_event.F_LUA_SELECT_EQUIP			  = 281  --选择装备	
g_game.g_f_lua_game_event.F_LUA_SELL_EQUIP				  = 282	 --卖出装备	

g_game.g_f_lua_game_event.F_LUA_UPDATE_EQUIPPOSITION	  			= 283  --获取上阵位置的装备

g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ADD		  			= 284 --更新皇子加成
g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE			  			= 285  --刷新碎片显示
g_game.g_f_lua_game_event.F_LUA_UPDATE_ADVANCE			 	 		= 286  --刷新名臣进阶显示
g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA			  			= 287  --刷新兵法显示
g_game.g_f_lua_game_event.F_LUA_UPDATE_RANK			  				= 288  --刷新抽奖显示
g_game.g_f_lua_game_event.F_LUA_REFESH_RANK_SHOP			  		= 289  --刷新抽奖商店到时
g_game.g_f_lua_game_event.F_LUA_REFESH_CHOUJIANG_FREE			  	= 290  --刷新抽奖免费次数

--精英副本
g_game.g_f_lua_game_event.F_LUA_UPDATE_STAGE_REWARD					= 385 --更新过关奖励
g_game.g_f_lua_game_event.F_LUA_UPDATE_POP_BUY_PVE_NUM				= 386--弹出购买pve关卡挑战次数面板
g_game.g_f_lua_game_event.F_LUA_UPDATE_BUY_PVE_NUM_RESULT			= 387 --pve购买次数结果

--vip礼包领取
g_game.g_f_lua_game_event.F_LUA_GET_VIP_PACK						= 388 --vip礼包领取
g_game.g_f_lua_game_event.F_LUA_USE_VIP_PACK						= 389 --vip礼包使用
--定点活动 提示标记
g_game.g_f_lua_game_event.F_LUA_REWARD_FLAG							= 390 --定点活动提示标记
g_game.g_f_lua_game_event.F_LUA_REWARD_GET_RESULT_FLAG 				= 391 --定点活动领取结果标记
--征税
g_game.g_f_lua_game_event.F_LUA_ASK_TAX 							= 392 --征税结果
--首冲奖励是否领取
g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG 			= 393 --返回首次充值标志位 
g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE 				= 394 --首冲奖励结果
--切换阵容
g_game.g_f_lua_game_event.F_LUA_CHANGE_BATTLE_ARR 					= 395 --切换阵容结果

--充值后刷新限时充值有礼界面
g_game.g_f_lua_game_event.F_LUA_REFRESH_CHARGE_REWARD_PANEL 		= 396

g_game.g_f_lua_game_event.F_LUA_UP_CARD_TO_ARR2 					= 397

--刷新跨天刷新的信息
g_game.g_f_lua_game_event.F_LUA_REFERSH_RECOVER_DATA				 = 398

--更新共计防御力
g_game.g_f_lua_game_event.F_LUA_UPDATE_TEAM_ATKDEF					= 399 
--更新收到的兑换码结果
g_game.g_f_lua_game_event.F_LUA_UPDATE_EXCHANGE_REWARD					= 400
--掠夺按钮倒计时
g_game.g_f_lua_game_event.F_LUA_LUEDUO_COUNT_DOWN					= 401
--更新主界面  是否有选秀 和 科举免费次数可以点
g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE					= 402
g_game.g_f_lua_game_event.F_LUA_HUODONG_FLAG							= 403 --定点活动提示标记
g_game.g_f_lua_game_event.F_LUA_WUGU_TIMEUP							= 404 -- 五谷丰登到时
g_game.g_f_lua_game_event.F_LUA_LEFT_TIME							= 405 -- 选秀 科举 距离抽四星 还差多少次
g_game.g_f_lua_game_event.F_LUA_CHOUJIANG_AGAIN						= 406 -- 重复抽奖
g_game.g_f_lua_game_event.F_LUA_STOP_UPDATE_EQUIP					= 407 -- 停止自动升级装备
g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE						= 408 -- 扫荡结果
g_game.g_f_lua_game_event.F_LUA_SWEEP_BATTLE_NUM					= 409 -- 扫荡剩余数目
g_game.g_f_lua_game_event.F_LUA_SERVER_START_REWARD_BUTTON_STATE 	= 410 -- 刷新开服有礼按钮状态
g_game.g_f_lua_game_event.F_LUA_REQUEST_OBTAIN_BORN_PRINCEID	 	= 411 -- 请求领取皇子信息
g_game.g_f_lua_game_event.F_LUA_REFRESH_BOX							= 412 -- 刷新福袋
g_game.g_f_lua_game_event.F_LUA_MINGCHEN_JINJIE_EFFECT				= 413 -- 名臣进阶特效
g_game.g_f_lua_game_event.F_LUA_FINISH_JITIAN						= 414 -- 祭天完成
g_game.g_f_lua_game_event.F_LUA_REFESH_LIANHUA_SHOP			  		= 415 --刷新祭天商店到时
g_game.g_f_lua_game_event.F_LUA_REFESH_TUJIAN_PANEL			  		= 416 --刷新图鉴面板
g_game.g_f_lua_game_event.F_LUA_UPDATE_LIANHUA_SHOP			  		= 417 --刷新祭天商店
g_game.g_f_lua_game_event.F_LUA_UPDATE_STEADY_ACTIVITY				= 418 --更新定点活动  五谷丰登  世界boss
g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOW_RANKINFO			    = 419 --显示榜单
g_game.g_f_lua_game_event.F_LUA_SUIPIAN_TO_ELITE					= 420 --跳转 精英副本
g_game.g_f_lua_game_event.F_LUA_REFRESH_CEFENG_PANEL				= 421 --刷新册封面板
g_game.g_f_lua_game_event.F_LUA_REFRESH_BOSS_OPEN					= 422 --刷新世界boss开启信息
g_game.g_f_lua_game_event.F_LUA_CLIAM_QIANDAO						= 423 --领取签到奖励
g_game.g_f_lua_game_event.F_LUA_UPDATE_BINGFA_MERGE			  		= 424  --刷新兵法合成显示
g_game.g_f_lua_game_event.F_LUA_BACK_TOWORLD_BOSS    		  		= 425  --世界boss返回跳转
g_game.g_f_lua_game_event.F_LUA_UPDATE_BOSS_USERINFO   		  		= 426  --世界boss User info
g_game.g_f_lua_game_event.F_LUA_UPDATE_COURAGE_BOSS  		  		= 427  --鼓舞
g_game.g_f_lua_game_event.F_LUA_UPDATE_REBORN_BOSS   		  		= 428  --重生
g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_OPEN  		  		= 429  --开启 重新请求
g_game.g_f_lua_game_event.F_LUA_REFRESH_REQUEST_UNOPEN  		  	= 430  --未开启 重新请求
g_game.g_f_lua_game_event.F_LUA_REFRESH_QIANDAO_EFFECT	 		  	= 431  
g_game.g_f_lua_game_event.F_LUA_WORLD_BOSS_OVER			 		  	= 432
g_game.g_f_lua_game_event.F_LUA_SEND_USERINFO_TO_PLANTFORM 		  	= 433  --登录成功后给平台服务器发送玩家数据
g_game.g_f_lua_game_event.F_LUA_UPDATE_ZOUZHANG_SUCCESS 		  	= 434 --获取奏章成功
g_game.g_f_lua_game_event.F_LUA_UPDATE_CHAOZHU_NUM					= 435


--新手指引事件
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_JINGNUANDIAN		= 500
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_HOUGONG				= 501
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING			= 502
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING_SKIP		= 503
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_HOUGONG			= 504
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE_SELECT		= 505
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SMALL_BATTLE		= 506
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SHANGCHENG			= 507
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_KEJU				= 508
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_KEJU				= 509
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BUZHEN				= 510
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BUZHEN_LIST			= 511
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN_LIST		= 512
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN				= 513
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BEAUTY_XUANXIU		= 514
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_QINDIAN_XUANXIU		= 515
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BEAUTY_LIST_PANEL	= 516
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_QUEDING_CHANGE_BEAUTY	= 517
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BEAUTY_GONGDOU_OPEN		= 518
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_JUNJICHU_OPEN			= 519
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GET_PRINCE		= 520
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_DONGGONG		= 521
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_PRINCE_LIST	= 522
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_CLICK_UPDATE_BTN	= 523
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_EQUEMNT_DET	= 524
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_BEAUTY_CARD		= 525
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_MINGCHENG_CARD	= 526
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_JUNJICHU_SHENGJI	= 527
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_GONGDOU_LEVEL_UP	= 528
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLICK_CLOSE_EQUEP_DETAIL	= 529
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_QGYD			= 530

g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_DSM			= 531
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_ELITE		= 532
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GOTO_ELITE		= 533
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_TOUCH_ELITE_CARD	= 534
g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_BZ			= 535
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE3				= 536
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_LVUP_OFFICER		= 537
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE4				= 538
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE5				= 539
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE6				= 540
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_3STAR_GUIDE				= 541
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_STAGE_REWARD_PRESS		= 542
g_game.g_f_lua_game_event.F_LUA_GUIDELINES_LIQU_PRESS				= 543
g_game.g_f_lua_game_event.F_LUA_STOPBG_MUSIC						= 544
g_game.g_f_lua_game_event.F_LUA_POPUP_CHANGE_ACOUNT					= 545

g_game.g_f_lua_game_event.F_LUA_IOS_ADMOD_EVENT						= 546

--释放未使用纹理
g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE = 600

--错误事件
g_game.g_f_lua_game_event.F_LUA_ERROR_CODE_START					= 2000
g_game.g_f_lua_game_event.F_LUA_ERROR_CANNOT_CONNECT				= 2001
g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_DISCONNECT				= 2002
g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_RECONNECT_FAILD		= 2003
g_game.g_f_lua_game_event.F_LUA_ERROR_HIDE_NET_ERROR_PANEL			= 2004
g_game.g_f_lua_game_event.F_LUA_ERROR_HIDE_NET_LOGIN_ERROR_PANEL	= 2005
-----------------------------------------------------------

--网络加载loading
g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING         			= 3000
g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING  				= 3001
g_game.g_f_lua_game_event.F_LUA_CLEAR_LOADING_FLAG	   				= 3002
g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING	   		= 3003

--游戏向lua发送的事件
g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_BACKGROUND			= 4000
g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_FOREGROUND			= 4001
g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_MOMERY_WARING			= 4002



-----------------------------------------------------------
--数据分析sdk事件定义
g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGIN         			= 5000
g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGOUT         			= 5001
g_game.g_f_lua_game_event.F_LUA_DATA_USER_LEVEL         			= 5002
g_game.g_f_lua_game_event.F_LUA_DATA_USER_GAME_SERVER      			= 5003

g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_START				= 5004
g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_BUYITEM_SUCCESS	= 5005
g_game.g_f_lua_game_event.F_LUA_DATA_USER_CHARGE_SUCCESS			= 5006

g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_COINS			= 5007
g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_LOST_COINS	= 5008
g_game.g_f_lua_game_event.F_LUA_DATA_USER_RECORD_USER_GET_COINS		= 5009

g_game.g_f_lua_game_event.F_LUA_DATA_USER_BUY_IGM					= 5010
g_game.g_f_lua_game_event.F_LUA_DATA_USER_GET_IGM					= 5011
g_game.g_f_lua_game_event.F_LUA_DATA_USER_USE_IGM					= 5012

g_game.g_f_lua_game_event.F_LUA_DATA_USER_MISSION_BEGIN				= 5013
g_game.g_f_lua_game_event.F_LUA_DATA_USER_MISSION_COMPLETED			= 5014
g_game.g_f_lua_game_event.F_LUA_DATA_USER_MISSION_FAILED			= 5015


g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_REGISTERED			= 5016
g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_LOGINED				= 5017
g_game.g_f_lua_game_event.F_LUA_DATA_USER_TDA_PAY					= 5018

-----------------------------------------------------------
--平台sdk事件定义
g_game.g_f_lua_game_event.F_LUA_SDK_INIT							= 6000
g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN						= 6001
g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK					= 6002
g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT			= 6003
g_game.g_f_lua_game_event.F_LUA_SDK_CHECK_VERSION					= 6004
g_game.g_f_lua_game_event.F_LUA_SDK_PP_OPEN_USER_CENTER				= 6005
g_game.g_f_lua_game_event.F_LUA_SDK_PP_OPEN_BBS						= 6006
g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL			= 6007
g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_FACEBOOK					= 6008
g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_GOOGLE					= 6009

g_game.g_f_lua_game_event.F_LUA_SDK_REMOVE_WIN_USER_PANEL			= 6100

g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_ERROR					= 6200	--"未知错误"
g_game.g_f_lua_game_event.F_LUA_SDK_NETWORK_CONNECT_ERROR			= 6201	--网络连接错误
g_game.g_f_lua_game_event.F_LUA_SDK_DATA_LOST						= 6202	--数据包不全、丢失或无效
g_game.g_f_lua_game_event.F_LUA_SDK_UNKNOW_SESSION_ID				= 6203	--SessionId（用户的会话标识）无效
g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN					= 6204	--用户未登录,请登录平台帐号!
g_game.g_f_lua_game_event.F_LUA_SDK_USER_CANCEL_LOGIN				= 6205	--用户取消
g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED				= 6206	--用户校验失败,请重新登录平台帐号!

--party sdk事件
g_game.g_f_party_event ={}
g_game.g_f_party_event.F_LUA_PARTY_SDK_REGIST					= 17624 --party分配的事件 id 


--定义战斗兵团数量
g_game.g_f_battle_define = {}
g_game.g_f_battle_define.MAX_LAYOUT_COUNT			= 7
--定义战斗数据预定义
g_game.g_f_battle_time = {}
g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME 	= 2.0
g_game.g_f_battle_time.BATTLE_CARD_OPEN_ANI_TIME 	= 0.3


--登录动画
g_game.g_f_login_in_ui_effect = {}
g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT = {"tx_ui_denglu","tx_ui_denglu","qishou","xunhuan","guang"}

--定义战斗使用固定ui特效数据描述
--ui特效的ui key，
--战斗										   ui特效文件，	特效元件名,  特效1,     特效2,  特效3
g_game.g_f_battle_ui_effect = {}
g_game.g_f_battle_ui_effect.BATTLE_CARD_BACKGROUND_EFFECT	= {"tx_ui_kapaihuo", "tx_ui_kapaihuo", "qishou", "tx2", "tx3"}
g_game.g_f_battle_ui_effect.BATTLE_KEZHI_EFFECT				= {"tx_ui_kezhi", "tx_ui_kezhi", "qishou", "mingzhong", "tx3"}
g_game.g_f_battle_ui_effect.BATTLE_SOLIDER_FLAG_BUFFER		= {"tx_zd_biaoji", "tx_zd_biaoji", "qishou", "qishou", "tx3"}
g_game.g_f_battle_ui_effect.BATTLE_KAICHANG_YUN	     		= {"tx_ui_yuzhuanchang", "tx_ui_yunzhuanchang", "qishou", "mingzhong", "tx3"}
g_game.g_f_battle_ui_effect.BATTLE_MINGCHENG_CHUCHANG  		= {"tx_ui_mingchenchuchang", "tx_ui_mingchenchuchang", "qishou", "qishou", "tx3"}
g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT				= {"tx_ui_zhandouui","tx_ui_zhandouui","shengji","qishou","shengli","slxh","shibai","jingzhen","baoxiang","bxxunhuan","1xing","2xing","3xing"}



--主场景										   ui特效文件，	特效元件名,  特效1,     特效2,  特效3
g_game.g_f_main_ui_effect = {}
g_game.g_f_main_ui_effect.QIANGUYIDI_JIANTOU				= {"tx_ui_jiantou", "tx_ui_jiantou", "qishou", "mingzhong", "tx3"}
g_game.g_f_main_ui_effect.CHONGXING_LALIAN					= {"tx_ui_lalian","tx_ui_lalian","qishou","",""}
g_game.g_f_main_ui_effect.CHONGXING							= {"tx_chongxing","tx_chongxing","qishou","",""}

g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX					= {"tx_ui_zouzhang","tx_zouzhang","zhengshui","qishou","yue"}
g_game.g_f_main_ui_effect.REN_WU_DACHEN						= {"renwu_dachen", ""}
g_game.g_f_main_ui_effect.XINSHOU_ZHIYIN_MAOBI				= {"tx_ui_xinshouyindaomaobi", "tx_ui_xinshouyindaomaobi", "qishou", "", ""}
g_game.g_f_main_ui_effect.UI_LOADING						= {"tx_ui_loading","tx_ui_loading","qishou","",""}
g_game.g_f_main_ui_effect.UI_CARD							= {"tx_ui_jiemianuia", "tx_ui_jiemianuia", "lanka", "zika", "chengka", "huodong","huodong0","huodong1","huodong2"}
g_game.g_f_main_ui_effect.UI_BIG_CARD						= {"tx_ui_kuang", "tx_ui_kuang", "lanka", "zika", "chengka"}
g_game.g_f_main_ui_effect.UI_SHENG_ZHI						= {"tx_ui_shengzhi", "tx_ui_shengzhi", "qitou", "jitian"}
g_game.g_f_main_ui_effect.UI_HE_CHENG						= {"tx_ui_hecheng", "tx_ui_hecheng", "qishou", "qishou1"}
g_game.g_f_main_ui_effect.UI_JIE_MIAN						= {"tx_ui_jiemianui", "tx_ui_jiemianui", "xunhuan", "qizi", "qishou", "xxcg", "ghcg", "sycg", "dhcg", "qscg", "fccg", "gmcg", "sxcg", "hccg", "lizi", "zb"}
g_game.g_f_main_ui_effect.UI_BOSS							= {"tx_ui_shijieboss","shuimian","qiu"}				
																-- 1 					2				3			4		5		6		7		8 		9		10		11		12		13		14		15		16
g_game.g_f_main_ui_effect.MAIN_SCENE_NPC					= {"tx_zhucheng","tx_zhucheng",""}												
g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE					= {"tx_ui_qianghua", "tx_ui_qianghua", "qh", "jiayi", "jiaer", "jia3", "jia4", "jia5"}
g_game.g_f_main_ui_effect.UI_JIE_MIAN_B						= {"tx_ui_jiemianuib","denglong1","dengji","dengji1","dengji2","denglu","denglu1","denglu2","wugu","wugu1","wugu2","chongzhi","chongzhi1","chongzhi2","huanrao","ciguan","ciguan1"}
g_game.g_f_main_ui_effect.UI_JIE_MIAN_C						= {"tx_ui_jiemianuic","qishou", "shilianchou", "xunhuan", "zi", "cheng","3xing"}
g_game.g_f_main_ui_effect.UI_SWEEP							= {"tx_ui_saodang","tx_ui_saodang","qishou"}
g_game.g_f_main_ui_effect.UI_KUANG1							= {"tx_ui_kuang1","tx_ui_kuang1","xunhuan"}

g_game.g_f_main_ui_effect.GUANQIA_EFFECT				= {"tx_ui_guanqiatishi","tx_ui_guanqiatishi","guanqia","fuben"}

g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT					= {"tx_ui_xunfang","qishou","yd"}
g_game.g_f_main_ui_effect.UI_XUANXIU_EFFECT					= {"tx_ui_xuanxiu","xuanxiu","keju"}


--剧情动画特效										   ui特效文件，	特效元件名,  特效1,     特效2,  特效3
g_game.g_f_story_effect = {}

g_game.g_f_main_ui_effect.STORY_STEP2_1						= {"tx_piantou_donghua02","tx_piantou_donghua02","qishou","",""}
g_game.g_f_main_ui_effect.STORY_STEP3_1						= {"tx_piantou_donghua03","tx_piantou_donghua03","qishou","",""}
g_game.g_f_main_ui_effect.STORY_STEP4_1						= {"tx_piantou_donghua04","tx_piantou_doanghua04","qishou","",""}

--粒子特效定义
g_game.g_f_particle_effect = {}
g_game.g_f_particle_effect.CARD_HEAD_BACK_EFFECT = {"card_head_particle"}
g_game.g_f_particle_effect.TEST1_EFFECT = {"fire"}
g_game.g_f_particle_effect.TEST1_EFFECT = {"SpinningPeas"}

--彩色文本颜色
g_game.g_f_text_default_color = cc.c3b(0, 0, 0)

--册封文字图
g_game.g_cefeng_words = {
	{"huang_uizi", "hou_uizi"},
	{"huang_uizi", "gui_uizi", "fei_uizi"},
	{"gui_uizi", "fei_uizi"},
	{"fei_uizi"},
	{"pin2_uizi "},
	{"gui_uizi", "ren_uizi"},
	{"chang_uizi", "zai_uizi"},
	{"da_uizi", "ying2_uizi "},
}

--定义卡牌品质背景图片
g_game.g_f_battle_card_background =
{
	"baipinzhi_zhandou",
	"lvpinzhi_zhandou",
	"lan_pinzhi_2",
	"zipinzhi_zhandou",
	"chengpinzhi_zhandou"
}

--meinv quality bg
g_game.g_f_meinv_quality_bg = 
{
	"",
	"batch_ui/meinvpinzhi_lv.png",
	"batch_ui/meinvpinzhi_lan.png",
	"batch_ui/meinvpinzhi_zi.png",
	"batch_ui/meinvpinzhi_cheng.png",
}

--soldier type image
g_game.g_f_soldier_flage_image = 
{
	"batch_ui/bu_bingzhong_anniu.png",
	"batch_ui/gong_bingzhong_anniu.png",
	"batch_ui/qi_bingzhong_anniu.png",
	"batch_ui/qiang_bingzhong_anniu.png",
	"nobatch/bu2_bingzhong_icon.png",
	"nobatch/gong2_bingzhong_icon.png",
	"nobatch/qi2_bingzhong_icon.png",
	"nobatch/qiang2_bingzhong_icon.png",
}

--soldier type image
g_game.g_f_soldier_flage_image_big = 
{
	"batch_ui/bu_bingzhong_icon.png",
	"batch_ui/gong_bingzhong_icon.png",
	"batch_ui/qi_bingzhong_icon.png",
	"batch_ui/qiang_bingzhong_icon.png",
	"nobatch/bu2_bingzhong_icon.png",
	"nobatch/gong2_bingzhong_icon.png",
	"nobatch/qi2_bingzhong_icon.png",
	"nobatch/qiang2_bingzhong_icon.png",
}


g_game.g_f_battle_skill_card_background =
{
	"lv",
	"lv",
	"lan",
	"zi",
	"cheng"
}

g_game.g_f_quality_image =
{
	"batch_ui/baipinzhi_kuang.png",
	"batch_ui/lvpinzhi_kuang.png",
	"batch_ui/lanpinzhi_kuang.png",
	"batch_ui/zipinzhi_kuang.png",
	"batch_ui/chengpinzhi_kuang.png"
}

g_game.g_f_quality_corner = 
{
	"batch_ui/tubiaokuang2_bai.png",
	"batch_ui/tubiaokuang2_lv.png",
	"batch_ui/tubiaokuang2_lan.png",
	"batch_ui/tubiaokuang2_zi.png",
	"batch_ui/tubiaokuang2_cheng.png",
}

g_game.g_f_solider_number_quality_image =
{
	"batch_ui/pinzhi_bai_zhandoukuang.png",
	"batch_ui/pinzhi_lv_zhandoukuang.png",
	"batch_ui/pinzhi_lan_zhandoukuang.png",
	"batch_ui/pinzhi_zi_zhandoukuang.png",
	"batch_ui/pinzhi_cheng_zhandoukuang.png"
}

--月卡商品信息
g_game.g_f_month_card_info = {  ["iap"] = {["productIdentifier"] = "com.cmge.wuhuangwansui.iap.007"},
							  	["info"] = {["discount"] = 50,
											["gold"] = 1,
											["productName"] = "月卡",
											["id"] = 7,
											["isDiscount"] = 0,
											["itemKey"] = "com.cmge.wuhuangwansui.iap.007",
											["price"] = 50}}
											
--音乐和音效播放事件
g_game.g_f_lua_game_event.F_LUA_SOUND_START				= 1000
g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY			= 1001
g_game.g_f_lua_game_event.F_LUA_MUSIC_HOUGONG			= 1002
g_game.g_f_lua_game_event.F_LUA_MUSIC_XUANGUAN			= 1003
g_game.g_f_lua_game_event.F_LUA_MUSIC_ZHANDOU			= 1004
g_game.g_f_lua_game_event.F_LUA_MUSIC_LOGIN				= 1005
g_game.g_f_lua_game_event.F_LUA_GUILDLINE_1				= 1006
g_game.g_f_lua_game_event.F_LUA_GUILDLINE_2				= 1007
g_game.g_f_lua_game_event.F_LUA_GUILDLINE_3				= 1008
g_game.g_f_lua_game_event.F_LUA_GUILDLINE_4				= 1009

g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU			= 1011    
g_game.g_f_lua_game_event.F_LUA_EFFECT_BUBING			= 1012

g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE			= 1014
g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN		= 1015
g_game.g_f_lua_game_event.F_LUA_EFFECT_GAIZHANG			= 1016
g_game.g_f_lua_game_event.F_LUA_EFFECT_GONGBING			= 1017
g_game.g_f_lua_game_event.F_LUA_EFFECT_CLOSE_POPUP		= 1018
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGDISHENGJI	= 1019
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJINENG1	= 1020
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUOQIANG			= 1021
g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENGCHENGGONG	= 1022
g_game.g_f_lua_game_event.F_LUA_EFFECT_JIXIANG			= 1023
g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINVXIANGQING	= 1024
g_game.g_f_lua_game_event.F_LUA_EFFECT_JIAOYUHUANGZI	= 1025
g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG1			= 1026
g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG2			= 1027
g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG3			= 1028
g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG4			= 1029
g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG5			= 1030

g_game.g_f_lua_game_event.F_LUA_EFFECT_MC_JINENGZHANSHI	= 1032
g_game.g_f_lua_game_event.F_LUA_EFFECT_JINRUYOUXI		= 1033
g_game.g_f_lua_game_event.F_LUA_EFFECT_KAIBAOXIANG		= 1034
g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI		= 1035
g_game.g_f_lua_game_event.F_LUA_EFFECT_KEZHI			= 1036
g_game.g_f_lua_game_event.F_LUA_EFFECT_MINGCHENXIANGQING	= 1037

g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI			= 1039
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI2			= 1040
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHOUZHONGMINGCHEN	= 1041
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUIQU			= 1042
g_game.g_f_lua_game_event.F_LUA_EFFECT_QIBING			= 1043
g_game.g_f_lua_game_event.F_LUA_EFFECT_QIJIA			= 1044
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING	= 1045
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU	= 1046
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIQINGAN	= 1047

g_game.g_f_lua_game_event.F_LUA_EFFECT_SIWANG			= 1050
g_game.g_f_lua_game_event.F_LUA_EFFECT_SUIJI			= 1051
g_game.g_f_lua_game_event.F_LUA_EFFECT_POPUP			= 1052
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING_TN	= 1053
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU_TN	= 1054
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIQINGAN_TN	= 1055

g_game.g_f_lua_game_event.F_LUA_EFFECT_TUICAO			= 1057
g_game.g_f_lua_game_event.F_LUA_EFFECT_WUHUANGWANSUI	= 1058
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING1		= 1059
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING2		= 1060
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING3		= 1061	
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING4		= 1062	
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING5		= 1063
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING6		= 1064
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING7		= 1065
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING8		= 1066
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING9		= 1067
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING10		= 1068
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING11		= 1069
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING12		= 1070
g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING13		= 1071	
--g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING14		= 1072
--g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENG			= 1073
--g_game.g_f_lua_game_event.F_LUA_EFFECT_QINAN			= 1074
g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUHUIHE		= 1075
g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHENGLI	= 1076
g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHIBAI	= 1077

g_game.g_f_lua_game_event.F_LUA_EFFECT_BABY_CRY			= 1091
g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_XINTIAO	= 1092
g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN	= 1093

g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN	= 1095
g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_SHAZHANG	= 1096
g_game.g_f_lua_game_event.F_LUA_EFFECT_QIAOLUO			= 1097
--g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_QIFEI		= 1098
g_game.g_f_lua_game_event.F_LUA_EFFECT_BEIKEZHI			= 1099
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG1	= 1100
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG2	= 1101
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG3	= 1102  --
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG4	= 1103--
g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG5	= 1104--
g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPINGGUOCHENG	= 1105
g_game.g_f_lua_game_event.F_LUA_EFFECT_YUNCENG			= 1106
g_game.g_f_lua_game_event.F_LUA_EFFECT_QIANGHUA			= 1107

g_game.g_f_lua_game_event.F_LUA_EFFECT_BINGMA_JINRU		= 1112
g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPING_SHIBAI	= 1113

g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP				= 1300

--游戏背景音乐
g_game.g_f_background_music = {}
g_game.g_f_background_music[1] = "music/zhujiemian2.mp3"
g_game.g_f_background_music[2] = "music/hougong.mp3"
g_game.g_f_background_music[3] = "music/xuanguan.mp3"
g_game.g_f_background_music[4] = "music/zhandou.mp3"
g_game.g_f_background_music[5] = "music/zhujiemian.mp3"
g_game.g_f_background_music[6] = "music/bubujingqing_01.mp3"
g_game.g_f_background_music[7] = "music/bubujingqing_02.mp3"
g_game.g_f_background_music[8] = "music/bubujingqing_03.mp3"
g_game.g_f_background_music[9] = "music/bubujingqing_04.mp3"


--游戏音效
g_game.g_f_background_music[11] = "effect/anniu"
g_game.g_f_background_music[12] = "effect/bubing"
--g_game.g_f_background_music[13] = "effect/chouka"
g_game.g_f_background_music[14] = "effect/fanye"
g_game.g_f_background_music[15] = "effect/fenyeqian"
g_game.g_f_background_music[16] = "effect/gaizhang"
g_game.g_f_background_music[17] = "effect/gongbing"
g_game.g_f_background_music[18] = "effect/guanbijiemian"
g_game.g_f_background_music[19] = "effect/huangdishengji"
g_game.g_f_background_music[20] = "effect/huangzijineng1"
g_game.g_f_background_music[21] = "effect/huoqiang"
g_game.g_f_background_music[22] = "effect/jiaomei_endian"
g_game.g_f_background_music[23] = "effect/jiaomei_huangshangjixiang"
g_game.g_f_background_music[24] = "effect/jiaomei_qingan"
g_game.g_f_background_music[25] = "effect/jiaoyuhuangzi"
g_game.g_f_background_music[26] = "effect/jineng1"
g_game.g_f_background_music[27] = "effect/jineng2"
g_game.g_f_background_music[28] = "effect/jineng3"
g_game.g_f_background_music[29] = "effect/jineng4"
g_game.g_f_background_music[30] = "effect/jineng5"
--g_game.g_f_background_music[31] = "effect/jineng6"
g_game.g_f_background_music[32] = "effect/jinengzhanshi"
g_game.g_f_background_music[33] = "effect/jinruyouxi"
g_game.g_f_background_music[34] = "effect/kaibaoxiang"
g_game.g_f_background_music[35] = "effect/kapaishengji"
g_game.g_f_background_music[36] = "effect/kezhi"
g_game.g_f_background_music[37] = "effect/laonian_canjianhuangshang"
--g_game.g_f_background_music[38] = "effect/laonian_cenlingzhixieen"
g_game.g_f_background_music[39] = "effect/laonian_chenzai"
g_game.g_f_background_music[40] = "effect/laonian_jinzunhuangshangfenfu"
g_game.g_f_background_music[41] = "effect/laonian_xiezhulongen"
g_game.g_f_background_music[42] = "effect/laonian_zhe"
g_game.g_f_background_music[43] = "effect/qibing"
g_game.g_f_background_music[44] = "effect/qijia"
g_game.g_f_background_music[45] = "effect/qingnian_canjianhuangama"
g_game.g_f_background_music[46] = "effect/qingnian_duoxieeniang"
g_game.g_f_background_music[47] = "effect/qingnian_qingan"
--g_game.g_f_background_music[48] = "effect/qingnian_xiehuangama"
--g_game.g_f_background_music[49] = "effect/shengzhidao"
g_game.g_f_background_music[50] = "effect/siwang"
g_game.g_f_background_music[51] = "effect/suijimingzi"
g_game.g_f_background_music[52] = "effect/tanchujiemian"
g_game.g_f_background_music[53] = "effect/tongnian_canjianhuangama"
g_game.g_f_background_music[54] = "effect/tongnian_duoxieeniang"
g_game.g_f_background_music[55] = "effect/tongnian_qingan"
--g_game.g_f_background_music[56] = "effect/tongnian_xiehuangama"
g_game.g_f_background_music[57] = "effect/tuicao"
g_game.g_f_background_music[58] = "effect/wuhuangwansui"

g_game.g_f_background_music[59] = "effect/yindang_chongxing1"
g_game.g_f_background_music[60] = "effect/yindang_chongxing2"
g_game.g_f_background_music[61] = "effect/yindang_chongxing3"
g_game.g_f_background_music[62] = "effect/yindang_chongxing4"
g_game.g_f_background_music[63] = "effect/yindang_chongxing5"
g_game.g_f_background_music[64] = "effect/yindang_chongxing6"
g_game.g_f_background_music[65] = "effect/yindang_chongxing7"
g_game.g_f_background_music[66] = "effect/yindang_chongxing8"
g_game.g_f_background_music[67] = "effect/yindang_chongxing9"
g_game.g_f_background_music[68] = "effect/yindang_chongxing10"
g_game.g_f_background_music[69] = "effect/yindang_chongxing11"
g_game.g_f_background_music[70] = "effect/yindang_chongxing12"
g_game.g_f_background_music[71] = "effect/yindang_chongxing13"
--g_game.g_f_background_music[72] = "effect/yindang_huangshangjixiang"
--g_game.g_f_background_music[73] = "effect/yindang_endian"
--g_game.g_f_background_music[74] = "effect/yindang_qingan"
g_game.g_f_background_music[75] = "effect/zhandouhuihe"
g_game.g_f_background_music[76] = "effect/zhandoushengli"
g_game.g_f_background_music[77] = "effect/zhandoushibai"

g_game.g_f_background_music[91] = "effect/yingerku1"
g_game.g_f_background_music[92] = "effect/huaiyunxintiao"
g_game.g_f_background_music[93] = "effect/chongxingzhuanpan"

g_game.g_f_background_music[95] = "effect/dajiangli"
g_game.g_f_background_music[96] = "effect/chongxingshazhang"
g_game.g_f_background_music[97] = "effect/kaikaoqiaoluo"
--g_game.g_f_background_music[98] = "effect/qifei"
g_game.g_f_background_music[99] = "effect/bipinguocheng"
g_game.g_f_background_music[100] = "effect/huangzijineng1"
g_game.g_f_background_music[101] = "effect/huangzijineng2"
g_game.g_f_background_music[102] = "effect/huangzijineng3"
g_game.g_f_background_music[103] = "effect/huangzijineng4"
g_game.g_f_background_music[104] = "effect/huangzijineng5"
g_game.g_f_background_music[105] = "effect/bipinguocheng"
g_game.g_f_background_music[106] = "effect/yunceng"
g_game.g_f_background_music[107] = "effect/qianghuachenggong"

g_game.g_f_background_music[112] = "effect/bingmaruchang"
g_game.g_f_background_music[113] = "effect/bipinshibai"

--游戏皇子 教育经验增长 提示文本
g_game.g_f_prince_exp_up_string1 =
{
	"阿哥潜心学习《论语》",
	"阿哥潜心学习《中庸》",
	"阿哥潜心学习《大学》",
	"阿哥潜心学习《孟子》",
	"阿哥潜心学习《诗经》",
	"阿哥潜心学习《周易》",
	"阿哥潜心学习《春秋》",
	"阿哥潜心学习《古文观止》",
	"阿哥潜心学习《史记》",
	"阿哥潜心学习《汉书》",
	"阿哥潜心学习《全唐诗》",
	"阿哥潜心学习《三字经》",
}

g_game.g_f_prince_exp_up_string2 =
{
	"阿哥潛心學習《論語》",
	"阿哥潛心學習《中庸》",
	"阿哥潛心學習《大學》",
	"阿哥潛心學習《孟子》",
	"阿哥潛心學習《詩經》",
	"阿哥潛心學習《周易》",
	"阿哥潛心學習《春秋》",
	"阿哥潛心學習《古文觀止》",
	"阿哥潛心學習《史記》",
	"阿哥潛心學習《漢書》",
	"阿哥潛心學習《全唐詩》",
	"阿哥潛心學習《三字經》",
}

g_game.g_f_game_flag = {}
g_game.g_f_game_flag.F_LUA_GAME_SHOP_OPEN_INDEX = 1
g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE = 2

g_game.g_f_error_msg_def = {}
g_game.g_f_error_msg_def.F_LUA_ERROR_SERVER_DISCONNECT = 1 -- 服务器主动断开连接
g_game.g_f_error_msg_def.F_LUA_ERROR_SERVER_LOGININ_OTHER_PLACE = 2 --用户在别处登录被t下线
g_game.g_f_error_msg_def.F_LUA_ERROR_ENEMY_RANK_CHANGED = 3 --敌方排名发生变化
g_game.g_f_error_msg_def.F_LUA_ERROR_MILITARY_NOT_ENOUGH = 4 --军令不足
g_game.g_f_error_msg_def.F_LUA_ERROR_USER_DATA_ERROR = 5 --用户数据错误
g_game.g_f_error_msg_def.F_LUA_ERROR_USER_CHALLENGE_NUM_ZERO = 6 --挑战次数已用尽
g_game.g_f_error_msg_def.F_LUA_ERROR_NETWORK_LINKERROR = 7--服务器链接错误
g_game.g_f_error_msg_def.F_LUA_ERROR_NETWORK_ALREAY_DISCONNECT = 8 --服务器链接也断开
g_game.g_f_error_msg_def.F_LUA_ERROR_PVP_NOT_OPEN = 9 --pvp 10级开启
g_game.g_f_error_msg_def.F_LUA_ERROR_NEED_RECONNECT = 10 --断线重连
g_game.g_f_error_msg_def.F_LUA_ERROR_INPUT_ERROR = 11 --敏感字
g_game.g_f_error_msg_def.F_LUA_ERROR_DUPLICATE_MINGCHEN = 12 --同名武将
g_game.g_f_error_msg_def.F_LUA_ERROR_FIVE_LEVEL_PRINCE = 13 --5级皇子才能进入宗人府

g_game.g_f_error_msg = {}
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_SERVER_DISCONNECT] = 351--"服务器连接已断开"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_SERVER_LOGININ_OTHER_PLACE] = 352--"您的账号在另一地点登陆，您已被迫下线。确定重新登录？"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_ENEMY_RANK_CHANGED] = 353--"敌方排名发生变化"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_MILITARY_NOT_ENOUGH] = 354--"军令不足"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_USER_DATA_ERROR] = 355--"用户数据错误"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_USER_CHALLENGE_NUM_ZERO] =356-- "挑战次数已用尽"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_NETWORK_LINKERROR] = 357--"服务器连接错误，请检查网络状态"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_NETWORK_ALREAY_DISCONNECT] = 358--"服务器连接已断开，请重新登陆游戏！"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_PVP_NOT_OPEN] =457-- "10级开启。千古一帝，万人之上。与其他玩家争夺全服第一之荣耀！"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_NEED_RECONNECT] = 458--"  启禀皇上：您的网络状态不稳定，网络连接已断开，请尝试重新连接"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_INPUT_ERROR] = 459--"您输入的内容包含非法字符，请重新输入，只能使用中文，英文和数字"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_DUPLICATE_MINGCHEN] = 460--"您已上阵了相同的名臣"
g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_FIVE_LEVEL_PRINCE] = 461--"拥有5级以上皇子才会开启宗人府"

g_game.g_f_tip_msg_def = {}
g_game.g_f_tip_msg_def.F_LUA_TIPS_BUY_ITEM_GET_CONS 		= 1	--您充值获得的XXX元宝已到账，祝您游戏愉快！
g_game.g_f_tip_msg_def.F_LUA_TIPS_OPEN_FUNCTION				= 2	--%d级开启，敬请期待！
g_game.g_f_tip_msg_def.F_LUA_TIPS_BATTLE_PROVISIONS			= 3	--粮草不足！
g_game.g_f_tip_msg_def.F_LUA_TIPS_BATTLE_COUNT				= 4	--开战次数不足！
g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT		= 5	--请先选择名臣！
g_game.g_f_tip_msg_def.F_LUA_TIPS_BEAUTY_CARD_SELECT		= 6	--请先选择美女！
g_game.g_f_tip_msg_def.F_LUA_TIPS_NEED_CHONGXING_MEINV		= 7	--请先宠幸美女！
g_game.g_f_tip_msg_def.F_LUA_TIPS_BUY_MONTH_CARD_SUCCESS	= 8	--购买月卡成功！



g_game.g_f_tip_msg = {}
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_BUY_ITEM_GET_CONS]	= 462--"您充值获得的%d元宝已到账，祝您游戏愉快！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_OPEN_FUNCTION]	= 463--"%d级开启，敬请期待！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_BATTLE_PROVISIONS]	= 464--"粮草不足！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_BATTLE_COUNT]	= 465--"开战次数不足！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_MINGCHENG_CARD_SELECT]	= 466-- "请先选择名臣！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_BEAUTY_CARD_SELECT]	= 467--"请先选择美女！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_NEED_CHONGXING_MEINV]	= 468--"皇上，您现在还没有皇子呢，快去宠幸美女吧！"
g_game.g_f_tip_msg[g_game.g_f_tip_msg_def.F_LUA_TIPS_BUY_MONTH_CARD_SUCCESS]	= 469--"购买月卡成功！恭喜您获得500元宝！记得每日登陆领取月卡回馈哦~"


g_game.F_BACK_TOUI_OFFICER = 1
g_game.F_BACK_TOUI_BEAUTY = 2
g_game.F_BACK_TOUI_PRINCE = 3
g_game.F_BACK_TOUI_KEJU = 4
g_game.F_BACK_TOUI_BINGFA = 5
g_game.F_BACK_TOUI_LUEDUO = 6
g_game.F_BACK_TOUI_MAIL = 7
g_game.F_BACK_TOUI_ZHUANGBEI = 8
g_game.F_BACK_TOUI_WORLD_BOSS = 9
--走马灯消息缓存最多条数
g_game.MAX_MOVING_MSG_NUM = 100

g_game.REFRESH_OPEN_BOSS = 1
g_game.REFRESH_UNOPEN_BOSS = 2
g_game.MAX_COURAGE_TIMES = 20 --最大鼓舞次数

g_game.WORLD_BOSS_START_TIME2 = 21-- 21点
g_game.WORLD_BOSS_LAST_TIME = 15*60 --世界boss的持续时间 900s

g_game.OPEN_WORLD_BOSS_LV = 15 --世界boss开启等级
g_game.REFRESH_COUNT = 5 --更新 倒计时

g_game.OPEN_SAODANG_MORE_VIP_LV = 3 --扫荡多次vip开启等级
g_game.OPEN_SAODANG1_VIP_LV = 2 --扫荡一次vip开启等级
g_game.OPEN_SAODANG_LV = 30 --扫荡功能开启
g_game.OPEN_ELITE_LV = 26 --精英副本开启等级
g_game.OPEN_BATTLE_ARR2_LV = 30 --阵容2 开启等级
g_game.OPEN_XUNXIU_LV = 20 --选秀开启等级
g_game.MAX_USER_LV = 70
g_game.UPDATE_TIME = 300

g_game.RECT_OFFSET = 40
--pvp最大挑战次数
g_game.MAX_CHALLENGE_NUM = 20
g_game.MAX_CHALLENGE_REDUCE_MILLITARY = 100
--pve精英最大挑战次数
g_game.MAX_ELITE_CHALLENGE_NUM = 10
--输入名字长度
g_game.MAX_NIANHAO_LEN = 2 --最大年号长度
g_game.MAX_WANJIA_NAME_LEN = 5 --玩家名称最大长度
g_game.MAX_PRINCE_NAME_LEN = 7 --最大人物名字长度

g_game.RECT_OFFSET = 30

g_game.g_f_battle_solider_position = {}
g_game.g_f_battle_solider_position.g_attack_position = 
{
	{235, 255},{345, 325}, {455, 400}, {565, 465},
	{150, 335},{270, 410}, {380, 480}
}

g_game.g_f_battle_solider_position.g_defense_position = 
{
	{420, 175},{530, 250}, {640, 330}, {745, 395},
	{630, 170},{740, 240}, {845, 310}
}


--sdk不同界面布局表定义
g_game.g_f_sdk_layout_define = 
{
	["isShowPPUser_center"] = false,--显示用户中心按钮	
	["isShowBBS_center"] = false --显示论坛按钮
	
}


