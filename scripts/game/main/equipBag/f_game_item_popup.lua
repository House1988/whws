require("scripts.auto.auto_item_popup")
--[[
	弹出提示板
]]--

local f_game_item_popup = class("f_game_item_popup", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_item_popup")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_item_popup:ctor()
	self.m_baseTable = nil
	self.m_bottomPanel = nil
	self.m_itemData = nil
	self.m_buyCallBack = nil
    self:registerNodeEvent()   
    
    self.m_itemCount = 1
    
    self.m_cost = 0
    self.TYPE_SILVER = 1
    self.TYPE_GOLD = 2
    self.m_costType = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_item_popup:onEnter()   
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
    
    self.m_baseTable = createitem_popup()
    self.m_bottomPanel =  self.m_baseTable["item_popup_panel"]
    
    local panel = self.m_baseTable["item_popup"]
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
		
		if self.m_costType == self.TYPE_GOLD  then
			self.m_cost = self.m_itemData[5]*self.m_itemCount
		else
			self.m_cost = self.m_itemData[6]*self.m_itemCount
		end
		
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
		
		if self.m_costType == self.TYPE_GOLD  then
			self.m_cost = self.m_itemData[5]*self.m_itemCount
		else
			self.m_cost = self.m_itemData[6]*self.m_itemCount
		end
		self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	self.m_baseTable["jiantou_right"]:addHandleOfcomponentEvent(addRight,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("item_pop_up")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_baseTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local buy = function()
		self.m_buyCallBack()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_baseTable["buy_btn"]:addHandleOfcomponentEvent(buy,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
    g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] update
-- 更新
-------------------------------------------------------------------------------
function f_game_item_popup:update(dt)
	local percent = self.m_baseTable["count_slider"]:getPercent()
	self.m_itemCount = math.ceil(percent / 10)
	if self.m_itemCount <= 1 then
		self.m_itemCount = 1
	end
	self.m_baseTable["lingqu_num"]:setString(self.m_itemCount)  
	
	if self.m_costType == self.TYPE_GOLD  then
		self.m_cost = self.m_itemData[5]*self.m_itemCount
	else
		self.m_cost = self.m_itemData[6]*self.m_itemCount
	end
	self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] setItemData
-- 设置 item data
-------------------------------------------------------------------------------
function f_game_item_popup:setItemData(data)
	self.m_itemData = data
	local strTT = g_game.g_dictConfigManager:getLanTextById(data[2])
	self.m_baseTable["mid_label_mid"]:setString(strTT)
	
	if data[5] ~= 0 then
		self.m_costType = self.TYPE_GOLD 
	elseif data[6] ~= 0 then
		self.m_costType = self.TYPE_SILVER
		self.m_baseTable["yuabao_image"]:setImage("batch_ui/yinliang_tubiao.png")
		self.m_baseTable["yuabao_image"]:setSize(cc.size(29,24))
	end
	
	self.m_baseTable["yuanbao_num"]:setString(self.m_cost)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] setBuyCallback
-- 设置 item data
-------------------------------------------------------------------------------
function f_game_item_popup:setBuyCallback(call)
	self.m_buyCallBack = call
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] onExit
-- exit
-------------------------------------------------------------------------------
function f_game_item_popup:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_game_item_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_game_item_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_game_item_popup:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_item_popup] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_game_item_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_game_item_popup] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_game_item_popup:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_game_item_popup