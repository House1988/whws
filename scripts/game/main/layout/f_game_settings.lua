require("scripts.auto.auto_public_settings")
--[[--
  兑换码弹出
--]]--
f_game_settings = class("f_game_settings")
f_game_settings.__index = f_game_settings

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_settings.static_create()
							 
	local skillInfoTable = createpublic_settings()
	local skillInfo = skillInfoTable["public_settings"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_game_settings)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_settings:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_musicFlag = 0
	self.m_effectFlag = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_settings:registerNodeEvent(handler)
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
-- @function [parent=#f_game_settings] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_settings:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onEnter
-------------------------------------------------------------------------------
function f_game_settings:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onExit
-------------------------------------------------------------------------------
function f_game_settings:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_settings:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_settings:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] onCleanup
-------------------------------------------------------------------------------
function f_game_settings:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_settings:initAllComponent()
	local m,e = g_game.g_dataManager:getUserSetting()
	self.m_musicFlag = m
	self.m_effectFlag = e
	self:setSettingFlag()
	
	local yesBtn = function()
		g_game.g_panelManager:removeUiPanel("public_setting")
		g_game.g_dataManager:saveUserSetting(self.m_musicFlag,self.m_effectFlag)
		self:setSound()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["yes_btn"]:addHandleOfcomponentEvent(yesBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local canlBtn = function()
    	g_game.g_panelManager:removeUiPanel("public_setting")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["no_btn"]:addHandleOfcomponentEvent(canlBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
 
 	local musicBtn = function()
 		if self.m_musicFlag == 1 then self.m_musicFlag = 0 else  self.m_musicFlag = 1 end
 		self:setSettingFlag()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["panel1"]:addHandleOfcomponentEvent(musicBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    local effectBtn = function()
    	if self.m_effectFlag == 1 then self.m_effectFlag = 0 else  self.m_effectFlag = 1 end
    	self:setSettingFlag()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["panel2"]:addHandleOfcomponentEvent(effectBtn, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
 	
	if g_game.g_userInfoManager:getUserAccount() == DEBUG_SDK_TYPE.."_"..g_game.g_system:getUUID() then
		g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("login_ui"))
		self.m_componentTable["fastlogin_button"]:setVisible(true)
		local showBindPanel = function (  )
	 		if g_game.g_panelManager:isUiPanelShow("login_choose_type") == false then
				local login_choose_type_panel = f_tw_login_choose_type_panel.static_create()
				g_game.g_panelManager:showUiPanel(login_choose_type_panel,"login_choose_type")
				login_choose_type_panel["m_componentTable"]["lct_choose_type_title"]:setString("選擇綁定方式")
				-- facebook按钮
				local facebookBtnOnClick = function()
					send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
					send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_FACEBOOK)
					g_game.g_panelManager:removeUiPanel("login_choose_type")
				end
				login_choose_type_panel["m_componentTable"]["lct_facebook_btn"]:addHandleOfcomponentEvent(facebookBtnOnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
				
				-- google按钮
				local googleBtnOnClick = function()
					send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
					send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_GOOGLE)
					g_game.g_panelManager:removeUiPanel("login_choose_type")
				end
				login_choose_type_panel["m_componentTable"]["lct_google_btn"]:addHandleOfcomponentEvent(googleBtnOnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			end
			-- local tmpData = {}
			-- tmpData["result"] = 0
			-- tmpData["account"] = "dawjdwjdadlkawjdddd"
			-- tmpData["userid"] = g_game.g_userInfoManager:getUserAccount()
			-- self:bindAccountCallBack(tmpData)
	 	end
	 	self.m_componentTable["fastlogin_button"]:addHandleOfcomponentEvent(showBindPanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		

	    local function bindCallBack( paramTable )
	    	local function delayLoginCallback (  )
	    		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	    		self:bindAccountCallBack(paramTable)
	    	end
	    	g_game.g_scheduler.performWithDelayGlobal(delayLoginCallback, 1.0)
	    	
	    end
	    g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CALLBACK, bindCallBack)

	    local function bindAccountSuccess(  )
	    	self:bindSuccess()
		end
		g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_SDK_BIND_ACCOUNT, bindAccountSuccess)
	end
 	
end

-- 帐号绑定返回
function f_game_settings:bindAccountCallBack( paramTable )
	
	if paramTable["result"] == 0 then
		self.m_user_account = paramTable["account"]		
		self.m_user_uuid = paramTable["userid"]	
		-- self:setLoginAccount(self.m_user_account, self.m_user_uuid)
		local dataT = {}
		dataT["account"] = paramTable["account"]
		dataT["channel"] = DEBUG_SDK_TYPE
		dataT["id"] 	 = paramTable["userid"]
		self.tmpAccount = paramTable
		g_game.g_netManager:send_message(g_network_message_type.CS_BIND_ACCOUNT, dataT)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)

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
end
--  綁定成功更新本地數據
function f_game_settings:bindSuccess(  )
	local account = self.tmpAccount["account"]
	g_game.g_dataManager:saveUserInfo(account)
	g_game.g_userInfoManager:saveUserAccount(account)
end

function f_game_settings:setSound()
	g_game.g_utilManager:setUserSettings()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_settings] setSettingFlag
-------------------------------------------------------------------------------
function f_game_settings:setSettingFlag()
	if self.m_musicFlag == 1 then
		self.m_componentTable["btn_music"]:setImage("batch_ui/setting_on.png")
	else
		self.m_componentTable["btn_music"]:setImage("batch_ui/setting_off.png")
	end
	
	if self.m_effectFlag == 1 then
		self.m_componentTable["btn_effect"]:setImage("batch_ui/setting_on.png")
	else
		self.m_componentTable["btn_effect"]:setImage("batch_ui/setting_off.png")
	end
end


