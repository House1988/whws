require("scripts.auto.auto_meinvshuxing_title")
require("scripts.auto.auto_meinvshuxing_miaoshu")
require("scripts.auto.auto_meinvshuxing_info")
require("scripts.auto.auto_meinvshuxing_zisi")

require("scripts.game.main.beauty.f_game_beauty_gongdou")
require("scripts.game.main.beauty.f_game_beauty_cefeng")
require("scripts.game.main.huangzi.f_huangzi_shuxing_panel")
--[[--
   美女详情
--]]--

f_game_beauty_card_detail = class("f_game_beauty_card_detail")
f_game_beauty_card_detail.__index = f_game_beauty_card_detail


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_game_beauty_card_detail.static_create()
	local beautiTitleTable = createmeinvshuxing_title()
	local beautiTitle_panel = beautiTitleTable["meinvshuxing_title"]
	 
	local funTable = {}
	tolua.setpeer(beautiTitle_panel, funTable)
	setmetatable(funTable, f_game_beauty_card_detail)
	
	beautiTitle_panel.m_beauty_detailTitleTable = beautiTitleTable
	return beautiTitle_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_beauty_sonTable = nil
	self.m_beauty_infoTable = nil
	self.m_beauty_detailCardTable = nil
	
	self.m_detailBeauty = nil
	
	self.m_cefengPanel = nil
	
	self.m_radioBtnArr = {}
	self.m_cardHeadList = nil
	
	self.tableTitle = {}
	self.tableTitle[1] = "batch_ui/huanghou_cefeng.png"
	self.tableTitle[2] = "batch_ui/huangguifei_cefeng.png"
	self.tableTitle[3] = "batch_ui/guifei_cefeng.png"
	self.tableTitle[4] = "batch_ui/fei_cefeng.png"
	self.tableTitle[5] = "batch_ui/pin_cefeng.png"
	self.tableTitle[6] = "batch_ui/guiren_cefeng.png"
	self.tableTitle[7] = "batch_ui/changzai_cefeng.png"
	self.tableTitle[8] = "batch_ui/daying_cefeng.png"
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_card_detail] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:onEnter()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINVXIANGQING)
 
    self.m_beauty_infoTable = createmeinvshuxing_info()
    local detailCardInfo = self.m_beauty_infoTable["meinvshuxing_info"]
    self:appendComponent(detailCardInfo)
    detailCardInfo:setAnchorPoint(cc.p(0,1))
    detailCardInfo:setPositionInContainer(cc.p(0,62))
    
    self.m_beauty_detailCardTable = createmeinvshuxing_miaoshu()
    local detailCard = self.m_beauty_detailCardTable["meinvshuxing_miaoshu"]
    self:appendComponent(detailCard)
    detailCard:setAnchorPoint(cc.p(0,1))
    detailCard:setPositionInContainer(cc.p(0,60))
    
    self.m_beauty_sonTable = createmeinvshuxing_zisi()
    local sonPanel = self.m_beauty_sonTable["meinvshuxing_zisi"]
    self:appendComponent(sonPanel)
    sonPanel:setAnchorPoint(cc.p(0.5,0.5))
    sonPanel:setPositionInContainer(cc.p(480,552))
    self.m_beauty_sonTable["mnsx_zisi_bg_scale9"]:setComponentZOrder(3)
    self.m_beauty_sonTable["si"]:setComponentZOrder(4)
--    self.m_beauty_sonTable["mnsx_zisi__zisi_label"]:setComponentZOrder(4)
    
    
    self.m_radioBtnArr[1] = self.m_beauty_infoTable["att_btn"]
    self.m_radioBtnArr[2] = self.m_beauty_infoTable["intro_btn"]
    
    self:updateRadioBtnArr(1)
   
   	self.m_beauty_detailTitleTable["mvsx_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self:initAllComponent()
	
	--播放音效
--	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QINAN)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] updateRadioBtnArr
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:updateRadioBtnArr(index)
	for i = 1, #self.m_radioBtnArr do
		if index == i then
			self.m_radioBtnArr[i]:setIsEnabled(true)
			self.m_radioBtnArr[i]:setRadioButtonState(1)
		else
			self.m_radioBtnArr[i]:setIsEnabled(false)
			self.m_radioBtnArr[i]:setRadioButtonState(2)
		end
	end
	
	if index == 1 then
		self.m_beauty_infoTable["shuxing_panel"]:setVisible(true)
		self.m_beauty_infoTable["jieshao_panel"]:setVisible(false)
	else
		self.m_beauty_infoTable["shuxing_panel"]:setVisible(false)
		self.m_beauty_infoTable["jieshao_panel"]:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] updateData
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:updateData()
	local data = self.m_detailBeauty:getData()
	
	local beautiId = data["beautyId"]
	local beautyLv = data["beautyLevel"]
	
	self.m_beauty_infoTable["mnsx_info_dengji_num_label"]:setString(""..beautyLv)
	local curCardExp = data["beautyExp"]
	local quality = g_game.g_dictConfigManager:getBeautyQuality(beautiId)
	local curLvExpLimit = g_game.g_dictConfigManager:getBeautiExpLimitByLv(beautyLv,quality)
    
    if curCardExp > curLvExpLimit then
 		  print "card exp error!"
 		  curCardExp = curLvExpLimit
    end
    
    local percent = curCardExp / curLvExpLimit * 100
