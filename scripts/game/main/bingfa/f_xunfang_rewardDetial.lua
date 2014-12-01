require("scripts.auto.auto_xunfangRewardDetial")
require("scripts.auto.auto_xunfangRewardDetialItem")
--[[--
邮件面板
--]]--

f_xunfang_rewardDetial = class("f_xunfang_rewardDetial")
f_xunfang_rewardDetial.__index = f_xunfang_rewardDetial

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial.static_create()
	local mailTable = createxunfangRewardDetial()
	local mail = mailTable["xunfangRewardDetial"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_xunfang_rewardDetial)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:panelInitBeforePopup(datas)
	self:registerNodeEvent()

	local close = function()
		g_game.g_panelManager:removeUiPanel("xunfang_reward_detial")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnqueding"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self.m_dataList = datas
	
	local xstart = 335
	local x = xstart
	local y = 125
	local j = 0
	local xstep = 35
	local ystep = 25
	if #self.m_dataList > 9 then
		y = 87
		ystep = -4
	end
	for i = 1, #self.m_dataList do
		j = j + 1
		local itemT = createxunfangRewardDetialItem()
		local item = itemT["xunfangRewardDetialItem"] 
		item:setSize(cc.size(75,110))
	    item:setAnchorPoint(cc.p(0,1))
	    self:appendComponent(item)
	    item:setPositionInContainer(cc.p(x,y))
		itemT["image"]:setImage("xunfang/" .. self.m_dataList[i]["image"] .. ".png")
		itemT["image"]:setSize(cc.size(65, 65))
		itemT["name"]:setString(self.m_dataList[i]["name"])
		itemT["frame"]:setImage(g_game.g_f_quality_image[self.m_dataList[i]["star"]])
		itemT["frame"]:setSize(cc.size(75, 75))
		x = x + 75 + xstep
		if j == 3 then
			j = 0
			x = xstart
			y = y + 110 + ystep
		end
	end
end

function f_xunfang_rewardDetial:registerNodeEvent(handler)
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
-- @function [parent=#f_xunfang_rewardDetial] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] onEnter
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:onEnter()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] onExit
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] onExitTransitionStart
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_rewardDetial] onCleanup
-------------------------------------------------------------------------------
function f_xunfang_rewardDetial:onCleanup()
end
