require("scripts.auto.auto_kunninggong_bg")
require("scripts.auto.auto_kunninggong_detail")

--[[
	坤宁宫 
]]--

local f_game_beauty_kunninggong = class("f_game_beauty_kunninggong", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_kunninggong")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:ctor()
    
    self:registerNodeEvent()   
    
  	self.m_kunninggong_bg_table = nil
  	self.m_kunninggong_detail_table = nil
  	
  	self.m_noticeTable = nil
  	
  	self.m_beautyTitleList = nil
  	
  	self.m_curTitleIndex = 0
  	
  	self.m_beautysInTitleTable = nil

	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:onEnter()   
	self.m_kunninggong_bg_table = createkunninggong_bg()
	local kunninggong = self.m_kunninggong_bg_table["kunninggong_bg"]
    self:appendComponent(kunninggong)
    kunninggong:setAnchorPoint(cc.p(0,1))
    kunninggong:setPositionInContainer(cc.p(0,8))

	self.m_kunninggong_detail_table = createkunninggong_detail()
	local kunninggongDetail = self.m_kunninggong_detail_table["kunninggong_detail"]
    self:appendComponent(kunninggongDetail)
    kunninggongDetail:setAnchorPoint(cc.p(0,1))
    kunninggongDetail:setPositionInContainer(cc.p(0,8))
    
    self.m_beautyTitleList = require("scripts.game.main.beauty.f_game_beauty_kng_title_list").new()
	self:appendComponent(self.m_beautyTitleList)
	self.m_beautyTitleList:setSize(cc.size(200,517))
	self.m_beautyTitleList:setListInfo(1,10,0,200,84)
	self.m_beautyTitleList:setStopTouchEvent(true)	
	self.m_beautyTitleList:enableClipping(true)
	self.m_beautyTitleList:setAnchorPoint(cc.p(0,1))
	self.m_beautyTitleList:setPositionInContainer(cc.p(10,29))
	
	local selectTitleCallBack = function(selectTitle)
		local index = selectTitle:getTitleIndex()
		self:updateTitle(index)
	end
	self.m_beautyTitleList:setUpdateSelectTitleCallBack(selectTitleCallBack)
	
	self.m_beautysInTitleTable = require("scripts.game.main.beauty.f_game_beauty_kng_beautys_table").new()
	self.m_beautysInTitleTable:setSize(cc.size(348,360))
	self.m_beautysInTitleTable:setTableInfo(3,2,5,5,165,232)
	self:appendComponent(self.m_beautysInTitleTable)
	self.m_beautysInTitleTable:setStopTouchEvent(true)	
	self.m_beautysInTitleTable:enableClipping(true)
	self.m_beautysInTitleTable:setAnchorPoint(cc.p(0,1))
	self.m_beautysInTitleTable:setPositionInContainer(cc.p(570,84))
	
	
	self.m_kunninggong_detail_table["kng_card_cefeng_button"]:setPositionInContainer(cc.p(828-90,503.5))
    local cefeng = function()
		self:cefengSelectCard()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_kunninggong_detail_table["kng_card_cefeng_button"]:addHandleOfcomponentEvent(cefeng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    self.m_kunninggong_detail_table["kng_card_qifei_button"]:setVisible(false)
--    local qifei = function()
--		self:qifeiSelectCard()
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--	end
--	self.m_kunninggong_detail_table["kng_card_qifei_button"]:addHandleOfcomponentEvent(qifei,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    self.event_updateCefengEvent = function()
		local titleIndex = self.m_beautyTitleList:getSelectTitle():getTitleIndex()
		self:updateTitleGroup(titleIndex)
		self:updateTitleInfo(titleIndex)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefengEvent)
	
--	self.m_kunninggong_detail_table["kng_detail_qinmidu_num_label"]:setAlignment(0)
--	self.m_kunninggong_detail_table["kng_detail_yinliang_num_label"]:setAlignment(0)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] updateTitle
-- 更新当前group
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:updateTitle(selectIndex)
	if self.m_curTitleIndex ~= selectIndex then
  		self.m_curTitleIndex = selectIndex
	else
		return
	end
	
	self:updateTitleGroup(self.m_curTitleIndex)
	self:updateTitleInfo(self.m_curTitleIndex)
--	self:updateQifeiBtn()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] updateTitleGroup
-- 更新group
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:updateTitleGroup(index)
	local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(self.m_curTitleIndex)
	
	self.m_beautysInTitleTable:updateTable(groupBeauty)
