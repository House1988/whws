require("scripts.game.main.card.f_card_paibing_huangzi")
require("scripts.game.main.qianguyidi.f_qianguyidi_main")
require("scripts.game.main.equipBag.f_game_equip_bag_panel")

--[[--
    主界面右边居中面板扩展类
--]]--
f_game_right_center_panel = class("f_game_right_center_panel")
f_game_right_center_panel.__index = f_game_right_center_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_right_center_panel.static_create()
	local leftTopPanelTable = g_game.g_panelManager:create_panel("main_ui_right_center")
	local leftTopPanel = leftTopPanelTable["main_ui_right_center"]
	
	local funTable = {}
	tolua.setpeer(leftTopPanel, funTable)
	setmetatable(funTable, f_game_right_center_panel)
	
	leftTopPanel.m_componentTable = leftTopPanelTable
	   
	return leftTopPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_game_right_center_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.RIGHT_MIDDLE)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(1, 0.5))   
  	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT/2))
 
  	self:initAllComponent()--初始化各个组件
  	
--  	self.m_componentTable["button_beibao"]:setVisible(false)
--  	self.m_componentTable["button_qiangduo"]:setVisible(false)
--  	self.m_componentTable["button_jingjichang"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_right_center_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_right_center_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_right_center_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] onEnter
-------------------------------------------------------------------------------
function f_game_right_center_panel:onEnter()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] onExit
-------------------------------------------------------------------------------
function f_game_right_center_panel:onExit()  
  	self:unregisterNodeEvent()
  	
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_LIST_DATA, self.event_updatePvpRankList)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_EQUIP_BAG, self.event_updateEquipBag)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_right_center_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_right_center_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_right_center_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_right_center_panel:initAllComponent()
	self.m_is_click_guoku = false
	
	--注册布阵按钮回调函数	
	local buzhengCallback = function()
		if g_game.g_guidelinesManager:canBtnClick("paibing") then
			self:popupBuZhen()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_BZ)
			g_game.g_panelManager:removeUiPanel("main_popup")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end	
	self.m_componentTable["button_buzhen"]:addHandleOfcomponentEvent(buzhengCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	--注册 背包点击
	local equipBagCallback = function()
		if g_game.g_guidelinesManager:canBtnClick("guoku") then
			self.m_is_click_guoku = true
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
			g_game.g_userInfoManager:requestUserEquipBag()
			g_game.g_panelManager:removeUiPanel("main_popup")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
	self.m_componentTable["button_beibao"]:addHandleOfcomponentEvent(equipBagCallback,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local paihang = function()
		if g_game.g_guidelinesManager:canBtnClick("paihang") then
			local userLv = g_game.g_userInfoManager:getLevel()
			
			if userLv < 10 then
				if LANGUAGE_TYPE == 3 then
					g_game.g_utilManager:showMsg("10級開啟，看誰一枝獨秀獨佔鰲頭！")				
				else
					g_game.g_utilManager:showMsg("10级开启，看谁一枝独秀独占鳌头！")
				end
			else
				require("scripts.game.main.leaderboard.f_leaderboard_main")
				local panel = f_leaderboard_main.static_create()
				panel:panelInitBeforePopup(1)
				g_game.g_panelManager:showUiPanel(panel, "leaderboard")
				g_game.g_panelManager:removeUiPanel("main_popup")
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			end
			
		end
	end
	self.m_componentTable["button_leaderboard"]:addHandleOfcomponentEvent(paihang,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--注册竞技场按钮回调函数	
	local jingjichangCallback = function()
		if g_game.g_guidelinesManager:canBtnClick("baye") then
			local userLv = g_game.g_userInfoManager:getUserInfo()["level"]
			if userLv < 10 then
				g_game.g_utilManager:showPublicFloatingMsg(g_game.g_f_error_msg_def.F_LUA_ERROR_PVP_NOT_OPEN)
			else
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
				g_game.g_userInfoManager:requestUserPvpPlayerList()
			end
			g_game.g_panelManager:removeUiPanel("main_popup")
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end	
	self.m_componentTable["button_jingjichang"]:addHandleOfcomponentEvent(jingjichangCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	--注册更新 竞技场列表
	self.event_updatePvpRankList = function()
		self:enterPvp()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_LIST_DATA, self.event_updatePvpRankList)
	
	--注册更新 国库
	self.event_updateEquipBag = function()
		if self.m_is_click_guoku == true then
			self:popupEquip()
			self.m_is_click_guoku = false
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_EQUIP_BAG, self.event_updateEquipBag)
	
	--抢夺
	--[[local notOpenCallBack = function()
		g_game.g_utilManager:showMsg("功能未开启")
	end
	self.m_componentTable["button_qiangduo"]:addHandleOfcomponentEvent(notOpenCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE )]]--
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] popupEquip
-- 背包按钮按下事件
-------------------------------------------------------------------------------
function f_game_right_center_panel:popupEquip()
	local equipPanel = f_game_equip_bag_panel.static_create()
    equipPanel:panelInitBeforePopup(0, false)
	g_game.g_panelManager:showUiPanel(equipPanel,"user_equip_bag_panel")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] popup buzhenpanel
-- 布阵按钮按下事件
-------------------------------------------------------------------------------
function f_game_right_center_panel:popupBuZhen()

    self.m_paibing_huangzi_panel = f_card_paibing_huangzi.static_create()
    self.m_paibing_huangzi_panel:panelInitBeforePopup()
    
	g_game.g_panelManager:showUiPanel(self.m_paibing_huangzi_panel,"paibinghuangzi_top")
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_right_center_panel] enterPvp
-- 进入竞技场
-------------------------------------------------------------------------------
function f_game_right_center_panel:enterPvp()
	g_game.g_panelManager:removeUiPanel("qgyd_bottom")
	local pvpBottom = require("scripts.game.main.qianguyidi.f_qianguyidi_main").new()
	g_game.g_panelManager:showUiPanel(pvpBottom,"qgyd_bottom")
end

