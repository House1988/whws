require("scripts.auto.auto_CanyeLueduo")
--[[--
邮件面板
--]]--

f_lueduo_panel = class("f_lueduo_panel")
f_lueduo_panel.__index = f_lueduo_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_lueduo_panel.static_create()
	local mailTable = createCanyeLueduo()
	local mail = mailTable["CanyeLueduo"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_lueduo_panel)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_lueduo_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_componentTable["disBtn"]:setButtonState(8)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("lueduo_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local change = function()
		g_game.g_userInfoManager:showLueduo(true, nil)
	end
	self.m_componentTable["changeBtn"]:addHandleOfcomponentEvent(change,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	self.event_updateUserMilitary = function()
		self:updateUserMilitary()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO,self.event_updateUserMilitary)
	
	self.m_countDown = function()
		self:updateBtn()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_LUEDUO_COUNT_DOWN,self.m_countDown)
	
	self.m_datas = {}
	self:updateBtn()
	self.m_componentArr = {}
	
	self.m_liangcaoAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_liangcaoAnim:setup(self.m_componentTable["junLingValue"], 21, "%d", false, false)
	self.m_componentTable["CanyeLueduo"]:appendComponent(self.m_liangcaoAnim)
	local p = self.m_componentTable["junLingValue"]:getPositionInContainer()
	self.m_liangcaoAnim:setPositionInContainer(p)
	self.m_liangcaoAnim:setLastValue(g_game.g_userInfoManager.m_user_info["military"])
end

function f_lueduo_panel:updateBtn()
	local time = g_game.g_recoverManager:getLueduoBtnCD()
	if time > 0 then
		self.m_componentTable["disBtn"]:setVisible(true)
		self.m_componentTable["disLabel"]:setVisible(true)
		self.m_componentTable["disLabel"]:setString("" .. time)
		self.m_componentTable["changeBtn"]:setVisible(false)
	else
		self.m_componentTable["disBtn"]:setVisible(false)
		self.m_componentTable["disLabel"]:setVisible(false)
		self.m_componentTable["changeBtn"]:setVisible(true)
	end
end

function f_lueduo_panel:btnCd()
	g_game.g_recoverManager:setLueduoBtnCD()
	self:updateBtn()
end

function f_lueduo_panel:updateDisplay()
	if self.m_list ~= nil then
		self:deleteComponent(self.m_list)
	end
	self.m_componentArr = {}
	
	self.m_list = fc.FContainerList:create(1) -- 1 is ver list
	self.m_list:setSize(cc.size(850,500))
	
	self.m_list:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_list:enableClipping(true)
	self:appendComponent(self.m_list)
	self.m_list:setPositionInContainer(cc.p(480, 320))

	self.m_list:setListInfo(4, 5, 0, 850, 140)
	
	self.m_componentTable["junLingValue"]:setString( g_game.g_userInfoManager.m_user_info["military"])

	self:fillList()
end

function f_lueduo_panel:updateUserMilitary()
	self.m_componentTable["junLingValue"]:setString( g_game.g_userInfoManager.m_user_info["military"])
	self.m_liangcaoAnim:playWhenLarger(g_game.g_userInfoManager.m_user_info["military"], 0.8)
end

function f_lueduo_panel:setData(list)
	self.m_datas = list
	self:updateDisplay()
end

function f_lueduo_panel:fillList()
	for i = 1, #self.m_datas do
		local item = require("scripts.game.main.bingfa.f_lueduo_item").new()
		item:setData(self.m_datas[i])
		self.m_list:appendComponent(item)
		table.insert(self.m_componentArr,item)
	end
end

function f_lueduo_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_lueduo_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_lueduo_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] onEnter
-------------------------------------------------------------------------------
function f_lueduo_panel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] onExit
-------------------------------------------------------------------------------
function f_lueduo_panel:onExit()
	self:unregisterNodeEvent()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO,self.event_updateUserMilitary)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_LUEDUO_COUNT_DOWN,self.m_countDown)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_lueduo_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_lueduo_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] onCleanup
-------------------------------------------------------------------------------
function f_lueduo_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lueduo_panel:initAllComponent()

end