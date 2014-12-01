--[[--
    战斗界面左下面板扩展类
--]]--
f_battle_left_bottom_panel = class("f_battle_left_bottom_panel")
f_battle_left_bottom_panel.__index = f_battle_left_bottom_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel.static_create()
	local leftTopPanelTable = g_game.g_panelManager:create_panel("zhandoujiemian_left_bottom")
	local leftTopPanel = leftTopPanelTable["zhandoujiemian_left_bottom"]
	
	local funTable = {}
	tolua.setpeer(leftTopPanel, funTable)
	setmetatable(funTable, f_battle_left_bottom_panel)
	
	leftTopPanel.m_componentTable = leftTopPanelTable
	   
	return leftTopPanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:layout_in_parent()
	--预定义成员变量
	self.m_card_list = nil
	self.m_clip_panel = nil


  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.LEFT_DOWN)

	self:registerNodeEvent()--注册特殊回调函数  

  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, self.m_componentTable["panel_layer_config"])

	self:setAnchorPoint(cc.p(0, 0))   
  	self:setPositionInContainer(cc.p(0, CONFIG_SCREEN_HEIGHT))
 
  	self:initAllComponent()--初始化各个组件
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_left_bottom_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] onEnter
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:onEnter()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] onExit
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:onExit()  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] onCleanup
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:initAllComponent()
	self.m_list_parent_panel = self.m_componentTable["zjjm_lb_kapai_panel"]
--[[
	self.m_clip_panel = fc.FContainerPanel:create()
	self.m_list_parent_panel:appendComponent(self.m_clip_panel)
	self.m_clip_panel:setAnchorPoint(cc.p(0, 1))
	self.m_clip_panel:setPositionInContainer(cc.p(0, 0))
	self.m_clip_panel:setSize(cc.size(428, 204))
	self.m_clip_panel:enableClipping(true)
]]--

	self.m_card_list = require("scripts.game.battle.card.f_battle_card_list").new()
	self.m_list_parent_panel:appendComponent(self.m_card_list)
	self.m_card_list:setAnchorPoint(cc.p(1, 1))
	self.m_card_list:setPositionInContainer(cc.p(551, 0))
	self.m_card_list:setInitPosition(551, 0)


	self.m_userName = self.m_componentTable["zdjm_lb_name_label"]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] setName
-- 设置玩家姓名
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:setName(userName)
	if self.m_userName ~= nil then
		self.m_userName:setString(userName)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] showCardList
-- 根据传入数据，填充卡牌列表
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:showCardList(data, isSelf)
	self.m_card_list:fillData(data, isSelf, 1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] firstCardStartBattle
-- 当前卡牌进入战斗
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:firstCardStartBattle()
	self.m_card_list:firstCardStartBattle()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] cardDead
-- 当前卡牌死亡
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:cardDead()	
	self.m_card_list:cardDead()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] cardUseFinish
-- 当前卡牌战斗结束
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:cardUseFinish()	
	self.m_card_list:cardUseFinish()
end
-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] preOpenAllCard
-- 准备打开所有卡牌
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:preOpenAllCard()	
	self.m_card_list:preOpenAllCard()
end
-------------------------------------------------------------------------------
-- @function [parent=#f_battle_left_bottom_panel] openAllCard
-- 打开所有卡牌
-------------------------------------------------------------------------------
function f_battle_left_bottom_panel:openAllCard()	
	self.m_card_list:openAllCard()
end