--[[--
    游戏内场景ui管理类
--]]--
require("scripts.game.main.layout.f_game_left_top_panel")
require("scripts.game.main.layout.f_game_right_top_panel")
require("scripts.game.main.layout.f_game_right_center_panel")
require("scripts.game.main.layout.f_game_right_bottom_panel")
require("scripts.game.main.layout.f_game_left_center_panel")


local f_game_layout_manager = class("f_game_layout_manager")
f_game_layout_manager.__index = f_game_layout_manager

-------------------------------------------------
-- @function [parent=#f_game_layout_manager] ctor
-------------------------------------------------
function f_game_layout_manager:ctor()
    self.layout_left_top        = nil 
    self.layout_right_top	    = nil
    self.layout_right_center    = nil
    self.layout_right_bottom    = nil
    self.layout_left_bottom     = nil
    self.layout_left_center 	= nil
end



-------------------------------------------------
-- @function [parent=#f_game_layout_manager] initLayout
-- 初始化场景中的各个面板
-------------------------------------------------
function f_game_layout_manager:initLayout()
    self.layout_left_top = f_game_left_top_panel.static_create()
    self.layout_left_top:layout_in_parent()
	
	self.layout_right_top = f_game_right_top_panel.static_create()
    self.layout_right_top:layout_in_parent()
    
    self.layout_right_center = f_game_right_center_panel.static_create()
    self.layout_right_center:layout_in_parent()
    
    self.layout_right_bottom = f_game_right_bottom_panel.static_create()
    self.layout_right_bottom:layout_in_parent()
    
    self.layout_left_center = f_game_left_center_panel.static_create()
    self.layout_left_center:layout_in_parent()
 	
 	self:refreshLeftTopData()
end

-------------------------------------------------
-- @function [parent=#f_game_layout_manager] refreshLeftTopData
-- 刷新用户数据界面
-------------------------------------------------
function f_game_layout_manager:refreshLeftTopData()
	self.layout_left_top:refersh()
end


return f_game_layout_manager