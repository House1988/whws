--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_dailyReward")

local f_dailyReward = class("f_dailyReward", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_dailyReward")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_dailyReward:ctor()    
    self:registerNodeEvent()   
   	
   	self:setSize(cc.size(960, 640))
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_dailyReward:onEnter() 
--	self:enableClipping(true)
	
end


function f_dailyReward:onExit()    
    self:unregisterNodeEvent()
end

function f_dailyReward:onEnterTransitionFinish()
end

function f_dailyReward:onExitTransitionStart()
end

function f_dailyReward:onCleanup()
end


function f_dailyReward:registerNodeEvent(handler)
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

function f_dailyReward:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_dailyReward:initAllComponent()	
	if self.m_page ~= nil then
		self:deleteComponent(self.m_page)
	end	
	self.m_page = nil

	local dailyRewardTable = createdailyReward()
	self.dailyReward = dailyRewardTable["dailyReward"]	
	self.m_componentTable = dailyRewardTable
	
	self:appendComponent(self.dailyReward)
	
	self.dailyReward:setAnchorPoint(cc.p(0.5, 0.5))
	self.dailyReward:setPositionInContainer(cc.p(480, 320))
	
	self.m_page = fc.FContainerPage:create(2)
	self:appendComponent(self.m_page)
	self.m_page:setSize(cc.size(630, 500))
	self.m_page:setAnchorPoint(cc.p(0.5,0.5))
	self.m_page:setPositionInContainer(cc.p(643, 390))
	self.m_page:setStopTouchEvent(true) 
	self.m_page:enableClipping(true)

	local fillPage = function(pageIndex)
		self:fillPage(pageIndex)
	end
	self.m_page:registLoadPageCallback(fillPage)
	
	local index = g_game.g_userInfoManager.m_claimDailyRewardIndex
	for i = 1, index do
		if not g_game.g_userInfoManager:isReceiveDailyReward(i) then
			index = i
			break
		end
	end
	
	index = math.ceil(index / 3)
	
	self.m_levelList = g_game.g_dictConfigManager:getLevelRewardTable()
	self.m_maxPage = 10
		
	self.m_page:setPageInfoAndIndex(30, 3, 1, 5, 0, 630, 160, index)
	self:fillDisplayItems()
end

function f_dailyReward:fillDisplayItems()
	for i = 1, 3 do
		local frame = self.m_componentTable["item" .. i]
		local icon = fc.FExtensionsImage:create()
		local s = frame:getSize()
		local p = frame:getPositionInContainer()
		self:appendComponent(icon)
		local q = 1
		local name = ""
		local image = ""
		if i == 1 then
			image, q, name = g_game.g_dictConfigManager:getResByType(4, 0)
		elseif i == 2 then
			image, q, name = g_game.g_dictConfigManager:getResByType(5, 0)
		else
			image, q, name = g_game.g_dictConfigManager:getResByType(1, 21)
		end
		frame:setImage(g_game.g_f_quality_image[q])
		icon:setImage(image)
		icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
		icon:setAnchorPoint(cc.p(0.5,0.5))
		icon:setPositionInContainer(p)
		self.m_componentTable["dr_name" .. i]:setString(name)
	end
end

function f_dailyReward:fillPage(pageIndex)
	if pageIndex < 1 or pageIndex > self.m_maxPage then
		return
	end
	
	if not self.m_page:needLoadPage(pageIndex) then
		return
	end
	local i = (pageIndex - 1) * 3 + 1
	local e = i + 2
	for i = i, e do
		local item = require("scripts.game.main.reward.f_dailyReward_item").new()
		item:setData(i)
		self.m_page:addComponentToPage(item, pageIndex)		
	end
end

return f_dailyReward
