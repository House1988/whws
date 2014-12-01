require("scripts.auto.auto_hougong_tangquangong_meinvtu")
require("scripts.auto.auto_hougong_tqg_mv_info")
require("scripts.auto.auto_hougong_tqg_zhuzhenmeinv")
require("scripts.game.main.card.f_card_zongjiacheng")
require("scripts.game.main.beauty.f_game_beauty_card_detail")
require("scripts.game.main.beauty.f_game_beauty_zhuanpan")
require("scripts.game.main.beauty.f_game_beauty_uncheered_panel")
require("scripts.game.main.beauty.f_game_beauty_cefeng")
require("scripts.game.main.beauty.f_game_beauty_award_panel")
require("scripts.game.main.common.f_birth_tip_popup")
require("scripts.game.main.common.f_jump_tip_popup")

--[[
	汤泉宫 
]]--

local f_game_beauty_tangquangong = class("f_game_beauty_tangquangong", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_tangquangong")
end)



-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:ctor()
    
    self:registerNodeEvent()   
    
    self.m_hougongMeinv_table = nil
    self.m_meinvInfo_table = nil
    
    self.m_zhuzhenMeinv_table = nil
 
    self.m_curSelectBeauty = nil
    
    self.m_card_head_list = nil
    self.m_uncheerBeautyPanel = nil
    
    --宠幸 的不同状态
    self.UI_CURBEAUTY_STATE_NONE = 0
    self.UI_CURBEAUTY_STATE_IN_FAVOR = 1 --在宠幸中
    self.UI_CURBEAUTY_STATE_GET = 2 --领取中
    self.UI_CURBEAUTY_STATE_CHECK = 3 --查看 怀孕中
    self.m_uiFavorState = self.UI_CURBEAUTY_STATE_NONE
    
    self.m_favorButtonFace = 0
    
    self.m_selectBeautyId = nil
    
    self.tableTitle = {}
	self.tableTitle[1] = "batch_ui/huanghou_cefeng.png"
	self.tableTitle[2] = "batch_ui/huangguifei_cefeng.png"
	self.tableTitle[3] = "batch_ui/guifei_cefeng.png"
	self.tableTitle[4] = "batch_ui/fei_cefeng.png"
	self.tableTitle[5] = "batch_ui/pin_cefeng.png"
	self.tableTitle[6] = "batch_ui/guiren_cefeng.png"
	self.tableTitle[7] = "batch_ui/changzai_cefeng.png"
	self.tableTitle[8] = "batch_ui/daying_cefeng.png"
	
	self.m_costEnergy = {5, 7, 12, 20, 30}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:onEnter()   
    
    self.m_meinvInfo_table = createhougong_tqg_mv_info()
	local meinvInfo_panel = self.m_meinvInfo_table["hougong_tqg_mv_info"]
    self:appendComponent(meinvInfo_panel)
    meinvInfo_panel:setAnchorPoint(cc.p(0,1))
    meinvInfo_panel:setPositionInContainer(cc.p(-5, 0))
    
    self.m_zhuzhenMeinv_table = createhougong_tqg_zhuzhenmeinv()
	local zhuzhenPanel = self.m_zhuzhenMeinv_table["hougong_tqg_zhuzhenmeinv"]
    self:appendComponent(zhuzhenPanel)
    zhuzhenPanel:setAnchorPoint(cc.p(0,1))
    zhuzhenPanel:setPositionInContainer(cc.p(-6,415))
    
    self.m_hougongMeinv_table = createhougong_tangquangong_meinvtu()
	local meinvPanel = self.m_hougongMeinv_table["hougong_tangquangong_meinvtu"]
    self:appendComponent(meinvPanel)
    meinvPanel:setAnchorPoint(cc.p(0.5,1))
    meinvPanel:setPositionInContainer(cc.p(480,0))
    
    
    if LANGUAGE_TYPE == 3 then
    	self.m_meinvInfo_table["hg_tqg_mvinfo_lv"]:setString("等 級")
    	self.m_meinvInfo_table["hg_tqg_mvinfo_jiaoyudian_label"]:setString("學 識")
    	self.m_meinvInfo_table["hg_tqg_mvinfo_qinmidu_label"]:setString("親密度")
    	self.m_meinvInfo_table["hg_tqg_mvinfo_xingquzhi_label"]:setString("興趣值")
    	
    end
    
    self:showDefaultCardInfo()
    self:initCheerBeautiList()
    
    --更换当前
    local changeBeauty = function()
    	if  self.m_uiFavorState == self.UI_CURBEAUTY_STATE_IN_FAVOR then
    		return
    	end
    	self:popupChangeBeautyView()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_meinvInfo_table["hg_tqg_zzmv_henghuan_button"]:addHandleOfcomponentEvent(changeBeauty,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    --宠幸当前
    local chongxing = function()
    	self:chongxing()    	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_meinvInfo_table["hg_tqg_chongxing_button"]:addHandleOfcomponentEvent(chongxing,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
 	
 	--宫斗
 	local gongdou = function()
 		if  self.m_uiFavorState == self.UI_CURBEAUTY_STATE_IN_FAVOR then
    		return
    	end
    	
    	if g_game.g_utilManager:allGuidelinesIsFinish() then
 			self:gongdou()
 			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
 		end
 	end
 	self.m_meinvInfo_table["hg_tqg_gongdou_button"]:addHandleOfcomponentEvent(gongdou,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
 	
 	--册封
 	local cefeng = function()
 		if  self.m_uiFavorState == self.UI_CURBEAUTY_STATE_IN_FAVOR then
    		return
    	end
 		self:cefeng()
 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
 	end
 	self.m_meinvInfo_table["tqg_cefeng_btn"]:addHandleOfcomponentEvent(cefeng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
 	
 	--查看当前怀孕皇子事件
 	local checkPregnantState = function()
 		if  self.m_uiFavorState == self.UI_CURBEAUTY_STATE_IN_FAVOR then
    		return
    	end
 		self:checkPregnantState()
 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
 	end
 	self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:addHandleOfcomponentEvent(checkPregnantState,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--领取皇子
	self.event_request_boin_princeid = function()
		local curBeautyData = self.m_card_head_list:getSelectCard():getData()
		g_game.g_userInfoManager:requestObtainBornPrinceId(curBeautyData["id"])
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REQUEST_OBTAIN_BORN_PRINCEID, self.event_request_boin_princeid)
	
    --弹出总加成
    local popupZongJiaCheng = function()
    	if  self.m_uiFavorState == self.UI_CURBEAUTY_STATE_IN_FAVOR then
    		return
    	end
		self:popupZongJiacheng()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_zhuzhenMeinv_table["hg_tqg_zzmv_jiacheng_button"]:addHandleOfcomponentEvent(popupZongJiaCheng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--弹出卡牌详情
	local popupBeautyDetailCallBack = function()
		if  self.m_uiFavorState == self.UI_CURBEAUTY_STATE_IN_FAVOR then
    		return
    	end
		self:popupBeautyDetailPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_meinvInfo_table["hg_tqg_mv_chakan_button"]:addHandleOfcomponentEvent(popupBeautyDetailCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	

	--注册监听函数宠幸美女 发送消息后 返回调用的
	self.event_updateBeautyFavorCallback = function()
		self:updateBeautyFavorCallBack()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BEAUTY_FAVOR, self.event_updateBeautyFavorCallback)

	--注册监听函数返回 美女怀孕剩余事件回调
	self.event_updatePregnantTimeCallback = function()
		self:updatePregnantTimeCallback()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PREGNANT_TIME, self.event_updatePregnantTimeCallback)
	
	--注册监听函数返回 皇子出生的时间回调
	self.event_updateGetBornPrinceCallBack = function()
		self:popupPrinceBornBoard()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_BORN_PRINCE, self.event_updateGetBornPrinceCallBack)
	
	--注册监听函数 修改出生皇子名字
	self.event_updateBornPrinceName = function()
		self:updateBornPrinceName()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updateBornPrinceName)
	
	--注册更新 美女上阵的消息回调
	self.event_updateBeautyOnboard = function()
		g_game.g_panelManager:removeUiPanel("meinvxuanze_title")
		self:updateSelectCardInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHANGE_BEAUTY, self.event_updateBeautyOnboard)
	
	--注册更新  宫斗以后的美女数据
	self.event_updateBeautyGongDou = function()
		self.m_card_head_list:updateDisplay()
		self:updateSelectCardInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateBeautyGongDou)
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateBeautyGongDou)

	self.event_isNeedUpdate1 = function()
		self:updateCall()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_isNeedUpdate1)
	
	self.event_userInfo3 = function()
		self:updateCall()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_userInfo3)
	
	-- 赏赐按钮
	local awardBtnEvent = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)

		local userLevel = g_game.g_userInfoManager:getUserLv()
		if userLevel < 0 then
			local str = g_game.g_dictConfigManager:getLanTextById(413)
			g_game.g_utilManager:showMsg(str)
			return
		end
		
		local meinvAwardPanel = g_game.g_panelManager:getUiPanel("meinv_award_ui")
		if meinvAwardPanel == nil then
			meinvAwardPanel = f_game_beauty_award_panel.static_create()
			g_game.g_panelManager:showUiPanel(meinvAwardPanel,"meinv_award_ui")
		end
		-- 美女数据
		local curSelectCard = self.m_card_head_list:getSelectCard()
		local curSelectCardInfo = curSelectCard:getData()
		if curSelectCardInfo ~= nil then
			meinvAwardPanel:showAwardPanel(curSelectCardInfo)
		end
	end
	self.m_meinvInfo_table["hg_tqg_arard_button"]:addHandleOfcomponentEvent(awardBtnEvent,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	self.m_xueshiAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_xueshiAnim:setup(self.m_meinvInfo_table["hg_tqg_jiaoyudian_num_label"], 21, "%d", false, false)

	self.m_meinvInfo_table["hougong_tqg_mv_info"]:appendComponent(self.m_xueshiAnim)
	local p = self.m_meinvInfo_table["hg_tqg_jiaoyudian_num_label"]:getPositionInContainer()
	self.m_xueshiAnim:setPositionInContainer(p)
	
	self.m_qinmiAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_qinmiAnim:setup(self.m_meinvInfo_table["hg_tqg_qinmidu_num_label"], 21, "%d", false, false)
	self.m_meinvInfo_table["hougong_tqg_mv_info"]:appendComponent(self.m_qinmiAnim)
	local p = self.m_meinvInfo_table["hg_tqg_qinmidu_num_label"]:getPositionInContainer()
	self.m_qinmiAnim:setPositionInContainer(p)
	
	self.m_lastId = 0
	local beautiInfo = g_game.g_userInfoManager:getBeautiListInfo()
	if beautiInfo == nil then
		return 
	end
	
	self.m_lastId = 0
	if beautiInfo["battleList_Num"] ~= 0 then
		local defaultCardInfo = beautiInfo["battleList"][1]
		if defaultCardInfo ~= nil then
			self.m_xueshiAnim:setLastValue(defaultCardInfo["beautyEducation"])
			self.m_qinmiAnim:setLastValue(defaultCardInfo["beautyIntimacy"])
			self.m_lastId = defaultCardInfo["id"]
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updateCall
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updateCall()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	self.m_meinvInfo_table["hg_tqg_mv_jinglizhi_num"]:setString(""..userInfo["energy"])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updateBeautyFavorCallBack
-- 更新宠幸美女返回 回调
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updateBeautyFavorCallBack()
	
	local hougong_main = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
	
	local chongxingPanel = require("scripts.game.main.beauty.f_game_beauty_chongxing_panel").new()	
	chongxingPanel:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	g_game.g_panelManager:showUiPanel(chongxingPanel,"chongxing_panel")
	chongxingPanel:setOpacity(0)
	chongxingPanel:setBeautyId(self.m_selectBeautyId)
	
	local updateChongxing = function()
		self:updateChongxing()
	end
	chongxingPanel:setReturnCallBack(updateChongxing)
	hougong_main:runAction(cc.FadeOut:create(1))
	chongxingPanel:runAction(cc.FadeIn:create(1))

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] showZhuanPanResultNotice
-- 显示转盘结果的 弹出面板
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:showZhuanPanResultNotice()
	 g_game.g_panelManager:removeUiPanel("zhuanpan")
	 
	 local chongxingResultNotice = require("scripts.game.main.common.f_common_popup_notice").new()	
	 g_game.g_panelManager:showUiPanel(chongxingResultNotice,"notice_popup_panel")
	  
	  --1 教育点 --2美女 --3装备  --4皇子
	 local favorResult = g_game.g_userInfoManager:getChongxingResult()
  	 local favorResultId = g_game.g_userInfoManager:getChongxingResult()["rewardId"]
  	 local resultType = g_game.g_dictConfigManager:getChongxingRewardType(favorResultId)

	 local rewardQinmidu = favorResult["intimate"]
	 if resultType == 1 then 
	 
	 	 local educationNum = favorResult["rewardValue"]
	 	 
	 	 chongxingResultNotice:setNoticeContent("","+"..educationNum,"",nil)
	 	 chongxingResultNotice:popUpNotice(7)
