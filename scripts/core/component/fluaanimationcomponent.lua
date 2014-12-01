FLuaAnimationComponent = class("FLuaAnimationComponent")
FLuaAnimationComponent.__index = FLuaAnimationComponent

--[[--

]]
function FLuaAnimationComponent.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaAnimationComponent)
    
    return target
end


function FLuaAnimationComponent:runAnimation(animate, animation) 
	local needBlend = g_game.g_dictConfigManager:animationNeedBlend(animate, animation)
	self:playAnimation(animate, animation, needBlend)
end

