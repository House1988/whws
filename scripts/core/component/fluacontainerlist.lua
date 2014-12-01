FLuaContainerList = class("FLuaContainerList")
FLuaContainerList.__index = FLuaContainerList

--[[--

]]
function FLuaContainerList.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaContainerList)
    
    return target
end
