require("scripts.auto.auto_small_battle_head")

--[[--
    名臣选择 界面 显示卡牌
--]]--
f_stage_small_battle_head = class("f_stage_small_battle_head")
f_stage_small_battle_head.__index = f_stage_small_battle_head

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_small_battle_head.static_create()
	local small_battle_headTable = createsmall_battle_head()
	local small_battle_head = small_battle_headTable["small_battle_head"]
	
	local funTable = {}
	tolua.setpeer(small_battle_head, funTable)

	setmetatable(funTable, f_stage_small_battle_head)
	
	small_battle_head.m_componentTable = small_battle_headTable
	   
	return small_battle_head  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] static_clone
-- 静态clone reward 方法
-------------------------------------------------------------------------------
function f_stage_small_battle_head:static_cloneReward(battleHead)
	local small_battle_headTable = createsmall_battle_head()
	local small_battle_head = small_battle_headTable["small_battle_head"]
	
	local funTable = {}
	tolua.setpeer(small_battle_head, funTable)

	setmetatable(funTable, f_stage_small_battle_head)
	
	small_battle_head.m_componentTable = small_battle_headTable
	
	small_battle_head:panelInitBeforePopup()
	small_battle_head:setRewardData(battleHead.m_rewardData)
	   
	return small_battle_head  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] static_clone
-- 静态clone方法
-------------------------------------------------------------------------------
function f_stage_small_battle_head.static_clone(battleHead)
	local small_battle_headTable = createsmall_battle_head()
	local small_battle_head = small_battle_headTable["small_battle_head"]
	
	local funTable = {}
	tolua.setpeer(small_battle_head, funTable)

	setmetatable(funTable, f_stage_small_battle_head)
	
	small_battle_head.m_componentTable = small_battle_headTable
	
	small_battle_head:panelInitBeforePopup()
	small_battle_head:setData(battleHead.m_data)  
	small_battle_head:setSmallBattleState(battleHead.m_smallBattleState)
	small_battle_head.m_componentTable["button_kaizhan"]:setSwallowsTouches(false)
	 
	if small_battle_head.m_animSelect ~= nil then
	 	small_battle_head.m_animSelect:setPositionInContainer(cc.p(112/2+5,200/2+10))
	end
	 
	return small_battle_head  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] static_clone
-- 静态clone方法
-------------------------------------------------------------------------------
function f_stage_small_battle_head.static_clone2(battleHead)
	local small_battle_headTable = createsmall_battle_head()
	local small_battle_head = small_battle_headTable["small_battle_head"]
	
	local funTable = {}
	tolua.setpeer(small_battle_head, funTable)

	setmetatable(funTable, f_stage_small_battle_head)
	
	small_battle_head.m_componentTable = small_battle_headTable
	
	small_battle_head:panelInitBeforePopup()
	small_battle_head:setDataForGuideLine(battleHead.m_data)  
	small_battle_head:setSmallBattleState(battleHead.m_smallBattleState)
	small_battle_head.m_componentTable["button_kaizhan"]:setSwallowsTouches(false)
	
	if small_battle_head.m_animSelect ~= nil then
	 	small_battle_head.m_animSelect:setPositionInContainer(cc.p(112/2+5,200/2+10))
	end
	   
	return small_battle_head  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_small_battle_head:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_data = nil
	self.m_rewardData = nil
	self.m_smallStageId = 0
	
	self.TYPE_REWARD = 1
	self.TYPE_STAGE = 2
	self.m_type = self.TYPE_STAGE
	
	self.ALREADY_PASS = 1 --已通过
	self.UN_OPEN = 2-- 未开启
	self.IN_WAR = 3--正在打的副本
	
	self.m_selectCallBack = nil
	self.m_beginWarCallBack = nil
	self.m_rewardCallback = nil
	
	self.m_isClick  = false
	self.m_isSelect = false
	self.m_smallBattleState = self.UN_OPEN
	
	self.flagAnim = nil
	
	self.m_buttonOldPos_x = 0
	self.m_buttonOldPos_y = 0
	
	self.m_stageOldPos_x = 0
	self.m_stageOldPos_y = 0
	
	self.m_selectBgPos_x = 0
	self.m_selectBgPos_y = 0
	
	self.isFightThrough = false
	self.m_isAtkNumEnough = false
	
	self.m_animSelect = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] getSmallStageId
