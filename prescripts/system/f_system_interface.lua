--[[--
    system interface，用于统一接口获取不同平台信息
--]]--

local f_system_interface = class("f_system_interface")
f_system_interface.__index = f_system_interface

-------------------------------------------------
-- @function [parent=#f_system_interface] ctor
-------------------------------------------------
function f_system_interface:ctor()	
	self.m_platform = device.platform
	
	if self.m_platform == "android" then
		self.m_luaj = require("prescripts.framework.luaj")
	end
end


-------------------------------------------------
-- @function [parent=#f_system_interface] getUUID
-- 获取当前设备UUID
-------------------------------------------------
function f_system_interface:getUUID()	
	if self.m_platform == "ios" then
		if DEBUG_SDK_TYPE == 1 then
			
			local finalStr = ""
			local b = g_game.g_sdkManager:isIosVerAbove6()
			if b then
				finalStr = g_game.g_sdkManager:getIOSIdfa()
				
			else
				finalStr = g_game.g_sdkManager:getIosMacAddress()
			end
		
			if finalStr == "" then	
				return ccst.CCNative:getOpenUDID()
			end
			
			print ("final str",finalStr)
			return finalStr 
		else
			return ccst.CCNative:getOpenUDID()
		end
	elseif self.m_platform == "android" then			
		local ok, ret = self.m_luaj.callStaticMethod("org/cocos2dx/lua/UtilTool", "getAndroidUUID", {}, "()Ljava/lang/String;")
		return ret
	else
		return "uuid"
	end
end

-------------------------------------------------
-- @function [parent=#f_system_interface] openURL
-- 使用当前系统浏览器打开URL
-------------------------------------------------
function f_system_interface:openURL(url)	
	if self.m_platform == "ios" then
		ccst.CCNative:openURL(url)
	elseif self.m_platform == "android" then
	
	else
		
	end
end	


-------------------------------------------------
-- @function [parent=#f_system_interface] openUpdate
-- 开启更新模块
-------------------------------------------------
function f_system_interface:openUpdate(url, saveName)
	if self.m_platform == "ios" then
	elseif self.m_platform == "android" then
		self.m_luaj.callStaticMethod("org/cocos2dx/lua/UtilTool", "openAppUpdate", {url, saveName}, "(Ljava/lang/String;Ljava/lang/String;)V")
	else
		
	end
end

-------------------------------------------------
-- @function [parent=#f_system_interface] checkNetWorkState
-- 检查网络状态
-------------------------------------------------
function f_system_interface:checkNetWorkState()		
	if self.m_platform == "ios" then
		return ccst.CCNative:getNetState() ~= 0
	elseif self.m_platform == "android" then			
		local ok, ret = self.m_luaj.callStaticMethod("org/cocos2dx/lua/UtilTool", "isConnectingToInternet", {}, "()I")
		return ret ~= 0
	else
		return true
	end
end

return f_system_interface