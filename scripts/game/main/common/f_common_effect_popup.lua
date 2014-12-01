require("scripts.auto.auto_effectPopup")
--[[--
文字特效面板
--]]--

f_common_effect_popup = class("f_common_effect_popup")
f_common_effect_popup.__index = f_common_effect_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_common_effect_popup.static_create()
	local rewardTable = createeffectPopup()
	local reward = rewardTable["effectPopup"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_common_effect_popup)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_common_effect_popup:panelInitBeforePopup(name, index)
	self:registerNodeEvent()

	self.m_index = index
	self.m_name = name
	
	self.m_isEquip = false
	
	local frame = self.m_componentTable["position"]
	self.m_animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.m_animation)	
	self.m_animation:setSize(frame:getSize())
	self.m_animation:setAnchorPoint(cc.p(0.5,0.5))
	self.m_animation:setPositionInContainer(frame:getPositionInContainer())	
	self.m_animation:setLoop(false)	
	self.m_animation:setAnimationScale(1)
	self.m_animation:setVisible(true)
	
	frame = self.m_componentTable["frame"]
	self.m_equipAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	self:appendComponent(self.m_equipAnim)	
	self.m_equipAnim:setSize(frame:getSize())
	self.m_equipAnim:setAnchorPoint(cc.p(0.5,0.5))
	local p = frame:getPositionInContainer()
	p.y = p.y - 10
	self.m_equipAnim:setPositionInContainer(p)	
	self.m_equipAnim:setLoop(false)	
	self.m_equipAnim:setAnimationScale(1)
	self.m_equipAnim:setVisible(false)
	
	self.m_componentTable["blackBar"]:setVisible(name == g_game.g_f_main_ui_effect.UI_JIE_MIAN[2])
	self.m_componentTable["blackBg"]:setVisible(name == g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[2])
	self.m_componentTable["blackBar"]:setOpacity(175)
	self.m_componentTable["blackBg"]:setOpacity(175)
	self.m_componentTable["close"]:setVisible(false)
	local close = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_STOP_UPDATE_EQUIP)
		g_game.g_panelManager:removeUiPanel("effect_popup")
	end	
	self.m_componentTable["close"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_componentTable["image"]:setVisible(false)
	self.m_componentTable["frame"]:setVisible(false)
end

function f_common_effect_popup:setEquip(image, q)
	self.m_componentTable["image"]:setImage(image)
	self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[q])
	self.m_componentTable["image"]:setVisible(true)
	self.m_componentTable["frame"]:setVisible(true)
	
	self.m_equipAnim:setVisible(true)
	self.m_isEquip = true
end

function f_common_effect_popup:showClose()
	self.m_componentTable["close"]:setVisible(true)
end

function f_common_effect_popup:registerNodeEvent(handler)
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

function f_common_effect_popup:close()
	g_game.g_panelManager:removeUiPanel("effect_popup")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_common_effect_popup:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] onEnter
-------------------------------------------------------------------------------
function f_common_effect_popup:onEnter()
	local onFinish = function()
		self:close()
	end
	
	local onHalfFinish = function()
		self.m_animation:runAnimation(self.m_name, self.m_index)
	end
	
	local onEquipFinish = function()
		self.m_equipAnim:setVisible(false)
	end
	
	if self.m_isEquip then
		self.m_equipAnim:setVisible(true)
		local sq = {}
		table.insert(sq, cc.DelayTime:create(0.2))
		table.insert(sq, cc.CallFunc:create(onHalfFinish))
		self:runAction(g_game.g_transition.sequence(sq))
		self.m_animation:setAnimationSpeedScale(0.5)
		self.m_equipAnim:runAnimation(g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[2], g_game.g_f_main_ui_effect.UI_EQUIP_UPGRADE[3])
		self.m_equipAnim:registeAnimationFinishCallback(onEquipFinish)
	else	
		self.m_animation:runAnimation(self.m_name, self.m_index)
	end
--	local seq = g_game.g_transition.sequence({cc.DelayTime:create(2), cc.CallFunc:create(onFinish)})
--	self:runAction(seq)

	self.m_animation:registeAnimationFinishCallback(onFinish)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] onExit
-------------------------------------------------------------------------------
function f_common_effect_popup:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_common_effect_popup:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] onExitTransitionStart
-------------------------------------------------------------------------------
function f_common_effect_popup:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_effect_popup] onCleanup
-------------------------------------------------------------------------------
function f_common_effect_popup:onCleanup()
end
