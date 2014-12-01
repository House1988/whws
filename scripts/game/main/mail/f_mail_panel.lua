require("scripts.auto.auto_xitongMail")
--[[--
邮件面板
--]]--

f_mail_panel = class("f_mail_panel")
f_mail_panel.__index = f_mail_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_mail_panel.static_create()
	local mailTable = createxitongMail()
	local mail = mailTable["xitongMail"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_mail_panel)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] computeMaxPage
-------------------------------------------------------------------------------
function f_mail_panel:computeMaxPage(mailCount)
	self.m_maxPage[self.m_type] = math.max(1, math.ceil(mailCount / 4)) 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_mail_panel:panelInitBeforePopup(page, pageIndex)
	self.TYPE_XITONG = 1
	self.TYPE_PVP = 2
		
	self.m_type = page;
	self.m_radioBtns = {self.m_componentTable["xitongBtn"], self.m_componentTable["pvpBtn"]}
	
	self:registerNodeEvent()
	self.m_items = {}
	self.m_currentPage = {}
	self.m_totalNum = {}
	self.m_maxPage = {}
	
	self.receiveMail = function()
		self:computeMaxPage(g_game.g_userInfoManager.m_mailCount)
		self.m_currentPage[self.m_type] = g_game.g_userInfoManager.m_mailPage
		self:fillList()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_RECEIVE_MAIL, self.receiveMail)

	self.m_currentPage[self.m_type] = pageIndex
	self:changePage(page)
	self.m_componentTable["titleText"]:setString("")
	

	local click1 = function()
		self.m_type = self.TYPE_XITONG
		self:changePage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["xitongBtn"]:addHandleOfcomponentEvent(click1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click2 = function()
		self.m_type = self.TYPE_PVP
		self:changePage()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_componentTable["pvpBtn"]:addHandleOfcomponentEvent(click2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

--	self.m_dataList = g_game.g_userInfoManager.m_mailList
--	self.list = fc.FContainerPage:create(1)
--	self.list:enableClipping(true)
--	self.list:setStopTouchEvent(false)
--	self:appendComponent(self.list)
--	self.list:setSize(cc.size(800, 500))
--	self.list:setAnchorPoint(cc.p(0.5,0.5))
--	self.list:setPositionInContainer(cc.p(480, 320))
--	self.list:setPageInfo(1, 1, 1, 0, 0, 800, 500)

	local close = function()
		g_game.g_panelManager:removeUiPanel("mail_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local clickArrowL = function()
		self.m_currentPage[self.m_type] = g_game.g_userInfoManager.m_mailPage - 1
		if self.m_currentPage[self.m_type] >= 1 then
			g_game.g_userInfoManager:requestMail(self.m_currentPage[self.m_type], self.m_type)
		else
			self.m_currentPage[self.m_type] = g_game.g_userInfoManager.m_mailPage
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	local clickArrowR = function()
		self.m_currentPage[self.m_type] = g_game.g_userInfoManager.m_mailPage + 1
		if self.m_currentPage[self.m_type] <= self.m_maxPage[self.m_type] then
			g_game.g_userInfoManager:requestMail(self.m_currentPage[self.m_type], self.m_type)
		else
			self.m_currentPage[self.m_type] = g_game.g_userInfoManager.m_mailPage
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["arrowL"]:addHandleOfcomponentEvent(clickArrowL,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["arrowR"]:addHandleOfcomponentEvent(clickArrowR,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_mail_panel:changePage()
	g_game.g_userInfoManager.m_mailPage = self.m_currentPage[self.m_type]
	for k,v in pairs(self.m_items) do
		for i = 1, #v do
			v[i]:setVisible(k == self.m_type)
		end
	end
	if self.m_items[self.m_type] == nil then
		if self.m_currentPage[self.m_type] == nil then
			self.m_currentPage[self.m_type] = 1
		end
		g_game.g_userInfoManager:requestMail(self.m_currentPage[self.m_type], self.m_type)
	else
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["titleText"]:setString("郵件空間佔用" .. self.m_totalNum[self.m_type] .. "/50，請皇上定期清理")
		else
			self.m_componentTable["titleText"]:setString("邮件空间占用" .. self.m_totalNum[self.m_type] .. "/50，请皇上定期清理")
		end
		self.m_componentTable["downLabel"]:setString(self.m_currentPage[self.m_type] .. "/" .. self.m_maxPage[self.m_type])
	end

	for i = 1, #self.m_radioBtns do
		if i == self.m_type then
			self.m_radioBtns[i]:setRadioButtonState(1)
		else
			self.m_radioBtns[i]:setRadioButtonState(2)
		end
	end
end

function f_mail_panel:fillList()
	if self.m_items[self.m_type] ~= nil then
		for i = 1, #self.m_items[self.m_type] do
			self:deleteComponent(self.m_items[self.m_type][i])
		end
	end
	self.m_totalNum[self.m_type] = g_game.g_userInfoManager.m_mailCount
	
	if LANGUAGE_TYPE == 3 then 
		self.m_componentTable["titleText"]:setString("郵件空間佔用" .. self.m_totalNum[self.m_type] .. "/50，請皇上定期清理")
	else
		self.m_componentTable["titleText"]:setString("邮件空间占用" .. self.m_totalNum[self.m_type] .. "/50，请皇上定期清理")
	end
	self.m_items[self.m_type] = {}
	
	local start = 160
	for i = 1, #g_game.g_userInfoManager.m_mailList do
		local item = require("scripts.game.main.mail.f_mailpageItem").new()
		item:setData(g_game.g_userInfoManager.m_mailList[i], self.m_type)
		self:appendComponent(item)
		item:setAnchorPoint(cc.p(0.5, 0.5))
		item:setPositionInContainer(cc.p(480, start))
		start = start + 127
		table.insert(self.m_items[self.m_type], item)
	end

	self.m_componentTable["downLabel"]:setString(self.m_currentPage[self.m_type] .. "/" .. self.m_maxPage[self.m_type])

--	if self.m_page > g_game.g_userInfoManager.m_mailPage then
--		self.list:showNextPage()
--	elseif self.m_page < g_game.g_userInfoManager.m_mailPage then
--		self.list:showPrePage()
--	end
end

function f_mail_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_mail_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_mail_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] onEnter
-------------------------------------------------------------------------------
function f_mail_panel:onEnter()


	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] onExit
-------------------------------------------------------------------------------
function f_mail_panel:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_RECEIVE_MAIL, self.receiveMail)


	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_mail_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_mail_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] onCleanup
-------------------------------------------------------------------------------
function f_mail_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mail_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_mail_panel:initAllComponent()

end