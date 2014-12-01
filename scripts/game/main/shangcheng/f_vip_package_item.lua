require("scripts.auto.auto_vip_pac_item")

f_vip_package_item = class("f_vip_package_item")
f_vip_package_item.__index = f_vip_package_item

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_vip_package_item.static_create()
							 
	local soliderInfoTable = createvip_pac_item()
	local soldierInfo = soliderInfoTable["vip_pac_item"]

	local funTable = {}
	tolua.setpeer(soldierInfo, funTable)
	setmetatable(funTable, f_vip_package_item)

	soldierInfo.m_componentTable = soliderInfoTable

	return soldierInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_vip_package_item:panelInitBeforePopup()
	self:registerNodeEvent()
end

function f_vip_package_item:setNumVisible(visible)
	self.m_componentTable["vip_animlabel"]:setVisible(visible)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] setData
-------------------------------------------------------------------------------
function f_vip_package_item:setData(data)
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(data[3], data[4])
	
	self.m_componentTable["vip_pac_item_image"]:setImage(imagePath)
	self.m_componentTable["vip_pac_item_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	
	self.m_componentTable["vip_pac_item_quality"]:setImage(g_game.g_f_quality_image[q])
	
	self.m_componentTable["vip_animlabel"]:setAnchorPoint(cc.p(1,0))
	self.m_componentTable["vip_animlabel"]:setAlignment(2)
	self.m_componentTable["vip_animlabel"]:setScale(0.4)
	self.m_componentTable["vip_animlabel"]:setPositionInContainer(cc.p(97,98))
	self.m_componentTable["vip_animlabel"]:setTextWithInt(data[5])
	
	--碎片
	if data[3] >= 9 and data[3] <= 13 then
		local type = g_game.g_dictConfigManager:getPieceType(data[4])
		
		if type == 1 or type == 2 then
			local flag = fc.FExtensionsImage:create()
		    flag:setImage("batch_ui/hunpi_biaozhi.png")
		    flag:setSize(cc.size(42,61))
		    flag:setAnchorPoint(cc.p(0.5,0.5))
		    self:appendComponent(flag)
		    flag:setPositionInContainer(cc.p(95,94))
		elseif type == 3 or type == 4 then
			local flag = fc.FExtensionsImage:create()
		    flag:setImage("batch_ui/suipian_junjichu.png")
		    flag:setSize(cc.size(70,55))
		    flag:setAnchorPoint(cc.p(0.5,0.5))
		    self:appendComponent(flag)
		    flag:setPositionInContainer(cc.p(95,94))
		end
	end
	
	self.m_componentTable["vip_name"]:setColor(cc.c3b(250,255,165))
	self.m_componentTable["vip_name"]:setString(name)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] setLabelVisible
-------------------------------------------------------------------------------
function f_vip_package_item:setLabelVisible(b)
	self.m_componentTable["vip_name"]:setVisible(b)
	self.m_componentTable["vip_name_di"]:setVisible(b)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] registerNodeEvent
-------------------------------------------------------------------------------
function f_vip_package_item:registerNodeEvent(handler)
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
-- @function [parent=#f_vip_package_item] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_vip_package_item:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] onEnter
-------------------------------------------------------------------------------
function f_vip_package_item:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] onExit
-------------------------------------------------------------------------------
function f_vip_package_item:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_vip_package_item:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] onExitTransitionStart
-------------------------------------------------------------------------------
function f_vip_package_item:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] onCleanup
-------------------------------------------------------------------------------
function f_vip_package_item:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_package_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_vip_package_item:initAllComponent()
end
