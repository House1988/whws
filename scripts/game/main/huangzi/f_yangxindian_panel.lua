require("scripts.auto.auto_huangzi_yangxindian")
require("scripts.game.main.huangzi.f_huangzi_shuxing_panel")
require("scripts.game.main.huangzi.f_huangzi_yuelongmen_panel")
require("scripts.game.main.huangzi.f_huangzi_xuanze_card")
require("scripts.game.main.huangzi.f_zongrenfu_panel")

--[[--
   养心殿 界面
--]]--

f_yangxindian_panel = class("f_yangxindian_panel")
f_yangxindian_panel.__index = f_yangxindian_panel


-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_yangxindian_panel.static_create()
	local huangzi_yangxindian_table = createhuangzi_yangxindian()
	local huangzi_yangxindian_panel = huangzi_yangxindian_table["huangzi_yangxindian"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_yangxindian_panel, funTable)
	setmetatable(funTable, f_yangxindian_panel)
	
	huangzi_yangxindian_panel.m_componentTable = huangzi_yangxindian_table
	return huangzi_yangxindian_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_yangxindian_panel:panelInitBeforePopup()
	self:registerNodeEvent()	
	
	self.m_total_pages	= 0	
	self.m_huangzi_count	= 0
	self.COL			= 5
	self.ROW			= 2
	
	self.m_danye_huangzi_array	= {}
	self.m_huangzi_array = {}
	
	self.m_select_huangzi	= nil
	self.m_select_index		= 1
	
	self.m_update_callback	= nil
	self:loadHuangziData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] loadHuangziData
-- 加载皇子数据
-------------------------------------------------------------------------------
function f_yangxindian_panel:loadHuangziData()	
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_componentTable["hz_yxd_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["hz_yxd_back_page_button"]:setComponentZOrder(10)
	
	self.m_total_pages	= 0	
	self.m_huangzi_count	= 0
	self.m_danye_huangzi_array	= {}
	self.m_huangzi_array = {}
	
	--获取到所有皇子列表
	local huangziInfo = g_game.g_userInfoManager:getPrinceData()
	local battleList = huangziInfo["battleList"]
	local unbattleList   = huangziInfo["unbattleList"]
		
	for i = 1, #battleList do	
		self.m_huangzi_count = self.m_huangzi_count + 1
		table.insert(self.m_huangzi_array, battleList[i])
	end
	for i = 1, #unbattleList do
		self.m_huangzi_count = self.m_huangzi_count + 1
		table.insert(self.m_huangzi_array, unbattleList[i])
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
				return huangzi1["princeLevel"] > huangzi2["princeLevel"]
			end
		else
			return huangzi1["princeStar"] > huangzi2["princeStar"]
		end
	end
	table.sort(self.m_huangzi_array,compFunc)
	
	self.m_total_pages = math.ceil(self.m_huangzi_count / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(880, 500))
	self.m_page_container:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, 320))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)     
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    local pageText = function()
    	self.m_componentTable["pageText"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
    end
    self.m_page_container:registMovePageCallback(pageText)
	
	self.m_page_container:setPageInfo(self.m_huangzi_count, self.ROW, self.COL, 10, 0, 176,226)
	self.m_componentTable["pageText"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] loadPageData
-- 刷新皇子列表
-------------------------------------------------------------------------------
function f_yangxindian_panel:loadPageData(pageIndex)	
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
			item:setDuigouDiVisible(false)
			
			--设置是否显示已督军标签
			local princeInfo = g_game.g_userInfoManager:getPrinceData()
			local battleList = princeInfo["battleList"]
			local unbattleList = princeInfo["unbattleList"]
			local isFind = false
			for k = 1, #battleList do
				if self.m_huangzi_array[i]["id"] == battleList[k]["id"] then
					item:setDujunVisible(true)
					isFind = true
					break
				end
			end
			if 	isFind == false then
				for k = 1, #unbattleList do
					if self.m_huangzi_array[i]["id"] == unbattleList[k]["id"] then
						item:setDujunVisible(false)
						break
					end
				end	
			end
			
			item:setIndex(i)
			item:setData(self.m_huangzi_array[i])				
			item:setHuangziCardEventCallBack(itemCallback)
			item:setPrinceRemoveFromListCallback(removeItem)
			
			table.insert(self.m_danye_huangzi_array, item)
		end
	end
	if #self.m_danye_huangzi_array > 0 then
		self:updateSelectItem(self.m_select_index)	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] updateSelectItem
