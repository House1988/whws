require("scripts.auto.auto_huangzishuxing_bg")
require("scripts.auto.auto_huangzishuxing_card")
require("scripts.auto.auto_huangzishuxing_info")
require("scripts.game.main.huangzi.f_huangzi_yuelongmen_panel")
require("scripts.game.main.common.f_common_floating_notice")
require("scripts.game.main.huangzi.f_huangzi_gaiming")


--[[--
   皇子属性 界面
--]]--

f_huangzi_shuxing_panel = class("f_huangzi_shuxing_panel")
f_huangzi_shuxing_panel.__index = f_huangzi_shuxing_panel


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel.static_create()
	local huangzi_shuxing_table = createhuangzishuxing_bg()
	local huangzi_shuxing_panel = huangzi_shuxing_table["huangzishuxing_bg"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_shuxing_panel, funTable)
	setmetatable(funTable, f_huangzi_shuxing_panel)
	
	huangzi_shuxing_panel.m_componentTable = huangzi_shuxing_table
	return huangzi_shuxing_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_card_table = nil
	self.m_info_table = nil
	
	self.m_prince_data = nil
	
	self.m_prince_is_battle = false
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_shuxing_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] onEnter
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:onEnter()
	self.m_card_table = createhuangzishuxing_card()
    local card_panel = self.m_card_table["huangzishuxing_card"]		  
	self:appendComponent(card_panel)
	card_panel:setAnchorPoint(cc.p(0,1))
	card_panel:setPositionInContainer(cc.p(2,67)) 
	
	self.m_info_table = createhuangzishuxing_info()
    local info_panel = self.m_info_table["huangzishuxing_info"]		  
	self:appendComponent(info_panel)
	info_panel:setAnchorPoint(cc.p(0,1))
	info_panel:setPositionInContainer(cc.p(305,67))
	
	self.m_componentTable["hzsx_title_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self:initAllComponent()
	
	--注册监听函数
	self.event_updatePrinceNameCallback = function()
		self:updatePrinceName()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] onExit
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:onExit()  
  	self:unregisterNodeEvent()
  	
  	--移除注册的监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:initAllComponent()
	--关闭按钮的点击事件
	local closeClick = function()
		self:closeClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzsx_title_close_button"]:addHandleOfcomponentEvent(closeClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--改名按钮的点击事件
	local gaimingClick = function()
		self:gaimingClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_info_table["hzsx_gaiming_button"]:addHandleOfcomponentEvent(gaimingClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] closeClick
-- 关闭按钮点击
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:closeClick()
	g_game.g_panelManager:removeUiPanel("huangzishuxing_bg")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] gaimingClick
-- 改名按钮点击
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:gaimingClick()

	local huangzi = f_huangzi_gaiming.static_create()
    huangzi:panelInitBeforePopup()
    huangzi:setPrinceData(self.m_prince_data)
	g_game.g_panelManager:showUiPanel(huangzi,"prince_change_name")
	huangzi:resetInputPosition()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] setPrinceData
-- 设置皇子数据
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:setPrinceData(princeData, princeIsBattle)
	self.m_prince_data = princeData
	self.m_prince_is_battle = princeIsBattle
	
	self:updatePrinceStarImage()	
	self:updatePrinceInfo()
	if princeData["princeLevel"] >= 5 then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING)
	else
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING_TN)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] updatePrinceStarImage
-- 显示选中皇子卡牌星级
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:updatePrinceStarImage()
	local princeStar = self.m_prince_data["princeStar"]
	local level = self.m_prince_data["princeLevel"]
	local resource = g_game.g_dictConfigManager:getPrinceImage(princeStar, self.m_prince_data["princeResource"], self.m_prince_data["princeLevel"])
	local princeImage = g_game.g_resourceManager:getPrinceImage(resource)
	
	-- 皇子形象
	self.m_card_table["hzsx_card_image"]:setImage(princeImage)
	self.m_card_table["hzsx_card_image"]:setExtensionsTextureRect(cc.rect(123, 0, 292, 373))
	self.m_card_table["hzsx_card_image"]:setSize(cc.size(297,379))
	
	for i = 1, 5 do
		self.m_card_table["hzsx_star" .. i]:setVisible(false)
	end
	for i = 1, princeStar do
		self.m_card_table["hzsx_star" .. i]:setVisible(true)
	end
	
	local princeDes = g_game.g_dictConfigManager:getPrinceDesc(self.m_prince_data["princeDes"])
	self.m_card_table["hzsx_miaoshu_label"]:setString(princeDes)
	
	if self.m_animation == nil then
		self.m_animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self.m_card_table["huangzishuxing_card"]:appendComponent(self.m_animation)
	end
	
	self.m_animation:setSize(self.m_card_table["hzsx_card_image"]:getSize())
	self.m_animation:setAnchorPoint(cc.p(0.5,0.5))
	local p = self.m_card_table["hzsx_card_image"]:getPositionInContainer()
	self.m_animation:setPositionInContainer(cc.p(p.x, p.y + 35))	
	self.m_animation:setLoop(true)	
	self.m_animation:setAnimationScale(1)
	if self.m_prince_data["princeStar"] >= 3 then
		self.m_animation:setVisible(true)
		self.m_animation:runAnimation(g_game.g_f_main_ui_effect.UI_BIG_CARD[2], g_game.g_f_main_ui_effect.UI_BIG_CARD[self.m_prince_data["princeStar"]])
	else
		self.m_animation:setVisible(false)
	end
	
	self.m_animation:setComponentZOrder(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] getQualityColor
