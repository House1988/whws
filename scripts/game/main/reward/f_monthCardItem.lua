require("scripts.auto.auto_monthCardItem")

--[[--
	充值面板上的月卡奖励物品
--]]--
f_monthCardItem = class("f_monthCardItem")
f_monthCardItem.__index = f_monthCardItem

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardItem] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_monthCardItem.static_create()
	local mainPanelTable = createmonthCardItem()
	local mainPanel = mainPanelTable["monthCardItem"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_monthCardItem)
	
	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_monthCardItem:initAllComponent()
	self.m_componentTable["mci_count_lbl"]:setAlignment(2)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardItem] setName
-------------------------------------------------------------------------------
function f_monthCardItem:setName(name)
	self.m_componentTable["mci_name_lbl"]:setString(name)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardItem] setCount
-------------------------------------------------------------------------------
function f_monthCardItem:setCount(count)
	self.m_componentTable["mci_count_lbl"]:setString(count)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardItem] setImage
-------------------------------------------------------------------------------
function f_monthCardItem:setImage(imagePath)
	self.m_componentTable["mci_img"]:setImage(imagePath)
    self.m_componentTable["mci_img"]:setExtensionsTextureRect(cc.rect(0, 0, 90, 90))
    self.m_componentTable["mci_img"]:setSize(cc.size(90, 90))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_monthCardItem] setQulityBg
-------------------------------------------------------------------------------
function f_monthCardItem:setQulityBg(path)
	self.m_componentTable["mci_quality_bg"]:setImage(path)
    self.m_componentTable["mci_quality_bg"]:setSize(cc.size(104,104))
end
