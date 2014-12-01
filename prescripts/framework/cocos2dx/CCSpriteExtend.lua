
CCSpriteExtend = class("CCSpriteExtend", CCNodeExtend)
CCSpriteExtend.__index = CCSpriteExtend

function CCSpriteExtend.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, CCSpriteExtend)
    return target
end

function CCSpriteExtend:runAnimationOnce(animation, removeWhenFinished, onComplete, delay)
    return transition.runAnimationOnce(self, animation, removeWhenFinished, onComplete, delay)
end

function CCSpriteExtend:runAnimationForever(animation, delay)
    return transition.runAnimationForever(self, animation, delay)
end
