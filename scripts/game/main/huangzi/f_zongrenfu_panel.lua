require("scripts.game.main.huangzi.f_huangzi_xuanze_card")
require("scripts.game.main.common.f_common_floating_notice")

--[[--
	宗人府 界面
--]]--
f_zongrenfu_panel = class("f_zongrenfu_panel")
f_zongrenfu_panel.__index = f_zongrenfu_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_zongrenfu_panel.static_create()
	local huangzi_zongrenfu_table = createhuangzi_zongrenfu()
	local huangzi_zongrenfu_panel = huangzi_zongrenfu_table["huangzi_zongrenfu"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_zongrenfu_panel, funTable)
	setmetatable(funTable, f_zongrenfu_panel)
	
	huangzi_zongrenfu_panel.m_componentTable = huangzi_zongrenfu_table
	return huangzi_zongrenfu_panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_zongrenfu_panel:panelInitBeforePopup()
	self:registerNodeEvent()	
	
	self.m_total_pages	= 0	
	self.m_current_page = 1
	self.m_huangzi_count= 0
	self.COL			= 5
	self.ROW			= 2
	
	self.m_page_container = nil
	self.m_danye_huangzi_array	= {}
	self.m_huangzi_array = {}
	
	self.m_isPopZongrenfuSanxing = true --弹出提示（宗人府界面只弹出一次）
	
	--依据当前选中皇子需要的更新的数据
	self.m_xuangzhong_huangzi_num = 0 --记录当前选中皇子的个数
	self.m_kede_jingyan = 0 --记录当前可以获得经验
	self.m_xiaohao_yinliang = 0 --记录当前需要消耗的银两
	self.m_keshengzhi_jibie = 0 --记录当前可以到的等级
	self.m_shengji_exp      = 0 --记录升级后不足升到下一级的等级	
	
	self.m_targetPrinceData = nil
	self.m_xuanzhong_record = {} -- 记录被选中的索引	
	
	self.TYPE_LV_UP = 1
	self.TYPE_SELL = 2
	self.m_type = self.TYPE_LV_UP
	
	self.m_kede_silver = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] setType
-------------------------------------------------------------------------------
function f_zongrenfu_panel:setType(type)
	self.m_type = type
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] setTargetPrinceData
-- 设置当前皇子的信息
-------------------------------------------------------------------------------
function f_zongrenfu_panel:setTargetPrinceData(data)
	if self.m_targetPrinceData == data then
		return
	end

	self.m_targetPrinceData = data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] loadHuangziData
-- 加载皇子信息（未上阵皇子 并且 不是目标皇子）
-------------------------------------------------------------------------------
function f_zongrenfu_panel:loadHuangziData()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_componentTable["hz_zzf_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["hz_zzf_back_page_button"]:setComponentZOrder(10)
	self.m_componentTable["hz_zzf_quanxuan_check_box"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_componentTable["hz_zzf_quanxuan_check_box"]:setComponentZOrder(10)
	
	--获取到所有需要显示皇子列表（未上阵 && 不是目标皇子）
	local huangziInfo = g_game.g_userInfoManager:getPrinceData()
	local unbattleList   = huangziInfo["unbattleList"]

	for i = 1, #unbattleList do
		if self.m_type == self.TYPE_LV_UP then
			if self.m_targetPrinceData["id"] ~= unbattleList[i]["id"] then 
				self.m_huangzi_count = self.m_huangzi_count + 1
				table.insert(self.m_huangzi_array, unbattleList[i])
			end
		elseif self.m_type == self.TYPE_SELL then
			self.m_huangzi_count = self.m_huangzi_count + 1
			table.insert(self.m_huangzi_array, unbattleList[i])
		end
	end
	
	--排序皇子列表（第一关键字：星级 第二关键字：等级）
	local compFunc = function(huangzi1, huangzi2)
		--获取到名臣星级
		local huangziStar1 = huangzi1["princeStar"]
		local huangziStar2 = huangzi2["princeStar"]
		if huangzi1["princeStar"] == huangzi2["princeStar"] then
			if huangzi1["princeLevel"] == huangzi2["princeLevel"] then
				return huangzi1["princeResource"] > huangzi2["princeResource"]
			else
				return huangzi1["princeLevel"] < huangzi2["princeLevel"]
			end
		else
			return huangzi1["princeStar"] < huangzi2["princeStar"]
		end
	end
	table.sort(self.m_huangzi_array,compFunc)
	
	--设置相对应的选择记录数组
	self.m_xuanzhong_record = nil
	self.m_xuanzhong_record = {}
	for i = 1, self.m_huangzi_count do
		self.m_xuanzhong_record[i] = 0
	end
	
	self.m_total_pages = math.ceil(self.m_huangzi_count / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self.m_page_container:setSize(cc.size(880, 492))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setAnchorPoint(cc.p(0.5, 1))
	self.m_page_container:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, 52))
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    local updataPageNum = function()
    	self:updataPageNum()
    end      
    self.m_page_container:registMovePageCallback(updataPageNum)
   
	self.m_page_container:setPageInfo(self.m_huangzi_count, self.ROW, self.COL, 10, 0, 176,226)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] updataPageNum
