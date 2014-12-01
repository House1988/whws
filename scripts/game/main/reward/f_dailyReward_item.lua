--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_dailyRewardItem")

local f_dailyReward_item = class("f_dailyReward_item", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_dailyReward_item")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward_item] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_dailyReward_item:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(620, 160))	
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward_item] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_dailyReward_item:onEnter() 
	
end


function f_dailyReward_item:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_CLAIM_DAILY_REWARD, self.onClaim)
end

function f_dailyReward_item:onEnterTransitionFinish()
end

function f_dailyReward_item:onExitTransitionStart()
end

function f_dailyReward_item:onCleanup()
end


function f_dailyReward_item:registerNodeEvent(handler)
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

function f_dailyReward_item:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_dailyReward_item:initAllComponent()	
	local dailyRewardItem = createdailyRewardItem()
	self.m_item = dailyRewardItem["dailyRewardItem"]	
	self.m_componentTable = dailyRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(310, 80))
	
	local btnClick = function()
		self:clickClaim()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(btnClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.onClaim = function()
		self:onClaimReward()
	end
	
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CLAIM_DAILY_REWARD, self.onClaim)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward_item] onClaimReward
-- 获得奖励
-------------------------------------------------------------------------------
function f_dailyReward_item:onClaimReward()	
	if g_game.g_userInfoManager.m_claimDailyRewardIndex == self.m_index then
		self.m_componentTable["label"]:setVisible(true)
		self.m_componentTable["btn"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward_item] setData
-- 设置登陆奖励信息
-------------------------------------------------------------------------------
function f_dailyReward_item:setData(index)	
	self.m_data = g_game.g_dictConfigManager:getLoginRewardData(index)
	self.m_index = index
	self.m_componentTable["text_tian"]:setString(index)
	
	local hasReceive = g_game.g_userInfoManager:isReceiveDailyReward(index)
	if self.m_index > g_game.g_userInfoManager.m_claimDailyRewardIndex then
		self.m_componentTable["label"]:setVisible(false)
		self.m_componentTable["btn"]:setVisible(true)
		self.m_componentTable["btn"]:setButtonState(8)
	else
		self.m_componentTable["label"]:setVisible(hasReceive)
		self.m_componentTable["btn"]:setVisible(not hasReceive)
		self.m_componentTable["btn"]:setButtonState(2)
	end
	
	local j = 1
	for i = 1, 4 do
		if self.m_data[1 + i * 3] > 0 then
			local frame = self.m_componentTable["item" .. j]
			local icon = fc.FExtensionsImage:create()
			local p = frame:getPositionInContainer()
			self.m_item:appendComponent(icon)
			
			local type = self.m_data[i*3-1]
			local id = self.m_data[i*3]
			local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
			
			icon:setImage(imagePath)
			icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
			icon:setSize(cc.size(70, 70))
			icon:setAnchorPoint(cc.p(0.5,0.5))
			icon:setPositionInContainer(p)
		
			self.m_componentTable["number" .. i]:setString(self.m_data[1 + i * 3])
			self.m_componentTable["number" .. i]:setComponentZOrder(1)
			self.m_componentTable["it_name" .. i]:setString(name)
			
			frame:setImage(g_game.g_f_quality_image[q])
			frame:setSize(cc.size(80,80))
			j = j + 1
		end
	end
	for j = j, 4 do
		self.m_componentTable["item" .. j]:setVisible(false)
		self.m_componentTable["number" .. j]:setVisible(false)
		self.m_componentTable["namebg" .. j]:setVisible(false)
		self.m_componentTable["it_name" .. j]:setVisible(false)
	end
end

function f_dailyReward_item:clickClaim()
	g_game.g_userInfoManager:requestClaimDailyReward(self.m_data[1])
end

return f_dailyReward_item