--    self.m_beauty_infoTable["mnsx_jingyan_loaing_bar"]:setPercent(percent)
	self.m_beauty_infoTable["mnsx_info_jingyan_num_label"]:setString(curCardExp.."/"..curLvExpLimit)
	
    self.m_beauty_infoTable["mnsx_info_qinmidu_num_label"]:setString(data["beautyIntimacy"])
    
    local jiachengId = g_game.g_dictConfigManager:getBeautyAdditionId(beautiId)
    local jiachengData = g_game.g_dictConfigManager:getBeautyAddition(jiachengId)
    self.m_beauty_infoTable["mnsx_info_zhuwei_num_label"]:setAlignment(0)
    
    local addPercent = 0
    if data["beautyTitle"] ~= 0 then
    	addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(data["beautyTitle"])
    end
    
    local finalAddition = string.format("%.1f", jiachengData[5]/1000 + (beautyLv-1)*jiachengData[6]/1000 + addPercent)
    
    local textJineng = g_game.g_dictConfigManager:getLanTextById(jiachengData[3])
 	self.m_beauty_infoTable["mnsx_info_zhuwei_num_label"]:setString(textJineng..finalAddition.."%")
	
	if data["beautyTitle"] == 0 then
		self.m_beauty_infoTable["mnsx_info_ewaijiacheng_label"]:setString("【立妃后激活，册封后有额外加成】")
--		self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setColor(cc.c3b(255,0,0))
--		self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setString("无")
	else
		self.m_beauty_infoTable["mnsx_info_ewaijiacheng_label"]:setString("")	
		local title = g_game.g_dictConfigManager:getTitle(data["beautyTitle"])
--		self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setColor(cc.c3b(255,0,0))
--		self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setString(title)
	end
	
	if data["beautyTitle"] ~= 0 then
		self.m_beauty_detailCardTable["titile_image"]:setVisible(true)
		self.m_beauty_detailCardTable["titile_image"]:setImage(self.tableTitle[data["beautyTitle"]])
	else
		self.m_beauty_detailCardTable["titile_image"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] setDetail
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:setDetail(beauty)
	self.m_detailBeauty = beauty
	local data = beauty:getData()
	
	local hasButton = data["id"] ~= 0
	
	self.m_beauty_infoTable["mnsx_gongdou_button"]:setVisible(hasButton)
	self.m_beauty_infoTable["mnsx_cefeng_button"]:setVisible(hasButton)
	
	self.m_beauty_detailCardTable["mnsx_huaiyun_tag1"]:setVisible(false)
	self.m_beauty_detailCardTable["mnsx_huaiyun_tag2"]:setVisible(false)

	if data ~= nil then
	
		if data["conceive"] ~= 0 then
			self.m_beauty_detailCardTable["mnsx_huaiyun_tag1"]:setVisible(true)
			self.m_beauty_detailCardTable["mnsx_huaiyun_tag2"]:setVisible(true)
		end
		
		local beautiId = data["beautyId"]
		local desc = g_game.g_dictConfigManager:getBeautyDesc(beautiId)
		
		self.m_beauty_infoTable["mnsx_miaoshu_label"]:setAlignment(0)
		self.m_beauty_infoTable["mnsx_miaoshu_label"]:setString("    "..desc)
		
		local beautyName = g_game.g_dictConfigManager:getBeautiName(beautiId)
		self.m_beauty_infoTable["mnsx_touxiang_name_label"]:setString(beautyName)
		
		local beautyLv = data["beautyLevel"]
		
		local quality = g_game.g_dictConfigManager:getBeautyQuality(beautiId)
		for i = 1 , 5 do
			if i <= quality then
				self.m_beauty_detailCardTable["mnsx_xingxing"..i.."_image"]:setVisible(true)
			else
				self.m_beauty_detailCardTable["mnsx_xingxing"..i.."_image"]:setVisible(false)
			end
		end
		
		local selectBeautiName = g_game.g_dictConfigManager:getBeautyResource(beautiId)
		local beautiImage = g_game.g_resourceManager:getBeautyDressedImage(selectBeautiName)
		self.m_beauty_detailCardTable["mnsx_touxiang_image"]:setImage(beautiImage)
		self.m_beauty_detailCardTable["mnsx_touxiang_image"]:setSize(cc.size(348,354))
		if g_game.g_f_meinv_quality_bg[quality] ~= "" then
			self.m_beauty_detailCardTable["bg"]:setImage(g_game.g_f_meinv_quality_bg[quality])
			self.m_beauty_detailCardTable["bg"]:setSize(cc.size(350,354))
			self.m_beauty_detailCardTable["bg"]:setVisible(true)
		else
			self.m_beauty_detailCardTable["bg"]:setVisible(false)
		end
		
	
		self.m_beauty_infoTable["mnsx_info_dengji_num_label"]:setString(""..beautyLv)
		
		local curCardExp = data["beautyExp"]
		local curLvExpLimit = g_game.g_dictConfigManager:getBeautiExpLimitByLv(beautyLv,quality)
   	    
   	    if curCardExp > curLvExpLimit then
     		  print "card exp error!"
     		  curCardExp = curLvExpLimit
  	    end
  	    
  	    local percent = curCardExp / curLvExpLimit * 100
