require("scripts.auto.auto_vip_pac_detail")
require("scripts.game.main.shangcheng.f_vip_package_item")
--[[--
礼包详情
--]]--
f_vip_package_detail = class("f_vip_package_detail")
f_vip_package_detail.__index = f_vip_package_detail

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_vip_package_detail.static_create()
							 
	local soliderInfoTable = createvip_pac_detail()
	local soldierInfo = soliderInfoTable["vip_pac_detail"]

	local funTable = {}
	tolua.setpeer(soldierInfo, funTable)
	setmetatable(funTable, f_vip_package_detail)

	soldierInfo.m_componentTable = soliderInfoTable

	return soldierInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_vip_package_detail:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_upTable = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] registerNodeEvent
-------------------------------------------------------------------------------
function f_vip_package_detail:registerNodeEvent(handler)
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
-- @function [parent=#f_vip_package_detail] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_vip_package_detail:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] onEnter
-------------------------------------------------------------------------------
function f_vip_package_detail:onEnter()
	self:setStopTouchEvent(true)
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] setPacIndex
-------------------------------------------------------------------------------
function f_vip_package_detail:setPacIndex(index)
	local getVipRewardInfo = g_game.g_dictConfigManager:getVipRewardByViplv(index)
	
	self.m_upTable = fc.FContainerTable:create(2)
	self.m_upTable:setSize(cc.size(376,282))
	self.m_upTable:setTableInfo(2,3,0,10,104,140)
	self.m_componentTable["vip_pac_bottom"]:appendComponent(self.m_upTable)
	self.m_upTable:setStopTouchEvent(true)	
	self.m_upTable:enableClipping(true)
	self.m_upTable:setAnchorPoint(cc.p(0,1))
	self.m_upTable:setPositionInContainer(cc.p(93,90))
	
	for i = 1, #getVipRewardInfo do
		local item = f_vip_package_item.static_create()
	    item:panelInitBeforePopup()
		item:setData(getVipRewardInfo[i])
		
		self.m_upTable:appendComponent(item)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] onExit
-------------------------------------------------------------------------------
function f_vip_package_detail:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_vip_package_detail:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] onExitTransitionStart
-------------------------------------------------------------------------------
function f_vip_package_detail:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] onCleanup
-------------------------------------------------------------------------------
function f_vip_package_detail:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_detail] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_vip_package_detail:initAllComponent()
	local yes = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("vip_detail_pac")
	end
    self.m_componentTable["v_yes_btn"]:addHandleOfcomponentEvent(yes, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
 
end
