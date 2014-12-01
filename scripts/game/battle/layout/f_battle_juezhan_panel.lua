
--[[--
   弹出决战面板  
--]]--
f_battle_juezhan_panel = class("f_battle_juezhan_panel")
f_battle_juezhan_panel._index = f_battle_juezhan_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_battle_juezhan_panel.static_create()
	local juezhanTable = g_game.g_panelManager:create_panel("juezhan")
	local juezhanPanel = juezhanTable["juezhan"]
	  
	local funTable = {}
	tolua.setpeer(juezhanPanel, funTable)
	setmetatable(funTable, f_battle_juezhan_panel)
	
	juezhanPanel.m_componentTable = juezhanTable
	return juezhanPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] panelInit
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:panelInit(roundData, battleManager)
	self:registerNodeEvent()
	
	self.m_round_data = roundData
	self.m_battle_manager = battleManager
	
	self.m_attack_final_value = 0
	self.m_defense_final_value = 0
	
	self.m_dead_time = 30.0
	self.m_time = 0.0
	
	self.m_selfCardItemArray 	= {}
	self.m_enemyCardItemArray 	= {}
	self.m_card_scale			= 0.7
	self.m_card_move_time		= 0.8
	self.m_step_time			= 0.0
	self.m_pk_item_index		= 1
	
	self.m_show_finish = false

	self.m_componentTable["juzhan_ditu_scale9Image"]:setSize(g_game.g_real_size)
	self.m_componentTable["juzhan_ditu_scale9Image"]:setScale(5.0)
	--创建用于播放特效的组件
	self.m_juedou_qishou_effect = nil
	if self.m_juedou_qishou_effect == nil then
		self.m_juedou_qishou_effect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_juedou_qishou_effect)	
	end
	self.m_juedou_qishou_effect:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_juedou_qishou_effect:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2 + 20, CONFIG_SCREEN_HEIGHT/2 - 20))
	self.m_juedou_qishou_effect:setVisible(true)
	self.m_juedou_qishou_effect:setLoop(false)
	self.m_juedou_qishou_effect:setOpacity(255)
	self.m_juedou_qishou_effect:setAnimationScale(2.0)
	
	
	self.m_juedou_mingzhong_effect = nil
	if self.m_juedou_mingzhong_effect == nil then
		self.m_juedou_mingzhong_effect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_juedou_mingzhong_effect)	
	end
	self.m_juedou_mingzhong_effect:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_juedou_mingzhong_effect:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2 + 20, CONFIG_SCREEN_HEIGHT/2 - 20))
	self.m_juedou_mingzhong_effect:setVisible(false)
	self.m_juedou_mingzhong_effect:setLoop(true)
--	self.m_juedou_mingzhong_effect:setScale(2.0)
	self.m_juedou_mingzhong_effect:setOpacity(255)
	self.m_juedou_mingzhong_effect:setAnimationScale(2.0)
	self.m_juedou_mingzhong_effect:runAnimation("ui_juedou", "mingzhong")
	
	
	self.STATE_INIT_DATA		= 1
	self.STATE_CARD_ENTER		= 2
	self.STATE_PRE_PK			= 3
	self.STATE_RUNNING			= 4
	self.STATE_FINISH			= 5	
	
	self.SUB_STATE_NONE			= 1
	self.SUB_STATE_PRE_RUNNING	= 2
	self.SUB_STATE_RUNNING		= 3
	self.SUB_STATE_END			= 4
	
	self.m_state_function_table = {}

	local state_initData = function(dt)
		self:stateInitData(dt)
	end
	self.m_state_function_table[self.STATE_INIT_DATA] = state_initData
	
	local state_cardEnter = function(dt)
		self:stateCardEnter(dt)
	end
	self.m_state_function_table[self.STATE_CARD_ENTER] = state_cardEnter
	
	local state_cardPrePk = function(dt)
		self:stateCardPrePk(dt)
	end
	self.m_state_function_table[self.STATE_PRE_PK] = state_cardPrePk
	
	local state_running = function(dt)
		self:stateRuning(dt)
	end
	self.m_state_function_table[self.STATE_RUNNING] = state_running
	
	local state_finish = function(dt)
		self:stateFinish(dt)
	end
	self.m_state_function_table[self.STATE_FINISH] = state_finish
	
	self.m_current_state		= self.STATE_INIT_DATA
	self.m_current_sub_state	= self.SUB_STATE_NONE
	
    self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_juezhan_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] onEnter
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:onEnter()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPINGGUOCHENG)
   
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] onExit
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:onExit()  
  self:unregisterNodeEvent()
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] onCleanup
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:initAllComponent()	
	--设置对战双方姓名
	local selfName = g_game.g_userInfoManager:getUserName()
	local enemyName = self.m_round_data["enemyName"]
	
	local defenseNameLabel = self.m_componentTable["juzhan_player1_name_label"] --defense name
	local attackNameLabel = self.m_componentTable["juzhan_player2_name_label"] -- attack name
	
	if self.m_battle_manager:selfIsAttack() then
		attackNameLabel:setString(selfName)
		defenseNameLabel:setString(enemyName)
	else
		attackNameLabel:setString(enemyName)
		defenseNameLabel:setString(selfName)
	end
	
	--对战动画显示
