--[[--
    登陆界面扩展类
--]]--
require("scripts.game.login.f_tw_login_choose_type_panel")

f_new_login_panel = class("f_new_login_panel")
f_new_login_panel.__index = f_new_login_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_new_login_panel.static_create()
	local loginTable = g_game.g_panelManager:create_panel("login_shuru_new")
	local loginPanel = loginTable["login_shuru_new"]
	
	local funTable = {}
	tolua.setpeer(loginPanel, funTable)
	setmetatable(funTable, f_new_login_panel)
	
	loginPanel.m_componentTable = loginTable
	return loginPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_new_login_panel:layout_in_parent()
	self.m_user_account = ""
  	self.m_user_uuid = ""
  	
  	self.m_stop_panel = nil
  	
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)

	self:registerNodeEvent()--注册特殊回调函数     
	
  	self.m_autoPanel:appendComponent(self)
  	 
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT*2/3+20))
	
	self.m_server_list_panel = require("scripts.game.login.f_new_server_list_panel").new()	
	g_game.g_panelManager:showUiPanel(self.m_server_list_panel,"server_list_panel")
	self.m_server_list_panel:setVisible(false)
	
	-- 显示选择登录面板
	self.event_showChooseTypePanel = function()
		if g_game.g_panelManager:isUiPanelShow("login_choose_type") == false then
			local login_choose_type_panel = f_tw_login_choose_type_panel.static_create()
			login_choose_type_panel:showFastLoginBtn()
			g_game.g_panelManager:showUiPanel(login_choose_type_panel,"login_choose_type")
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL, self.event_showChooseTypePanel)
	
  	self:initAllComponent()--初始化各个组件
  	
  	self.event_createRoleCallback = function(msg)
		self:createRoleCallback(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_CREATE_ROLE, self.event_createRoleCallback)
	
	-- 登录信息
	self.m_loginInfo = nil
	self.event_loginCallback = function(paramTable)
		self.m_loginInfo = paramTable
    	local delayLoginCallback = function()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
			self:loginSdkCallback(self.m_loginInfo)
    	end
		g_game.g_scheduler.performWithDelayGlobal(delayLoginCallback, 1.0)
    end
    g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, self.event_loginCallback)
	
	local updateServerName = function(server)
		self:setServerText(server)
	end
	self.m_server_list_panel:setServerSelectCallback(updateServerName)
	
	local serverClick = function()
		self:showServerList()
	end
	self.m_server_list_panel:setServerClickCallback(serverClick)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_new_login_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_new_login_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_new_login_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] onEnter
-------------------------------------------------------------------------------
function f_new_login_panel:onEnter()
	self.m_user_account = ""
	self.m_user_uuid = ""
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] onExit
-------------------------------------------------------------------------------
function f_new_login_panel:onExit()  
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, self.event_loginCallback)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL, self.event_showChooseTypePanel)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_POPUP_CHANGE_ACOUNT, self.event_changeLoginPop)
	g_game.g_netManager:removeMessage(g_network_message_type.SC_CREATE_ROLE, self.event_createRoleCallback)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_new_login_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_new_login_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] onCleanup
-------------------------------------------------------------------------------
function f_new_login_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] hideTouchComponent
-- 隐藏事件阻挡组件
------------------------------------------------------------------------------
function f_new_login_panel:hideTouchComponent()	
	if self.m_stop_panel then
		self.m_stop_panel:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] initAllComponent
