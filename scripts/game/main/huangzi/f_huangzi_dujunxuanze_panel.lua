require("scripts.auto.auto_huangzi_xuanze")
require("scripts.game.main.huangzi.f_huangzi_shuxing_panel")
require("scripts.game.main.huangzi.f_huangzi_xuanze_card")
--[[--
   皇子督军选择 界面
--]]--

f_huangzi_dujunxuanze_panel = class("f_huangzi_dujunxuanze_panel")
f_huangzi_dujunxuanze_panel.__index = f_huangzi_dujunxuanze_panel


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_huangzi_dujunxuanze_panel.static_create()
	local huangzi_dujunxuanze_table = createhuangzi_xuanze()
	local huangzi_dujunxuanze_panel = huangzi_dujunxuanze_table["huangzi_xuanze"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_dujunxuanze_panel, funTable)
	setmetatable(funTable, f_huangzi_dujunxuanze_panel)
	
	huangzi_dujunxuanze_panel.m_componentTable = huangzi_dujunxuanze_table
	return huangzi_dujunxuanze_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:panelInitBeforePopup(listType)
	self:registerNodeEvent()	
	
	self.m_list_typ		= listType	---type 1 皇子督军选择界面   2 皇子封爵界面
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	self.m_unbattle_data = {}
	
	self.m_select_prince	= nil
	self.m_select_index		= 1
	
	self.COL			= 5
	self.ROW			= 2
	self.LEVEL_LIMIT	= 5
	
	self.m_select_empty_index = 0
	
	self.m_update_callback	= nil
	if self.m_list_typ == 1 then
		self:loadDujunPrinceListData()
	else
		self:loadFengjuePrinceListData()
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_dujunxuanze_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] onEnter
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:onEnter()   
	self:initAllComponent()
	
    self:setStopTouchEvent(true)
    
    --新手指引，皇子选择事件
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_PRINCE_LIST)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] onExit
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:onExit()  
  	self:unregisterNodeEvent()
  
	--移除注册的皇子改名监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:initAllComponent()
	--注册监听函数(修改皇子名称)
	self.event_updatePrinceNameCallback = function()
		self:updatePrinceName()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
	
	--关闭当前按钮
	local closeCurrentPanel = function()
		self:hideSelfPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_xz_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击查看详情按钮的点击事件
	local xiangqingClick = function()
		self:xiangqingClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_xz_details_button"]:addHandleOfcomponentEvent(xiangqingClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击确定按钮的点击事件
	local quedingClick = function()
		self:quedingClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzxz_queding_button"]:addHandleOfcomponentEvent(quedingClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向前按钮的点击事件
	local xiangqianClick = function()
		self:xiangqianClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_xz_pre_page_button"]:addHandleOfcomponentEvent(xiangqianClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向后按钮的点击事件
	local xianghouClick = function()
		self:xianghouClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_xz_back_page_button"]:addHandleOfcomponentEvent(xianghouClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] setUpdateCallback
-- 设置选择皇子回调
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:setUpdateCallback(updateCallback)
	self.m_update_callback = updateCallback
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] hideSelfPanel
-- 从父节点删除
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:hideSelfPanel()
	
	g_game.g_panelManager:removeUiPanel("huangzi_xuanze")
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] popPrinceAtrrPanel
-- 弹出皇子属性面板
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:popPrinceAtrrPanel() 
	local data = self.m_unbattle_data[self.m_select_index]	
	
	if data ~= nil then	
		local huangzi_shuxing_panel = f_huangzi_shuxing_panel.static_create()
	    huangzi_shuxing_panel:panelInitBeforePopup()
	    huangzi_shuxing_panel:setStopTouchEvent(true)	
		huangzi_shuxing_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))	
		
		g_game.g_panelManager:showUiPanel(huangzi_shuxing_panel, "huangzishuxing_bg")
		
		huangzi_shuxing_panel:setPrinceData(data, false)	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] xiangqingClick
-- 查看详情按钮
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:xiangqingClick()
	print("督军选择-查看详情-点击")

	self:popPrinceAtrrPanel()		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] quedingClick
