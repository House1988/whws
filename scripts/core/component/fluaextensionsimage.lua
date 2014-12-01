FLuaExtensionsImage = class("FLuaExtensionsImage")
FLuaExtensionsImage.__index = FLuaExtensionsImage

--[[--

]]
function FLuaExtensionsImage.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaExtensionsImage)
    
    return target
end
