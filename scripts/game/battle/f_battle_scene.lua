require ("scripts.manager.fluapanelmanager")

local f_battle_scene = class("f_battle_scene", function()
    return g_game.g_classFactory.newFLuaScene("f_battle_scene")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_battle_scene:ctor()  
	self:registerNodeEvent()
	  
	self.m_battle_map_layer = nil
	self.m_battle_solider_layer = nil
	self.m_battle_manager = nil
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_battle_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_scene] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_battle_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] onEnter
-------------------------------------------------------------------------------
function f_battle_scene:onEnter()	
	g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("battle_ui"))
	--g_game.g_resourceManager:loadTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui2"))
	
	g_game.g_panelManager:resetAllPanelConfig()
	
	
	self:config_layer()
	g_game.g_panelManager:createPanelContainer()  

	self.m_battle_manager = require("scripts.game.battle.f_battle_manager").new()
	self.m_battle_manager:setBattleData(g_game.g_userInfoManager:getBattleData())
	g_game.g_gameManager:addUpdateObj(self.m_battle_manager)
	g_game.g_utilManager:setCurrentBattleManager(self.m_battle_manager)
	
	
	--初始化地图层
	self.m_battle_map_layer = require("scripts.game.battle.map.f_battle_map_layer").new()
	self.m_battle_map_layer:layout_in_parent()
	self.m_battle_map_layer:setBattleManager(self.m_battle_manager)
	self.m_battle_map_layer:loadMap()
	
	self.m_battle_solider_layer = require("scripts.game.battle.map.f_battle_map").new()
	self.m_battle_solider_layer:layout_in_parent()
	
	self.m_battle_manager:setBattleMapLayer(self.m_battle_map_layer)
	self.m_battle_manager:setBattleSoliderLayer(self.m_battle_solider_layer)
	
	--初始化人物层
	self.m_battle_attack_group = require("scripts.game.battle.battle_ground.f_battle_group").new(self.m_battle_manager)
	self.m_battle_attack_group:setGroupType(1)
	self.m_battle_defense_group = require("scripts.game.battle.battle_ground.f_battle_group").new(self.m_battle_manager)
	self.m_battle_defense_group:setGroupType(2)
	
	
	self.m_battle_manager:setBattleGroup(self.m_battle_attack_group, self.m_battle_defense_group)
	
	--初始化战斗场景ui
	self.m_layout_manager = require("scripts.game.battle.f_battle_layout_manager").new()
	self.m_layout_manager:setBattleManager(self.m_battle_manager)
	self.m_layout_manager:initLayout() 
	self.m_battle_manager:setBattleLayoutManager(self.m_layout_manager)
	
	self.m_effect_panel = require("scripts.game.battle.layout.f_battle_effect_panel").new()
	self.m_battle_manager:setEffectLayer(self.m_effect_panel)
	
	--加载战斗数据	
	self.m_battle_manager:updateUserPanel()
	
	
	--发送播放战斗场景音乐事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_ZHANDOU)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLEAR_LOADING_FLAG)
	
	g_game.g_guidelinesManager:initComponent()
	g_game.g_secondGuidelinesManager:initComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] onExit
-------------------------------------------------------------------------------
function f_battle_scene:onExit()   

	g_game.g_utilManager:setCurrentBattleManager(nil)
	    
	g_game.g_gameManager:removeUpdateObj(self.m_battle_manager)
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] onCleanup
-------------------------------------------------------------------------------
function f_battle_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] registerServerMessage
-------------------------------------------------------------------------------
function f_battle_scene:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] unregisterServerMessage
-------------------------------------------------------------------------------
function f_battle_scene:unregisterServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] getBattleManager
-- 获取当前场景中的战斗管理类
-------------------------------------------------------------------------------
function f_battle_scene:getBattleManager()
	return self.m_battle_manager
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_scene] showAllUi
-- 隐藏所有界面，用于皇子技能
-------------------------------------------------------------------------------
function f_battle_scene:showAllUi(isShow)	
	self.m_battle_map_layer:showMap(isShow)
	self.m_layout_manager:showUi(isShow)
end

return f_battle_scene
