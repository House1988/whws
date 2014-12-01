FLuaLabel = class("FLuaLabel")
FLuaLabel.__index = FLuaLabel

--[[--

]]
function FLuaLabel.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaLabel)
    
    return target
end