--	     chongxingResultNotice:setActionType(1)
	     
	     local beautyInfo = g_game.g_userInfoManager:getBeautiListInfo()
		 local battleList = beautyInfo["battleList"]
	 
	 	 local curSelectCardData = self.m_card_head_list:getSelectCard():getData()
 		 curSelectCardData["beautyEducation"] = curSelectCardData["beautyEducation"] + educationNum
		
	 elseif resultType == 2 then
	 	--需要美女的主键  id
	 	 local  id = favorResult["id"]
	 	 local beautyId = favorResult["rewardValue"] 
	 	 local cardResource = g_game.g_dictConfigManager:getBeautyResource(beautyId)
		 local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
		 local name = g_game.g_dictConfigManager:getBeautiName(beautyId)
		 if LANGUAGE_TYPE == 3 then
		 	 chongxingResultNotice:setNoticeContent("恭喜皇上！","[91,24,6]陛下，這是娘娘教導了一段時間的陪嫁丫鬟：[206,53,0]" .. name .. "[91,24,6]， 貌美伶俐，獻給陛下！","",resourceImage)
		 else
			 chongxingResultNotice:setNoticeContent("恭喜皇上！","[91,24,6]陛下，这是娘娘教导了一段时间的陪嫁丫鬟：[206,53,0]" .. name .. "[91,24,6]， 貌美伶俐，献给陛下！","",resourceImage)
		 end
	 	 chongxingResultNotice:popUpNotice(8)
	     chongxingResultNotice:setActionType(1)
	     chongxingResultNotice:setStarLevel(g_game.g_dictConfigManager:getBeautyQuality(beautyId))
	     
	     local beautyInfo = g_game.g_userInfoManager:getBeautiListInfo()
		 local unbattleList = beautyInfo["unbattleList"]
		
		 local rewardBeautyData = {}
		 rewardBeautyData["id"] = id
		 rewardBeautyData["beautyId"] = beautyId
		 rewardBeautyData["beautyLevel"] =1
		 rewardBeautyData["beautyTitle"] =0
		 rewardBeautyData["position"] =0
		 rewardBeautyData["beautyIntimacy"] =0
		 rewardBeautyData["beautyEducation"] =0
		 rewardBeautyData["beautySavor"] =2
		 rewardBeautyData["beautyExp"] =0
		 rewardBeautyData["conceive"] =0
		 rewardBeautyData["princeList_Num"] =0
		 rewardBeautyData["princeList"] = {}
		 
		 beautyInfo["unbattleList_Num"] = beautyInfo["unbattleList_Num"] + 1
		 table.insert(unbattleList,rewardBeautyData)
	 elseif resultType == 3 then
	 	
	 	 local equipId = favorResult["rewardValue"] 
	 	 local image = g_game.g_dictConfigManager:getPieceImage(equipId)
	 	 local name = g_game.g_dictConfigManager:getPieceName(equipId)
	 	 local type = g_game.g_dictConfigManager:getPieceType(equipId)
	 	 if type == 4 then
	 	 	if LANGUAGE_TYPE == 3 then
		 	 	chongxingResultNotice:setNoticeContent("恭喜皇上！","[91,24,6]获得[206,53,0]"..name.."[91,24,6]兵法殘頁!","",image)
	 	 	else
		 	 	chongxingResultNotice:setNoticeContent("恭喜皇上！","[91,24,6]获得[206,53,0]"..name.."[91,24,6]兵法残页!","",image)
	 	 	end
	 	 else
	 	 	if LANGUAGE_TYPE == 3 then
		 		chongxingResultNotice:setNoticeContent("恭喜皇上！","[91,24,6]获得[206,53,0]"..name.."[91,24,6]裝備碎片!","",image)
	 	 	else
		 		chongxingResultNotice:setNoticeContent("恭喜皇上！","[91,24,6]获得[206,53,0]"..name.."[91,24,6]装备碎片!","",image)
	 	 	end
	 	 end
	 	 chongxingResultNotice:popUpNotice(9)
	
	     chongxingResultNotice:setStarLevel(g_game.g_dictConfigManager:getPieceStar(equipId))
	     
	     chongxingResultNotice:setActionType(1)
	     local type = g_game.g_dictConfigManager:getPieceType(favorResult["rewardValue"])
	     chongxingResultNotice:setFlagImage(type)
	     g_game.g_userInfoManager:insertPieceToTable(type+9, favorResult["rewardValue"])
	 
	 elseif resultType == 4 then
	 	 local str = g_game.g_dictConfigManager:getLanTextById(87)
	 	 chongxingResultNotice:setNoticeContent("恭喜皇上！",str,"",nil)
	 	 chongxingResultNotice:popUpNotice(10)
	     chongxingResultNotice:setActionType(1)
	 	
	 end
	 
	 --设置显示奖励面板显示结束后回调
	 local closePopUpCallBack = function()
		
		local favorResult = g_game.g_userInfoManager:getChongxingResult()
	    local qinmidu = favorResult["intimate"]
	    local strT = g_game.g_dictConfigManager:getLanTextById(414)
	    g_game.g_utilManager:showMsg(strT..qinmidu)
	     --重置状态防止下次无法宠幸
	    self.m_uiFavorState = self.UI_CURBEAUTY_STATE_NONE
	 end
	 
	 chongxingResultNotice:setYesCallBack(closePopUpCallBack)
	 chongxingResultNotice:setCloseCallBack(closePopUpCallBack)
	 
	 --更新页面 数据
	 local userInfo = g_game.g_userInfoManager:getUserInfo()
	 userInfo["energy"] = favorResult["energy"]
	 
	 local beautyInfo = g_game.g_userInfoManager:getBeautiListInfo()
	 local battleList = beautyInfo["battleList"]
	 
	 local curSelectCardData = self.m_card_head_list:getSelectCard():getData()
	 curSelectCardData["beautySavor"] = favorResult["savor"]
	 curSelectCardData["beautyIntimacy"] = curSelectCardData["beautyIntimacy"] + favorResult["intimate"]   
	 if resultType == 4 then
		curSelectCardData["conceive"] = 1
	 end
	 
	 self:updateSelectCardInfo()
	 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] popupChangeBeautyView
