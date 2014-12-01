require("scripts.auto.auto_gongdou_bottom")
require("scripts.auto.auto_gongdou_bg")
require("scripts.game.main.beauty.f_game_beauty_allbeauty_card")
--[[--
宫斗美女界面
--]]--
f_game_beauty_gongdou = class("f_game_beauty_gongdou")
f_game_beauty_gongdou.__index = f_game_beauty_gongdou

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_game_beauty_gongdou.static_create()
	local gongdouBg_table = g_game.g_panelManager:create_panel("gongdou_bg")
	local gongdouBg_panel = gongdouBg_table["gongdou_bg"]

	local funTable = {}
	tolua.setpeer(gongdouBg_panel, funTable)
	setmetatable(funTable, f_game_beauty_gongdou)

	gongdouBg_panel.m_gongdouBg_table = gongdouBg_table
	return gongdouBg_panel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_gongdouBottomTable = nil
	
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_lvupBeautysData = {}
	
	self.COL			= 5
	self.ROW			= 2
	
	self.m_current_page = 1
	self.m_lvupTargetBeauty = nil
	
	self.m_selectedPage = {}
	
	self.m_rewardLv = 0
	self.m_rewardExp = 0
	self.m_rewardIntimacy = 0
	self.m_costSilver = 0
	
	self.m_isGongDouFinish = false

end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_gongdou] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:onEnter()
	
	self.m_gongdouBottomTable = creategongdou_bottom()
	local bottomPanel = self.m_gongdouBottomTable["gongdou_bottom"]
    self:appendComponent(bottomPanel)
    bottomPanel:setAnchorPoint(cc.p(0.5,0.5))
    bottomPanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
	
	self.m_gongdouBg_table["gd_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setComponentZOrder(10)
	
	self.m_gongdouBg_table["gd_biaoti_image"]:setVisible(true)
	self.m_gongdouBg_table["gd_delete_image"]:setVisible(false)
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	self.m_gongdouBg_table["gongdou_yinliang_num"]:setString(userSilver)
	
	self:initGongDouList()
	self:initAllComponent()
	
	self:resetGongDouSelectData()
	
	--发送新手指引消息
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BEAUTY_GONGDOU_OPEN)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] getFirstBeautyComponent
-- 用于新手指引，获取第一个美女组件
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:getFirstBeautyComponent()
	return self.m_item_array[1]
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] resetGongDouSelectData
-- 初始化 重置 宫斗 数据
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:resetGongDouSelectData()
	--消耗美女卡牌张数
	self.m_gongdouBottomTable["gd_btm_xiaohaomvk_num_label"]:setString(""..0)
	--消耗银两
	self.m_gongdouBottomTable["gd_btm_yinliang_num_label"]:setString(""..0)
	--消耗经验
	self.m_gongdouBottomTable["gd_btm_jignyan_num_label"]:setString(""..0)
	--等级
	self.m_gongdouBottomTable["gd_btm_keshengdao_num_label"]:setString("0/".. g_game.g_userInfoManager:getUserInfo()["level"])
	--亲密度
	self.m_gongdouBottomTable["gd_btm_qinmidu_num_label"]:setString(""..0)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] updateGongDouSelectData
-- 更新 宫斗选择吃卡的总 数据
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:updateGongDouSelectData()
	self.beautyCardNum = 0
	local costSilver = 0
	local gainExp = 0
	local gainLv = 0
	local gainIntimacy = 0
	for i = 1 , self.m_item_count do
		if self.m_lvupBeautysData[i]["canBeEatenSelect"] then
		
			self.beautyCardNum = self.beautyCardNum +1
			
			local beautyId = self.m_lvupBeautysData[i][1]["beautyId"]
			local beautyCostSilver = g_game.g_dictConfigManager:getBeautyEatenSilverCost(beautyId)
			
			costSilver = costSilver + beautyCostSilver
			
			local  beautyBaseExp = g_game.g_dictConfigManager:getBeautyEatenBaseExp(beautyId)
			local  beautyQuality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
			local  beautyLv = self.m_lvupBeautysData[i][1]["beautyLevel"]
			local  getUnAddExp = g_game.g_dictConfigManager:getBeautyUnAddExp(beautyQuality,beautyLv)
			
			gainExp = gainExp + (self.m_lvupBeautysData[i][1]["beautyExp"] + beautyBaseExp + getUnAddExp)*0.8
			gainIntimacy = gainIntimacy + self.m_lvupBeautysData[i][1]["beautyIntimacy"]
		end
	end
	
	local curExp = self.m_lvupTargetBeauty:getData()["beautyExp"]
	local curLv = self.m_lvupTargetBeauty:getData()["beautyLevel"]
	local curCardId = self.m_lvupTargetBeauty:getData()["beautyId"]
	
	--当前升级的目标卡牌可以升 多少级
	local curCardCanLv = self:calculateCardLvupNums(curCardId,curLv,curExp,gainExp)
	
	local targetLv = curLv + curCardCanLv
