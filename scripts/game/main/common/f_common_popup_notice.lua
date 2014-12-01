require("scripts.auto.auto_public_popup1")
require("scripts.auto.auto_public_popup3")
require("scripts.auto.auto_hougong_suipian")
require("scripts.auto.auto_hougong_youxi")
require("scripts.auto.auto_public_popup2")
require("scripts.auto.auto_hougong_huaiyunjibao")
require("scripts.auto.auto_public_network_error_pop")
require("scripts.auto.auto_hougong_tishi")
require("scripts.auto.auto_qgyd_duishouxiangqing")
require("scripts.auto.auto_hougong_jiaoyu")
require("scripts.game.main.common.f_common_floating_notice")
--[[
	弹出提示板
]]--

local f_common_popup_notice = class("f_common_popup_notice", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_common_popup_notice")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_common_popup_notice:ctor()
    self:registerNodeEvent()   
    
  	self.m_noticeTable = nil
  	self.m_actionPanel = nil
  	
	self.NOTICE_TYPE_NONE = 0
	--弃妃 提示板
	self.NOTICE_TYPE_QIFEI = 1
	--册封时 提示 妃位已满
	self.NOTICE_TYPE_CEFENG_TEST = 2
	--提示皇上精力不足
	self.NOTICE_TYPE_JINGLI_NOTENOUGH = 5
	--提示美女兴趣点不足
	self.NOTICE_TYPE_BEAUTY_XINGQUDIAN_NOTENOUGH = 6
	--提示美女宠幸奖励教育点
	self.NOTICE_TYPE_REWARD_EDUCATION = 7
	--提示美女奖励美女
	self.NOTICE_TYPE_REWARD_BEAUTY = 8
	--提示美女奖励装备
	self.NOTICE_TYPE_REWARD_EQUIP = 9
	--提示美女奖励皇子
	self.NOTICE_TYPE_REWARD_SON = 10
	--教育皇子成功升级
	self.NOTICE_TYPE_PRINCE_LV_UP = 11
	--宗人府吞卡升级
	self.NOTICE_TYPE_PRINCE_ZONGRENFU = 12
	--名臣吞卡升级
	self.NOTICE_TYPE_MINGCHEN_SHENGJI = 13
	--美女正在怀孕中弹出 时间戳板
	self.NOTICE_TYPE_IN_PREGNANT = 21
	--弹出诞生皇子面板
	self.NOTICE_TYPE_GET_BORN_PRINCE = 22
	--弹出网络异常面板
	self.NOTICE_TYPE_NETWORK_ERROR = 23
	--弹出宫斗吞卡 提示三星卡牌面板
	self.NOTICE_TYPE_ISEATEN_BEAUTY_ABOVE_LV3 = 24
	--弹出吞卡升级成功面板
	self.NOTICE_TYPE_BEAUTY_LVUP_SUCCESS = 25
	--千古一帝弹出对手详情面板
	self.NOTICE_TYPE_PLAYER_DETAIL		= 26
	
	self.NOTICE_TYPE_ISEATEN_OFFICER_ABOVE_LV3 = 27
	self.NOTICE_TYPE_ISEATEN_PRINCE_ABOVE_LV3 = 28
	self.NOTICE_TYPE_XUNFANG= 29
	self.NOTICE_TYPE_TAX_ASK= 30
	
	self.NOTICE_TYPE_SELL_BEAUTY_LV3 = 31 
	self.NOTICE_TYPE_SELL_OFFICER_LV3 = 32
	self.m_noticeType = self.NOTICE_TYPE_NONE
	
	--所有创建函数放到这个table里
	self.m_createTable = {}
	
	local createMainPopup = function()
		self:createMainPopup()
	end
	
	local createMainPopup3 = function()
		self:createMainPopup3()
	end
	
	self.m_createTable[self.NOTICE_TYPE_XUNFANG] = createMainPopup3
	--亲密度不足提示 ，美女兴趣点不足提示  ，皇子教育升级提示 ，提示奖励教育点  弃妃 ，册封是否弃妃板  公用一个板
	self.m_createTable[self.NOTICE_TYPE_QIFEI] = createMainPopup3
	self.m_createTable[self.NOTICE_TYPE_TAX_ASK] = createMainPopup3
	self.m_createTable[self.NOTICE_TYPE_CEFENG_TEST] = createMainPopup
	self.m_createTable[self.NOTICE_TYPE_JINGLI_NOTENOUGH] = createMainPopup
	self.m_createTable[self.NOTICE_TYPE_BEAUTY_XINGQUDIAN_NOTENOUGH] = createMainPopup
	
	self.m_createTable[self.NOTICE_TYPE_PRINCE_LV_UP] = createMainPopup
	self.m_createTable[self.NOTICE_TYPE_PRINCE_ZONGRENFU] = createMainPopup 
	self.m_createTable[self.NOTICE_TYPE_MINGCHEN_SHENGJI] = createMainPopup
	self.m_createTable[self.NOTICE_TYPE_BEAUTY_LVUP_SUCCESS] = createMainPopup
	
	
	local createRewardEducationPopup = function()
		self:createRewardEducationPopup()
	end
	self.m_createTable[self.NOTICE_TYPE_REWARD_EDUCATION] = createRewardEducationPopup
	
	local createRewardBeautyPopup = function()
		self:createRewardBeautyPopup()
	end
	--奖励美女界面， 奖励装备碎片界面
	self.m_createTable[self.NOTICE_TYPE_REWARD_BEAUTY] = createRewardBeautyPopup
	self.m_createTable[self.NOTICE_TYPE_REWARD_EQUIP] = createRewardBeautyPopup
	
	local createRewardPrincePopup = function()
		self:createRewardPrincePopup()
	end
	--奖励皇子弹出板
	self.m_createTable[self.NOTICE_TYPE_REWARD_SON] = createRewardPrincePopup
	
	--美女怀孕  弹出时间戳
	local createInPregnantPopup = function()
		self:createInPregnantPopup()
	end
	self.m_createTable[self.NOTICE_TYPE_IN_PREGNANT] = createInPregnantPopup
	
	--诞生皇子面板
	local createGetBornPrince = function()
		self:createGetBornPricePopup()
	end
	self.m_createTable[self.NOTICE_TYPE_GET_BORN_PRINCE] = createGetBornPrince
	
	local createNetworkError = function()
		self:createNetworkErrorPopup()
	end
	self.m_createTable[self.NOTICE_TYPE_NETWORK_ERROR] = createNetworkError
	
	--弹出宫斗时 当吞卡中含有三星卡牌时的面板
	local createEatenBeautyAbove3 = function()
		self:createEatenBeautyAbove3Popup()
	end
	self.m_createTable[self.NOTICE_TYPE_ISEATEN_BEAUTY_ABOVE_LV3] = createEatenBeautyAbove3
	
	--弹出遣散美女 当吞卡中含有三星卡牌时的面板
	local createSellBeautyAbove3 = function()
		self:createSellBeautyAbove3()
	end
	self.m_createTable[self.NOTICE_TYPE_SELL_BEAUTY_LV3] = createSellBeautyAbove3
	
	--名臣升级吞卡3级以上提示
	local createSellOfficerAbove3 = function()
		self:createSellOfficerAbove3()
	end
	self.m_createTable[self.NOTICE_TYPE_SELL_OFFICER_LV3] = createSellOfficerAbove3
	
	--名臣升级吞卡3级以上提示
	local createEatenOfficerAbove3 = function()
		self:createEatenOfficerAbove3Popup()
	end
	self.m_createTable[self.NOTICE_TYPE_ISEATEN_OFFICER_ABOVE_LV3] = createEatenOfficerAbove3
	
	--皇子升级吞卡3级以上提示
	local createEatenPrinceAbove3 = function()
		self:createEatenPrinceAbove3Popup()
	end
	self.m_createTable[self.NOTICE_TYPE_ISEATEN_PRINCE_ABOVE_LV3] = createEatenPrinceAbove3
	
	--弹出 千古一帝查看玩家信息板
	local createPlayerDetail = function()
		self:createPlayerDetailPopup()
	end
	self.m_createTable[self.NOTICE_TYPE_PLAYER_DETAIL] = createPlayerDetail
		
	self.m_yesCallBack = nil
	self.m_noCallBack = nil
	self.m_closeCallBack = nil
	
	--主标题
	self.m_title = nil
	--第一main content
	self.m_content1 = nil
	--第二main content
	self.m_content2 = nil
	--notice需要显示的 image
	self.m_noticeImage = nil
	
	--需要传递的一些 额外的数据
	self.m_extraData = nil
	
	self.ACTION_NONE = 0
	self.ACTION_SCALE = 1
	--notice 显示时候的 动画 action type
	self.m_actionType = self.ACTION_NONE
	self.m_createActionTable = {}
	
	local createScaleAction = function()
		self:createScaleAction()
	end
	self.m_createActionTable[self.ACTION_SCALE] = createScaleAction
	
	self.m_isAlreadyCreate = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_common_popup_notice:onEnter()   	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_POPUP)
	self.m_inputText = ""
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] popUpNotice
-- 弹出提示面板
-------------------------------------------------------------------------------
function f_common_popup_notice:popUpNotice(type)
	if self.m_isAlreadyCreate then
		return
	end
	
	self.m_noticeType = type
	
	if self.m_createTable[self.m_noticeType] ~= nil then
		self.m_createTable[self.m_noticeType]()
	end
	
	self.m_isAlreadyCreate = true
