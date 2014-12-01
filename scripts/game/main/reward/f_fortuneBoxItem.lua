--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_Box_item")

local f_fortuneBoxItem = class("f_fortuneBoxItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_fortuneBoxItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBoxItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_fortuneBoxItem:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(220, 221))	
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBoxItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_fortuneBoxItem:onEnter() 
	
end


function f_fortuneBoxItem:onExit()    
    self:unregisterNodeEvent()
end

function f_fortuneBoxItem:onEnterTransitionFinish()
end

function f_fortuneBoxItem:onExitTransitionStart()
end

function f_fortuneBoxItem:onCleanup()
end


function f_fortuneBoxItem:registerNodeEvent(handler)
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

function f_fortuneBoxItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBoxItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_fortuneBoxItem:initAllComponent()	
	local dailyRewardItem = createBox_item()
	self.m_item = dailyRewardItem["Box_item"]	
	self.m_componentTable = dailyRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(110, 105.5))
	self.m_componentTable["left"]:setRotation(40)
	
	local btnClick = function()
		self:clickClaim()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self:addHandleOfcomponentEvent(btnClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_fortuneBoxItem] setData
-- 设置登陆奖励信息
-------------------------------------------------------------------------------
function f_fortuneBoxItem:setData(config, index, num, rare)	
	self.m_data = config
	self.m_index = index
	self.m_left = num
	self.m_rare = rare
	self.m_componentTable["title"]:setString(config[2])
	self.m_componentTable["price"]:setString(config[3])
	self.m_componentTable["number"]:setString(config[4])
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["left"]:setString("剩餘" .. num)
	else
		self.m_componentTable["left"]:setString("剩余" .. num)
	end
	
	if num <= 0 then
		self.m_componentTable["blackmask"]:setVisible(true)
		self.m_componentTable["blackmask"]:setOpacity(175)
		self.m_componentTable["shouwan"]:setVisible(true)
	else
		self.m_componentTable["shouwan"]:setVisible(false)
		self.m_componentTable["blackmask"]:setVisible(false)
	end
end

function f_fortuneBoxItem:clickClaim()
	if self.m_left <= 0 then
		return
	end
	if not g_game.g_userInfoManager.m_huodongInTime[g_game.g_huodong_box] then
		g_game.g_utilManager:showMsg("活动已结束")
		return
	end
	if g_game.g_userInfoManager.m_user_info["gold"] < self.m_data[3] then
		require("scripts.game.main.common.f_quick_charge_popup")
		local quickCharge = f_quick_charge_popup.static_create()
	    quickCharge:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")	
		return
	end
	g_game.g_userInfoManager:requestBuyFortuneBox(self.m_index)
end

return f_fortuneBoxItem