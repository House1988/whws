require "bit"

local FLuaUtilManager = class("FLuaUtilManager", function()
    return fc.FUtilManager:getInstance()
end)

function FLuaUtilManager:ctor()
	local func = function()
	end
	self.event_error_cannot_connect_server = function()
		self:showPublicMessagePanel(g_game.g_f_error_msg_def.F_LUA_ERROR_NETWORK_LINKERROR,func)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_ERROR_CANNOT_CONNECT, self.event_error_cannot_connect_server)
	
	self.event_error_reconnect_failed = function()
		self:showNetworkErrorNeedLoginMessagePanel(g_game.g_f_error_msg_def.F_LUA_ERROR_NETWORK_LINKERROR)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_RECONNECT_FAILD, self.event_error_reconnect_failed)
	
	
	self.event_error_server_disconnect = function()
		g_game.m_isDisconnectTrigger = true
		self:showNetworkErrorMessagePanel(g_game.g_f_error_msg_def.F_LUA_ERROR_NEED_RECONNECT)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_ERROR_SERVER_DISCONNECT, self.event_error_server_disconnect)
	
	self.event_showNetworkLoading = function()
		self:showNetworkLoading()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING, self.event_showNetworkLoading)
	
	self.event_closeNetworkLoading = function()
		self:closeNetworkLoading()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING, self.event_closeNetworkLoading)
	
	self.event_forceCloseNetworkLoading = function()
		self:forceCloseNetworkLoading()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING, self.event_forceCloseNetworkLoading)
	
	
	self.event_resetSceneFlag = function()
		self:resetSceneState()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CLEAR_LOADING_FLAG, self.event_resetSceneFlag)
	
	self.event_hideNetErrorPanel = function()
		self:hideNetworkErrorMessagePanel()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_ERROR_HIDE_NET_ERROR_PANEL, self.event_hideNetErrorPanel)

	self.event_releaseTexture = function()
		self:releaseUnusedTextures()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE, self.event_releaseTexture)

	
	self.event_hideNetLoginErrorPanel = function()
		self:hideNetworkErrorNeedLoginMessagePanel()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_ERROR_HIDE_NET_LOGIN_ERROR_PANEL, self.event_hideNetLoginErrorPanel)
	
	
	self.game_flag = {}
	self.game_flag[g_game.g_f_game_flag.F_LUA_GAME_SHOP_OPEN_INDEX] = 0
	self.game_flag[g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE] = 0
	
	self.m_network_loading_count = 0
	
	self.m_user_need_login_count = 0
	
	self.m_network_loading = nil
	
	self.m_server_list = {}
	
	self.m_networkErrorPanel = nil
	self.m_networkErrorNeedLoginPanel = nil
	
	self.m_current_battle_manager = nil
	
	--server time
	self.m_server_time = nil
	
	self.m_lastEliteProgress = {} --上一次打的精英副本类型
	self.m_lastPveProgress = {}--上一次打的pve进度
	
	self.m_moveMsgPanel = nil
end

------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] setLastPveProgress
-- 设置上一次攻打的关卡类型
-------------------------------------------------------------------------------
function FLuaUtilManager:setLastPveProgress(area,stage,level)
	self.m_lastPveProgress["areaId"] = area
	self.m_lastPveProgress["stageId"] = stage
	self.m_lastPveProgress["levelId"] = level
end

------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getLastPveProgress
-------------------------------------------------------------------------------
function FLuaUtilManager:getLastPveProgress()
	return self.m_lastPveProgress
end

------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] setLastEliteProgress
-- 设置上一次攻打的精英副本类型
-------------------------------------------------------------------------------
function FLuaUtilManager:setLastEliteProgress(eliteArea,eliteStage)
	self.m_lastEliteProgress["eliteAreaId"] = eliteArea
	self.m_lastEliteProgress["eliteStageId"] = eliteStage
end

------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getLastEliteProgress
-------------------------------------------------------------------------------
function FLuaUtilManager:getLastEliteProgress()
	return self.m_lastEliteProgress 
end


function FLuaUtilManager:setCurrentBattleManager(battleManager)
	self.m_current_battle_manager = battleManager
end

function FLuaUtilManager:getCurrentBattleManager()
	return self.m_current_battle_manager