--  	    self.m_beauty_infoTable["mnsx_jingyan_loaing_bar"]:setPercent(percent)
		self.m_beauty_infoTable["mnsx_info_jingyan_num_label"]:setString(curCardExp.."/"..curLvExpLimit)
		
   	    self.m_beauty_infoTable["mnsx_info_qinmidu_num_label"]:setString(data["beautyIntimacy"])
   	    
   	    local jiachengId = g_game.g_dictConfigManager:getBeautyAdditionId(beautiId)
   	    local jiachengData = g_game.g_dictConfigManager:getBeautyAddition(jiachengId)
   	    self.m_beauty_infoTable["mnsx_info_zhuwei_num_label"]:setAlignment(0)
--   	    self.m_beauty_infoTable["mnsx_info_zhuwei_num_label"]:setWidth(290)
   	    
   	    local addPercent = 0
   	    if data["beautyTitle"] ~= 0 then
   	    	addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(data["beautyTitle"])
   	    end
   	    
   	    local finalAddition = string.format("%.1f", jiachengData[5]/1000 + (beautyLv-1)*jiachengData[6]/1000+ addPercent)
   	    
   	    local textJineng = g_game.g_dictConfigManager:getLanTextById(jiachengData[3])
	 	self.m_beauty_infoTable["mnsx_info_zhuwei_num_label"]:setString(textJineng..finalAddition.."%")
		
		if data["beautyTitle"] == 0 then
			self.m_beauty_infoTable["mnsx_info_ewaijiacheng_label"]:setString("【立妃后激活，册封后有额外加成】")
--			self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setColor(cc.c3b(255,0,0))
--			self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setString("无")
		else
			self.m_beauty_infoTable["mnsx_info_ewaijiacheng_label"]:setString("")	
			local title = g_game.g_dictConfigManager:getTitle(data["beautyTitle"])