--	local attackBg = self.m_componentTable["juezhan_ditu4_image"]
	local attackIcon = self.m_componentTable["juezhan_ditu2_image"]
	
--	local attackBgDestPosX,attackBgDestPosY = attackBg:getPosition()
--	local attackBgInitPos = attackBg:getPositionInContainer()
	local attackIconDestPosX,attackIconDestPosY = attackIcon:getPosition()
	local attackIconInitPos = attackIcon:getPositionInContainer()
	
--	attackBg:setPositionInContainer(cc.p(attackBgInitPos["x"]-600, attackBgInitPos["y"]+600))
	attackIcon:setPositionInContainer(cc.p(attackIconInitPos["x"]-600, attackIconInitPos["y"]+600))
	
--	local moveTo = CCMoveTo:create(1.0, cc.p(attackBgDestPosX, attackBgDestPosY))
--	attackBg:runAction(CCEaseBounceOut:create(moveTo))	
	local moveTo = CCMoveTo:create(1.0, cc.p(attackIconDestPosX, attackIconDestPosY))
	attackIcon:runAction(CCEaseBounceOut:create(moveTo))
	
	
--	local defenseBg = self.m_componentTable["juezhan_ditu3_image"]
	local defenseIcon = self.m_componentTable["juezhan_ditu1_image"]
	
--	local defenseBgDestPosX,defenseBgDestPosY = defenseBg:getPosition()
--	local defenseBgInitPos = defenseBg:getPositionInContainer()
	local defenseIconDestPosX,defenseIconDestPosY = defenseIcon:getPosition()
	local defenseIconInitPos = defenseIcon:getPositionInContainer()
	
--	defenseBg:setPositionInContainer(cc.p(defenseBgInitPos["x"]+600, defenseBgInitPos["y"]-600))
	defenseIcon:setPositionInContainer(cc.p(defenseIconInitPos["x"]+600, defenseIconInitPos["y"]-600))
	
--	local moveTo = CCMoveTo:create(1.0, cc.p(defenseBgDestPosX, defenseBgDestPosY))
--	defenseBg:runAction(CCEaseBounceOut:create(moveTo))	
	local startShake = function()
		self:moveAnimation()
	end
	local moveToShake = g_game.g_transition.sequence({cc.DelayTime:create(1.0), cc.CallFunc:create(startShake)})		
		
	local moveTo = cc.MoveTo:create(1.0, cc.p(defenseIconDestPosX, defenseIconDestPosY))
	defenseIcon:runAction(cc.Spawn:createWithTwoActions(cc.EaseBounceOut:create(moveTo), moveToShake))
	
	
	
	local qishouComplete = function(event)
		self.m_juedou_mingzhong_effect:setVisible(true)	
	end
	self.m_juedou_qishou_effect:runAnimation("ui_juedou", "qishou")
	self.m_juedou_qishou_effect:setVisible(true)
	self.m_juedou_qishou_effect:registeAnimationFinishCallback(qishouComplete)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] createFinalCard