--	--消耗美女卡牌张数
	self.m_gongdouBottomTable["gd_btm_xiaohaomvk_num_label"]:setString(""..self.beautyCardNum)
--	--消耗银两
	self.m_gongdouBottomTable["gd_btm_yinliang_num_label"]:setString(""..costSilver)
--	--获得经验
	self.m_gongdouBottomTable["gd_btm_jignyan_num_label"]:setString("".. math.floor(gainExp))
--	--获得等级
	self.m_gongdouBottomTable["gd_btm_keshengdao_num_label"]:setString(""..targetLv .. "/" .. g_game.g_userInfoManager:getUserInfo()["level"])
--	--亲密度
	self.m_gongdouBottomTable["gd_btm_qinmidu_num_label"]:setString(""..gainIntimacy)
	
	self.m_rewardLv = curCardCanLv
	self.m_rewardExp = gainExp
	self.m_rewardIntimacy = gainIntimacy
	self.m_costSilver = costSilver
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] calculateCardTargetLv
-- 计算目标可升到多少级
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:calculateCardLvupNums(curCardId,curLv,curExp,gainExp)
	if gainExp == 0 then
		return 0
	end
	
	local canLvup = 0
	
	--加了获得经验后的经验值
	local targetMaxExp = curExp + gainExp
	--当前等级  达到 下一级时需的 卡牌经验值
	local quality = g_game.g_dictConfigManager:getBeautyQuality(curCardId)
	
	local referenceLv = curLv
	
	local targetNextLvNeedExp = g_game.g_dictConfigManager:getBeautiExpLimitByLv(referenceLv,quality)
	
	while targetMaxExp >= targetNextLvNeedExp do
		if referenceLv == g_game.MAX_USER_LV then
			canLvup = canLvup + 1
			print "reach the max card LV!!"
			break
		end	
		
		canLvup = canLvup + 1
	
		referenceLv = referenceLv + 1
		targetNextLvNeedExp = targetNextLvNeedExp + g_game.g_dictConfigManager:getBeautiExpLimitByLv(referenceLv,quality)
		
	end
	
	return canLvup
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] initGongDouList
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:initGongDouList()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
		self.m_page_container = nil
	end
	
	self.m_current_page = 1
	self.m_item_array = {}
	self.m_lvupBeautysData = {}
	self.m_item_count = 0
	self.m_total_pages = 0
	self.m_selectedPage  = {}
	
	local canBeEatenArr = g_game.g_userInfoManager:getCanBeEatenBeautyArr()
	self.m_item_count = table.getn(canBeEatenArr)
	
	if self.m_item_count == 0 then
		return
	end
	
	for i = 1, self.m_item_count do
		table.insert(self.m_lvupBeautysData,canBeEatenArr[i])
		canBeEatenArr[i]["isSelected"] = false
	end
	
	--美女按照 星级排序
	local compFunc = function(beauty1Data, beauty2Data)
		local beauty1Quality = g_game.g_dictConfigManager:getBeautyQuality(beauty1Data[1]["beautyId"])
		local beauty2Quality = g_game.g_dictConfigManager:getBeautyQuality(beauty2Data[1]["beautyId"])
		if beauty1Quality == beauty2Quality then
			if beauty1Data[1]["beautyLevel"] == beauty2Data[1]["beautyLevel"] then
				return beauty1Data[1]["beautyId"] > beauty2Data[1]["beautyId"]
			else
				return beauty1Data[1]["beautyLevel"] < beauty2Data[1]["beautyLevel"]
			end
		else
			return beauty1Quality < beauty2Quality
		end
	end
	table.sort(self.m_lvupBeautysData,compFunc)
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	for i = 1, self.m_total_pages do
		table.insert(self.m_selectedPage,0)
	end
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(911,500))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(20,45))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    local updatePageNum = function()
    	self:updatePageNum()
    end      
    self.m_page_container:registMovePageCallback(updatePageNum)
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 8, 10, 169,238)	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] updatePageNum
-- 更新页码
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:updatePageNum()
	self.m_current_page = self.m_page_container:getCurrentPageIndex()
	self:updatePageSelectState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] updatePageSelectState