-- 更换美女界面
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:popupChangeBeautyView()
	local count = g_game.g_userInfoManager:getBeautiListInfo()["unbattleList_Num"]
	if count <= 0 then
		local panel = f_jump_tip_popup.static_create()
		panel:setPanelByType(81)
		local leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		local rightBtnCallback = function()
			g_game.g_panelManager:removeAllUiPanel()
--			if g_game.g_userInfoManager:getLevel() < g_game.OPEN_XUNXIU_LV then
--				local str = g_game.g_dictConfigManager:getLanTextById(434)
--				g_game.g_utilManager:showMsg(g_game.OPEN_XUNXIU_LV..str)
--			else
				g_game.g_utilManager:enterShop(2)
--			end
		end
		panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
	else
		local uncheerBeautyPanel = f_game_beauty_uncheered_panel.static_create()
		uncheerBeautyPanel:panelInitBeforePopup()
		uncheerBeautyPanel:setStopTouchEvent(true)
		g_game.g_panelManager:showUiPanel(uncheerBeautyPanel,"meinvxuanze_title")
		local selectCard = self.m_card_head_list:getSelectCard()
		uncheerBeautyPanel:setTargetExchangeCard(selectCard)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] gongdou
-- 汤泉宫宫斗 
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:gongdou()
	--需要将升级的对象 排除在 吞卡队列之外
	g_game.g_userInfoManager:updateCanbeEatenBeautyArr(self.m_card_head_list:getSelectCard())
	
	local gongdouPanel = f_game_beauty_gongdou.static_create()
	gongdouPanel:panelInitBeforePopup()
	gongdouPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(gongdouPanel,"gongdou_bg")
    gongdouPanel:setLvupTargetBeauty(self.m_card_head_list:getSelectCard())

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] cefeng
-- 汤泉宫册封
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:cefeng()
	if g_game.g_userInfoManager:getUserLv() < 25 then
		local str = g_game.g_dictConfigManager:getLanTextById(408)
		g_game.g_utilManager:showMsg(str)
		return
	end

	local cefengPanel = f_game_beauty_cefeng.static_create()
	cefengPanel:panelInitBeforePopup()
	cefengPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(cefengPanel,"hougong_cefeng_bg")
    cefengPanel:setCefengBeauty(self.m_card_head_list:getSelectCard())
    cefengPanel:initCefengTitleList()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] checkPregnantState
