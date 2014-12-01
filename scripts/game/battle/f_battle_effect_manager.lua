--[[--
    当前战斗效果类，用于显示不同的战斗特效
--]]--



local f_battle_effect_manager = class("f_battle_effect_manager")
f_battle_effect_manager.__index = f_battle_effect_manager

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] ctor
-------------------------------------------------
function f_battle_effect_manager:ctor()
	self.m_battle_manager = nil
	
	self.m_skill_info_panel = nil
	self.m_skill_info_panel = require("scripts.game.battle.layout.f_battle_card_skill_panel").new()
	
end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] setBattleManager
-- 设置战斗管理类
-------------------------------------------------
function f_battle_effect_manager:setBattleManager(battleManager)	
	self.m_battle_manager = battleManager
end


-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] enterBattleEffect
-- 进入战斗特效
-------------------------------------------------
function f_battle_effect_manager:enterBattleEffect()

end


-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] cardListEnterBattle
-- 卡牌列表进入游戏
-------------------------------------------------
function f_battle_effect_manager:cardListEnterBattle()

end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] scaleMap
-- 测试地图缩放
-------------------------------------------------
function f_battle_effect_manager:scaleMap(attackSolider, defenseSolider)	
	local scaleX = self.m_battle_manager:getBattleMapLayer():getScaleX()
	local scaleY = self.m_battle_manager:getBattleMapLayer():getScaleY()

	local posx,posy = attackSolider:getPosition()
	local oldPosx, oldPosy = g_game.g_director:getRunningScene():get_layer_from_config(1):getPosition()
	
	self.m_battle_manager:getBattleMapLayer():setAnchorPoint(cc.p(posx/CONFIG_SCREEN_WIDTH, posy/CONFIG_SCREEN_HEIGHT))
	self.m_battle_manager:getBattleMapLayer():setPosition(cc.p(posx, posy))
	local action = g_game.g_transition.sequence({cc.EaseBackOut:create(cc.ScaleTo:create(0.1, scaleX+0.8, scaleY+0.8)), CCDelayTime:create(0.5) ,cc.EaseBackIn:create(CCScaleTo:create(0.1, scaleX, scaleY))})
	self.m_battle_manager:getBattleMapLayer():runAction(action)
	
	self.m_battle_manager:getBattleSoliderLayer():setAnchorPoint(cc.p(posx/CONFIG_SCREEN_WIDTH, posy/CONFIG_SCREEN_HEIGHT))
	self.m_battle_manager:getBattleSoliderLayer():setPosition(cc.p(posx, posy))
	local action = g_game.g_transition.sequence({cc.EaseBackOut:create(cc.ScaleTo:create(0.1, scaleX+0.8, scaleY+0.8)), CCDelayTime:create(0.5) ,cc.EaseBackIn:create(CCScaleTo:create(0.1, scaleX, scaleY))})
	self.m_battle_manager:getBattleSoliderLayer():runAction(action)
	
	
	
	return 0.1 + 0.5 + 0.1+0.05
end



-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] shakeMap
-- 地图震动
-------------------------------------------------
function f_battle_effect_manager:shakeMap(attackSolider, defenseSolider)	
	self.m_battle_manager:getBattleMapLayer():runAction(cc.Shake:create(0.5, 8))
	
	self.m_battle_manager:getBattleSoliderLayer():runAction(cc.Shake:create(0.5, 8))
	
	return 0.55
end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] shakeSolider
-- 兵团震动
-------------------------------------------------
function f_battle_effect_manager:shakeSolider(solider)	
	solider:runAction(cc.Shake:create(0.8, 7))
	
	return 0.25
end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] scaleSolider
-- 兵团放大
-------------------------------------------------
function f_battle_effect_manager:scaleSolider(solider)	
	local scaleX = solider:getScaleX()
	local scaleY = solider:getScaleY()
	local action = g_game.g_transition.sequence({cc.EaseBackOut:create(cc.ScaleTo:create(0.1, scaleX+0.3, scaleY+0.3)), cc.DelayTime:create(1.0) ,cc.EaseBackIn:create(cc.ScaleTo:create(0.1, scaleX, scaleY))})
	
	solider:runAction(action)
	
	return 1.25
end


-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] getCardSkillInfoShowTime
-- 技能信息展示时间
-------------------------------------------------
function f_battle_effect_manager:getCardSkillInfoShowTime()
	local showTime = self.m_skill_info_panel:getSkillInfoShowTime()	
	
	return showTime + 0.5 + 0.5
end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] cardSkillInfoShow
-- 卡牌技能释放前，技能信息展示
-------------------------------------------------
function f_battle_effect_manager:cardSkillInfoShow(callback, skillInfo, currentCardId, isLeft)
	
	local showTime = self.m_skill_info_panel:getSkillInfoShowTime()
	
	
	local cardInfoShow = function()
--		self.m_skill_info_panel:setShowInfo(skillInfo, currentCardId, isLeft)
		self.m_skill_info_panel:showCardSkillWithAnimation(skillInfo, currentCardId, isLeft)
	end
	
	self.m_skill_info_panel:preSkillInfoPanelShow()
	local actionDelayHide = g_game.g_transition.sequence({cc.Show:create(), cc.FadeIn:create(0.1), cc.CallFunc:create(cardInfoShow), cc.DelayTime:create(showTime), cc.FadeOut:create(0.1),cc.Hide:create(), cc.CallFunc:create(callback)})		
	self.m_skill_info_panel:runAction(actionDelayHide)
	
end	


-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] forceHideSkillInfo
-- 强制停止隐藏技能面板
-------------------------------------------------
function f_battle_effect_manager:forceHideSkillInfo()
	self.m_skill_info_panel:stopAllActions()
	self.m_skill_info_panel:setVisible(false)
end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] scaleSoliderInfo
-- 展示兵团头顶头像和技能名称
-------------------------------------------------
function f_battle_effect_manager:scaleSoliderInfo(skillInfo, solider, callback)
	self.m_skill_info_panel:setVisible(true)
	self.m_skill_info_panel:scaleSoliderInfo(skillInfo, solider, callback)
end

-------------------------------------------------
-- @function [parent=#f_battle_effect_manager] getScaleSoliderInfoTime
-- 获取技能展示时间
-------------------------------------------------
function f_battle_effect_manager:getScaleSoliderInfoTime()
	return 1.1
end

return f_battle_effect_manager