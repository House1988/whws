--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_rank_reward_item")

local f_rankRewardPreviewItem = class("f_rankRewardPreviewItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_rankRewardPreviewItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreviewItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_rankRewardPreviewItem:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(600, 160))	
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreviewItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_rankRewardPreviewItem:onEnter() 
	
end


function f_rankRewardPreviewItem:onExit()    
    self:unregisterNodeEvent()
end

function f_rankRewardPreviewItem:onEnterTransitionFinish()
end

function f_rankRewardPreviewItem:onExitTransitionStart()
end

function f_rankRewardPreviewItem:onCleanup()
end


function f_rankRewardPreviewItem:registerNodeEvent(handler)
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

function f_rankRewardPreviewItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreviewItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_rankRewardPreviewItem:initAllComponent()	
	local dailyRewardItem = createrank_reward_item()
	self.m_item = dailyRewardItem["rank_reward_item"]	
	self.m_componentTable = dailyRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(300, 80))

end

-------------------------------------------------------------------------------
-- @function [parent=#f_rankRewardPreviewItem] setData
-- 设置登陆奖励信息
-------------------------------------------------------------------------------
function f_rankRewardPreviewItem:setData(index)	
	self.m_data = g_game.g_dictConfigManager:getRankReward(index)
	if self.m_data == nil then
		return
	end
	self.m_componentTable["mingci"]:setAlignment(0)
	if self.m_data[2] == self.m_data[3] then
		self.m_componentTable["mingci"]:setString("第" .. self.m_data[2] .. "名")
	else
		self.m_componentTable["mingci"]:setString("第" .. self.m_data[2] .. "-" .. self.m_data[3] .. "名")
	end
	self.m_componentTable["text1"]:setAlignment(0)
	self.m_componentTable["text2"]:setAlignment(0)
	self.m_componentTable["text2"]:setString(self.m_data[4] .. "")

	for i = 1, 6 do
		if self.m_data[i * 3 + 2] == 0 then
			self.m_componentTable["itme" .. i]:setVisible(false)
		else
			self.m_componentTable["itme" .. i]:setVisible(true)
			local type = self.m_data[i * 3 + 2]
			local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, self.m_data[i * 3 + 3])
			self.m_componentTable["image" .. i]:setImage(imagePath)
			self.m_componentTable["image" .. i]:setExtensionsTextureRect(cc.rect(0, 0, 90, 90))
			self.m_componentTable["image" .. i]:setSize(cc.size(65, 65))
			self.m_componentTable["frame" .. i]:setImage(g_game.g_f_quality_image[q])
			self.m_componentTable["frame" .. i]:setSize(cc.size(75, 75))
			self.m_componentTable["name" .. i]:setString(name)
			self.m_componentTable["number" .. i]:setAlignment(2)
			self.m_componentTable["number" .. i]:setString("" .. self.m_data[i * 3 + 4])
			if type >= 9 and type <= 13 then
				self.m_componentTable["flag" .. i]:setVisible(true)
				if type == 12 or type == 13 then
					self.m_componentTable["flag" .. i]:setImage("batch_ui/suipian_junjichu.png")
				else
					self.m_componentTable["flag" .. i]:setImage("batch_ui/hunpi_biaozhi.png")
				end
				self.m_componentTable["flag" .. i]:setSize(cc.size(32, 48))
			else
				self.m_componentTable["flag" .. i]:setVisible(false)
			end
		end
	end
end

return f_rankRewardPreviewItem