--			self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setColor(cc.c3b(255,0,0))
--			self.m_beauty_infoTable["mnsx_cefeng_name_label"]:setString(title)
		end
		
		if data["beautyTitle"] ~= 0 then
			self.m_beauty_detailCardTable["titile_image"]:setVisible(true)
			self.m_beauty_detailCardTable["titile_image"]:setImage(self.tableTitle[data["beautyTitle"]])
		else
			self.m_beauty_detailCardTable["titile_image"]:setVisible(false)
		end
		
		if data["princeList_Num"] == 0 then
			return
		end
		
		if self.m_cardHeadList == nil then
			local princeBattleList = g_game.g_userInfoManager:getPrinceData()["battleList"]
			local princeUnBattleList = 	g_game.g_userInfoManager:getPrinceData()["unbattleList"]
			local sonsDataTable = {}
			
			for i = 1 , data["princeList_Num"] do
				for j = 1,	#princeBattleList do
					if data["princeList"][i]["princeId"] == princeBattleList[j]["id"] then
						table.insert(sonsDataTable,princeBattleList[j])
					end
				end			
			end
			for i = 1 , data["princeList_Num"] do
				for j = 1,	#princeUnBattleList do
					if data["princeList"][i]["princeId"] == princeUnBattleList[j]["id"] then
						table.insert(sonsDataTable,princeUnBattleList[j])					
					end
				end			
			end
			
			self.m_cardHeadList = require("scripts.game.main.beauty.f_game_beauty_sons_list").new()	
			self.m_beauty_sonTable["meinvshuxing_zisi"]:appendComponent(self.m_cardHeadList)
			self.m_cardHeadList:setSize(cc.size(850,102))
			self.m_cardHeadList:setListInfo(1, 0, 30, 102, 102)
			self.m_cardHeadList:setComponentZOrder(2)
			self.m_cardHeadList:setAnchorPoint(cc.p(0,1))
			self.m_cardHeadList:setPositionInContainer(cc.p(130, 45))
			self.m_cardHeadList:setSonsData(sonsDataTable)
			
			local selectCardCallBack = function()
		    	self:showPrinceDetail()
		    end
		    self.m_cardHeadList:setSelectCallBack(selectCardCallBack)
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] showPrinceDetail
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:showPrinceDetail()
	local select =  self.m_cardHeadList:getSelectCard()
	local data = select:getData()
	if select ~= nil then
		local huangzi_shuxing_panel = f_huangzi_shuxing_panel.static_create()
	    huangzi_shuxing_panel:panelInitBeforePopup()
	    huangzi_shuxing_panel:setStopTouchEvent(true)	
		huangzi_shuxing_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))	
		
		g_game.g_panelManager:showUiPanel(huangzi_shuxing_panel, "huangzishuxing_bg")
		
		huangzi_shuxing_panel:setPrinceData(data, true)	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] onExit
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:onExit()  
  self:unregisterNodeEvent()
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateDetailBeautyGongDou)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefengCallback)
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:initAllComponent()
	local shuxingClick = function()
		self:updateRadioBtnArr(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_beauty_infoTable["att_btn"]:addHandleOfcomponentEvent(shuxingClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local jieshaoClick = function()
		self:updateRadioBtnArr(2)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_beauty_infoTable["intro_btn"]:addHandleOfcomponentEvent(jieshaoClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	local cefengInDetail = function()
		self:cefeng()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_beauty_infoTable["mnsx_cefeng_button"]:addHandleOfcomponentEvent(cefengInDetail,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local gongdouInDetail = function()
		self:gongdou()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_beauty_infoTable["mnsx_gongdou_button"]:addHandleOfcomponentEvent(gongdouInDetail,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--关闭当前按钮
	local closeCurrentPanel = function()
		self:deleteFromParent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_beauty_detailTitleTable["mvsx_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--注册更新  宫斗以后的美女数据
	self.event_updateDetailBeautyGongDou = function()
		self:updateData()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE, self.event_updateDetailBeautyGongDou)
	
	self.event_updateCefengCallback = function()
		self:updateData()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefengCallback)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] cefeng
-- 册封
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:cefeng()

	if g_game.g_userInfoManager:getUserLv() < 25 then
		local str = g_game.g_dictConfigManager:getLanTextById(408)
		g_game.g_utilManager:showMsg(str)
		return
	end
	local cefengPanel = f_game_beauty_cefeng.static_create()
	cefengPanel:panelInitBeforePopup()
	cefengPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(cefengPanel,"hougong_cefeng_bg")
    cefengPanel:setCefengBeauty(self.m_detailBeauty)
    cefengPanel:initCefengTitleList()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] gongdou
-- 宫斗
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:gongdou()
	g_game.g_userInfoManager:updateCanbeEatenBeautyArr(self.m_detailBeauty)
	
	local gongdouPanel = f_game_beauty_gongdou.static_create()
	gongdouPanel:panelInitBeforePopup()
	gongdouPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(gongdouPanel,"gongdou_bg")
    gongdouPanel:setLvupTargetBeauty(self.m_detailBeauty)
    
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_card_detail] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_game_beauty_card_detail:deleteFromParent()
	g_game.g_panelManager:removeUiPanel("meinvshuxing_title")
end

