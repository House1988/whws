--[[--
   	ios版本，用于添加一系列notification通知
--]]--

local f_ios_notification = class("f_ios_notification", function()
    return fc.FNotificationManager:getInstance()
end)

function f_ios_notification:ctor()
	
	local enterBackGround = function()
		self:addNotification_12()
		self:addNotification_18()
		self:addNotification_21()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GAME_EVENT_ENTER_BACKGROUND, enterBackGround)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_notification] addNotification_12
-- 精力满的notification
-------------------------------------------------------------------------------
function f_ios_notification:addNotification_12()
	if LANGUAGE_TYPE == 3 then
		self:addNotificationFixedTime("啟稟皇上，5000石糧草已經運送到京城了，請皇上趕快派兵征討叛逆吧！", 1, "12:00:30")
	else
		self:addNotificationFixedTime("启禀皇上，5000石粮草已经运送到京城了，请皇上赶快派兵征讨叛逆吧！", 1, "12:00:30")
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_ios_notification] addNotification_21
-- 退出游戏48小时后，提示的notification
-------------------------------------------------------------------------------
function f_ios_notification:addNotification_21()
	if LANGUAGE_TYPE == 3 then
		self:addNotificationFixedTime("帝王戰馬上就要開始了！挑戰古代帝王，擊退名臣名將，贏取海量功績值！", 2, "20:55:00")
	else	
		self:addNotificationFixedTime("帝王战马上就要开始了！挑战古代帝王，击退名臣名将，赢取海量功绩值！", 2, "20:55:00")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_ios_notification] addNotification_18
-- 精力满的notification
-------------------------------------------------------------------------------
function f_ios_notification:addNotification_18()
	if LANGUAGE_TYPE == 3 then
		self:addNotificationFixedTime("啟稟皇上，5000石糧草已經運送到京城了，請皇上趕快派兵征討叛逆吧！", 3, "18:00:30")
	else
		self:addNotificationFixedTime("启禀皇上，5000石粮草已经运送到京城了，请皇上赶快派兵征讨叛逆吧！", 3, "18:00:30")
	end
end



return f_ios_notification