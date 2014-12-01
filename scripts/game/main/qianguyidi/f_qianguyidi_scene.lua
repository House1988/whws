require("scripts.auto.auto_qgyd_main")
require("scripts.game.main.qianguyidi.f_qianguyidi_exchange")

--[[--
   千古一帝 界面
--]]--

f_qianguyidi_scene = class("f_qianguyidi_scene")
f_qianguyidi_scene.__index = f_qianguyidi_scene


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_qianguyidi_scene.static_create()
	local qianguyidi_table = createqgyd_main()
	local qianguyidi_panel = qianguyidi_table["qgyd_main"]
	 
	local funTable = {}
	tolua.setpeer(qianguyidi_panel, funTable)
	setmetatable(funTable, f_qianguyidi_scene)
	
	qianguyidi_panel.m_componentTable = qianguyidi_table
	return qianguyidi_panel  
end



-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_qianguyidi_scene:panelInitBeforePopup()
	self:registerNodeEvent()	
	
	
    self.m_forward_flag			= nil
    self.m_backward_flag		= nil
    
    self.m_next_callback		= nil
    self.m_pre_callback			= nil
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] registerNodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_qianguyidi_scene] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] onEnter
-------------------------------------------------------------------------------
function f_qianguyidi_scene:onEnter()  
	self.m_shouldOpen = false 
	self:initAllComponent()
	self.event_updateData  = function()
		self:updateCall()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateData)
	
	self.event_gotoExchange = function()
		if self.m_shouldOpen then
			self.m_shouldOpen = false
			self:gotoExchange()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END, self.event_gotoExchange)
	
	
	self.event_updateUserInfo2 = function()
		self:updateUseItem()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_updateUserInfo2)
	
	self.m_liangcaoAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_liangcaoAnim:setup(self.m_componentTable["qgyd_xinggongli_num_label"], 21, "%d", false, false)
	self.m_componentTable["qgyd_main"]:appendComponent(self.m_liangcaoAnim)
	local p = self.m_componentTable["qgyd_xinggongli_num_label"]:getPositionInContainer()
	self.m_liangcaoAnim:setPositionInContainer(p)
	self.m_liangcaoAnim:setLastValue(g_game.g_userInfoManager.m_user_info["military"])
end

function f_qianguyidi_scene:updateUseItem()
	local userRankData = g_game.g_userInfoManager:getUserPvpRank()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userRankData["military"] = userInfo["military"]
	self.m_componentTable["qgyd_xinggongli_num_label"]:setString(userRankData["military"])
	
	local curChallengeNum = userInfo["challengeNum"]
	local curMaxChallengeNum = g_game.MAX_CHALLENGE_NUM
	self.m_componentTable["qgyd_tiaozhan_num_label"]:setString(curChallengeNum.."/"..curMaxChallengeNum)
		
	self.m_liangcaoAnim:playWhenLarger(g_game.g_userInfoManager.m_user_info["military"], 0.8)
end


function f_qianguyidi_scene:updateCall()
	local recoverData = g_game.g_userInfoManager:getRecoverData()

	local junling = recoverData["military"]
	self.m_componentTable["qgyd_xinggongli_num_label"]:setString(junling)

	local userContributeNum = recoverData["contribution"]
	self.m_componentTable["qgyd_gongji_num_label"]:setString(userContributeNum)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] onExit
-------------------------------------------------------------------------------
function f_qianguyidi_scene:onExit()  
  self:unregisterNodeEvent()
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_DATA, self.event_updateData) 
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_RECOVER_TIME_END, self.event_gotoExchange)
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CONTRIBUTE, self.event_updateContributeCallback) 
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI, self.event_updateGongjizhi)	
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO, self.event_updateUserInfo2)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_qianguyidi_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_qianguyidi_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] onCleanup
-------------------------------------------------------------------------------
function f_qianguyidi_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] setJiantouCallback
-- 设置点击箭头回调
-------------------------------------------------------------------------------
function f_qianguyidi_scene:setJiantouCallback(next, pre)
    self.m_next_callback	= next
    self.m_pre_callback		= pre
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] updateFlag
-- 设置显示箭头是否显示
-------------------------------------------------------------------------------
function f_qianguyidi_scene:updateFlag(currentPage)
	self.m_forward_flag:setVisible(currentPage < 3)
	self.m_backward_flag:setVisible(currentPage > 1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] showForwardFlag
-- 设置显示箭头是否显示
-------------------------------------------------------------------------------
function f_qianguyidi_scene:showForwardFlag(isShow)
	if self.m_forward_flag then
		self.m_forward_flag:setVisible(isShow)
	end