-- 查看当前怀孕状态 
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:checkPregnantState()

	if self.m_favorButtonFace == 1 then
		local curBeautyData = self.m_card_head_list:getSelectCard():getData()
		g_game.g_userInfoManager:requestPregnantTime(curBeautyData["id"])
	else
		local curBeautyData = self.m_card_head_list:getSelectCard():getData()
		g_game.g_userInfoManager:requestObtainBornPrinceId(curBeautyData["id"])
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] popupPrinceBornBoard
-- 弹出出生皇子面板
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:popupPrinceBornBoard()
	 self.bornPrinceXibao = require("scripts.game.main.common.f_common_popup_notice").new()	
	 g_game.g_panelManager:showUiPanel(self.bornPrinceXibao,"notice_popup_panel")
	
	 local curBeautyData = self.m_card_head_list:getSelectCard():getData()
	 local beautyId = curBeautyData["beautyId"]
	 local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyId)
	 
	 if LANGUAGE_TYPE == 3 then
	 	 self.bornPrinceXibao:setNoticeContent("急報","吾皇萬歲，適才太醫院傳來喜訊："..beautyName.."娘娘順利誕下7斤6兩皇子一名",nil,nil)
	 else
	 	 self.bornPrinceXibao:setNoticeContent("急报","吾皇万岁，适才太医院传来喜讯："..beautyName.."娘娘顺利诞下7斤6两皇子一名",nil,nil)
	 end
	  		--22 stand for 生下皇子喜报 
   	 self.bornPrinceXibao:popUpNotice(22)
   
   	 local result = nil
   	 if self.m_favorButtonFace == 1 then --实在怀孕中点击 ，证明cd时间到了，点击确定过后弹出喜报
		result = g_game.g_userInfoManager:getPregnantTimeResult()
	 elseif self.m_favorButtonFace == 2 then--表示当前是怀孕状态
		result = g_game.g_userInfoManager:getBornPrinceResult()
	 end
   	 
   	 self.bornPrinceXibao:setStarLevel(result["princeStar"])
   		--1 stand for scale action
  	-- self.bornPrinceXibao:setActionType(1)
  	 
  	 local sendChangeName = function(princeName)
  	 	self:sendChangePrinceName(princeName)
  	 end
  	 self.bornPrinceXibao:setYesCallBack(sendChangeName)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] sendChangePrinceName
