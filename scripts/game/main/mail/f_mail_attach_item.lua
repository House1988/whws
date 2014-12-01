--[[
	继承自container panel, 用于显示邮件列表
]]--

require("scripts.auto.auto_attachmentItem")

local f_mail_attach_item = class("f_mail_attach_item", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_mail_attach_item")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attach_item] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_mail_attach_item:ctor()    
    self:registerNodeEvent()   
    	
	self:setSize(cc.size(150, 200))
	
	local item = createattachmentItem()
	self.m_item = item["attachmentItem"]	
	self.m_componentTable = item
	self:appendComponent(self.m_item)
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(75, 100))
	
	self.m_componentTable["piece"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attach_item] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_mail_attach_item:onEnter() 
	
end


function f_mail_attach_item:onExit()    
    self:unregisterNodeEvent()
end

function f_mail_attach_item:onEnterTransitionFinish()
end

function f_mail_attach_item:onExitTransitionStart()
end

function f_mail_attach_item:onCleanup()
end


function f_mail_attach_item:registerNodeEvent(handler)
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

function f_mail_attach_item:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mail_attach_item] setData
-- 设置邮件附件信息
-------------------------------------------------------------------------------
function f_mail_attach_item:setData(data)

	local type = data["type"]
	local id = data["id"]
	
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
	
	local icon = self.m_componentTable["image"]
	icon:setImage(imagePath)
	icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
	
	self.m_componentTable["name"]:setString(name)
	
	local frame = self.m_componentTable["frame"]
	frame:setImage(g_game.g_f_quality_image[q])
	local p = frame:getPositionInContainer()
	
	if type == 10 or type == 11 then
		self.m_componentTable["piece"]:setVisible(true)
		self.m_componentTable["piece"]:setImage("batch_ui/hunpi_biaozhi.png")
	elseif type == 12 or type == 13 then
		self.m_componentTable["piece"]:setVisible(true)
		self.m_componentTable["piece"]:setImage("batch_ui/suipian_junjichu.png")
	else
		self.m_componentTable["piece"]:setVisible(false)
	end
	
	local label = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))	
	self:appendComponent(label)
	label:setSize(cc.size(90, 25))
	label:setScale(0.5)
	label:setAnchorPoint(cc.p(1, 0))
	label:setPositionInContainer(cc.p(p.x, p.y + 45))
	label:setTextWithInt(data["num"])
	if data["num"] == 17000 then
		local a = 0
	end
	label:setAlignment(0)
end

return f_mail_attach_item