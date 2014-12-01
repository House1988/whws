
require("prescripts.config")
if DEBUG ~= 0 then
	require("prescripts.debugger")(nil, nil, nil)
end
print("===========================================================================")
CCLOG=print
CCLuaLog=print
function __G__TRACKBACK__(errorMessage)
    CCLOG("----------------------------------------")
    CCLOG("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    CCLOG(debug.traceback("", 2))
    CCLOG("----------------------------------------")
end

xpcall(function()
	require("prescripts.framework.init")
	if device.platform == "android" then
		local luaj = require("prescripts.framework.luaj")
		local ok
		ok,DEBUG_SDK_TYPE = luaj.callStaticMethod("org.cocos2dx.lua.UtilTool", "getSdkType", {}, "()I")
	end
	
	require("prescripts.f_resource_update")
	
	if DEBUG_ENABLE_DYN_UPDATE then
		g_resource.startup()
	else
		if device.platform == "ios" or device.platform == "android" then
			LuaLoadChunksFromZIP("scripts.zip")
		end		
		require("scripts.game")
   		g_game.startup()
	end
end, __G__TRACKBACK__)