-- 发送改名
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:sendChangePrinceName(princeName)
	
	if self.m_favorButtonFace == 1 then --实在怀孕中点击 ，证明cd时间到了，点击确定过后弹出喜报
		local result = g_game.g_userInfoManager:getPregnantTimeResult()
		result["princeName"] = princeName
		local princeId = result["id"]
		g_game.g_userInfoManager:requestChangePrinceName(princeId,princeName)
		
	elseif self.m_favorButtonFace == 2 then--表示当前是怀孕状态
		local princeResult = g_game.g_userInfoManager:getBornPrinceResult()
		princeResult["princeName"] = princeName
		local princeId = princeResult["id"]
		g_game.g_userInfoManager:requestChangePrinceName(princeId,princeName)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updateBornPrinceName
-- 改名结果回调
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updateBornPrinceName()
	if g_game.g_userInfoManager:getChangeNameResult()["result"] == 2 then
	    g_game.g_utilManager:showMsg("皇子名字不能为空")
		return
	elseif g_game.g_userInfoManager:getChangeNameResult()["result"] == 3 then
	    g_game.g_utilManager:showMsg("皇子重名")
		return 
	else
	 	g_game.g_panelManager:removeUiPanel("notice_popup_panel")
	end

	--插入新出生的皇子
	local princeResult = nil
	
	if self.m_favorButtonFace == 1 then --实在怀孕中点击 ，证明cd时间到了，点击确定过后弹出喜报
		princeResult = g_game.g_userInfoManager:getPregnantTimeResult()
	elseif self.m_favorButtonFace == 2 then--表示当前是怀孕状态
		princeResult = g_game.g_userInfoManager:getBornPrinceResult()
	end
	
	if princeResult == nil then
		return
	end
	
	local princeList = g_game.g_userInfoManager:getPrinceData()
	local unbattlePrinceList = princeList["unbattleList"]
	
	local newBornPrince = {}
	newBornPrince["id"] = princeResult["id"]
	newBornPrince["princeResource"] = princeResult["princeResource"]
	newBornPrince["princeStar"] = princeResult["princeStar"]
	newBornPrince["princeLevel"] = princeResult["princeLevel"]
	newBornPrince["exp"] = princeResult["exp"]
	newBornPrince["mother"] = princeResult["mother"]
	newBornPrince["alive"] = princeResult["alive"]
	newBornPrince["princeTitle"] = princeResult["princeTitle"]
	newBornPrince["position"] = princeResult["position"]
	newBornPrince["princeSkill"] = princeResult["princeSkill"]
	newBornPrince["passiveSkillId"] = princeResult["passiveSkillId"]
	newBornPrince["princeName"] = princeResult["princeName"]
	newBornPrince["beautyId"] = princeResult["beautyId"]
	newBornPrince["princeDes"] = princeResult["princeDes"]
	
	princeList["unbattleList_Num"] = princeList["unbattleList_Num"] +1
	table.insert(unbattlePrinceList,newBornPrince)
	
	local curSelectCard = self.m_card_head_list:getSelectCard()
	local selectCardData = curSelectCard:getData()
	selectCardData["conceive"] = 0
	selectCardData["princeList_Num"] = selectCardData["princeList_Num"]+1
	table.insert(selectCardData["princeList"],{["princeId"] = princeResult["id"]})
	
	self:updateSelectCardInfo()
	g_game.g_utilManager:showMsg("皇子诞生了！皇上今后可以在东宫中查看众皇子的成长情况~")
	
	--新手指引
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_GET_PRINCE)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updatePregnantTimeCallback
-- 更新当前 怀孕事件 
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updatePregnantTimeCallback()

--	 local popupLvUp = require("scripts.game.main.common.f_common_popup_notice").new()	
--	 g_game.g_panelManager:showUiPanel(popupLvUp,"notice_popup_panel")
--	
--	 local result = g_game.g_userInfoManager:getPregnantTimeResult()
--	 local targetSec =  result["remainTime"]
--	 local exportTime = g_game.g_utilManager:getExportTime(targetSec)
--	 
--	 popupLvUp:setNoticeContent(nil,"皇子还在孕育中，距离分娩还有：",exportTime,nil)
--   		--21stand for 皇上 
--   	 popupLvUp:popUpNotice(21)
--   		--1 stand for scale action
--  	 popupLvUp:setActionType(1)
--  	 
--  	 local gotoPregnant = function()
--  	 	-- 在时间为0时候 点击确定 弹出  皇子出生的喜报
--  	 	self:popupPrinceBornBoard()
--  	 end
--  	 popupLvUp:setYesCallBack(gotoPregnant)
	
	if g_game.g_panelManager:isUiPanelShow("birth_tip_popup") == false then
		local panel = f_birth_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "birth_tip_popup")
		local curSelectCard = self.m_card_head_list:getSelectCard()
	    panel:setBeautyId(curSelectCard:getData()["id"])
		local gotoPregnant = function()
			-- 在时间为0时候 点击确定 弹出  皇子出生的喜报
			self:popupPrinceBornBoard()
		end
		panel:setConfirmCallBack(gotoPregnant)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] chongxing
