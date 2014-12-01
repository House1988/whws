require("scripts.auto.auto_mailAttachment")
require("scripts.auto.auto_attachmentItem")
--[[--
邮件面板
--]]--

f_mail_attachment = class("f_mail_attachment")
f_mail_attachment.__index = f_mail_attachment

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_mail_attachment.static_create()
	local mailTable = createmailAttachment()
	local mail = mailTable["mailAttachment"]

	local funTable = {}
	tolua.setpeer(mail, funTable)
	setmetatable(funTable, f_mail_attachment)

	mail.m_componentTable = mailTable

	return mail
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_mail_attachment:panelInitBeforePopup(datas)
	self:registerNodeEvent()
	
	self.m_datas = datas
	self.m_callback = nil
	self.m_index = nil
	
	self.m_componentTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_componentTable["title_label"]:setVisible(false)
	
	self.m_list = fc.FContainerList:create(2)
	self:appendComponent(self.m_list)
	self.m_list:setSize(cc.size(376, 210))
	self.m_list:setAnchorPoint(cc.p(0.5,0.5))
	self.m_list:setPositionInContainer(cc.p(479, 322))
	self.m_list:setStopTouchEvent(true) 
	self.m_list:enableClipping(true)
	
	self.m_list:setListInfo(10, 0, 5, 150, 200);
	
	self:fillList()
	
	local press = function()
		if self.m_callback ~= nil then
			self.m_callback(self.m_index)
		end
		g_game.g_panelManager:removeUiPanel("mail_attachment")
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(press,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local close = function()
		g_game.g_panelManager:removeUiPanel("mail_attachment")
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

function f_mail_attachment:setButtonState(state)
	self.m_componentTable["btn"]:setButtonState(state)
end

function f_mail_attachment:setCallback(callback, index)
	self.m_callback = callback
	self.m_index = index
end

function f_mail_attachment:fillList()

	for i = 1, #self.m_datas do
		if self.m_datas[i]["type"] ~= 7 then
			local item = require("scripts.game.main.mail.f_mail_attach_item").new()
			self.m_list:appendComponent(item)
			item:setData(self.m_datas[i])
		end
	end
end

function f_mail_attachment:registerNodeEvent(handler)
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
-- @function [parent=#f_mail_attachment] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_mail_attachment:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] onEnter
-------------------------------------------------------------------------------
function f_mail_attachment:onEnter()


	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] onExit
-------------------------------------------------------------------------------
function f_mail_attachment:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_mail_attachment:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] onExitTransitionStart
-------------------------------------------------------------------------------
function f_mail_attachment:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] onCleanup
-------------------------------------------------------------------------------
function f_mail_attachment:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attachment] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_mail_attachment:initAllComponent()

end