end

--------------------------------action------------------------------------

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setActionType
-- 设置弹出板的 动画 类型
-------------------------------------------------------------------------------
function f_common_popup_notice:setActionType(type)
	if self.m_actionType == type then
		return 
	end
	self.m_actionType = type
	
	if self.m_createActionTable[self.m_actionType] ~= nil then
		self.m_createActionTable[self.m_actionType]()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createScaleAction
-- 创建scale action
-------------------------------------------------------------------------------
function f_common_popup_notice:createScaleAction()
	self.m_actionPanel:setScale(0.1)
	
	local actionTo = CCScaleTo:create(0.5,1)
	self.m_actionPanel:runAction(cc.EaseBounceOut:create(actionTo))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setNoticeContent
-- 设置面板的内容  title  content1 content2 image
-------------------------------------------------------------------------------
function f_common_popup_notice:setNoticeContent(title,content1,content2,image)
	if title ~= nil then
		self.m_title = title
	end
	
	if content1 ~= nil then
		self.m_content1 = content1
	end
	
	if content2 ~= nil then
		self.m_content2 = content2
	end
	
	if image ~= nil then
		self.m_noticeImage = image
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setStarLevel
-- 设置面板上的星级
-------------------------------------------------------------------------------
function f_common_popup_notice:setStarLevel(star)
	for i = 1, 5 do
		if i <= star then
			self.m_noticeTable["star" .. i]:setImage("batch_ui/xingxing.png")
		else
			self.m_noticeTable["star" .. i]:setImage("batch_ui/xingxing_dark.png")
		end
	end
	
	if self.m_noticeTable["hg_sp_quality_image"] ~= nil then
		self.m_noticeTable["hg_sp_quality_image"]:setImage(g_game.g_f_quality_image[star])
		self.m_noticeTable["hg_sp_quality_image"]:setSize(cc.size(104,104))
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setNoticeExtraData
-- 设置面板 额外的一些内容
-------------------------------------------------------------------------------
function f_common_popup_notice:setNoticeExtraData(data)
	self.m_extraData = data