-- 更新每一页全选的state
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:updatePageSelectState()
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_item_count then
		endIndex = 	self.m_item_count
	end
	
	
	local pageItemCount = endIndex - startIndex + 1
	local currentPageIsAllSelect = true
	for i = startIndex, endIndex do
		if self.m_lvupBeautysData[i]["isSelected"] == true then
		
		else
			currentPageIsAllSelect = false
		end
	end
	
	if currentPageIsAllSelect == true then
		self.m_selectedPage[self.m_current_page] = 1
	else
		self.m_selectedPage[self.m_current_page] = 0
	end
	
		
	if self.m_selectedPage[self.m_current_page] == 1 then
		self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(true)
		
		for i = 1, #self.m_item_array do			
			local otherbeauty =  self.m_item_array[i]
			local otherIndex  =  otherbeauty:getBeautyIndex()
			
			if otherIndex >= startIndex and otherIndex <= endIndex then
				if self.m_lvupBeautysData[otherIndex][1] == otherbeauty:getData() then	
					self.m_lvupBeautysData[otherIndex]["canBeEatenSelect"] = true				
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)				
					self.m_lvupBeautysData[otherIndex]["isSelected"] = true					
				end	
			end			
		end
		
	else
		self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
		
		for i = 1, #self.m_item_array do			
			local otherbeauty =  self.m_item_array[i]
			local otherIndex  =  otherbeauty:getBeautyIndex()
			
			if otherIndex >= startIndex and otherIndex <= endIndex then
				if self.m_lvupBeautysData[otherIndex]["isSelected"] == true then					
					self.m_lvupBeautysData[otherIndex]["canBeEatenSelect"] = true				
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)
				else				
					self.m_lvupBeautysData[otherIndex]["canBeEatenSelect"] = false	
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(false)				
				end	
			end		
		end
	end
	
	self:updateGongDouSelectData()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local beautyClickCallback = function(card)
		self:selectBeautyEvent(card)
	end
	
	local removeItem = function(card)
		self:removeItem(card)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if #self.m_lvupBeautysData >= i then
			local beautyCard = f_game_beauty_allbeauty_card.static_create()
			beautyCard:panelInitBeforePopup()
			beautyCard:setSize(cc.size(169,238))
			
			beautyCard:setBeautyIndex(i)
			beautyCard:setData(self.m_lvupBeautysData[i][1])
			beautyCard:setIsGongDou(true)
			
			beautyCard:setRemoveCallback(removeItem)
			beautyCard:setBeautyClickCallback(beautyClickCallback)
			
			self.m_page_container:addComponentToPage(beautyCard, pageIndex)
			
			table.insert(self.m_item_array, beautyCard)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] selectBeautyEvent
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:selectBeautyEvent(card)
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_item_count then
		endIndex = 	self.m_item_count
	end
	
	local index = card:getBeautyIndex()
	
	for j = 1, #self.m_item_array do	
		local otherbeauty =  self.m_item_array[j]
		local otherIndex  =  otherbeauty:getBeautyIndex()
		
		if otherIndex >= startIndex and otherIndex <= endIndex then	
			if card:getData() == otherbeauty:getData() then				
				if self.m_lvupBeautysData[otherIndex]["isSelected"] == true then
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(false)
					self.m_lvupBeautysData[index]["canBeEatenSelect"] = false
					self.m_lvupBeautysData[index]["isSelected"] = false
				else
					self.beautyCardNum = 0
					for i = 1 , self.m_item_count do
						if self.m_lvupBeautysData[i]["canBeEatenSelect"] then
							self.beautyCardNum = self.beautyCardNum +1
						end
					end
					if self.beautyCardNum >= 20 then
						g_game.g_utilManager:showMsg("同时最多可选择20张卡！")
						return
					end
					otherbeauty.m_componentTable["gd_card_xuanzhong_image"]:setVisible(true)
					self.m_lvupBeautysData[index]["canBeEatenSelect"] = true
					self.m_lvupBeautysData[index]["isSelected"] = true
				end
			end
		end
	end
	self:updatePageSelectState()
	self:updateGongDouSelectData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] removeItem
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:removeItem(card)
	local index = card:getBeautyIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getBeautyIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] onExit
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:onExit()
	self:unregisterNodeEvent()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:initAllComponent()
	local closeCallBack = function()
		self:deleteFromParent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_gongdouBg_table["gd_close_button"]:addHandleOfcomponentEvent(closeCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--升级
	local lvupBtnCallBack = function()
		self:levelupCurSelectCard()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_gongdouBottomTable["gd_shengji_button"]:addHandleOfcomponentEvent(lvupBtnCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--传递是否全选事件
	local allSelectCallBack = function()
		if self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:isCheckBoxSelectYes() then
			self:setIsSelectAllBeauty(true)
		else
			self:setIsSelectAllBeauty(false)
		end
	end
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:addHandleOfcomponentEvent(allSelectCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] setIsSelectAllBeauty
-- 是否全选当前 吞卡卡牌组
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:setIsSelectAllBeauty(isSelect)
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > self.m_item_count then
		endIndex = 	self.m_item_count
	end
	
	if isSelect then
		self.beautyCardNum = 0
		for i = 1 , self.m_item_count do
			if self.m_lvupBeautysData[i]["canBeEatenSelect"] then
				self.beautyCardNum = self.beautyCardNum +1
			end
		end
		local ins = 0
		for i = startIndex, endIndex do
			if not self.m_lvupBeautysData[i]["canBeEatenSelect"] then
				ins = ins + 1
			end
		end
		
		if self.beautyCardNum + ins > 20 then
			g_game.g_utilManager:showMsg("同时最多可选择20张卡！")
			self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
			return
		end
	end
	
	if isSelect then
		self.m_selectedPage[self.m_current_page] = 1
	else
		self.m_selectedPage[self.m_current_page] = 0
	end
	
	for i = startIndex, endIndex do
		self.m_lvupBeautysData[i]["canBeEatenSelect"] = isSelect
		self.m_lvupBeautysData[i]["isSelected"] = isSelect
	end
	
	for i = startIndex,endIndex do
		for j = 1, #self.m_item_array do
			if self.m_item_array[j]:getBeautyIndex() == i then
				self.m_item_array[j].m_componentTable["gd_card_xuanzhong_image"]:setVisible(self.m_lvupBeautysData[i]["isSelected"])
				break
			end
		end
	end

	self:updateGongDouSelectData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] levelupCurSelectCard
-- 升级当前card
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:levelupCurSelectCard()
	local targetBeauty = self.m_lvupTargetBeauty
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	
	local curLv = self.m_lvupTargetBeauty:getData()["beautyLevel"]
	local targetLv = self.m_rewardLv + curLv
	if targetLv > g_game.g_userInfoManager:getUserInfo()["level"] then
		g_game.g_utilManager:showMsg("卡牌等级不能超过皇帝等级")
		return
	end
	
	if userSilver < self.m_costSilver then
--		g_game.g_utilManager:showMsg("银两不足,进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		require("scripts.game.main.common.f_less_silver_tip_popup")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
	    return
	end

	if g_game.g_userInfoManager.m_isPopupEaten then
		
		if  self:isPopupLvupNotice() then
			local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
			g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
	   		--24 stand for 吞卡三星以上时
	   		popupEatLv3:popUpNotice(24)
	   		--1 stand for scale action
	   		popupEatLv3:setActionType(1)
	   		
	   		local yesEvent = function()
	   			self:sendlvupMessage()
	   		end
	   		popupEatLv3:setYesCallBack(yesEvent)
		
		else
			self:sendlvupMessage()
		end
	else  
		self:sendlvupMessage()
	end

	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] sendlvupMessage
-- 发送升级消息
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:sendlvupMessage()
	local data = self.m_lvupTargetBeauty:getData()
	g_game.g_userInfoManager:requestPalaceBattle(data["id"],data["beautyId"])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] updateGongDouResult
