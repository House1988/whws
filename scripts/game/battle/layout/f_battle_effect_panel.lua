--[[
	继承自container panel, 实现战斗场景用于显示各种特效播放
]]--

local FLuaBattleEffectPanel = class("FLuaBattleEffectPanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBattleEffectPanel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:ctor()     
    self:registerNodeEvent()   
         
	self.m_layer_color_panel = nil
	self.m_prince_skill_panel = nil
	self.m_round_text_panel = nil
	self.m_skill_show_finish = false
	
	self.m_card_image = nil
	
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE_ALLSCALE)  
	
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 5)
  	
    self.m_layer_color_panel		= require("scripts.extend.f_lua_color_layer").new()
    self.m_autoPanel:appendComponent(self.m_layer_color_panel)
    self.m_layer_color_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_layer_color_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH * 0.5, CONFIG_SCREEN_HEIGHT * 0.5))
 	
  	
  	self.m_autoPanel:appendComponent(self)
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
    self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:onEnter()       
end


function FLuaBattleEffectPanel:onExit()    
    self:unregisterNodeEvent()
end

function FLuaBattleEffectPanel:onEnterTransitionFinish()
end

function FLuaBattleEffectPanel:onExitTransitionStart()
end

function FLuaBattleEffectPanel:onCleanup()
end


function FLuaBattleEffectPanel:registerNodeEvent(handler)
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
-- @function [parent=#FLuaBattleEffectPanel] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] showFireAndMove
-- 播放火特效并移动场景动画
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:showFireAndMove()
	self.m_layer_color_panel:setVisible(false)
		
	self.m_fire_animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_fire_animation)
	self.m_fire_animation:setVisible(true)
	self.m_fire_animation:setAnchorPoint(cc.p(0.5,0.5))
	self.m_fire_animation:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))	
	self.m_fire_animation:setLoop(false)	
	self.m_fire_animation:setAnimationScale(1.0)
	self.m_fire_animation:setAnimationSpeedScale(0.3)
	self.m_fire_animation:runAnimation(g_game.g_f_battle_ui_effect.BATTLE_KAICHANG_YUN[2], g_game.g_f_battle_ui_effect.BATTLE_KAICHANG_YUN[3])
	
	
	local qishouFinish = function()
		
		self:deleteComponent(self.m_fire_animation)
		self.m_fire_animation = nil
		self:setVisible(false)
	end
	
	self.m_fire_animation:registeAnimationFinishCallback(qishouFinish)
	
	--播放云出场
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_YUNCENG)
	
	return g_game.g_f_battle_time.BATTLE_USE_SKILL_BASE_TIME*0.6
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] showRoundUI
-- 播放回合UI特效
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:showRoundUI(index)
	self.m_skill_show_finish = false
	self:setVisible(true)	
		
	self.m_round_text_panel = require("scripts.game.battle.effect_component.f_battle_round_text_panel").new(index)
	self:appendComponent(self.m_round_text_panel)
	
    self.m_round_text_panel:setAnchorPoint(cc.p(0.5,0.5))
    self.m_round_text_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
    
    local showFinish = function()
		self:deleteComponent(self.m_round_text_panel)
		self.m_round_text_panel = nil
		self:setVisible(false)	
		self.m_skill_show_finish = true
    end    
    return self.m_round_text_panel:showRoundText(showFinish)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] showFloatCardImage
