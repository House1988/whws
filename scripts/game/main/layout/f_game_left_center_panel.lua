--[[--
    主界面左边居中面板扩展类
--]]--

require("scripts.game.main.common.f_first_charge_popup")
require("scripts.game.main.openservicegift.f_open_service_gift_panel")

f_game_left_center_panel = class("f_game_left_center_panel")
f_game_left_center_panel.__index = f_game_left_center_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_left_center_panel.static_create()
	local leftCenterPanelTable = g_game.g_panelManager:create_panel("main_ui_left_center")
	local leftCenterPanel = leftCenterPanelTable["main_ui_left_center"]
	
	local funTable = {}
	tolua.setpeer(leftCenterPanel, funTable)
	setmetatable(funTable, f_game_left_center_panel)
	
	leftCenterPanel.m_componentTable = leftCenterPanelTable
	   
	return leftCenterPanel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_game_left_center_panel:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.LEFT_MIDDLE)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(0, 0.5))   
  	self:setPositionInContainer(cc.p(0, CONFIG_SCREEN_HEIGHT/2))
 
  	self:initAllComponent()--初始化各个组件
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_left_center_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_game_left_center_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_left_center_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] onEnter
-------------------------------------------------------------------------------
function f_game_left_center_panel:onEnter()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] onExit
-------------------------------------------------------------------------------
function f_game_left_center_panel:onExit()  
  	self:unregisterNodeEvent()
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG, self.event_updateFirstChargeFlag)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE, self.event_updateKejuXuanXiuFlag)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_REFRESH_QIANDAO_EFFECT, self.m_refreshQiandao)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_left_center_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_left_center_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] onCleanup
-------------------------------------------------------------------------------
function f_game_left_center_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_left_center_panel:initAllComponent()
	self.m_kejuAnim  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_keju"]:appendComponent(self.m_kejuAnim)
	self.m_kejuAnim:setAnchorPoint(cc.p(0.5,0))
	self.m_kejuAnim:setLoop(true)
	self.m_kejuAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_kejuAnim:setPositionInContainer(cc.p(37, 42))
	self.m_kejuAnim:setVisible(false)
	
	self.m_xuanxiuAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_xuanxiu"]:appendComponent(self.m_xuanxiuAnim)
	self.m_xuanxiuAnim:setAnchorPoint(cc.p(0.5,0))
	self.m_xuanxiuAnim:setLoop(true)
	self.m_xuanxiuAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_xuanxiuAnim:setPositionInContainer(cc.p(37, 42))
	self.m_xuanxiuAnim:setVisible(false)
	
	self.m_shouchongBoxAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_shouchong_reward"]:appendComponent(self.m_shouchongBoxAnim)
	self.m_shouchongBoxAnim:setAnchorPoint(cc.p(0.5,0))
	self.m_shouchongBoxAnim:setLoop(true)
	self.m_shouchongBoxAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1],"shouchong")
	self.m_shouchongBoxAnim:setPositionInContainer(cc.p(38, 50))
	self.m_shouchongBoxAnim:setVisible(false)
	
	self.m_shouchongAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_shouchong_reward"]:appendComponent(self.m_shouchongAnim)
	self.m_shouchongAnim:setAnchorPoint(cc.p(0.5,0))
	self.m_shouchongAnim:setLoop(true)
	self.m_shouchongAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_shouchongAnim:setPositionInContainer(cc.p(37, 42))
	self.m_shouchongAnim:setVisible(false)
	
	self.m_kaifu = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_open_service_gift"]:appendComponent(self.m_kaifu)
	self.m_kaifu:setAnchorPoint(cc.p(0.5,0))
	self.m_kaifu:setLoop(true)
	self.m_kaifu:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_kaifu:setPositionInContainer(cc.p(37, 42))
	self.m_kaifu:setVisible(false)
	
	self.m_qiandaoAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self.m_componentTable["button_qiandao"]:appendComponent(self.m_qiandaoAnim)
	self.m_qiandaoAnim:setAnchorPoint(cc.p(0.5,0))
	self.m_qiandaoAnim:setLoop(true)
	self.m_qiandaoAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_qiandaoAnim:setPositionInContainer(cc.p(37, 42))
	self.m_qiandaoAnim:setVisible(false)
	
	self.m_pos = {}
	for i = 1, 3 do
		table.insert(self.m_pos, self.m_componentTable["pos" .. i])
	end
	
	self.m_moveBtns = {self.m_componentTable["button_shouchong_reward"], self.m_componentTable["button_open_service_gift"], self.m_componentTable["button_qiandao"]}
	--首充
	local firstCharge = function()
		if g_game.g_guidelinesManager:canBtnClick("shouchong") then
			self:firstChargeLogic()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end	
	self.m_componentTable["button_shouchong_reward"]:addHandleOfcomponentEvent(firstCharge, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local keju = function()
	--新手引导有科举  不需要屏蔽
		if g_game.g_guidelinesManager:canBtnClick("keju") then
			g_game.g_utilManager:enterShop(1)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end	
	self.m_componentTable["button_keju"]:addHandleOfcomponentEvent(keju, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local qiandao = function()
	--新手引导有科举  不需要屏蔽
		if g_game.g_guidelinesManager:canBtnClick("qiandao") then
			g_game.g_userInfoManager:requestQiandaoInfo()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end	
	self.m_componentTable["button_qiandao"]:addHandleOfcomponentEvent(qiandao, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local xuanxiu = function()
	--新手引导有选秀 不需要屏蔽
		if g_game.g_guidelinesManager:canBtnClick("xuanxiu") then
--			if g_game.g_userInfoManager:getLevel() < g_game.OPEN_XUNXIU_LV then
--				local str = g_game.g_dictConfigManager:getLanTextById(434)
--				g_game.g_utilManager:showMsg(g_game.OPEN_XUNXIU_LV..str)
--			else
				g_game.g_utilManager:enterShop(2)
--			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end	
	self.m_componentTable["button_xuanxiu"]:addHandleOfcomponentEvent(xuanxiu, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	self.event_updateFirstChargeFlag = function()
		self:updateFirstChargeFlag()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REWARD_FIRST_CHARGE_FLAG, self.event_updateFirstChargeFlag)
	
	self.m_refreshQiandao = function()
		self:refreshQiandao()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_REFRESH_QIANDAO_EFFECT, self.m_refreshQiandao)
	
	self.event_updateKejuXuanXiuFlag = function()
		self:updateKejuXuanxiuFlag()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_KEJU_XUANXIU_NOTICE, self.event_updateKejuXuanXiuFlag)
	
	-- 开服有礼按钮
	self.m_componentTable["button_open_service_gift"]:setVisible(false)
	local openServiceGiftClick = function()
		--开服有礼有新手引导 不需要屏蔽
		if g_game.g_guidelinesManager:canBtnClick("kaifu") then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			local openServiceGiftPanel = g_game.g_panelManager:getUiPanel("open_service_ui")
			if openServiceGiftPanel == nil then
				local openServiceGiftPanel = f_open_service_gift_panel.static_create()
				g_game.g_panelManager:showUiPanel(openServiceGiftPanel,"open_service_ui")
			end
		end
	end
	self.m_componentTable["button_open_service_gift"]:addHandleOfcomponentEvent(openServiceGiftClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self:reorder()
end

function f_game_left_center_panel:refreshQiandao()
	local bitCal = require("scripts.game.main.shangcheng.f_bit").new()
	local rewardMask = bitCal:d2b(g_game.g_userInfoManager.m_qiandaoMask)
	local has = false
	for i = 1, g_game.g_userInfoManager.m_qiandaoDay do
		if rewardMask[i] == 0 then
			has = true
			break
		end
	end
	self.m_qiandaoAnim:setVisible(has)
end

function f_game_left_center_panel:reorder()
	local j = 1
	for i = 1, #self.m_moveBtns do
		if self.m_moveBtns[i]:isVisible() then
			local p = self.m_pos[j]:getPositionInContainer()
			self.m_moveBtns[i]:setPositionInContainer(p)
			j = j + 1
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] popUpFirstChargePanel
-------------------------------------------------------------------------------
function f_game_left_center_panel:popUpFirstChargePanel()
	
	local firstCharge = f_first_charge_popup.static_create()
    firstCharge:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(firstCharge,"public_first_charge_pop")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] firstChargeLogic
