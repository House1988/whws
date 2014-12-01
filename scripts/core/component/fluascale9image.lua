FLuaScale9Image = class("FLuaScale9Image")
FLuaScale9Image.__index = FLuaScale9Image

--[[--

]]
function FLuaScale9Image.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaScale9Image)
    
    return target
end