-- 初始化所有面板中的组件
------------------------------------------------------------------------------
function f_new_login_panel:initAllComponent()
--use for ios taiwan
	self.m_componentTable["user_id_type_flag"]:setVisible(false)
	self.m_componentTable["choose_another_user_panel"]:setVisible(false)
	self.event_changeLoginPop = function()
		if self.m_componentTable["choose_another_user_panel"]:isVisible() then
			self.m_componentTable["choose_another_user_panel"]:setVisible(false)
		else
			self.m_componentTable["choose_another_user_panel"]:setVisible(true)
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_POPUP_CHANGE_ACOUNT, self.event_changeLoginPop)

	local popup = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_SHOW_LOGIN_CHOOSE_PANEL)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)	
		self.m_componentTable["choose_another_user_panel"]:setVisible(false)
	end	
	self.m_componentTable["choose_another_user_panel"]:addHandleOfcomponentEvent(popup, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

-----------------

	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["change_area_label"]:setString("點擊換區")
	end	
	
	--开始游戏按钮点击
	local loginCallback = function()
		self:login()	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)	
	end	
	local loginButton = self.m_componentTable["login_shuru_start_button"]
	loginButton:addHandleOfcomponentEvent(loginCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local showServerList = function()
		self:showServerList()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
    local serverListButton = self.m_componentTable["login_shuru_fuwuqi_bg"]
	serverListButton:addHandleOfcomponentEvent(showServerList, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local changeUserAccount = function()	
--		if self.m_user_account == "" then
--			return 
--		end	
--		self.m_user_account = ""	
--		self.m_user_uuid = ""	
--		self:setLoginAccount(self.m_user_account, self.m_user_uuid)
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT)
	end	
    local zhanghaoButton = self.m_componentTable["login_shuru_zhanghao_button"]
	zhanghaoButton:addHandleOfcomponentEvent(changeUserAccount, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
    self.m_stop_panel = fc.FContainerPanel:create()
    self.m_stop_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
    
    self:appendComponent(self.m_stop_panel)
    self.m_stop_panel:setVisible(true)
    self.m_stop_panel:setAnchorPoint(cc.p(0.5, 0.5))
    self.m_stop_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self.m_stop_panel:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] setLoginAccount
-- 设置登陆帐户
-------------------------------------------------------------------------------
function f_new_login_panel:setLoginAccount(account, userUUID)
	local func = function()
	end
--[[
	if not g_game.g_utilManager:checkInput(account) then
		g_game.g_utilManager:showPublicMessagePanel(g_game.g_f_error_msg_def.F_LUA_ERROR_INPUT_ERROR,func)
		return
	end
--]]
	self.m_server_list_panel:setUserAccount(account)
	
	self.m_user_account = account
	self.m_user_uuid = userUUID
	if self.m_user_account == DEBUG_SDK_TYPE.."_"..g_game.g_system:getUUID() then
		self.m_componentTable["user_name"]:setString("遊客模式")
	else
		self.m_componentTable["user_name"]:setString(self.m_user_account)
	end
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] setServerText
-- 设置服务器名称
-------------------------------------------------------------------------------
function f_new_login_panel:setServerText(serverName)
	self.m_componentTable["login_cur_server_label"]:setString(serverName)
	
	local serverInfo = self.m_server_list_panel:getSelectServerInfo()

	if serverInfo["status"] == 2 then
		self.m_componentTable["server_flag"]:setVisible(true)
		self.m_componentTable["server_flag"]:setImage("batch_ui/fuwuqitubiao_xin.png")
		self.m_componentTable["server_flag"]:setSize(cc.size(32,41))
	elseif serverInfo["status"] == 3 then
		self.m_componentTable["server_flag"]:setVisible(true)
		self.m_componentTable["server_flag"]:setImage("batch_ui/fuwuqitubiao_re.png")
		self.m_componentTable["server_flag"]:setSize(cc.size(32,41))
	elseif serverInfo["status"] == 1 then
		self.m_componentTable["server_flag"]:setVisible(false)
	elseif serverInfo["status"] == 0 then
		self.m_componentTable["server_flag"]:setVisible(false)
	else
		self.m_componentTable["server_flag"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] login