-- 更新页码
-------------------------------------------------------------------------------
function f_zongrenfu_panel:updataPageNum()
	--更新page num信息
	self.m_current_page = self.m_page_container:getCurrentPageIndex()
	
	--依据当前页的选中情况来设置全选按钮的状态
	self:updateQuanxuanState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] loadPageData
-- 刷新皇子列表
-------------------------------------------------------------------------------
function f_zongrenfu_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local itemCallback = function(index)
		self:updateSelectItem(index)
	end
	
	local removeItem = function(index)
		self:removeItem(index)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	local itemCount = 1
	for i = startIndex, endIndex do
		if #self.m_huangzi_array >= i then
			itemCount = itemCount + 1
			
			local row = 1
			local col = 1
			if itemCount < (self.COL + 1) then
				row = 1
				col = itemCount
			else
				row = 2
				col = itemCount - self.COL
			end
			
			local item = f_huangzi_xuanze_card.static_create()
			item:panelInitBeforePopup()
			self.m_page_container:addComponentToPage(item, pageIndex)
			item:setDuigouVisible(false)
			item:setDuigouDiVisible(true)
			item.m_componentTable["hzxz_card_xuanzhong_image"]:setVisible(false)
			
			item:setDujunVisible(false)
			
			item:setIndex(i)
			item:setData(self.m_huangzi_array[i])				
			item:setHuangziCardEventCallBack(itemCallback)
			item:setPrinceRemoveFromListCallback(removeItem)
			if self.m_xuanzhong_record[i] == 0 then 
				item:setDuigouVisible(false)
			else
				item:setDuigouVisible(true)
			end
			
			table.insert(self.m_danye_huangzi_array, item)	
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] updateSelectItem
-- 刷新选中皇子的状态（打上对勾 - 添加到选中索引中 - 更新界面底部数据显示）
-------------------------------------------------------------------------------
function f_zongrenfu_panel:updateSelectItem(index)
	--获得到当前卡牌的皇子信息
	local huangziInfo = self.m_huangzi_array[index]	
	--计算当前卡的可以贡献的经验 基础经验+额外经验
	local  princeQuality = huangziInfo["princeStar"]
	local  princeLv = huangziInfo["princeLevel"]
	local  getUnAddExp = g_game.g_dictConfigManager:getPrinceUnAddExp(princeQuality,princeLv)
	local gongxianJingyan = getUnAddExp + g_game.g_dictConfigManager:getPrinceMergeExp(huangziInfo["princeStar"]) + huangziInfo["exp"]
	gongxianJingyan = gongxianJingyan*0.8
	--计算当前卡吞并需要消耗的银两
	local xiaohaoYinliang = g_game.g_dictConfigManager:getPrinceMergeYinliang(huangziInfo["princeStar"])
	
	--计算当前被吞卡可获得的银两
	local sellCardGetSilver = g_game.g_dictConfigManager:getSellPrinceSilver(huangziInfo["princeLevel"],huangziInfo["princeStar"])
	
	--获得到对应的卡牌
	local card = nil
	for i = 1, #self.m_danye_huangzi_array do
		if huangziInfo["id"] == self.m_danye_huangzi_array[i]:getData()["id"] then
			card = self.m_danye_huangzi_array[i]
			break	
		end	
	end	
	--如果已经被选中
	if card ~= nil then
		if self.m_xuanzhong_record[index] == 1 then
			self.m_xuangzhong_huangzi_num = self.m_xuangzhong_huangzi_num - 1
			self.m_kede_jingyan = self.m_kede_jingyan - gongxianJingyan
			self.m_xiaohao_yinliang  = self.m_xiaohao_yinliang - xiaohaoYinliang
			self.m_kede_silver = self.m_kede_silver - sellCardGetSilver
			--去除对勾
			card:setDuigouVisible(false)
			--移除选中记录
			self.m_xuanzhong_record[index] = 0
		elseif self.m_xuanzhong_record[index] == 0 then
			if self.m_xuangzhong_huangzi_num >= 20 then
				g_game.g_utilManager:showMsg("同时最多可选择20张卡！")
				return
			end
			self.m_xuangzhong_huangzi_num = self.m_xuangzhong_huangzi_num + 1
			self.m_kede_jingyan = self.m_kede_jingyan + gongxianJingyan
			self.m_xiaohao_yinliang  = self.m_xiaohao_yinliang + xiaohaoYinliang
			self.m_kede_silver = self.m_kede_silver + sellCardGetSilver
			--添加提示三星卡牌
