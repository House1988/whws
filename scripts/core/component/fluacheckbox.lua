FLuaCheckBox = class("FLuaCheckBox")
FLuaCheckBox.__index = FLuaCheckBox

--[[--

]]
function FLuaCheckBox.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaCheckBox)
    
    return target
end