-- 宠幸
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:chongxing()
    local userInfo = g_game.g_userInfoManager:getUserInfo()
     
    if self.m_uiFavorState ~= self.UI_CURBEAUTY_STATE_NONE then
     	 return
    end
     
    local curSelectCard = self.m_card_head_list:getSelectCard()
    
    if userInfo["energy"] < self.m_costEnergy[g_game.g_dictConfigManager:getBeautyQuality(curSelectCard:getData()["beautyId"])] then
    	g_game.g_utilManager:popupQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_ENERGY)
     	return
    end

    if curSelectCard:getData()["beautySavor"] <= 0 then
		local panel = f_jump_tip_popup.static_create()
		panel:setPanelByType(1)
		local leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		local rightBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			local meinvAwardPanel = g_game.g_panelManager:getUiPanel("meinv_award_ui")
			if meinvAwardPanel == nil then
				meinvAwardPanel = f_game_beauty_award_panel.static_create()
				g_game.g_panelManager:showUiPanel(meinvAwardPanel,"meinv_award_ui")
			end
			-- 美女数据
			local curSelectCard = self.m_card_head_list:getSelectCard()
			local curSelectCardInfo = curSelectCard:getData()
			if curSelectCardInfo ~= nil then
				meinvAwardPanel:showAwardPanel(curSelectCardInfo)
			end
		end
		panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		return
    end
     
    self.m_uiFavorState = self.UI_CURBEAUTY_STATE_IN_FAVOR
    
    local curSelectCard = self.m_card_head_list:getSelectCard()
    g_game.g_userInfoManager:requestBeautyChongxing(curSelectCard:getData()["id"],curSelectCard:getData()["beautyId"])
    g_game.g_userInfoManager:requestRecoverTime()
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updateChongxing
-- 更新 美女的 衣着 回调  
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updateChongxing()
	local zhuanpan = f_game_beauty_zhuanpan.static_create()
	zhuanpan:panelInitBeforePopup()
	
	local closeZhuanPanCallBack = function()
		self:showZhuanPanResultNotice()
	end
	zhuanpan:setCloseCallBack(closeZhuanPanCallBack)
	
	g_game.g_panelManager:showUiPanel(zhuanpan,"zhuanpan")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] popupBeautyDetailPanel
-- 弹出 美女详细 面板
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:popupBeautyDetailPanel()
	local data = self.m_card_head_list:getSelectCard():getData()
	
	if data == nil then
		return
	end
	
	local detailPanel = f_game_beauty_card_detail.static_create()
	detailPanel:panelInitBeforePopup()
	detailPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
	detailPanel:setDetail(self.m_card_head_list:getSelectCard())
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] initCheerBeautiList
-- 助阵美女 list ，上限10
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:initCheerBeautiList()
	self.m_zhuzhenMeinv_table["hg_tqg_zzmv_ng_scale9"]:setComponentZOrder(3)
	self.m_zhuzhenMeinv_table["hg_tqg_zzmv_jiacheng_button"]:setComponentZOrder(4)
	self.m_zhuzhenMeinv_table["fei"]:setComponentZOrder(6)
	
	self.m_card_head_list = require("scripts.game.main.beauty.f_game_beauty_cheer_list").new()	
	self.m_zhuzhenMeinv_table["hougong_tqg_zhuzhenmeinv"]:appendComponent(self.m_card_head_list)
	self.m_card_head_list:setSize(cc.size(850,102))
	self.m_card_head_list:setListInfo(1, 0, 30, 102, 102)
	self.m_card_head_list:setComponentZOrder(2)
	self.m_card_head_list:setAnchorPoint(cc.p(0,1))
	self.m_card_head_list:setPositionInContainer(cc.p(140, 30))	
	
	 --向底部 list 设置更新选中时的 回调函数	
    local headListUpdateSelectInfoCallBack = function()
    	self:updateSelectCardInfo()
    end
    self.m_card_head_list:setUpdateSelectInfoCallBack(headListUpdateSelectInfoCallBack)
	
	 --向底部 list 设置选中回调函数	
    local gotoChangeBeautyView = function()
    	self:popupChangeBeautyView()
    end
    self.m_card_head_list:setJumpToUnCheerBeautyView(gotoChangeBeautyView)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updateSelectCardInfo
