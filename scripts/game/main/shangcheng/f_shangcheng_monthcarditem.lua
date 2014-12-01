require("scripts.auto.auto_shangcheng_monthCardItem")

--[[--
	充值面板上的月卡奖励物品
--]]--
f_shangcheng_monthcarditem = class("f_shangcheng_monthcarditem")
f_shangcheng_monthcarditem.__index = f_shangcheng_monthcarditem

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_monthcarditem] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_shangcheng_monthcarditem.static_create()
	local mainPanelTable = createshangcheng_monthCardItem()
	local mainPanel = mainPanelTable["shangcheng_monthCardItem"]
	  
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_shangcheng_monthcarditem)
	
	mainPanel.m_componentTable = mainPanelTable
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_monthcarditem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangcheng_monthcarditem:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_monthcarditem] setName
-------------------------------------------------------------------------------
function f_shangcheng_monthcarditem:setName(name)
	self.m_componentTable["scm_name_lbl"]:setString(name)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_monthcarditem] setCount
-------------------------------------------------------------------------------
function f_shangcheng_monthcarditem:setCount(count)
	self.m_componentTable["scm_count_lbl"]:setString(count)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_monthcarditem] setImage
-------------------------------------------------------------------------------
function f_shangcheng_monthcarditem:setImage(imagePath)
	self.m_componentTable["scm_img"]:setImage(imagePath)
    self.m_componentTable["scm_img"]:setExtensionsTextureRect(cc.rect(0, 0, 90, 90))
    self.m_componentTable["scm_img"]:setSize(cc.size(62, 62))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_monthcarditem] setQulityBg
-------------------------------------------------------------------------------
function f_shangcheng_monthcarditem:setQulityBg(path)
	self.m_componentTable["scm_quality_bg"]:setImage(path)
    self.m_componentTable["scm_quality_bg"]:setSize(cc.size(72,72))
end
