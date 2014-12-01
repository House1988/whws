require("scripts.game.main.qianguyidi.f_qianguyidi_scene")

--[[
	千古一帝主界面
]]--

local f_qianguyidi_main = class("f_qianguyidi_main", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_qianguyidi_main")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_qianguyidi_main:ctor()
    self:registerNodeEvent()   
    
    self.m_pvpGroud = nil
    self.m_pvpScene = nil
    self.m_pvpPlayers = nil
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_qianguyidi_main:onEnter()   
	--新手指引
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_QGYD)

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self:setStopTouchEvent(true)
	self:enableClipping(true)
	
	--地面
	self.m_pvpGroud = require("scripts.game.main.qianguyidi.f_qianguyidi_ground").new()	
	self.m_pvpGroud:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self:appendComponent(self.m_pvpGroud)
	self.m_pvpGroud:setAnchorPoint(cc.p(0.5,0))
	self.m_pvpGroud:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
	
	--pvp 千古一帝 建筑 ui 等
	self.m_pvpScene = f_qianguyidi_scene.static_create()
	self.m_pvpScene:panelInitBeforePopup()
	self:appendComponent(self.m_pvpScene)
	self.m_pvpScene:setAnchorPoint(cc.p(0.5,0.5))
	self.m_pvpScene:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
	CONFIG_SCREEN_HEIGHT/2))
	
	--玩家
	self.m_pvpPlayers = require("scripts.game.main.qianguyidi.f_qianguyidi_players_panel").new()	
	self.m_pvpPlayers:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT/2))
	self:appendComponent(self.m_pvpPlayers)
	self.m_pvpPlayers:setAnchorPoint(cc.p(0.5,0.5))
	self.m_pvpPlayers:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT*3/4))
	
	--翻页回调
	local next = function()
		self:showNextPvp()
	end
	local pre = function()
		self:showPrePvp()	
	end
	self.m_pvpScene:setJiantouCallback(next, pre)
	self.m_pvpScene:showBackwardFlag(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] showNextPvp
-- 显示下一页pvp数据
-------------------------------------------------------------------------------
function f_qianguyidi_main:showNextPvp()   
	if not self.m_pvpGroud:groundCanMove() then
		return 
	end
	if self.m_pvpPlayers:nextPvpData() then
		self.m_pvpGroud:moveMap(true, nil)
		self.m_pvpScene:updateFlag(self.m_pvpPlayers.m_current_pvp_page)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] showPrePvp
-- 显示上一页pvp数据
-------------------------------------------------------------------------------
function f_qianguyidi_main:showPrePvp()   
	if not self.m_pvpGroud:groundCanMove() then
		return 
	end
	if self.m_pvpPlayers:prePvpData() then
		self.m_pvpGroud:moveMap(false, nil)  
		self.m_pvpScene:updateFlag(self.m_pvpPlayers.m_current_pvp_page)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] onExit
-- exit
-------------------------------------------------------------------------------
function f_qianguyidi_main:onExit()    
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] onEnterTransitionFinish
-- TransitionFinish
-------------------------------------------------------------------------------
function f_qianguyidi_main:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] onExitTransitionStart
-- TransitionStart
-------------------------------------------------------------------------------
function f_qianguyidi_main:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] onCleanup
-- Cleanup
-------------------------------------------------------------------------------
function f_qianguyidi_main:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_main] registerNodeEvent
-- NodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_main:registerNodeEvent(handler)
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
-- @function [parent=#f_qianguyidi_main] unregisterNodeEvent
-- unregister  NodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_main:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_qianguyidi_main