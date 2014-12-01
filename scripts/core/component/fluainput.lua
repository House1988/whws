FLuaInput = class("FLuaInput")
FLuaInput.__index = FLuaInput

--[[--

]]
function FLuaInput.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaInput)
    
    return target
end