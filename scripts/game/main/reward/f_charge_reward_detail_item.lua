--[[--
限时充值奖励界面
--]]--

require("scripts.auto.auto_charge_reward_detail_item")

f_charge_reward_detail_item = class("f_charge_reward_detail_item")
f_charge_reward_detail_item.__index = f_charge_reward_detail_item

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_charge_reward_detail_item.static_create()
	local mainPanelTable = createcharge_reward_detail_item()
	local mainPanel = mainPanelTable["charge_reward_detail_item"]
	
	local funTable = {}
	tolua.setpeer(mainPanel, funTable)
	setmetatable(funTable, f_charge_reward_detail_item)

	mainPanel.m_componentTable = mainPanelTable
	mainPanel:initAllComponent()
	
	return mainPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_charge_reward_detail_item:initAllComponent()

end


-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_item] setName
-------------------------------------------------------------------------------
function f_charge_reward_detail_item:setName(name)
	self.m_componentTable["cri_name_lbl"]:setString(name)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_item] setCount
-------------------------------------------------------------------------------
function f_charge_reward_detail_item:setCount(count)
	self.m_componentTable["cri_count_lbl"]:setString(count)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_item] setImage
-------------------------------------------------------------------------------
function f_charge_reward_detail_item:setImage(imagePath)
	self.m_componentTable["cri_item_image"]:setImage(imagePath)
    self.m_componentTable["cri_item_image"]:setExtensionsTextureRect(cc.rect(0, 0, 92, 92))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_charge_reward_detail_item] setQulityBg
-------------------------------------------------------------------------------
function f_charge_reward_detail_item:setQulityBg(path)
	self.m_componentTable["cri_item_bg"]:setImage(path)
    self.m_componentTable["cri_item_bg"]:setSize(cc.size(104,104))
end
