--[[--
   	windows版本，用于添加一系列notification通知
--]]--

local f_win32_notification = class("f_win32_notification", function()
    return fc.FNotificationManager:getInstance()
end)

function f_win32_notification:ctor()

end




return f_win32_notification