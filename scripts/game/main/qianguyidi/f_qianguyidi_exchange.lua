require("scripts.auto.auto_qgyd_gongjizhiduihuan")
require("scripts.game.main.qianguyidi.f_gongjizhiduihuan_card")
require("scripts.auto.auto_qgyd_duihuanchenggong")

--[[--
功绩值兑换
--]]--
f_qianguyidi_exchange = class("f_qianguyidi_exchange")
f_qianguyidi_exchange.__index = f_qianguyidi_exchange

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_qianguyidi_exchange.static_create()
	local exchange_table = createqgyd_gongjizhiduihuan()
	local exchange_panel = exchange_table["qgyd_gongjizhiduihuan"]
	 
	local funTable = {}
	tolua.setpeer(exchange_panel, funTable)
	setmetatable(funTable, f_qianguyidi_exchange)
	
	exchange_panel.m_componentTable = exchange_table
	return exchange_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:panelInitBeforePopup()
	self:registerNodeEvent()	
	
	self.m_total_pages	= 0	
	self.m_duihuan_count	= 0
	self.COL			= 4
	self.ROW			= 1
	
	self.m_danye_duihuan_array	= {}
	self.m_duihuan_array = {}
	
	--白绿蓝紫橙 对应 12345星级
	self.m_qualityRect = {}
    self.m_qualityRect[1] = "batch_ui/baipinzhi_kuang.png"
    self.m_qualityRect[2] = "batch_ui/lvpinzhi_kuang.png"
    self.m_qualityRect[3] = "batch_ui/lanpinzhi_kuang.png"
    self.m_qualityRect[4] = "batch_ui/zipinzhi_kuang.png"
    self.m_qualityRect[5] = "batch_ui/chengpinzhi_kuang.png"
    
    --物品类型
   	self.DAOJU_TYPE = 1
	self.ZHUANGBEI_TYPE = 2	
	
	
	self.m_deltaTime = 0
	self.m_remainTime = g_game.g_recoverManager:getRecoverTime(4)
	if self.m_remainTime <= 0 then
		self.m_remainTime = 600	
	end
	local output = g_game.g_utilManager:getExportTime(self.m_remainTime)	
	self.m_componentTable["gjzdh_shijian_num_label"]:setString(output)
	self:loadDuihuanData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] loadDuihuanData
-- 加载兑换道具 装备等数据
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:loadDuihuanData()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_componentTable["gjzdh_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["gjzdh_back_page_button"]:setComponentZOrder(10)

	--获取到兑换表
	local gongjizhiDuihuanInfo = g_game.g_dictConfigManager:getGongjizhiDuihuanInfo()
		
	for i = 1, #gongjizhiDuihuanInfo do	
		self.m_duihuan_count = self.m_duihuan_count + 1
		table.insert(self.m_duihuan_array, gongjizhiDuihuanInfo[i])
	end	
	
	self.m_total_pages = math.ceil(self.m_duihuan_count / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(909, 454))
	self.m_page_container:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, 380))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
	
	self.m_page_container:setPageInfo(self.m_duihuan_count, self.ROW, self.COL, 0, -1, 227, 454)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local itemCallback = function(card)
		self:itemDuihuan(card)
	end
	
	local removeItem = function(card)
		self:removeItem(card)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	local itemCount = 1
	for i = startIndex, endIndex do
		if #self.m_duihuan_array >= i then
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
			
			local item = f_gongjizhiduihuan_card.static_create()
			item:panelInitBeforePopup()
			self.m_page_container:addComponentToPage(item, pageIndex)
						
			item:setIndex(i)
			item:setData(self.m_duihuan_array[i])
			item:setCardDuihuanCallback(itemCallback)
			item:setCardRemoveFromListCallback(removeItem)					
				
			table.insert(self.m_danye_duihuan_array, item)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] itemDuihuan
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:itemDuihuan(card)
	local data = card:getData()
	if data ~= nil then
		local sendBuyItemMsg = function()
			self:requestDuihuan(data)
		end
				
		--弹出功绩值兑换窗口
		local popupDuihuan = require("scripts.game.main.qianguyidi.f_qgyd_duihuan_popup_panel").new()	
		g_game.g_panelManager:showUiPanel(popupDuihuan,"qgyd_duihuan_popup")
		popupDuihuan:setItemData(data)
		popupDuihuan:setBuyCallback(sendBuyItemMsg)
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] requestDuihuan
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:requestDuihuan(data)
	local popupDuihuan = g_game.g_panelManager:getUiPanel("qgyd_duihuan_popup")
	local duihuanId = data[1]
	local duihuanNum = popupDuihuan.m_itemCount

	if duihuanNum ~= 0 then
		--使用recoverData里的功绩值
		
		local currentGongjizhi = g_game.g_userInfoManager:getRecoverData()["contribution"]
		--判断功绩值是否足够
