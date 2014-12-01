--[[
继承自container panel, 用于显示精英副本过关 奖励物品
]]--

require("scripts.auto.auto_attachmentItem")

local f_battle_elite_reward_item = class("f_battle_elite_reward_item", function()
	return g_game.g_classFactory.newFLuaContainerPanel("f_battle_elite_reward_item")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_item] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_battle_elite_reward_item:ctor()
	self:registerNodeEvent()

	self:setSize(cc.size(150, 200))

	local item = createattachmentItem()
	self.m_item = item["attachmentItem"]
	self.m_componentTable = item
	self:appendComponent(self.m_item)
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(75, 100))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_item] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_battle_elite_reward_item:onEnter()

end


function f_battle_elite_reward_item:onExit()
	self:unregisterNodeEvent()
end

function f_battle_elite_reward_item:onEnterTransitionFinish()
end

function f_battle_elite_reward_item:onExitTransitionStart()
end

function f_battle_elite_reward_item:onCleanup()
end


function f_battle_elite_reward_item:registerNodeEvent(handler)
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

function f_battle_elite_reward_item:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_item] setSilver
-------------------------------------------------------------------------------
function f_battle_elite_reward_item:setSilver(silver)
	local frame = self.m_componentTable["frame"]
	local p = frame:getPositionInContainer()
	local icon = self.m_componentTable["image"]
	icon:setImage(g_game.g_resourceManager:getItemImage("yinliang_icon"))
	icon:setSize(cc.size(90,90))

	local name =  "银两"
	self.m_componentTable["name"]:setString(name)

	local q = 2
	frame:setImage(g_game.g_f_quality_image[q])

	local label = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(label)
	label:setSize(cc.size(90, 25))
	label:setScale(0.5)
	label:setAnchorPoint(cc.p(1, 0))
	label:setPositionInContainer(cc.p(p.x + 45, p.y + 45))
	label:setTextWithInt(silver)
	label:setAlignment(2)
	self.m_componentTable["piece"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_item] setGold
-------------------------------------------------------------------------------
function f_battle_elite_reward_item:setGold(gold)
	local frame = self.m_componentTable["frame"]
	local p = frame:getPositionInContainer()
	local icon = self.m_componentTable["image"]
	icon:setImage(g_game.g_resourceManager:getItemImage("yuanbao_icon"))
	icon:setSize(cc.size(90,90))

	local name =  "元宝"
	self.m_componentTable["name"]:setString(name)

	local q = 5
	frame:setImage(g_game.g_f_quality_image[q])

	local label = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(label)
	label:setSize(cc.size(90, 25))
	label:setScale(0.5)
	label:setAnchorPoint(cc.p(1, 0))
	label:setPositionInContainer(cc.p(p.x + 45, p.y + 45))
	label:setTextWithInt(gold)
	label:setAlignment(2)
	self.m_componentTable["piece"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_item] setItem
-------------------------------------------------------------------------------
function f_battle_elite_reward_item:setItem(data)
	local frame = self.m_componentTable["frame"]
	local p = frame:getPositionInContainer()
	local icon = self.m_componentTable["image"]
	local image = g_game.g_dictConfigManager:getPropsResource(data["propId"])
	icon:setImage(g_game.g_resourceManager:getItemImage(image))
	icon:setSize(cc.size(90,90))

	local name =  g_game.g_dictConfigManager:getPropsName(data["propId"])
	self.m_componentTable["name"]:setString(name)

	local q  = g_game.g_dictConfigManager:getPropsQuality(data["propId"])
	frame:setImage(g_game.g_f_quality_image[q])

	local label = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(label)
	label:setSize(cc.size(90, 25))
	label:setScale(0.5)
	label:setAnchorPoint(cc.p(1, 0))
	label:setPositionInContainer(cc.p(p.x + 45, p.y + 45))
	label:setTextWithInt(data["num"])
	label:setAlignment(2)
	
	self.m_componentTable["piece"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_elite_reward_item] setData
-------------------------------------------------------------------------------
function f_battle_elite_reward_item:setData(data)
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(data["type"], data["showId"])

	local icon = self.m_componentTable["image"]
	icon:setImage(imagePath)
	icon:setExtensionsTextureRect(cc.rect(0,0,90,90))

	self.m_componentTable["name"]:setString(name)
	
	if data["type"] == 10 or data["type"] == 11 then
		local flag = fc.FExtensionsImage:create()
	    flag:setImage("batch_ui/hunpi_biaozhi.png")
	    flag:setSize(cc.size(42,61))
	    flag:setAnchorPoint(cc.p(0.5,0.5))
	    self.m_item:appendComponent(flag)
	    flag:setPositionInContainer(cc.p(115,114))
	elseif data["type"] == 12 or data["type"] == 13 then
		local flag = fc.FExtensionsImage:create()
	    flag:setImage("batch_ui/suipian_junjichu.png")
	    flag:setSize(cc.size(70,55))
	    flag:setAnchorPoint(cc.p(0.5,0.5))
	    self.m_item:appendComponent(flag)
	    flag:setPositionInContainer(cc.p(120,123))
	end

	local frame = self.m_componentTable["frame"]
	frame:setImage(g_game.g_f_quality_image[q])
	self.m_componentTable["piece"]:setVisible(false)
end


return f_battle_elite_reward_item