-- 获取小stage 的id
-------------------------------------------------------------------------------
function f_stage_small_battle_head:getSmallStageId()
	return self.m_smallStageId
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setRewardData
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setRewardData(data)
	self.m_type = self.TYPE_REWARD
	self.m_rewardData = data
	
	local imagePath = g_game.g_resourceManager:getStageImage("libao")
	self.m_componentTable["stage_open_image"]:setImage(imagePath)
	self.m_componentTable["stage_open_image"]:setSize(cc.size(90,90))
	
	self.m_componentTable["stage_name_label"]:setPositionInContainer(cc.p(55.5,25.5))
	self.m_componentTable["stage_name_label"]:setScale(0.8)
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["stage_name_label"]:setString("全3星獎勵")
	else
		self.m_componentTable["stage_name_label"]:setString("全3星奖励")
	end	
	self.m_componentTable["button_container"]:setVisible(false)
	
	self.m_stageOldPos_x = self.m_componentTable["stage_container"]:getPositionInContainer().x
   	self.m_stageOldPos_y = self.m_componentTable["stage_container"]:getPositionInContainer().y
   	
    self.m_componentTable["stage_container"]:setPositionInContainer(cc.p(self.m_stageOldPos_x,self.m_stageOldPos_y+32))
	
	self.m_buttonOldPos_x = self.m_componentTable["button_container"]:getPositionInContainer().x
	self.m_buttonOldPos_y = self.m_componentTable["button_container"]:getPositionInContainer().y
	self.m_componentTable["button_container"]:setPositionInContainer(cc.p(self.m_buttonOldPos_x,self.m_buttonOldPos_y+32))
    
    
    self.m_componentTable["bottom_normal_bg"]:setVisible(false)
	self.m_componentTable["bottom_boss1_bg"]:setVisible(false)
	self.m_componentTable["bottom_boss2_bg"]:setVisible(true)
	
	for i = 1,3 do
		self.m_componentTable["star"..i]:setVisible(false)
		self.m_componentTable["star_dark"..i]:setVisible(false)
	end
	self.m_componentTable["star_bg"]:setVisible(false)
	
	if g_game.g_utilManager:allGuidelinesIsFinish() then
		local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()
		if smallStageNumsData["flag"] == 2 then
			self.m_componentTable["stage_open_image"]:setImageType(2)
			return
		end
		
		local show3StarFlag = true
		for i = 1, #smallStageNumsData["levelDate"] do
			if smallStageNumsData["levelDate"][i]["star"] < 3 then
				show3StarFlag = false
			end
		end
		
		self.flagAnim  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.flagAnim)
		self.flagAnim:setAnchorPoint(cc.p(0.5,0.5))
		self.flagAnim:setLoop(true)
		self.flagAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[7])
		self.flagAnim:setPositionInContainer(cc.p(112/2, 243/2+30))
		self.flagAnim:setVisible(show3StarFlag)
	end
	
end

function f_stage_small_battle_head:setFlagInvisible()
	if self.flagAnim ~= nil then
		self.flagAnim:setVisible(false)
		self.m_componentTable["stage_open_image"]:setImageType(2)
	end
end