--			if huangziInfo["princeStar"] >= 3 and g_game.g_userInfoManager.m_isPopZongrenfuSanxing == true then
--				local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
--				g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
--		   		--28 stand for 吞卡三星以上时
--		   		popupEatLv3:popUpNotice(28)
--		   		--1 stand for scale action
--		   		popupEatLv3:setActionType(1)
--			
--				local quxiaoSanxing = function()
--					--取消当前卡牌的选择 
--					card:setDuigouVisible(false)
--					--取消已打钩
--					self.m_xuanzhong_record[index] = 0
--					self.m_xuangzhong_huangzi_num = self.m_xuangzhong_huangzi_num - 1
--					self.m_kede_jingyan = self.m_kede_jingyan - gongxianJingyan
--					self.m_xiaohao_yinliang  = self.m_xiaohao_yinliang - xiaohaoYinliang
--					self.m_kede_silver = self.m_kede_silver - sellCardGetSilver
--					--更新界面底部显示状态信息
--					self:updateBottomShowInfo()
--					self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(false)
--				end
--				popupEatLv3:setNoCallBack(quxiaoSanxing)
--				
--			end
			--添加对勾
			card:setDuigouVisible(true)
			--添加选中记录
			self.m_xuanzhong_record[index] = 1
		end
		--更新界面底部显示状态信息
		self:updateBottomShowInfo()
	end
	--依据当前页的选中情况来设置全选按钮的状态
	self:updateQuanxuanState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] updateQuanxuanState
-- 依据当前页的选中情况来设置全选按钮的状态
-------------------------------------------------------------------------------
function f_zongrenfu_panel:updateQuanxuanState()
	--获取当前页首尾索引（目标：选中当前页）
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > #self.m_huangzi_array then
		endIndex = 	#self.m_huangzi_array
	end
	self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(true)
	for i = startIndex, endIndex do
		if self.m_xuanzhong_record[i] == 0 then
			self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(false)
			break
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] reShowDuigou
-- 重新显示该页对勾
-------------------------------------------------------------------------------
function f_zongrenfu_panel:reShowDuigou()
	for i = 1, #self.m_danye_huangzi_array do
		local card = self.m_danye_huangzi_array[i]
		if self.m_xuanzhong_record[card:getIndex()] == 0 then
			card:setDuigouVisible(false)
		else
			card:setDuigouVisible(true)
		end
	end
end	

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] removeItem
-- 删除皇子
-------------------------------------------------------------------------------
function f_zongrenfu_panel:removeItem(index)	
	local data = self.m_huangzi_array[index]
	
	for i = 1, #self.m_danye_huangzi_array do
		if data["id"] == self.m_danye_huangzi_array[i]:getData()["id"] then
			table.remove(self.m_danye_huangzi_array, i)
			break
		end	
	end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] deletePrince
