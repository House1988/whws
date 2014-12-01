FLuaSlider = class("FLuaSlider")
FLuaSlider.__index = FLuaSlider

--[[--

]]
function FLuaSlider.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaSlider)
    
    return target
end