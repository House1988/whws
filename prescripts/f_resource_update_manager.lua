--[[--
    resource update manager，用于动态资源更新
--]]--
local f_resource_update_manager = class("f_resource_update_manager", function()
    return fc.FDynUpdateManager:getInstance()
end)

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] ctor
-------------------------------------------------
function f_resource_update_manager:ctor()	
	self.m_game_manager = fc.FGameManager:getInstance()
	
	self.json   = require("prescripts.framework.json")
	
    local luaUpdate = function(dt)
        self:update(dt)
    end
    self.m_game_manager:registerGameUpdate(luaUpdate)
    
    --内部管理
    self.m_common_tips_panel = nil
    self.m_network_tips_panel = nil
    
	if DEBUG_SDK_TYPE == 3 then
	    --91 sdk
		self.m_is_need_wait_app_update_result = true
	end

	if DEBUG_SDK_TYPE == 11 then
	    --as sdk
		self.m_is_need_wait_app_update_result = true
	end
	if DEBUG_SDK_TYPE == 22 then
	    --91 android sdk
		self.m_is_need_wait_app_update_result = true
	end
    
    self.m_state_text_callback = nil
    self.m_state_pregress_callback = nil
    
    self.m_step_time = 0
    self.m_is_start_check = false
    
    self.m_need_update_app_info = {}
    self.m_need_update_pack_info = {}
    self.m_download_pack_rest_part_url = ""
    
    --更新进度
    self.m_current_update_progress_num = 0
    
    self.STATE_DOWNLOAD_VERSION_LIST	= 1
    self.STATE_NEED_UPDATE_APP			= 2
    self.STATE_DOWNLOAD_PACK_REST_PART	= 3
    self.STATE_DOWNLOAD_PACK_UPDATE		= 4
    self.STATE_UPDATE_DONE				= 5
    
    self.SUB_STATE_ENTER				= 1
    self.SUB_STATE_RUN					= 2
    self.SUB_STATE_EXIT					= 3
    
    self.m_state_function_table			= {}
    
    -- 下载补全包
    local downloadPackRestPart = function(dt)
    	self:downloadPackRestPart_state(dt)
    end    
    self.m_state_function_table[self.STATE_DOWNLOAD_PACK_REST_PART] = downloadPackRestPart
    
    local downloadVersionFunc = function(dt)
    	self:downloadVersionList_state(dt)
    end    
    self.m_state_function_table[self.STATE_DOWNLOAD_VERSION_LIST] = downloadVersionFunc
    
    
    local needUpdateAppFunc = function(dt)
    	self:needUpdateApp_state(dt)
    end    
    self.m_state_function_table[self.STATE_NEED_UPDATE_APP] = needUpdateAppFunc
    
    local downloadPackUpdateFunc = function(dt)
		self:downloadPackUpdate_state(dt)
    end    
    self.m_state_function_table[self.STATE_DOWNLOAD_PACK_UPDATE] = downloadPackUpdateFunc
        
    local updateVersionDoneFunc = function(dt)
		self:updateVersionDone_state(dt)
    end    
    self.m_state_function_table[self.STATE_UPDATE_DONE] = updateVersionDoneFunc
    
	self.m_current_state = self.STATE_DOWNLOAD_VERSION_LIST
    self.m_current_sub_state = self.SUB_STATE_ENTER
	
	if DEBUG_SDK_TYPE == 3 then
		self.event_check_update_state = function()
			self.m_is_need_wait_app_update_result = false
		end	
		fc.FSdkManager:getInstance():setUpdate91SdkStateCallback(self.event_check_update_state)
	end

	if DEBUG_SDK_TYPE == 11 then
		self.event_check_update_state = function()
			self.m_is_need_wait_app_update_result = false
		end	
		fc.FSdkManager:getInstance():setUpdateAsSdkStateCallback(self.event_check_update_state)
		fc.FSdkManager:getInstance():checkAsUpdate()
	end
	
	if DEBUG_SDK_TYPE == 22 then
		self.event_check_update_state = function()
			self.m_is_need_wait_app_update_result = false
		end	
		--设置java向lua回调	
		local luaj = require("prescripts.framework.luaj")
		local args = 
		{
			self.event_check_update_state
		}
		luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setCheckVersionFuncId", args, "(I)V")
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_update_manager] canEnterLoginView
-- 是否进入登陆界面
-------------------------------------------------------------------------------
function f_resource_update_manager:canEnterLoginView()
	return self.m_is_need_wait_app_update_result == false
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] start
-- 动态更新检测开始
-------------------------------------------------
function f_resource_update_manager:start()
	self.m_is_start_check = true
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] setStateTextCallback
-- 注册当前状态更新回调函数
-------------------------------------------------
function f_resource_update_manager:setStateTextCallback(callback)
	self.m_state_text_callback = callback
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] setStatePregressCallback
-- 注册进度条更新回调函数
-------------------------------------------------
function f_resource_update_manager:setStatePregressCallback(callback)
	self.m_state_pregress_callback = callback
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] startDownloadVersionList
-- 开始下载版本列表文件
-------------------------------------------------
function f_resource_update_manager:startDownloadVersionList()	
	local getVersionList = function(result, responeseData)
		if result == 0 then		
			local channelInfo = self.json.decode(responeseData)
			
			if channelInfo["channel_id"] == DEBUG_SDK_TYPE then
				if DEBUG_SDK_TYPE == 38 then
					self.m_download_pack_rest_part_url = channelInfo["pack_rest_part"]
				end
				local app_version_list = channelInfo["version_list"]
				for j = 1, #app_version_list do
					local app_version_info = app_version_list[j]
					if app_version_info["app_version"] == APP_VERSION then
						local resource_version_list = app_version_info["resource_list"]
						for k = 1, #resource_version_list do
							local resource_pack_info = resource_version_list[k]
							if tonumber(resource_pack_info["pack_resource_version"]) > RESOURCE_VERSION then
								table.insert(self.m_need_update_pack_info, resource_pack_info)
							end
						end
					elseif app_version_info["app_version"] > APP_VERSION then
						table.insert(self.m_need_update_app_info, app_version_info)					
					end
				end
			end
			self.m_current_sub_state = self.SUB_STATE_EXIT
		elseif result == -1 then			
		end	
		
	end
	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
		-- 台湾版本
		fc.FUtilManager:getInstance():sendHttpGetRequest(g_version_list_request_url[2][1] .. DEBUG_SDK_TYPE .. ".json", g_version_list_request_url[2][2] .. DEBUG_SDK_TYPE .. ".json", "getVersionList", getVersionList)
	else
		fc.FUtilManager:getInstance():sendHttpGetRequest(g_version_list_request_url[1][1] .. DEBUG_SDK_TYPE .. ".json", g_version_list_request_url[1][2] .. DEBUG_SDK_TYPE .. ".json", "getVersionList", getVersionList)
	end
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] downloadVersionList_state
-- 下载版本列表
-------------------------------------------------
function f_resource_update_manager:downloadVersionList_state(dt)
	

	if self.m_current_sub_state == self.SUB_STATE_ENTER then
		if LANGUAGE_TYPE == 3 then
			self.m_state_text_callback("正在加載資源列表...")
		else
			self.m_state_text_callback("正在加载资源列表...")
		end
		
		self.m_state_pregress_callback(0)
		
		
		if g_resource.g_system:checkNetWorkState() == false then
			if LANGUAGE_TYPE == 3 then
				self:showNetworkDisconnectTips("網絡連接失敗，請檢查網絡!")
			else
				self:showNetworkDisconnectTips("网络连接失败,请检查网络!")
			end
		else
			self:startDownloadVersionList()
		end
		
		
		
		self.m_current_sub_state = self.SUB_STATE_RUN
	elseif self.m_current_sub_state == self.SUB_STATE_RUN then
	
	elseif self.m_current_sub_state == self.SUB_STATE_EXIT then
		if LANGUAGE_TYPE == 3 then
			self.m_state_text_callback("資源加載完成...")
		else
			self.m_state_text_callback("资源加载完成...")
		end
				
		self.m_current_sub_state = self.SUB_STATE_ENTER
		
		if DEBUG_SDK_TYPE == 3 or DEBUG_SDK_TYPE == 1 or DEBUG_SDK_TYPE == 6 or DEBUG_SDK_TYPE == 8 or DEBUG_SDK_TYPE == 22 or DEBUG_SDK_TYPE == 11 
			or DEBUG_SDK_TYPE == 12 then					
			if #self.m_need_update_pack_info > 0 then
	    		self.m_current_state = self.STATE_DOWNLOAD_PACK_UPDATE
			else
	    		self.m_current_state = self.STATE_UPDATE_DONE
			end
		else
			
			if #self.m_need_update_app_info > 0 then
				self.m_current_state = self.STATE_NEED_UPDATE_APP
			else
				local needDownloadPackRestPart = false
				if DEBUG_SDK_TYPE == 38 and DEBUG_IS_FULL_PACK == false then
					local ok,isFullPack,lastAppVersion
					local luaj = require("prescripts.framework.luaj")
					ok,isFullPack = luaj.callStaticMethod("org.cocos2dx.lua.UtilTool", "getIsFullPack", {}, "()I")
					ok,lastAppVersion = luaj.callStaticMethod("org.cocos2dx.lua.UtilTool", "getAppVersion", {}, "()F")
					-- 当保存的版本号小于最新代码版本号，或者是非全包时，下载补全包
					if lastAppVersion < APP_VERSION or isFullPack == false then
						self.m_current_state = self.STATE_DOWNLOAD_PACK_REST_PART
						needDownloadPackRestPart = true
					end
				end
				if needDownloadPackRestPart == true then
				elseif #self.m_need_update_pack_info > 0 then
		    		self.m_current_state = self.STATE_DOWNLOAD_PACK_UPDATE
				else
		    		self.m_current_state = self.STATE_UPDATE_DONE
				end
			end
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] needUpdateApp_state
-- 需要更新二进制版本
-------------------------------------------------
function f_resource_update_manager:needUpdateApp_state(dt)
	if self.m_current_sub_state == self.SUB_STATE_ENTER then	
		
		local openDownload = nil
		
		if device.platform == "ios" and DEBUG_DEVICE_IOS_JAILBREAKING then	
			--IOS越狱版本更新检测
			openDownload = function()	
				g_resource.g_system:openURL(self.m_need_update_app_info[#self.m_need_update_app_info]["url"])
			end	
		elseif device.platform == "ios" and not DEBUG_DEVICE_IOS_JAILBREAKING then
			openDownload = function()	
				--IOS正版更新检测
			end	
		elseif device.platform == "android" then
			--ANDROID版本更新检测
			openDownload = function()	
				local saveName = "whws_" .. tostring(DEBUG_SDK_TYPE) .. tostring(self.m_need_update_app_info[#self.m_need_update_app_info]["app_version"]) .. ".apk"
				g_resource.g_system:openUpdate(self.m_need_update_app_info[#self.m_need_update_app_info]["url"], saveName)
			end	
		elseif device.platform == "windows" or device.platform == "mac" then
			--WINDOWS和MAC OS版本更新检测
			openDownload = function()	
				
			end	
		end	
	
		if LANGUAGE_TYPE == 3 then
			self:showCommonTips("遊戲已有新版本，請前往更新!", openDownload)		
		else
			self:showCommonTips("游戏已有新版本，请前往更新!", openDownload)		
		end
			
		
		self.m_current_sub_state = self.SUB_STATE_RUN
		
	elseif self.m_current_sub_state == self.SUB_STATE_RUN then
		
	elseif self.m_current_sub_state == self.SUB_STATE_EXIT then
		
	end
end

---------------------------------------------------------------------------------
-- @function [parent=#f_resource_update_manager] downloadPackRestPart_state
-- 下载补全包并解压(只有google play版本使用)
-------------------------------------------------
function f_resource_update_manager:downloadPackRestPart_state(dt)
	
	if self.m_current_sub_state == self.SUB_STATE_ENTER then
		
		self.m_state_text_callback("正在加載資源...")
		self.m_state_pregress_callback(0)
		
		self:setUpdatePackUrl(self.m_download_pack_rest_part_url)
		local callback1 = function(pregress)
			self:downloadOnePack(pregress)
		end
		self:setOnProgressCallback(callback1)
		
		local callback2 = function()
			self:updateOnePackDone()
		end
		self:setUpdateDoneCallback(callback2)
		
		self:startUpdate()
		
		self.m_current_sub_state = self.SUB_STATE_RUN
	elseif self.m_current_sub_state == self.SUB_STATE_RUN then
	
	elseif self.m_current_sub_state == self.SUB_STATE_EXIT then
		self:reloadNeedReloadModule()
		
		local luaj = require("prescripts.framework.luaj")
		luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setFullPackFlagAppVersion", {1, APP_VERSION}, "(IF)V")
		
		self.m_current_sub_state = self.SUB_STATE_ENTER
		
		if #self.m_need_update_pack_info > 0 then
    		self.m_current_state = self.STATE_DOWNLOAD_PACK_UPDATE
		else
    		self.m_current_state = self.STATE_UPDATE_DONE
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] downloadOnePack
-- 下载单个资源包更新进度
-------------------------------------------------
function f_resource_update_manager:downloadOnePack(pregress)
	self.m_state_pregress_callback(pregress*0.9)
	
	if pregress >= 100 then
		if LANGUAGE_TYPE == 3 then
			self.m_state_text_callback("正在應用資源...")
		else
			self.m_state_text_callback("正在应用资源...")
		end
	end
end


-------------------------------------------------
-- @function [parent=#f_resource_update_manager] updateOnePackDone
-- 更新单个资源包完成
-------------------------------------------------
function f_resource_update_manager:updateOnePackDone()
	self.m_state_pregress_callback(100)
	self.m_current_sub_state = self.SUB_STATE_EXIT
end
	
-------------------------------------------------
-- @function [parent=#f_resource_update_manager] downloadPackUpdate_state
-- 下载更新资源包并解压
-------------------------------------------------
function f_resource_update_manager:downloadPackUpdate_state(dt)
	if self.m_current_sub_state == self.SUB_STATE_ENTER then
		local packInfo = self.m_need_update_pack_info[1]
		
		if LANGUAGE_TYPE == 3 then
			self.m_state_text_callback("正在加載資源...")
		else
			self.m_state_text_callback("正在加载资源...")
		end
		self.m_state_pregress_callback(0)
		
		self:setUpdatePackUrl(packInfo["pack_url"])
		local callback1 = function(pregress)
			self:downloadOnePack(pregress)
		end
		self:setOnProgressCallback(callback1)
		
		local callback2 = function()
			self:updateOnePackDone()
		end
		self:setUpdateDoneCallback(callback2)
		
		self:startUpdate()
		
		self.m_current_sub_state = self.SUB_STATE_RUN
	elseif self.m_current_sub_state == self.SUB_STATE_RUN then
	
	elseif self.m_current_sub_state == self.SUB_STATE_EXIT then
		self:reloadNeedReloadModule()
	
		table.remove(self.m_need_update_pack_info, 1)
		
		self.m_current_sub_state = self.SUB_STATE_ENTER
		if #self.m_need_update_pack_info > 0 then
		else
			self.m_current_state = self.STATE_UPDATE_DONE
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] updateVersionDone_state
-- 更新完成
-------------------------------------------------
function f_resource_update_manager:updateVersionDone_state(dt)
	if self.m_current_sub_state == self.SUB_STATE_ENTER then
		--是否能够重新加载所有脚本，包括当前运行的脚本模块
		self.m_current_sub_state = self.SUB_STATE_RUN
	elseif self.m_current_sub_state == self.SUB_STATE_RUN then
		self.m_current_sub_state = self.SUB_STATE_EXIT
	elseif self.m_current_sub_state == self.SUB_STATE_EXIT then
		self:startGame()
	end
end


-------------------------------------------------
-- @function [parent=#f_resource_update_manager] update
-- 动态更新心跳函数
-------------------------------------------------
function f_resource_update_manager:update(dt)
	if not self.m_is_start_check then
		return
	end
	
	self.m_state_function_table[self.m_current_state](dt)
	
	self.m_step_time = self.m_step_time + dt
	
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] reloadNeedReloadModule
-- 重新加载一定需要重置的模块
-------------------------------------------------
function f_resource_update_manager:reloadNeedReloadModule()
	package["loaded"]["prescripts.config"] = nil
	
	LuaLoadChunksFromZIP("prescripts.zip")
	
	require("prescripts.config")
end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] startGame
-- 游戏正式开始
-------------------------------------------------
function f_resource_update_manager:startGame()
	LuaLoadChunksFromZIP("scripts.zip")
	require("scripts.game")
    g_game.startup()

end


-------------------------------------------------
-- @function [parent=#f_resource_update_manager] showCommonTips
-- 更新提示tips
-------------------------------------------------
function f_resource_update_manager:showCommonTips(text, callback)
	if self.m_common_tips_panel then
		return
	end
	self.m_common_tips_panel = require("prescripts.common.f_pre_tips_panel").new()
	local close = function() 		
 		if callback then
 			callback()
 		end
 		
 	end
 	
 	local exitGame = function()
 		self.m_game_manager:exitGame()
 	end
	
	self.m_common_tips_panel:setShowText(text)	
	self.m_common_tips_panel:addCallback(close)
	self.m_common_tips_panel:addCallback(exitGame)
	self.m_common_tips_panel:createCommonTips()

end

-------------------------------------------------
-- @function [parent=#f_resource_update_manager] showNetworkDisconnectTips
-- 网络连接失败提示
-------------------------------------------------
function f_resource_update_manager:showNetworkDisconnectTips(text)
	if self.m_network_tips_panel then
		return
	end
	self.m_network_tips_panel = require("prescripts.common.f_pre_network_tips_panel").new()
	
 	
 	local exitGame = function()
 		self.m_game_manager:exitGame()
 	end
	
	self.m_network_tips_panel:setShowText(text)	
	self.m_network_tips_panel:addCallback(exitGame)
	self.m_network_tips_panel:createCommonTips()

end

return f_resource_update_manager