function f_stage_small_battle_head:getRewardData()
	return self.m_rewardData
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setDataForGuideLine
-- 设置data for 新手引导
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setDataForGuideLine(data)
	self.m_data = data
	
	self.m_type = self.TYPE_STAGE
	
	self.m_smallStageId = self.m_data[1]
	
	for i = 1,3 do
		self.m_componentTable["star"..i]:setVisible(false)
	end
	
	local call = function()   
	end
	local  atkNumLimit = g_game.g_dictConfigManager:getLevelAtkNumLimit(self.m_smallStageId)
	self.m_componentTable["button_label_attack_num"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,255]"..atkNumLimit .. "[250,255,165]/"..atkNumLimit, g_game.g_f_text_default_color), call)
	
	self.m_componentTable["button_goumaikaizhen"]:setVisible(false)
	self.m_componentTable["button_kaizhan"]:setVisible(true)
	
	--small stage name
	self.m_componentTable["stage_name_label"]:setPositionInContainer(cc.p(55.5,25.5))
	self.m_componentTable["stage_name_label"]:setScale(0.8)
	local nameT = g_game.g_dictConfigManager:getLanTextById(self.m_data[2])
	self.m_componentTable["stage_name_label"]:setString(nameT)
	
	--设置小关卡图片
	local imageRes = g_game.g_dictConfigManager:getStageIcon(self.m_smallStageId)
	local imagePath = g_game.g_resourceManager:getStageImage(imageRes)
	self.m_componentTable["stage_open_image"]:setImage(imagePath)
	self.m_componentTable["stage_open_image"]:setSize(cc.size(90,90))
	
	--设置背景选中 默认为 消失    buttonContainer消失
	self.m_componentTable["button_container"]:setVisible(false)
    
    --old stage pos
  	self.m_stageOldPos_x = self.m_componentTable["stage_container"]:getPositionInContainer().x
   	self.m_stageOldPos_y = self.m_componentTable["stage_container"]:getPositionInContainer().y
   	
    self.m_componentTable["stage_container"]:setPositionInContainer(cc.p(self.m_stageOldPos_x,self.m_stageOldPos_y+32))
	
	self.m_buttonOldPos_x = self.m_componentTable["button_container"]:getPositionInContainer().x
	self.m_buttonOldPos_y = self.m_componentTable["button_container"]:getPositionInContainer().y
	self.m_componentTable["button_container"]:setPositionInContainer(cc.p(self.m_buttonOldPos_x,self.m_buttonOldPos_y+32))
    
    --boss type
    if self.m_data[23] == 1 then
    	self.m_componentTable["bottom_normal_bg"]:setVisible(true)
    	self.m_componentTable["bottom_boss1_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss2_bg"]:setVisible(false)
    elseif self.m_data[23] == 2 then
    	self.m_componentTable["bottom_normal_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss1_bg"]:setVisible(true)
    	self.m_componentTable["bottom_boss2_bg"]:setVisible(false)
    else
    	self.m_componentTable["bottom_normal_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss1_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss2_bg"]:setVisible(true)
    end
   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setData