-- 创建剩余卡牌列表
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:createFinalCard()
	local selfIsAttack = self.m_battle_manager:selfIsAttack()
	
	local selfCardFinalNum = self.m_round_data["selfFinal_Num"]
	local selfCardArray = self.m_round_data["selfFinal"]
	
	for i = 1, selfCardFinalNum do	
		local item = require("scripts.game.battle.card.f_battle_card_head").new() 		
    	self:appendComponent(item)    
    	
		local cardId = selfCardArray[i]["selfFinalOfficerId"]		
		
		local cardResource = g_game.g_dictConfigManager:getCardHeadFile(cardId)
		local resourceImage = g_game.g_resourceManager:getCardHead(cardResource)	
		local cardQuality = g_game.g_dictConfigManager:getCardQuality(cardId)
	    item:setCardQuality(cardQuality)
	    item:setCardHead(resourceImage)
	    
	    local size = item:getCardSize()
	    size[1] = size[1] * self.m_card_scale
		item:setAnchorPoint(cc.p(0, 0.5))
    	if selfIsAttack then
    		item:setPositionInContainer(cc.p( selfCardFinalNum*size[1] - i * size[1] + 20, CONFIG_SCREEN_HEIGHT-100))
    	else
    		item:setPositionInContainer(cc.p( CONFIG_SCREEN_WIDTH - selfCardFinalNum*size[1] - size[1] - 20 + i * size[1], 100))
    	end    	
   		item:setVisible(false)
   		item:setScale(self.m_card_scale)
   		item:showCardContent()
   		item:setComponentZOrder(selfCardFinalNum - i + 1)
		table.insert(self.m_selfCardItemArray, item)
		
	end
	
	local enemyCardFinalNum = self.m_round_data["enemyFinal_Num"]
	local enemyCardArray = self.m_round_data["enemyFinal"]
	for i = 1, enemyCardFinalNum do	
		local item = require("scripts.game.battle.card.f_battle_card_head").new() 		
    	self:appendComponent(item)    
    	
		local cardId = enemyCardArray[i]["enemyFinalOfficerId"]		
		
		local cardResource = g_game.g_dictConfigManager:getCardHeadFile(cardId)
		local resourceImage = g_game.g_resourceManager:getCardHead(cardResource)	
		local cardQuality = g_game.g_dictConfigManager:getCardQuality(cardId)
	    item:setCardQuality(cardQuality)
	    item:setCardHead(resourceImage)
	    
	    local size = item:getCardSize()
	    size[1] = size[1] * self.m_card_scale
		item:setAnchorPoint(cc.p(0, 0.5))
    	if selfIsAttack then
    		item:setPositionInContainer(cc.p( CONFIG_SCREEN_WIDTH - enemyCardFinalNum*size[1] - size[1] - 20 + i * size[1], 100))
    	else
    		item:setPositionInContainer(cc.p( enemyCardFinalNum*size[1] - i * size[1] + 20, CONFIG_SCREEN_HEIGHT-100))
    	end    	
   		item:setVisible(false)
   		item:setScale(self.m_card_scale)
   		item:showCardContent()
   		item:setComponentZOrder(enemyCardFinalNum - i + 1)
		table.insert(self.m_enemyCardItemArray, item)
		
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] cardMoveEnter
-- 卡牌进入场景函数
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:cardMoveEnter()
	local selfIsAttack = self.m_battle_manager:selfIsAttack()
	
	for i = #self.m_selfCardItemArray, 1, -1 do
		local item = self.m_selfCardItemArray[i]
		item:setVisible(true)
		local posx, posy = item:getPosition()
		
		if selfIsAttack then
			item:setPosition(cc.p(posx - CONFIG_SCREEN_WIDTH, posy))
		else
			item:setPosition(cc.p(posx + CONFIG_SCREEN_WIDTH, posy))			
		end
		item:runAction(cc.MoveTo:create(self.m_card_move_time + 0.05 * (#self.m_selfCardItemArray - i), cc.p(posx, posy)))
		
		
	end
	
	for i = #self.m_enemyCardItemArray, 1, -1 do
		local item = self.m_enemyCardItemArray[i]
		item:setVisible(true)
		local posx, posy = item:getPosition()
		
		if selfIsAttack then
			item:setPosition(cc.p(posx + CONFIG_SCREEN_WIDTH, posy))
		else			
			item:setPosition(cc.p(posx - CONFIG_SCREEN_WIDTH, posy))
		end
		item:runAction(cc.MoveTo:create(self.m_card_move_time + 0.05 * (#self.m_enemyCardItemArray - i), cc.p(posx, posy)))
	end
	
	if #self.m_selfCardItemArray > #self.m_enemyCardItemArray then
		return self.m_card_move_time + 0.05*#self.m_enemyCardItemArray
	else
		return self.m_card_move_time + 0.05*#self.m_selfCardItemArray
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] moveAnimation
-- 移动比拼动画
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:moveAnimation()
	self.m_componentTable["juezhan_ditu2_image"]:stopAllActions()
	local shakeAction = cc.Shake:create(1.0, 8)
	self.m_componentTable["juezhan_ditu2_image"]:runAction(cc.RepeatForever:create(shakeAction))
	
	
	self.m_componentTable["juezhan_ditu1_image"]:stopAllActions()
	local shake1Action = cc.Shake:create(1.0, 8)
	self.m_componentTable["juezhan_ditu1_image"]:runAction(cc.RepeatForever:create(shake1Action))
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] finalCardToPk
-- 多余卡牌直接参与战斗
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:finalCardToPk()
	local disTime = 0.1
	local baseTime = 0.3
	local destPosx, destPosy = self.m_juedou_mingzhong_effect:getPosition()

	local selfIsAttack = self.m_battle_manager:selfIsAttack()
	
	local selfCardFinalNum = self.m_round_data["selfFinal_Num"]
	local selfCardArray = self.m_round_data["selfFinal"]
	
	local enemyCardFinalNum = self.m_round_data["enemyFinal_Num"]
	local enemyCardArray = self.m_round_data["enemyFinal"]
	
	if selfCardFinalNum > enemyCardFinalNum then
		local flyCount = selfCardFinalNum - enemyCardFinalNum
		for i = 1, flyCount do
			local item = self.m_selfCardItemArray[i]
			local actionFly = cc.Spawn:createWithTwoActions(cc.MoveTo:create(baseTime + i * disTime, cc.p(destPosx, destPosy)), cc.ScaleTo:create(baseTime + i * disTime, 0))		
			
			item:stopAllActions()
			item:runAction(actionFly)
		end
		for i = flyCount, 1, -1 do
			table.remove(self.m_selfCardItemArray, i)
		end
		return baseTime + flyCount * disTime
	elseif selfCardFinalNum < enemyCardFinalNum then
		local flyCount = enemyCardFinalNum - selfCardFinalNum
		for i = 1, flyCount do
			local item = self.m_enemyCardItemArray[i]
			
			local actionFly = cc.Spawn:createWithTwoActions(cc.MoveTo:create(baseTime + i * disTime, cc.p(destPosx, destPosy)), cc.ScaleTo:create(baseTime + i * disTime, 0))		
			
			item:stopAllActions()
			item:runAction(actionFly)
		end
		for i = flyCount, 1, -1 do
			table.remove(self.m_enemyCardItemArray, i)
		end
		return baseTime + flyCount * disTime
	else
		return 0.0
	end
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] updateCardToPk
-- 双方卡牌参与pk
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:updateCardToPk()
	local disTime = 0.1
	local baseTime = 0.3
	local destPosx, destPosy = self.m_juedou_mingzhong_effect:getPosition()
	
	if self.m_pk_item_index > #self.m_selfCardItemArray then
		return false
	end
	
	
	local item = self.m_selfCardItemArray[self.m_pk_item_index]
	local actionFly = cc.Spawn:createWithTwoActions(cc.MoveTo:create(baseTime + disTime, cc.p(destPosx, destPosy)), cc.ScaleTo:create(baseTime + disTime, 0))		
	
	local seq = g_game.g_transition.sequence({cc.ScaleTo:create(0.2, 3), actionFly})		
		
	
	item:stopAllActions()
	item:runAction(seq)		
	table.remove(self.m_selfCardItemArray, self.m_pk_item_index)
	
	local item = self.m_enemyCardItemArray[self.m_pk_item_index]
	local actionFly = cc.Spawn:createWithTwoActions(cc.MoveTo:create(baseTime + disTime, cc.p(destPosx, destPosy)), cc.ScaleTo:create(baseTime + disTime, 0))		
	
	local seq = g_game.g_transition.sequence({cc.ScaleTo:create(0.2, 3), actionFly})
	
	item:stopAllActions()
	item:runAction(seq)
	table.remove(self.m_enemyCardItemArray, self.m_pk_item_index)	
	
	return true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] pkCardFinish
-- 卡牌pk结束，移动胜方卡牌到中间
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:pkCardFinish()
	local selfIsAttack = self.m_battle_manager:selfIsAttack()
	local destPosx, destPosy = self.m_juedou_mingzhong_effect:getPosition()
	
	self.m_componentTable["juezhan_ditu2_image"]:stopAllActions()	
	self.m_componentTable["juezhan_ditu1_image"]:stopAllActions()
	
	local selfIcon = nil
	local enemyIcon = nil
	if selfIsAttack then
		selfIcon = self.m_componentTable["juezhan_ditu2_image"]
		enemyIcon = self.m_componentTable["juezhan_ditu1_image"]
	else
		enemyIcon = self.m_componentTable["juezhan_ditu2_image"]
		selfIcon = self.m_componentTable["juezhan_ditu1_image"]
	end
	
	local enemyPosx, enemyPosy = enemyIcon:getPosition()
	local selfPosx, selfPosy = selfIcon:getPosition()
	
	local result = self.m_round_data["fightResult"]
	if result == 1 then
		local scaleToHarg = cc.ScaleTo:create(0.3, 20)
		local scaleToCenter = cc.ScaleTo:create(0.3, 1)
		
		local resetPosition = function()
			selfIcon:setPosition(cc.p(destPosx, destPosy))
		end
		local showFinish = function()
			if selfIsAttack then
				enemyIcon:runAction(cc.MoveTo:create(0.3, cc.p(enemyPosx + 600, enemyPosy + 600)))			
			else
				enemyIcon:runAction(cc.MoveTo:create(0.3, cc.p(enemyPosx - 600, enemyPosy - 600)))
			end
			self.m_juedou_mingzhong_effect:runAction(cc.FadeOut:create(0.3))
			
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPING_SHIBAI)
		end
		local show = g_game.g_transition.sequence({scaleToHarg, cc.Hide:create(), cc.CallFunc:create(resetPosition), cc.Show:create(), scaleToCenter, cc.CallFunc:create(showFinish)})		
		
		selfIcon:runAction(show)
	else
		local scaleToHarg = cc.ScaleTo:create(0.3, 8)
		local scaleToCenter = cc.ScaleTo:create(0.3, 1)
		
		local resetPosition = function()
			enemyIcon:setPosition(cc.p(destPosx, destPosy))
		end
		local showFinish = function()
			if selfIsAttack then
				selfIcon:runAction(cc.MoveTo:create(0.3, cc.p(enemyPosx - 600, enemyPosy - 600)))			
			else
				selfIcon:runAction(cc.MoveTo:create(0.3, cc.p(enemyPosx + 600, enemyPosy + 600)))
			end
			self.m_juedou_mingzhong_effect:runAction(cc.FadeOut:create(0.3))
			
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPING_SHIBAI)
		end
		local show = g_game.g_transition.sequence({scaleToHarg, cc.Hide:create(), cc.CallFunc:create(resetPosition), cc.Show:create(), scaleToCenter, cc.CallFunc:create(showFinish)})		
		
		enemyIcon:runAction(show)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] isShowFinish
