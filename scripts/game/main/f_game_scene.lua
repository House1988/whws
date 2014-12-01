require ("scripts.manager.fluapanelmanager")
require ("scripts.game.main.gonggao.f_gonggao_panel")

local f_game_scene = class("f_game_scene", function()
    return g_game.g_classFactory.newFLuaScene("f_game_scene")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_scene:ctor()  
  self:registerNodeEvent()
  
  self.m_game_map = nil
  g_game.m_isLoadFinish = false 

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_game_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_game_scene] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_game_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] onEnter
-------------------------------------------------------------------------------
function f_game_scene:onEnter()	
	g_game.m_isLoadFinish	= false
	g_game.g_game_is_init = true
	g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui0"))
	g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui1"))
	g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui2"))
	
	g_game.g_panelManager:resetAllPanelConfig()
	
	self:config_layer()
	g_game.g_panelManager:createPanelContainer()
	  
	self.m_game_map = require("scripts.game.main.map.f_game_map").new()
	self.m_game_map:layout_in_parent()
	self.m_game_map:loadMap()
	self.m_game_map:loadNpc()
	self.m_game_map:loadBuilding()

	self.m_layout_manager = require("scripts.game.main.f_game_layout_manager")
	self.m_layout_manager:initLayout() 
	
	g_game.g_guidelinesManager:initComponent()
	g_game.g_secondGuidelinesManager:initComponent()
	
	self.receiveGonggao = function()
		 local gonggao = f_gonggao_panel.static_create()
		 gonggao:panelInitBeforePopup()
		 g_game.g_panelManager:showUiPanel(gonggao, "gonggao_panel")
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_RECEIVE_GONG_GAO, self.receiveGonggao)
	
	self.receiveFirstPingSuccess = function()
		self:updateLoginServerTime()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_STEADY_ACTIVITY, self.receiveFirstPingSuccess)
	
	self:requestPrepareMsg()
	--发送播放主场景音乐事件
	g_game.g_utilManager:setUserSettings()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLEAR_LOADING_FLAG)
	
	local type = g_game.g_utilManager:getGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE)
	if type ~= 0 then
		g_game.g_dataManager:saveBattleState(0,0)
		self:gotoUi(type)
	else
		if g_game.g_utilManager:allGuidelinesIsFinish() then
			self:jumpToPreUi()
		end	
	end	
	
	if g_game.g_utilManager:allGuidelinesIsFinish() then
		self.m_game_map:setTouchEnabled(true)
	else
		self.m_game_map:setTouchEnabled(false)
	end
	g_game.g_recoverManager:startTimer(true)
	
		
--	if g_game.g_utilManager:allGuidelinesIsFinish() and not g_game.g_gameManager:hasShowGongGao() and not g_game.g_panelManager:hasAnyPanel() then
--		g_game.g_gameManager:showGongGao()
--		g_game.g_userInfoManager:requestGonggao()
--	end
	
	g_game.g_gameManager:addUpdateObj(self)
	
	--新手指引跳转事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE3)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE4)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE5)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE6)
	
	g_game.m_isLoadFinish  = true
	g_game.g_utilManager:resetMovingMsg()
	
	
	--接收充值结果
	self.getProductsListFromGameServer= function(msg)
		self:responseProductsIdFromGameServer(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_SHOP_ITEM_LIST,self.getProductsListFromGameServer)
	
	if DEBUG_SDK_TYPE == 1 then
		if g_game.g_iap_manager == nil then
			g_game.g_iap_manager = require("scripts.manager.f_ios_iap_manager").new()
		end
		
		self:requestProductsIdFromGameServer()
	elseif DEBUG_SDK_TYPE == 14 then
		if g_game.g_iap_manager == nil then
			g_game.g_iap_manager = require("scripts.manager.f_ios_taiwan_iap_manager").new()
		end
		
		self:requestProductsIdFromGameServer()
	end
	
	--检查本地缓存的订单	
	send_lua_event(g_game.g_f_lua_game_event.F_IAP_CHECK_NATIVE_PAY)
	
	if not g_game.g_userInfoManager.m_shouldOpenHuodong then
		g_game.g_userInfoManager:requestHuodongList()
		g_game.g_userInfoManager:requestQiandaoInfo()
	else
		g_game.g_userInfoManager:updateHuodongFlag()
	end
	
	--注册监听函数
	self.event_server_start_reward_state = function()
		local infoTable = g_game.g_userInfoManager:getServerStartRewardInfo()
		if infoTable ~= nil then
			self:setServerStartRewardBtnVisible(infoTable["hasReward"], infoTable["hasUnreceiveReward"])
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_SERVER_START_REWARD_BUTTON_STATE, self.event_server_start_reward_state)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SERVER_START_REWARD_BUTTON_STATE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] updateLoginServerTime
-- 获取服务器时间后事件
-------------------------------------------------------------------------------
function f_game_scene:updateLoginServerTime()
	local curTime = g_game.g_gameManager:getCurrentTime()
	local t = os.date("*t",curTime)
	local time = t["hour"] * 3600 + t["min"] * 60 + t["sec"]
	local wuguTime = 0
	if t["hour"] < 12 then
		wuguTime = 43200
	elseif t["hour"] < 14 then
		wuguTime = 50400
	elseif t["hour"] < 18 then
		wuguTime = 64800
	elseif t["hour"] < 20 then
		wuguTime = 72000
	else
		wuguTime = 129600
	end
	wuguTime = wuguTime - time
	g_game.g_recoverManager:setSteadyActivityTimer("wugu", wuguTime,g_game.g_f_lua_game_event.F_LUA_UPDATE_STEADY_ACTIVITY)
	
	g_game.g_utilManager:reCalculateWorldBoss()
	
	g_game.g_userInfoManager:updateHuodongFlag()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] gotoUi