end

function FLuaUtilManager:setGameFlag(type,value)
	self.game_flag[type] = value
end

function FLuaUtilManager:getGameFlag(type)
	return self.game_flag[type]
end


function FLuaUtilManager:getExportTime(inputTargetSec)
	
	 local getModValue = function(a,b)  --取余数
		local mod = a - math.floor(a/b)*b
	 	return mod
	 end
	
	 local targeExtraSec = getModValue(inputTargetSec,3600)-- 100
	
	 local hour = math.floor(inputTargetSec/3600)
	 local min = math.floor(targeExtraSec / 60)
	 local sec = getModValue(targeExtraSec,60)
	 
	 local exportTime = nil
	 local exportHour = nil
	 local exportMin = nil
	 local exportSec = nil
	 
	 if hour < 10 then  exportHour = "0"..hour  else exportHour = ""..hour end
	 if min < 10 then  exportMin = "0"..min  else exportMin = ""..min end
	 if sec < 10 then  exportSec = "0"..sec  else exportSec = ""..sec end
	 
	 local exportTime = exportHour..":"..exportMin ..":"..exportSec
	 return exportTime
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getModValue
-- 获取余数
-------------------------------------------------------------------------------
function FLuaUtilManager:getModValue(a,b) 
	local mod = a - math.floor(a/b)*b
 	return mod
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getTipsMsg
-- 获取提示文本串
-------------------------------------------------------------------------------
function FLuaUtilManager:getTipsMsg(type)
	local txt  = g_game.g_dictConfigManager:getLanTextById(g_game.g_f_tip_msg[type])
	return txt
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] checkInputEN
-- 检查敏感字
-------------------------------------------------------------------------------
function FLuaUtilManager:checkInput(text)
	if self:checkCharCode(text) then
		return self:checkChar(text) and self:checkInputCH(text) and self:checkInputEN(text)
	end
	return false
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] checkChar
-- 检查字符是否合法
-------------------------------------------------------------------------------
function FLuaUtilManager:checkCharCode(text)
	local n = string.len(text)
	local i = 1
	while i < n do
		local b = string.byte(text, i)
		if b > 127 then
			if b < 224 then
				return false
			end
			local a1, a2, a3 = string.byte(text, i, i + 2)
			i = i + 2
			local sum = a1 * 1000000 + a2 * 1000 + a3
			if sum < 228184128 or sum > 233191191 then
				return false
			end
		end
		i = i + 1
	end
	return true
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] checkInputEN
-- 检查英文敏感字
-------------------------------------------------------------------------------
function FLuaUtilManager:checkInputEN(text)
	local t = g_game.g_dictConfigManager:getPingbiWord(false)
	for i = 1, #t do
		local index = string.find(text, t[i][2])
		if index ~= nil then
			if index - 1 <= 1 or not self:isEnglish(string.byte(text, index - 1)) then
				return false
			end
			index = index + string.len(t[i][2])
			if index > string.len(text) or not self:isEnglish(string.byte(text, index)) then
				return false
			end
		end
	end
	return true
end

function FLuaUtilManager:checkChar(text)
	local t = {" ", "，", ",", "/","\\", "\"", "\'", "_", "＿", "：", ":", "“", "”", "‘", "’"}	
	for i = 1, #t do
		if string.find(text,t[i]) ~= nil then
			return false
		end
	end
	return true
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] isEnglish
-- 是否是英文
-------------------------------------------------------------------------------
function FLuaUtilManager:isEnglish(char)
	return (char >= 65 and char <= 90) or (char >= 97 and char <= 122) or (char >= 0xff21 and char <= 0xff3a) or (char >= 0xff41 and char <= 0xff51)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] checkInputCH
