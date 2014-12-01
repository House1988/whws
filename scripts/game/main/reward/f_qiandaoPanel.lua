require("scripts.auto.auto_qiandaoPanel")

--[[--
奖励面板
--]]--


f_qiandaoPanel = class("f_qiandaoPanel")
f_qiandaoPanel.__index = f_qiandaoPanel

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_qiandaoPanel.static_create()
	local rewardTable = createqiandaoPanel()
	local reward = rewardTable["qiandaoPanel"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_qiandaoPanel)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_qiandaoPanel:panelInitBeforePopup(data)
	self:registerNodeEvent()
	
	self.m_data = data
	self.m_icons = {}
	
	local x = 165
	local xstep = 77
	local ystep = 75
	local y = 222
	local col = 0
	for i = 1, 20 do
		local icon = fc.FExtensionsImage:create()
	    icon:setImage("batch_ui/qianzibiao.png")
	    icon:setSize(cc.size(41,41))
	    icon:setAnchorPoint(cc.p(0.5,0.5))
	    self:appendComponent(icon)
	    icon:setPositionInContainer(cc.p(x, y))
	    table.insert(self.m_icons, icon)
	    col = col + 1
	    x = x + xstep
	    if col == 4 then
	    	x = 165
	    	y = y + ystep
	    	col = 0
	    end
--	    icon:setVisible(false)
	end
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("qiandao_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["xiangqing_close_button"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local frame = self.m_componentTable["framer"]
	local p = frame:getPositionInContainer()
	self.m_page = fc.FContainerPage:create(2)
	self:appendComponent(self.m_page)
	self.m_page:setSize(cc.size(350, 420))
	self.m_page:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page:setPositionInContainer(p)
	self.m_page:setStopTouchEvent(true) 
	self.m_page:enableClipping(true)
	
	self.m_componentTable["title2"]:setString(data["money"] .. "元")
	
	self.m_page:setLocalZOrder(1)
	self.m_componentTable["framer"]:setLocalZOrder(2)
	
	local fillPage = function(pageIndex)
		self:fillPage(pageIndex)
	end
	self.m_page:registLoadPageCallback(fillPage)
	
	local day = g_game.g_userInfoManager.m_qiandaoDay
	
	day = math.ceil(day / 4)
	self.m_maxPage = 5
		
	self.m_page:setPageInfoAndIndex(20, 4, 1, 0, 0, 350, 105, day)
	self:refreshIcon()
	
	self.onClaim = function()
		self:refreshIcon()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CLIAM_QIANDAO, self.onClaim)
end

function f_qiandaoPanel:refreshIcon()
	local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	local rewardMask = bitCal:d2b(g_game.g_userInfoManager.m_qiandaoMask)
	for i = 1, 20 do
		self.m_icons[i]:setVisible(rewardMask[i] == 1)
	end
end

function f_qiandaoPanel:fillPage(pageIndex)
	if pageIndex < 1 or pageIndex > self.m_maxPage then
		return
	end
	
	if not self.m_page:needLoadPage(pageIndex) then
		return
	end
	local i = (pageIndex - 1) * 4 + 1
	local e = i + 3
	local day = g_game.g_userInfoManager.m_qiandaoDay

	local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	local rewardMask = bitCal:d2b(g_game.g_userInfoManager.m_qiandaoMask)
	for i = i, e do
		local item = require("scripts.game.main.reward.f_qiandaoItem").new()
		if i < day then
			if rewardMask[i] == 1 then
				item:setData(i, 1)
			else
				item:setData(i, 2)
			end
		elseif i == day then
			if self.m_data["money"] > 0 then
				item:setData(i, 4)
			else
				if rewardMask[i] == 1 then
					item:setData(i, 1)
				else
					item:setData(i, 2)
				end
			end
		else
			item:setData(i, 3)
		end
		self.m_page:addComponentToPage(item, pageIndex)		
	end
end

--------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] registerNodeEvent
--------------------------------------------------------------
function f_qiandaoPanel:registerNodeEvent(handler)
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
-- @function [parent=#f_qiandaoPanel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_qiandaoPanel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] onEnter
-------------------------------------------------------------------------------
function f_qiandaoPanel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] onExit
-------------------------------------------------------------------------------
function f_qiandaoPanel:onExit()
	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_CLIAM_QIANDAO, self.onClaim)

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_qiandaoPanel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_qiandaoPanel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] onCleanup
-------------------------------------------------------------------------------
function f_qiandaoPanel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoPanel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_qiandaoPanel:initAllComponent()

end