-- 刷新选中皇子
-------------------------------------------------------------------------------
function f_yangxindian_panel:updateSelectItem(index)	
	local data = self.m_huangzi_array[index]
	
	for i = 1, #self.m_danye_huangzi_array do
		if data["id"] == self.m_danye_huangzi_array[i]:getData()["id"] then
			self.m_danye_huangzi_array[i]:setSelectState(true)	
			self.m_select_huangzi	= self.m_danye_huangzi_array[i]
			self.m_select_index		= index
		else
			self.m_danye_huangzi_array[i]:setSelectState(false)
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] removeItem
-- 删除皇子
-------------------------------------------------------------------------------
function f_yangxindian_panel:removeItem(index)	
	local data = self.m_huangzi_array[index]
	
	for i = 1, #self.m_danye_huangzi_array do
		if data["id"] == self.m_danye_huangzi_array[i]:getData()["id"] then
			table.remove(self.m_danye_huangzi_array, i)
			break
		end	
	end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_yangxindian_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_yangxindian_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_yangxindian_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] onEnter
-------------------------------------------------------------------------------
function f_yangxindian_panel:onEnter()	
	self.m_componentTable["hz_yxd_details_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	--注册监听函数(修改皇子名称)
	self.event_updatePrinceNameCallback = function()
		self:updatePrinceName()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
	
	--注册上书房升级回调
	self.event_updateShangshufangJiaoyu = function()
		self:updatePrinceList()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU, self.event_updateShangshufangJiaoyu)
	
	--注册宗人府升级回调
	self.event_updateZongrenfuShengji = function()
		self:updatePrinceList()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS, self.event_updateZongrenfuShengji)	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] updatePrinceName
-- 改名事件回调
-------------------------------------------------------------------------------
function f_yangxindian_panel:updatePrinceName()
	local data = self.m_huangzi_array[self.m_select_index]
	if data ~= nil then
		for i = 1, #self.m_danye_huangzi_array do
			if data["id"] == self.m_danye_huangzi_array[i]:getData()["id"] then
				self.m_danye_huangzi_array[i].m_componentTable["hzxz_name_label"]:setString(data["princeName"])
				break
			end	
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] updatePrinceList
-- 宗人府升级成功后回调
-------------------------------------------------------------------------------
function f_yangxindian_panel:updatePrinceList() 
	self.m_total_pages	= 0	
	self.m_huangzi_count	= 0
	self.COL			= 5
	self.ROW			= 2
	
	self.m_danye_huangzi_array	= {}
	self.m_huangzi_array = {}
	
	self.m_select_huangzi	= nil
	self.m_select_index		= 1
	
	self.m_update_callback	= nil
	self:loadHuangziData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] onExit
-------------------------------------------------------------------------------
function f_yangxindian_panel:onExit() 
  	self:unregisterNodeEvent()
  	
  	--移除上书房皇子升级界面的元宝更新回调
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU, self.event_updateShangshufangJiaoyu)
  	--移除注册的监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS, self.event_updateZongrenfuShengji)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_yangxindian_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_yangxindian_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] onCleanup
-------------------------------------------------------------------------------
function f_yangxindian_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] showDeleteView
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_yangxindian_panel:showDeleteView()
	local data = self.m_huangzi_array[self.m_select_index]
	if data ~= nil then	
		local princeInfo = g_game.g_userInfoManager:getPrinceData()
		local battleList = princeInfo["battleList"]
		local unbattleList = princeInfo["unbattleList"]
		local isBattle = false
		local isFind = false
		for k = 1, #battleList do
			if data["id"] == battleList[k]["id"] then
				isBattle = true
				isFind = true
				break
			end
		end
		if 	isFind == false then
			for k = 1, #unbattleList do
				if data["id"] == unbattleList[k]["id"] then
					isBattle = false
					break
				end
			end	
		end	
		
		local zongrenfu_panel = f_zongrenfu_panel.static_create()
	    zongrenfu_panel:panelInitBeforePopup()	
	    zongrenfu_panel:setStopTouchEvent(true)
	    zongrenfu_panel:setTargetPrinceData(data)
	    zongrenfu_panel:setType(2)
	    g_game.g_panelManager:showUiPanel(zongrenfu_panel, "huangzi_zongrenfu")	
		
	end


	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_yangxindian_panel:initAllComponent()
	local showDeleteView = function()
		self:showDeleteView()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_yxd_delete_button"]:addHandleOfcomponentEvent(showDeleteView,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--详情按钮的点击事件
	local xiangqingClick = function()
		self:xiangqingClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_yxd_details_button"]:addHandleOfcomponentEvent(xiangqingClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击跃龙门按钮的点击事件
	local yuelongmenClick = function()
		self:yuelongmenClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_yxd_yuelongmen_button"]:addHandleOfcomponentEvent(yuelongmenClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择封爵按钮的点击事件
	self.m_componentTable["hz_yxd_fengjue_button"]:setVisible(false)