-- 检查中文敏感字
-------------------------------------------------------------------------------
function FLuaUtilManager:checkInputCH(text)
	local t = g_game.g_dictConfigManager:getPingbiWord(true)
	for i = 1, #t do
		local cmp = ""
		if LANGUAGE_TYPE == 3 then
			local id = t[i][2]
			cmp = g_game.g_dictConfigManager:getLanTextById(id)
		else
			cmp = t[i][2]
		end
		if string.find(text, cmp) ~= nil then
			return false
		end
	end
	return true
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showPublicMessagePanel
-- 设置通用 弹出 提示面板
-------------------------------------------------------------------------------
function FLuaUtilManager:showPublicMessagePanel(type, callback)
	local publicPopup = require("scripts.game.main.common.f_common_popup_notice").new()	
	g_game.g_panelManager:showUiPanel(publicPopup,"notice_popup_panel")
	local msg = g_game.g_dictConfigManager:getLanTextById(g_game.g_f_error_msg[type])
	
	publicPopup:setNoticeContent(nil,msg,nil,nil)
   	publicPopup:popUpNotice(23)
  	publicPopup:setActionType(1)
  	publicPopup:setYesCallBack(callback)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] hideNetworkErrorMessagePanel
-- 隐藏网络错误描述框
-------------------------------------------------------------------------------
function FLuaUtilManager:hideNetworkErrorMessagePanel()

	if self.m_networkErrorPanel then
		self.m_networkErrorPanel:hide()
		
		self.m_networkErrorPanel = nil
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showNetworkErrorMessagePanel
-- 显示网络错误描述框
-------------------------------------------------------------------------------
function FLuaUtilManager:showNetworkErrorMessagePanel(type)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
  	g_game.g_netManager:reconnect()
 --  	--返回登录
 --  	local returnTologin = function()
 --  		g_game.m_isDisconnectTrigger = false
 --  		g_game.startup()
  		
 --  		--数据分析sdk
 --  		send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGOUT)
 --  	end
 --  	--重新链接
 --  	local reconnect = function()
	-- 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
 --  		g_game.g_netManager:reconnect()
 --  	end

	-- send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)

	-- self.m_networkErrorPanel = require("scripts.game.main.common.f_network_error_panel").new()
	-- local msg =  g_game.g_dictConfigManager:getLanTextById(g_game.g_f_error_msg[type])
	-- self.m_networkErrorPanel:setShowText(msg)	
	-- self.m_networkErrorPanel:addCallback(returnTologin)
	-- self.m_networkErrorPanel:addCallback(reconnect)
	-- self.m_networkErrorPanel:createReconnectPopup()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showGuildLinePopup
-- 显示教学错误描述框
-------------------------------------------------------------------------------
function FLuaUtilManager:showGuildLinePopup(type)
 	local close = function()
 		self.m_guildLinePopup:hide()
 		self.m_guildLinePopup = nil
 	end
	self.m_guildLinePopup = require("scripts.game.main.common.f_network_error_panel").new()
	local msg = g_game.g_dictConfigManager:getLanTextById(g_game.g_f_error_msg[type])
	self.m_guildLinePopup:setShowText(msg)	
	self.m_guildLinePopup:addCallback(close)
	self.m_guildLinePopup:createNetworkErrorPopup()
end



-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] forceHideUserHaventLogin
-- 强制隐藏用户未登录并强制用户登录的错误框
-------------------------------------------------------------------------------
function FLuaUtilManager:forceHideUserHaventLogin()
	self.m_user_need_login_count = 0
	if self.m_user_need_login then
		self.m_user_need_login:hide()
		self.m_user_need_login = nil
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] hideUserHaventLogin
-- 隐藏用户未登录并强制用户登录的错误框
-------------------------------------------------------------------------------
function FLuaUtilManager:hideUserHaventLogin()
	self.m_user_need_login_count = self.m_user_need_login_count - 1
	if self.m_user_need_login_count < 0 then
		self.m_user_need_login_count = 0
	end
	if self.m_user_need_login_count == 0 then			
		if self.m_user_need_login then
			self.m_user_need_login:hide()
			self.m_user_need_login = nil
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showUserHaventLogin
-- 显示用户未登录并强制用户登录的错误框
-------------------------------------------------------------------------------
function FLuaUtilManager:showUserHaventLogin(text)
	if self.m_user_need_login_count > 0 then
		self.m_user_need_login_count = self.m_user_need_login_count + 1
		return
	end
	
 	local close = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_SDK_LOGIN_CHANGE_ACCOUNT)	
 		self:hideUserHaventLogin()
 	end
	self.m_user_need_login = require("scripts.game.main.common.f_network_error_panel").new()
	
	self.m_user_need_login:setShowText(text)	
	self.m_user_need_login:addCallback(close)
	self.m_user_need_login:createNetworkErrorPopup()
	
	self.m_user_need_login_count = self.m_user_need_login_count + 1
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showCommonTipsPanel
-- 显示一般提示信息，并传入确定回调
-------------------------------------------------------------------------------
function FLuaUtilManager:showCommonTipsPanel(text, callback)
 	local close = function() 		
 		self.m_common_tips_panel:hide()
 		self.m_common_tips_panel = nil
 		
 		if callback then
 			callback()
 		end
 	end
	self.m_common_tips_panel = require("scripts.game.main.common.f_network_error_panel").new()
	
	self.m_common_tips_panel:setShowText(text)	
	self.m_common_tips_panel:addCallback(close)
	self.m_common_tips_panel:createNetworkErrorPopup()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] hideNetworkErrorNeedLoginMessagePanel
