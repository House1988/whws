--[[
	千古一帝  地面
]]--

local f_qianguyidi_ground = class("f_qianguyidi_ground", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_qianguyidi_ground")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_qianguyidi_ground:ctor()
    self:registerNodeEvent()   
    
    
    self.m_map_item_table = {}
    
    self.m_move_value = 0
    
	self.m_time = 0
	self.m_move_x = 0.5
	self.m_map_can_move = true
	self.m_moveEndCallback				= nil
	
	self.STATE_NONE						= 1
	self.STATE_MOVE_MAP_FORWARD			= 2
	self.STATE_MOVE_MAP_BACKWARD		= 3
	
	self.m_current_state				= self.STATE_NONE
	
	self.m_state_function				= {}
	
	local state_noneFunction = function(dt)
		self:stateNoneFunction(dt)
	end
	self.m_state_function[self.STATE_NONE] = state_noneFunction
	
	local state_forwardFunction = function(dt)
		self:stateForwardFunction(dt)
	end
	self.m_state_function[self.STATE_MOVE_MAP_FORWARD] = state_forwardFunction
	
	local state_backwardFunction = function(dt)
		self:stateBackwardFunction(dt)
	end
	self.m_state_function[self.STATE_MOVE_MAP_BACKWARD] = state_backwardFunction
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_qianguyidi_ground:onEnter()   
	local size = self:getSize()
	
	for i = 1, 6 do	    
		local midRoad = fc.FExtensionsImage:create()
		midRoad:setImage("nobatch/zhongjianlu.png")
		midRoad:setSize(cc.size(156, 352))
		midRoad:setAnchorPoint(cc.p(0.5, 1))
		self:appendComponent(midRoad)
		midRoad:setPositionInContainer(cc.p(size.width/2, -CONFIG_SCREEN_HEIGHT + (i - 1) * (CONFIG_SCREEN_HEIGHT/2)))
		
		local leftRoad1 = fc.FExtensionsImage:create()
		leftRoad1:setImage("nobatch/lianxitupian.png")
		leftRoad1:setSize(cc.size(231,352))
		leftRoad1:setAnchorPoint(cc.p(1, 1))
		self:appendComponent(leftRoad1)
		leftRoad1:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2 - 156/2, -CONFIG_SCREEN_HEIGHT + (i - 1) * (CONFIG_SCREEN_HEIGHT/2)))
		
		local leftRoad2 = fc.FExtensionsImage:create()
		leftRoad2:setImage("nobatch/lianxitupian.png")
		leftRoad2:setSize(cc.size(231,352))
		leftRoad2:setAnchorPoint(cc.p(1, 1))
		self:appendComponent(leftRoad2)
		leftRoad2:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2 - 156/2 - 231, -CONFIG_SCREEN_HEIGHT + (i - 1) * (CONFIG_SCREEN_HEIGHT/2)))
		    
		local rightRoad1 = fc.FExtensionsImage:create()
		rightRoad1:setImage("nobatch/lianxitupian.png")
		rightRoad1:setSize(cc.size(231,352))
		rightRoad1:setAnchorPoint(cc.p(0, 1))
		self:appendComponent(rightRoad1)
		rightRoad1:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2 + 156/2, -CONFIG_SCREEN_HEIGHT + (i - 1) * (CONFIG_SCREEN_HEIGHT/2)))
	       
		local rightRoad2 = fc.FExtensionsImage:create()
		rightRoad2:setImage("nobatch/lianxitupian.png")
		rightRoad2:setSize(cc.size(231,352))
		rightRoad2:setAnchorPoint(cc.p(0, 1))
		self:appendComponent(rightRoad2)
		rightRoad2:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2 + 156/2 + 231, -CONFIG_SCREEN_HEIGHT + (i - 1) * (CONFIG_SCREEN_HEIGHT/2)))
	    
		self.m_map_item_table[i] = {leftRoad1, leftRoad2, midRoad, rightRoad1, rightRoad2}
	end
--[[
    local action = cc.OrbitCamera:create(0.001, 1, 0, -10, -90, 90, 0)
    
    self:runAction(action)
]]--
	self:rotate(1, -45.0)
	g_game.g_gameManager:addUpdateObj(self)
	
