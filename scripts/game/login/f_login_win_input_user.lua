--[[
	继承自container panel, 用于windows输入帐号
]]--

require("scripts.auto.auto_jinluandian_nianhao")

local FLuaLoginWinInputUser = class("FLuaLoginWinInputUser", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaLoginWinInputUser")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginWinInputUser] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaLoginWinInputUser:ctor()    
    self:registerNodeEvent() 
    
	local nianhaoPanel_table = createjinluandian_nianhao()
	self.m_name_panel = nianhaoPanel_table["jinluandian_nianhao"]	
	self.m_componentTable = nianhaoPanel_table
	
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
	
	self:appendComponent(self.m_name_panel)
	self.m_name_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_name_panel:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width*0.5, g_game.g_display.sizeInPixels.height*0.5))
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginWinInputUser] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaLoginWinInputUser:onEnter()   
	self:setStopTouchEvent(true)
	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["jld_nh_tishiyu_label"]:setString("皇上，請確定本朝年號：")
		self.m_componentTable["jld_nh_queding_button"]:setText("確  定",cc.c3b(255,255,255))
	end
	self:initAllComponent()
	
end


function FLuaLoginWinInputUser:onExit()    
    self:unregisterNodeEvent()
end

function FLuaLoginWinInputUser:onEnterTransitionFinish()
end

function FLuaLoginWinInputUser:onExitTransitionStart()
end

function FLuaLoginWinInputUser:onCleanup()
end


function FLuaLoginWinInputUser:registerNodeEvent(handler)
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

function FLuaLoginWinInputUser:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginWinInputUser] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function FLuaLoginWinInputUser:initAllComponent()	
	local createCallBack = function()
		local nianhao = self.m_componentTable["jld_nh_input"]:getText()	
		self.m_componentTable["suiji"]:setVisible(false)
		if DEBUG_USE_DEFAULT_USER then
			nianhao = g_default_user[1]
		end
		if nianhao ~= "" then						
			self.m_nianhao = nianhao
			if self.m_input_done_callback then
				self.m_input_done_callback(self.m_nianhao)
			end
		else
			g_game.g_utilManager:showMsg("您还没有输入账号哦")
		end	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jld_nh_queding_button"]:addHandleOfcomponentEvent(createCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self.m_componentTable["jld_nh_tishiyu_label"]:setString("请输入账号:")
		
    self.m_componentTable["jld_nh_input"]:setReturnType(1)
    self.m_componentTable["suiji"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginWinInputUser] setInputDoneCallback
-- 输入后回调
-------------------------------------------------------------------------------
function FLuaLoginWinInputUser:setInputDoneCallback(callback)	
	self.m_input_done_callback = callback
end

-- 显示快速登录按钮
function FLuaLoginWinInputUser:showFastLoginBtn( )
	self.m_componentTable["jld_nh_fastlogin_button"]:setVisible(true)
	self.m_componentTable["jld_nh_fastlogin_button"]:setPositionInContainer(cc.p(361,197.5))
	self.m_componentTable["jld_nh_queding_button"]:setPositionInContainer(cc.p(161,197.5))
end

-- 设置快速登录输入后回调
function FLuaLoginWinInputUser:setFastLoginCallBack( callback )
	self.fase_login_callback = callback
	self.m_componentTable["jld_nh_fastlogin_button"]:addHandleOfcomponentEvent(self.fase_login_callback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginWinInputUser] showInput
-- 重新设置input位置
-------------------------------------------------------------------------------
function FLuaLoginWinInputUser:showInput()
	if device.platform == "ios" then
		self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,125))
	else
		self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,125))
	end
    
end

return FLuaLoginWinInputUser