-- 隐藏网络错误描述框
-------------------------------------------------------------------------------
function FLuaUtilManager:hideNetworkErrorNeedLoginMessagePanel()
	if self.m_networkErrorNeedLoginPanel then
		self.m_networkErrorNeedLoginPanel:hide()
		
		self.m_networkErrorNeedLoginPanel = nil
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showNetworkErrorNeedLoginMessagePanel
-- 显示网络错误,并返回登陆
-------------------------------------------------------------------------------
function FLuaUtilManager:showNetworkErrorNeedLoginMessagePanel(type)
	local msg = g_game.g_dictConfigManager:getLanTextById(g_game.g_f_error_msg[type])  	
  	--返回登录
  	local returnTologin = function()
  		g_game.startup()
  		
  		--数据分析sdk
  		send_lua_event(g_game.g_f_lua_game_event.F_LUA_DATA_USER_LOGOUT)
  	end

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_FORCE_CLOSE_NETWORK_LOADING)

	self.m_networkErrorNeedLoginPanel = require("scripts.game.main.common.f_network_error_panel").new()
	self.m_networkErrorNeedLoginPanel:setShowText(msg)	
	self.m_networkErrorNeedLoginPanel:addCallback(returnTologin)
	self.m_networkErrorNeedLoginPanel:createNetworkErrorPopup()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showCustomMessagePanel
-- 设置自定义内容 弹出 提示面板
-------------------------------------------------------------------------------
function FLuaUtilManager:showCustomMessagePanel(content)
	if g_game.g_panelManager:isUiPanelShow("notice_popup_panel") then
		return
	end
	
	local publicPopup = require("scripts.game.main.common.f_common_popup_notice").new()	
	g_game.g_panelManager:showUiPanel(publicPopup,"notice_popup_panel")
	publicPopup:setNoticeContent(nil,content,nil,nil)
   	publicPopup:popUpNotice(23)
  	publicPopup:setActionType(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showPublicFloatingMsg
-- 设置通用 弹出 提示面板
-------------------------------------------------------------------------------
function FLuaUtilManager:showPublicFloatingMsg(type)
	local notice = require("scripts.game.main.common.f_common_floating_notice").new()
	notice:setSize(cc.size(500, 80))
	g_game.g_panelManager:showUiPanel(notice,"floating_popup_panel")
    local msg = g_game.g_dictConfigManager:getLanTextById(g_game.g_f_error_msg[type])
    notice:setNoticeString(msg)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showFloatingMsg
-- 设置通用 弹出 提示面板
-------------------------------------------------------------------------------
function FLuaUtilManager:showFloatingMsg(text)
	local notice = require("scripts.game.main.common.f_common_floating_notice").new()
	notice:setSize(cc.size(500, 80))
	g_game.g_panelManager:showUiPanel(notice,"floating_popup_panel")
    notice:setNoticeString(text)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showMsg
-- 设置浮动提示板
-------------------------------------------------------------------------------
function FLuaUtilManager:showMsg(str)
	if g_game.g_panelManager:isUiPanelShow("floating_popup_panel") then
		g_game.g_panelManager:removeUiPanel("floating_popup_panel")
	end

	local notice = require("scripts.game.main.common.f_common_floating_notice").new()
	notice:setSize(cc.size(500, 80))
	g_game.g_panelManager:showUiPanel(notice,"floating_popup_panel")
    notice:setNoticeString(str)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] forceCloseNetworkLoading
