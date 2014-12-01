FLuaContainerPanel = class("FLuaContainerPanel")
FLuaContainerPanel.__index = FLuaContainerPanel

--[[--

]]
function FLuaContainerPanel.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaContainerPanel)
    
    return target
end
