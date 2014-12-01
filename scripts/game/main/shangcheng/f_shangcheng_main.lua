require("scripts.game.main.shangcheng.f_keju_panel")
require("scripts.game.main.shangcheng.f_xuanxiu_panel")
require("scripts.game.main.shangcheng.f_shangcheng_panel")
require("scripts.game.main.shangcheng.f_shangcheng_chongzhi_panel")

--[[--
	商城 主面板
--]]--
f_shangcheng_main = class("f_shangcheng_main")
f_shangcheng_main.__index = f_shangcheng_main

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_shangcheng_main.static_create()
	local shangcheng_Table = g_game.g_panelManager:create_panel("keju_xuanxiu_shangcheng")
	local shangcheng_Panel = shangcheng_Table["keju_xuanxiu_shangcheng"]
	  
	local funTable = {}
	tolua.setpeer(shangcheng_Panel, funTable)
	setmetatable(funTable, f_shangcheng_main)
	
	shangcheng_Panel.m_componentTable = shangcheng_Table
	return shangcheng_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_shangcheng_main:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_keju = nil
	self.m_xuanxiu = nil	
	self.m_shangcheng = nil
	
	self.m_panelIndex = 0
	self.m_pageRadioBtnArr = {}	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] registerNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_main:registerNodeEvent(handler)
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

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_main:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

function f_shangcheng_main:setPanelIndex(index)
	self.m_panelIndex = index
end
-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] onEnter
-------------------------------------------------------------------------------
function f_shangcheng_main:onEnter()
	
    self.m_pageRadioBtnArr[1] = self.m_componentTable["kjxxsc_keju_button"] --科举
   	self.m_pageRadioBtnArr[2] = self.m_componentTable["kjxxsc_xuanxiu_button"] --选秀
   	self.m_pageRadioBtnArr[3] = self.m_componentTable["kjxxsc_shancheng_button"] --商城
   	self:refreshJiemian()
    
    self.m_keju = f_keju_panel.static_create()
    self.m_keju:panelInitBeforePopup()
	self:appendComponent(self.m_keju)
	self.m_keju:setAnchorPoint(cc.p(0,1))
	self.m_keju:setComponentZOrder(200)
	self.m_keju:setPositionInContainer(cc.p(0,62))	
	
	self.m_xuanxiu = f_xuanxiu_panel.static_create()
    self.m_xuanxiu:panelInitBeforePopup()
	self:appendComponent(self.m_xuanxiu)
	self.m_xuanxiu:setAnchorPoint(cc.p(0,1))
	self.m_xuanxiu:setComponentZOrder(200)
	self.m_xuanxiu:setPositionInContainer(cc.p(0,62))	
	
	self.m_shangcheng = f_shangcheng_panel.static_create()
    self.m_shangcheng:panelInitBeforePopup()
	self:appendComponent(self.m_shangcheng)
	self.m_shangcheng:setAnchorPoint(cc.p(0,1))
	self.m_shangcheng:setComponentZOrder(200)
	self.m_shangcheng:setPositionInContainer(cc.p(0,62))
	
	self.m_panelIndex = 1
    self:updatePagePanel()
    
    self.m_componentTable["kjxxsc_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	self:initAllComponent()
	
	self.event_updateShopGold = function()
		self:refreshJiemian()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD, self.event_updateShopGold)
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_SHANGCHENG)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] updatePagePanel
-- 更新每个切页 界面
-------------------------------------------------------------------------------
function f_shangcheng_main:updatePagePanel()
	-- 1 stand for radio btn bright ,2 stand for radio btn dark
	for i = 1, #self.m_pageRadioBtnArr do
		if self.m_panelIndex == i then
			self.m_pageRadioBtnArr[i]:setIsEnabled(true)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
		else
			self.m_pageRadioBtnArr[i]:setIsEnabled(false)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
		end
	end
	
	if  self.m_panelIndex == 1  then
		--发送消息，获取到科举cd时间和剩余次数		
		 self.m_keju:setVisible(true)
		 self.m_xuanxiu:setVisible(false)
		 self.m_shangcheng:setVisible(false)
		--选秀
	elseif  self.m_panelIndex == 2  then
		--发送消息，获取到选秀cd时间和选秀次数
		self.m_xuanxiu:setVisible(true)
		self.m_keju:setVisible(false)
		self.m_shangcheng:setVisible(false)
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BEAUTY_XUANXIU)
		--商城
	elseif self.m_panelIndex == 3 then
		self.m_shangcheng:setVisible(true)
		self.m_keju:setVisible(false)
		self.m_xuanxiu:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] onExit
