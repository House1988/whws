require("scripts.auto.auto_zouzhang_reward_popup")
--[[
]]--

local f_zouzhang_reward_popup = class("f_zouzhang_reward_popup", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_zouzhang_reward_popup")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_popup] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_zouzhang_reward_popup:ctor()    
    self:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))
    self.m_type = 0 
    
    self:registerNodeEvent()
    
    self.m_componentTable = createzouzhang_reward_popup()
    self.m_panel =  self.m_componentTable["zouzhang_reward_popup"]
    self:appendComponent(self.m_panel)
    self.m_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
    self.m_panel:setVisible(false)
    
    self.m_isTouch = false
end


function f_zouzhang_reward_popup:setType(type)
	local result = g_game.g_userInfoManager.m_zouzhangResult
	
	if type == 1 then
		self.m_componentTable["type_exp_panel"]:setVisible(false)
		self.m_componentTable["type_card_panel"]:setVisible(true)
		
		local rewardInfo = result["rewardList"][1]
		local imagePath, q, name = g_game.g_dictConfigManager:getResByType(rewardInfo["type"], rewardInfo["id"])
		self.m_componentTable["num"]:setTextWithInt(rewardInfo["num"]) -- 个数
		
		self.m_componentTable["card_name"]:setString(name)
		if imagePath ~= nil then
			self.m_componentTable["card"]:setImage(imagePath)
			self.m_componentTable["card"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		end
		self.m_componentTable["quality"]:setImage(g_game.g_f_quality_image[q])
		
		local listNum = result["rewardList_Num"]
		-- 更新数据
		g_game.g_userInfoManager:updatePackToUser(listNum,result["rewardList"])
		
	else
		self.m_componentTable["type_exp_panel"]:setVisible(true)
		self.m_componentTable["type_card_panel"]:setVisible(false)
		
		local userLv = g_game.g_userInfoManager:getUserLv()
		local silver,exp = g_game.g_dictConfigManager:getZouZhangReward(userLv)
		silver = silver*result["multiply"]
		exp = exp*result["multiply"]
		
		
		local numAnim1 = require("scripts.game.main.common.f_number_effect").new()
		numAnim1:setup(self.m_componentTable["exp_add"], 21, "%d", false, false)
		self:appendComponent(numAnim1)
		local p = self.m_componentTable["exp_add"]:getPositionInContainer()
		numAnim1:setPositionInContainer(p)
		numAnim1:play(0,exp,1)
		
		local numAnim2 = require("scripts.game.main.common.f_number_effect").new()
		numAnim2:setup(self.m_componentTable["yinliang_add"], 21, "%d", false, false)
		self:appendComponent(numAnim2)
		local p2 = self.m_componentTable["yinliang_add"]:getPositionInContainer()
		numAnim2:setPositionInContainer(p2)
		numAnim2:play(0,silver,1)
		
--		self.m_componentTable["exp_add"]:setString("+"..exp)
--		self.m_componentTable["yinliang_add"]:setString("+"..silver)
		
		self.m_componentTable["gongjizhi_add"]:setString("0")
		if result["rewardList_Num"] > 0 and result["rewardList"][1]["type"] == 8 then
			
			local numAnim3 = require("scripts.game.main.common.f_number_effect").new()
			numAnim3:setup(self.m_componentTable["gongjizhi_add"], 21, "%d", false, false)
			self:appendComponent(numAnim3)
			local p3 = self.m_componentTable["gongjizhi_add"]:getPositionInContainer()
			numAnim3:setPositionInContainer(p3)
			numAnim3:play(0,result["rewardList"][1]["id"],1)
--			self.m_componentTable["gongjizhi_add"]:setString("+"..result["rewardList"][1]["id"])
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_zouzhang_reward_popup] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_zouzhang_reward_popup:onEnter()  
	local isTouch = function()
		 self.m_isTouch = true
	end
	
	local showBaoji = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_GAIZHANG)
		local zhang  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(zhang)
		zhang:setAnchorPoint(cc.p(0.5,0.5))
		zhang:runAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[2], g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[5])
		zhang:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2+15))
		zhang:registeAnimationFinishCallback(isTouch)
		
		local result = g_game.g_userInfoManager.m_zouzhangResult
		local mul = result["multiply"] 
		if mul > 1 then
			local baoji  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
			self:appendComponent(baoji)
			baoji:setAnchorPoint(cc.p(0.5,0.5))
			baoji:setAnimationSpeedScale(0.5)
			baoji:runAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[2], "baoji"..mul)
			baoji:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
		end
	end
	
	local showPanel = function()
		self.zhouAnim:setVisible(false)
		self.m_panel:setVisible(true)
		self.m_panel:setScale(1.1)
		local action = g_game.g_transition.sequence({CCScaleTo:create(0.2,1),CCCallFunc:create(showBaoji)})
		self.m_panel:runAction(action)
	end
	 
	self.zhouAnim  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.zhouAnim)
	self.zhouAnim:setAnchorPoint(cc.p(0.5,0.5))
	self.zhouAnim:runAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[2], g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[4])
	self.zhouAnim:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self.zhouAnim:registeAnimationFinishCallback(showPanel)
	
	local close = function()
		if self.m_isTouch then
			g_game.g_panelManager:removeUiPanel("zozhang_result_view")
		end
	end
	self:addHandleOfcomponentEvent(close, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

function f_zouzhang_reward_popup:onExit()    
    self:unregisterNodeEvent()
end

function f_zouzhang_reward_popup:onEnterTransitionFinish()
end

function f_zouzhang_reward_popup:onExitTransitionStart()
end

function f_zouzhang_reward_popup:onCleanup()
end


function f_zouzhang_reward_popup:registerNodeEvent(handler)
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

function f_zouzhang_reward_popup:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_zouzhang_reward_popup