-- 登录函数
-------------------------------------------------------------------------------
function f_new_login_panel:login()
	if self.m_user_account == "" then
		if DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT)
		end
		return
	end
	
	local userName = self.m_user_account
	if userName == "" then
		echo("user name and password can't empty!")
		if not DEBUG_USE_DEFAULT_USER then
			return
		end
	end
	
	--检查服务器状态	
	local serverInfo = self.m_server_list_panel:getSelectServerInfo()
	if serverInfo == nil then
		return
	end
	
	if serverInfo["connect_state"] and serverInfo["connect_state"] == 1 then	
		if serverInfo["connect_state_des"] then	
			g_game.g_utilManager:showCommonTipsPanel(serverInfo["connect_state_des"], nil)
		end
		return 
	end
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	
	local nextFrameLogin = function()
		self:userLogin()
	end
	
	local seq = g_game.g_transition.sequence({cc.DelayTime:create(0.05), cc.CallFunc:create(nextFrameLogin)})
	self:runAction(seq)


end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] userLogin
-- 用户登陆
-------------------------------------------------------------------------------
function f_new_login_panel:userLogin()		
	local serverInfo = self.m_server_list_panel:getSelectServerInfo()
	if serverInfo == nil then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
		return
	end
	
	
	g_game.g_userInfoManager:resetCurrentUserData()
	
	g_game.g_netManager:connect(serverInfo["ip"], serverInfo["port"])

	
-- 	["deviceSign"] Type:STRING Size:8 设备标识
-- 	["channel"] Type:BYTE Size:1 渠道标识
	
	local udid = g_game.g_system:getUUID()	

	local dataT = {}
	
	if DEBUG_SDK_TYPE == 1 then
		dataT["deviceSign"] = udid
		dataT["channel"] = DEBUG_SDK_TYPE
		
		local b = g_game.g_sdkManager:isIosVerAbove6()
		if b then
			dataT["type"] = 1
		else
		    dataT["type"] = 2
		end
		 -- 1 idfa 2 mac
		dataT["id"] = self.m_user_uuid
		dataT["account"] = self.m_user_account
		if DEBUG_USE_DEFAULT_USER then
			dataT["account"] = g_default_user[1]
			dataT["id"] = g_default_user[1]
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
		g_game.g_netManager:send_message(g_network_message_type.CS_LOGIN_INFO_IOS, dataT)
	else
		dataT["deviceSign"] = udid
		dataT["channel"] = DEBUG_SDK_TYPE
		
		dataT["id"] = self.m_user_uuid
		dataT["account"] = self.m_user_account
		if DEBUG_USE_DEFAULT_USER then
			dataT["account"] = g_default_user[1]
			dataT["id"] = g_default_user[1]
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
		g_game.g_netManager:send_message(g_network_message_type.CS_LOGIN_INFO, dataT)
	end
	
	
	if dataT["account"] ~= "" then
		g_game.g_dataManager:initNativeFile(dataT["account"])
		g_game.g_dataManager:saveUserInfo(dataT["account"])
	end
	
	g_game.g_dataManager:saveCurrentServerInfo(serverInfo, dataT["account"])
	g_game.g_userInfoManager:saveUserAccount(dataT["account"])
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] fillServerListData
-- 设置服务器列表数据
-------------------------------------------------------------------------------
function f_new_login_panel:fillServerListData(data)	
	self.m_server_list_panel:fillServerList(data)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] showServerList
-- 显示服务器列表
-------------------------------------------------------------------------------
function f_new_login_panel:showServerList()	
	if self.m_server_list_panel:isVisible() then
		self.m_server_list_panel:setVisible(false)
		self.m_server_list_panel:setStopTouchEvent(false)
	else
		self.m_server_list_panel:setVisible(true)
		self.m_server_list_panel:setStopTouchEvent(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] createRoleCallback
