require("scripts.game.main.shangcheng.f_vip_detail")

--[[--
	vip 主面板
--]]--
f_vip_panel = class("f_vip_panel")
f_vip_panel.__index = f_vip_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_vip_panel.static_create()
	local vip_Table = g_game.g_panelManager:create_panel("vip")
	local vip_Panel = vip_Table["vip"]
	  
	local funTable = {}
	tolua.setpeer(vip_Panel, funTable)
	setmetatable(funTable, f_vip_panel)
	
	vip_Panel.m_componentTable = vip_Table
	return vip_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_vip_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_total_pages	= 0	
	self.m_vip_count	= 0
	self.COL			= 1
	self.ROW			= 1
	
	self.m_danye_vip_array	= {}
	self.m_vip_array = {}
	self.m_vipCurrentNumLabel = nil
	self.m_vipNextNumLabel = nil
	
	self.m_buyPageIndex = 1
	self.m_detailPanelTable = {}
	
	self:loadVipData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] loadVipData
-- 加载vip数据
-------------------------------------------------------------------------------
function f_vip_panel:loadVipData()
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end	
	self.m_page_container = nil
	
	self.m_componentTable["vip_pre_page_button"]:setComponentZOrder(10)
	self.m_componentTable["vip_back_page_button"]:setComponentZOrder(10)
--	self.m_componentTable["vip_bg"]:setComponentZOrder(-20)
	--获取到所有皇子列表
	self.m_vip_array = clone(g_game.g_dictConfigManager:getVipInfo())
	table.remove(self.m_vip_array,1)
	self.m_vip_count = #self.m_vip_array
	
	self.m_total_pages = math.ceil(self.m_vip_count / (self.COL * self.ROW))	
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(882,450))
--	self.m_page_container:setComponentZOrder(1)
	self.m_page_container:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, 360))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)     
    
    local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end
    self.m_page_container:registLoadPageCallback(load)
    
    local updataPageNum = function()
    	self:updataPageNum()
    end      
    self.m_page_container:registMovePageCallback(updataPageNum)	
    local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local pageIndex = 1
	if vipInfo["level"] ~= 0 then pageIndex = vipInfo["level"] end
--	self.m_page_container:gotoPage(pageIndex)
	self.m_page_container:setPageInfoAndIndex(self.m_vip_count, self.ROW, self.COL, 0, 0, 882,450, pageIndex)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] updataPageNum
-- 刷新vip列表
-------------------------------------------------------------------------------
function f_vip_panel:updataPageNum()
	self.m_componentTable["vip_page_num_label"]:setString(self.m_page_container:getCurrentPageIndex() .. "/" .. self.m_total_pages)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] loadPageData
-- 刷新vip列表
-------------------------------------------------------------------------------
function f_vip_panel:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
	
	local removeItem = function(index)
		self:removeItem(index)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	local item = f_vip_detail.static_create()
	self.m_detailPanelTable[pageIndex] = item
	item:panelInitBeforePopup()
	self.m_page_container:addComponentToPage(item, pageIndex)			
	item:setIndex(pageIndex)
	local vipMask = g_game.g_userInfoManager:getVipPackMask()
	item:setData(self.m_vip_array[pageIndex], vipMask[pageIndex]==1)
	item:setVipItemRemoveFromListCallback(removeItem)
	local func = function(pageIndex)
		self.m_buyPageIndex = pageIndex
	end
	item:setFuncHandler(func)
	table.insert(self.m_danye_vip_array, item)
	
	self:updataPageNum()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] removeItem
-------------------------------------------------------------------------------
function f_vip_panel:removeItem(index)	
--	for i = 1, #self.m_danye_vip_array do
--		if self.m_danye_vip_array[i]:getIndex() == index then
--			table.remove(self.m_danye_vip_array, i)
--			return
--		end			
--	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_vip_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_vip_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_vip_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] onEnter
-------------------------------------------------------------------------------
function f_vip_panel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] onExit
-------------------------------------------------------------------------------
function f_vip_panel:onExit()  
    self:unregisterNodeEvent()
    
    self.m_danye_vip_array	= {}
	self.m_vip_array = {}
    self.m_vipCurrentNumLabel = nil
	self.m_vipNextNumLabel = nil
	--移除玩家获得元宝充值成功后的事件
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GET_VIP_PACK, self.event_getVipPack)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_vip_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_vip_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] onCleanup
-------------------------------------------------------------------------------
function f_vip_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_vip_panel:initAllComponent()
--	self.m_componentTable["vip_bg"]:setImage(g_game.g_resourceManager:getUiMap("chongzhi_ditu"))
--	self.m_componentTable["vip_bg"]:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
--	self.m_componentTable["vip_bg"]:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	--添加用户当前vip等级的label
	self.m_vipCurrentNumLabel = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(self.m_vipCurrentNumLabel)	
	self.m_vipCurrentNumLabel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_vipCurrentNumLabel:setPositionInContainer(cc.p(210, 105))
	self.m_vipCurrentNumLabel:setAlignment(1)
	self.m_vipCurrentNumLabel:setTextWithInt(15)
	--添加用户下一级vip等级的label
	self.m_vipNextNumLabel = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(self.m_vipNextNumLabel)
	self.m_vipNextNumLabel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_vipNextNumLabel:setPositionInContainer(cc.p(893, 105))
	self.m_vipNextNumLabel:setAlignment(1)
	self.m_vipNextNumLabel:setTextWithInt(15)
	
	--点击选择向前按钮的点击事件
	local xiangqianClick = function()
		self:xiangqianClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["vip_pre_page_button"]:addHandleOfcomponentEvent(xiangqianClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向后按钮的点击事件
	local xianghouClick = function()
		self:xianghouClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["vip_back_page_button"]:addHandleOfcomponentEvent(xianghouClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	--注册关闭按钮
	local closeCallback = function()
		self:closeCurrentPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["vip_close_button"]:addHandleOfcomponentEvent(closeCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )	
	
	--领取 vip礼包回调
	self.event_getVipPack = function()
		self:updateGetVipPack()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GET_VIP_PACK, self.event_getVipPack)
	
	self:refresh()	
	self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] updateGetVipPack