-- 更新宫斗的结果
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:updateGongDouResult()
	self.m_gongdouBottomTable["gd_quanxuan_checkbox"]:setCheckBoxSelect(false)
    --直接更新 数据  删除掉被吞掉的卡牌
	g_game.g_userInfoManager:updateBeautyListInfo()
	--直接更新 数据 被吞掉卡牌消失
	g_game.g_userInfoManager:updateCanbeEatenBeautyArr(self.m_lvupTargetBeauty)
	self:initGongDouList()
	
	self.m_isGongDouFinish = true
	
	if self.m_rewardLv ~= 0 then
		local popupLvUp = require("scripts.game.main.common.f_common_popup_notice").new()	
		g_game.g_panelManager:showUiPanel(popupLvUp,"notice_popup_panel")
	
		if LANGUAGE_TYPE == 3 then
			local lvupTips = "經驗+".. self.m_rewardExp .. "\n等級+" ..self.m_rewardLv
				 .. "\n親密度+" .. self.m_rewardIntimacy
			popupLvUp:setNoticeContent("升級成功","恭喜娘娘在宮鬥中打敗對手！！",lvupTips,nil)
		else
			local lvupTips = "经验+".. self.m_rewardExp .. "\n等级+" ..self.m_rewardLv
				 .. "\n亲密度+" .. self.m_rewardIntimacy
			popupLvUp:setNoticeContent("升级成功","恭喜娘娘在宫斗中打败对手！！",lvupTips,nil)
		end
		
		--25stand for 美女成功升级 notice
		popupLvUp:popUpNotice(25)
		--1 stand for scale action
		popupLvUp:setActionType(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI)
	else
		g_game.g_utilManager:showMsg("经验+"..self.m_rewardExp)
	end
	
	local battleResult = g_game.g_userInfoManager:getPalaceBattleResult()
	--减去消耗银两
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["silver"] = battleResult["remain"]
	
	self.m_gongdouBg_table["gongdou_yinliang_num"]:setString(userInfo["silver"])
	--目标 升级美女的经验 亲密度  等级改变
	local data = self.m_lvupTargetBeauty:getData()
	data["beautyExp"] = battleResult["exp"]
	data["beautyLevel"] = data["beautyLevel"] + self.m_rewardLv
	data["beautyIntimacy"] = battleResult["intimacy"]
	data["beautyEducation"] = battleResult["education"]
	
	self:resetGongDouSelectData()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PALACE_BATTLE)