-- 设置data
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setData(data)
	self.m_data = data
	
	self.m_type = self.TYPE_STAGE
	
	self.m_smallStageId = self.m_data[1]
	
	local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()["levelDate"]
	
	local atkNum = 0 
	--关卡星级
	local starNum = 0
	for i = 1, #smallStageNumsData do
		if 	smallStageNumsData[i]["level"] == self.m_smallStageId then
			atkNum = smallStageNumsData[i]["count"]
			starNum = smallStageNumsData[i]["star"]
			break
		end
	end
	
	for i = 1,3 do
		if i <= starNum then
			self.m_componentTable["star"..i]:setVisible(true)
		else
			self.m_componentTable["star"..i]:setVisible(false)
		end
	end
	
	local call = function()   
	end
	local  atkNumLimit = g_game.g_dictConfigManager:getLevelAtkNumLimit(self.m_smallStageId)
	self.m_componentTable["button_label_attack_num"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,255]"..atkNum .. "[250,255,165]/"..atkNumLimit, g_game.g_f_text_default_color), call)
	
	if atkNum == 0 then
		self.m_componentTable["button_goumaikaizhen"]:setVisible(true)
		self.m_componentTable["button_kaizhan"]:setVisible(false)
	else
		self.m_componentTable["button_goumaikaizhen"]:setVisible(false)
		self.m_componentTable["button_kaizhan"]:setVisible(true)
	end
	--small stage name
	self.m_componentTable["stage_name_label"]:setPositionInContainer(cc.p(55.5,25.5))
	self.m_componentTable["stage_name_label"]:setScale(0.8)
	local nameT = g_game.g_dictConfigManager:getLanTextById(self.m_data[2])
	self.m_componentTable["stage_name_label"]:setString(nameT)
	
	--设置小关卡图片
	local imageRes = g_game.g_dictConfigManager:getStageIcon(self.m_smallStageId)
	local imagePath = g_game.g_resourceManager:getStageImage(imageRes)
	self.m_componentTable["stage_open_image"]:setImage(imagePath)
	self.m_componentTable["stage_open_image"]:setSize(cc.size(90,90))
	
	--设置背景选中 默认为 消失    buttonContainer消失
	self.m_componentTable["button_container"]:setVisible(false)
    
    --old stage pos
  	self.m_stageOldPos_x = self.m_componentTable["stage_container"]:getPositionInContainer().x
   	self.m_stageOldPos_y = self.m_componentTable["stage_container"]:getPositionInContainer().y
   	
    self.m_componentTable["stage_container"]:setPositionInContainer(cc.p(self.m_stageOldPos_x,self.m_stageOldPos_y+32))
	
	self.m_buttonOldPos_x = self.m_componentTable["button_container"]:getPositionInContainer().x
	self.m_buttonOldPos_y = self.m_componentTable["button_container"]:getPositionInContainer().y
	self.m_componentTable["button_container"]:setPositionInContainer(cc.p(self.m_buttonOldPos_x,self.m_buttonOldPos_y+32))
    
    --boss type
    if self.m_data[23] == 1 then
    	self.m_componentTable["bottom_normal_bg"]:setVisible(true)
    	self.m_componentTable["bottom_boss1_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss2_bg"]:setVisible(false)
    elseif self.m_data[23] == 2 then
    	self.m_componentTable["bottom_normal_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss1_bg"]:setVisible(true)
    	self.m_componentTable["bottom_boss2_bg"]:setVisible(false)
    else
    	self.m_componentTable["bottom_normal_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss1_bg"]:setVisible(false)
    	self.m_componentTable["bottom_boss2_bg"]:setVisible(true)
    	
    end
   
end	

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setRewardPopupCallBack
-- 奖励弹出
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setRewardPopupCallBack(callback)
	self.m_rewardCallback = callback
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] guideLineUpdateLastSmallBattle
-- 指引 更新上一次打 到最小关卡
-------------------------------------------------------------------------------
function f_stage_small_battle_head:guideLineUpdateLastSmallBattle(lastSmallBattleId)
	if self.m_type == self.TYPE_STAGE then
		if lastSmallBattleId ~= self.m_smallStageId then
			for i = 1,3 do
				self.m_componentTable["star"..i]:setVisible(true)
			end
		end
--		local call = function()   
--		end
--		local  atkNumLimit = g_game.g_dictConfigManager:getLevelAtkNumLimit(self.m_smallStageId)
--		local atkNum = atkNumLimit - 1
--		self.m_componentTable["button_label_attack_num"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,255]"..atkNum .. "[250,255,165]/"..atkNumLimit, g_game.g_f_text_default_color), call)
	end

	if self.m_smallStageId < lastSmallBattleId then
		self:setSmallBattleState(self.ALREADY_PASS)
	elseif  self.m_smallStageId == lastSmallBattleId then
		self:setSmallBattleState(self.IN_WAR)
	else
		self:setSmallBattleState(self.UN_OPEN)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] updateLastSmallBattle
-- 更新上一次打 到最小关卡
-------------------------------------------------------------------------------
function f_stage_small_battle_head:updateLastSmallBattle(lastSmallBattleId)
	if self.isFightThrough then
		if  self.m_smallStageId == lastSmallBattleId then
			self:setSmallBattleState(self.IN_WAR)
		else
			self:setSmallBattleState(self.ALREADY_PASS)
		end
	else
		if self.m_smallStageId < lastSmallBattleId then
			self:setSmallBattleState(self.ALREADY_PASS)
		elseif  self.m_smallStageId == lastSmallBattleId then
			self:setSmallBattleState(self.IN_WAR)
		else
			self:setSmallBattleState(self.UN_OPEN)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] updateLastSmallBattle
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setFightThrough(isFightThrough)
	self.isFightThrough = isFightThrough
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setSmallBattleState
-- 设置小关卡状态
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setSmallBattleState(state)
	self.m_smallBattleState = state
	self:updateSmallBattleState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] updateSmallBattleState
