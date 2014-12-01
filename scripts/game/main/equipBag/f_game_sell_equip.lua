require("scripts.auto.auto_sellPopup")
--[[--
     装备详情界面
--]]--
f_game_sell_equip = class("f_game_sell_equip")
f_game_sell_equip.__index = f_game_sell_equip

-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_sell_equip.static_create()
	local userEquip_table = createsellPopup()
	local userEquip_panel = userEquip_table["sellPopup"]
	
	local funTable = {}
	tolua.setpeer(userEquip_panel, funTable)
	setmetatable(funTable, f_game_sell_equip)
	
	userEquip_panel.m_componentTable = userEquip_table
	   
	return userEquip_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_sell_equip:panelInitBeforePopup(name, price, okCallback)
	self:registerNodeEvent()	
	self.m_componentTable["label"]:setString("出售 ".. name .. " 可获得")
	self.m_componentTable["number"]:setColor(cc.c3b(139,255,240))
	self.m_componentTable["number"]:setString("" .. price)
	self.m_callBack = okCallback
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("sell_popup")
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local confirm = function()
		self.m_callBack()
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(confirm,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end



-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_sell_equip:registerNodeEvent(handler)
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
-- @function [parent=#f_game_sell_equip] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_sell_equip:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] onEnter
-------------------------------------------------------------------------------
function f_game_sell_equip:onEnter()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] onExit
-------------------------------------------------------------------------------
function f_game_sell_equip:onExit()  
	
  	self:unregisterNodeEvent()
  	self.m_callBack = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_sell_equip:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_sell_equip:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_sell_equip] onCleanup
-------------------------------------------------------------------------------
function f_game_sell_equip:onCleanup()
end


