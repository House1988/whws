
require("prescripts.framework.init")


-- define update global module
g_resource = {}
--定义touch event
g_resource.g_f_touch_event = {}
g_resource.g_f_touch_event.F_TOUCH_DOWN                 = 1
g_resource.g_f_touch_event.F_TOUCH_DRAG_INSIDE          = 2
g_resource.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE         = 4
g_resource.g_f_touch_event.F_TOUCH_DRAG_ENTER           = 8
g_resource.g_f_touch_event.F_TOUCH_DRAG_EXIT            = 16
g_resource.g_f_touch_event.F_TOUCH_UPINSIDE             = 32
g_resource.g_f_touch_event.F_TOUCH_UPOUTSIDE            = 64
g_resource.g_f_touch_event.F_TOUCH_CANCEL               = 128
g_resource.g_f_touch_event.F_TOUCH_CHANGED              = 256


g_resource.g_display = require("prescripts.framework.display")
g_resource.g_system = require("prescripts.system.f_system_interface").new()
g_resource.g_resource_update_manager = require("prescripts.f_resource_update_manager").new()
g_resource.g_app_version_manager = require("prescripts.common.f_pre_version_update").new()
g_resource.g_director = cc.Director:getInstance()

local size = fc.FUtilManager:getInstance():getDeviceScreenSize()	
local scale = cc.Director:getInstance():getContentScaleFactor()
g_resource.g_real_size = cc.size(size.width/scale, size.height/scale)
	

function g_resource.startup()	
 	 cc.Director:getInstance():runWithScene(require("prescripts.f_resource_scene").new())
end


function g_resource.getUiResource(resourceId)
	if device.platform == "android" then 
		if resourceId == "paihangbangbeijing" then
			return "android_map/ui/" .. resourceId .. ".png"
		else
			return "android_map/ui/" .. resourceId .. ".pkm"
		end
	elseif device.platform == "ios" then
		return "ios_map/ui/" .. resourceId .. ".pvr"
	elseif device.platform == "mac" or device.platform == "windows" then  
		if resourceId == "paihangbangbeijing" then
			return "win32_map/ui/" .. resourceId .. ".png"
		else
			return "win32_map/ui/" .. resourceId .. ".png"
		end
	end
	return ""
end