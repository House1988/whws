FLuaTextButton = class("FLuaTextButton")
FLuaTextButton.__index = FLuaTextButton

--[[--

]]
function FLuaTextButton.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaTextButton)
    
    return target
end
