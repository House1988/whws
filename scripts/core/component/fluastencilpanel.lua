FLuaStencilPanel = class("FLuaStencilPanel")
FLuaStencilPanel.__index = FLuaStencilPanel

--[[--

]]
function FLuaStencilPanel.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaStencilPanel)
    
    return target
end
