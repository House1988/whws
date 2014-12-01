require("scripts.auto.auto_xunfang")
require("scripts.auto.auto_hougong_tishi")
require("scripts.game.main.bingfa.f_xunfang_rewardDetial")

--[[--
邮件面板
--]]--

f_xunfang_panel = class("f_xunfang_panel")
f_xunfang_panel.__index = f_xunfang_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_xunfang_panel.static_create()
	local mailTable = createxunfang()
	local mail = mailTable["xunfang"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_xunfang_panel)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_xunfang_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_componentTable["close"]:setTouchRectAdjust(g_game.RECT_OFFSET)

	local close = function()
		if self.m_isPlaying then
			return
		end
		g_game.g_panelManager:removeUiPanel("xunfang_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click1 = function()
		self:onClick(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn1"]:addHandleOfcomponentEvent(click1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click2 = function()
		self:onClick(2)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn2"]:addHandleOfcomponentEvent(click2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local click3 = function()
		self:onClick(3)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn3"]:addHandleOfcomponentEvent(click3,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local onClickDetial1 = function()
		self:onClickDetial(1)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["detialBtn1"]:addHandleOfcomponentEvent(onClickDetial1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local onClickDetial2 = function()
		self:onClickDetial(2)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["detialBtn2"]:addHandleOfcomponentEvent(onClickDetial2,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local onClickDetial3 = function()
		self:onClickDetial(3)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["detialBtn3"]:addHandleOfcomponentEvent(onClickDetial3,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_items = {7, 19, 20}
	self.m_cost = {10, 48, 288}
	self.m_images = {"wufusifang_shijing.png", "wufusifang_gusha.png", "wufusifang_xianshan.png"}
	self:updateDisplay()
end

function f_xunfang_panel:onClickDetial(index)
	if self.m_isPlaying then
		return
	end
	local panel = f_xunfang_rewardDetial.static_create()
	panel:panelInitBeforePopup(g_game.g_dictConfigManager:getXunfangRewardList(index))
	g_game.g_panelManager:showUiPanel(panel,"xunfang_reward_detial")
end

function f_xunfang_panel:endAnim()
	self:deleteComponent(self.m_xunfang_effect_panel)
	self.m_isPlaying = false
end

function f_xunfang_panel:playAnim(type, id, num)
	self.m_isPlaying = true 
	self.m_rewardType = type
	self.m_rewardId = id
	self.m_rewardNum = num
	if self.m_xunfang_effect_panel ~= nil then
		self:deleteComponent(self.m_xunfang_effect_panel)
		self.m_xunfang_effect_panel = nil
	end
	
	self.m_xunfang_effect_panel = fc.FContainerPanel:create()
    self.m_xunfang_effect_panel:setSize(cc.size(240,370))
    self.m_xunfang_effect_panel:enableClipping(true)
	self:appendComponent(self.m_xunfang_effect_panel)
	if self.m_currentIndex == 1 then
		self.m_xunfang_effect_panel:setPositionInContainer(cc.p(175,320))
	elseif self.m_currentIndex == 2 then
		self.m_xunfang_effect_panel:setPositionInContainer(cc.p(480,320))
	elseif self.m_currentIndex == 3 then
		self.m_xunfang_effect_panel:setPositionInContainer(cc.p(785,320))
	end
	
	self.xunfang_effect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self.m_xunfang_effect_panel:appendComponent(self.xunfang_effect)
	self.xunfang_effect:setAnchorPoint(cc.p(0.5,0.5))
	self.xunfang_effect:setLoop(false)
	self.xunfang_effect:runAnimation(g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[1], g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[2])
	self.xunfang_effect:setPositionInContainer(cc.p(120,200))
	
	local onceCallBack = function(index)
		self:onClick(index)
	end
	
	local halfFinish = function()
		self.xunfang_effect:setLoop(true)
		self.xunfang_effect:runAnimation(g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[1], g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[3])
		require("scripts.game.main.bingfa.f_xunfang_reward")
		local mail = f_xunfang_reward.static_create()
		mail:panelInitBeforePopup(self.m_currentIndex)
		mail:setData(self.m_rewardType, self.m_rewardId, self.m_rewardNum)
		mail:setCallback(onceCallBack)
		g_game.g_panelManager:showUiPanel(mail, "xunfang_reward")
		self:updateDisplay()
	end	
	self.xunfang_effect:registeAnimationFinishCallback(halfFinish)
end

-----------------------------------------------------------
-- @function [parent=#f_xunfang_panel] onClick
-----------------------------------------------------------
function f_xunfang_panel:onClick(index)
	if self.m_isPlaying then
		return
	end
	self.m_currentIndex = index
	
	-- 发送寻访消息
	if g_game.g_userInfoManager:getItemCount(self.m_items[self.m_currentIndex]) < 1 then
		self:showTishiYuanbao(self.m_cost[self.m_currentIndex])
	else
		g_game.g_userInfoManager:requestXunfang(self.m_currentIndex, self.m_items[self.m_currentIndex], 0)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] showTishiYuanbao
-- 提示消耗元宝
-------------------------------------------------------------------------------
function f_xunfang_panel:showTishiYuanbao(need)	
	self.m_needPrice = need
	
	local yuanbao = g_game.g_userInfoManager:getUserInfo()["gold"]
	if yuanbao < self.m_needPrice then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
	else
		g_game.g_userInfoManager:requestXunfang(self.m_currentIndex, 0, need)
	end
	
	
--	local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--	g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--	pop:setNoticeContent(nil,"藏宝图不足，是否花费" .. need .. "元宝直接进行出巡？",nil,nil)
--	pop:popUpNotice(29)
--	pop:setActionType(1)
	
--	local quedingClick = function()
--		local yuanbao = g_game.g_userInfoManager:getUserInfo()["gold"]
--		if yuanbao < self.m_needPrice then
--			require("scripts.game.main.common.f_quick_charge_popup")
--			local quickCharge = f_quick_charge_popup.static_create()
--		    quickCharge:panelInitBeforePopup()
--			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
--			return
--		end
--		g_game.g_userInfoManager:requestXunfang(self.m_currentIndex, 0, need)
--	end
--	pop:setYesCallBack(quedingClick)
	
end

function f_xunfang_panel:updateDisplay()
	for i = 1, 3 do
		self.m_componentTable["itemName" .. i]:setScale(0.8)
		self.m_componentTable["itemName" .. i]:setString(g_game.g_dictConfigManager:getPropsName(self.m_items[i]))
		self.m_componentTable["itemNumber" .. i]:setString(g_game.g_userInfoManager:getItemCount(self.m_items[i]) .. "/1")
		self.m_componentTable["image" .. i]:setImage("nobatch/" .. self.m_images[i])
		self.m_componentTable["cost" .. i]:setString(self.m_cost[i])
		
	end
	self.m_componentTable["yuanbaoNumber"]:setString(g_game.g_userInfoManager.m_user_info["gold"])
end

function f_xunfang_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_xunfang_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_xunfang_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] onEnter
-------------------------------------------------------------------------------
function f_xunfang_panel:onEnter()

	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[1])
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] onExit
-------------------------------------------------------------------------------
function f_xunfang_panel:onExit()
	self:unregisterNodeEvent()
	if self.m_xunfang_effect_panel ~= nil then
		self:deleteComponent(self.m_xunfang_effect_panel)
	end
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[1])
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_xunfang_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_xunfang_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] onCleanup
-------------------------------------------------------------------------------
function f_xunfang_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_xunfang_panel:initAllComponent()

end