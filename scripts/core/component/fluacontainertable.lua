FLuaContainerTable = class("FLuaContainerTable")
FLuaContainerTable.__index = FLuaContainerTable

--[[--

]]
function FLuaContainerTable.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaContainerTable)
    
    return target
end
