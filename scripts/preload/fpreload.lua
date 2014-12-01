require("scripts.netdefine.message_type")
require("scripts.common.f_define")


g_game.g_director = cc.Director:getInstance()

g_game.g_display = require("prescripts.framework.display")
g_game.g_scheduler = require("prescripts.framework.scheduler")
g_game.g_transition = require("prescripts.framework.transition")
g_game.g_system = require("prescripts.system.f_system_interface").new()
g_game.g_panelManager = require("scripts.manager.fluapanelmanager").new()
g_game.g_dataManager = require("scripts.game.data.f_data_manager").new()

g_game.g_resourceManager = require("scripts.manager.fluaresourcemanager").new()
g_game.g_netManager = require("scripts.manager.fluanetservicemanager").new()
g_game.g_dictConfigManager = require("scripts.game.data.f_dict_config_manager").new()
g_game.g_gameManager = require("scripts.manager.fluagamemanager").new()
g_game.g_classFactory = require("scripts.core.fclassfactory")
g_game.g_eventManager = require("scripts.manager.f_event_manager").new()
g_game.g_audioManager = require("scripts.manager.f_lua_audio_manager").new()
g_game.g_userInfoManager = require("scripts.game.data.f_user_info_manager").new()
g_game.g_guidelinesManager = require("scripts.manager.f_guidelines_manager").new()
g_game.g_secondGuidelinesManager = require("scripts.manager.f_second_guidelines_manager").new()
g_game.g_utilManager = require("scripts.manager.fluautilmanager").new()
g_game.g_recoverManager = require("scripts.game.data.f_recover_manager").new()
    	
g_game.g_iap_manager = nil

if device.platform == "android" then
    g_game.g_luaj = require("prescripts.framework.luaj")
    
    g_game.g_data_eye_manager = require("scripts.manager.f_data_eye_manager_android").new()
    
	g_game.g_notificationManager = require("scripts.notification.android.f_android_notification").new()
	
	if DEBUG_SDK_TYPE == 50 then
		g_game.g_sdkManager = require("scripts.sdk.f_win32_simulator_sdk").new()
    elseif DEBUG_SDK_TYPE == 20 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_cmge_sdk").new()
    elseif DEBUG_SDK_TYPE == 21 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_360_sdk").new()
    elseif DEBUG_SDK_TYPE == 22 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_91_sdk").new()
    elseif DEBUG_SDK_TYPE == 23 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_wdj_sdk").new()
    elseif DEBUG_SDK_TYPE == 24 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_duoku_sdk").new()
    elseif DEBUG_SDK_TYPE == 25 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_mi_sdk").new()
    elseif DEBUG_SDK_TYPE == 26 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_uc_sdk").new()
    elseif DEBUG_SDK_TYPE == 27 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_anzhi_sdk").new()
    elseif DEBUG_SDK_TYPE == 28 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_lenovo_sdk").new()
    elseif DEBUG_SDK_TYPE == 29 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_oppo_sdk").new()
    elseif DEBUG_SDK_TYPE == 30 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_dangle_sdk").new()
    elseif DEBUG_SDK_TYPE == 31 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_vivo_sdk").new()
    elseif DEBUG_SDK_TYPE == 32 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_huawei_sdk").new()
    elseif DEBUG_SDK_TYPE == 33 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_youku_sdk").new()
	elseif DEBUG_SDK_TYPE == 35 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_meizu_sdk").new()
    elseif DEBUG_SDK_TYPE == 38 then
		g_game.g_f_month_card_info = {["iap"] = {["productIdentifier"] = "bbjc_auer_mouth01"},
											  	["info"] = {["discount"] = 300,
															["gold"] = 1,
															["productName"] = "月卡",
															["id"] = 7,
															["isDiscount"] = 0,
															["itemKey"] = "bbjc_auer_mouth01",
															["price"] = 300}}
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_tw_google_sdk").new()
    elseif DEBUG_SDK_TYPE == 39 then
    	g_game.g_sdkManager = require("scripts.sdk.android.f_android_tw_mycard_sdk").new()
    end
	g_game.g_notificationManager = require("scripts.notification.f_win32_notification").new()
    
elseif device.platform == "ios" then
	if DEBUG_DEVICE_IOS_JAILBREAKING then
    	g_game.g_data_eye_manager = require("scripts.manager.f_data_eye_manager").new()
	else
		if DEBUG_SDK_TYPE == 1 then
			g_game.g_data_eye_manager = require("scripts.manager.f_talking_data_manager").new()
		elseif DEBUG_SDK_TYPE == 14 then
			g_game.g_data_eye_manager = require("scripts.manager.f_taiwan_data_manager").new()
		end
	end
	
	g_game.g_notificationManager = require("scripts.notification.ios.f_ios_notification").new()
    
    if DEBUG_SDK_TYPE == 50 then
		g_game.g_sdkManager = require("scripts.sdk.f_win32_simulator_sdk").new()
    elseif DEBUG_SDK_TYPE == 1 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_cmge_sdk").new()
		
		g_game.g_f_month_card_info["iap"]["productIdentifier"] = "com.cmge.wuhuangwansui.iap.008"
		g_game.g_f_month_card_info["info"]["itemKey"] = "com.cmge.wuhuangwansui.iap.008"
	elseif DEBUG_SDK_TYPE == 14 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_taiwan_sdk").new()
		
		g_game.g_f_month_card_info["iap"]["productIdentifier"] = "bbjc_auer_mouth01"
		g_game.g_f_month_card_info["info"]["itemKey"] = "bbjc_auer_mouth01"
		g_game.g_f_month_card_info["info"]["discount"] = 300
		g_game.g_f_month_card_info["info"]["gold"] = 500
		g_game.g_f_month_card_info["info"]["price"] = 300
    elseif DEBUG_SDK_TYPE == 2 then
--		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_cmge_yueyu_sdk").new()
    elseif DEBUG_SDK_TYPE == 3 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_91_sdk").new()
    elseif DEBUG_SDK_TYPE == 4 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_cmge_yueyu_sdk").new()
    elseif DEBUG_SDK_TYPE == 5 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_cmge_yueyu_sdk").new()
    elseif DEBUG_SDK_TYPE == 6 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_pp_sdk").new()
    elseif DEBUG_SDK_TYPE == 7 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_itools_sdk").new()
    elseif DEBUG_SDK_TYPE == 8 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_ky_sdk").new()
    elseif DEBUG_SDK_TYPE == 9 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_tbt_sdk").new()
    elseif DEBUG_SDK_TYPE == 10 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_cmge_yueyu_sdk").new()
    elseif DEBUG_SDK_TYPE == 11 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_as_sdk").new()
	elseif DEBUG_SDK_TYPE == 12 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_cmge_haima").new()
	elseif DEBUG_SDK_TYPE == 13 then
		g_game.g_sdkManager = require("scripts.sdk.ios.f_ios_xy_sdk").new()
    end
    
elseif device.platform == "windows" or device.platform == "mac" then   
	g_game.g_sdkManager = require("scripts.sdk.f_win32_simulator_sdk").new()
	g_game.g_notificationManager = require("scripts.notification.f_win32_notification").new()
end