-- 确定按钮
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:quedingClick()
	print("督军选择-确定-点击")
	
	if self.m_update_callback ~= nil then	
		local data = self.m_unbattle_data[self.m_select_index]		
		if data ~= nil then
			self.m_update_callback(data)
		end
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] xiangqianClick
-- 向前按钮点击
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:xiangqianClick()
	print("督军选择-向前按钮-点击")
	self.m_page_container:showPrePage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] xianghouClick
-- 向后按钮点击
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:xianghouClick()
	print("督军选择-向后按钮-点击")
	self.m_page_container:showNextPage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] loadDujunPrinceListData
-- 加载皇子督军数据列表
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:loadDujunPrinceListData()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_item_array = {}
	
	self.m_componentTable["hz_xz_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["hz_xz_back_page_button"]:setComponentZOrder(10)
--	self.m_componentTable["hz_xz_details_button"]:setComponentZOrder(10)
--	self.m_componentTable["hzxz_queding_button"]:setComponentZOrder(10)

	local selectItemCallback = function(cardPanel)
		self:selectItem(cardPanel)
	end

	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	local unbattleList = princeInfo["unbattleList"]
		
	self.m_unbattle_data = {}
	for i = 1, #unbattleList do	
		if unbattleList[i]["princeLevel"] >= self.LEVEL_LIMIT then
			self.m_item_count = self.m_item_count + 1
			table.insert(self.m_unbattle_data, unbattleList[i])
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
				return huangzi1["princeLevel"] > huangzi2["princeLevel"]
			end
		else
			return huangzi1["princeStar"] > huangzi2["princeStar"]
		end
	end
	table.sort(self.m_unbattle_data,compFunc)	
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(880, 500))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(44, 70))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
       
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
	
	self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL, 0, 0, 176,250)	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	local unbattleList = princeInfo["unbattleList"]
		
	local itemCallback = function(index)
		self:updateSelectItem(index)
	end
	
	local removeItem = function(index)
		self:removeItem(index)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if #self.m_unbattle_data >= i then
			if self.m_unbattle_data[i]["princeLevel"] >= self.LEVEL_LIMIT then	
				
				local item = f_huangzi_xuanze_card.static_create()
				item:panelInitBeforePopup()
				self.m_page_container:addComponentToPage(item, pageIndex)
				item:setSize(cc.size(176,246))
				
				item:setDuigouVisible(false)
				item:setDuigouDiVisible(false)
				item:setDujunVisible(false)
				item:setData(self.m_unbattle_data[i])
				item:setIndex(i)				
				item:setHuangziCardEventCallBack(itemCallback)
				item:setPrinceRemoveFromListCallback(removeItem)
				
				table.insert(self.m_item_array, item)
			end
		end
	end
	if #self.m_item_array > 0 then
		self:updateSelectItem(self.m_select_index)	
	end
end



-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] loadFengjuePrinceListData
-- 加载皇子封爵数据列表
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:loadFengjuePrinceListData()

end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] removeItem
-- 删除皇子
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:removeItem(index)	
	local data = self.m_unbattle_data[index]
	
	for i = 1, #self.m_item_array do
		if data == self.m_item_array[i]:getData() then
			table.remove(self.m_item_array, i)
			break
		end	
	end		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] updateSelectItem
-- 刷新选中皇子
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:updateSelectItem(index)	
	local data = self.m_unbattle_data[index]
	
	for i = 1, #self.m_item_array do
		if data == self.m_item_array[i]:getData() then
			self.m_item_array[i]:setSelectState(true)	
			self.m_select_prince	= self.m_item_array[i]
			self.m_select_index		= index
		else
			self.m_item_array[i]:setSelectState(false)
		end	
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_dujunxuanze_panel] updatePrinceName
-- 改名事件回调
-------------------------------------------------------------------------------
function f_huangzi_dujunxuanze_panel:updatePrinceName()
	local data = self.m_unbattle_data[self.m_select_index]
	if data ~= nil then
		for i = 1, #self.m_item_array do
			if data["id"] == self.m_item_array[i]:getData()["id"] then
				self.m_item_array[i].m_componentTable["hzxz_name_label"]:setString(data["princeName"])
				break
			end	
		end	
	end	
end