end



-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] onExit
-- exit
-------------------------------------------------------------------------------
function f_qianguyidi_ground:onExit()    
    self:unregisterNodeEvent()
    
	g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_qianguyidi_ground:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_qianguyidi_ground:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_qianguyidi_ground:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_ground:registerNodeEvent(handler)
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
-- @function [parent=#f_qianguyidi_ground] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_ground:unregisterNodeEvent()
    self:unregisterScriptHandler()
end



-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] moveMap
-- 移动地图
-------------------------------------------------------------------------------
function f_qianguyidi_ground:moveMap(isForward, moveEndCallback)
	if isForward then
		self.m_current_state = self.STATE_MOVE_MAP_FORWARD
	else
		self.m_current_state = self.STATE_MOVE_MAP_BACKWARD
	end
	self.m_map_can_move = false
	self.m_time = 0
	self.m_moveEndCallback = moveEndCallback
end   

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] update
-- update
-------------------------------------------------------------------------------
function f_qianguyidi_ground:update(dt)   
	self.m_state_function[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] stateNoneFunction
-- stateNoneFunction
-------------------------------------------------------------------------------
function f_qianguyidi_ground:stateNoneFunction(dt)   
	self.m_time = self.m_time + dt
	
	if self.m_time > 1.2 then
		self.m_time = 0
		self.m_map_can_move = true
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] stateForwardFunction
-- stateForwardFunction
-------------------------------------------------------------------------------
function f_qianguyidi_ground:stateForwardFunction(dt)   
	self.m_time = self.m_time + dt
	
	local posx, posy = self:getPositionX(), self:getPositionY()
	
--	self:setPosition(cc.p(posx, posy+1))
	
	self.m_move_value = self.m_move_value - 5
	
	self:move(1, self.m_move_value)
	if self.m_move_value < -353 then
		self.m_move_value = 0
		self:move(1, self.m_move_value)	
		self.m_time = 0
		self.m_current_state = self.STATE_NONE
		if self.m_moveEndCallback then
			self.m_moveEndCallback(true)
		end
	end
--[[	
	self.m_move_x = self.m_move_x + 0.01    
	self:setAnchorPoint(cc.p(0.5, self.m_move_x))
	
	if self.m_move_x > 1.0 then
		self.m_move_x = 0.5 
		self:setAnchorPoint(cc.p(0.5, self.m_move_x))
		
		self.m_time = 0
		
		self.m_current_state = self.STATE_NONE
		if self.m_moveEndCallback then
			self.m_moveEndCallback(true)
		end
	end
]]--
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] groundCanMove
-- 地图是否可以移动
-------------------------------------------------------------------------------
function f_qianguyidi_ground:groundCanMove()  
	return self.m_map_can_move
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_ground] stateBackwardFunction
-- stateBackwardFunction
-------------------------------------------------------------------------------
function f_qianguyidi_ground:stateBackwardFunction(dt)   
	self.m_time = self.m_time + dt	
	
	local posx, posy = self:getPositionX(), self:getPositionY()
	
--	self:setPosition(cc.p(posx, posy-1))
	self.m_move_value = self.m_move_value + 5
	
	self:move(1, self.m_move_value)
	if self.m_move_value > 353 then
		self.m_move_value = 0
		self:move(1, self.m_move_value)	
		self.m_time = 0
		self.m_current_state = self.STATE_NONE
		if self.m_moveEndCallback then
			self.m_moveEndCallback(false)
		end
	end
--[[	
	self.m_move_x = self.m_move_x - 0.01    
	self:setAnchorPoint(cc.p(0.5, self.m_move_x))
	
	if self.m_move_x < 0.0 then
		self.m_move_x = 0.5 
		self:setAnchorPoint(cc.p(0.5, self.m_move_x))
		
		self.m_time = 0
		
		self.m_current_state = self.STATE_NONE
		if self.m_moveEndCallback then
			self.m_moveEndCallback(false)
		end
	end
]]--
end

return f_qianguyidi_ground