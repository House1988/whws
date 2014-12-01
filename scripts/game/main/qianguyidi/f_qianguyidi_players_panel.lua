require("scripts.game.main.qianguyidi.f_qianguyidi_player_flag")
--[[
	玩家界面  
]]--

local f_qianguyidi_players_panel = class("f_qianguyidi_players_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_qianguyidi_players_panel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:ctor()
    self:registerNodeEvent()   
    self.m_selectFlagData = nil
    
    self.m_userPvpData = nil
    
    self.m_pvp_page_item_count	= 6
    self.m_pvp_pages_count		= 3
    self.m_current_pvp_page		= 1
    
    self.m_move_animation_time	= 0.5
    
    self.m_pvp_item_array		= {}
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] initComponent
-- 初始化组件
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:initComponent()  

end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] getFirstPlayer
-- 新手指引，获取一个可挑战玩家
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:getFirstPlayer()   
	return self.m_pvp_item_array[#self.m_pvp_item_array]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:onEnter()   
	self:initComponent()
	
	--更新玩家的阵容数据
	self.event_updatePlayerZhenrong = function()
		self:showPlayerDetail()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PLAYER_ZHENRONG, self.event_updatePlayerZhenrong)
	
	self.event_updatePvpErrorMessage = function()
		self:showErrorMessage()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_ERROR_MSG, self.event_updatePvpErrorMessage)
	
	
	self:loadPvpData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] showErrorMessage
-- 错误消息
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:showErrorMessage()
	local errorReason = g_game.g_userInfoManager:getPvpErrorMessage()
	local errorMsgType = nil
	
	if errorReason["result"] == 1 then
		errorMsgType = g_game.g_f_error_msg_def.F_LUA_ERROR_ENEMY_RANK_CHANGED
	elseif errorReason["result"] == 2 then
		errorMsgType = g_game.g_f_error_msg_def.F_LUA_ERROR_MILITARY_NOT_ENOUGH
	elseif errorReason["result"] == 3 then
		errorMsgType = g_game.g_f_error_msg_def.F_LUA_ERROR_USER_DATA_ERROR
	elseif errorReason["result"] == 4 then
		errorMsgType = g_game.g_f_error_msg_def.F_LUA_ERROR_USER_CHALLENGE_NUM_ZERO
	end
	
	local refresh = function()
		g_game.g_userInfoManager:requestUserPvpPlayerList()
		g_game.g_panelManager:removeUiPanel("notice_popup_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	end
	
	g_game.g_utilManager:showPublicMessagePanel(errorMsgType, refresh)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] nextPvpData
-- 下一页pvp数据
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:nextPvpData()
	if self.m_current_pvp_page == self.m_pvp_pages_count then
		return false
	end
    self.m_current_pvp_page		= self.m_current_pvp_page + 1
    if self.m_current_pvp_page > self.m_pvp_pages_count then
    	self.m_current_pvp_page = self.m_pvp_pages_count
    end
    
    self:refershPage(false)

	return true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] prePvpData
-- 上一页pvp数据
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:prePvpData()
	if self.m_current_pvp_page == 1 then
		return false
	end
    self.m_current_pvp_page		= self.m_current_pvp_page - 1
    if self.m_current_pvp_page < 1 then
    	self.m_current_pvp_page = 1
    end    
    self:refershPage(false)
	return true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] loadPvpData
-- 加载pvp对手玩家数据
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:loadPvpData()	
	self.m_userPvpData = g_game.g_userInfoManager:getUserPvpRank()
    self.m_current_pvp_page		= 1
    
    self:refershPage(true)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] pageDataEnter
