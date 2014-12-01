--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_reward_btn_Item")

local f_rewardBtn = class("f_rewardBtn", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_rewardBtn")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_rewardBtn] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_rewardBtn:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(100, 100))	
	
	self.m_flagAnim = nil
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rewardBtn] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_rewardBtn:onEnter() 
	
end


function f_rewardBtn:onExit()    
    self:unregisterNodeEvent()
end

function f_rewardBtn:onEnterTransitionFinish()
end

function f_rewardBtn:onExitTransitionStart()
end

function f_rewardBtn:onCleanup()
end


function f_rewardBtn:registerNodeEvent(handler)
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

function f_rewardBtn:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

function f_rewardBtn:clickBtn(name)
	if self.m_name == name then
		self:setScale(1)
	else	
		self:setScale(0.9)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rewardBtn] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_rewardBtn:initAllComponent()	
	local dailyRewardItem = createreward_btn_Item()
	self.m_item = dailyRewardItem["reward_btn_Item"]	
	self.m_componentTable = dailyRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(50, 50))
	
	self.m_flagAnim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_flagAnim)
	self.m_flagAnim:setAnchorPoint(cc.p(0.5,0))
	self.m_flagAnim:setLoop(true)
	self.m_flagAnim:setAnimationScale(1.2)
	self.m_flagAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_flagAnim:setPositionInContainer(cc.p(48, 54))
	self.m_flagAnim:setVisible(false)
	
	self.m_click = nil
	self.m_name = ""
	
	local btnClick = function()
		self.m_click(self.m_name)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["rewardBtn"]:addHandleOfcomponentEvent(btnClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_rewardBtn] setFlagAnimVisible
-------------------------------------------------------------------------------
function f_rewardBtn:setFlagAnimVisible(b)
	self.m_flagAnim:setVisible(b)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_rewardBtn] setData
-- 设置登陆奖励信息
-------------------------------------------------------------------------------
function f_rewardBtn:setData(image, name, click)	
	self.m_click = click
	self.m_name = name
	self.m_componentTable["rewardBtn"]:setButtonImage("nobatch/" .. image)
	
end

return f_rewardBtn