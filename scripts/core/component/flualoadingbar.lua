FLuaLoadingBar = class("FLuaLoadingBar")
FLuaLoadingBar.__index = FLuaLoadingBar

--[[--

]]
function FLuaLoadingBar.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaLoadingBar)
    
    return target
end