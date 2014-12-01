require("scripts.auto.auto_public_jineng_xiangqing_pop")
--[[--
兵种详情
--]]--
f_card_skill_info = class("f_card_skill_info")
f_card_skill_info.__index = f_card_skill_info

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_skill_info.static_create()
							 
	local skillInfoTable = createpublic_jineng_xiangqing_pop()
	local skillInfo = skillInfoTable["public_jineng_xiangqing_pop"]

	local funTable = {}
	tolua.setpeer(skillInfo, funTable)
	setmetatable(funTable, f_card_skill_info)

	skillInfo.m_componentTable = skillInfoTable

	return skillInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_skill_info:panelInitBeforePopup()
	self.m_data = nil
	self:registerNodeEvent()
end

function f_card_skill_info:setLock(islock, skill)
	self.m_isLock = islock
	self.m_lockSkill = skill
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] setData
-------------------------------------------------------------------------------
function f_card_skill_info:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then
		local skillIconName = g_game.g_dictConfigManager:getSkillIcon(self.m_data)
    	local skillIconRes = g_game.g_resourceManager:getSkillIconImage(skillIconName)
		self.m_componentTable["jineng_icon_image"]:setImage(skillIconRes)
		self.m_componentTable["jineng_icon_image"]:setSize(cc.size(90,90))
		
		local skillQuality = g_game.g_dictConfigManager:getSkillQuality(self.m_data)
		self.m_componentTable["jineng_icon_bg"]:setImage(g_game.g_f_quality_image[skillQuality])
		self.m_componentTable["jineng_icon_bg"]:setSize(cc.size(104,104))
		
		local skillName = g_game.g_dictConfigManager:getSkillName(self.m_data)
		self.m_componentTable["jineng_icon_name_label"]:setString(skillName)
		
		local skillDes = g_game.g_dictConfigManager:getSkillDesc(self.m_data)
		self.m_componentTable["icon_desc1"]:setString(skillDes)
		
		self.m_componentTable["skillLocak"]:setVisible(self.m_isLock)
		self.m_componentTable["lockDes"]:setVisible(self.m_lockSkill ~= nil)
		local call = function()
		end
		
		if self.m_lockSkill ~= nil then
			if LANGUAGE_TYPE == 3 then
				local text = "[0,0,255]解鎖 [91,24,6]【" .. self.m_lockSkill .. "】[0,0,255]天賦後開啟！"
				self.m_componentTable["lockDes"]:setComplexString(g_game.g_utilManager:getEncodeString(text, cc.c3b(91,24,6)), call)
			else
				local text = "[0,0,255]解锁 [91,24,6]【" .. self.m_lockSkill .. "】[0,0,255]天赋后开启！"
				self.m_componentTable["lockDes"]:setComplexString(g_game.g_utilManager:getEncodeString(text, cc.c3b(91,24,6)), call)
			end
		end
		if self.m_isLock then
			self.m_componentTable["jineng_icon_image"]:setOpacity(128)
		else
			self.m_componentTable["jineng_icon_image"]:setOpacity(255)
		end
		
	end
	
	local battleBeautyArr = g_game.g_userInfoManager:getBeautiListInfo()["battleList"]
	local skillReleaseRateRise = {}
	local skillReleaseEffRise = {}
	
	for i = 1, #battleBeautyArr do
		local beautyId = battleBeautyArr[i]["beautyId"]
		local skillId = g_game.g_dictConfigManager:getBeautyAdditionId(beautyId)
		local skillInfo = g_game.g_dictConfigManager:getBeautyAddition(skillId)
		
		local type = self:getSoldierEffType(skillInfo[4])
		local finalAddition = 0
		if type ~= -1 then
			local addPercent = 0
		    if battleBeautyArr[i]["beautyTitle"] ~= 0 then
		    	addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(battleBeautyArr[i]["beautyTitle"])
		    end
		    finalAddition = skillInfo[5]/1000 + (battleBeautyArr[i]["beautyLevel"]-1)*skillInfo[6]/1000 + addPercent
		end
		
		if type == 1 then  --release rate rise
			table.insert(skillReleaseRateRise,finalAddition)
		elseif type == 0 then --0 release eff rise
			table.insert(skillReleaseEffRise,finalAddition)
		end	
	
	end	
	
	if #skillReleaseRateRise == 0 then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["icon_desc2"]:setString("美女助陣釋放概率額外提升")
		else
			self.m_componentTable["icon_desc2"]:setString("美女助阵释放概率额外提升")
		end
		self.m_componentTable["zhuzhen_num1"]:setString("0%")
	else
		local compFunc = function(data1, data2)
			return data1 > data2
		end
		table.sort(skillReleaseRateRise,compFunc)
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["icon_desc2"]:setString("美女助陣釋放概率額外提升")
		else
			self.m_componentTable["icon_desc2"]:setString("美女助阵释放概率额外提升")
		end
		
		self.m_componentTable["zhuzhen_num1"]:setString(string.format("%.1f%%", skillReleaseRateRise[1]))
	end
	
	if #skillReleaseEffRise == 0 then
		if LANGUAGE_TYPE == 3 then 
			self.m_componentTable["icon_desc3"]:setString("美女助陣技能效果額外提升")
		else	
			self.m_componentTable["icon_desc3"]:setString("美女助阵技能效果额外提升")
		end
		self.m_componentTable["zhuzhen_num2"]:setString("0%")
	else
		local compFunc = function(data1, data2)
			return data1 > data2
		end
		table.sort(skillReleaseEffRise,compFunc)
		if LANGUAGE_TYPE == 3 then 
			self.m_componentTable["icon_desc3"]:setString("美女助陣技能效果額外提升")
		else
			self.m_componentTable["icon_desc3"]:setString("美女助阵技能效果额外提升")
		end
		self.m_componentTable["zhuzhen_num2"]:setString(string.format("%.1f%%", skillReleaseEffRise[1]))
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] getSkillEffType
-------------------------------------------------------------------------------
function f_card_skill_info:getSoldierEffType(effectId)
	if effectId == 1 then
		return 1
	elseif effectId == 5  then
		return 0
	end
	return -1
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_skill_info:registerNodeEvent(handler)
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
-- @function [parent=#f_card_skill_info] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_skill_info:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] onEnter
-------------------------------------------------------------------------------
function f_card_skill_info:onEnter()
	self:setStopTouchEvent(true)

	local actionPanel = self.m_componentTable["jineng_bottom_panel"]

	actionPanel:setScale(0.1)
	
	local actionTo = CCScaleTo:create(0.5,1)
	actionPanel:runAction(cc.EaseBounceOut:create(actionTo))
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] onExit
-------------------------------------------------------------------------------
function f_card_skill_info:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_skill_info:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_skill_info:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] onCleanup
-------------------------------------------------------------------------------
function f_card_skill_info:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_skill_info] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_skill_info:initAllComponent()
	self.m_componentTable["jineng_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("skill_info_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["jineng_close_btn"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    self.m_componentTable["jineng_queding"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
end