-------------------------------------------------------------------------------
function f_zongrenfu_panel:deletePrince()
	local huangzi_list = clone(self.m_huangzi_array)
	local xuanzhong_huangzi_num = self.m_xuangzhong_huangzi_num
	
	if xuanzhong_huangzi_num == 0 then
		return
	end
	
	local prince_xuanzhong_list = {}
	for i = 1, table.getn(huangzi_list) do
		if self.m_xuanzhong_record[i] ~= 0 then 
			table.insert(prince_xuanzhong_list, {["princeId"] = huangzi_list[i]["id"]})
		end
	end
	--发送皇子升级请求
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_userInfoManager:requestRemovePrince(prince_xuanzhong_list)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_zongrenfu_panel:initAllComponent()
	local deletePrince = function()
		self:deletePrince()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["delete_button"]:addHandleOfcomponentEvent(deletePrince,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--关闭按钮的点击事件
	local closeClick = function()
		self:closeClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_zzf_close_button"]:addHandleOfcomponentEvent(closeClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--升级按钮的点击事件
	local shengjiClick = function()
		self:shengjiClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_zzf_shengji_button"]:addHandleOfcomponentEvent(shengjiClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--点击选择向前按钮的点击事件
	local xiangqianClick = function()
		self:xiangqianClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_zzf_pre_page_button"]:addHandleOfcomponentEvent(xiangqianClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--点击选择向后按钮的点击事件
	local xianghouClick = function()
		self:xianghouClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_zzf_back_page_button"]:addHandleOfcomponentEvent(xianghouClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--全选事件处理
	local quanxuanClick = function()
		if self.m_componentTable["hz_zzf_quanxuan_check_box"]:isCheckBoxSelectYes() then
			self:setIsSelectAllHuangzi(true)
		else
			self:setIsSelectAllHuangzi(false)
		end
	end
	self.m_componentTable["hz_zzf_quanxuan_check_box"]:addHandleOfcomponentEvent(quanxuanClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--注册升级成功后监听函数
	self.event_updateHuangziSell = function()
		self:updateHuangziSell()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REMOVE_PRINCE, self.event_updateHuangziSell)
	
	--注册升级成功后监听函数
	self.event_updateHuangziShengji = function()
		self:updateHuangziShengji()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU, self.event_updateHuangziShengji)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] updateHuangziSell
-- 更新删除后的皇子信息
-------------------------------------------------------------------------------
function f_zongrenfu_panel:updateHuangziSell()
		--获取到数据信息
 	local princeData = g_game.g_userInfoManager:getPrinceData()
 	local unbattleList = princeData["unbattleList"]
 	
	--删除被吞卡的皇子
	for i = table.getn(self.m_xuanzhong_record), 1, -1  do
		if self.m_xuanzhong_record[i] == 1 then
			for k = 1, #unbattleList do
				if self.m_huangzi_array[i]["id"] == unbattleList[k]["id"] then
					table.remove(unbattleList, k)
					break
				end				
			end	
			table.remove(self.m_xuanzhong_record, i)
		end
	end
	
	princeData["unbattleList_Num"] = #princeData["unbattleList"]
	
		--修改用户银两
	local removePrinceResult = g_game.g_userInfoManager:getRemovePrinceResult()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["silver"] = removePrinceResult["silver"]
	
	g_game.g_utilManager:showMsg("获得银两"..removePrinceResult["obtainSilver"])
	
	--恢复数据信息
	self.m_xuangzhong_huangzi_num = 0
	self.m_kede_jingyan = 0
	self.m_xiaohao_yinliang = 0
	self.m_huangzi_count = 0
	self.m_huangzi_array = {}
	self.m_danye_huangzi_array = nil
	self.m_danye_huangzi_array = {}
	self.m_xuanzhong_record = {}
	self.m_kede_silver = 0
	--重新加载数据
	self:updateBottomShowInfo()
	self:loadHuangziData()
	
	--恢复全选框未选中
	self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(false)
	
	--发送目标名臣升级数据修改成功后的回调事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] updateHuangziShengji
-- 更新升级后的皇子信息
-------------------------------------------------------------------------------
function f_zongrenfu_panel:updateHuangziShengji()
	self:alterHuangziListInfo()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] alterHuangziListInfo
