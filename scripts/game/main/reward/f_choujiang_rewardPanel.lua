--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_choujiangReward")


f_choujiang_rewardPanel = class("f_choujiang_rewardPanel")
f_choujiang_rewardPanel.__index = f_choujiang_rewardPanel

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel.static_create()
	local rewardTable = createchoujiangReward()
	local reward = rewardTable["choujiangReward"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_choujiang_rewardPanel)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:panelInitBeforePopup(datas, hasAgain)
	self:registerNodeEvent()
	
	self.m_datas = datas
	self.m_hasAgain = hasAgain
	self.m_componentTable["btnOk"]:setVisible(false)
	self.m_componentTable["btnAgain"]:setVisible(false)
	
	self.m_componentTable["blackbg"]:setOpacity(175)
	-- 关闭按钮
	local close = function()
		g_game.g_panelManager:removeUiPanel("choujiang_reward")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnOk"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["btnMidOk"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local again = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_CHOUJIANG_AGAIN)
		g_game.g_panelManager:removeUiPanel("choujiang_reward")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btnAgain"]:addHandleOfcomponentEvent(again,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_componentTable["btnAgain"]:setVisible(false)
	self.m_componentTable["btnOk"]:setVisible(false)
	self.m_componentTable["btnMidOk"]:setVisible(false)
		
	self.m_boxAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_boxAnim)
	self.m_boxAnim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_boxAnim:setLoop(false)
	self.m_boxAnim:setAnimationScale(1)
	local pos = self.m_componentTable["box"]:getPositionInContainer()
	pos.y = pos.y + 100
	self.m_boxAnim:setPositionInContainer(pos)
	
	local play = function()
		self.m_boxAnim:setLoop(true)
		self.m_boxAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[4])
	end
	
	self.m_boxAnim:registeAnimationFinishCallback(play)
	self.m_boxAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[3])
	
	self:initItems()
	
end

function f_choujiang_rewardPanel:initItems()
	self.m_items = {}
	
	local pos = self.m_componentTable["box"]:getPositionInContainer()
	pos.y = pos.y + 20
	local s = self.m_componentTable["item10s"]
	local e = self.m_componentTable["item10e"]
	if #self.m_datas <= 1 then
		s = self.m_componentTable["item1"]
		e = s
	end
	local sq = {}
	table.insert(sq, cc.DelayTime:create(1.2))
	s = s:getPositionInContainer()
	e = e:getPositionInContainer()
	local stepX = (e.x - s.x) / 4
	local x = s.x
	self.m_currentIndex = 1
	local callback = function()
		if self.m_currentIndex > #self.m_items then
			self.m_componentTable["btnAgain"]:setVisible(self.m_hasAgain)
			self.m_componentTable["btnOk"]:setVisible(self.m_hasAgain)
			self.m_componentTable["btnMidOk"]:setVisible(not self.m_hasAgain)
			for i = 1, #self.m_items do
				self.m_items[i]:showName()
			end
			return
		end
		self.m_items[self.m_currentIndex]:show()
		self.m_currentIndex = self.m_currentIndex + 1
	end
	
	for i = 1, #self.m_datas do
		local y = s.y
		if i > 5 then
			y = e.y
		end
		local item = require("scripts.game.main.reward.f_choujiang_rewardItem").new()
		item:setSize(cc.size(104, 104))
		item:setData(self.m_datas[i])
	    item:setAnchorPoint(cc.p(0.5,0.5))
	    self:appendComponent(item)
	    item:setPositionInContainer(pos)
	    item:setAction(cc.p(x - pos.x, y - pos.y))
	    item:setVisible(false)
	    table.insert(sq, cc.CallFunc:create(callback))
	    table.insert(sq, cc.DelayTime:create(0.15))
	    if i == 5 then
	    	x = s.x
	    else
	   		x = x + stepX
	    end
	    table.insert(self.m_items, item)
	end
	table.insert(sq, cc.CallFunc:create(callback))
	self:runAction(g_game.g_transition.sequence(sq))
end

--------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] registerNodeEvent
--------------------------------------------------------------
function f_choujiang_rewardPanel:registerNodeEvent(handler)
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
-- @function [parent=#f_choujiang_rewardPanel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] onEnter
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] onExit
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] onCleanup
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardPanel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_choujiang_rewardPanel:initAllComponent()

end

