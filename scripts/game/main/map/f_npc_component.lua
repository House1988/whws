--[[
	继承自动画, 实现动画组件
]]--

local f_npc_component = class("f_npc_component", function()
    return g_game.g_classFactory.newFLuaAnimationComponent("f_npc_component")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_npc_component:ctor()    
    self:registerNodeEvent()  
    self.m_index = 0 
    
    self.isFinished = false
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_npc_component:onEnter()   
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] isFinished
-------------------------------------------------------------------------------
function f_npc_component:isFinished()
	return self.isFinished
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] setIndex
-------------------------------------------------------------------------------
function f_npc_component:setIndex(index)
	 self.m_index  = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] getIndex
-------------------------------------------------------------------------------
function f_npc_component:getIndex()
	 return self.m_index 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] initAnim
-------------------------------------------------------------------------------
function f_npc_component:initAnim()
	self.isFinished = false
	
	local finishCall = function()
		self.isFinished = true
		self:reloadAnim()
	end
	
	local npcDataList = g_game.g_dictConfigManager:getNpcList()
	self:runAnimation(g_game.g_f_main_ui_effect.MAIN_SCENE_NPC[1],npcDataList[self.m_index][2])
	self:registeAnimationFinishCallback(finishCall)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] notifyStart
-------------------------------------------------------------------------------
function f_npc_component:notifyStart()
	self.isFinished = false
	
	local finishCall = function()
		self.isFinished = true
		self:reloadAnim()
	end
	
	local npcDataList = g_game.g_dictConfigManager:getNpcList()
	self:runAnimation(g_game.g_f_main_ui_effect.MAIN_SCENE_NPC[1],npcDataList[self.m_index][2])
	self:registeAnimationFinishCallback(finishCall)
	
	local offset = math.random(0,1)
	self:setOpacity(0)
	local fadeIn = cc.FadeIn:create(offset*3)
	self:runAction(fadeIn)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] reloadAnim
-------------------------------------------------------------------------------
function f_npc_component:reloadAnim()
	local restart = function()
		self:notifyStart()
	end
	
	if self.isFinished then
		local offset = math.random(0,1)
		local fadeOut = cc.FadeOut:create(offset*3)
		local sequence = g_game.g_transition.sequence({fadeOut,cc.CallFunc:create(restart)})
		self:runAction(sequence)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] onExit
-------------------------------------------------------------------------------
function f_npc_component:onExit()    
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_npc_component:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] onExitTransitionStart
-------------------------------------------------------------------------------
function f_npc_component:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] onCleanup
-------------------------------------------------------------------------------
function f_npc_component:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_npc_component] registerNodeEvent
-------------------------------------------------------------------------------
function f_npc_component:registerNodeEvent(handler)
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
-- @function [parent=#f_npc_component] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_npc_component:unregisterNodeEvent()
    self:unregisterScriptHandler()
end
	
return f_npc_component