end
-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] showBackwardFlag
-- 设置显示箭头是否显示
-------------------------------------------------------------------------------
function f_qianguyidi_scene:showBackwardFlag(isShow)
	if self.m_backward_flag then
		self.m_backward_flag:setVisible(isShow)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_qianguyidi_scene:initAllComponent()	
	self.m_componentTable["qgyd_bg_image"]:setImage(g_game.g_resourceManager:getUiMap("paihangbangbeijing"))
	self.m_componentTable["qgyd_bg_image"]:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self.m_componentTable["qgyd_bg_image"]:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	

	self.m_componentTable["qgyd_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)	
	
	self:updateUserPvpData()
	--关闭当前按钮
	local closeCurrentPanel = function()
		g_game.g_dataManager:saveBattleState(0,0)
		g_game.g_panelManager:removeUiPanel("qgyd_bottom")	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["qgyd_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--兑换功绩值
	local exchangeContribute = function()
		self:popupContributePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["qgyd_duihuan_button"]:addHandleOfcomponentEvent(exchangeContribute,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--注册监听函数 每10分钟 刷新功绩值
	self.event_updateContributeCallback = function()
		self:updateContributeCallBack()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CONTRIBUTE, self.event_updateContributeCallback)	
	
	--注册监听函数 功绩值修改后的刷新功绩值
	self.event_updateGongjizhi = function()
		self:updateUserPvpData()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_GONGJIZHI, self.event_updateGongjizhi)
	
	local size = self:getSize()
	
	self.m_forward_flag = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
	self:appendComponent(self.m_forward_flag)
	self.m_forward_flag:setVisible(true)
	self.m_forward_flag:setSize(cc.size(100, 100))
	self.m_forward_flag:setAnchorPoint(cc.p(0.5,1))
	self.m_forward_flag:setPositionInContainer(cc.p(size["width"]/2, 320))	
	self.m_forward_flag:setLoop(true)	
	--self.m_forward_flag:setAnimationScale(0.5)
	self.m_forward_flag:setAnimationSpeedScale(0.3)
	self.m_forward_flag:setAnimationPosition(cc.p(50, 0))
	self.m_forward_flag:setTouchEnabled(true)
	self.m_forward_flag:runAnimation(g_game.g_f_main_ui_effect.QIANGUYIDI_JIANTOU[2], g_game.g_f_main_ui_effect.QIANGUYIDI_JIANTOU[4])

	
	local next = function()
		if self.m_next_callback then
			self.m_next_callback()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_forward_flag:addHandleOfcomponentEvent(next,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	self.m_backward_flag = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
	self:appendComponent(self.m_backward_flag)
	self.m_backward_flag:setVisible(true)
	self.m_backward_flag:setSize(cc.size(150, 100))
	self.m_backward_flag:setAnchorPoint(cc.p(0.5,1))
	self.m_backward_flag:setPositionInContainer(cc.p(size["width"]/2, 433))	
	self.m_backward_flag:setLoop(true)	
	--self.m_backward_flag:setAnimationScale(0.5)
	self.m_backward_flag:setAnimationSpeedScale(0.3)
	self.m_backward_flag:setAnimationPosition(cc.p(75, 100))
	self.m_backward_flag:setTouchEnabled(true)
	self.m_backward_flag:runAnimation(g_game.g_f_main_ui_effect.QIANGUYIDI_JIANTOU[2], g_game.g_f_main_ui_effect.QIANGUYIDI_JIANTOU[3])

	
	local pre = function()
		if self.m_pre_callback then
			self.m_pre_callback()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_backward_flag:addHandleOfcomponentEvent(pre,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self:updateFlag(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] updateContributeCallBack
-- 没10分钟的 刷新回调
-------------------------------------------------------------------------------
function f_qianguyidi_scene:updateContributeCallBack()
	local updateAtribute = g_game.g_userInfoManager:getUpdateContribute()
	
	self.m_componentTable["qgyd_paiming_num_label"]:setString(updateAtribute["rank"])
	
	local userContributeNum = updateAtribute["contribution"]
	self.m_componentTable["qgyd_gongji_num_label"]:setString(userContributeNum)
	
	local userHoldRankContributeNum = g_game.g_dictConfigManager:getContributeNumByRank(updateAtribute["rank"])
	self.m_componentTable["qgyd_baochi_num_label"]:setString(userHoldRankContributeNum)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] updateUserPvpData
-- 更新user的 pvp 数据
-------------------------------------------------------------------------------
function f_qianguyidi_scene:updateUserPvpData()
	local userRankData = g_game.g_userInfoManager:getUserPvpRank()
	--user 当前行动力
	local curActionNum = userRankData["military"]
	self.m_componentTable["qgyd_xinggongli_num_label"]:setString(curActionNum)
	
	local curChallengeNum = userRankData["challengeNum"]
	local curMaxChallengeNum = g_game.MAX_CHALLENGE_NUM
	self.m_componentTable["qgyd_tiaozhan_num_label"]:setString(curChallengeNum.."/"..curMaxChallengeNum)
	
	--userRank 
	self.m_componentTable["qgyd_paiming_num_label"]:setString(userRankData["selfRank"])
	
	--user 功绩值
	local userContributeNum = userRankData["contribution"]
	self.m_componentTable["qgyd_gongji_num_label"]:setString(userContributeNum)
	
	--user 功绩值刷新值
	local userHoldRankContributeNum = g_game.g_dictConfigManager:getContributeNumByRank(userRankData["selfRank"])
	self.m_componentTable["qgyd_baochi_num_label"]:setString(userHoldRankContributeNum)
	
end

function f_qianguyidi_scene:gotoExchange()
	local panel = g_game.g_panelManager:getUiPanel("qgyd_gongjizhiduihuan")
	if panel  ~= nil then
		return
	end
	local exchangeContribute = f_qianguyidi_exchange.static_create()
	exchangeContribute:panelInitBeforePopup()
	exchangeContribute:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(exchangeContribute,"qgyd_gongjizhiduihuan")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_scene] popupContributePanel
-- 弹出功绩值兑换
-------------------------------------------------------------------------------
function f_qianguyidi_scene:popupContributePanel()
	g_game.g_userInfoManager:requestRecoverTime()
	self.m_shouldOpen = true
end