-- 更新小关卡状态
-------------------------------------------------------------------------------
function f_stage_small_battle_head:updateSmallBattleState()
	if self.m_smallBattleState == self.ALREADY_PASS then
		self.m_componentTable["stage_name_label"]:setColor(cc.c3b(255,255,255))
		self.m_componentTable["wenzi_di2"]:setVisible(false)
		self.m_componentTable["wenzi_di"]:setVisible(true)
		
		self.m_componentTable["stage_open_image"]:setVisible(true)
		self.m_componentTable["button_container"]:setVisible(false)
    	
    	self.m_componentTable["stage_container"]:setPositionInContainer(cc.p(self.m_stageOldPos_x, self.m_stageOldPos_y+32))
		self.m_componentTable["button_container"]:setPositionInContainer(cc.p(self.m_buttonOldPos_x, self.m_buttonOldPos_y+32))
	
		if self.m_animSelect ~= nil then
			self.m_animSelect:setVisible(false)
		end
	elseif self.m_smallBattleState == self.IN_WAR then
		self.m_componentTable["stage_name_label"]:setColor(cc.c3b(91,24,6))
		self.m_componentTable["wenzi_di2"]:setVisible(true)
		self.m_componentTable["wenzi_di"]:setVisible(false)
		self.m_componentTable["stage_open_image"]:setVisible(true)
		self.m_componentTable["button_container"]:setVisible(true)
    	
    	--220为一个 small stage head 的高度   一个head 的size 为  114，243
    	local moveTo1 = CCMoveTo:create(0.2, cc.p(self.m_stageOldPos_x,243 - self.m_stageOldPos_y))
    	local moveTo2 = CCMoveTo:create(0.2, cc.p(self.m_buttonOldPos_x,243 -self.m_buttonOldPos_y))
    	
    	if self.m_componentTable["stage_container"]:getNumberOfRunningActions() <= 0 then
	    	self.m_componentTable["stage_container"]:runAction(CCEaseBounceOut:create(moveTo1))
		    self.m_componentTable["button_container"]:runAction(CCEaseBounceOut:create(moveTo2))
		end 
		
		if self.m_animSelect == nil then
			self.m_animSelect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			self:appendComponent(self.m_animSelect)
			self.m_animSelect:setPositionInContainer(cc.p(112/2+6,200/2+1))
			self.m_animSelect:setLoop(true)
			self.m_animSelect:runAnimation(g_game.g_f_main_ui_effect.GUANQIA_EFFECT[2], g_game.g_f_main_ui_effect.GUANQIA_EFFECT[3])
		else
			self.m_animSelect:setVisible(true)
		end
	else
		
		self.m_componentTable["stage_name_label"]:setColor(cc.c3b(255,255,255))
		self.m_componentTable["wenzi_di2"]:setVisible(false)
		self.m_componentTable["wenzi_di"]:setVisible(true)
		for i = 1,3 do
			self.m_componentTable["star"..i]:setVisible(false)
			self.m_componentTable["star_dark"..i]:setVisible(false)
		end
		self.m_componentTable["star_bg"]:setVisible(false)
		self.m_componentTable["stage_open_image"]:setVisible(false)
		
		if self.m_animSelect ~= nil then
			self.m_animSelect:setVisible(false)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_small_battle_head:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_small_battle_head] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_small_battle_head:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] onEnter