-- 用户数据进入界面
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:pageDataEnter()
	local size = self:getSize()
	if self.m_current_pvp_page == 1 then
		local num = self.m_userPvpData["challengeList_Num"]
		local data = self.m_userPvpData["challengeList"]
		local colNum = 2
		for i = 1, num do
			local playerFlag = f_qianguyidi_player_flag.static_create()
			playerFlag:panelInitBeforePopup()
			playerFlag:setSize(cc.size(215,393))
			self:appendComponent(playerFlag)
			playerFlag:setAnchorPoint(cc.p(0.5,0))
			playerFlag:setFlagData(data[i])
			
			local rowIndex = math.floor((i-1)/colNum) 
			local colIndex = g_game.g_utilManager:getModValue((i-1), colNum) 
			
			local clickCallBack = function(flagData)
				self:sendRequestPlayerDataMsg(flagData)
			end
			playerFlag:setClickCallBack(clickCallBack)
			
			if colIndex == 0 then
				playerFlag:setPositionInContainer(cc.p(size.width/2 +130+ rowIndex*105, 70+rowIndex*70))
				
				local posX = playerFlag:getPositionX()
				playerFlag:setPositionX(posX + CONFIG_SCREEN_WIDTH/2)
				
				playerFlag:runAction(cc.EaseBounceOut:create(cc.MoveBy:create(self.m_move_animation_time, cc.p(-CONFIG_SCREEN_WIDTH/2, 0))))
				
			else
				playerFlag:setPositionInContainer(cc.p(size.width/2 -130- rowIndex*105, 70+rowIndex*70))
					
				local posX = playerFlag:getPositionX()
				playerFlag:setPositionX(posX - CONFIG_SCREEN_WIDTH/2)
				
				playerFlag:runAction(cc.EaseBounceOut:create(cc.MoveBy:create(self.m_move_animation_time, cc.p(CONFIG_SCREEN_WIDTH/2,0))))
			end
			
			playerFlag:setScale(0.5+0.25*rowIndex)
			
			table.insert(self.m_pvp_item_array, playerFlag)
			
		end
	else
		local num = self.m_userPvpData["topTen_Num"]
		local data = self.m_userPvpData["topTen"]
		local colNum = 2
		
		local startIndex = (3 - self.m_current_pvp_page) * self.m_pvp_page_item_count + 1
		local endIndex = startIndex + self.m_pvp_page_item_count - 1
		
		local j = 1
		for i = startIndex, endIndex do
			if i <= num then
				local playerFlag = f_qianguyidi_player_flag.static_create()
				playerFlag:panelInitBeforePopup()
				playerFlag:setSize(cc.size(215,393))
				self:appendComponent(playerFlag)
				playerFlag:setAnchorPoint(cc.p(0.5,0))
				playerFlag:setFlagData(data[i])
				
				local rowIndex = math.floor((j-1)/colNum) 
				local colIndex = g_game.g_utilManager:getModValue((j-1), colNum) 
				
				local clickCallBack = function(flagData)
					self:sendRequestPlayerDataMsg(flagData)
				end
				playerFlag:setClickCallBack(clickCallBack)
				
				if colIndex == 0 then
					playerFlag:setPositionInContainer(cc.p(size.width/2 +130+ rowIndex*105, 70+rowIndex*70))
				
					local posX = playerFlag:getPositionX()
					playerFlag:setPositionX(posX + CONFIG_SCREEN_WIDTH/2)
					
					playerFlag:runAction(cc.EaseBounceOut:create(cc.MoveBy:create(self.m_move_animation_time, cc.p(-CONFIG_SCREEN_WIDTH/2,0))))
				else
					playerFlag:setPositionInContainer(cc.p(size.width/2 -130- rowIndex*105, 70+rowIndex*70))
					
					local posX = playerFlag:getPositionX()
					playerFlag:setPositionX(posX - CONFIG_SCREEN_WIDTH/2)
					
					playerFlag:runAction(cc.EaseBounceOut:create(cc.MoveBy:create(self.m_move_animation_time, cc.p(CONFIG_SCREEN_WIDTH/2,0))))
				end
				
				playerFlag:setScale(0.5+0.25*rowIndex)
				
				table.insert(self.m_pvp_item_array, playerFlag)
			end			
			j = j+1
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] refershPage
-- 刷新页面数据
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:refershPage(isFirst)
	for i = 1, #self.m_pvp_item_array do
		local item = self.m_pvp_item_array[i]
		local posX = item:getPositionX()
		local posY = item:getPositionY()
		
		local deleteCallback = function()
			self:deleteComponent(item)
		end
		
		local move = nil
		if posX < CONFIG_SCREEN_WIDTH/2 then
			move = cc.MoveBy:create(self.m_move_animation_time, cc.p(-CONFIG_SCREEN_WIDTH/2, 0))
		else
			move = cc.MoveBy:create(self.m_move_animation_time, cc.p(CONFIG_SCREEN_WIDTH/2, 0))
		end
		local action = g_game.g_transition.sequence({move, cc.CallFunc:create(deleteCallback)})
		item:runAction(action)
	end
	self.m_pvp_item_array = {}
	
	
	local loadPage = function()
		self:pageDataEnter()
	end
	if isFirst then
		self:pageDataEnter()
	else
		local action = g_game.g_transition.sequence({cc.DelayTime:create(self.m_move_animation_time*2), cc.CallFunc:create(loadPage)})
		self:runAction(action)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] showPlayerDetail
-- 查看对手详情
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:showPlayerDetail()
	local popupPlayerDetail = require("scripts.game.main.common.f_common_popup_notice").new()	
	g_game.g_panelManager:showUiPanel(popupPlayerDetail,"notice_popup_panel")
	
	popupPlayerDetail:setNoticeExtraData(self.m_selectFlagData)
	--24 stand for 对手详情面板
	popupPlayerDetail:popUpNotice(26)
	--1 stand for scale action
	popupPlayerDetail:setActionType(1)
	
	local yesEvent = function()
		self:sendPvpMessage()
	end
	popupPlayerDetail:setYesCallBack(yesEvent)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] sendPvpMessage
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:sendPvpMessage()
	local userRankData = g_game.g_userInfoManager:getUserPvpRank()
	if userRankData["military"] < g_game.MAX_CHALLENGE_REDUCE_MILLITARY then
		g_game.g_utilManager:popupQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_MILITARY)
		return
	end
	
	if userRankData["challengeNum"] <= 0  then
		g_game.g_utilManager:popupQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_PVP_CHALLENGE_COUNT)
--		g_game.g_utilManager:showMsg("挑战次数不足")
		return
	end
	
	local challengedId = self.m_selectFlagData["id"]
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_userInfoManager:requestPvpMessage(challengedId)	
	g_game.g_userInfoManager:requestRecoverTime()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] sendRequestPlayerDataMsg
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:sendRequestPlayerDataMsg(flagData)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	self.m_selectFlagData = flagData
	g_game.g_userInfoManager:requestPvpPlayerZhenrong(flagData["id"])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] onExit
-- exit
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:onExit()    
    self:unregisterNodeEvent()
    
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PLAYER_ZHENRONG, self.event_updatePlayerZhenrong)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVP_ERROR_MSG, self.event_updatePvpErrorMessage)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:registerNodeEvent(handler)
    if not handler then
        handler = function(event)
                      if event == "enter" then
                          self:onEnter()
                      elseif event == "exit" then
                          self:onExit()
                      elseif event == "enterTransitionFinish" then
                          self:onEnterTransitionFinish()
                      elseif event == "exitTransitionStart" then
                          self:onExitTransitionStart()
                      elseif event == "cleanup" then
                          self:onCleanup()
                      end
                  end
    end
    self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_players_panel] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_players_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_qianguyidi_players_panel