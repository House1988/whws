--[[
	继承自container panel, 用于显示公告列表
]]--


local f_number_effect = class("f_number_effect", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_number_effect")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_number_effect] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_number_effect:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(200, 100))	
	self:setAnchorPoint(0.5, 0.5)
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_number_effect] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_number_effect:onEnter() 
	
end


function f_number_effect:onExit()    
    self:unregisterNodeEvent()
    self:stop()
end

function f_number_effect:onEnterTransitionFinish()
end

function f_number_effect:onExitTransitionStart()
end

function f_number_effect:onCleanup()
end


function f_number_effect:registerNodeEvent(handler)
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

function f_number_effect:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_number_effect] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_number_effect:initAllComponent()	
	self.m_targetLabel = nil
	self.m_targetStr = "%d"
	self.m_to = 0
	self.m_step = 0
	self.m_proFrom = 0
	self.m_proTo = 0
	
	self.m_label = fc.FLabel:createSystemFont()
	self:appendComponent(self.m_label)
	self.m_label:setSize(cc.size(25, 25))
	self.m_label:setAnchorPoint(0.5, 0.5)
	self.m_label:setVisible(false)
	
	self.m_anim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_anim)
	self.m_anim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_anim:setLoop(false)
	self.m_anim:setAnimationScale(1)
	self.m_anim:setVisible(false)
	
	self.m_useColor = false
	self.m_prograssBar = nil
end

function f_number_effect:setPrograss(bar, isOver)
	self.m_prograssBar = bar
	self.m_isOverPrograss = isOver
end

function f_number_effect:useColor(isUse)
	self.m_useColor = isUse
end

function f_number_effect:setPrograssValue(from, to)
	self.m_proFrom = from
	self.m_proTo = to
end

function f_number_effect:setText()
	local call = function()
	end
	if self.m_targetStr ~= "" then
		if self.m_useColor then
			self.m_targetLabel:setComplexString(g_game.g_utilManager:getEncodeString(string.format(self.m_targetStr, self.m_current), cc.c3b(0,0,0)), call)
		else
			self.m_targetLabel:setString(string.format(self.m_targetStr, self.m_current))
		end
	end
	if self.m_prograssBar ~= nil then
		local v = self.m_proCurrent
		if v > 1 then
			if self.m_isOverPrograss then
				v = v - math.floor(v)
			else
				v = 1
			end
		elseif v < 0 then
			if self.m_isOverPrograss then
				v = 1 + v + math.floor(-v)
			else
			 	v = 0
			end
		end
		self.m_prograssBar:setPercent(v * 100)
	end
end

function f_number_effect:stop()
	self.m_anim:setVisible(false)
	self.m_label:setVisible(false)
	g_game.g_gameManager:removeUpdateObj(self)
end

function f_number_effect:setLastValue(v)
	self.m_lastValue = v
end

function f_number_effect:setup(targetLabel, fontSize, str, hasAnim, hasIns)
	self.m_targetLabel = targetLabel
	self.m_label:setFontSize(fontSize)
	self.m_targetStr = str
	self.m_hasAnim = hasAnim
	self.m_hasIns = hasIns
	
	self.m_lastValue = 0
end

function f_number_effect:playWhenLarger(v, duration)
	if v > self.m_lastValue then
		self:play(self.m_lastValue, v, duration)
	end
	self.m_lastValue = v
end

function f_number_effect:play(from, to, duration)
	local ins = to - from
	if ins == 0 then
		return
	end
	self.m_to = to
	self.m_current = from

	self.m_from = from
	if ins > 0 then
		self.m_label:setString("+" .. ins)
		self.m_label:setColor(cc.c3b(0, 255, 0))
	else
		self.m_label:setString("-" .. ins)
		self.m_label:setColor(cc.c3b(255, 0, 0))
	end
	self.m_proStep = (self.m_proTo - self.m_proFrom) / duration
	self.m_proCurrent = self.m_proFrom
	self.m_step = (to - from) / duration
	
	local callback = function()
		g_game.g_gameManager:addUpdateObj(self)
		self.m_label:setVisible(false)
		if self.m_hasAnim then
			self.m_anim:setVisible(true)
			self.m_anim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN[15])
		end
	end

	self.m_anim:setPositionInContainer(cc.p(100, 50))
	local sq = {}
	
	if self.m_hasIns then
		self.m_label:setVisible(true)
	
		self.m_label:setPositionInContainer(cc.p(100, 10))
		
		local action = CCMoveBy:create(0.2, cc.p(0, -40)) 
	
		table.insert(sq,  cc.DelayTime:create(1))
		table.insert(sq, action)
	end
	self:setText()
	table.insert(sq, cc.CallFunc:create(callback))
	self.m_label:runAction(g_game.g_transition.sequence(sq))
end

function f_number_effect:update(dt)
	self.m_current = self.m_current + self.m_step * dt
	if self.m_prograssBar ~= nil then
		self.m_proCurrent = self.m_proCurrent + self.m_proStep * dt
	end
	if self.m_from <= self.m_to then
		if self.m_current >= self.m_to then
			self.m_current = self.m_to
			self:stop()
		end
	else
		if self.m_current <= self.m_to then
			self.m_current = self.m_to
			self:setText()
			self:stop()
		end
	end

	self:setText()
end

return f_number_effect