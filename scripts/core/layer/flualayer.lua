FLuaLayer = class("FLuaLayer")
FLuaLayer.__index = FLuaLayer

--[[--

]]
function FLuaLayer.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaLayer)
    
    return target
end

function FLuaLayer:setTag(tag)
	self.m_tag = tag
end

function FLuaLayer:getTag()
	return self.m_tag
end
