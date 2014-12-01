require("scripts.auto.auto_zhuanpan")


--[[--
   宠幸之后的 转盘
--]]--
f_game_beauty_zhuanpan = class("f_game_beauty_zhuanpan")
f_game_beauty_zhuanpan.__index = f_game_beauty_zhuanpan

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_game_beauty_zhuanpan.static_create()
	local zhuanpan_table = g_game.g_panelManager:create_panel("zhuanpan")
	local zhuanpan = zhuanpan_table["zhuanpan"]
	  
	local funTable = {}
	tolua.setpeer(zhuanpan, funTable)
	setmetatable(funTable, f_game_beauty_zhuanpan)
	
	zhuanpan.m_zhuanpan_table = zhuanpan_table
	return zhuanpan  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:panelInitBeforePopup()
	self.closeCallBack = nil
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:registerNodeEvent(handler)
    if not handler then
        handler = function(event)
            if event == "enter" then
                self:onEnter()
            elseif event == "exit" then
                self:onExit()
            elseif event == "enterTransitionFinish" then
                self:onEnterTransitionFinish()
            elseif event == "exitTransitionStart" then
                self:onExitTransitionStart()
            elseif event == "cleanup" then
                self:onCleanup()
            end
        end
    end
    self:registerScriptHandler(handler)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:onEnter()
  	self.m_zhuanpan_table["zp_bantouming_scale9"]:setOpacity(175)
  
  	local rotatePanel = self.m_zhuanpan_table["zp_zhuanpan_panel"]
  	
   --TARGET_KNOWLEDGE 180 TARGET_BEUTY 270  TARGET_EQUIP 0  TARGET_SON 90 
    local targetTableAngle = {180,270,0,90}
   
    local anglePerSec = 360*5  --每秒转多少度
    local baseAngle = 360*10  --基础角度
   
    local rotateBeginSecPercent = 0.2 --起始加速阶段  占总时间百分比
    local rotateBeginAnglePercent = 0.2   --总旋转角度的多少比例 用来起始加速
   
    local rotateEndSecPercent = 0.3 --结束减速阶段 占总时间百分比
    local rotateEndAnglePercent = 0.3 --总旋转角度的多少比例 用来减速
   
    local rotateMidSecPercent = 1 - rotateBeginSecPercent - rotateEndSecPercent
    local rotateMidAnglePercent = 1 - rotateBeginAnglePercent - rotateEndAnglePercent
  	
  	local favorResultId = g_game.g_userInfoManager:getChongxingResult()["rewardId"]
  	local favorResult = g_game.g_dictConfigManager:getChongxingRewardType(favorResultId)
  	
  	local totalRotateAngel = baseAngle + targetTableAngle[favorResult]
    local totalTime = totalRotateAngel / anglePerSec--希望转几秒
  
  	local rotateBegan = CCRotateBy:create(totalTime*rotateBeginSecPercent,totalRotateAngel*rotateBeginAnglePercent)
   	local rotateEnd = CCRotateBy:create(totalTime*rotateEndSecPercent*5,totalRotateAngel*rotateEndAnglePercent)
   		
   	local rotateBeganEaseBackIn = cc.EaseExponentialIn:create(rotateBegan)
   	local rotateEndEaseBackOut = cc.EaseExponentialOut:create(rotateEnd)
   	
   	local rotateMid = CCRotateBy:create(totalTime*rotateMidSecPercent,totalRotateAngel*rotateMidAnglePercent)
   
   	local finishRotate = function()
   		rotatePanel:setRotation(totalRotateAngel)
   	end
   	
   	local trigerNotice = function()
   		self:trigerNotice(favorResult)
   	end
   
   	local actions = g_game.g_transition.sequence({rotateBeganEaseBackIn,rotateMid,rotateEndEaseBackOut,cc.CallFunc:create(finishRotate),cc.DelayTime:create(1),cc.CallFunc:create(self.closeCallBack)})
   		
   	rotatePanel:runAction(actions)
   	
	self:initAllComponent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] setCloseCallBack
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:setCloseCallBack(callback)
	self.closeCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] onExit
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:onExit()  
  self:unregisterNodeEvent()
  send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP)
  send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_zhuanpan] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_zhuanpan:initAllComponent()
	self:setStopTouchEvent(true)
	
end

