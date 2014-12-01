--[[--
    游戏内战斗场景ui管理类
--]]--
require("scripts.game.battle.layout.f_battle_left_bottom_panel")
require("scripts.game.battle.layout.f_battle_right_top_panel")
require("scripts.game.battle.layout.f_battle_right_bottom_panel")
require("scripts.game.battle.layout.f_battle_left_top_panel")

local f_battle_layout_manager = class("f_battle_layout_manager")
f_battle_layout_manager.__index = f_battle_layout_manager

-------------------------------------------------
-- @function [parent=#f_battle_layout_manager] ctor
-------------------------------------------------
function f_battle_layout_manager:ctor()
    self.layout_right_top	    = nil
    self.layout_right_bottom    = nil
    self.layout_left_bottom     = nil  
    self.layout_left_top     = nil  
        
	self.m_battle_manager 		= nil
	
	self.m_left_bottom_pos		= {}
	self.m_right_top_pos		= {}
	self.m_right_bottom_pos		= {}
	self.m_left_top_pos			= {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_layout_manager] setBattleManager
-- 设置battle manager
-------------------------------------------------------------------------------
function f_battle_layout_manager:setBattleManager(manager)
	self.m_battle_manager = manager
end

-------------------------------------------------
-- @function [parent=#f_battle_layout_manager] initLayout
-- 初始化场景中的各个面板
-------------------------------------------------
function f_battle_layout_manager:initLayout()
    self.layout_left_bottom = f_battle_left_bottom_panel.static_create()
    self.layout_left_bottom:layout_in_parent()
	
	self.layout_right_top = f_battle_right_top_panel.static_create()
    self.layout_right_top:layout_in_parent()
    
    self.layout_left_top = f_battle_left_top_panel.static_create()
    self.layout_left_top:layout_in_parent()
    
    
    local skipBattle = function()
    	self.m_battle_manager:skipBattle()
    end    
    self.layout_right_bottom = f_battle_right_bottom_panel.static_create()
    self.layout_right_bottom:layout_in_parent()
 	self.layout_right_bottom:setSkipBattleCallback(skipBattle)
 	
 	self.m_battle_manager:setUserPanel(self.layout_left_bottom, self.layout_right_top, self.layout_right_bottom)
 	
 	
	self.m_left_bottom_pos[1], self.m_left_bottom_pos[2] = self.layout_left_bottom:getPosition()
	self.layout_left_bottom:setPosition(cc.p(self.m_left_bottom_pos[1] - CONFIG_SCREEN_WIDTH, self.m_left_bottom_pos[2]))
	self.m_right_top_pos[1], self.m_right_top_pos[2] = self.layout_right_top:getPosition()
	self.layout_right_top:setPosition(cc.p(self.m_right_top_pos[1] + CONFIG_SCREEN_WIDTH, self.m_right_top_pos[2]))
	self.m_right_bottom_pos[1], self.m_right_bottom_pos[2]		= self.layout_right_bottom:getPosition()	
	self.layout_right_bottom:setPosition(cc.p(self.m_right_bottom_pos[1] + CONFIG_SCREEN_WIDTH, self.m_right_bottom_pos[2]))
	self.m_left_top_pos[1], self.m_left_top_pos[2]		= self.layout_left_top:getPosition()	
	self.layout_left_top:setPosition(cc.p(self.m_left_top_pos[1] - CONFIG_SCREEN_WIDTH, self.m_left_top_pos[2]))
	
end

-------------------------------------------------
-- @function [parent=#f_battle_layout_manager] moveToShowUI
-- 移动显示战斗ui
-------------------------------------------------
function f_battle_layout_manager:moveToShowUI()
	self.layout_left_bottom:preOpenAllCard()	
	self.layout_right_top:preOpenAllCard()	

	local moveto = CCMoveTo:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.4, cc.p(self.m_left_bottom_pos[1], self.m_left_bottom_pos[2]))
	local action = CCEaseSineIn:create(moveto)
	self.layout_left_bottom:runAction(action)
	
	
	moveto = CCMoveTo:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.4, cc.p(self.m_right_top_pos[1], self.m_right_top_pos[2]))
	action = CCEaseSineIn:create(moveto)
	self.layout_right_top:runAction(action)
	
	
	moveto = CCMoveTo:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.4, cc.p(self.m_right_bottom_pos[1], self.m_right_bottom_pos[2]))
	action = CCEaseSineIn:create(moveto)
	self.layout_right_bottom:runAction(action)
	
	moveto = CCMoveTo:create(g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.4, cc.p(self.m_left_top_pos[1], self.m_left_top_pos[2]))
	action = CCEaseSineIn:create(moveto)
	self.layout_left_top:runAction(action)
	
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.0
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_layout_manager] showUi
-- 是否显示地图
-------------------------------------------------------------------------------
function f_battle_layout_manager:showUi(isShow)
	self.layout_left_bottom:setVisible(isShow)
	self.layout_right_top:setVisible(isShow)
	self.layout_right_bottom:setVisible(isShow)
	self.layout_left_top:setVisible(isShow)
end

return f_battle_layout_manager