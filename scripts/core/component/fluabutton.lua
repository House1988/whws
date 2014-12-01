FLuaButton = class("FLuaButton")
FLuaButton.__index = FLuaButton

--[[--

]]
function FLuaButton.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaButton)
    
    return target
end
