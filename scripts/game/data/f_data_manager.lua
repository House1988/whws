--[[--
    数据管理类，管理本地存储数据的读取
--]]--

local f_data_manager = class("f_data_manager")
f_data_manager.__index = f_data_manager

-------------------------------------------------
-- @function [parent=#f_data_manager] ctor
-------------------------------------------------
function f_data_manager:ctor()	
	self.m_game_data_class = require("prescripts.framework.api.GameState").new()
	self.m_payment_data_class	 = require("prescripts.framework.api.GameState").new()
	self.m_server_data_class	 = require("prescripts.framework.api.GameState").new()
	self.m_login_data_class = require("prescripts.framework.api.GameState").new()
	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] initLoginTypeFile
-------------------------------------------------
function f_data_manager:initLoginTypeFile()

	local dataHandler = function(dataTable)
		return self:dataHandler(dataTable)
	end
	self.m_login_data_class:init(dataHandler, "xzz_login", "baofei")
	self.m_login_data = self.m_login_data_class:load()
	if self.m_login_data == nil then
		self.m_login_data = {}	
	end
	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] initNativeFile
-------------------------------------------------
function f_data_manager:initNativeFile(userName)
	local dataHandler = function(dataTable)
		return self:dataHandler(dataTable)
	end
	self.m_game_data_class:init(dataHandler, userName .. "_" .. g_native_data_file[1][1], g_native_data_file[1][2])
	self.m_file_is_exist = false
	self.m_game_data = self.m_game_data_class:load()
	if self.m_game_data == nil then
		self.m_game_data = {}
		self.m_file_is_exist = false
	else
		self.m_file_is_exist = true
	end
	
	self.m_payment_data_class:init(dataHandler, userName .. "_" .. g_native_data_file[2][1], g_native_data_file[2][2])
	self.m_payment_data = self.m_payment_data_class:load()
	if self.m_payment_data == nil then
		self.m_payment_data = {}	
	end

end	


-------------------------------------------------
-- @function [parent=#f_data_manager] initServerCache
-- 初始化服务器缓存数据
-------------------------------------------------
function f_data_manager:initServerCache()	
	local dataHandler = function(dataTable)
		return self:dataHandler(dataTable)
	end
	self.m_server_data_class:init(dataHandler, g_native_data_file[3][1], g_native_data_file[3][2])
	self.m_server_data = self.m_server_data_class:load()
	if self.m_server_data == nil then
		self.m_server_data = {}	
	end
	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] hasGuidlinesData
-- 数据是否已经存在
-------------------------------------------------
function f_data_manager:hasGuidlinesData()	
	return self.m_file_is_exist
end

