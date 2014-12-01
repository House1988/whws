--[[--
   	android版本，用于添加一系列notification通知
--]]--

local f_android_notification = class("f_android_notification")
f_android_notification.__index = f_android_notification

function f_android_notification:ctor()
	self:addNotification_12()
	self:addNotification_18()
	self:addNotification_21()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_android_notification] addNotification_12
-- 12时的提示notification
-------------------------------------------------------------------------------
function f_android_notification:addNotification_12()
	if LANGUAGE_TYPE == 3 then
		local paraTable = {
		"啟稟皇上，5000石糧草已經運送到京城了，請皇上趕快派兵征討叛逆吧！",
		1,
		"12:00:30"
		}
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "addBroadcastReceiver", paraTable, "(Ljava/lang/String;ILjava/lang/String;)V")
	else
		local paraTable = {
			"启禀皇上，5000石粮草已经运送到京城了，请皇上赶快派兵征讨叛逆吧！",
			1,
			"12:00:30"
		}
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "addBroadcastReceiver", paraTable, "(Ljava/lang/String;ILjava/lang/String;)V")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_notification] addNotification_21
-- 21时的提示notification
-------------------------------------------------------------------------------
function f_android_notification:addNotification_21()
	if LANGUAGE_TYPE == 3 then
	
		local paraTable = {
			"帝王戰馬上就要開始了！挑戰古代帝王，擊退名臣名將，贏取海量功績值！",
			2,
			"20:55:00"
		}
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "addBroadcastReceiver", paraTable, "(Ljava/lang/String;ILjava/lang/String;)V")
		
	else
		local paraTable = {
			"帝王战马上就要开始了！挑战古代帝王，击退名臣名将，赢取海量功绩值！",
			2,
			"20:55:00"
		}
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "addBroadcastReceiver", paraTable, "(Ljava/lang/String;ILjava/lang/String;)V")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_android_notification] addNotification_18
-- 18时的提示notification
-------------------------------------------------------------------------------
function f_android_notification:addNotification_18()
	if LANGUAGE_TYPE == 3 then
		local paraTable = {
		"啟稟皇上，5000石糧草已經運送到京城了，請皇上趕快派兵征討叛逆吧！",
		3,
		"18:00:30"
		}
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "addBroadcastReceiver", paraTable, "(Ljava/lang/String;ILjava/lang/String;)V")
		
	else
		local paraTable = {
		"启禀皇上，5000石粮草已经运送到京城了，请皇上赶快派兵征讨叛逆吧！",
		3,
		"18:00:30"
		}
		g_game.g_luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "addBroadcastReceiver", paraTable, "(Ljava/lang/String;ILjava/lang/String;)V")
		
	end
end


return f_android_notification