-------------------------------------------------------------------------------
function f_game_left_center_panel:firstChargeLogic()
	local flag = g_game.g_userInfoManager:getFirstChargeFlag()
	
	if flag == nil then
		return
	end
	
	if flag["result"]== 0  then
		self:popUpFirstChargePanel()
--		g_game.g_utilManager:showMsg("快快充值，领取奖励！")
	elseif  flag["result"]== 1  then
		self:popUpFirstChargePanel()
	elseif  flag["result"]== 2  then
		g_game.g_utilManager:showMsg("首冲奖励已领取")
	elseif  flag["result"]== -1  then
		g_game.g_utilManager:showMsg("查询出错")
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] updateKejuXuanxiuFlag
-- 更新 选秀  科举 免费次数
-------------------------------------------------------------------------------
function f_game_left_center_panel:updateKejuXuanxiuFlag()
	local b1 = g_game.g_userInfoManager:isShowKejuFlag()
	if b1 then
		self.m_kejuAnim:setVisible(true)
	else
		self.m_kejuAnim:setVisible(false)
	end
	
	--local b2 = g_game.g_userInfoManager:getLevel() >= g_game.OPEN_XUNXIU_LV and g_game.g_userInfoManager:isShowXuanxiuFlag()
	local b2 = g_game.g_userInfoManager:isShowXuanxiuFlag()
	if b2 then
		self.m_xuanxiuAnim:setVisible(true)
	else
		self.m_xuanxiuAnim:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] updateFirstChargeFlag
-- 更新 首次充值标志
-------------------------------------------------------------------------------
function f_game_left_center_panel:updateFirstChargeFlag()
	local flag = g_game.g_userInfoManager:getFirstChargeFlag()
	
	if flag == nil then
		return
	end
	
	if flag["result"] == 1 then
		self.m_shouchongAnim:setVisible(true)
		self.m_shouchongBoxAnim:setVisible(true)
		self.m_componentTable["button_shouchong_reward"]:setVisible(true)
	elseif flag["result"] == 0 then 
		self.m_shouchongAnim:setVisible(true)
		self.m_shouchongBoxAnim:setVisible(true)
		self.m_componentTable["button_shouchong_reward"]:setVisible(true)
	elseif flag["result"] == 2 then
		self.m_shouchongAnim:setVisible(false)
		self.m_shouchongBoxAnim:setVisible(false)
		self.m_componentTable["button_shouchong_reward"]:setVisible(false)
	end
	self:reorder()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_left_center_panel] setOpenServiceGiftButton
-- 设置开服有礼奖励按钮显示状态
-------------------------------------------------------------------------------
function f_game_left_center_panel:setOpenServiceGiftButton(isVisible, hasUnreceiveReward)
	self.m_componentTable["button_open_service_gift"]:setVisible(isVisible)
	self.m_kaifu:setVisible(hasUnreceiveReward)
	self:reorder()
end
