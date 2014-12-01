FLuaContainerPage = class("FLuaContainerPage")
FLuaContainerPage.__index = FLuaContainerPage

--[[--

]]
function FLuaContainerPage.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaContainerPage)
    
    return target
end