--	local fengjueClick = function()
--		self:fengjueClick()
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
--	end
--	self.m_componentTable["hz_yxd_fengjue_button"]:addHandleOfcomponentEvent(fengjueClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向前按钮的点击事件
	local xiangqianClick = function()
		self:xiangqianClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["hz_yxd_pre_page_button"]:addHandleOfcomponentEvent(xiangqianClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向后按钮的点击事件
	local xianghouClick = function()
		self:xianghouClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["hz_yxd_back_page_button"]:addHandleOfcomponentEvent(xianghouClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] popPrinceAtrrPanel
-- 弹出皇子属性面板
-------------------------------------------------------------------------------
function f_yangxindian_panel:popPrinceAtrrPanel() 
	local data = self.m_huangzi_array[self.m_select_index]
	
	if data ~= nil then	
		local princeInfo = g_game.g_userInfoManager:getPrinceData()
		local battleList = princeInfo["battleList"]
		local unbattleList = princeInfo["unbattleList"]
		local isBattle = false
		local isFind = false
		for k = 1, #battleList do
			if data["id"] == battleList[k]["id"] then
				isBattle = true
				isFind = true
				break
			end
		end
		if 	isFind == false then
			for k = 1, #unbattleList do
				if data["id"] == unbattleList[k]["id"] then
					isBattle = false
					break
				end
			end	
		end	
	
		local huangzi_shuxing_panel = f_huangzi_shuxing_panel.static_create()
	    huangzi_shuxing_panel:panelInitBeforePopup()
	    huangzi_shuxing_panel:setStopTouchEvent(true)	
		huangzi_shuxing_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))	
		
		g_game.g_panelManager:showUiPanel(huangzi_shuxing_panel, "huangzishuxing_bg")
		
		huangzi_shuxing_panel:setPrinceData(data, isBattle)	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] xiangqingClick
-- 详情按钮点击
-------------------------------------------------------------------------------
function f_yangxindian_panel:xiangqingClick()
	print("养心殿-详情按钮-点击")	
	self:popPrinceAtrrPanel()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] popYuelongmen
-- 弹出跃龙门
-------------------------------------------------------------------------------
function f_yangxindian_panel:popYuelongmen() 
	local data = self.m_huangzi_array[self.m_select_index]	
	if data ~= nil then	
		local yuelongmen_panel = f_huangzi_yuelongmen_panel.static_create()
	    yuelongmen_panel:panelInitBeforePopup()
	    yuelongmen_panel:setStopTouchEvent(true)	
		g_game.g_panelManager:showUiPanel(yuelongmen_panel, "huangzi_yuelongmen")	
	    yuelongmen_panel:setTargetPriceData(data)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] yuelongmenClick
-- 跃龙门按钮点击
-------------------------------------------------------------------------------
function f_yangxindian_panel:yuelongmenClick()
	print("养心殿-跃龙门按钮-点击")
	local data = self.m_huangzi_array[self.m_select_index]
	if data["princeLevel"] >= g_game.g_userInfoManager:getUserInfo()["level"] then
		g_game.g_utilManager:showMsg("卡牌等级不能超过皇帝等级")
		return
	end
	self:popYuelongmen()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] fengjueClick
-- 封爵卡按钮点击
-------------------------------------------------------------------------------
function f_yangxindian_panel:fengjueClick()
	g_game.g_utilManager:showMsg("功能未开放")
	print("养心殿-封爵按钮-点击")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] xiangqianClick
-- 向前按钮点击
-------------------------------------------------------------------------------
function f_yangxindian_panel:xiangqianClick()
	print("养心殿-向前按钮-点击")
	self.m_page_container:showPrePage()	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_yangxindian_panel] xianghouClick
-- 向后按钮点击
-------------------------------------------------------------------------------
function f_yangxindian_panel:xianghouClick()
	print("养心殿-向后按钮-点击")
	self.m_page_container:showNextPage()
end