-- 强制关闭网络加载进度
-------------------------------------------------------------------------------
function FLuaUtilManager:forceCloseNetworkLoading()
	self.m_network_loading_count = 0
	if self.m_network_loading_count < 1 then
		self.m_network_loading_count = 0
		if self.m_network_loading then		
			self.m_network_loading:hideLoading()
			self.m_network_loading = nil
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showNetworkLoading
-- 链接网络 loading
-------------------------------------------------------------------------------
function FLuaUtilManager:showNetworkLoading()
	if self.m_network_loading_count == 0 then
		if self.m_network_loading == nil then		
			self.m_network_loading = require("scripts.game.main.common.f_network_loading_panel").new()	
		end
		
		self.m_network_loading:showLoading()
			
	end
	self.m_network_loading_count = self.m_network_loading_count + 1
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] closeNetworkLoading
-- 关闭 loading
-------------------------------------------------------------------------------
function FLuaUtilManager:closeNetworkLoading()
	self.m_network_loading_count = self.m_network_loading_count - 1
	if self.m_network_loading_count < 1 then
		self.m_network_loading_count = 0
		if self.m_network_loading then		
			self.m_network_loading:hideLoading()
			self.m_network_loading = nil
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] resetSceneState
-- 切换场景清除状态
-------------------------------------------------------------------------------
function FLuaUtilManager:resetSceneState()
	self.m_network_loading_count = 0
	self.m_network_loading = nil
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] loadServerList
-- 加载服务器列表
-------------------------------------------------------------------------------
function FLuaUtilManager:loadServerList(listener)
	local getServerList = function(result, responeseData)
		if result == 0 then
			self.m_server_list = responeseData	
		elseif result == -1 then			
		end	
		
		listener(result)
	end
	if DEBUG_USE_US_SERVER == true then
		if DEBUG_SDK_TYPE == 1 or DEBUG_SDK_TYPE == 10 then	
			self:sendHttpGetRequest(g_server_list_request_url[1][1], g_server_list_request_url[1][2], "getServerList", getServerList)
		elseif DEBUG_SDK_TYPE == 14 then
			self:sendHttpGetRequest(g_server_list_request_url[6][1], g_server_list_request_url[6][2], "getServerList", getServerList)
		elseif DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then	
			self:sendHttpGetRequest(g_server_list_request_url[4][1], g_server_list_request_url[4][2], "getServerList", getServerList)
		else
			self:sendHttpGetRequest(g_server_list_request_url[2][1], g_server_list_request_url[2][2], "getServerList", getServerList)		
		end
	else
		if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
			self:sendHttpGetRequest(g_server_list_request_url[5][1], g_server_list_request_url[5][2], "getServerList", getServerList)
		else
			self:sendHttpGetRequest(g_server_list_request_url[3][1], g_server_list_request_url[3][2], "getServerList", getServerList)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getServerList
-- 获取服务器列表
-------------------------------------------------------------------------------
function FLuaUtilManager:getServerList()
	return self.m_server_list
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] releaseUnusedTextures
-- 释放未使用的纹理
-------------------------------------------------------------------------------
function FLuaUtilManager:releaseUnusedTextures()

	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] fakeMingChenData