-------------------------------------------------------------------------------
function f_stage_small_battle_head:onEnter()

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] onExit
-------------------------------------------------------------------------------
function f_stage_small_battle_head:onExit()  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_small_battle_head:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_small_battle_head:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] onCleanup
-------------------------------------------------------------------------------
function f_stage_small_battle_head:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_small_battle_head:initAllComponent()
local downCallback = function()
		self.m_isClick = true
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )

	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE )

	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE )
	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER )
	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT )
	local downCallback = function()
		self.m_isClick = false
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE )

	local downCallback = function()
		if self.m_isClick == true then
			self:setSelect(true)
			self.m_isClick = false
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	
	local gotoStageBattle = function()
		self:begainWar()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["button_kaizhan"]:addHandleOfcomponentEvent(gotoStageBattle, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	self.m_componentTable["button_goumaikaizhen"]:addHandleOfcomponentEvent(gotoStageBattle, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] begainWar
-- 设置开战回调
-------------------------------------------------------------------------------
function f_stage_small_battle_head:begainWar()
	if not g_game.g_utilManager:allGuidelinesIsFinish() then
		self.m_isAtkNumEnough = true
	else
		local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()["levelDate"]
	
		local atkNum = 0 
		for i = 1, #smallStageNumsData do
			if 	smallStageNumsData[i]["level"] == self.m_smallStageId then
				atkNum = smallStageNumsData[i]["count"]
				break
			end
		end
		
		local  atkNumLimit = g_game.g_dictConfigManager:getLevelAtkNumLimit(self.m_smallStageId)
		
		if atkNum <= 0 then
			self.m_isAtkNumEnough = false
		else	
			self.m_isAtkNumEnough = true
		end
		
	end
	
	if self.m_beginWarCallBack then
		self.m_beginWarCallBack(self)
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] resetAtkNums
-- 
-------------------------------------------------------------------------------
function f_stage_small_battle_head:resetAtkNums()
	self.m_isAtkNumEnough = true
	
	local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()["levelDate"]
	local curMaxAtkLimit = g_game.g_dictConfigManager:getLevelAtkNumLimit(self.m_smallStageId)
	local atkNum = 0
	for i = 1, #smallStageNumsData do
		if 	smallStageNumsData[i]["level"] == self.m_smallStageId then
			smallStageNumsData[i]["count"] = curMaxAtkLimit
			atkNum = curMaxAtkLimit
			break
		end
	end
	local call = function()
	end
	self.m_componentTable["button_label_attack_num"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,255]"..atkNum .. "[250,255,165]/"..curMaxAtkLimit, g_game.g_f_text_default_color), call)
	self.m_componentTable["button_kaizhan"]:setVisible(true)
	self.m_componentTable["button_goumaikaizhen"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] getIsAtkNumEnough
-------------------------------------------------------------------------------
function f_stage_small_battle_head:getIsAtkNumEnough()
	return self.m_isAtkNumEnough
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setBeginWarCallBack
-- 设置开战回调
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setBeginWarCallBack(callback)
	self.m_beginWarCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setSelect
-- 设置当前选中
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		if self.m_smallBattleState == self.UN_OPEN then
			print "cur smallStage does not open!"
		else	
			if self.m_type == self.TYPE_STAGE and self.m_selectCallBack ~= nil then
				self.m_selectCallBack(self)
			elseif self.m_type == self.TYPE_REWARD and self.m_rewardCallback ~= nil then
				self.m_rewardCallback(self)
			end
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setSelectCallBack
-- 设置选中回调
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setSelectCallBack(callback)
	self.m_selectCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_head] setSelectCallBack
-------------------------------------------------------------------------------
function f_stage_small_battle_head:setSaoDangUseNum(useNum)
	local smallStageNumsData = g_game.g_userInfoManager:getPveSmallStageNums()["levelDate"]
	local curMaxAtkLimit = g_game.g_dictConfigManager:getLevelAtkNumLimit(self.m_smallStageId)
	local count = 0
	for i = 1, #smallStageNumsData do
		if 	smallStageNumsData[i]["level"] == self.m_smallStageId then
			smallStageNumsData[i]["count"] = smallStageNumsData[i]["count"] - useNum
			count = smallStageNumsData[i]["count"]
			break
		end
	end
	local call = function()
	end
	
	if count == 0 then
		self.m_componentTable["button_goumaikaizhen"]:setVisible(true)
		self.m_componentTable["button_kaizhan"]:setVisible(false)
	end
	self.m_componentTable["button_label_attack_num"]:setComplexString(g_game.g_utilManager:getEncodeString("[0,255,255]"..count .. "[250,255,165]/"..curMaxAtkLimit, g_game.g_f_text_default_color), call)
	
end