-- 数据修改 ： 删除被吞卡的皇子 修改目标皇子的信息(经验 等级)  修改用户的银两数据
-------------------------------------------------------------------------------
function f_zongrenfu_panel:alterHuangziListInfo()
	--获取到数据信息
 	local princeData = g_game.g_userInfoManager:getPrinceData()
 	local unbattleList = princeData["unbattleList"]
 	
	--删除被吞卡的皇子
	for i = table.getn(self.m_xuanzhong_record), 1, -1  do
		if self.m_xuanzhong_record[i] == 1 then
			for k = 1, #unbattleList do
				if self.m_huangzi_array[i]["id"] == unbattleList[k]["id"] then
					table.remove(unbattleList, k)
					break
				end				
			end	
			table.remove(self.m_xuanzhong_record, i)
		end
	end
	
	princeData["unbattleList_Num"] = #princeData["unbattleList"]
	
	--弹出提示消息
	if self.m_targetPrinceData["princeLevel"] == self.m_keshengzhi_jibie then
		if LANGUAGE_TYPE == 3 then
			g_game.g_utilManager:showMsg("此次經驗+" .. self.m_kede_jingyan)
		else
			g_game.g_utilManager:showMsg("此次经验+" .. self.m_kede_jingyan)
		end
	else
		local popupLvUp = require("scripts.game.main.common.f_common_popup_notice").new()	
		
		g_game.g_panelManager:showUiPanel(popupLvUp,"notice_popup_panel")
		if LANGUAGE_TYPE == 3 then
			local lvupTips = "經驗+".. self.m_kede_jingyan .. "\n等級+" .. self.m_keshengzhi_jibie - self.m_targetPrinceData["princeLevel"]
   			popupLvUp:setNoticeContent("升級成功","恭喜您成功越過一道龍門！",lvupTips,nil)
		else
			local lvupTips = "经验+".. self.m_kede_jingyan .. "\n等级+" .. self.m_keshengzhi_jibie - self.m_targetPrinceData["princeLevel"]
   			popupLvUp:setNoticeContent("升级成功","恭喜您成功越过一道龙门！",lvupTips,nil)
		end
   		
   		--12 宗人府吞卡升级
   		popupLvUp:popUpNotice(12)
   		--1 stand for scale action
   		popupLvUp:setActionType(1)
	end
	
	--修改目标皇子的经验和等级
	self.m_targetPrinceData["exp"] = self.m_shengji_exp
	self.m_targetPrinceData["princeLevel"] = self.m_keshengzhi_jibie
	
	--修改用户银两
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["silver"] = userInfo["silver"] - self.m_xiaohao_yinliang
	
	--恢复数据信息
	self.m_xuangzhong_huangzi_num = 0
	self.m_kede_jingyan = 0
	self.m_xiaohao_yinliang = 0
	self.m_huangzi_count = 0
	self.m_huangzi_array = {}
	self.m_danye_huangzi_array = nil
	self.m_danye_huangzi_array = {}
	self.m_xuanzhong_record = {}
	--重新加载数据
	self:updateBottomShowInfo()
	self:loadHuangziData()
	
	--恢复全选框未选中
	self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(false)
	
	--发送目标名臣升级数据修改成功后的回调事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] setIsSelectAllHuangzi
