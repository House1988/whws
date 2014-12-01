--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_levelRewardItem")

local f_levelReward_item = class("f_levelReward_item", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_levelReward_item")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_levelReward_item] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_levelReward_item:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(900, 120))	
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_levelReward_item] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_levelReward_item:onEnter() 
	self.onClaim = function()
		self:onClaimReward()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CLAIM_LEVEL_REWARD, self.onClaim)
end


function f_levelReward_item:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_CLAIM_LEVEL_REWARD, self.onClaim)
end

function f_levelReward_item:onEnterTransitionFinish()
end

function f_levelReward_item:onExitTransitionStart()
end

function f_levelReward_item:onCleanup()
end


function f_levelReward_item:registerNodeEvent(handler)
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

function f_levelReward_item:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_levelReward_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_levelReward_item:initAllComponent()	
	local levelRewardItem = createlevelRewardItem()
	self.m_item = levelRewardItem["levelRewardItem"]	
	self.m_componentTable = levelRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(450, 65))
	self.m_label = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE))	
	self:appendComponent(self.m_label)
	
	self.m_label:setAlignment(1)
	self.m_label:setSize(cc.size(80, 30))
	self.m_label:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_label:setPositionInContainer(cc.p(35, 45))
	self.m_label:setRotation(-45)
	self.m_label:setScale(0.8)
	
	self.m_componentTable["levelLabel"]:setRotation(-45)
	
	local btnClick = function()
		self:clickClaim()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(btnClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_levelReward_item] setData
-- 设置等级奖励信息
-------------------------------------------------------------------------------
function f_levelReward_item:setData(index)	
	self.m_data = g_game.g_dictConfigManager:getLevelRewardTable()[index]
	self.m_index = self.m_data[2]
	self.m_label:setTextWithInt(self.m_data[2])
	
	local hasReceive = g_game.g_userInfoManager:isReceiveLevelReward(self.m_data[2])
	
	if self.m_index > g_game.g_userInfoManager:getLevel() then
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
		if self.m_data[2 + i * 3] > 0 then
			local frame = self.m_componentTable["item" .. j]
			local icon = fc.FExtensionsImage:create()
			local s = frame:getSize()
			local p = frame:getPositionInContainer()
			self.m_item:appendComponent(icon)
			local type = self.m_data[i * 3]
			local id = self.m_data[i * 3 + 1]
			
			local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
			
			self.m_componentTable["name" .. i]:setString(name)
			icon:setImage(imagePath)
			icon:setExtensionsTextureRect(cc.rect(0,0,90,90))
			icon:setAnchorPoint(cc.p(0.5,0.5))
			icon:setPositionInContainer(cc.p(p.x, p.y))
			
			self.m_componentTable["number" .. i]:setString(self.m_data[2 + i * 3])
			self.m_componentTable["number" .. i]:setComponentZOrder(1)
			
			frame:setImage(g_game.g_f_quality_image[q])
			j = j + 1
		end
	end
	for j = j, 4 do
		self.m_componentTable["item" .. j]:setVisible(false)
		self.m_componentTable["name" .. j]:setVisible(false)
		self.m_componentTable["textbg" .. j]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_dailyReward_item] onClaimReward
-- 获得奖励
-------------------------------------------------------------------------------
function f_levelReward_item:onClaimReward()	
	if g_game.g_userInfoManager.m_claimLevelRewardLevel == self.m_index then
		self.m_componentTable["label"]:setVisible(true)
		self.m_componentTable["btn"]:setVisible(false)
--		self.m_componentTable["btnLabel"]:setVisible(false)
	end
end

function f_levelReward_item:clickClaim()
	g_game.g_userInfoManager:requestClaimLevelReward(self.m_data[2])
end

return f_levelReward_item