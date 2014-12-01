require("scripts.auto.auto_xunfangPopup")
--[[--
邮件面板
--]]--

f_xunfang_reward = class("f_xunfang_reward")
f_xunfang_reward.__index = f_xunfang_reward

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_xunfang_reward.static_create()
	local mailTable = createxunfangPopup()
	local mail = mailTable["xunfangPopup"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_xunfang_reward)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_xunfang_reward:panelInitBeforePopup(index)
	self:registerNodeEvent()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN)
	self.m_index = index
	self.m_call = nil

	local close = function()
		g_game.g_panelManager:removeUiPanel("xunfang_reward")
		local panel = g_game.g_panelManager:getUiPanel("xunfang_panel")
		if panel ~= nil then
			panel:endAnim()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local onece = function()
		local panel = g_game.g_panelManager:getUiPanel("xunfang_panel")
		if panel ~= nil then
			panel:endAnim()
		end
		self.m_call(self.m_index)
		g_game.g_panelManager:removeUiPanel("xunfang_reward")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn_onemore"]:addHandleOfcomponentEvent(onece,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_xunfang_reward:setCallback(call)
	self.m_call = call
end

function f_xunfang_reward:registerNodeEvent(handler)
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

function f_xunfang_reward:setData(type, id, num)
	
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
	
	local icon = self.m_componentTable["image"]
	icon:setImage(imagePath)
	icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
	
	self.m_componentTable["name"]:setString(name)
	
	local frame = self.m_componentTable["frame"]
	frame:setImage(g_game.g_f_quality_image[q])
	local p = frame:getPositionInContainer()
	
	local label = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))	
	self.m_componentTable["itempanel1"]:appendComponent(label)
	label:setSize(cc.size(90, 25))
	label:setScale(0.5)
	label:setAnchorPoint(cc.p(1, 0))
	label:setPositionInContainer(cc.p(p.x + 45, p.y + 45))
	label:setTextWithInt(num)
	label:setAlignment(2)
	self.m_componentTable["suipianIcon"]:setVisible(type == 12 )
	self.m_componentTable["hunpoIcon"]:setVisible(type == 10 or type == 11)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_xunfang_reward:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] onEnter
-------------------------------------------------------------------------------
function f_xunfang_reward:onEnter()

end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] onExit
-------------------------------------------------------------------------------
function f_xunfang_reward:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_xunfang_reward:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] onExitTransitionStart
-------------------------------------------------------------------------------
function f_xunfang_reward:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xunfang_reward] onCleanup
-------------------------------------------------------------------------------
function f_xunfang_reward:onCleanup()
end