end

function f_game_beauty_kunninggong:setTitleZhiWei(index)
	local t = g_game.g_cefeng_words[index]
	for i = 1, 5 do
		self.m_kunninggong_detail_table["name" .. i]:setVisible(false)
	end
	if #t == 1 then
		self.m_kunninggong_detail_table["name2"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_kunninggong_detail_table["name2"]:setVisible(true)
	elseif #t == 2 then
		self.m_kunninggong_detail_table["name4"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_kunninggong_detail_table["name4"]:setVisible(true)
		self.m_kunninggong_detail_table["name5"]:setImage("batch_ui/" .. t[2] .. ".png")
		self.m_kunninggong_detail_table["name5"]:setVisible(true)
	else
		self.m_kunninggong_detail_table["name1"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_kunninggong_detail_table["name1"]:setVisible(true)
		self.m_kunninggong_detail_table["name2"]:setImage("batch_ui/" .. t[2] .. ".png")
		self.m_kunninggong_detail_table["name2"]:setVisible(true)
		self.m_kunninggong_detail_table["name3"]:setImage("batch_ui/" .. t[3] .. ".png")
		self.m_kunninggong_detail_table["name3"]:setVisible(true)
	end 
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] updateTitleInfo
-- 更新title info
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:updateTitleInfo(index)
	
	self:setTitleZhiWei(index)

	local desc = g_game.g_dictConfigManager:getTitleDes(index)
--	self.m_kunninggong_detail_table["kng_detail_feiweimiaoshu_label"]:setAnchorPoint(cc.p(0, 1))
	self.m_kunninggong_detail_table["kng_detail_feiweimiaoshu_label"]:setAlignment(0)
--	self.m_kunninggong_detail_table["kng_detail_feiweimiaoshu_label"]:setPositionInContainer(cc.p(24,60))
	self.m_kunninggong_detail_table["kng_detail_feiweimiaoshu_label"]:setString(desc)

	local qinmidu = g_game.g_dictConfigManager:getTitleQinmidu(index)	
	self.m_kunninggong_detail_table["kng_detail_qinmidu_num_label"]:setString(qinmidu)
	
	local silver = g_game.g_dictConfigManager:getTitleCostSilver(index)
	self.m_kunninggong_detail_table["kng_detail_yinliang_num_label"]:setString(silver)
	
	local princessAdditionPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(index)
	
	local princeAdditionPercent = g_game.g_dictConfigManager:getTitlePrinceAddition(index)
	
	local additionDesc = "美女技能效果加成  +" .. princessAdditionPercent --.. "%\n" .. "教育皇子经验加成  +" .. princeAdditionPercent .."%"
	self.m_kunninggong_detail_table["kng_detail_jiacheng_num_label"]:setAlignment(0)
	self.m_kunninggong_detail_table["kng_detail_jiacheng_num_label"]:setWidth(275)
	self.m_kunninggong_detail_table["kng_detail_jiacheng_num_label"]:setString(additionDesc)

	local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(index)
	local groupNum = #groupBeauty
	local titleLimit = g_game.g_dictConfigManager:getTitleLimit(index)
	
	if LANGUAGE_TYPE == 3 then
		if titleLimit == 0 then
			self.m_kunninggong_detail_table["kng_detail_dangweizhe_num_label"]:setString("目前當位者 ("..groupNum ..")")
		else
			self.m_kunninggong_detail_table["kng_detail_dangweizhe_num_label"]:setString("目前当位者 ("..groupNum .."/".. titleLimit..")")
		end
	else
		if titleLimit == 0 then
			self.m_kunninggong_detail_table["kng_detail_dangweizhe_num_label"]:setString("目前當位者 ("..groupNum ..")")
		else
			self.m_kunninggong_detail_table["kng_detail_dangweizhe_num_label"]:setString("目前当位者 ("..groupNum .."/".. titleLimit..")")
		end
	end
	
	
	
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] cefengSelectCard
-- 册封当前卡牌
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:cefengSelectCard()

	if g_game.g_userInfoManager:getUserLv() < 25 then
		local str = g_game.g_dictConfigManager:getLanTextById(408)
		g_game.g_utilManager:showMsg(str)
		return
	end    
	--为某一个title册封 妃位
	local index = self.m_beautyTitleList:getSelectTitle():getTitleIndex()
	local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(index)
	
	local groupNum = #groupBeauty
	local titleLimit = g_game.g_dictConfigManager:getTitleLimit(index)
	
	if groupNum == titleLimit and titleLimit ~=0 then
		local cefengTest = require("scripts.game.main.common.f_common_popup_notice").new()	
		g_game.g_panelManager:showUiPanel(cefengTest,"notice_popup_panel")
		cefengTest:setNoticeContent("提示","当前妃位人员已满，请皇上先割爱选一位娘娘弃妃吧！",nil,nil)
		--1 stand for 弃妃
		cefengTest:popUpNotice(2)
		--1 stand for scale action
		cefengTest:setActionType(1)
	
	else
		local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
		local needCostSilver =  g_game.g_dictConfigManager:getTitleCostSilver(index)
		
		if userSilver >= needCostSilver then
			local kunningPromotePanel = require("scripts.game.main.beauty.f_game_beauty_kng_promote_beauty").new()
			kunningPromotePanel:setSize(cc.size(960, 640))	
			kunningPromotePanel:setStopTouchEvent(true)
			g_game.g_panelManager:showUiPanel(kunningPromotePanel,"meinv_promote_ui")
			kunningPromotePanel:setTitleGroupIndex(index)
		
		else
--		    g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
			require("scripts.game.main.common.f_less_silver_tip_popup")
			local panel = f_less_silver_tip_popup.static_create()
			g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] updateQifeiBtn
