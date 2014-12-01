require("scripts.auto.auto_card_lvup_popup")

f_card_lv_up_popup = class("f_card_lv_up_popup")
f_card_lv_up_popup.__index = f_card_lv_up_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_lv_up_popup.static_create()
							 
	local infoTable = createcard_lvup_popup()
	local info = infoTable["card_lvup_popup"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_card_lv_up_popup)

	info.m_componentTable = infoTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_lv_up_popup:panelInitBeforePopup()
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_lv_up_popup:registerNodeEvent(handler)
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
-- @function [parent=#f_card_lv_up_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_lv_up_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] onEnter
-------------------------------------------------------------------------------
function f_card_lv_up_popup:onEnter()
	self:setStopTouchEvent(true)
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] onExit
-------------------------------------------------------------------------------
function f_card_lv_up_popup:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_lv_up_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_lv_up_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] onCleanup
-------------------------------------------------------------------------------
function f_card_lv_up_popup:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_lv_up_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_lv_up_popup:initAllComponent()
    
end