-------------------------------------------------
-- @function [parent=#f_data_manager] dataHandler
-- 数据存储处理函数
-------------------------------------------------
function f_data_manager:dataHandler(dataTable)	
	if dataTable.errorCode then
		CCLOG("error")
	else
		if dataTable.name == "init" then
			return nil
		elseif dataTable.name == "save" then
			local str = json.encode(dataTable.values)
			return {data=str}
		elseif dataTable.name == "load" then
			local str = dataTable.values.data
			return json.decode(str)
		end
	end
end

-------------------------------------------------
-- @function [parent=#f_data_manager] saveUserSetting
-------------------------------------------------
function f_data_manager:saveUserSetting(musicSetting, effectSetting)	
	self.m_game_data["musicSetting"]	= musicSetting
	self.m_game_data["effectSetting"] = effectSetting
	
	self.m_game_data_class:save(self.m_game_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getUserSetting
-------------------------------------------------
function f_data_manager:getUserSetting()	
	if self.m_game_data["musicSetting"] == nil and self.m_game_data["effectSetting"] == nil  then
		return 1, 1
	end
	return self.m_game_data["musicSetting"], self.m_game_data["effectSetting"]	
	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] setUserLastLoginType
-------------------------------------------------
function f_data_manager:setUserLastLoginType(type)	
	if self.m_login_data == nil then
		self.m_login_data = {}
	end
	
	self.m_login_data["loginFlag"] = type
	self.m_login_data_class:save(self.m_login_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getUserLastLoginType
-------------------------------------------------
function f_data_manager:getUserLastLoginType()	
	if self.m_login_data == nil or self.m_login_data["loginFlag"] == nil then
		return 0
	end
	return self.m_login_data["loginFlag"]
end

-------------------------------------------------
-- @function [parent=#f_data_manager] saveElitePveProgress
-- 存储elite 进度
-------------------------------------------------
function f_data_manager:saveElitePveProgress(areaId, stageId)	
	self.m_game_data["eliteAreaId"]	= areaId
	self.m_game_data["eliteStageId"] = stageId
	
	self.m_game_data_class:save(self.m_game_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getElitePveProgress
-- 存储elite pve 进度
-------------------------------------------------
function f_data_manager:getElitePveProgress()
	if self.m_game_data["eliteAreaId"] == nil and self.m_game_data["eliteStageId"] == nil  then
		return "", ""
	end
	return self.m_game_data["eliteAreaId"], self.m_game_data["eliteStageId"]	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] savePveProgress
-- 存储pve 进度
-------------------------------------------------
function f_data_manager:savePveProgress(areaId, stageId,levelId)	
	self.m_game_data["areaId"]	= areaId
	self.m_game_data["stageId"]		= stageId
	self.m_game_data["levelId"]		= levelId
	
	self.m_game_data_class:save(self.m_game_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getPveProgress
-- 存储pve 进度
-------------------------------------------------
function f_data_manager:getPveProgress()
	if self.m_game_data["areaId"] == nil and self.m_game_data["stageId"] == nil  and
		self.m_game_data["levelId"] == nil then
		return "", "",""
	end
	return self.m_game_data["areaId"], self.m_game_data["stageId"],self.m_game_data["levelId"]	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] saveBattleState
-- 存储pvp pve战斗后是否回到  关卡选项 和 pvp场景选项
-------------------------------------------------
function f_data_manager:saveBattleState(isBackPveUi, isBackPvpUi)	

	self.m_game_data["isBackPveUi"]	= isBackPveUi
	self.m_game_data["isBackPvpUi"]		= isBackPvpUi
	
	self.m_game_data_class:save(self.m_game_data)

end

-------------------------------------------------
-- @function [parent=#f_data_manager] getBattleState
-- 返回pvp pve战斗后是否回到  关卡选项 和 pvp场景选项
-------------------------------------------------
function f_data_manager:getBattleState()	
	if self.m_game_data["isBackPveUi"] == nil and self.m_game_data["isBackPvpUi"] == nil then
		return "", ""
	end
	return self.m_game_data["isBackPveUi"], self.m_game_data["isBackPvpUi"]	

end

-------------------------------------------------
-- @function [parent=#f_data_manager] saveUserInfo
-- 存储用户名密码
-------------------------------------------------
function f_data_manager:saveUserInfo(userName)		
	self.m_game_data["userName"]	= userName
	
	self.m_game_data_class:save(self.m_game_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getUserInfo
-- 获取用户名密码
-------------------------------------------------
function f_data_manager:getUserInfo()	
	if self.m_game_data["userName"] == nil then
		return ""
	end
	return self.m_game_data["userName"]	
end

-------------------------------------------------
-- @function [parent=#f_data_manager] savePaymentTransaction
-- 存储付费列表
-------------------------------------------------
function f_data_manager:savePaymentTransaction(transaction)
	if self.m_game_data == nil then
		return
	end
	if self.m_payment_data["transactions"] == nil then
		self.m_payment_data["transactions"] = {}
	end
	
	for i, v in ipairs(self.m_payment_data["transactions"]) do
		if v["transactionIdentifier"] == transaction["transactionIdentifier"] then
			return 
		end
	end
	
	local serTransaction = {}
	serTransaction["transactionIdentifier"] = transaction["transactionIdentifier"]
	serTransaction["receipt"] = transaction["receipt"]
	
	table.insert(self.m_payment_data["transactions"], serTransaction)
	
	self.m_payment_data_class:save(self.m_payment_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getPaymentTransaction
-- 获取付费列表
-------------------------------------------------
function f_data_manager:getPaymentTransaction()
	return self.m_payment_data["transactions"]
end

-------------------------------------------------
-- @function [parent=#f_data_manager] removePaymentTransaction
-- 移除付费列表项
-------------------------------------------------
function f_data_manager:removePaymentTransaction(transactionIdentifier)
	if self.m_payment_data["transactions"] == nil then
		return
	end
	for i, v in ipairs(self.m_payment_data["transactions"]) do
		if v["transactionIdentifier"] == transactionIdentifier then
			table.remove(self.m_payment_data["transactions"], i)
			break 
		end
	end
	
	self.m_payment_data_class:save(self.m_payment_data)
end


-------------------------------------------------
-- @function [parent=#f_data_manager] saveCurrentServerInfo
-- 保存当前服务器信息
-------------------------------------------------
function f_data_manager:saveCurrentServerInfo(serverInfo, account)
	if self.m_server_data == nil then
		return 
	end
	if self.m_server_data[account] == nil then
		self.m_server_data[account] = {}
	end
	
	for i = #self.m_server_data[account], 1, -1 do
		if self.m_server_data[account][i]["name"] == serverInfo["name"] then
			table.remove(self.m_server_data[account], i)
		end
	end
	table.insert(self.m_server_data[account], 1, serverInfo)
	
	self.m_server_data_class:save(self.m_server_data)
end

-------------------------------------------------
-- @function [parent=#f_data_manager] getCacheServerInfo
-- 保存当前服务器信息
-------------------------------------------------
function f_data_manager:getCacheServerInfo(account)
	if self.m_server_data[account] then
		return self.m_server_data[account]
	else
		return {}
	end
	
end

return f_data_manager