-- 更新弃妃按钮
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:updateQifeiBtn()
	local index = self.m_beautyTitleList:getSelectTitle():getTitleIndex()
	local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(index)
	local groupNum = #groupBeauty
	
	self.m_kunninggong_detail_table["kng_card_qifei_button"]:setVisible(groupNum > 0)
end 

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] qifeiSelectCard
-- 弃妃当前卡牌
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:qifeiSelectCard() 
	local selectCard = self.m_beautysInTitleTable:getSelectCard()
	
	local index = self.m_beautyTitleList:getSelectTitle():getTitleIndex()
	local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(index)
	local groupNum = #groupBeauty
	
	if groupNum == 0 then
		return
	end
	
	local popQifei = require("scripts.game.main.common.f_common_popup_notice").new()	
	g_game.g_panelManager:showUiPanel(popQifei,"notice_popup_panel")
	popQifei:setNoticeContent("提示","皇上您确定将娘娘贬为普通秀女么",nil,nil)
	--1 stand for 弃妃
	popQifei:popUpNotice(1)
	--1 stand for scale action
	popQifei:setActionType(1)
	
	local yesCallBack = function()
		self:sendQifeiMessage()
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_QIFEI)
	end
	popQifei:setYesCallBack(yesCallBack)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] sendQifeiMessage
-- 发送弃妃 message
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:sendQifeiMessage()   
	local selectCard = self.m_beautysInTitleTable:getSelectCard()
	
	local id = selectCard:getData()["id"]
	local beautyId = selectCard:getData()["beautyId"]
	
	g_game.g_userInfoManager:requestQiFei(id,beautyId)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] updateQifeiResult
-- 更新弃妃 结果
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:updateQifeiResult()
	local index = self.m_beautyTitleList:getSelectTitle():getTitleIndex()
	local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(index)
	
	local selectCard = self.m_beautysInTitleTable:getSelectCard()
	local data = selectCard:getData()
	
	for i = 1, table.getn(groupBeauty) do
		if data["id"] == groupBeauty[i]["id"] then
			groupBeauty[i]["beautyTitle"]  = 0
			data["beautyTitle"] = 0 
		end
	end
	
	self:updateTitleGroup(index)
	self:updateTitleInfo(index)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] onExit
-- exit
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:onExit()    
    self:unregisterNodeEvent()
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefengEvent)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kunninggong] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_kunninggong] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_kunninggong:unregisterNodeEvent()
    self:unregisterScriptHandler()
end



return f_game_beauty_kunninggong