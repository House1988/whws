require("scripts.auto.auto_huangzi_yuelongmen")
require("scripts.game.main.huangzi.f_shangshufang_panel")
require("scripts.game.main.huangzi.f_zongrenfu_panel")

--[[--
   跃龙门 界面
--]]--

f_huangzi_yuelongmen_panel = class("f_huangzi_yuelongmen_panel")
f_huangzi_yuelongmen_panel.__index = f_huangzi_yuelongmen_panel


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_huangzi_yuelongmen_panel.static_create()
	local huangzi_yuelongmen_table = createhuangzi_yuelongmen()
	local huangzi_yuelongmen_panel = huangzi_yuelongmen_table["huangzi_yuelongmen"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_yuelongmen_panel, funTable)
	setmetatable(funTable, f_huangzi_yuelongmen_panel)
	
	huangzi_yuelongmen_panel.m_componentTable = huangzi_yuelongmen_table
	return huangzi_yuelongmen_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:panelInitBeforePopup()
	self.m_targetPriceData = nil
	self:registerNodeEvent()	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_yuelongmen_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] onEnter
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:onEnter()  
	self.m_componentTable["hz_ylm_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET) 
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] onExit
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:onExit()  
  self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:initAllComponent()
	--关闭当前按钮
	local closeCurrentPanel = function()
		g_game.g_panelManager:removeUiPanel("huangzi_yuelongmen")	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_ylm_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--尚书房点击进入事件
	local popShangshufang = function()
		self:popShangshufang()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_ylm_ssf_enter_button"]:addHandleOfcomponentEvent(popShangshufang,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--宗人府点击进入事件
	local popZongrenfu = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)		
		if not g_game.g_userInfoManager:hasHuangZiLv5() then
			local getStr = g_game.g_dictConfigManager:getLanTextById(g_game.g_f_error_msg[g_game.g_f_error_msg_def.F_LUA_ERROR_FIVE_LEVEL_PRINCE])
			g_game.g_utilManager:showMsg(getStr)			
			return 
		end		
		
		self:popZongrenfu()
	end
	self.m_componentTable["hz_ylm_zzf_enter_button"]:addHandleOfcomponentEvent(popZongrenfu,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] setTargetPriceData
-- 设置传入跃龙门的皇子信息
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:setTargetPriceData(data)
	if self.m_targetPriceData == data then
		return 
	end
	self.m_targetPriceData = data
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] popShangshufang
-- 弹出尚书房
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:popShangshufang()
	local shangshufang_panel = f_shangshufang_panel.static_create()
    shangshufang_panel:panelInitBeforePopup()	
    shangshufang_panel:setStopTouchEvent(true)
    shangshufang_panel:setSize(cc.size(960,640))
    g_game.g_panelManager:showUiPanel(shangshufang_panel, "huangzi_shangshufang")	
    shangshufang_panel:setEducationPrinceData(self.m_targetPriceData)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_yuelongmen_panel] popZongrenfu
-- 弹出宗人府
-------------------------------------------------------------------------------
function f_huangzi_yuelongmen_panel:popZongrenfu()
	local zongrenfu_panel = f_zongrenfu_panel.static_create()
    zongrenfu_panel:panelInitBeforePopup()	
    zongrenfu_panel:setStopTouchEvent(true)
    zongrenfu_panel:setTargetPrinceData(self.m_targetPriceData)
    zongrenfu_panel:setType(1)
    g_game.g_panelManager:showUiPanel(zongrenfu_panel, "huangzi_zongrenfu")		  
end

