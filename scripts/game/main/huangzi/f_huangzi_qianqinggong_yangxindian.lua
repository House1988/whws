require("scripts.auto.auto_huangzi_qianqinggong_top")
require("scripts.game.main.huangzi.f_yangxindian_panel")

--[[--
   乾清宫 养心殿 界面
--]]--

f_huangzi_qianqinggong_yangxindian = class("f_huangzi_qianqinggong_yangxindian")
f_huangzi_qianqinggong_yangxindian.__index = f_huangzi_qianqinggong_yangxindian


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_huangzi_qianqinggong_yangxindian.static_create()
	local huangzi_qianqinggong_yangxindian_table = g_game.g_panelManager:create_panel("huangzi_qianqinggong_top")
	local huangzi_qianqinggong_yangxindian_panel = huangzi_qianqinggong_yangxindian_table["huangzi_qianqinggong_top"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_qianqinggong_yangxindian_panel, funTable)
	setmetatable(funTable, f_huangzi_qianqinggong_yangxindian)
	
	huangzi_qianqinggong_yangxindian_panel.m_componentTable = huangzi_qianqinggong_yangxindian_table
	return huangzi_qianqinggong_yangxindian_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:panelInitBeforePopup()
	self:registerNodeEvent()	
	
	self.m_yangxindian_panel = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] onEnter
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:onEnter() 
	self.m_componentTable["qqg_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self.m_yangxindian_panel = f_yangxindian_panel.static_create()	
	self.m_yangxindian_panel:panelInitBeforePopup()
	self.m_yangxindian_panel:setSize(cc.size(960,640))	  
	self:appendComponent(self.m_yangxindian_panel)
	self.m_yangxindian_panel:setAnchorPoint(cc.p(0,1))
	self.m_yangxindian_panel:setPositionInContainer(cc.p(0,0))
	
	self:initAllComponent()  
	
	--新手指引
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_DONGGONG)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] onExit
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:onExit()
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:onCleanup()
end



-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_qianqinggong_yangxindian] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_qianqinggong_yangxindian:initAllComponent()
  	self:setStopTouchEvent(true)
	--关闭当前按钮
	local closeCurrentPanel = function()
		g_game.g_panelManager:removeUiPanel("huangzi_qianqinggong_top")		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		
	end
	self.m_componentTable["qqg_close_button"]:addHandleOfcomponentEvent(closeCurrentPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
  
end


