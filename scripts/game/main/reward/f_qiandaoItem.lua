--[[
	继承自container panel, 用于显示登陆奖励列表
]]--

require("scripts.auto.auto_qiandaoItem")

local f_qiandaoItem = class("f_qiandaoItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_qiandaoItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_qiandaoItem:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(350, 115))	
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_qiandaoItem:onEnter() 
	
end


function f_qiandaoItem:onExit()    
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_CLIAM_QIANDAO, self.onClaim)
end

function f_qiandaoItem:onEnterTransitionFinish()
end

function f_qiandaoItem:onExitTransitionStart()
end

function f_qiandaoItem:onCleanup()
end


function f_qiandaoItem:registerNodeEvent(handler)
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

function f_qiandaoItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_qiandaoItem:initAllComponent()	
	local dailyRewardItem = createqiandaoItem()
	self.m_item = dailyRewardItem["qiandaoItem"]	
	self.m_componentTable = dailyRewardItem
	
	self:appendComponent(self.m_item)
	
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(175, 57.5))
	
	local chongzhi = function()
		g_game.g_panelManager:removeUiPanel("qiandao_panel")
		require("scripts.game.main.shangcheng.f_shangcheng_chongzhi_panel")
		local shangcheng_chongzhi = f_shangcheng_chongzhi_panel.static_create()
	    shangcheng_chongzhi:panelInitBeforePopup()
	    shangcheng_chongzhi:openQiandao()
	    g_game.g_panelManager:showUiPanel(shangcheng_chongzhi,"shangcheng_chongzhi")	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["chongzhiBtn"]:addHandleOfcomponentEvent(chongzhi,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local btnClick = function()
		self:clickClaim()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(btnClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.onClaim = function()
		self:onClaimReward()
	end
	
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_CLIAM_QIANDAO, self.onClaim)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoItem] onClaimReward
-- 获得奖励
-------------------------------------------------------------------------------
function f_qiandaoItem:onClaimReward()	
	if g_game.g_userInfoManager.m_claimQiandaoIndex == self.m_index then
		self.m_componentTable["label"]:setVisible(true)
		self.m_componentTable["btn"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qiandaoItem] setData
-- 设置登陆奖励信息
-- state: 1 领过 2 能领但没领 3 未到天数 4 充值不够
-------------------------------------------------------------------------------
function f_qiandaoItem:setData(index, state)	
	self.m_data = g_game.g_dictConfigManager:getQiandaoData(index)
	self.m_index = index
	self.m_componentTable["btn"]:setVisible(state == 2)
	self.m_componentTable["chongzhiBtn"]:setVisible(state == 4)
	self.m_componentTable["bgChongzhi"]:setVisible(state == 4)
	self.m_componentTable["bgDown"]:setVisible(state ~= 4)
	self.m_componentTable["box"]:setVisible(state == 3)
	self.m_componentTable["boxText"]:setVisible(state == 3)
	self.m_componentTable["label"]:setVisible(state == 1)
	
	if state == 3 then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["boxText"]:setString("簽到" .. index .. "天")
		else
			self.m_componentTable["boxText"]:setString("签到" .. index .. "天")
		end
	end
	
	for i = 1, 2 do
		local type = self.m_data[i*3]
		local id = self.m_data[i*3 + 1]
		if type == 10 or type == 11 then
			self.m_componentTable["piece" .. i]:setVisible(false)
			self.m_componentTable["hunpo" .. i]:setVisible(true)
		elseif type == 12 or type == 13 then
			self.m_componentTable["hunpo" .. i]:setVisible(false)
			self.m_componentTable["piece" .. i]:setVisible(true)
		else
			self.m_componentTable["piece" .. i]:setVisible(false)
			self.m_componentTable["hunpo" .. i]:setVisible(false)
		end
		local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
		
		self.m_componentTable["image" .. i]:setImage(imagePath)
		self.m_componentTable["image" .. i]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["image" .. i]:setSize(cc.size(70, 70))
	
		self.m_componentTable["number" .. i]:setString(self.m_data[2 + i * 3])
		self.m_componentTable["number" .. i]:setAlignment(2)
		self.m_componentTable["it_name" .. i]:setString(name)
		
		self.m_componentTable["item" .. i]:setImage(g_game.g_f_quality_image[q])
		self.m_componentTable["item" .. i]:setSize(cc.size(80,80))
		if state == 4 then
			self.m_componentTable["it_name" .. i]:setColor(cc.c3b(0, 255, 255))
		else
			self.m_componentTable["it_name" .. i]:setColor(cc.c3b(91, 24, 6))
		end
	end
end

function f_qiandaoItem:clickClaim()
	g_game.g_userInfoManager:requestClaimQiandao(self.m_data[1])
end

return f_qiandaoItem