--		local pvpInfo = g_game.g_userInfoManager:getUserPvpRank()
--		local currentGongjizhi = pvpInfo["contribution"]
		if currentGongjizhi >= data[4] * popupDuihuan.m_itemCount then
			--发送请求
			g_game.g_userInfoManager:requestGongjizhiDuihuan(duihuanId,duihuanNum)
		else
		    g_game.g_utilManager:showMsg("您的功绩值不足哦！")
		end
	else
		g_game.g_panelManager:removeUiPanel("qgyd_duihuan_popup")
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] removeItem
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:removeItem(card)
    local data = card:getData()	
	for i = 1, #self.m_danye_duihuan_array do
		if data == self.m_danye_duihuan_array[i]:getData() then
			table.remove(self.m_danye_duihuan_array, i)
			break
		end	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] registerNodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:registerNodeEvent(handler)
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
-- @function [parent=#f_qianguyidi_exchange] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] onEnter
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:onEnter()   
	self:initAllComponent()
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] update
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:update(dt)
	self.m_deltaTime = self.m_deltaTime + dt
	if self.m_deltaTime >= 1 then
		self.m_deltaTime = 0
		self.m_remainTime = self.m_remainTime - 1
		local output = g_game.g_utilManager:getExportTime(self.m_remainTime)
		self.m_componentTable["gjzdh_shijian_num_label"]:setString(output)
		
		if self.m_remainTime <= 0 then
			self.m_remainTime = g_game.UPDATE_TIME*2
			g_game.g_userInfoManager:requestRecoverData()
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] onExit
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:onExit()  
  self:unregisterNodeEvent()
  g_game.g_gameManager:removeUpdateObj(self)

  --移除注册的监听函数
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateContribution)
  
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI_DUIHUAN, self.event_updateGongjizhiDuihuan)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI, self.event_updateGongjizhi)
  self.m_danye_duihuan_array	= nil
  self.m_duihuan_array = nil
  self.m_qualityRect = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] onExitTransitionStart
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] onCleanup
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:initAllComponent()
	self.m_componentTable["gjzdh_shuaxin_button"]:setVisible(false)
	self:refresh()
	
--	local refreshGongji = function()
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)	
--	end
--	self.m_componentTable["gjzdh_shuaxin_button"]:addHandleOfcomponentEvent(refreshGongji,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--显示前页
	local showPrePage = function()
		self.m_page_container:showPrePage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gjzdh_pre_page_button"]:addHandleOfcomponentEvent(showPrePage,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--显示后页
	local showBackPage = function()
		self.m_page_container:showNextPage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gjzdh_back_page_button"]:addHandleOfcomponentEvent(showBackPage,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--关闭当前按钮
	local closeCurrentPanel = function()
		g_game.g_panelManager:removeUiPanel("qgyd_gongjizhiduihuan")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)	
	end
	self.m_componentTable["gjzdh_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--注册功绩值兑换成功后的更新事件（修改功绩值 发送修改功绩值事件成功 弹出提示）
	self.event_updateGongjizhiDuihuan = function()
		self:updateGongjizhiDuihuan()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI_DUIHUAN, self.event_updateGongjizhiDuihuan)	
	
	--注册功绩值修改后更新事件（更新界面的功绩值）
	self.event_updateGongjizhi = function()
		self:refresh()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI, self.event_updateGongjizhi)

	self.event_updateContribution  = function()
		self:updateCall()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateContribution)
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] updateCall
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:updateCall()
	local pvpInfo = g_game.g_userInfoManager:getUserPvpRank()
	local updateArr = g_game.g_userInfoManager:getRecoverData()
	if pvpInfo ~= nil then
	    pvpInfo["contribution"] = updateArr["contribution"]
	end
	self.m_componentTable["gjzdh_dangqian_num_label"]:setString(updateArr["contribution"])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] updateGongjizhiDuihuan
-- 更新功绩值兑换信息
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:updateGongjizhiDuihuan()
	local result = g_game.g_userInfoManager:getExchangeResult()
	
   	local num2 = result["updateInfo_Num"]
   	
   	for i = 1, num2 do
   		--3名臣  2美女
   		if result["updateInfo"][i]["type"] == 3 then
   			g_game.g_userInfoManager:addEmptyCard(3,result["updateInfo"][i]["id"],result["updateInfo"][i]["primaryId"],1)
   		elseif result["updateInfo"][i]["type"] == 2 then
   			g_game.g_userInfoManager:addEmptyCard(2,result["updateInfo"][i]["id"],result["updateInfo"][i]["primaryId"],1)
   		else -- 所有的道具
   			g_game.g_userInfoManager:addEmptyCard(1,result["updateInfo"][i]["id"],result["updateInfo"][i]["primaryId"],result["updateInfo"][i]["num"])
   		end
   	end
	
	--弹出兑换成功提示
--    g_game.g_utilManager:showMsg("兑换成功！")
	--维护用户功绩值信息
	local popupDuihuan = g_game.g_panelManager:getUiPanel("qgyd_duihuan_popup")
	local data = popupDuihuan.m_itemData
	local duihuan_count = popupDuihuan.m_itemCount
	local pvpInfo = g_game.g_userInfoManager:getUserPvpRank()
	if pvpInfo ~= nil then
		pvpInfo["contribution"] = pvpInfo["contribution"] - data[4] * duihuan_count
	end
	
	if popupDuihuan ~= nil then
		local updateData = g_game.g_userInfoManager:getRecoverData()
		updateData["contribution"] = updateData["contribution"] - data[4]* duihuan_count
		--发送功绩值修改后的事件
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_exchange] refresh
-- 刷新页面信息
-------------------------------------------------------------------------------
function f_qianguyidi_exchange:refresh()
--	local pvpInfo = g_game.g_userInfoManager:getUserPvpRank()
--	local currentGongjizhi = pvpInfo["contribution"]
	local currentGongjizhi = g_game.g_userInfoManager:getRecoverData()["contribution"]
	self.m_componentTable["gjzdh_dangqian_num_label"]:setString(currentGongjizhi)
end