-- 获取指定品质颜色
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:getQualityColor(quality)
	if quality == 1 then
		return cc.c3b(255, 255, 255)
	elseif quality == 2 then
		return cc.c3b(0, 255, 0)
	elseif quality == 3 then
		return cc.c3b(0, 0, 255)
	elseif quality == 4 then
		return cc.c3b(139, 0, 255)
	elseif quality == 5 then
		return cc.c3b(250, 128, 10)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] updatePrinceInfo
-- 显示选中皇子属性信息
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:updatePrinceInfo()
	-- 名字
--	local qualityColor = self:getQualityColor(self.m_prince_data["princeStar"])
--	self.m_info_table["hzsx_info_name_zhi_label"]:setColor(qualityColor)
	self.m_info_table["hzsx_info_name_zhi_label"]:setString(self.m_prince_data["princeName"])
	
    -- 等级
	local level = self.m_prince_data["princeLevel"]
	self.m_info_table["hzsx_info_level_zhi_label"]:setString("LV."..level)
	
    -- 额娘
	local beautyInfo = g_game.g_userInfoManager:getBeautyInfoByPriId(self.m_prince_data["mother"])
	if beautyInfo ~= nil then
	    local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyInfo["beautyId"])
		self.m_info_table["hzsx_info_eniang_name_label"]:setString(beautyName)
	else
		self.m_info_table["hzsx_info_eniang_name_label"]:setString("薨")
	end
    
    -- 经验
	local princeStar = self.m_prince_data["princeStar"]
	local expLimt = g_game.g_dictConfigManager:getPrinceExp(level, princeStar)
	local currentExp = self.m_prince_data["exp"]
--    self.m_info_table["hzsx_jy_loading_bar"]:setPercent(currentExp/expLimt*100)
    self.m_info_table["hzsx_info_exp_zhi_label"]:setString(currentExp .. "/" .. expLimt)
    
    --设置是否显示爵位
--    local princeTitle = self.m_prince_data["princeTitle"]
--    self.m_info_table["hzsx_info_juewei_label"]:setVisible(true)
--    if princeTitle == 0 then
--    else 
--    end
--    
--    if self.m_prince_is_battle then
--    else
--    end    
    
	local skillId = self.m_prince_data["princeSkill"]
	local passiveSkillId = self.m_prince_data["passiveSkillId"]
	
	local skillName = g_game.g_dictConfigManager:getSkillName(skillId)
	local skillDesc = g_game.g_dictConfigManager:getSkillDesc(skillId)
--	local skillAddtionNum = g_game.g_dictConfigManager:getSkillAddtion(skillId)
--	local skillQuality = g_game.g_dictConfigManager:getSkillQuality(skillId)
	
	-- 皇子技能
	local descStr = skillName.."\n"..skillDesc
	self.m_info_table["skill_label_des"]:setString(descStr)
	
	-- 皇子加成
	local jiachengStr = skillName.."\n"..skillDesc
	local passiveSkillValue = g_game.g_dictConfigManager:getPassiveSkillValue(passiveSkillId)
	local passiveSkillGrow = g_game.g_dictConfigManager:getPassiveSkillGrow(passiveSkillId)	
	local passiveSkillAddtionNum = math.ceil((passiveSkillValue + (level - 1) * passiveSkillGrow) / 100)
--	local passiveSkillName = g_game.g_dictConfigManager:getPassiveSkillName(passiveSkillId)
	local passiveSkillDesc = g_game.g_dictConfigManager:getPassiveSkillDesc(passiveSkillId)
--	local passiveSkillQuality = g_game.g_dictConfigManager:getPassiveSkillQuality(passiveSkillId)
	local passiveDesLabelText = passiveSkillDesc .. passiveSkillAddtionNum
	self.m_info_table["hzsx_info_jiachengms_label"]:setString(passiveDesLabelText)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_shuxing_panel] updatePrinceName
-- 更改选中皇子的名字
-------------------------------------------------------------------------------
function f_huangzi_shuxing_panel:updatePrinceName()
	self:updatePrinceInfo()	
end