-- 决战界面显示完毕
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:isShowFinish()
	return self.m_show_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] update
-- 更新
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:update(dt)
	
	self.m_state_function_table[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] stateInitData
-- 初始化本地数据
-- 	self.STATE_INIT_DATA		= 1
--	self.STATE_CARD_ENTER		= 2
--	self.STATE_RUNNING			= 3
--	self.STATE_FINISH			= 4	
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:stateInitData(dt)
	if self.m_current_sub_state == self.SUB_STATE_NONE then
		self:createFinalCard()
		self.m_current_sub_state = self.SUB_STATE_END
	elseif self.m_current_sub_state == self.SUB_STATE_RUNNING then
	elseif self.m_current_sub_state == self.SUB_STATE_END then
		self.m_current_state = self.STATE_CARD_ENTER
		self.m_current_sub_state = self.SUB_STATE_NONE
		self.m_time = 0.0
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] stateCardEnter
-- 卡牌进入动画处理
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:stateCardEnter(dt)
	self.m_time = self.m_time + dt
	if self.m_current_sub_state == self.SUB_STATE_NONE then
		self.m_step_time = self:cardMoveEnter()
		self.m_current_sub_state = self.SUB_STATE_RUNNING
	elseif self.m_current_sub_state == self.SUB_STATE_RUNNING then
		if self.m_time > self.m_step_time then
			self.m_current_sub_state = self.SUB_STATE_END
		end
	elseif self.m_current_sub_state == self.SUB_STATE_END then
		self.m_current_state = self.STATE_PRE_PK
		self.m_current_sub_state = self.SUB_STATE_NONE
		self.m_time = 0.0
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] stateCardPrePk
-- 卡牌准备比拼
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:stateCardPrePk(dt)
	self.m_time = self.m_time + dt
	if self.m_current_sub_state == self.SUB_STATE_NONE then
		if self.m_time > 0.5 then
			self.m_step_time = self:finalCardToPk()	
			self.m_current_sub_state = self.SUB_STATE_RUNNING
			self.m_time = 0.0
		end
	elseif self.m_current_sub_state == self.SUB_STATE_RUNNING then
		if self.m_time > self.m_step_time then
			self.m_current_sub_state = self.SUB_STATE_END
		end
	elseif self.m_current_sub_state == self.SUB_STATE_END then
		self.m_current_state = self.STATE_RUNNING
		self.m_current_sub_state = self.SUB_STATE_NONE
		self.m_time = 0.0
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] stateRuning
-- 卡牌持续比拼
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:stateRuning(dt)
	self.m_time = self.m_time + dt
	if self.m_current_sub_state == self.SUB_STATE_NONE then
		self.m_pk_item_index = 1
		self.m_current_sub_state = self.SUB_STATE_RUNNING
		
		self.m_init_attack_ma_posx,self.m_init_attack_ma_posy = self.m_componentTable["juezhan_ditu2_image"]:getPosition()
		self.m_init_effect_posx,self.m_init_effect_posy = self.m_juedou_mingzhong_effect:getPosition()
		self.m_init_defense_ma_posx, self.m_init_defense_ma_posy = self.m_componentTable["juezhan_ditu1_image"]:getPosition()
	elseif self.m_current_sub_state == self.SUB_STATE_PRE_RUNNING then
		if self.m_time > 1.0 then
			self.m_current_sub_state = self.SUB_STATE_RUNNING
		end
	elseif self.m_current_sub_state == self.SUB_STATE_RUNNING then
		if self:updateCardToPk() then
			self.m_current_sub_state = self.SUB_STATE_PRE_RUNNING
			self.m_time = 0.0
		else
			self.m_current_sub_state = self.SUB_STATE_END
		end
	elseif self.m_current_sub_state == self.SUB_STATE_END then
		self.m_current_state = self.STATE_FINISH
		self.m_current_sub_state = self.SUB_STATE_NONE
		self.m_time = 0.0
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_juezhan_panel] stateFinish
-- 卡牌比拼结束
-------------------------------------------------------------------------------
function f_battle_juezhan_panel:stateFinish(dt)
	self.m_time = self.m_time + dt
	if self.m_current_sub_state == self.SUB_STATE_NONE then
		self:pkCardFinish()
		self.m_current_sub_state = self.SUB_STATE_RUNNING
	elseif self.m_current_sub_state == self.SUB_STATE_RUNNING then
		if self.m_time > 2.0 then
			self.m_current_sub_state = self.SUB_STATE_END
		end
	elseif self.m_current_sub_state == self.SUB_STATE_END then
		self.m_time = 0.0
		self.m_show_finish = true
	end
end