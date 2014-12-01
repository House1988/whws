require("scripts.auto.auto_gonggao")
--[[--
公告面板
--]]--

f_gonggao_panel = class("f_gonggao_panel")
f_gonggao_panel.__index = f_gonggao_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_gonggao_panel.static_create()
	local gonggaoTable = creategonggao()
	local gonggao = gonggaoTable["gonggao"]

	local funTable = {}
	tolua.setpeer(gonggao, funTable)
	setmetatable(funTable, f_gonggao_panel)

	gonggao.m_componentTable = gonggaoTable

	return gonggao
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_gonggao_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_dataList = g_game.g_userInfoManager.m_gonggaoList
	self.list = self.m_componentTable["sideList"]
	self.list:enableClipping(true)
	self.list:setStopTouchEvent(false)

	self.list:setListInfo(5, 2, 0, 200, 70)
	
	self:fillList()

	
	local close = function()
		g_game.g_panelManager:removeUiPanel("gonggao_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_gonggao_panel:fillList()
	self.m_items = {}
	local callback = function(index)
		for i = 1, #self.m_dataList do
			self.m_items[i]:setSelect(self.m_items[i].m_index == index)
		end
		local data = self.m_dataList[index]
		self:setDisplay(data["title"], g_game.g_utilManager:getEncodeString(data["content"], g_game.g_f_text_default_color))
		
	end

	for i = 1, #g_game.g_userInfoManager.m_gonggaoList do
		local item = require("scripts.game.main.gonggao.f_gonggao_item_panel").new()
		item:setData(self.m_dataList[i])
		item:setIndex(i)
		item:setItemSelectClick(callback)
		table.insert(self.m_items, item)
		self.list:appendComponent(item)		
	end
	
	self.m_items[1]:setSelect(true)
	local data = self.m_dataList[1]
	self:setDisplay(data["title"], g_game.g_utilManager:getEncodeString(data["content"], g_game.g_f_text_default_color))
end

function f_gonggao_panel:setDisplay(title, comStr)
	local call = function()
	end
	self.m_componentTable["titleLabel"]:setString(title)
	
	self.m_text = nil
	if self.m_textList ~= nil then
		self:deleteComponent(self.m_textList)
	end

	self.m_textList = fc.FContainerList:create(1)
    self.m_textList:setSize(cc.size(420,240))
    self.m_textList:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(self.m_textList)
    self.m_textList:setPositionInContainer(cc.p(579,390))
    self.m_textList:enableClipping(true)
	

	self.m_text = fc.FLabel:createBMFont()
  	self.m_text:setColor(cc.c3b(255,255,0))
  	self.m_text:setFontSize(21)
	self.m_text:setAnchorPoint(cc.p(0.5,0.5))
	self.m_text:setAlignment(0)
	self.m_text:setVAlignment(0)
	self.m_text:setComplexString(comStr, call)
	
	local size = self.m_text:getLabelTextSize()
	self.m_text:setSize(cc.size(420, size.height))

	self.m_textList:setListInfo(1, 0, 0, 420, size.height)
	self.m_textList:appendComponent(self.m_text)	
	
end

function f_gonggao_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_gonggao_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_gonggao_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] onEnter
-------------------------------------------------------------------------------
function f_gonggao_panel:onEnter()


	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] onExit
-------------------------------------------------------------------------------
function f_gonggao_panel:onExit()
	self:unregisterNodeEvent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_gonggao_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_gonggao_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] onCleanup
-------------------------------------------------------------------------------
function f_gonggao_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_gonggao_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_gonggao_panel:initAllComponent()

end