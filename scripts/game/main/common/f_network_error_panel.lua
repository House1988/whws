require("scripts.auto.auto_public_network_error_pop")
require("scripts.auto.auto_public_reconnect_popup")
--[[
	网络错误弹出提示板
]]--

local f_network_error_panel = class("f_network_error_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_network_error_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_network_error_panel:ctor()
    self:registerNodeEvent()   
    
  	self.m_real_size = g_game.g_real_size

  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)  
  	
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 5)	
  	
    self.m_layer_color_panel		= require("scripts.extend.f_lua_color_layer").new()
    self.m_autoPanel:appendComponent(self.m_layer_color_panel)
    self.m_layer_color_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_layer_color_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH * 0.5, CONFIG_SCREEN_HEIGHT * 0.5))
  		  	
  	self.m_autoPanel:appendComponent(self)
  	
	self:setSize(self.m_real_size)    	
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))	
	
    self:setStopTouchEvent(true)
	
	self.m_show_text = ""
	self.m_callback_array = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_network_error_panel:onEnter()    
end


function f_network_error_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_network_error_panel:onEnterTransitionFinish()
end

function f_network_error_panel:onExitTransitionStart()
end

function f_network_error_panel:onCleanup()
end


function f_network_error_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_network_error_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_network_error_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] createReconnectPopup
--断线重连提示板
-------------------------------------------------------------------------------
function f_network_error_panel:createReconnectPopup()
	
	self.m_noticeTable = createpublic_reconnect_popup()
	
	self.m_actionPanel = self.m_noticeTable["bottom_panel"]
	
	local panel = self.m_noticeTable["public_reconnect_popup"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(self.m_real_size.width/2,
    self.m_real_size.height/2))
    self.m_noticeTable["notice_label"]:setString(self.m_show_text)
    
    local noticeYes = function()
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_callback_array[1] then
			self.m_callback_array[1]()
		end
	end
	self.m_noticeTable["left_btn"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local noticeNo = function()
		if self.m_callback_array[2] then
			self.m_callback_array[2]()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_noticeTable["right_btn"]:addHandleOfcomponentEvent(noticeNo, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] createNetworkError
-- 创建网络出错弹出板
-------------------------------------------------------------------------------
function f_network_error_panel:createNetworkErrorPopup()	
	self.m_noticeTable = createpublic_network_error_pop()

	self.m_actionPanel = self.m_noticeTable["pop_bottom_panel"]
	
    local panel = self.m_noticeTable["public_network_error_pop"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(self.m_real_size.width/2,
    self.m_real_size.height/2))
    
    self.m_noticeTable["pnep_pop_notice_label"]:setString(self.m_show_text)
    
	local noticeYes = function()
		if self.m_callback_array[1] then
			self.m_callback_array[1]()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_noticeTable["pop_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] setShowText
--设置显示面板中文本
-------------------------------------------------------------------------------
function f_network_error_panel:setShowText(text)
	self.m_show_text = text
end


-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] addCallback
--添加按钮回调函数，自左向右顺序添加
-------------------------------------------------------------------------------
function f_network_error_panel:addCallback(callback)
	table.insert(self.m_callback_array, callback)
end



-------------------------------------------------------------------------------
-- @function [parent=#f_network_error_panel] hide
--隐藏面板
-------------------------------------------------------------------------------
function f_network_error_panel:hide()
	local layer = g_game.g_director:getRunningScene():get_layer_from_config(5)
	layer:removeChild(self.m_autoPanel, true)
end

return f_network_error_panel