-- 播放卡牌漂浮，先于卡牌技能释放
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:showFloatCardImage(isAttack, currentCardId, solider, callback)
	self:setVisible(true)	
	local cardResource = g_game.g_dictConfigManager:getCardHeadFile(currentCardId)
	local resourceImage = g_game.g_resourceManager:getCard(cardResource)	
	local cardQuality = g_game.g_dictConfigManager:getCardQuality(currentCardId)
	
	local layerManager = g_game.g_director:getRunningScene().m_layout_manager
	
	local finish = function()
		self:setVisible(false)
		self.m_card_image:stopAllActions()
		self.m_card_image:setVisible(false)
		
		if callback then
			callback()
		end
	end
	
	if self.m_card_image == nil then
		self.m_card_image = fc.FExtensionsImage:create()
    	self:appendComponent(self.m_card_image)
    	self.m_card_image:setImage(resourceImage)
    	local size = self.m_card_image:getSize()
    	self.m_card_image:setSize(size)
	end
	
	if isAttack then
		local cardList = layerManager.layout_left_bottom.m_card_list
		local cardHeadItem = cardList:getCardItem(1)
		local pos = cc.p(540, 0)
		if cardHeadItem then
			local cardSize = cardHeadItem:getCardSize()
			local posx, posy = cardHeadItem:getPosition()
			local cardHeadPos = cardHeadItem:getParent():convertToWorldSpace(cc.p(posx, posy))			
			
			pos = self.m_card_image:getParent():convertToNodeSpace(cardHeadPos)
			pos.y = 0
			pos.x = pos.x + cardSize[1]/2
		end
	
		self.m_card_image:setAnchorPoint(cc.p(0.5, 0))
		self.m_card_image:setPosition(pos)
		self.m_card_image:setVisible(false)
		self.m_card_image:setScale(0.001)
		
		local action = g_game.g_transition.sequence({cc.Show:create(), cc.ScaleTo:create(0.2, 1.0), cc.CallFunc:create(finish)})
		local spwanAction = cc.Spawn:createWithTwoActions(action, cc.FadeOut:create(0.2))
		self.m_card_image:runAction(spwanAction)
		
	else
		local cardList = layerManager.layout_right_top.m_card_list
		local cardHeadItem = cardList:getCardItem(1)
		local pos = cc.p(600, CONFIG_SCREEN_HEIGHT)
		if cardHeadItem then
			local cardSize = cardHeadItem:getCardSize()
			local posx, posy = cardHeadItem:getPosition()
			local cardHeadPos = cardHeadItem:getParent():convertToWorldSpace(cc.p(posx, posy))			
			
			pos = self.m_card_image:getParent():convertToNodeSpace(cardHeadPos)
			pos.y = CONFIG_SCREEN_HEIGHT
			pos.x = pos.x + cardSize[1]/2
		end
		
		self.m_card_image:setAnchorPoint(cc.p(0.5, 1))
		self.m_card_image:setPosition(pos)
		self.m_card_image:setVisible(false)
		self.m_card_image:setScale(0.001)
		
		local action = g_game.g_transition.sequence({cc.Show:create(), cc.ScaleTo:create(0.2, 1.0), cc.CallFunc:create(finish)})
		local spwanAction = cc.Spawn:createWithTwoActions(action, cc.FadeOut:create(0.2))
		self.m_card_image:runAction(spwanAction)
	end
	
	return 0.2
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] showSkillIsFinish
-- 皇子技能显示是否结束
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:showSkillIsFinish()
	return self.m_skill_show_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] showPrinceSkill
-- 显示皇子技能起手特效场景
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:showPrinceSkill(roundData, isAttack, isSelf)
	self.m_skill_show_finish = false
	if self.m_prince_skill_panel then
    	self.m_prince_skill_panel:stopAllActions()
		self:deleteComponent(self.m_prince_skill_panel)
		self.m_prince_skill_panel = nil
	end
	
	
	self:setVisible(true)	
	self.m_layer_color_panel:setVisible(true)
	
	self.m_prince_skill_panel = require("scripts.game.battle.effect_component.f_battle_prince_skill_panel").new()

    self.m_prince_skill_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
    self.m_prince_skill_panel:setAnchorPoint(cc.p(0.5,0.5))
	self:appendComponent(self.m_prince_skill_panel)
    self.m_prince_skill_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
  
  
	if isAttack then
		self.m_prince_skill_panel:setScaleX(1)
	else
		self.m_prince_skill_panel:setScaleX(-1)
	end
	
    local showFinish = function()
    	self.m_prince_skill_panel:stopAllActions()
		self:deleteComponent(self.m_prince_skill_panel)
		self.m_prince_skill_panel = nil
		self.m_layer_color_panel:setVisible(false)
		self:setVisible(false)	
		self.m_prince_skill_panel = nil
		self.m_skill_show_finish = true
    end   
	return self.m_prince_skill_panel:showPrinceSkillWithAnimation(roundData, isAttack, showFinish, isSelf)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBattleEffectPanel] showPrinceMingzhongSkill
-- 显示皇子技能命中特效场景
-------------------------------------------------------------------------------
function FLuaBattleEffectPanel:showPrinceMingzhongSkill(sillId, isLeft, callback)
	self.m_skill_show_finish = false
	if self.m_prince_skill_panel then
    	self.m_prince_skill_panel:stopAllActions()
		self:deleteComponent(self.m_prince_skill_panel)
		self.m_prince_skill_panel = nil
	end
	self:setVisible(true)	
	self.m_layer_color_panel:setVisible(false)



	self.m_prince_skill_panel = require("scripts.game.battle.effect_component.f_battle_prince_skill_panel").new()

    self.m_prince_skill_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
    self.m_prince_skill_panel:setAnchorPoint(cc.p(0.5,0.5))
	self:appendComponent(self.m_prince_skill_panel)
    self.m_prince_skill_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
  
    local showFinish = function()
    	self.m_prince_skill_panel:stopAllActions()
		self:deleteComponent(self.m_prince_skill_panel)
		self.m_prince_skill_panel = nil
		self.m_layer_color_panel:setVisible(false)
		self:setVisible(false)	
		self.m_prince_skill_panel = nil
		self.m_skill_show_finish = true
		if callback then
			callback()
		end
    end   
	return self.m_prince_skill_panel:showPrinceMingzhongSkillWithAnimation(sillId, isLeft, showFinish)
end

return FLuaBattleEffectPanel