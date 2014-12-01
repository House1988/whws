FLuaContainerScroll = class("FLuaContainerScroll")
FLuaContainerScroll.__index = FLuaContainerScroll

--[[--

]]
function FLuaContainerScroll.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaContainerScroll)
    
    return target
end