-------------------------------------------------------------------------------
function f_shangcheng_main:onExit()  
	
	self.m_keju = nil
	self.m_xuanxiu = nil
	self.m_shangcheng = nil
    self:unregisterNodeEvent()
     g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHOP_GOLD, self.event_updateShopGold)
	
    --移除商城 科举 和 选秀 在CD事件内消耗元宝的更新事件
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD, self.event_updateCDXiaohaoYuanbao)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_shangcheng_main:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] onExitTransitionStart
-------------------------------------------------------------------------------
function f_shangcheng_main:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] onCleanup
-------------------------------------------------------------------------------
function f_shangcheng_main:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangcheng_main:initAllComponent()
	--将充值按钮调制最上层
	
	self.m_componentTable["keju_label"]:setComponentZOrder(299)
	self.m_componentTable["shangcheng_label"]:setComponentZOrder(299)
	self.m_componentTable["xuanxiiu_label"]:setComponentZOrder(299)
	
    self.m_componentTable["keju_label"]:setStopTouchEvent(true)
    self.m_componentTable["shangcheng_label"]:setStopTouchEvent(true)
    self.m_componentTable["xuanxiiu_label"]:setStopTouchEvent(true)
	
	self.m_componentTable["kjxxsc_chongzhi_button"]:setComponentZOrder(300)
	self.m_componentTable["kjxxsc_chongzhi_button"]:setVisible(true)
	
	self.m_componentTable["kjxxsc_close_button"]:setComponentZOrder(300)
	
    
	--注册关闭按钮
	local closeCallback = function()
		self:closeCurrentPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_KEJU)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["kjxxsc_close_button"]:addHandleOfcomponentEvent(closeCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	--切换到科举
	local changeToKeju = function()
		self.m_panelIndex = 1
    	self:updatePagePanel()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(changeToKeju,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--切换到选秀
	local changeToXuanxiu = function()
--		if g_game.g_userInfoManager:getLevel() < g_game.OPEN_XUNXIU_LV then
--			
--			local str = g_game.g_dictConfigManager:getLanTextById(434)
--			g_game.g_utilManager:showMsg(g_game.OPEN_XUNXIU_LV..str)
--			self.m_pageRadioBtnArr[2]:setIsEnabled(false)
--			self.m_pageRadioBtnArr[2]:setRadioButtonState(2)
--		else
			self.m_panelIndex = 2
	    	self:updatePagePanel()
   -- 	end
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(changeToXuanxiu,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--切换到商城
	local changeToShangcheng = function()
		self.m_panelIndex = 3
    	self:updatePagePanel()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[3]:addHandleOfcomponentEvent(changeToShangcheng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--充值
	local chongzhiClick = function()
    	self:chongzhiClick()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["kjxxsc_chongzhi_button"]:addHandleOfcomponentEvent(chongzhiClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--注册进行 科举 选秀 消耗元宝的回调事件（刷新元宝值）
	self.event_updateCDXiaohaoYuanbao = function()
		self:refreshJiemian()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_CD_XIOAHAO_GOLD, self.event_updateCDXiaohaoYuanbao)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] closeCurrentPanel
-- 关闭当前窗口
-------------------------------------------------------------------------------
function f_shangcheng_main:closeCurrentPanel()
	g_game.g_panelManager:removeUiPanel("keju_xuanxiu_shangcheng")	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] chongzhiClick
-- 充值按钮点击，弹出充值界面
-------------------------------------------------------------------------------
function f_shangcheng_main:chongzhiClick()
	
--	g_game.g_utilManager:showMsg("暂未开启，敬请期待！")

	local shangcheng_chongzhi = f_shangcheng_chongzhi_panel.static_create()
    shangcheng_chongzhi:panelInitBeforePopup()
    g_game.g_panelManager:showUiPanel(shangcheng_chongzhi,"shangcheng_chongzhi")	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_main] refreshJiemian
-- 刷新界面信息（元宝值）
-------------------------------------------------------------------------------
function f_shangcheng_main:refreshJiemian()
	--刷新当前的元宝数量
   	local userInfo =  g_game.g_userInfoManager:getUserInfo()
	local gold = userInfo["gold"]
   	self.m_componentTable["kjxxsc_chongzhi_label"]:setString(gold)
end