end

function f_game_beauty_gongdou:isGongDouFinish()
	return self.m_isGongDouFinish
end

function f_game_beauty_gongdou:setGongDouFinish(b)
	 self.m_isGongDouFinish = b
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] isPopupLvupNotice
-- 是否弹出 升级提示面板
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:isPopupLvupNotice()
	
	for i = 1, self.m_item_count do
		--canBeEaten 为 true
		local beautyId = self.m_lvupBeautysData[i][1]["beautyId"]
		local quality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
		if self.m_lvupBeautysData[i]["canBeEatenSelect"] and quality >= 3 then
			return true
		end
	end
	
	return false
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:deleteFromParent()
	 g_game.g_panelManager:removeUiPanel("gongdou_bg")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_gongdou] setLvupTargetBeauty
-- 设置当前升级的 目标美女
-------------------------------------------------------------------------------
function f_game_beauty_gongdou:setLvupTargetBeauty(lvupTargetBeauty)
	self.m_lvupTargetBeauty = lvupTargetBeauty
	
	local initLv = self.m_lvupTargetBeauty:getData()["beautyLevel"]
	self.m_gongdouBottomTable["gd_btm_keshengdao_num_label"]:setString(""..initLv .. "/" .. g_game.g_userInfoManager:getUserInfo()["level"])
end