-- 更新选中的卡牌信息
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updateSelectCardInfo()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	self.m_meinvInfo_table["hg_tqg_mv_jinglizhi_num"]:setString(""..userInfo["energy"])

	local curSelectCard = self.m_card_head_list:getSelectCard()
	
	local curSelectCardInfo = curSelectCard:getData()
	
	if curSelectCardInfo == nil then
		return
	end
	
	local curSelectCardId = curSelectCardInfo["beautyId"]
	
	self.m_selectBeautyId = curSelectCardId
	
	local selectBeautiName = g_game.g_dictConfigManager:getBeautyResource(curSelectCardId)
	local beautiImage = g_game.g_resourceManager:getBeautyDressedImage(selectBeautiName)
	self.m_hougongMeinv_table["hg_tqg_mv_image"]:setImage(beautiImage)
	self.m_hougongMeinv_table["hg_tqg_mv_image"]:setSize(cc.size(305,310))
	
	local nakedeImage = g_game.g_resourceManager:getBeautyNakedImage(selectBeautiName)
	self.m_hougongMeinv_table["hg_tqg_mv_image_naked"]:setImage(nakedeImage)
	self.m_hougongMeinv_table["hg_tqg_mv_image_naked"]:setSize(cc.size(305,310))
	self.m_hougongMeinv_table["hg_tqg_mv_image_naked"]:setOpacity(0)
	
	local selectBeautiQuality = g_game.g_dictConfigManager:getBeautyQuality(curSelectCardId)
	
	if g_game.g_f_meinv_quality_bg[selectBeautiQuality] ~= "" then
		self.m_hougongMeinv_table["bg"]:setImage(g_game.g_f_meinv_quality_bg[selectBeautiQuality])
		self.m_hougongMeinv_table["bg"]:setSize(cc.size(400,300))
		self.m_hougongMeinv_table["bg"]:setVisible(true)
	else
		self.m_hougongMeinv_table["bg"]:setVisible(false)
	end
	
	for i = 1 , 5 do
		if i <= selectBeautiQuality then
			self.m_hougongMeinv_table["hg_tqg_mv_xing"..i.."_image"]:setVisible(true)
		else
			self.m_hougongMeinv_table["hg_tqg_mv_xing"..i.."_image"]:setVisible(false)
		end
	end
	
	local selectBeautiName = g_game.g_dictConfigManager:getBeautiName(curSelectCardId)
	self.m_meinvInfo_table["nameText"]:setString(selectBeautiName)
	
	local selectBeautiLv = curSelectCardInfo["beautyLevel"]
	self.m_meinvInfo_table["hg_tqg_mvinfo_lvnum_label"]:setString(selectBeautiLv)

	self.m_meinvInfo_table["hg_tqg_qinmidu_num_label"]:setString(""..curSelectCardInfo["beautyIntimacy"])
	
	self.m_meinvInfo_table["hg_tqg_xingquzhi_num_label"]:setString(""..curSelectCardInfo["beautySavor"])
	
	self.m_meinvInfo_table["hg_tqg_jiaoyudian_num_label"]:setString(""..curSelectCardInfo["beautyEducation"])
	
	if self.m_xueshiAnim ~= nil then
		if curSelectCardInfo["id"] == self.m_lastId then
			self.m_xueshiAnim:playWhenLarger(curSelectCardInfo["beautyEducation"], 0.8)
			self.m_qinmiAnim:playWhenLarger(curSelectCardInfo["beautyIntimacy"], 0.8)
		else
			self.m_xueshiAnim:setLastValue(curSelectCardInfo["beautyEducation"])
			self.m_qinmiAnim:setLastValue(curSelectCardInfo["beautyIntimacy"])
			self.m_lastId = curSelectCardInfo["id"]
		end
	end
	
	self:setFavorButtonFace(curSelectCardInfo["conceive"])
	
	if curSelectCardInfo["beautyTitle"] ~= 0 then
			self.m_hougongMeinv_table["titile_image"]:setVisible(true)
			self.m_hougongMeinv_table["titile_image"]:setImage(self.tableTitle[curSelectCardInfo["beautyTitle"]])
		else
			self.m_hougongMeinv_table["titile_image"]:setVisible(false)
	end
	
	--计算加成
	local beautyName = g_game.g_dictConfigManager:getBeautiName(curSelectCardId)
	
	local jiachengId = g_game.g_dictConfigManager:getBeautyAdditionId(curSelectCardId)
    local jiachengData = g_game.g_dictConfigManager:getBeautyAddition(jiachengId)
    local addPercent = 0
	if curSelectCardInfo["beautyTitle"] ~= 0 then
		addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(curSelectCardInfo["beautyTitle"])
	end
	
    local finalAddition = string.format("%.1f", jiachengData[5]/1000 + (selectBeautiLv-1)*jiachengData[6]/1000 + addPercent)
    
	self.m_meinvInfo_table["zhuzhenjiacheng_label"]:setColor(cc.c3b(255,255,255))
	
	local textJineng = g_game.g_dictConfigManager:getLanTextById(jiachengData[3])
	self.m_meinvInfo_table["zhuzhenjiacheng_label"]:setString(textJineng.. finalAddition.."%")
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] updateBeautyViewToDefault
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:updateBeautyViewToDefault()
	self.m_card_head_list:setSelectToFirst()
	
	local userLevel = g_game.g_userInfoManager:getLevel()
	local openedNum = g_game.g_dictConfigManager:getOpenedBeautiNum(userLevel)
	local num1,num2,num3 = g_game.g_dictConfigManager:getMaxLimitNum()
	
	local createNum = openedNum+1
	if createNum >= num2 then
		createNum = num2
	end
	
	local cardInfo = g_game.g_userInfoManager:getBeautiListInfo()
	self.m_card_head_list:fillData(createNum, openedNum, cardInfo)
	self:showDefaultCardInfo()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] setFavorButtonFace
-- 设置宠幸 button位置的显示
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:setFavorButtonFace(beautyState)
	self.m_favorButtonFace = beautyState
	
	self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:stopAllActions()
	self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:setScale(1)
	
	if beautyState == 0  then --未怀孕
		self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:setVisible(false)
		self.m_meinvInfo_table["hg_tqg_chongxing_button"]:setVisible(true)
	elseif beautyState == 1 then --怀孕
		self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:setVisible(true)
		self.m_meinvInfo_table["hg_tqg_chongxing_button"]:setVisible(false)
	else --等待领取皇子中
		self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:setVisible(true)
		self.m_meinvInfo_table["hg_tqg_chongxing_button"]:setVisible(false)
		
		local scaleTo = CCScaleBy:create(0.1,1.2)
		local scaleBack = scaleTo:reverse()
		
		local actions = g_game.g_transition.sequence({scaleTo,scaleBack})
		local repeatAction = CCRepeatForever:create(actions)
		self.m_meinvInfo_table["hg_tqg_huaiyun_button"]:runAction(repeatAction)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_XINTIAO)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] showDefaultCardInfo
