FLuaImageTextButton = class("FLuaImageTextButton")
FLuaImageTextButton.__index = FLuaImageTextButton

--[[--

]]
function FLuaImageTextButton.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaImageTextButton)
    
    return target
end