-- 刷新玩家vip 礼包到背包
-------------------------------------------------------------------------------
function f_vip_panel:updateGetVipPack()
	g_game.g_utilManager:showMsg("购买成功！")
	local returnPackResult = g_game.g_userInfoManager:getVipPackResult()
	g_game.g_userInfoManager:updateUserGold(returnPackResult["gold"])
	
	CCLOG("购买vip等级礼包成功刷新面板:"..self.m_buyPageIndex)
	-- 置灰按钮
	local currIndex = self.m_page_container:getCurrentPageIndex()
	g_game.g_userInfoManager:setVipPackMask(currIndex, 1)
	if currIndex == self.m_buyPageIndex then
		CCLOG("修改vip等级礼包:"..currIndex)
		self.m_detailPanelTable[currIndex]:setButtonState(8)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] closeCurrentPanel
-- 关闭当前面板
-------------------------------------------------------------------------------
function f_vip_panel:closeCurrentPanel()
	g_game.g_panelManager:removeUiPanel("vip")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] refresh
-- 刷新当前界面
-------------------------------------------------------------------------------
function f_vip_panel:refresh()
	--获取到用户vip信息
	local info = g_game.g_userInfoManager:getUserInfo()
	local vipCurrent = info["vipLevel"]
	if vipCurrent < self.m_total_pages then
		local vipNext = vipCurrent + 1
		self.m_vipCurrentNumLabel:setTextWithInt(vipCurrent)
		self.m_vipNextNumLabel:setTextWithInt(vipNext)
		
		--获取vip元宝信息
		local vipYuanbao = g_game.g_userInfoManager:getUserChongzhiYuanbao()
		--获取到当前vip的多余(不足以升到下一级)元宝数
		local vipExtraYuanbao = vipYuanbao - g_game.g_dictConfigManager:getVipNeedYuanbao(vipCurrent)		
		--获取到当前vip升级到下一级所需元宝
		local vipNeedYuanbao = g_game.g_dictConfigManager:getVipNeedYuanbao(vipNext) - g_game.g_dictConfigManager:getVipNeedYuanbao(vipCurrent)
		--计算百分比
		local percent =  vipExtraYuanbao/vipNeedYuanbao
		--设置进度条显示
		self.m_componentTable["vip_loading_bar"]:setPercent(percent*100)
		--设置文字显示（再充值升到下一级）
		self.m_componentTable["vip_zaichongzhi_num_label"]:setString(vipNeedYuanbao-vipExtraYuanbao)
		--设置最高vip提示不显示
		self.m_componentTable["vip_max_level"]:setVisible(false)
		self.m_componentTable["vip_loading_bar"]:setVisible(true)
		self.m_componentTable["yuanbao"]:setVisible(true)
		self.m_componentTable["shengjidao_label"]:setVisible(true)
	else 
		self.m_componentTable["vip_zaichongzhi_label"]:setVisible(false)
		self.m_componentTable["yuanbao"]:setVisible(false)
--		self.m_componentTable["vip_shengzhi_image"]:setVisible(false)
		self.m_componentTable["vip_shengzhi_vip_image"]:setVisible(false)
		self.m_componentTable["vip_loading_bar"]:setVisible(false)
		self.m_componentTable["vip_zaichongzhi_num_label"]:setVisible(false)
		self.m_vipNextNumLabel:setVisible(false)
		self.m_componentTable["vip_max_level"]:setVisible(true)
		self.m_componentTable["vip_loading_bar"]:setVisible(false)
		self.m_componentTable["shengjidao_label"]:setVisible(false)
	end
	
--	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
--	local pageIndex = 1
--	if vipInfo["level"] ~= 0 then pageIndex = vipInfo["level"] end
--	self.m_page_container:gotoPage(pageIndex)
	-- 显示对应当前vip等级页
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] xiangqianClick
-- 向前按钮点击
-------------------------------------------------------------------------------
function f_vip_panel:xiangqianClick()
	self.m_page_container:showPrePage()	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_panel] xianghouClick
-- 向后按钮点击
-------------------------------------------------------------------------------
function f_vip_panel:xianghouClick()
	self.m_page_container:showNextPage()
end
