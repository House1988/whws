--[[--
    主界面加号弹出窗口
--]]--
require("scripts.auto.auto_main_ui_pop_up")
require("scripts.game.main.tujian.f_tujian_panel")

f_game_main_popup = class("f_game_main_popup")
f_game_main_popup.__index = f_game_main_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_reward_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_main_popup.static_create()
	local panelTable = createmain_ui_pop_up()
	local panel = panelTable["main_ui_pop_up"]	

	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_game_main_popup)
	
	panel.m_componentTable = panelTable

	return panel 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_main_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_game_main_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_main_popup:panelInitBeforePopup()
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_main_popup:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] onEnter
-------------------------------------------------------------------------------
function f_game_main_popup:onEnter()
	if DEBUG_SDK_TYPE == 1 or DEBUG_SDK_TYPE == 14 then
		local pos = self.m_componentTable["button_exchange_reward"]:getPositionInContainer()
		self.m_componentTable["button_setting"]:setPositionInContainer(cc.p(pos.x,pos.y))
		self.m_componentTable["button_exchange_reward"]:setVisible(false)
	end
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] onExit
-------------------------------------------------------------------------------
function f_game_main_popup:onExit()  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_main_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_main_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] onCleanup
-------------------------------------------------------------------------------
function f_game_main_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_main_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_main_popup:initAllComponent()

	local mail = function()
		require("scripts.game.main.mail.f_mail_panel")
		local mail = f_mail_panel.static_create()
		mail:panelInitBeforePopup(1, 1)
		g_game.g_panelManager:showUiPanel(mail, "mail_panel")
		g_game.g_panelManager:removeUiPanel("main_popup")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end

	self.m_componentTable["button_xiaoxi"]:addHandleOfcomponentEvent(mail,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local vip = function()
		require("scripts.game.main.shangcheng.f_vip_panel")
		local vipPanel = f_vip_panel.static_create()
		vipPanel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(vipPanel,"vip")
		g_game.g_panelManager:removeUiPanel("main_popup")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end

	self.m_componentTable["button_vip"]:addHandleOfcomponentEvent(vip,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local exchangeReward = function()
		require("scripts.game.main.layout.f_game_exchange_reward")
		local exchange = f_game_exchange_reward.static_create()
		exchange:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(exchange,"exchange_reward")
		exchange:resetInputPosition()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["button_exchange_reward"]:addHandleOfcomponentEvent(exchangeReward,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
	local gonggao = function()
		if g_game.g_userInfoManager.m_gonggaoList == nil then
			g_game.g_userInfoManager:requestGonggao()
		else
			if #g_game.g_userInfoManager.m_gonggaoList > 0 then
				require("scripts.game.main.gonggao.f_gonggao_panel")
				local gonggao = f_gonggao_panel.static_create()
				gonggao:panelInitBeforePopup()
				g_game.g_panelManager:showUiPanel(gonggao, "gonggao_panel")
			else
				g_game.g_utilManager:showFloatingMsg("当前没有公告")
			end
		end
		g_game.g_panelManager:removeUiPanel("main_popup")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end

	self.m_componentTable["button_gonggao"]:addHandleOfcomponentEvent(gonggao,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	-- 图鉴
	local tujianBtnCallback = function()
		g_game.g_panelManager:removeUiPanel("main_popup")
		local tujianPanel = f_tujian_panel.static_create()
		g_game.g_panelManager:showUiPanel(tujianPanel, "tujian_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["button_tujian"]:addHandleOfcomponentEvent(tujianBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
	local showPP = g_game.g_f_sdk_layout_define["isShowPPUser_center"]
	local showLuntan = g_game.g_f_sdk_layout_define["isShowBBS_center"]
	
	local showLongbg = showPP or showLuntan
	
--	self.m_componentTable["main_ui_pop_upBg_image_pp"]:setVisible(showLongbg )
--	self.m_componentTable["main_ui_pop_upBg_image"]:setVisible(not showLongbg)
	
	
	self.m_componentTable["button_pp"]:setVisible(showPP)
	self.m_componentTable["button_luntan"]:setVisible(showLuntan)
	if showPP then
		local openPP = function()
		 	g_game.g_panelManager:removeUiPanel("main_popup")
		 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_PP_OPEN_USER_CENTER)
		end
		self.m_componentTable["button_pp"]:addHandleOfcomponentEvent(openPP,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	end
	
	if showLuntan then
		local openBBS = function()
		 	g_game.g_panelManager:removeUiPanel("main_popup")
		 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_PP_OPEN_BBS)
		end
		self.m_componentTable["button_luntan"]:addHandleOfcomponentEvent(openBBS,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	end

	local setting = function()
		require("scripts.game.main.layout.f_game_settings")
    	local setting = f_game_settings.static_create()
	    setting:panelInitBeforePopup()
	    g_game.g_panelManager:showUiPanel(setting,"public_setting")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["button_setting"]:addHandleOfcomponentEvent(setting,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
end

return f_game_main_popup