-- 接受登陆失败消息回调,需要创建角色
-------------------------------------------------------------------------------
function f_new_login_panel:createRoleCallback(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then  --1-无角色
		self:createAccountRole(false)
	elseif msg["result"] == 2 then --2-同名
		self:createAccountRole(true)
	else
	
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] createAccountRole
-- 创建角色
-------------------------------------------------------------------------------
function f_new_login_panel:createAccountRole(isReinput)
	local createRolePanel = require("scripts.game.login.f_login_create_role").new()
	
	local inputRoleNameCallback = function(roleName)	
		g_game.g_panelManager:removeUiPanel("login_create_role")
		
		self:requestRoleLogin(roleName)
		
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	end
	
	if LANGUAGE_TYPE == 3 then
		if isReinput then
			createRolePanel:setInputTipsText("角色已經存在,請重新輸入角色名稱:")
		else
			createRolePanel:setInputTipsText("請輸入角色名稱:")	
		end
	else
		if isReinput then
			createRolePanel:setInputTipsText("角色已经存在,请重新输入角色名称:")
		else
			createRolePanel:setInputTipsText("请输入角色名称:")	
		end
	end
	
	createRolePanel:setInputDoneCallback(inputRoleNameCallback)	
	g_game.g_panelManager:showUiPanel(createRolePanel, "login_create_role")
	createRolePanel:showInput(false)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] requestRoleLogin
-- 创建角色成功
-------------------------------------------------------------------------------
function f_new_login_panel:requestRoleLogin(roleName)		
	local udid = g_game.g_system:getUUID()

	local dataT = {}
	dataT["deviceSign"] = udid
	
	dataT["channel"] = DEBUG_SDK_TYPE
	
	
	dataT["account"] = self.m_user_account
	dataT["roleName"] = roleName
	dataT["platformId"] = self.m_user_uuid
	g_game.g_netManager:send_message(g_network_message_type.CS_CREATE_ROLE, dataT)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] loginSdkCallback
-- sdk登录回调
-------------------------------------------------------------------------------
function f_new_login_panel:loginSdkCallback(paramTable)
	
	if paramTable["result"] == 0 then
	
		if DEBUG_SDK_TYPE == 14 then
			local type = g_game.g_dataManager:getUserLastLoginType()
			if type == 1 then
				self.m_componentTable["user_id_type_flag"]:setVisible(true)
				self.m_componentTable["user_id_type_flag"]:setImage("batch_ui/goole.png")
			elseif type == 2 then
				self.m_componentTable["user_id_type_flag"]:setVisible(true)
				self.m_componentTable["user_id_type_flag"]:setImage("batch_ui/facebook.png")
			else
				self.m_componentTable["user_id_type_flag"]:setVisible(false)
			end
		end
		
		self.m_user_account = paramTable["account"]		
		self.m_user_uuid = paramTable["userid"]	
		self:setLoginAccount(self.m_user_account, self.m_user_uuid)
			
		local serverListDone = function(result)
			self:loadServerListDataDone(result)
		end
		
		g_game.g_utilManager:loadServerList(serverListDone)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
		
		g_game.g_utilManager:forceHideUserHaventLogin()
	elseif paramTable["result"] == g_game.g_f_lua_game_event.F_LUA_SDK_USER_NEED_LOGIN then
		self.m_user_account = ""		
		self.m_user_uuid = ""	
		g_game.g_utilManager:showUserHaventLogin(paramTable["error_des"])
	elseif paramTable["result"] == g_game.g_f_lua_game_event.F_LUA_SDK_USER_ACCESS_FAILED then
		self.m_user_account = ""		
		self.m_user_uuid = ""	
		g_game.g_utilManager:showUserHaventLogin(paramTable["error_des"])	
	else
		self.m_user_account = ""		
		self.m_user_uuid = ""	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_CANNOT_CONNECT)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	end
	
	if g_game.g_panelManager:isUiPanelShow("login_create_role") then		
		g_game.g_panelManager:removeUiPanel("login_create_role")
	
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_login_panel] loadServerListDataDone
-- 服务器列表数据加载完成
-------------------------------------------------------------------------------
function f_new_login_panel:loadServerListDataDone(result)
	if result == 0 then
		self:fillServerListData(g_game.g_utilManager:getServerList())
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_REMOVE_WIN_USER_PANEL)
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_CHECK_VERSION)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		
		if DEBUG_SDK_TYPE == 14 then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_IOS_ADMOD_EVENT)
		end
		
	elseif result == -1 then	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_ERROR_CANNOT_CONNECT)
	end
end