-- 全选按钮的事件处理
-------------------------------------------------------------------------------
function f_zongrenfu_panel:setIsSelectAllHuangzi(isSelectAllHuangzi)
	--获取当前页首尾索引（目标：选中当前页）
	local startIndex = (self.m_current_page-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	if endIndex > #self.m_huangzi_array then
		endIndex = 	#self.m_huangzi_array
	end
	
	--当前卡牌的皇子信息
	local huangziInfo     = nil
	--当前卡的可以贡献的经验 基础经验+额外经验
	local gongxianJingyan = 0
	--当前卡吞并需要消耗的银两
	local xiaohaoYinliang = 0
	--用于记录是否全选存在三星
	local isExistsSangxing = false
	
	local sellCardGetSilver = 0	
	if isSelectAllHuangzi == true then	
		local ins = 0	
		for i = startIndex, endIndex do	
			if self.m_xuanzhong_record[i] == 0 then
				ins = ins + 1
			end
		end
		if ins + self.m_xuangzhong_huangzi_num > 20 then
			g_game.g_utilManager:showMsg("同时最多可选择20张卡！")
			self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(false)
			return
		end
		for i = startIndex, endIndex do			
			huangziInfo = self.m_huangzi_array[i]		
			
			local  princeQuality = huangziInfo["princeStar"]
			local  princeLv = huangziInfo["princeLevel"]
			local  getUnAddExp = g_game.g_dictConfigManager:getPrinceUnAddExp(princeQuality,princeLv)
			local gongxianJingyan = getUnAddExp + g_game.g_dictConfigManager:getPrinceMergeExp(huangziInfo["princeStar"]) + huangziInfo["exp"]
			gongxianJingyan = gongxianJingyan*0.8
			
			local sellCardGetSilver = g_game.g_dictConfigManager:getSellPrinceSilver(huangziInfo["princeLevel"],huangziInfo["princeStar"])
			
			xiaohaoYinliang = g_game.g_dictConfigManager:getPrinceMergeYinliang(huangziInfo["princeStar"])
			if isExistsSangxing == false and huangziInfo["princeStar"] >= 3 then
				isExistsSangxing = true
			end
			--判断是否已经被选中
			if self.m_xuanzhong_record[i] == 0 then
				self.m_xuangzhong_huangzi_num = self.m_xuangzhong_huangzi_num + 1
				self.m_kede_jingyan = self.m_kede_jingyan + gongxianJingyan
				self.m_xiaohao_yinliang  = self.m_xiaohao_yinliang + xiaohaoYinliang	
				self.m_kede_silver = self.m_kede_silver + sellCardGetSilver										
				--将其添加到选中皇子的数组中
				self.m_xuanzhong_record[i] = 1
			end
		end
	else
		for i = startIndex, endIndex do
			huangziInfo = self.m_huangzi_array[i]
			
			local  princeQuality = huangziInfo["princeStar"]
			local  princeLv = huangziInfo["princeLevel"]
			local  getUnAddExp = g_game.g_dictConfigManager:getPrinceUnAddExp(princeQuality,princeLv)
			local gongxianJingyan = getUnAddExp + g_game.g_dictConfigManager:getPrinceMergeExp(huangziInfo["princeStar"]) + huangziInfo["exp"]
			gongxianJingyan = gongxianJingyan*0.8
			
			xiaohaoYinliang = g_game.g_dictConfigManager:getPrinceMergeYinliang(huangziInfo["princeStar"])
			local sellCardGetSilver = g_game.g_dictConfigManager:getSellPrinceSilver(huangziInfo["princeLevel"],huangziInfo["princeStar"])

			--判断是否已经被取消选中
			if self.m_xuanzhong_record[i] == 1 then
				self.m_xuangzhong_huangzi_num = self.m_xuangzhong_huangzi_num - 1
				self.m_kede_jingyan = self.m_kede_jingyan - gongxianJingyan
				self.m_xiaohao_yinliang  = self.m_xiaohao_yinliang - xiaohaoYinliang
				self.m_kede_silver = self.m_kede_silver - sellCardGetSilver
				--从选中皇子的数组中移除
				self.m_xuanzhong_record[i] = 0
			end
		end
	end
	--刷新当前页的对勾状态
	self:reShowDuigou()
	--依据可获得经验来更新可升至等级
	self:updateBottomShowInfo()
	
	
	--设置提示显示
--	if g_game.g_userInfoManager.m_isPopZongrenfuSanxing == true and isExistsSangxing == true then
--		local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
--		g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
--   		--28 stand for 吞卡三星以上时
--   		popupEatLv3:popUpNotice(28)
--   		--1 stand for scale action
--   		popupEatLv3:setActionType(1)
--	
--		local quxiaoSanxing = function()
--			--取消对三星以上卡牌的选择 
--			for i = startIndex, endIndex do			
--				huangziInfo = self.m_huangzi_array[i]		
--				
--				local  princeQuality = huangziInfo["princeStar"]
--				local  princeLv = huangziInfo["princeLevel"]
--				local  getUnAddExp = g_game.g_dictConfigManager:getPrinceUnAddExp(princeQuality,princeLv)
--				local gongxianJingyan = getUnAddExp + g_game.g_dictConfigManager:getPrinceMergeExp(huangziInfo["princeStar"]) + huangziInfo["exp"]
--				gongxianJingyan = gongxianJingyan*0.8
--					
--				xiaohaoYinliang = g_game.g_dictConfigManager:getPrinceMergeYinliang(huangziInfo["princeStar"])
--				--判断是否已经被选中
--				if huangziInfo["princeStar"] >= 3 then
--					self.m_xuangzhong_huangzi_num = self.m_xuangzhong_huangzi_num - 1
--					self.m_kede_jingyan = self.m_kede_jingyan - gongxianJingyan
--					self.m_xiaohao_yinliang  = self.m_xiaohao_yinliang - xiaohaoYinliang	
--					self.m_kede_silver = self.m_kede_silver - sellCardGetSilver									
--					--将其添加到选中皇子的数组中
--					self.m_xuanzhong_record[i] = 0
--				end
--			end
--			self.m_componentTable["hz_zzf_quanxuan_check_box"]:setCheckBoxSelect(false)
--			--更新显示页
--			self:reShowDuigou()
--			--依据可获得经验来更新可升至等级
--			self:updateBottomShowInfo()
--		end
--		popupEatLv3:setNoCallBack(quxiaoSanxing)
--		
--	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_zongrenfu_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_zongrenfu_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_zongrenfu_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] onEnter
-------------------------------------------------------------------------------
function f_zongrenfu_panel:onEnter()
	if self.m_type == self.TYPE_LV_UP then
		self.m_componentTable["delete_down_panel"]:setVisible(false)
		self.m_componentTable["shengji_down_panel"]:setVisible(true)
		self.m_componentTable["delete_button"]:setVisible(false)
		self.m_componentTable["hz_zzf_shengji_button"]:setVisible(true)
		self.m_componentTable["title_image"]:setVisible(false)
		self.m_componentTable["hz_zzf_title_image"]:setVisible(true)
		
	elseif self.m_type == self.TYPE_SELL then
		self.m_componentTable["delete_down_panel"]:setVisible(true)
		self.m_componentTable["shengji_down_panel"]:setVisible(false)
		self.m_componentTable["delete_button"]:setVisible(true)
		self.m_componentTable["hz_zzf_shengji_button"]:setVisible(false)
		self.m_componentTable["title_image"]:setVisible(true)
		self.m_componentTable["hz_zzf_title_image"]:setVisible(false)
	end
	
	self.m_componentTable["hz_zzf_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self:loadHuangziData()
	--初始化更新底部显示信息
	self:updateBottomShowInfo()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] onExit