-- 假的名臣数据用于显示名臣详情
-------------------------------------------------------------------------------
function FLuaUtilManager:fakeMingChenData(id)
	local data = {}
	data["officerId"] = id
	data["officerLevel"] =1
	data["officerExp"] = 0
	data["soldierType"] = g_game.g_dictConfigManager:getSoldierBigType(id)
	data["attack"] = g_game.g_dictConfigManager:getOfficerAttack(id, 1)
	data["defense"] = g_game.g_dictConfigManager:getOfficerDefense(id, 1)
	data["advanced"] = 1
	data["battle"] = 0
	return data
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] fakeEquipment
-- 假的装备数据用于显示装备详情
-------------------------------------------------------------------------------
function FLuaUtilManager:fakeEquipment(id)
	local data = {}
	data["equip_id"] = id
	data["primaryId"] = 0
	data["status"] = 0
	data["equip_level"] =1
	return data
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getEncodeString
-- 释放未使用的纹理
-------------------------------------------------------------------------------
function FLuaUtilManager:getEncodeString(str, default)
	local colorTable = {}
	local start = 1
	local e = string.find(str,"%[",start)
	local color = default
	while e ~= nil do
		if e > start then
			table.insert(colorTable, {["str"] = string.sub(str,start,e - 1), ["color"] = color})
		end
		start = e + 1
		e = string.find(str,"%]",start)
		local c = string.sub(str,start,e - 1)
		local t = string.split(c, ",")
		color = cc.c3b(tonumber(t[1]), tonumber(t[2]), tonumber(t[3]))
		start = e + 1
		e = string.find(str, "%[", start)
	end
	if start <= string.len(str) then
		table.insert(colorTable, {["str"] = string.sub(str,start,string.len(str)), ["color"] = color})
	end
	return colorTable
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] allGuidelinesIsFinish
-- 所有新手指引已经完成
-------------------------------------------------------------------------------
function FLuaUtilManager:allGuidelinesIsFinish()
	return g_game.g_guidelinesManager:guidelinesIsFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] getServerTime
--获取服务器时间
-------------------------------------------------------------------------------
function FLuaUtilManager:getServerTime()
	return self.m_server_time
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] 设置格式化服务器时间
-- 设置格式化 服务器时间
-------------------------------------------------------------------------------
function FLuaUtilManager:setFormatTime(tab)
	if self.m_server_time == nil then
		
	else
		if tab.day ~= self.m_server_time.day then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_REFERSH_RECOVER_DATA)
		end
	end

	self.m_server_time = tab
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showSellPopup
-------------------------------------------------------------------------------
function FLuaUtilManager:showSellPopup(name, price, callback)
	require("scripts.game.main.equipBag.f_game_sell_equip")
	local panel = f_game_sell_equip.static_create()
	panel:panelInitBeforePopup(name, price, callback)
	g_game.g_panelManager:showUiPanel(panel, "sell_popup")
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] popupQuickBuyOrUse
-- 根据类型 弹出某一类型的  快速使用或购买
-------------------------------------------------------------------------------
function FLuaUtilManager:popupQuickBuyOrUse(type)
	local isLack = self:isLack(type)
	
	local tip = {}
	if LANGUAGE_TYPE == 3 then
		tip[1] = "糧草充足，無需補充"
		tip[2] = "軍令充足，無需補充"
		tip[3] = "精力充足，無需補充"
		tip[4] = ""
	else
		tip[1] = "粮草充足，无需补充"
		tip[2] = "军令充足，无需补充"
		tip[3] = "精力充足，无需补充"
		tip[4] = ""	
	end
	
	if not isLack then
		self:showMsg(tip[type])
		return
	end
	
	local isPopUse = self:isPopUseOrBuy(type)
	
	if isPopUse then
		require("scripts.game.main.common.f_quick_use_popup")
		local use = f_quick_use_popup.static_create()
		use:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(use,"quick_use_panel")
		use:setType(type)
	else
		require("scripts.game.main.common.f_quick_buy_popup")
		local buy = f_quick_buy_popup.static_create()
		buy:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(buy,"quick_buy_panel")
		buy:setType(type)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] isLack