end

----------------------------各种创建 弹出板的方法---------------------------------------
-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createRewardEducationPopup
-------------------------------------------------------------------------------
function f_common_popup_notice:createRewardEducationPopup()

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_jiaoyu()

	self.m_actionPanel = self.m_noticeTable["hougong_jiaoyu_bottom"]

    local panel = self.m_noticeTable["hougong_jiaoyu"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    
    self.m_noticeTable["hyyx_num_jiaoyu"]:setString(self.m_content1)
    
    panel:setStopTouchEvent(true)
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_noticeTable["hgjy_queding_btn"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createMainPopup3
-------------------------------------------------------------------------------
function f_common_popup_notice:createMainPopup3()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createpublic_popup3()

	self.m_actionPanel = self.m_noticeTable["pp3_bottom"]

    local panel = self.m_noticeTable["public_popup3"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    
    panel:setStopTouchEvent(true)
    
    self.m_noticeTable["pp3_label1"]:setString(self.m_title)
    
    if self.m_content1 ~= nil then
    	self.m_noticeTable["pp3_label2"]:setVisible(true)
   	 	self.m_noticeTable["pp3_label2"]:setWidth(250)
    	self.m_noticeTable["pp3_label2"]:setString(self.m_content1)
    else
    	self.m_noticeTable["pp3_label2"]:setVisible(false)
    end
   
    self.m_noticeTable["pp3_label3"]:setAlignment(1)
    
    if self.m_content2 ~= nil then
    	self.m_noticeTable["pp3_label3"]:setVisible(true)
    	self.m_noticeTable["pp3_label3"]:setString(self.m_content2)
    else
    	self.m_noticeTable["pp3_label3"]:setVisible(false)
    end
    
    local noticeClose = function()
		self:noticeCloseEvent()
	end	
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	self.m_noticeTable["no_btn"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["yes_btn"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createMainPopup
-- 创建公共弹出板
-------------------------------------------------------------------------------
function f_common_popup_notice:createMainPopup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createpublic_popup1()

	self.m_actionPanel = self.m_noticeTable["public_popup_bottom"]

    local panel = self.m_noticeTable["public_popup1"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    
    panel:setStopTouchEvent(true)
    
    self.m_noticeTable["public_popup_flabel_title"]:setString(self.m_title)
    
    if self.m_content1 ~= nil then
   	 	 self.m_noticeTable["public_popup_flabel_content1"]:setWidth(300)
    	 self.m_noticeTable["public_popup_flabel_content1"]:setString(self.m_content1)
    end
   
    self.m_noticeTable["public_popup_flabel_content2"]:setAlignment(1)
    
    if self.m_content2 ~= nil then
    	self.m_noticeTable["public_popup_flabel_content2"]:setString(self.m_content2)
    end
    
    local noticeClose = function()
		self:noticeCloseEvent()
	end	
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
--	self.m_noticeTable["public_popup_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["public_popup_yes_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	self:setTitleVisible()
end

function f_common_popup_notice:setTitleVisible()
	if self.m_noticeType ==  self.NOTICE_TYPE_MINGCHEN_SHENGJI or
		self.m_noticeType == self.NOTICE_TYPE_BEAUTY_LVUP_SUCCESS or
		self.m_noticeType == self.NOTICE_TYPE_PRINCE_LV_UP or
		self.m_noticeType == self.NOTICE_TYPE_PRINCE_ZONGRENFU then
		self.m_noticeTable["public_popup_flabel_title"]:setVisible(false)
		self.m_noticeTable["pp1title_panel"]:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createRewardBeautyPopup
-- 创建奖励美女的弹出
-------------------------------------------------------------------------------
function f_common_popup_notice:createRewardBeautyPopup()
	
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
						
	self.m_noticeTable = createhougong_suipian()
	self.m_noticeTable["hg_sp_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self.m_actionPanel = self.m_noticeTable["hg_sp_bottom_panel"]
	
    local panel = self.m_noticeTable["hougong_suipian"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    local call = function()
    end
    self.m_noticeTable["hg_sp_huode_suipian_label"]:setComplexString(g_game.g_utilManager:getEncodeString(self.m_content1, cc.c3b(91,24,6)), call)
    
    if self.m_noticeImage ~= nil then
	    self.m_noticeTable["hg_sp_suipian_image"]:setImage(self.m_noticeImage)
	    self.m_noticeTable["hg_sp_suipian_image"]:setSize(cc.size(90,90))
    end
    
    local noticeClose = function()
		self:noticeCloseEvent()
	end	
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	self.m_noticeTable["hg_sp_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_sp_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_common_popup_notice:setFlagImage(type)
	if self.m_noticeTable["hg_flag_image"] == nil then
		return 
	end
	
	if type == 1 or type == 2 then
		local flag = fc.FExtensionsImage:create()
	    flag:setImage("batch_ui/hunpi_biaozhi.png")
	    flag:setSize(cc.size(42,61))
	    flag:setAnchorPoint(cc.p(0.5,0.5))
	    self.m_noticeTable["hg_sp_bottom_panel"]:appendComponent(flag)
	    flag:setPositionInContainer(cc.p(298,231))
	elseif type == 3 or type == 4 then
		local flag = fc.FExtensionsImage:create()
	    flag:setImage("batch_ui/suipian_junjichu.png")
	    flag:setSize(cc.size(70,55))
	    flag:setAnchorPoint(cc.p(0.5,0.5))
	    self.m_noticeTable["hg_sp_bottom_panel"]:appendComponent(flag)
	    flag:setPositionInContainer(cc.p(298,231))
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createRewardPrincePopup
-- 创建奖励皇子的弹出
-------------------------------------------------------------------------------
function f_common_popup_notice:createRewardPrincePopup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_youxi()

	self.m_actionPanel = self.m_noticeTable["hg_yx_bottom_panel"]
	
    local panel = self.m_noticeTable["hougong_youxi"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    local call = function()
    end
    
    if LANGUAGE_TYPE == 3 then
	    self.m_noticeTable["hg_yx_laibao_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[91,24,6]太醫院來報：[206,53,0]娘娘有喜了！", cc.c3b(91,24,6)), call)
    else
	    self.m_noticeTable["hg_yx_laibao_label"]:setComplexString(g_game.g_utilManager:getEncodeString("[91,24,6]太医院来报：[206,53,0]娘娘有喜了！", cc.c3b(91,24,6)), call)
    end
    
    local noticeClose = function()
		self:noticeCloseEvent()
	end	
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_noticeTable["hg_yx_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_noticeTable["hg_yx_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_yx_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createInPregnantPopup
-- 创建怀孕时间戳的 板
-------------------------------------------------------------------------------
function f_common_popup_notice:createInPregnantPopup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createpublic_popup2()

	self.m_actionPanel = self.m_noticeTable["public_popup2_bottom_panel"]
	
    local panel = self.m_noticeTable["public_popup2"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    self.m_noticeTable["jld_zztc_fenfu_label"]:setString(self.m_content1)
    self.m_noticeTable["public_popup2_content1_label"]:setString(self.m_content2)
    
    self.m_noticeTable["bling_panel"]:setVisible(false) 
    
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	self.m_noticeTable["popup2_yes_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local result = g_game.g_userInfoManager:getPregnantTimeResult()
	self.m_targetSec = result["remainTime"]
	self.m_time = 0
	
	self.STATE_COUNTING = 0
	self.STATE_ENDING = 1
	self.STATE_NONE = 3
	
	if self.m_targetSec == 0 then
		self.m_state = self.STATE_ENDING
	else
		self.m_state = self.STATE_COUNTING
	end
	
	--注册更新的update time
	g_game.g_gameManager:addUpdateObj(self)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createGetBornPricePopup
-- 创建获得出生皇子的 急报
-------------------------------------------------------------------------------
function f_common_popup_notice:createGetBornPricePopup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_huaiyunjibao()
	
	self.m_actionPanel = self.m_noticeTable["hg_hy_bottom_panel"]
	
    local panel = self.m_noticeTable["hougong_huaiyunjibao"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    self.m_noticeTable["hg_hy_shuru_input"]:setPositionInContainer(cc.p(268,356))
    self.m_noticeTable["hg_hy_shuru_input"]:setReturnType(1)
    
    self.m_noticeTable["hg_gongxi_word_label"]:setString(self.m_content1)
    
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	self.m_princeName = ""
	
	self.m_noticeTable["hg_hy_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createNetworkError
-- 创建网络出错弹出板
-------------------------------------------------------------------------------
function f_common_popup_notice:createNetworkErrorPopup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createpublic_network_error_pop()

	self.m_actionPanel = self.m_noticeTable["pop_bottom_panel"]
	
    local panel = self.m_noticeTable["public_network_error_pop"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    self.m_noticeTable["pnep_pop_notice_label"]:setString(self.m_content1)
    
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_noticeTable["pop_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createSellBeautyAbove3
-- 创建遣散3级美女时
-------------------------------------------------------------------------------
function f_common_popup_notice:createSellBeautyAbove3()

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_tishi()
	
	self.m_actionPanel = self.m_noticeTable["hg_tishi_bottom_panel"]
	
	local panel = self.m_noticeTable["hougong_tishi"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    
    local noticeClose = function()
		self:noticeNoEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_noticeTable["hg_tishi_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_tishi_quxiao_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local isNoticeAgainCallback = function()
		if self.m_noticeTable["hg_tishi_check_box"]:isCheckBoxSelectYes() then
			g_game.g_userInfoManager.m_isPopupSell = false
		else
			g_game.g_userInfoManager.m_isPopupSell = true
		end
	end
	self.m_noticeTable["hg_tishi_check_box"]:addHandleOfcomponentEvent(isNoticeAgainCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createEatenBeautyAbove3Popup
-- 创建当吞卡中含有3级以上的卡时的弹出
-------------------------------------------------------------------------------
function f_common_popup_notice:createEatenBeautyAbove3Popup()

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_tishi()
	
	self.m_actionPanel = self.m_noticeTable["hg_tishi_bottom_panel"]
	
	local panel = self.m_noticeTable["hougong_tishi"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    
    local noticeClose = function()
		self:noticeNoEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_noticeTable["hg_tishi_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_tishi_quxiao_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local isNoticeAgainCallback = function()
		if self.m_noticeTable["hg_tishi_check_box"]:isCheckBoxSelectYes() then
			g_game.g_userInfoManager.m_isPopupEaten = false
		else
			g_game.g_userInfoManager.m_isPopupEaten = true
		end
	end
	self.m_noticeTable["hg_tishi_check_box"]:addHandleOfcomponentEvent(isNoticeAgainCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createSellOfficerAbove3
-------------------------------------------------------------------------------
function f_common_popup_notice:createSellOfficerAbove3()

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_tishi()
	
	self.m_actionPanel = self.m_noticeTable["hg_tishi_bottom_panel"]
	
	local panel = self.m_noticeTable["hougong_tishi"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    local noticeClose = function()
		self:noticeNoEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_noticeTable["hg_tishi_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_tishi_quxiao_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local isNoticeAgainCallback = function()
		if self.m_noticeTable["hg_tishi_check_box"]:isCheckBoxSelectYes() then
			g_game.g_userInfoManager.m_isPopMingchenSell = false
		else
			g_game.g_userInfoManager.m_isPopMingchenSell = true
		end
	end
	self.m_noticeTable["hg_tishi_check_box"]:addHandleOfcomponentEvent(isNoticeAgainCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
end


-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createEatenOfficerAbove3Popup
-- 创建当吞卡中含有3级以上的名臣卡时的弹出
-------------------------------------------------------------------------------
function f_common_popup_notice:createEatenOfficerAbove3Popup()

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_tishi()
	
	self.m_actionPanel = self.m_noticeTable["hg_tishi_bottom_panel"]
	
	local panel = self.m_noticeTable["hougong_tishi"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    local noticeClose = function()
		self:noticeNoEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_noticeTable["hg_tishi_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_tishi_quxiao_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local isNoticeAgainCallback = function()
		if self.m_noticeTable["hg_tishi_check_box"]:isCheckBoxSelectYes() then
			g_game.g_userInfoManager.m_isPopMingchenShengjiSanxing = false
		else
			g_game.g_userInfoManager.m_isPopMingchenShengjiSanxing = true
		end
	end
	self.m_noticeTable["hg_tishi_check_box"]:addHandleOfcomponentEvent(isNoticeAgainCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createEatenPrinceAbove3Popup
-- 创建当吞卡中含有3级以上的皇子卡时的弹出
-------------------------------------------------------------------------------
function f_common_popup_notice:createEatenPrinceAbove3Popup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createhougong_tishi()
	
	self.m_actionPanel = self.m_noticeTable["hg_tishi_bottom_panel"]
	
	local panel = self.m_noticeTable["hougong_tishi"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)
    
    local noticeClose = function()
		self:noticeNoEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_noticeTable["hg_tishi_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_noticeTable["hg_tishi_quxiao_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["hg_tishi_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local isNoticeAgainCallback = function()
		if self.m_noticeTable["hg_tishi_check_box"]:isCheckBoxSelectYes() then
			g_game.g_userInfoManager.m_isPopZongrenfuSanxing = false
		else
			g_game.g_userInfoManager.m_isPopZongrenfuSanxing = true
		end
	end
	self.m_noticeTable["hg_tishi_check_box"]:addHandleOfcomponentEvent(isNoticeAgainCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] createPlayerDetailPopup
-- 创建player detail popup 弹出
-------------------------------------------------------------------------------
function f_common_popup_notice:createPlayerDetailPopup()
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	self.m_noticeTable = createqgyd_duishouxiangqing()
	
	self.m_actionPanel = self.m_noticeTable["qgyd_duishouxiangqing_bottom"]
	
	local panel = self.m_noticeTable["qgyd_duishouxiangqing"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    panel:setStopTouchEvent(true)

    self.m_noticeTable["dsxq_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)    
   
    --self.m_extraData 是旗子的数据  只包括玩家排名  名字等  详细阵容信息需要获得
    self.m_noticeTable["dsxq_xiangqing_label"]:setString(self.m_extraData["name"])
    self.m_noticeTable["dsxq_paiming_num_label"]:setString(self.m_extraData["rank"])
    self.m_noticeTable["dsxq_dengji_num_label"]:setString(self.m_extraData["level"])
    
    local userHoldRankContributeNum = g_game.g_dictConfigManager:getContributeNumByRank(self.m_extraData["rank"])
	self.m_noticeTable["dsxq_gongji_num_label"]:setString(userHoldRankContributeNum)
    
    --当前user已挑战次数
    local userChallengeNum = g_game.g_userInfoManager:getUserPvpRank()["challengeNum"]
    self.m_noticeTable["dsxq_tzcs_num_label"]:setString(userChallengeNum.."/"..g_game.MAX_CHALLENGE_NUM)
    
    if self.m_extraData["canbeChallenge"]  then
    	self.m_noticeTable["dsxq_tz_button"]:setVisible(true)
    else
    	self.m_noticeTable["dsxq_tz_button"]:setVisible(false)
    end
    
    --玩家阵容详细信息
    local playerZhenrongData = g_game.g_userInfoManager:getPvpPlayerZhenrong()
 
 	local num = 0
    if playerZhenrongData["battleList_Num"] >= 3 then
    	 num = 3
    else
    	 num = playerZhenrongData["battleList_Num"]
    end
    
    for i = 1, 3 do
    	local qualityName = "dsxq_pingzhi"..i
    	local imageName = "dsxq_renwu"..i .. "_image"
    	if i <= num then
	    	local officerId = playerZhenrongData["battleList"][i]["officerId"]
	    	local quality = g_game.g_dictConfigManager:getCardQuality(officerId)
	    	
	    	local cardHeadRes = g_game.g_dictConfigManager:getCardHeadFile(officerId)
			local cardHeadImage = g_game.g_resourceManager:getCardHead(cardHeadRes)
	    	
	    	self.m_noticeTable[qualityName]:setImage(g_game.g_f_quality_image[quality])
	    	self.m_noticeTable[qualityName]:setSize(cc.size(102,102))
	    	
	    	self.m_noticeTable[imageName]:setImage(cardHeadImage)
	    	self.m_noticeTable[imageName]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	    	self.m_noticeTable[imageName]:setSize(cc.size(90,90))
	    else
	    	self.m_noticeTable[qualityName]:setVisible(false)
	    	self.m_noticeTable[imageName]:setVisible(false)
	    end
    end
    
    local noticeYes = function()
		self:noticeYesEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["dsxq_tz_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local noticeClose = function()
		self:noticeCloseEvent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["dsxq_close_button"]:addHandleOfcomponentEvent(noticeClose, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

end

----------------------------各种事件---------------------------------------

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] noticeYesEvent
-- notice 确定事件
-------------------------------------------------------------------------------
function f_common_popup_notice:noticeYesEvent()

	if self.m_yesCallBack ~= nil then	
		if self.m_noticeType == self.NOTICE_TYPE_GET_BORN_PRINCE then
			self.m_princeName = self.m_noticeTable["hg_hy_shuru_input"]:getText()
			if self.m_princeName ~= "" then
				if string.hybridTextLen(self.m_princeName) > g_game.MAX_PRINCE_NAME_LEN then
				    g_game.g_utilManager:showMsg("皇子名字不能超过七个字哦")
				else
					self.m_yesCallBack(self.m_princeName)
				end
			else 
			    g_game.g_utilManager:showMsg("您还没有输入皇子名称哦")
			end
		elseif self.m_noticeType == self.NOTICE_TYPE_IN_PREGNANT then
			g_game.g_panelManager:removeUiPanel("notice_popup_panel")
			if self.m_state == self.STATE_NONE then
				self.m_yesCallBack()
			end
		else
			g_game.g_panelManager:removeUiPanel("notice_popup_panel")
			self.m_yesCallBack()
		end
	else
		g_game.g_panelManager:removeUiPanel("notice_popup_panel")
	end
	
	self.m_isAlreadyCreate = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] noticeNoEvent
-- notice 否定事件
-------------------------------------------------------------------------------
function f_common_popup_notice:noticeNoEvent()
	g_game.g_panelManager:removeUiPanel("notice_popup_panel")

	if self.m_noCallBack ~= nil then
		self.m_noCallBack()
	end
	
	self.m_isAlreadyCreate = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] noticeCloseEvent
-- notice关闭事件
-------------------------------------------------------------------------------
function f_common_popup_notice:noticeCloseEvent()
	g_game.g_panelManager:removeUiPanel("notice_popup_panel")

	if self.m_closeCallBack ~= nil then
		self.m_closeCallBack()
	end
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CLOSE_POPUP)
	self.m_isAlreadyCreate = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setYesCallBack
-- 设置确定callBack
-------------------------------------------------------------------------------
function f_common_popup_notice:setYesCallBack(callback)
	self.m_yesCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setNoCallBack
-- 设置否定callBack
-------------------------------------------------------------------------------
function f_common_popup_notice:setNoCallBack(callback)
	self.m_noCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] setCloseCallBack
-- 设置关闭callback
-------------------------------------------------------------------------------
function f_common_popup_notice:setCloseCallBack(callback)
	self.m_closeCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] onExit
-- exit
-------------------------------------------------------------------------------
function f_common_popup_notice:onExit()    
    self:unregisterNodeEvent()
    
    if self.m_noticeType == self.NOTICE_TYPE_IN_PREGNANT then
	    g_game.g_gameManager:removeUpdateObj(self)
    end
    g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] update
-- 更新update
-------------------------------------------------------------------------------
function f_common_popup_notice:update(dt)
	 if self.m_noticeType == self.NOTICE_TYPE_IN_PREGNANT then
	 	self.m_time = self.m_time + dt
	 	
		if self.m_state == self.STATE_COUNTING then
		 	if self.m_time >= 1 then
		 		self.m_time = 0
		 		
		 		self.m_targetSec = self.m_targetSec -1
		 		self.m_targetSec = math.floor(self.m_targetSec)
			 	local exportTime = g_game.g_utilManager:getExportTime(self.m_targetSec)
			 	self.m_noticeTable["public_popup2_content1_label"]:setString(exportTime)
			 	
			 	if self.m_targetSec <= 0 then
			 		self.m_targetSec = 0
			 		self.m_state = self.STATE_ENDING
			 		
			 		local exportTime = g_game.g_utilManager:getExportTime(self.m_targetSec)
			 	 	self.m_noticeTable["public_popup2_content1_label"]:setString(exportTime)
			 	end
		 	end
	 	elseif self.m_state == self.STATE_ENDING then
	 		local blink = CCBlink:create(0.5,5)
	 		local repeatAction = CCRepeatForever:create(blink)
	 		self.m_noticeTable["bling_panel"]:runAction(repeatAction)

	 		
	 		self.m_state = self.STATE_NONE
	 	else
	 		
	 	end
	 	
	 end
	 
	 if  device.platform == "android" and self.m_noticeTable["hg_hy_shuru_input"] ~= nil and 
	 		self.m_noticeTable["hg_hy_shuru_input"]:getText() ~= self.m_inputText then
		self.m_inputText = self.m_noticeTable["hg_hy_shuru_input"]:getText()
		self.m_noticeTable["hg_hy_shuru_input"]:setText(self.m_inputText)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_common_popup_notice:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_common_popup_notice:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_common_popup_notice:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_popup_notice] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_common_popup_notice:registerNodeEvent(handler)
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
-- @function [parent=#f_common_popup_notice] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_common_popup_notice:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_common_popup_notice