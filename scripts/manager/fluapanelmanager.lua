require("scripts.common.fexportuiload")

local FLuaPanelManager = class("FLuaPanelManager");
FLuaPanelManager.__index = FLuaPanelManager;

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaPanelManager:ctor()
	
	self.parent_panel_container = nil
	self.fill_panel_container = nil
	
	
	-- 游戏内层级定义，自下向上: 第一层 Tag:1   第二层  Tag:2  第三层   Tag:3 第四层 Tag:4 第五层 Tag:5 第六层 Tag:6
	self.layer_name		  = {}
	self.layer_name[1] = "base_layer"
	self.layer_name[2] = "second_layer"
	self.layer_name[3] = "third_layer"
	self.layer_name[4] = "panel_layer"
	self.layer_name[5] = "tips_layer"
	self.layer_name[6] = "loading_layer"
	
	self.panel_show_count									= 0
	
	--定义 面板将要显示在哪一层layer
	self.panel_config  = {}
	--预定义面板
	self.panel_config["fill_panel_container"]				= 4
	self.panel_config["parent_panel_container"] 			= 4
	
	--自定义面板
	self.panel_config["login_bg_panel"] 					= 1
	self.panel_config["login_shuru"]	 					= 2
	
	self.panel_config["login_shuru_new"]	 				= 2
	self.panel_config["server_list_panel"]					= 3
	self.panel_config["login_choose_type"]					= 3
	
	--登陆
	self.panel_config["login"] 					            = 1
	self.panel_config["login_win_input"]					= 3
	self.panel_config["login_create_role"]					= 3
	
	--走马灯面板
	self.panel_config["moving_msg_panel"]					= 6
	
	--自动生成面板定义
	self.panel_config["main_ui_top_left"]					= 3
	self.panel_config["main_ui_top_right"]					= 3
	self.panel_config["main_ui_right_center"]				= 3
	self.panel_config["main_ui_right_bottom"]				= 3
	self.panel_config["main_ui_left_center"]				= 3
	--战斗界面
	self.panel_config["zhandoujiemian_left_bottom"]			= 3
	self.panel_config["zhandoujiemian_right_bottom"]		= 3
	self.panel_config["zhandoujiemian_right_top"]			= 3
	self.panel_config["zhandoujiemian_left_top"]			= 3
	
	self.panel_config["bosswin"]							= 4
	self.panel_config["bosslose"]							= 4
	self.panel_config["shengli"]							= 4
	self.panel_config["qgyd_shengli"]						= 4
	self.panel_config["shibai"]								= 4
	self.panel_config["lueduo_result"]						= 4
	self.panel_config["qgyd_shibai"]						= 4
	self.panel_config["juezhan"]							= 4	
	
	self.panel_config["saodang"]							= 4	
	self.panel_config["saodang_result"]						= 4	
	self.panel_config["world_boss_rank_info"]				= 4	
	
	
	self.panel_config["exchange_reward"]					= 4	
	self.panel_config["card_lv_up_panel"]					= 4	
	self.panel_config["quick_buy_panel"]					= 4	
	self.panel_config["quick_use_panel"]					= 4	
	--军机处
	self.panel_config["junjichu_title"]                     = 4
	self.panel_config["mingchen_shengji"]                   = 4
	
	self.panel_config["quick_charge_ui"]                   	= 4
	
	self.panel_config["vip_detail_pac"] 					= 4
	
	--精英关卡
	self.panel_config["elite_stage"]                   		= 4
	self.panel_config["elite_stage_battle"]                 = 4
	self.panel_config["stage_buy_challenge"]                = 4
	
	self.panel_config["public_first_charge_pop"]            = 4
	--金銮殿界面
	self.panel_config["jinluandian_bg"]                     = 3
	
	-- 奏章
	self.panel_config["zouzhang_buzu_pop"]                  = 4
	self.panel_config["zouzhang_reward_pop"]                = 4
	
	--布阵
	self.panel_config["paibinghuangzi_top"]					= 4
	self.panel_config["mingchenxuanze_title"]				= 4
	self.panel_config["genghuanzhenrong"]					= 4
	
	--章节
	self.panel_config["nanzhengbeitao_title"]				= 4
	self.panel_config["zhanyi_ditu_bg"]						= 4
	self.panel_config["zhanyi_waikuang"]					= 4
	
	--美女
	self.panel_config["hougong_tangquangong_bg"]			= 4
	self.panel_config["meinvxuanze_title"]					= 4
	self.panel_config["meinv_promote_ui"]					= 4
	--宫斗	
	self.panel_config["gongdou_bg"]							= 4
	--册封
	self.panel_config["hougong_cefeng_bg"]					= 4
	--详细
	self.panel_config["meinvshuxing_title"]					= 4
	--宠幸转盘			
	self.panel_config["zhuanpan"]							= 4		
	self.panel_config["chongxing_panel"]					= 4	
	
	--皇子
	self.panel_config["huangzi_qianqinggong_top"]           = 4
	self.panel_config["huangzi_xuanze"]          			= 4
	self.panel_config["huangzishuxing_bg"]          		= 4
	self.panel_config["huangzi_yuelongmen"]          		= 4
	self.panel_config["huangzi_zongrenfu"]          		= 4
	self.panel_config["huangzi_shangshufang"]          		= 4
	
	--商城
	self.panel_config["keju_xuanxiu_shangcheng"]            = 4
	self.panel_config["xuanxiu_qingdianshengzhi"]           = 4
	self.panel_config["xuanxiu"]                            = 4
	self.panel_config["keju"]                               = 4
	self.panel_config["shangcheng"]                         = 4
	self.panel_config["keju_qindiandachen"]                 = 4
	self.panel_config["xuanxiu_qindianxiunv"]               = 4
	self.panel_config["shangcheng_chongzhi"]               	= 4
	self.panel_config["item_pop_up"]						= 4
	self.panel_config["vip"]						        = 4
	
	--兵种详情弹出
	self.panel_config["soldier_info_panel"]					= 4
	self.panel_config["skill_info_panel"]					= 4
	
	--千古一帝
	self.panel_config["qgyd_bottom"]						= 4
	self.panel_config["qgyd_gongjizhiduihuan"]				= 4
	self.panel_config["qgyd_duihuan_popup"]                 = 4
	
	--装备界面
	self.panel_config["user_equip_bag_panel"]				= 4
	
	--总加成
	self.panel_config["card_zongjiacheng"]				= 4
	
	--国情界面
	self.panel_config["guo_qing"]							= 4
	
	self.panel_config["pve_reward_popup"]					= 4
	self.panel_config["rewardInfo"]					= 4
	self.panel_config["prince_change_name"]          		= 4
	
	self.panel_config["story_stage_panel"]          		= 4
 	--提示板
	self.panel_config["notice_popup_panel"]          		= 5
	self.panel_config["floating_popup_panel"]          		= 5
	self.panel_config["tax_result_view"]          			= 5
	self.panel_config["zozhang_result_view"]          			= 5
	self.panel_config["public_setting"]          			= 5
	
	self.panel_config["baoji_popup_panel"]          		= 5
	
	--loading
	self.panel_config["loadingjiemian"]						= 3
	self.panel_config["ui_loading"]							= 5
	
	self.panel_config["pve_emperor_lvup"]					= 4
	
	--服务器错误提示框
	self.panel_config["network_error_panel"]				= 6
	
	--公告面板
	self.panel_config["gonggao_panel"]						= 4
	
	--邮箱面板
	self.panel_config["mail_panel"]							= 4
	
	--奖励面板
	self.panel_config["reward_panel"]						= 4
	
	--装备详细面板
	self.panel_config["equip_detial_panel"]					= 4
	
	--装备详细面板
	self.panel_config["main_popup"]							= 2
	
	--弹出特效面板
	self.panel_config["effect_popup"]						= 6
	
	--名臣详情
	self.panel_config["mingchen_xiangqing"]					= 4
	
	--邮件附件详情
	self.panel_config["mail_attachment"]					= 5
	
	--出售确认
	self.panel_config["sell_popup"]							= 5
	
	--出售确认
	self.panel_config["jin_jie"]							= 4
	
	--兵法确认
	self.panel_config["bing_fa"]							= 4
	
	--美女赏赐
	self.panel_config["meinv_award_ui"]						= 4
	
	--开服有礼
	self.panel_config["open_service_ui"]					= 3
	
	--掠夺面板
	self.panel_config["lueduo_panel"]						= 4
	
	--掠夺面板
	self.panel_config["xunfang_panel"]						= 4
	
	--限时充值奖励,礼包详细内容面板
	self.panel_config["charge_reward_detail_panel"]			= 4
	
	--寻访奖励
	self.panel_config["xunfang_reward"]						= 4
	
	--寻访奖励详情
	self.panel_config["xunfang_reward_detial"]				= 4
	
	--排名奖励详情
	self.panel_config["rank_reward_detial"]					= 4
	
	--抽奖排行榜
	self.panel_config["choujiang_rank"]						= 4
	--积分商店
	self.panel_config["rank_shop"]							= 4
	--排行榜
	self.panel_config["leaderboard"]						= 4
	--抽奖奖励
	self.panel_config["choujiang_reward"]					= 4
	--跳转提示弹出面板
	self.panel_config["jump_tip_popup"]						= 4
	--元宝产子提示面板
	self.panel_config["birth_tip_popup"]					= 4
	--银两不足提示面板
	self.panel_config["less_silver_tip_popup"]				= 4
	--后宫赏赐提示面板
	self.panel_config["shangci_tip_popup"]					= 4
	--图鉴面板
	self.panel_config["tujian_panel"]						= 4
	
	--炼化面板
	self.panel_config["lianhua_panel"]						= 4
	--炼化选择卡牌面板
	self.panel_config["lianhua_select"]						= 4
	--炼化商店面板
	self.panel_config["lianhua_shop"]						= 4
	
	--签到面板
	self.panel_config["qiandao_panel"]						= 4
	
	--月卡领取面板
	self.panel_config["monthCard_gift"]						= 4
	
	--定义面板信息
	self.predefine_panel_config = {}
	--[[--
		eg:
			self.predefine_panel_config["panel_name"] = 
			{
				["anchorPoint"] = {["x"] = x,["y"] = y}	--锚点
				,["position"] 	= {["x"] = x,["y"] = y}	--postion in container
				,["together"]	= {"name1","name2"}		--可以共同存在的面板的name table,nil 表示没有
				,["children"]	= {"name1","name2"}		--列举出所有可能的三级面板名，nil表示没有
				,["show"]		= string				--出现方式，暂时没有，nil表示没有
				,["hide"]		= string				--消失方式，暂时没有，nil表示没有
				,["isShow"]		= bool					--是否已经显示
				,["panel"]		= nil c++ object		--指向创建面板
				,["fill"]		= bool					--是否填充空白
				,["stop_touch"] = bool					--是否需要事件阻挡
				,["touch_panel"]= nil c++ object		--用于事件阻挡的面板
				,["is_stencil"] = bool					--是否需要半透明蒙板
				,["stencil_panel"]= nil c++ object		--用于半透明的面板
			}
	--]]--
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login_bg_panel
	-- 登陆背景面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login_bg_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = g_game.g_display.sizeInPixels.width/2,["y"] = g_game.g_display.sizeInPixels.height/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] server_list_panel
	-- 服务器列表panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["server_list_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login_choose_type
	-- 台湾版本登录选择panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login_choose_type"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login_shuru
	-- 登陆逻辑面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login_shuru_new"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login_shuru
	-- 登陆逻辑面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login_shuru"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login
	-- 登陆面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login_win_input
	-- windows版本登陆帐号输入
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login_win_input"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] login_create_role
	-- 创建角色面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["login_create_role"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] main_ui_top_left
	-- 主ui左上角面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["main_ui_top_left"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = 0}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] main_ui_top_right
	-- 主ui右上角面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["main_ui_top_right"] = 
	{
		["anchorPoint"] = {["x"] = 1,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH,["y"] = 0}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] main_ui_right_center
	-- 主ui右中面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["main_ui_right_center"] = 
	{
		["anchorPoint"] = {["x"] = 1,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] main_ui_left_center
	-- 主ui左中面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["main_ui_left_center"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] main_ui_right_bottom
	-- 主ui右中面板配置
	-------------------------------------------------------------------------------
	self.predefine_panel_config["main_ui_right_bottom"] = 
	{
		["anchorPoint"] = {["x"] = 1,["y"] = 0}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] jinluandian_bg
	-- 金銮殿界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["jinluandian_bg"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showZouzhangbuzu = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zouzhang_buzu_pop
	-- 奏章不足界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zouzhang_buzu_pop"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= {"baoji_popup_panel"}		--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showZouzhangbuzu						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	local showZouzhangReward = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zouzhang_reward_pop
	-- 奏章奖励界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zouzhang_reward_pop"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showZouzhangReward						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] baoji_popup_panel
	-- 批阅奏章获取银两和经验提示，暴击奖励
	-------------------------------------------------------------------------------
	self.predefine_panel_config["baoji_popup_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= {"zouzhang_buzu_pop"}		--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] mingchenxuanze_title
	-- 名臣选择
	-------------------------------------------------------------------------------
	self.predefine_panel_config["mingchenxuanze_title"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] genghuanzhenrong
	-- 名臣更换阵容
	-------------------------------------------------------------------------------
	self.predefine_panel_config["genghuanzhenrong"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] card_paibinghuangzi_top
	-- 排兵布阵，皇子督军 界面最底层
	-------------------------------------------------------------------------------
	self.predefine_panel_config["paibinghuangzi_top"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zhanyi_waikuang
	-- 小战役地图
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zhanyi_waikuang"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zhanyi_ditu_bg
	-- 战役地图
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zhanyi_ditu_bg"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] nanzhengbeitao_title
	-- 南征北讨
	-------------------------------------------------------------------------------
	self.predefine_panel_config["nanzhengbeitao_title"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] hougong_tangquangong_bg
	-- 美女宫  主图
	-------------------------------------------------------------------------------
	self.predefine_panel_config["hougong_tangquangong_bg"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] hougong_cefeng_bg
	-- 册封
	-------------------------------------------------------------------------------
	self.predefine_panel_config["hougong_cefeng_bg"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] meinvshuxing_title
	-- 美女详情
	-------------------------------------------------------------------------------
	self.predefine_panel_config["meinvshuxing_title"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] gongdou_bg
	-- 宫斗
	-------------------------------------------------------------------------------
	self.predefine_panel_config["gongdou_bg"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] meinvxuanze_title
	-- 美女选择title
	-------------------------------------------------------------------------------
	self.predefine_panel_config["meinvxuanze_title"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["meinv_promote_ui"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] chongxing_panel
	-- 宠幸panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["chongxing_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zhuanpan
	-- 宠幸转盘
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zhuanpan"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}

	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] huangzi_qianqinggong_top
	-- 皇子 养心殿
	-------------------------------------------------------------------------------
	self.predefine_panel_config["huangzi_qianqinggong_top"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	


	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zhandoujiemian_left_bottom
	-- 战斗场景，左下角面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zhandoujiemian_left_bottom"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 0}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	self.predefine_panel_config["zhandoujiemian_left_top"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zhandoujiemian_left_bottom
	-- 战斗场景，右上角面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zhandoujiemian_right_top"] = 
	{
		["anchorPoint"] = {["x"] = 1,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH,["y"] = 0}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zhandoujiemian_left_bottom
	-- 战斗场景，右下角面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zhandoujiemian_right_bottom"] = 
	{
		["anchorPoint"] = {["x"] = 1,["y"] = 0}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] qgyd_shengli
	-- pvp胜利界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["qgyd_shengli"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] bosswin
	-- boss胜利界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["bosswin"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] bosslose
	-- boss失败界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["bosslose"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] shengli
	-- 胜利界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["shengli"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] qgyd_shibai
	-- pvp失败界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["qgyd_shibai"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] shibai
	-- 失败界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["shibai"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] lueduo_result
	-- 掠夺结果界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["lueduo_result"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] quick_buy_panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["quick_buy_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] quick_use_panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["quick_use_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] moving_msg_panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["moving_msg_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT-15}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
--	-------------------------------------------------------------------------------
--	-- @function [parent=#FLuaPanelManager] exchange_reward
--	-------------------------------------------------------------------------------
--	local showExchangeReward = function(panel)
--		panel:setScale(0.1)
--		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
--		local action = CCEaseBounceOut:create(scaleTo)
--		panel:runAction(action)
--	end
	self.predefine_panel_config["exchange_reward"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] card_lv_up_panel
	-------------------------------------------------------------------------------
	self.predefine_panel_config["card_lv_up_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showRankInfo = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] world_boss_rank_info
	-------------------------------------------------------------------------------
	self.predefine_panel_config["world_boss_rank_info"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showRankInfo						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	
	local showSaoDang = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] saodang
	-------------------------------------------------------------------------------
	self.predefine_panel_config["saodang"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showSaoDang						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showSaoDangR = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] saodang_result
	-------------------------------------------------------------------------------
	self.predefine_panel_config["saodang_result"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] juezhan
	-- 决战界面
	-------------------------------------------------------------------------------
	local showJuezhan = function(panel)
		panel:setScale(0.0)
		
		local scaleTo = cc.ScaleTo:create(0.5, 1.0, 1.0)
		panel:runAction(cc.EaseElasticOut:create(scaleTo))
		
	end
	self.predefine_panel_config["juezhan"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showJuezhan				--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] 军机处
	-- 军机处
	-------------------------------------------------------------------------------
	self.predefine_panel_config["junjichu_title"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil				--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showFirstCharge = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.5, 1.0, 1.0)
		panel:runAction(cc.EaseBounceOut:create(scaleTo))
	end
	self.predefine_panel_config["public_first_charge_pop"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showFirstCharge						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	self.predefine_panel_config["stage_buy_challenge"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	

	self.predefine_panel_config["elite_stage_battle"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["elite_stage"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showPacDetail = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	self.predefine_panel_config["vip_detail_pac"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showPacDetail						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}

	--快速充值	
	local showQuickCharge = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	self.predefine_panel_config["quick_charge_ui"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showQuickCharge						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["mingchen_shengji"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
		
	self.predefine_panel_config["huangzi_xuanze"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}		
	self.predefine_panel_config["huangzishuxing_bg"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}		
	self.predefine_panel_config["huangzi_yuelongmen"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}	
	
	self.predefine_panel_config["huangzi_shangshufang"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["huangzi_zongrenfu"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["qgyd_bottom"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	

	self.predefine_panel_config["qgyd_gongjizhiduihuan"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] 总加成
	-------------------------------------------------------------------------------
	self.predefine_panel_config["card_zongjiacheng"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] 装备
	-- 装备界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["user_equip_bag_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] pve_emperor_lvup
	-- 皇帝升级
	-------------------------------------------------------------------------------
	self.predefine_panel_config["pve_emperor_lvup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	self.predefine_panel_config["story_stage_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["prince_change_name"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["rewardInfo"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["pve_reward_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] guo_qing
	-- 国情
	-------------------------------------------------------------------------------
	self.predefine_panel_config["guo_qing"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] 商城
	-- 商城界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["keju_xuanxiu_shangcheng"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["xuanxiu_qingdianshengzhi"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["xuanxiu"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["keju"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["shangcheng"] = 
	{
		["anchorPoint"] = {["x"] = 0,["y"] = 1}	--锚点
		,["position"] 	= {["x"] = 0,["y"] = CONFIG_SCREEN_HEIGHT}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["keju_qindiandachen"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["xuanxiu_qindianxiunv"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	self.predefine_panel_config["shangcheng_chongzhi"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["item_pop_up"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["qgyd_duihuan_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["skill_info_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["soldier_info_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	self.predefine_panel_config["vip"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	---------------------------------各种 公共提示板--------------------------------------
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] public_setting
	-------------------------------------------------------------------------------
	local showset = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	self.predefine_panel_config["public_setting"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showset						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] zozhang_result_view
	-------------------------------------------------------------------------------
	self.predefine_panel_config["zozhang_result_view"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] tax_result_view
	-------------------------------------------------------------------------------
	self.predefine_panel_config["tax_result_view"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] floating_popup_panel
	-- 提示板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["floating_popup_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}	
	
	
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] notice_popup_panel
	-- 提示板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["notice_popup_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] loadingjiemian
	-- loading界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["loadingjiemian"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] ui_loading
	-- loading界面
	-------------------------------------------------------------------------------
	self.predefine_panel_config["ui_loading"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] network_error_panel
	-- 服务器连接提示
	-------------------------------------------------------------------------------
	self.predefine_panel_config["network_error_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] gonggao_panel
	-- 公告
	-------------------------------------------------------------------------------
	self.predefine_panel_config["gonggao_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] mail_panel
	-- 邮箱
	-------------------------------------------------------------------------------
	self.predefine_panel_config["mail_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] reward_panel
	-- 奖励面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["reward_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] equip_detial_panel
	-- 装备详细面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["equip_detial_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] main_popup
	-- 主界面弹出菜单
	-------------------------------------------------------------------------------
	self.predefine_panel_config["main_popup"] = 
	{
		["anchorPoint"] = {["x"] = 1,["y"] = 0}	--锚点
		,["position"] 	= {["x"] = 750,["y"] = 635}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = false						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] effect_popup
	-- 特效弹出菜单
	-------------------------------------------------------------------------------
	self.predefine_panel_config["effect_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] mingchen_xiangqing
	-- 特效弹出菜单
	-------------------------------------------------------------------------------
	self.predefine_panel_config["mingchen_xiangqing"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showMailPop = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] mail_attachment
	-- 邮件附件
	-------------------------------------------------------------------------------
	self.predefine_panel_config["mail_attachment"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showMailPop						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	local showSellpopup = function(panel)
		panel:setScale(0.1)
		local scaleTo = cc.ScaleTo:create(0.3, 1.0, 1.0)
		local action = CCEaseBounceOut:create(scaleTo)
		panel:runAction(action)
	end
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] sell_popup
	-- 确认出售
	-------------------------------------------------------------------------------
	self.predefine_panel_config["sell_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= showSellpopup						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] sell_popup
	-- 确认出售
	-------------------------------------------------------------------------------
	self.predefine_panel_config["jin_jie"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}

	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] bing_fa
	-- 兵法
	-------------------------------------------------------------------------------
	self.predefine_panel_config["bing_fa"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] meinv_award_ui
	-- 美女赏赐
	-------------------------------------------------------------------------------
	self.predefine_panel_config["meinv_award_ui"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= {"hougong_tangquangong_bg"}	--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] open_service_ui
	-- 美女赏赐
	-------------------------------------------------------------------------------
	self.predefine_panel_config["open_service_ui"] =
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] lueduo_panel
	-- 掠夺面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["lueduo_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] xunfang_panel
	-- 寻访面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["xunfang_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] charge_reward_detail_panel
	-- 限时充值奖励,礼包详细内容面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["charge_reward_detail_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] xunfang_reward
	-- 寻访奖励
	-------------------------------------------------------------------------------
	self.predefine_panel_config["xunfang_reward"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] xunfang_reward_detial
	-- 寻访奖励详情
	-------------------------------------------------------------------------------
	self.predefine_panel_config["xunfang_reward_detial"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
		-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] rank_reward_detial
	-- 排名奖励详情
	-------------------------------------------------------------------------------
	self.predefine_panel_config["rank_reward_detial"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
		-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] choujiang_rank
	-- 抽奖排行榜
	-------------------------------------------------------------------------------
	self.predefine_panel_config["choujiang_rank"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
			-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] rank_shop
	-- 积分商店
	-------------------------------------------------------------------------------
	self.predefine_panel_config["rank_shop"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] leaderboard
	-- 排行榜
	-------------------------------------------------------------------------------
	self.predefine_panel_config["leaderboard"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] choujiang_reward
	-- 抽奖奖励
	-------------------------------------------------------------------------------
	self.predefine_panel_config["choujiang_reward"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] jump_tip_popup
	-- 跳转提示弹出面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["jump_tip_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] birth_tip_popup
	-- 元宝产子提示面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["birth_tip_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] less_silver_tip_popup
	-- 银两不足提示面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["less_silver_tip_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] lianhua_panel
	-- 炼化面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["lianhua_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] shangci_tip_popup
	-- 后宫赏赐提示面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["shangci_tip_popup"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] tujian_panel
	-- 图鉴面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["tujian_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] lianhua_select
	-- 炼化选择卡牌面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["lianhua_select"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
		-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] lianhua_shop
	-- 炼化商店面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["lianhua_shop"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= true						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = false						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] qiandao_panel
	-- 签到面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["qiandao_panel"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
	-------------------------------------------------------------------------------
	-- @function [parent=#FLuaPanelManager] monthCard_gift
	-- 月卡领取面板
	-------------------------------------------------------------------------------
	self.predefine_panel_config["monthCard_gift"] = 
	{
		["anchorPoint"] = {["x"] = 0.5,["y"] = 0.5}	--锚点
		,["position"] 	= {["x"] = CONFIG_SCREEN_WIDTH/2,["y"] = CONFIG_SCREEN_HEIGHT/2}		--postion in container
		,["together"]	= nil						--可以共同存在的面板的name table
		,["children"]	= nil						--列举出所有可能的三级面板名
		,["show"]		= nil						--出现方式，暂时没有
		,["hide"]		= nil						--消失方式，暂时没有
		,["isShow"]		= false						--初始化未显示
		,["panel"]		= nil						--初始化为空
		,["fill"]		= false						--是否填充空白
		,["stop_touch"] = true						--是否需要事件阻挡
		,["touch_panel"]= nil						--用于事件阻挡的面板
		,["is_stencil"] = true						--是否需要半透明蒙板
		,["stencil_panel"]= nil 					--用于半透明的面板
	}
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] create_panel
-- 根据panel名称，创建面板
-------------------------------------------------------------------------------
function FLuaPanelManager:create_panel(panelName)
    local pre="create"
    local myfunction=pre..panelName
    local panelTable=_G[myfunction]()    
    panelTable["panel_layer_config"]  = self.panel_config[panelName]    
    return panelTable
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] createFillPanelContainer
-- ui弹出面板后，用于填充边缘得面板
-------------------------------------------------------------------------------
function FLuaPanelManager:createFillPanelContainer()
	self.panel_show_count = 0
	
	
	self.fill_panel_container = require ("scripts.extend.fluaautoscalepanel").new();
    
    self.fill_panel_container:bindSize(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT);
    self.fill_panel_container:bindPos(self.fill_panel_container.MIDDLE_MIDDLE)
    
    g_game.g_director:getRunningScene():add_panel_to_layer(self.fill_panel_container, self.panel_config["fill_panel_container"])
	
	
	
	local fill_image_panel = require("scripts.extend.f_lua_fill_ground_panel").new() 
 
	self.fill_panel_container:appendComponent(fill_image_panel)
	
	fill_image_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))
	
	fill_image_panel:setAnchorPoint(cc.p(0.5, 0.5))
	fill_image_panel:setPosition(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))

	fill_image_panel:createFillPanel()
	self.fill_panel_container:setVisible(false)
	self.fill_panel_container:enableClipping(false)
end



-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] createPanelContainer
-- ui弹出面板的容器，autoSizePanel的创建
-------------------------------------------------------------------------------
function FLuaPanelManager:createPanelContainer()
	
    self.parent_panel_container = require ("scripts.extend.fluaautoscalepanel").new();
    
    self.parent_panel_container:bindSize(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT);
    self.parent_panel_container:bindPos(self.parent_panel_container.MIDDLE_MIDDLE)
    
    g_game.g_director:getRunningScene():add_panel_to_layer(self.parent_panel_container, self.panel_config["parent_panel_container"])

	self:createFillPanelContainer()--先创建填充面板
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] showEffect
-- 文字特效
-------------------------------------------------------------------------------
function FLuaPanelManager:showEffect(index)
	if self:isUiPanelShow("effect_popup") then
		return
	end
	require("scripts.game.main.common.f_common_effect_popup")
	local panel = f_common_effect_popup.static_create()
	panel:panelInitBeforePopup(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[index])
	g_game.g_panelManager:showUiPanel(panel, "effect_popup")
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] showUpgradeEffect
-- 文字特效
-------------------------------------------------------------------------------
function FLuaPanelManager:showUpgradeEffect(index, image, q)
	if self:isUiPanelShow("effect_popup") then
		return
	end
	require("scripts.game.main.common.f_common_effect_popup")
	local panel = f_common_effect_popup.static_create()
	panel:panelInitBeforePopup(g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[2], g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[index])
	panel:showClose()
	if image ~= nil then
		panel:setEquip(image, q)
	end
	g_game.g_panelManager:showUiPanel(panel, "effect_popup")
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] showUiPanel
-- 显示ui面板
-------------------------------------------------------------------------------
function FLuaPanelManager:showUiPanel(panel,name)
	if self.predefine_panel_config[name] == nil or panel == nil or self:isUiPanelShow(name) then
		echo("the panel config is nil ",name)
	end

	--移除面板上能与他共存的面板以外的其他面板	
	local panelConfig = self.predefine_panel_config[name]
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_MAINUI)
	--添加蒙板
	if panelConfig["is_stencil"] == true then
	    local layer_color_panel		= require("scripts.extend.f_lua_color_layer").new()
	    self.parent_panel_container:appendComponent(layer_color_panel)
	    layer_color_panel:setAnchorPoint(cc.p(0.5, 0.5))
		layer_color_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
		
	    panelConfig["stencil_panel"] = layer_color_panel
	end
	
	
	--添加面板，显示面板
	if panelConfig["stop_touch"] == true then	
	    local touch_stop_panel = fc.FContainerPanel:create()
	    touch_stop_panel:setSize(cc.size(g_game.g_real_size.width*5, g_game.g_real_size.height*5))
	    self.parent_panel_container:appendComponent(touch_stop_panel)
	    touch_stop_panel:setAnchorPoint(cc.p(0.5, 0.5))
	    touch_stop_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	    touch_stop_panel:setStopTouchEvent(true) 
	    touch_stop_panel:setScale(5.0)
	    
	    
		self.parent_panel_container:appendComponent(panel)
		panel:setAnchorPoint(cc.p(panelConfig["anchorPoint"]["x"],panelConfig["anchorPoint"]["y"]))	
		panel:setPositionInContainer(cc.p(panelConfig["position"]["x"],panelConfig["position"]["y"]))
		
	    panelConfig["touch_panel"] = touch_stop_panel
	else
		self.parent_panel_container:appendComponent(panel)
		panel:setAnchorPoint(cc.p(panelConfig["anchorPoint"]["x"],panelConfig["anchorPoint"]["y"]))	
		panel:setPositionInContainer(cc.p(panelConfig["position"]["x"],panelConfig["position"]["y"]))
	end
	
	
	self.predefine_panel_config[name]["panel"] = panel
	
	if self.predefine_panel_config[name]["show"] ~= nil then
		self.predefine_panel_config[name]["show"](self.predefine_panel_config[name]["panel"])
	end
	
	if self.predefine_panel_config[name]["fill"] == true then
		if self.panel_show_count < 1 then
			self.fill_panel_container:setVisible(true)
		end
		self.panel_show_count = self.panel_show_count + 1
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] removeUiPanel
-- 面板移除
-------------------------------------------------------------------------------
function FLuaPanelManager:removeUiPanel(name)
	if self.predefine_panel_config[name] == nil then
		echo("the panel config is nil ",name);
	end

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFRESH_MAINUI)
	
	if not self:isUiPanelShow(name) then
		return 
	end
	
	local removeCallback = function()	
		if self.predefine_panel_config[name]["stop_touch"] == true then		
			self.parent_panel_container:deleteComponent(self.predefine_panel_config[name]["panel"])
			self.predefine_panel_config[name]["panel"] = nil
			
			self.parent_panel_container:deleteComponent(self.predefine_panel_config[name]["touch_panel"])
			self.predefine_panel_config[name]["touch_panel"] = nil		
		else
			self.parent_panel_container:deleteComponent(self.predefine_panel_config[name]["panel"])
			self.predefine_panel_config[name]["panel"] = nil
		end	
		
		if self.predefine_panel_config[name]["is_stencil"] == true then			
			self.parent_panel_container:deleteComponent(self.predefine_panel_config[name]["stencil_panel"])
			self.predefine_panel_config[name]["stencil_panel"] = nil				
		end
	end
	
	--移除所有由这个面板衍生出来的下一级面板	
	if self.predefine_panel_config[name]["hide"] ~= nil then
		self.predefine_panel_config[name]["hide"](self.predefine_panel_config[name]["panel"], removeCallback)
	else	
		removeCallback()
	end
	
	if self.predefine_panel_config[name]["fill"] == true then
		self.panel_show_count = self.panel_show_count - 1
		
		if self.panel_show_count < 1 then
			self.fill_panel_container:setVisible(false)
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] removeAllUiPanel
-- 移除所有弹出面板
-------------------------------------------------------------------------------
function FLuaPanelManager:removeAllUiPanel()
	for name,panel in pairs(self.predefine_panel_config) do
		if self:isUiPanelShow(name) then
			self:removeUiPanel(name)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] hasAnyPanel
-- 是否有面板
-------------------------------------------------------------------------------
function FLuaPanelManager:hasAnyPanel()
	local count = 0
	for k, v in pairs(self.predefine_panel_config) do
		if v["panel"] ~= nil then
			return true
		end
	end
	return false
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] isUiPanelShow
-- 判断面板是否已经显示
-------------------------------------------------------------------------------
function FLuaPanelManager:isUiPanelShow(name)
	local panel = self.predefine_panel_config[name]["panel"]
	if panel == nil then
		return false
	end
	return true
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] getUiPanel
-- 根据面板名称获取面板实例
-------------------------------------------------------------------------------
function FLuaPanelManager:getUiPanel(name)
	return self.predefine_panel_config[name]["panel"]
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] setAllPanelsVisible
-- 设置所有面板是否显示
-------------------------------------------------------------------------------
function FLuaPanelManager:setAllPanelsVisible(b)
	if self.parent_panel_container ~= nil then
		self.parent_panel_container:setVisible(b)
	end
	if self.fill_panel_container ~= nil then
		self.fill_panel_container:setVisible(false)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaPanelManager] resetAllPanelConfig
-- 重置所有panel配置
-------------------------------------------------------------------------------
function FLuaPanelManager:resetAllPanelConfig()
	for k, v in pairs(self.predefine_panel_config) do
		v["panel"] = nil
		v["touch_panel"] = nil
	end

	self.parent_panel_container = nil
	self.fill_panel_container = nil
end

return FLuaPanelManager