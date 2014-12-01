require("scripts.auto.auto_qgyd_duihuan_popup")
--[[
	弹出提示板
]]--

local f_qgyd_duihuan_popup_panel = class("f_qgyd_duihuan_popup_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_qgyd_duihuan_popup_panel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:ctor()
	self.m_baseTable = nil
	self.m_bottomPanel = nil
	self.m_itemData = nil
	self.m_buyCallBack = nil
    self:registerNodeEvent()   
    
    self.m_itemCount = 0
    
    self.m_cost = 0
    
    self.DAOJU_TYPE = 1
    self.ZHUANGBEI_TYPE = 2
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:onEnter()   
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
    
    self.m_baseTable = createqgyd_duihuan_popup()
    self.m_bottomPanel =  self.m_baseTable["item_popup_panel"]
    
    local panel = self.m_baseTable["qgyd_duihuan_popup"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width/2, g_game.g_display.sizeInPixels.height/2))
    panel:setStopTouchEvent(true)
    
    self.m_bottomPanel:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self.m_bottomPanel:runAction(cc.EaseBounceOut:create(actionTo))
	
	local addLeft = function()
		if self.m_itemCount <= 1 then
			self.m_itemCount = 1
			local percent = self.m_baseTable["count_slider"]:setPercent(0)
		else
			self.m_itemCount = self.m_itemCount - 1
			local percent = self.m_baseTable["count_slider"]:setPercent(self.m_itemCount*10)
		end
		self.m_baseTable["lingqu_num"]:setString(self.m_itemCount) 
		
		self.m_cost = self.m_itemData[4]*self.m_itemCount
		
		self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	self.m_baseTable["jiantou_left"]:addHandleOfcomponentEvent(addLeft,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local addRight = function()
		if self.m_itemCount >= 10 then
			self.m_itemCount = 10
			local percent = self.m_baseTable["count_slider"]:setPercent(100)
		else
			self.m_itemCount = self.m_itemCount + 1
			local percent = self.m_baseTable["count_slider"]:setPercent(self.m_itemCount*10)
		end
		self.m_baseTable["lingqu_num"]:setString(self.m_itemCount) 
		
		self.m_cost = self.m_itemData[4]*self.m_itemCount
		self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	self.m_baseTable["jiantou_right"]:addHandleOfcomponentEvent(addRight,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("qgyd_duihuan_popup")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_baseTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_baseTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local buy = function()
		self.m_buyCallBack()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_baseTable["buy_btn"]:addHandleOfcomponentEvent(buy,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
    g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] update
-- 更新
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:update(dt)
	local percent = self.m_baseTable["count_slider"]:getPercent()
	self.m_itemCount = math.ceil(percent / 10)
	if self.m_itemCount <= 1 then
		self.m_itemCount = 1
	end
	self.m_baseTable["lingqu_num"]:setString(self.m_itemCount) 	
	self.m_cost = self.m_itemData[4]*self.m_itemCount
	self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] setItemData
-- 设置 item data
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:setItemData(data)
	self.m_itemData = data
	local wupin_info = nil
	--设置物品名称
	if data[2] == self.DAOJU_TYPE then
		local wupin_info = g_game.g_dictConfigManager:getPropById(data[3])
		local nameText = g_game.g_dictConfigManager:getLanTextById(wupin_info[2])
		self.m_baseTable["mid_label_mid"]:setString(nameText)
	elseif data[2] == self.ZHUANGBEI_TYPE then
	end	
		
	self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] setBuyCallback
-- 设置 item data
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:setBuyCallback(call)
	self.m_buyCallBack = call
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] onExit
-- exit
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qgyd_duihuan_popup_panel] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_qgyd_duihuan_popup_panel] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_qgyd_duihuan_popup_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_qgyd_duihuan_popup_panel