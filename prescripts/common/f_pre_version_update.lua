--[[--
    程序更新模块
--]]--

local f_pre_version_update = class("f_pre_version_update")
f_pre_version_update.__index = f_pre_version_update

-------------------------------------------------
-- @function [parent=#f_pre_version_update] ctor
-------------------------------------------------
function f_pre_version_update:ctor()	
	self.m_platform = device.platform
end



return f_pre_version_update