-------------------------------------------------------------------------------
function f_game_scene:gotoUi(type)
	if type == g_game.F_BACK_TOUI_OFFICER then --打开名臣
		local m_paibing_huangzi_panel = f_card_paibing_huangzi.static_create()
   		m_paibing_huangzi_panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(m_paibing_huangzi_panel,"paibinghuangzi_top")
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_BEAUTY then--打开美女
		local beautyPalace = f_game_beauty_main.static_create()
		beautyPalace:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_PRINCE then--打开 皇子
		local m_paibing_huangzi_panel = f_card_paibing_huangzi.static_create()
   		m_paibing_huangzi_panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(m_paibing_huangzi_panel,"paibinghuangzi_top")
		
		m_paibing_huangzi_panel:setPanelIndex(2)
		m_paibing_huangzi_panel:updatePagePanel()
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_KEJU then--打开科举
		g_game.g_utilManager:enterShop(1)
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_BINGFA then
		g_game.g_userInfoManager:requestBingfaPiece()
		g_game.g_panelManager:removeUiPanel("main_popup")
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_LUEDUO then
		--掠夺界面 之后要有兵法
		g_game.g_userInfoManager:requestBingfaPiece()
		g_game.g_panelManager:removeUiPanel("main_popup")
--		g_game.g_userInfoManager:showLueduo(false, nil)

	elseif type == g_game.F_BACK_TOUI_ZHUANGBEI then
		local equipPanel = f_game_equip_bag_panel.static_create()
	    equipPanel:panelInitBeforePopup(0, false)
		g_game.g_panelManager:showUiPanel(equipPanel,"user_equip_bag_panel")
		equipPanel.m_panelIndex = 1
		equipPanel:updatePagePanel()
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_MAIL then
		require("scripts.game.main.mail.f_mail_panel")
		local mail = f_mail_panel.static_create()
		mail:panelInitBeforePopup(2, g_game.g_userInfoManager.m_mailPage)
		g_game.g_panelManager:showUiPanel(mail, "mail_panel")
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	elseif type == g_game.F_BACK_TOUI_WORLD_BOSS then
		require("scripts.game.main.reward.f_reward_panel")
		local reward = f_reward_panel.static_create()
		reward:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(reward, "reward_panel")
		reward:clickRadioBtn("worldboss")
		
		g_game.g_utilManager:setGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE,0)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] jumpToPreUi
-------------------------------------------------------------------------------
function f_game_scene:jumpToPreUi()
	local isBackPveUi,isBackPvpUi = g_game.g_dataManager:getBattleState()
	
	if isBackPveUi == 1 then
		local areaId,stageId,levelId = g_game.g_dataManager:getPveProgress()
		
		local hasFinishStage = g_game.g_dictConfigManager:getLastLevelOfStage(stageId) == levelId and g_game.g_userInfoManager.m_isFirstFight and g_game.g_userInfoManager.m_isPveWin
		local hasFinishArea = stageId % 5 == 0 and hasFinishStage
		
		local stageChapter = f_stage_chapters.static_create()
	    stageChapter:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(stageChapter,"nanzhengbeitao_title")
		stageChapter:updateLastChapterFromServer()
		
		if hasFinishArea then
			g_game.g_dataManager:saveBattleState(0,0)
			return
		end
		
		local bigBattlePanel = f_stage_big_battle_panel.static_create()
		bigBattlePanel:panelInitBeforePopup()    
		g_game.g_panelManager:showUiPanel(bigBattlePanel,"zhanyi_ditu_bg")	
		bigBattlePanel:setChapterId(areaId)
		bigBattlePanel:updateLastBigBattleFromServer()
		