-------------------------------------------------------------------------------
function f_zongrenfu_panel:onExit()
	self:unregisterNodeEvent()

	self.m_targetPrinceData = nil	
	self.m_page_container = nil
	self.m_danye_huangzi_array	= nil
	self.m_huangzi_array = nil
	self.m_xuanzhong_record = nil	
  	
  	--移除注册的监听函数
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REMOVE_PRINCE, self.event_updateHuangziSell)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU, self.event_updateHuangziShengji)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_zongrenfu_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_zongrenfu_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] onCleanup
-------------------------------------------------------------------------------
function f_zongrenfu_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] calculateDengji
-- 计算当前可以获得的等级
-------------------------------------------------------------------------------
function f_zongrenfu_panel:calculateDengji()
	--计算当前皇子的经验
	local jingyan = self.m_targetPrinceData["exp"] + self.m_kede_jingyan
	--获取皇子当前等级
	local level   = self.m_targetPrinceData["princeLevel"]
	local star    = self.m_targetPrinceData["princeStar"]
	local maxLevel = g_game.g_dictConfigManager:getPrinceLevelMax()
	--核对表信息，得出经验值
	--获得该皇子星级不同等级的所需经验
	local suoxu_jingyan = 0
	for i = level, maxLevel do
		--等级上限限制
		if i == maxLevel then
			self.m_keshengzhi_jibie = i
			return
		end
		suoxu_jingyan = suoxu_jingyan + g_game.g_dictConfigManager:getPrinceExp(i,star)
		if jingyan < suoxu_jingyan then
			self.m_shengji_exp = jingyan + g_game.g_dictConfigManager:getPrinceExp(i,star) - suoxu_jingyan
			self.m_keshengzhi_jibie = i
			return 
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] updateBottomShowInfo
-- 更新底部显示信息
-------------------------------------------------------------------------------
function f_zongrenfu_panel:updateBottomShowInfo()
	if self.m_type == self.TYPE_LV_UP then
		self:calculateDengji()
		self.m_componentTable["hz_zzf_xiaohao_num_label"]:setString(self.m_xuangzhong_huangzi_num)
		self.m_componentTable["hz_zzf_jingyan_num_label"]:setString(self.m_kede_jingyan)
		self.m_componentTable["hz_zzf_yinliang_num_label"]:setString(self.m_xiaohao_yinliang)
		self.m_componentTable["hz_zzf_keshengzhi_num_label"]:setString(self.m_keshengzhi_jibie .. "/" .. g_game.g_userInfoManager:getUserInfo()["level"])
	
	elseif self.m_type == self.TYPE_SELL then
		self.m_componentTable["delete_get_silver"]:setString(self.m_kede_silver)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] closeClick
