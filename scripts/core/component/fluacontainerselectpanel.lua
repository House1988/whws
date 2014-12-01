FLuaContainerSelectPanel = class("FLuaContainerSelectPanel")
FLuaContainerSelectPanel.__index = FLuaContainerSelectPanel

--[[--

]]
function FLuaContainerSelectPanel.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaContainerSelectPanel)
    
    return target
end
