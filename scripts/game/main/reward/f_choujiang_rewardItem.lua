--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_choujiangRewardItem")

local f_choujiang_rewardItem = class("f_choujiang_rewardItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_choujiang_rewardItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_choujiang_rewardItem:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(104, 104))	
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_choujiang_rewardItem:onEnter() 
	
end


function f_choujiang_rewardItem:onExit()    
    self:unregisterNodeEvent()
end

function f_choujiang_rewardItem:onEnterTransitionFinish()
end

function f_choujiang_rewardItem:onExitTransitionStart()
end

function f_choujiang_rewardItem:onCleanup()
end


function f_choujiang_rewardItem:registerNodeEvent(handler)
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

function f_choujiang_rewardItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_choujiang_rewardItem:initAllComponent()	
	local dailyRewardItem = createchoujiangRewardItem()
	self.m_item = dailyRewardItem["choujiangRewardItem"]	
	self.m_componentTable = dailyRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(52, 52))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rewardItem] setData
-- 设置登陆奖励信息
-------------------------------------------------------------------------------
function f_choujiang_rewardItem:setData(data)	

	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(data["type"], data["id"])
	
	self.m_componentTable["image"]:setImage(imagePath)
	self.m_componentTable["image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))

	self.m_componentTable["num"]:setTextWithInt(data["num"])
	self.m_componentTable["num"]:setAlignment(2)
	self.m_componentTable["name"]:setString(name)
	self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[q])
	self.m_componentTable["name"]:setVisible(false)
	self.m_componentTable["textbg"]:setVisible(false)
	self.m_q = 	q
	if q > 3 then
		self.m_anim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_anim)
		self.m_anim:setAnchorPoint(cc.p(0.5,0.5))
		self.m_anim:setLoop(true)
		self.m_anim:setAnimationScale(1)
		self.m_anim:setPositionInContainer(cc.p(52, 52))
	end
end

function f_choujiang_rewardItem:showName()	
	self.m_componentTable["name"]:setVisible(true)
	self.m_componentTable["textbg"]:setVisible(true)
end

function f_choujiang_rewardItem:setAction(action)	
	self.m_action = cc.p(action.x, -action.y)
end

function f_choujiang_rewardItem:show()
	self:setScale(0.01)
	self:setVisible(true)
	local action = CCMoveBy:create(0.15, self.m_action) 
	action = CCEaseIn:create(action, 5)
	self:runAction(action)
	action = CCScaleTo:create(0.1, 1)
	self:runAction(action)
	if self.m_q > 3 then
		local index = self.m_q + 1
		self.m_anim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[index])
		self.m_anim:setComponentZOrder(0)
		self.m_item:setComponentZOrder(2)
	end
end

return f_choujiang_rewardItem