-- 关闭按钮点击
-------------------------------------------------------------------------------
function f_zongrenfu_panel:closeClick()
	g_game.g_panelManager:removeUiPanel("huangzi_zongrenfu")
end


-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] shengjiClick
-- 升级按钮点击
-------------------------------------------------------------------------------
function f_zongrenfu_panel:shengjiClick()
	print("宗人府-升级按钮-点击")
	if self.m_keshengzhi_jibie > g_game.g_userInfoManager:getUserInfo()["level"] then
		g_game.g_utilManager:showMsg("卡牌等级不能超过皇帝等级")
		return
	end
	
	--等级上限限制(弹出提示面板)
	local maxLevel = g_game.g_dictConfigManager:getOfficerLevelMax()
	if self.m_targetPrinceData["officerLevel"] == maxLevel then
	    g_game.g_utilManager:showMsg("皇子已经到达升级上限！")
		return
	end
	--检测银两是否足够
	local userYinliang = g_game.g_userInfoManager:getUserInfo()["silver"]
	if  self.m_xuangzhong_huangzi_num == 0 then
	    g_game.g_utilManager:showMsg("您还没选择皇子哦！")
		return 
	end
	
	if self.m_xiaohao_yinliang > userYinliang then
--	    g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		require("scripts.game.main.common.f_less_silver_tip_popup")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
		return 
	end	
	
	local has3star = false
	local huangzi_list = clone(self.m_huangzi_array)
	for i = 1, table.getn(huangzi_list) do
		if self.m_xuanzhong_record[i] ~= 0 and huangzi_list[i]["princeStar"] >= 3 then 
			has3star = true
		end
	end
	
	if g_game.g_userInfoManager.m_isPopZongrenfuSanxing then
		
		if has3star then
			local popupEatLv3 = require("scripts.game.main.common.f_common_popup_notice").new()	
			g_game.g_panelManager:showUiPanel(popupEatLv3,"notice_popup_panel")
	   		--28 stand for 吞卡三星以上时
	   		popupEatLv3:popUpNotice(28)
	   		--1 stand for scale action
	   		popupEatLv3:setActionType(1)
	   		
	   		local yesEvent = function()
	   			self:sendLvupMessage()
	   		end
	   		popupEatLv3:setYesCallBack(yesEvent)
		else
			self:sendLvupMessage()
		end
	else
		self:sendLvupMessage()
	end
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] sendLvupMessage
-------------------------------------------------------------------------------
function f_zongrenfu_panel:sendLvupMessage()
	local huangzi_list = clone(self.m_huangzi_array)
	local xuanzhong_huangzi_num = self.m_xuangzhong_huangzi_num
	local prince_xuanzhong_list = {}
	for i = 1, table.getn(huangzi_list) do
		if self.m_xuanzhong_record[i] ~= 0 then 
			table.insert(prince_xuanzhong_list, {["pid"] = huangzi_list[i]["id"]})
		end
	end
	--发送皇子升级请求
	g_game.g_userInfoManager:requestZongrenfuShengji(self.m_targetPrinceData["id"], xuanzhong_huangzi_num, prince_xuanzhong_list)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] xiangqianClick
-- 向前按钮点击
-------------------------------------------------------------------------------
function f_zongrenfu_panel:xiangqianClick()
	print("宗人府-向前按钮-点击")
	self.m_page_container:showPrePage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zongrenfu_panel] xianghouClick
-- 向后按钮点击
-------------------------------------------------------------------------------
function f_zongrenfu_panel:xianghouClick()
	print("宗人府-向后按钮-点击")
	self.m_page_container:showNextPage()
end