-- 显示默认卡牌信息
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:showDefaultCardInfo()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	self.m_meinvInfo_table["hg_tqg_mv_jinglizhi_num"]:setString(""..userInfo["energy"])
	
	local beautiInfo = g_game.g_userInfoManager:getBeautiListInfo()
	if beautiInfo == nil then
		return 
	end
	
	self.m_lastId = 0
	if beautiInfo["battleList_Num"] ~= 0 then
		local defaultCardInfo = beautiInfo["battleList"][1]
	
		local defaultBeautiId = defaultCardInfo["beautyId"]
		
		self.m_selectBeautyId = defaultCardInfo["beautyId"]
		
		self.m_lastId = defaultCardInfo["id"]
		
		local defaultBeautiName = g_game.g_dictConfigManager:getBeautyResource(defaultBeautiId)
		local beautiImage = g_game.g_resourceManager:getBeautyDressedImage(defaultBeautiName)
		self.m_hougongMeinv_table["hg_tqg_mv_image"]:setImage(beautiImage)
		self.m_hougongMeinv_table["hg_tqg_mv_image"]:setSize(cc.size(305,310))
		
		local nakedeImage = g_game.g_resourceManager:getBeautyNakedImage(defaultBeautiName)
		self.m_hougongMeinv_table["hg_tqg_mv_image_naked"]:setImage(nakedeImage)
		self.m_hougongMeinv_table["hg_tqg_mv_image_naked"]:setSize(cc.size(305,310))
		self.m_hougongMeinv_table["hg_tqg_mv_image_naked"]:setOpacity(0)
	
		local defaultBeautiQuality = g_game.g_dictConfigManager:getBeautyQuality(defaultBeautiId)
		
		for i = 1 , 5 do
			if i <= defaultBeautiQuality then
				self.m_hougongMeinv_table["hg_tqg_mv_xing"..i.."_image"]:setVisible(true)
			else
				self.m_hougongMeinv_table["hg_tqg_mv_xing"..i.."_image"]:setVisible(false)
			end
		end
		
		if g_game.g_f_meinv_quality_bg[defaultBeautiQuality] ~= "" then
			self.m_hougongMeinv_table["bg"]:setImage(g_game.g_f_meinv_quality_bg[defaultBeautiQuality])
			self.m_hougongMeinv_table["bg"]:setSize(cc.size(400,300))
			self.m_hougongMeinv_table["bg"]:setVisible(true)
		else
			self.m_hougongMeinv_table["bg"]:setVisible(false)
		end
		
		local defaultBeautiName = g_game.g_dictConfigManager:getBeautiName(defaultBeautiId)
		self.m_meinvInfo_table["nameText"]:setString(defaultBeautiName)
		
		local defaultBeautiLv = defaultCardInfo["beautyLevel"]
		self.m_meinvInfo_table["hg_tqg_mvinfo_lvnum_label"]:setString(defaultBeautiLv)
	
		self.m_meinvInfo_table["hg_tqg_qinmidu_num_label"]:setString(""..defaultCardInfo["beautyIntimacy"])
		
		self.m_meinvInfo_table["hg_tqg_xingquzhi_num_label"]:setString(""..defaultCardInfo["beautySavor"])
		
		self.m_meinvInfo_table["hg_tqg_jiaoyudian_num_label"]:setString(""..defaultCardInfo["beautyEducation"])
		
		self:setFavorButtonFace(defaultCardInfo["conceive"])
		
		if defaultCardInfo["beautyTitle"] ~= 0 then
			self.m_hougongMeinv_table["titile_image"]:setVisible(true)
			self.m_hougongMeinv_table["titile_image"]:setImage(self.tableTitle[defaultCardInfo["beautyTitle"]])
		else
			self.m_hougongMeinv_table["titile_image"]:setVisible(false)
		end
		
		--计算加成
		local beautyName = g_game.g_dictConfigManager:getBeautiName(defaultBeautiId)
		
		local jiachengId = g_game.g_dictConfigManager:getBeautyAdditionId(defaultBeautiId)
   	    local jiachengData = g_game.g_dictConfigManager:getBeautyAddition(jiachengId)
   	    local addPercent = 0
   		if defaultCardInfo["beautyTitle"] ~= 0 then
    		addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(defaultCardInfo["beautyTitle"])
   		end
   		
   	    local finalAddition = string.format("%.1f", jiachengData[5]/1000 + (defaultBeautiLv-1)*jiachengData[6]/1000 + addPercent)
        
		self.m_meinvInfo_table["zhuzhenjiacheng_label"]:setColor(cc.c3b(255,255,255))
		
		local textJineng = g_game.g_dictConfigManager:getLanTextById(jiachengData[3])
		self.m_meinvInfo_table["zhuzhenjiacheng_label"]:setString(textJineng.. finalAddition.."%")
		
	end
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_tangquangong] popupZongJiacheng
-- 弹出总加成
-------------------------------------------------------------------------------
function f_game_beauty_tangquangong:popupZongJiacheng()
	local meinvjiacheng_panel = f_card_zongjiacheng.static_create()
    meinvjiacheng_panel:panelInitBeforePopup(false)
	g_game.g_panelManager:showUiPanel(meinvjiacheng_panel,"card_zongjiacheng")
	meinvjiacheng_panel:loadmeinvZongjiachengData()
    	
end


function f_game_beauty_tangquangong:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_isNeedUpdate1)
	
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BEAUTY_FAVOR, self.event_updateBeautyFavorCallback)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PREGNANT_TIME, self.event_updatePregnantTimeCallback)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_BORN_PRINCE, self.event_updateGetBornPrinceCallBack)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updateBornPrinceName)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CHANGE_BEAUTY, self.event_updateBeautyOnboard)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateBeautyGongDou)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateBeautyGongDou)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_userInfo3)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REQUEST_OBTAIN_BORN_PRINCEID, self.event_request_boin_princeid)
	
end

function f_game_beauty_tangquangong:onEnterTransitionFinish()
end

function f_game_beauty_tangquangong:onExitTransitionStart()
end

function f_game_beauty_tangquangong:onCleanup()
end


function f_game_beauty_tangquangong:registerNodeEvent(handler)
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

function f_game_beauty_tangquangong:unregisterNodeEvent()
    self:unregisterScriptHandler()
end



return f_game_beauty_tangquangong