require("scripts.auto.auto_leaderboard")
--[[--
邮件面板
--]]--

f_leaderboard_main = class("f_leaderboard_main")
f_leaderboard_main.__index = f_leaderboard_main

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_leaderboard_main.static_create()
	local mailTable = createleaderboard()
	local mail = mailTable["leaderboard"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_leaderboard_main)

	mail.m_componentTable = mailTable
	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_leaderboard_main:panelInitBeforePopup(pageIndex)
	
	self.m_pageIndex = 0
	self.m_radioBtns = {self.m_componentTable["btnPvplb"], self.m_componentTable["btnLevelRank"]}
	self.m_pages = {}	

	self:registerNodeEvent()
	

	local click1 = function()
		self:changePage(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["btnPvplb"]:addHandleOfcomponentEvent(click1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click2 = function()
		self:changePage(2)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["btnLevelRank"]:addHandleOfcomponentEvent(click2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local close = function()
		g_game.g_panelManager:removeUiPanel("leaderboard")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self:changePage(pageIndex)
end

function f_leaderboard_main:changePage(pageIndex)
	for i = 1, #self.m_radioBtns do
		if i == pageIndex then
			self.m_radioBtns[i]:setRadioButtonState(1)
		else
			self.m_radioBtns[i]:setRadioButtonState(2)
		end
	end
	if pageIndex ~= self.m_pageIndex then
		self.m_pageIndex = pageIndex
		for k, v in pairs(self.m_pages) do
			v:setVisible(false)
		end
		if self.m_pages[pageIndex] ~= nil then
			self.m_pages[pageIndex]:setVisible(true)
		else
			local panel = nil
			if self.m_pageIndex == 1 then
				panel = require("scripts.game.main.leaderboard.f_lb_pvp").new()
				panel:setSize(cc.size(960, 640))
				self.m_componentTable["leaderboard"]:appendComponent(panel)
				panel:setAnchorPoint(cc.p(0.5, 0.5))
				panel:setPositionInContainer(cc.p(480, 320))
				g_game.g_userInfoManager:requestPvpLeaderboard(1)
			elseif self.m_pageIndex == 2 then
				panel = require("scripts.game.main.leaderboard.f_lb_pvp").new()
				panel:setSize(cc.size(960, 640))
				self.m_componentTable["leaderboard"]:appendComponent(panel)
				panel:setAnchorPoint(cc.p(0.5, 0.5))
				panel:setPositionInContainer(cc.p(480, 320))
				g_game.g_userInfoManager:requestLevelRankLeaderboard(1)
			end
			self.m_pages[pageIndex] = panel
		end
	end
end

function f_leaderboard_main:updatePvpLeaderboard(data)
	if self.m_pages[1] ~= nil then
		self.m_pages[1]:setData(data)
	end
end

function f_leaderboard_main:updateLevelRankLeaderboard(data)
	if self.m_pages[2] ~= nil then
		self.m_pages[2]:setLevelData(data)
	end
end

function f_leaderboard_main:registerNodeEvent(handler)
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
-- @function [parent=#f_leaderboard_main] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_leaderboard_main:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] onEnter
-------------------------------------------------------------------------------
function f_leaderboard_main:onEnter()


	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] onExit
-------------------------------------------------------------------------------
function f_leaderboard_main:onExit()
	self:unregisterNodeEvent()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_leaderboard_main:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] onExitTransitionStart
-------------------------------------------------------------------------------
function f_leaderboard_main:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] onCleanup
-------------------------------------------------------------------------------
function f_leaderboard_main:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_leaderboard_main] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_leaderboard_main:initAllComponent()

end