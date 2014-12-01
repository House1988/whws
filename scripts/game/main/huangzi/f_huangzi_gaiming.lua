require("scripts.auto.auto_huangzigaiming")

f_huangzi_gaiming = class("f_huangzi_gaiming")
f_huangzi_gaiming.__index = f_huangzi_gaiming

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_huangzi_gaiming.static_create()
							 
	local infoTable = createhuangzigaiming()
	local info = infoTable["huangzigaiming"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_huangzi_gaiming)

	info.m_componentTable = infoTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_gaiming:panelInitBeforePopup()
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_gaiming:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_gaiming] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_gaiming:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] onEnter
-------------------------------------------------------------------------------
function f_huangzi_gaiming:onEnter()
	self:setStopTouchEvent(true)
	self:initAllComponent()
	
	self.m_inputText = ""
	
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] update
-------------------------------------------------------------------------------
function  f_huangzi_gaiming:update()
	if device.platform == "android" and self.m_componentTable["hzgm_input"]:getText() ~= self.m_inputText then
		self.m_inputText = self.m_componentTable["hzgm_input"]:getText()
		self.m_componentTable["hzgm_input"]:setText(self.m_inputText)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] onExit
-------------------------------------------------------------------------------
function f_huangzi_gaiming:onExit()
	self:unregisterNodeEvent()
	g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_gaiming:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_gaiming:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_gaiming:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_gaiming:initAllComponent()
	local func = function()
	end
	
    --添加关闭事件
	local closeGaiming = function()
		g_game.g_panelManager:removeUiPanel("prince_change_name")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzgm_close_button"]:addHandleOfcomponentEvent(closeGaiming,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--添加确定事件(暂定关闭事件)
	local quedingGaiming = function()
		local m_new_name = self.m_componentTable["hzgm_input"]:getText()
		if m_new_name ~= "" then
			if string.hybridTextLen(m_new_name) > g_game.MAX_PRINCE_NAME_LEN then
			    g_game.g_utilManager:showMsg("皇子名字不能超过七个字哦")	
			elseif  not g_game.g_utilManager:checkInput(m_new_name) then
				g_game.g_utilManager:showPublicMessagePanel(g_game.g_f_error_msg_def.F_LUA_ERROR_INPUT_ERROR,func)
			else
				self.m_prince_data["princeName"] = m_new_name
				g_game.g_userInfoManager:requestChangePrinceName(self.m_prince_data["id"], m_new_name)
				g_game.g_panelManager:removeUiPanel("prince_change_name")
			end				
		else
		    g_game.g_utilManager:showMsg("您还没有输入皇子名称哦")
		end		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzgm_queding_button"]:addHandleOfcomponentEvent(quedingGaiming,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	self.m_componentTable["hzgm_input"]:setPositionInContainer(cc.p(257,193))
	self.m_componentTable["hzgm_input"]:setReturnType(1)

end

function f_huangzi_gaiming:resetInputPosition()
	self.m_componentTable["hzgm_input"]:setPositionInContainer(cc.p(257,193))
end

function f_huangzi_gaiming:setPrinceData(princeData)
	self.m_prince_data = princeData
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_gaiming] getName
-------------------------------------------------------------------------------
function f_huangzi_gaiming:getName()
	return self.name
end