--		if hasFinishStage then
--			g_game.g_dataManager:saveBattleState(0,0)
--			return
--		end
		
		local smallBattlePanel = f_stage_small_battle_panel.static_create()
		smallBattlePanel:panelInitBeforePopup()    
		g_game.g_panelManager:showUiPanel(smallBattlePanel,"zhanyi_waikuang")	
		smallBattlePanel:setSmallBattleData(areaId,stageId)
		smallBattlePanel:updateLastSmallBattleFromServer()
		
	end
	
	if isBackPvpUi == 1 then		
		local pvpBottom = require("scripts.game.main.qianguyidi.f_qianguyidi_main").new()
		g_game.g_panelManager:showUiPanel(pvpBottom,"qgyd_bottom")
	end
	if isBackPveUi == 2 then
		g_game.g_dataManager:saveBattleState(0,0)
	end
	
	if isBackPveUi == 3 then
		local chapterId ,eliteStageId =  g_game.g_dataManager:getElitePveProgress()
		
		local stageChapter = f_stage_chapters.static_create()
	    stageChapter:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(stageChapter,"nanzhengbeitao_title")
		stageChapter:updateLastEliteChapterFromServer()
		
		local eliteStage = f_stage_elite_stage.static_create()
	    eliteStage:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(eliteStage,"elite_stage")
		eliteStage:setChapterId(chapterId)
	end
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] requestPrepareMsg
-------------------------------------------------------------------------------
function f_game_scene:requestPrepareMsg()
	local equipPositionData = g_game.g_userInfoManager:getEquipmentData()
	local combiData = g_game.g_userInfoManager:getUserCombination()
	local princeData = g_game.g_userInfoManager:getPrinceData()
	local firstChargeFlag = g_game.g_userInfoManager:getFirstChargeFlag()
	if equipPositionData == nil then
		g_game.g_userInfoManager:requestEquipmentList()
	end
	if combiData == nil then
		g_game.g_userInfoManager:requestUserCombination()
	end
	if princeData == nil then
		g_game.g_userInfoManager:requestPrinceList()
	end
	g_game.g_userInfoManager:requestFirstChargeFlag()
	--登录初始化先请求一遍服务器时间  检测是否有定点活动
	g_game.g_gameManager:sendPingToServer()

	-- 开服有礼活动
--	local userInfo = g_game.g_userInfoManager:getUserInfo()
--	local sendMsg = {["roleId"] = userInfo["roleId"]}
--	g_game.g_netManager:send_message(g_network_message_type.CS_GET_SERVER_START_REWARD, sendMsg)
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] update
-------------------------------------------------------------------------------
function f_game_scene:update(dt)
	if not g_game.g_gameManager:hasShowGongGao() and g_game.g_utilManager:allGuidelinesIsFinish() and not g_game.g_panelManager:hasAnyPanel() then
		g_game.g_gameManager:showGongGao()
		g_game.g_userInfoManager:requestGonggao()
	end
	if g_game.g_userInfoManager.m_shouldGotoUI then
		local type = g_game.g_utilManager:getGameFlag(g_game.g_f_game_flag.F_LUA_GAME_BATTLE_TO_MAINUI_TYPE)
		self:gotoUi(type)
		g_game.g_userInfoManager.m_shouldGotoUI = false
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] onExit
-------------------------------------------------------------------------------
function f_game_scene:onExit()  
	self:unregisterNodeEvent()
	g_game.g_netManager:removeMessage(g_network_message_type.SC_SHOP_ITEM_LIST,self.getProductsListFromGameServer)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_STEADY_ACTIVITY, self.receiveFirstPingSuccess)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_RECEIVE_GONG_GAO, self.receiveGonggao)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_SERVER_START_REWARD_BUTTON_STATE, self.event_server_start_reward_state)
    g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] onCleanup
-------------------------------------------------------------------------------
function f_game_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] registerServerMessage
-------------------------------------------------------------------------------
function f_game_scene:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] unregisterServerMessage
-------------------------------------------------------------------------------
function f_game_scene:unregisterServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] getGameMap
-- 获取游戏地图层
-------------------------------------------------------------------------------
function f_game_scene:getGameMap()
	return self.m_game_map
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_scene] setServerStartRewardBtnVisible
-------------------------------------------------------------------------------
function f_game_scene:setServerStartRewardBtnVisible(isVisible, hasUnreceiveReward)
	self.m_layout_manager.layout_left_center:setOpenServiceGiftButton(isVisible, hasUnreceiveReward)
end



-------------------------------------------------------------------------------
--用于付费产品请求列表
-------------------------------------------------
-- @function [parent=#f_game_scene] requestProductsIdFromGameServer
-- 从游戏服务器请求iap产品id数组
-------------------------------------------------
function f_game_scene:requestProductsIdFromGameServer()	
	--loading状态，加载服务器产品列表，并从apple server获取产品信息
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local dataT = {}
	dataT["roleId"] = userInfo["roleId"]
	g_game.g_netManager:send_message(g_network_message_type.CS_GET_SHOP_ITEM, dataT)
end


-------------------------------------------------
-- @function [parent=#f_game_scene] responseProductsIdFromGameServer
-- 从游戏服务器接收iap产品id数组
-------------------------------------------------
function f_game_scene:responseProductsIdFromGameServer(msg)	
	send_lua_event_param(g_game.g_f_lua_game_event.F_IAP_PRODUCLIST_LOAD, msg["itemList"])	
end


return f_game_scene
