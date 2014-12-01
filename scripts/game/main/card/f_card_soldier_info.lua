require("scripts.auto.auto_public_bingzhong_xiangqing_pop")
--[[--
兵种详情
--]]--
f_card_soldier_info = class("f_card_soldier_info")
f_card_soldier_info.__index = f_card_soldier_info

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_soldier_info.static_create()
							 
	local soliderInfoTable = createpublic_bingzhong_xiangqing_pop()
	local soldierInfo = soliderInfoTable["public_bingzhong_xiangqing_pop"]

	local funTable = {}
	tolua.setpeer(soldierInfo, funTable)
	setmetatable(funTable, f_card_soldier_info)

	soldierInfo.m_componentTable = soliderInfoTable

	return soldierInfo
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_soldier_info:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_data = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] setData
-------------------------------------------------------------------------------
function f_card_soldier_info:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then
--		local name = g_game.g_dictConfigManager:getSoliderInfo(data["soldierType"])[6]
--		local imageName =  g_game.g_resourceManager:getSoldierImage(name) 
		local sinfo = g_game.g_dictConfigManager:getSoldierInfo(data["officerId"], data["advanced"])
		self.m_componentTable["icon_image"]:setImage("nobatch/" .. sinfo[14])
		
		self.m_componentTable["icon_image"]:setSize(cc.size(90,90))
		
		local tName = g_game.g_dictConfigManager:getLanTextById(sinfo[2])
		self.m_componentTable["icon_name_label"]:setString(tName)
		
		local bigType = g_game.g_dictConfigManager:getSoldierBigType(data["officerId"])
		local soldierDes = g_game.g_dictConfigManager:getLanTextById(sinfo[13])
		local t = string.split(soldierDes, "，")
		
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["icon_desc1"]:setString(t[1]..",克制效果為：")
			self.m_componentTable["icon_desc6"]:setString(t[2]..",被克效果為：")
			
			local kezhi = sinfo[4]
			self.m_componentTable["icon_desc2"]:setString("提升己方攻防值")
			self.m_componentTable["num1"]:setString(kezhi.."%")
			
			local beike = sinfo[5]
			self.m_componentTable["icon_desc4"]:setString("降低己方攻防值")
			self.m_componentTable["num3"]:setString(beike.."%")
		else
			self.m_componentTable["icon_desc1"]:setString(t[1]..",克制效果为：")
			self.m_componentTable["icon_desc6"]:setString(t[2]..",被克效果为：")
			
			local kezhi = sinfo[4]
			self.m_componentTable["icon_desc2"]:setString("提升己方攻防值")
			self.m_componentTable["num1"]:setString(kezhi.."%")
			
			local beike = sinfo[5]
			self.m_componentTable["icon_desc4"]:setString("降低己方攻防值")
			self.m_componentTable["num3"]:setString(beike.."%")
		end
		
	end
	
	local battleBeautyArr = g_game.g_userInfoManager:getBeautiListInfo()["battleList"]
	local skillEffRise = {}
	local skillEffReduce = {}
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
		
		if type == 1 then  -- rise
			table.insert(skillEffRise,finalAddition)
		elseif type == 0 then --0 reduce
			table.insert(skillEffReduce,finalAddition)
		end		
	end
	
	if #skillEffRise == 0 then
		if LANGUAGE_TYPE == 2 then
			self.m_componentTable["icon_desc3"]:setString("当前美女助阵效果提升")
		elseif LANGUAGE_TYPE == 3 then
			self.m_componentTable["icon_desc3"]:setString("當前美女助陣效果提升")
		end
		self.m_componentTable["num2"]:setString("0%")
	else
		local compFunc = function(data1, data2)
			return data1 > data2
		end
		table.sort(skillEffRise,compFunc)
		
		if LANGUAGE_TYPE == 2 then
			self.m_componentTable["icon_desc3"]:setString("当前美女助阵效果提升")
		elseif LANGUAGE_TYPE == 3 then
			self.m_componentTable["icon_desc3"]:setString("當前美女助陣效果提升")
		end
		self.m_componentTable["num2"]:setString(skillEffRise[1].."%")
	end
	
	if #skillEffReduce == 0 then
		self.m_componentTable["icon_desc5"]:setString("当前美女助阵效果降低")
		self.m_componentTable["num4"]:setString("0%")
	else
		local compFunc = function(data1, data2)
			return data1 > data2
		end
		table.sort(skillEffReduce,compFunc)
		self.m_componentTable["icon_desc5"]:setString("当前美女助阵效果降低")
		self.m_componentTable["num4"]:setString(skillEffReduce[1].."%")
		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] getSkillEffType
-------------------------------------------------------------------------------
function f_card_soldier_info:getSoldierEffType(effectId)
	if effectId == 3 then
		return 1
	elseif effectId == 4  then
		return 0
	end
	return -1
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_soldier_info:registerNodeEvent(handler)
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
-- @function [parent=#f_card_soldier_info] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_soldier_info:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] onEnter
-------------------------------------------------------------------------------
function f_card_soldier_info:onEnter()
	self:setStopTouchEvent(true)
	local actionPanel = self.m_componentTable["bz_bottom_panel"]

	actionPanel:setScale(0.1)
	
	local actionTo = CCScaleTo:create(0.5,1)
	actionPanel:runAction(cc.EaseBounceOut:create(actionTo))
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] onExit
-------------------------------------------------------------------------------
function f_card_soldier_info:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_soldier_info:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_soldier_info:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] onCleanup
-------------------------------------------------------------------------------
function f_card_soldier_info:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_soldier_info] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_soldier_info:initAllComponent()
	self.m_componentTable["close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	local closePanel = function()
		g_game.g_panelManager:removeUiPanel("soldier_info_panel")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    self.m_componentTable["bz_queding"]:addHandleOfcomponentEvent(closePanel, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
 
end