-- 判断是否需要弹出
-------------------------------------------------------------------------------
function FLuaUtilManager:isLack(type)
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local strengthLimit = g_game.g_dictConfigManager:getLimitStrength(userInfo["level"])
	local militaryLimit = g_game.g_dictConfigManager:getLimitJunling(userInfo["level"])
	local energyLimit = g_game.g_dictConfigManager:getLimitJingli(userInfo["level"])
	
	if type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH and userInfo["strength"]< strengthLimit  then
		return true
	elseif type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY and userInfo["military"]< militaryLimit then
		return true
	elseif type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY and userInfo["energy"]< energyLimit then
		return true
	elseif type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
		return true
	end
	
	return false
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] isPopUseOrBuy
-- 判断是弹出使用还是购买界面
-------------------------------------------------------------------------------
function FLuaUtilManager:isPopUseOrBuy(type)
	local propData = g_game.g_userInfoManager:getUserEquipData()
	
	for i = 1,#propData["propList"] do
		--商城道具  五千石粮草
		if propData["propList"][i]["propId"] == 1 and  type == g_game.g_f_quick_type.QUICK_TYPE_STRENGTH then
			return true
		--商城道具  五百军令
		elseif propData["propList"][i]["propId"] == 3 and type == g_game.g_f_quick_type.QUICK_TYPE_MILITARY then
		  	return true
		--商城道具 小精力丹
		elseif propData["propList"][i]["propId"] == 5 and type == g_game.g_f_quick_type.QUICK_TYPE_ENERGY then
			return true
		--商城道具 整套令
		elseif propData["propList"][i]["propId"] == 8 and type == g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT then
			return true
		end
	end
	
	return false
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] showMovingMsg
-- 显示跑马灯循环消息
-------------------------------------------------------------------------------
function FLuaUtilManager:showMovingMsg()
	if g_game.g_current_scene_type ~= g_game.SCENE_TYPE_GAME  then
		self:hideMovingMsg()
		return
	end
	
	if self.m_moveMsgPanel ~= nil then
		return
	end
	
	if g_game.m_isLoadFinish then
		self.m_moveMsgPanel = require("scripts.game.main.common.f_common_moving_msg").new()
		self.m_moveMsgPanel:layout_in_parent()  
	end
	
end

function FLuaUtilManager:resetMovingMsg()
	self.m_moveMsgPanel = nil
end


function FLuaUtilManager:hideMovingMsg()
	if self.m_moveMsgPanel ~= nil then
		self.m_moveMsgPanel:hide()
		self.m_moveMsgPanel = nil
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaUtilManager] enterShop
-------------------------------------------------------------------------------
function FLuaUtilManager:enterShop(index)
	local m_shangcheng_panel = f_shangcheng_main.static_create()
    m_shangcheng_panel:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(m_shangcheng_panel,"keju_xuanxiu_shangcheng")
	m_shangcheng_panel.m_panelIndex = index
	m_shangcheng_panel:updatePagePanel()
end

function FLuaUtilManager:reCalculateWorldBoss()
	local curTime = g_game.g_gameManager:getCurrentTime()
	local t = os.date("*t",curTime)
	local time = t["hour"] * 3600 + t["min"] * 60 + t["sec"]
	
	local worldBossTime = 0
	if t["hour"] < g_game.WORLD_BOSS_START_TIME2 then
		worldBossTime = g_game.WORLD_BOSS_START_TIME2*3600
	else
		worldBossTime = (g_game.WORLD_BOSS_START_TIME2 + 24)*3600
	end

	worldBossTime = worldBossTime - time
	g_game.g_recoverManager:setSteadyActivityTimer("worldboss", worldBossTime,g_game.g_f_lua_game_event.F_LUA_UPDATE_STEADY_ACTIVITY)
end

function FLuaUtilManager:setUserSettings()
	local m,e = g_game.g_dataManager:getUserSetting()
	if e == 1 then
		g_game.g_audioManager.m_audio.setEffectsVolume(1.0)
	else
		g_game.g_audioManager.m_audio.setEffectsVolume(0.0)
	end
	
	if m == 1 then
		g_game.g_audioManager.m_audio.setMusicVolume(1.0)
	else
		g_game.g_audioManager.m_audio.setMusicVolume(0.0)
	end
	
end

-- 通用提示板   -- 确定   返回
function FLuaUtilManager:showAlertLayer( text,okCallBack,cancelCallBack )
	local layer = require("scripts.game.layers.alertlayer").new(text)
	g_game.g_panelManager:showUiPanel(layer,"login_create_role")
	-- g_game.g_director:getRunningScene():add_panel_to_layer(layer,5)
	local closeFunc = function (  )
		g_game.g_panelManager:removeUiPanel("login_create_role")
	end
	if okCallBack then
		layer:setOkCallBack(function (  )
			okCallBack()
			closeFunc()
		end)
	else
		layer:setOkCallBack(closeFunc)
	end
	if cancelCallBack then
		layer:setCancelBack(function (  )
			cancelCallBack()
			closeFunc()
		end)
	else
		layer:setCancelBack(closeFunc)
	end
end
return FLuaUtilManager