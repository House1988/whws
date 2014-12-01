require("scripts.auto.auto_huangzi_shangshufang")

--[[--
   尚书房 界面
--]]--

f_shangshufang_panel = class("f_shangshufang_panel")
f_shangshufang_panel.__index = f_shangshufang_panel


-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_shangshufang_panel.static_create()
	local huangzi_shangshufang_table = createhuangzi_shangshufang()
	local huangzi_shangshufang_panel = huangzi_shangshufang_table["huangzi_shangshufang"]
	 
	local funTable = {}
	tolua.setpeer(huangzi_shangshufang_panel, funTable)
	setmetatable(funTable, f_shangshufang_panel)
	
	huangzi_shangshufang_panel.m_componentTable = huangzi_shangshufang_table
	return huangzi_shangshufang_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_shangshufang_panel:panelInitBeforePopup()
	self.m_educationPrinceData = nil
	
	self.m_panelNum = 0
	self.m_curBeautyPanelIndex = 0
	self.m_curBeautyPanel = nil
	self.PANEL_COMPONENT_NUM = 8
	
	self.m_isGroupEducation = false
	self.m_educationSingelBeauty = nil
	
	self.m_educationBeautyArr = {}
	self:registerNodeEvent()	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_shangshufang_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_shangshufang_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_shangshufang_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] onEnter
-------------------------------------------------------------------------------
function f_shangshufang_panel:onEnter() 
	self.m_componentTable["hzssf_title_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self:initBeautyPanel()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] onExit
-------------------------------------------------------------------------------
function f_shangshufang_panel:onExit()  
  self:unregisterNodeEvent()
  
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_EDUCATION, self.event_updatePrinceEducationCallback)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_shangshufang_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_shangshufang_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] onCleanup
-------------------------------------------------------------------------------
function f_shangshufang_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] initBeautyPanel
-- 初始化美女panel
-------------------------------------------------------------------------------
function f_shangshufang_panel:initBeautyPanel()
	--获得所有的美女
	local allBeautyData = g_game.g_userInfoManager:getAllBeautyArr()
	
	--筛选掉 教育点 为0的美女
	if self.m_educationBeautyArr ~= nil then
		self.m_educationBeautyArr = {}
	end
		
	for i = 1, #allBeautyData do
		if allBeautyData[i]["beautyEducation"] ~= 0 then
			table.insert(self.m_educationBeautyArr,allBeautyData[i])
		end
	end
	
	--前往汤泉行宫
	local tqxgBtnClick = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeAllUiPanel()
		
		local beautyPalace = f_game_beauty_main.static_create()
		beautyPalace:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
	end
	self.m_componentTable["hzssf_to_tqxg_btn"]:addHandleOfcomponentEvent(tqxgBtnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--获取当前教育点不为0的美女个数
	local beautyNum = #self.m_educationBeautyArr
	if beautyNum == 0 then
		self.m_componentTable["hzsssf_no_beauty_tip"]:setVisible(true)
		self.m_componentTable["hzssf_to_tqxg_btn"]:setVisible(true)
		return
	end
	self.m_componentTable["hzsssf_no_beauty_tip"]:setVisible(false)
	self.m_componentTable["hzssf_to_tqxg_btn"]:setVisible(false)
	
	--计算panel页数  默认当前页为第一页
	self.m_panelNum = 0
	self.m_curPanelIndex = 1
	
	for i = 1, beautyNum  do
		if i <= self.PANEL_COMPONENT_NUM then
			self.m_panelNum = 1
		else
			if i%self.PANEL_COMPONENT_NUM == 0 then
				self.m_panelNum = self.m_panelNum + 1
			end
		end
	end
	
	if beautyNum > self.PANEL_COMPONENT_NUM*self.m_panelNum then
		self.m_panelNum = self.m_panelNum +1
	end
	
	self.m_curBeautyPanel = require("scripts.game.main.huangzi.f_huangzi_education_beauty_panel").new()
	self.m_componentTable["huangzi_shangshufang"]:appendComponent(self.m_curBeautyPanel)
	self.m_curBeautyPanel:setSize(cc.size(645,445))
	self.m_curBeautyPanel:setAnchorPoint(cc.p(0,1))
	self.m_curBeautyPanel:setPositionInContainer(cc.p(288, 83))
	
	local educationBtnCallBack = function(selectBeauty)
		self:useSelectBeautyToEducation(selectBeauty)
	end
	self.m_curBeautyPanel:setEducationBtnCallBack(educationBtnCallBack)

	--初始化第一页的
	self.m_curBeautyPanel:setPanelIndex(self.m_curPanelIndex)

	local componentNum = 0
	if self.m_panelNum == 1 then
		componentNum = beautyNum
	else
		componentNum = self.PANEL_COMPONENT_NUM
	end
	
	self.m_curBeautyPanel:setComponentNum(componentNum)
	self.m_curBeautyPanel:updatePanelData(self.m_educationBeautyArr)
	
	self.m_componentTable["hzsssf_nn_page_num_label"]:setString(self.m_curPanelIndex .. "/" ..self.m_panelNum)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] xiangqianClick
-- 向前按钮点击
-------------------------------------------------------------------------------
function f_shangshufang_panel:xiangqianClick()
	if self.m_panelNum == 0 then
		return
	end
	local beautyNum =  #self.m_educationBeautyArr
	
	if self.m_curPanelIndex > 1 then
		self.m_curPanelIndex = self.m_curPanelIndex -1
		
		self.m_curBeautyPanel:setPanelIndex(self.m_curPanelIndex)

		local componentNum = 0
		local num = beautyNum - (self.m_curPanelIndex -1)*self.PANEL_COMPONENT_NUM
		if num > self.PANEL_COMPONENT_NUM then
			componentNum = self.PANEL_COMPONENT_NUM
		else
			componentNum = num
		end
		self.m_curBeautyPanel:setComponentNum(componentNum)
		self.m_curBeautyPanel:updatePanelData(self.m_educationBeautyArr)
		
		self.m_componentTable["hzsssf_nn_page_num_label"]:setString(self.m_curPanelIndex .. "/" ..self.m_panelNum)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] xianghouClick
-- 向后按钮点击
-------------------------------------------------------------------------------
function f_shangshufang_panel:xianghouClick()
	if self.m_panelNum == 0 then
		return
	end

	local beautyNum = #self.m_educationBeautyArr
	
	if self.m_curPanelIndex < self.m_panelNum then
		self.m_curPanelIndex = self.m_curPanelIndex + 1
		
		self.m_curBeautyPanel:setPanelIndex(self.m_curPanelIndex)

		local componentNum = 0
		local num = beautyNum - (self.m_curPanelIndex -1)*self.PANEL_COMPONENT_NUM
		if num > self.PANEL_COMPONENT_NUM then
			componentNum = self.PANEL_COMPONENT_NUM
		else
			componentNum = num
		end
		self.m_curBeautyPanel:setComponentNum(componentNum)
		self.m_curBeautyPanel:updatePanelData(self.m_educationBeautyArr)
		
		self.m_componentTable["hzsssf_nn_page_num_label"]:setString(self.m_curPanelIndex .. "/" ..self.m_panelNum)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] useSelectBeautyToEducation
-- 使用当前选中娘娘教育
-------------------------------------------------------------------------------
function f_shangshufang_panel:useSelectBeautyToEducation(selectBeauty)
	if not self:canJiaoYu(10) then
		local strTT = g_game.g_dictConfigManager:getLanTextById(424)
		g_game.g_utilManager:showMsg(strTT)
		return
	end
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	local costSilver = g_game.g_dictConfigManager:getPrinceEducationCostSilver(self.m_educationPrinceData["princeStar"])
	if userSilver < costSilver then
--	    g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		require("scripts.game.main.common.f_less_silver_tip_popup")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
	else
		self.m_isGroupEducation = false
		self.m_educationSingelBeauty = selectBeauty
		
		local data = selectBeauty:getData()
		local beautyMainIds = {}
		beautyMainIds[1] = { ["id"] = data["id"]}
		
		g_game.g_userInfoManager:requestPrinceEducation(self.m_educationPrinceData["id"],1,beautyMainIds)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangshufang_panel:initAllComponent()
	--初始化当前用户的银两数据
--	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
--	self.m_componentTable["hzsssf_yinliang_num_label"]:setString(userSilver)
	
	--关闭按钮的点击事件
	local closeClick = function()
		self:closeClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzssf_title_close_button"]:addHandleOfcomponentEvent(closeClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--集体教育按钮的点击事件
	local jitijiaoyuClick = function()
		self:jitijiaoyuClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzssf_jiti_button"]:addHandleOfcomponentEvent(jitijiaoyuClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向前按钮的点击事件
	local xiangqianClick = function()
		self:xiangqianClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzsssf_nn_pre_page_button"]:addHandleOfcomponentEvent(xiangqianClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向后按钮的点击事件
	local xianghouClick = function()
		self:xianghouClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hzsssf_nn_back_page_button"]:addHandleOfcomponentEvent(xianghouClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--注册监听函数皇子 发送教育消息后 返回调用的
	self.event_updatePrinceEducationCallback = function()
		self:updatePrinceEducation()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_EDUCATION, self.event_updatePrinceEducationCallback)
	
	self.m_componentTable["yinliangnumber"]:setString(g_game.g_userInfoManager.m_user_info["silver"])
	
	self.m_expAnim = require("scripts.game.main.common.f_number_effect").new()
	self.m_expAnim:setup(nil, 21, "", false, false)
	self.m_expAnim:setPrograss(self.m_componentTable["hzsssf_age_loading_bar"], true)
	self:appendComponent(self.m_expAnim)
	local p = self.m_componentTable["hzsssf_prince_exp_num"]:getPositionInContainer()
	self.m_expAnim:setPositionInContainer(p)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] updatePrinceEducation
-- 更新  教育成功后的 皇子返回数据
-------------------------------------------------------------------------------
function f_shangshufang_panel:updatePrinceEducation()
	local isNeedUpdateBeauty = false
	self.m_componentTable["yinliangnumber"]:setString(g_game.g_userInfoManager.m_user_info["silver"])
	
	if self.m_isGroupEducation then
		
		local groupBeautys = self.m_curBeautyPanel:getCurPanelEducationBeautys()
		local len = #groupBeautys
		
		local costSilver = g_game.g_dictConfigManager:getPrinceEducationCostSilver(self.m_educationPrinceData["princeStar"])
		costSilver = costSilver * len
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		userInfo["silver"] = userInfo["silver"] - costSilver
		
		for i = 1, #groupBeautys do
			local data = groupBeautys[i]:getData()
			data["beautyEducation"] = data["beautyEducation"] - 1
			
			if data["beautyEducation"] == 0 then
				isNeedUpdateBeauty = true
			end
		end
	else
	
		local costSilver = g_game.g_dictConfigManager:getPrinceEducationCostSilver(self.m_educationPrinceData["princeStar"])
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		userInfo["silver"] = userInfo["silver"] - costSilver
	
		local data = self.m_educationSingelBeauty:getData()
		data["beautyEducation"] = data["beautyEducation"] - 1
		
		if data["beautyEducation"] == 0 then
			isNeedUpdateBeauty = true
		end
	end
	
	--当有美女教育点为0时候需要重新刷一下 界面，去除掉教育点为0的
	if isNeedUpdateBeauty then
		self:updateBeautyArr()
	else
		self.m_curBeautyPanel:updatePanelData(self.m_educationBeautyArr)
	end
	
	if self.m_curBeautyPanel ~= nil then
		self.m_curBeautyPanel:setPrinceMotherId(self.m_educationPrinceData["mother"])
	end
	
	--根据结果 显示弹出面板
	local educationResult = g_game.g_userInfoManager:getPrinceEducationResult()
	
	local levelIns = 0
	if educationResult["levelUp"] == 1 then
		local popupLvUp = require("scripts.game.main.common.f_common_popup_notice").new()	
		
		g_game.g_panelManager:showUiPanel(popupLvUp,"notice_popup_panel")
		
   		local passiveSkillId = self.m_educationPrinceData["passiveSkillId"]
   		local passiveSkillAddition = g_game.g_dictConfigManager:getPassiveSkillAddition(passiveSkillId)
   	
   		passiveSkillAddition = string.format("%.1f", passiveSkillAddition / 100)
   		
   		if LANGUAGE_TYPE == 3 then
   			local lvupTips = "經驗+".. educationResult["expGrow"] .. "\n等級+" .. educationResult["levelGrow"]
   				 .. "\n被動技能效果+" .. passiveSkillAddition
   			popupLvUp:setNoticeContent("升級成功","恭喜您成功越過一道龍門！",lvupTips,nil)
   		else
   			local lvupTips = "经验+".. educationResult["expGrow"] .. "\n等级+" .. educationResult["levelGrow"]
   				 .. "\n被动技能效果+" .. passiveSkillAddition
   			popupLvUp:setNoticeContent("升级成功","恭喜您成功越过一道龙门！",lvupTips,nil)
   		end
   		--11stand for prince lvup notice
   		popupLvUp:popUpNotice(11)
   		--1 stand for scale action
   		popupLvUp:setActionType(1)   	
   		levelIns = educationResult["levelGrow"]
	else
		local targetT = nil
		if LANGUAGE_TYPE == 3 then
			targetT = g_game.g_f_prince_exp_up_string2
		else
			targetT = g_game.g_f_prince_exp_up_string1
		end
		local rndStrlen = table.getn(targetT)
		local rndIndex = math.random(1,rndStrlen)
		
		if LANGUAGE_TYPE == 3 then
			 g_game.g_utilManager:showMsg(targetT[rndIndex] .. "，獲得經驗"..educationResult["expGrow"])
		else
			 g_game.g_utilManager:showMsg(targetT[rndIndex] .. "，获得经验"..educationResult["expGrow"])
		end
	   
	end

	local princeExp = educationResult["currExp"]
	local princeMaxExp = g_game.g_dictConfigManager:getPrinceExp(educationResult["level"],self.m_educationPrinceData["princeStar"])
	local percent = princeExp / princeMaxExp * 100
	self.m_componentTable["hzsssf_prince_exp_num"]:setString(princeExp .."/" ..princeMaxExp)
	self.m_componentTable["hzsssf_prince_exp_num"]:setComponentZOrder(2)
	self.m_expAnim:setPrograssValue(self.m_lastPercent / 100, levelIns + percent / 100)
	self.m_componentTable["hzsssf_age_loading_bar"]:setPercent(percent)
	self.m_componentTable["hzsssf_age_level_lbl"]:setString(educationResult["level"])
	self.m_componentTable["hzsssf_age_exp_lbl"]:setString(tostring(educationResult["currExp"]))
	
	self.m_lastPercent = percent
	self.m_expAnim:play(1, 10, 1)

	self.m_educationPrinceData["exp"] =  educationResult["currExp"]
	self.m_educationPrinceData["princeLevel"] =  educationResult["level"]

	--用于强制更新 皇子督军 panel的等级  经验信息
	
	local huangziDujun = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
	
	if huangziDujun ~= nil and huangziDujun.m_huangzi_dujun ~= nil then
		huangziDujun.m_huangzi_dujun:updatePrinceLevelInfo()
	end
	
	--更新尚书房界面的银两数据
--	local userSilverNew = g_game.g_userInfoManager:getUserInfo()["silver"]
--	self.m_componentTable["hzsssf_yinliang_num_label"]:setString(userSilverNew)
	
	--发送尚书房加经验和等级提升 更新成功事件（用于主界面银两更新 养心殿等级更新  皇子督军等级和经验更新）
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] updateBeautyArr
-- 更新美女panel
-------------------------------------------------------------------------------
function f_shangshufang_panel:updateBeautyArr()
	--获得所有的美女
	local allBeautyData = g_game.g_userInfoManager:getAllBeautyArr()
	
	--筛选掉 教育点 为0的美女
	if self.m_educationBeautyArr ~= nil then
		self.m_educationBeautyArr = {}
	end
		
	for i = 1, #allBeautyData do
		if allBeautyData[i]["beautyEducation"] ~= 0 then
			table.insert(self.m_educationBeautyArr,allBeautyData[i])
		end
	end
	
	--获取当前教育点不为0的美女个数
	local beautyNum = #self.m_educationBeautyArr
	
	if beautyNum == 0 then
		--显示当前无美女拥有教育点提示
		self.m_componentTable["hzsssf_no_beauty_tip"]:setVisible(true)
		self.m_componentTable["hzssf_to_tqxg_btn"]:setVisible(true)
		self.m_curBeautyPanel:setComponentNum(0)
		self.m_curBeautyPanel:updatePanelData(self.m_educationBeautyArr)
		self.m_componentTable["hzsssf_nn_page_num_label"]:setString(0 .. "/" ..0)
	else
		self.m_componentTable["hzsssf_no_beauty_tip"]:setVisible(false)
		self.m_componentTable["hzssf_to_tqxg_btn"]:setVisible(false)
		
		self.m_panelNum = 0
		for i = 1, beautyNum  do
			if i <= self.PANEL_COMPONENT_NUM then
				self.m_panelNum = 1
			else
				if i%self.PANEL_COMPONENT_NUM == 0 then
					self.m_panelNum = self.m_panelNum + 1
				end
			end
		end
		if beautyNum > self.PANEL_COMPONENT_NUM*self.m_panelNum then
			self.m_panelNum = self.m_panelNum +1
		end
		
		--panelindex 有可能大于panelnum，比如当最后一页就一个的时候，而且只有一个教育点
		--当该美女教育了之后，当前的panelnum应该会减 1
		if self.m_curPanelIndex > self.m_panelNum then
			self.m_curPanelIndex = self.m_panelNum
		end
		
		self.m_curBeautyPanel:setPanelIndex(self.m_curPanelIndex)
		
		local componentNum = 0
		local num = beautyNum - (self.m_curPanelIndex -1)*self.PANEL_COMPONENT_NUM
		if num > self.PANEL_COMPONENT_NUM then
			componentNum = self.PANEL_COMPONENT_NUM
		else
			componentNum = num
		end
		self.m_curBeautyPanel:setComponentNum(componentNum)
		
		self.m_curBeautyPanel:updatePanelData(self.m_educationBeautyArr)
		
		self.m_componentTable["hzsssf_nn_page_num_label"]:setString(self.m_curPanelIndex .. "/" ..self.m_panelNum)
	
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] setEducationPrinceData
-- 设置当前教育的皇子
-------------------------------------------------------------------------------
function f_shangshufang_panel:setEducationPrinceData(data)
	if self.m_educationPrinceData == data then
		return
	end
	self.m_educationPrinceData = data
	
	if self.m_curBeautyPanel ~= nil then
		self.m_curBeautyPanel:setPrinceMotherId(self.m_educationPrinceData["mother"])
	end
	
	self:updatePrinceInfo()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] updatePrinceInfo
-- 设置当前教育的皇子
-------------------------------------------------------------------------------
function f_shangshufang_panel:updatePrinceInfo()
	--皇子等级
	self.m_componentTable["hzsssf_age_level_lbl"]:setString(self.m_educationPrinceData["princeLevel"])
	
	--皇子经验
	self.m_componentTable["hzsssf_age_exp_lbl"]:setString(tostring(self.m_educationPrinceData["exp"]))
	
	--皇子头像
	local resource = g_game.g_dictConfigManager:getPrinceImage(self.m_educationPrinceData["princeStar"], self.m_educationPrinceData["princeResource"], self.m_educationPrinceData["princeLevel"])
	local princeImage = g_game.g_resourceManager:getPrinceHeadImage(resource)
	self.m_componentTable["hzsssf_age_image"]:setImage(princeImage)
	self.m_componentTable["hzsssf_age_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	self.m_componentTable["hzsssf_age_image"]:setSize(cc.size(90,90))
	
	local princeStar = self.m_educationPrinceData["princeStar"]
	self.m_componentTable["hzsssf_age_head_pinzhi_image"]:setImage(g_game.g_f_quality_image[princeStar])
	self.m_componentTable["hzsssf_age_head_pinzhi_image"]:setSize(cc.size(104,104))
	
	--皇子名字
	self.m_componentTable["hzsssf_age_name_label"]:setString(self.m_educationPrinceData["princeName"])
	
	--经验值
	local princeExp = self.m_educationPrinceData["exp"]
	local princeMaxExp = g_game.g_dictConfigManager:getPrinceExp(self.m_educationPrinceData["princeLevel"],self.m_educationPrinceData["princeStar"])
	local percent = princeExp / princeMaxExp * 100
	self.m_componentTable["hzsssf_prince_exp_num"]:setString(princeExp .."/" ..princeMaxExp)
	self.m_componentTable["hzsssf_prince_exp_num"]:setComponentZOrder(2)
	self.m_componentTable["hzsssf_age_loading_bar"]:setPercent(percent)
	
	self.m_lastPercent = percent
	
	local costSilver = g_game.g_dictConfigManager:getPrinceEducationCostSilver(self.m_educationPrinceData["princeStar"])
	local costJiaoyudian = 1
	
	self.m_componentTable["hzsssf_age_xueshi_num_label"]:setString(""..costJiaoyudian)
	self.m_componentTable["hzsssf_age_yinliang_num_label"]:setString(""..costSilver)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] closeClick
-- 关闭按钮点击
-------------------------------------------------------------------------------
function f_shangshufang_panel:closeClick()
	g_game.g_panelManager:removeUiPanel("huangzi_shangshufang")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] canJiaoYu
-- 能否进行教育
-------------------------------------------------------------------------------
function f_shangshufang_panel:canJiaoYu(exp)
	local princeExp = self.m_educationPrinceData["exp"]
	local level = self.m_educationPrinceData["princeLevel"]
	local princeMaxExp = g_game.g_dictConfigManager:getPrinceExp(level,self.m_educationPrinceData["princeStar"])
	princeMaxExp = princeMaxExp - princeExp
	while exp > 0 do
		if exp >= princeMaxExp then
			exp = exp - princeMaxExp
			level = level + 1
			princeMaxExp = g_game.g_dictConfigManager:getPrinceExp(level,self.m_educationPrinceData["princeStar"])
		else
			break
		end
	end
	return level <= g_game.g_userInfoManager.m_user_info["level"]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangshufang_panel] jitijiaoyuClick
-- 集体教育按钮点击
-------------------------------------------------------------------------------
function f_shangshufang_panel:jitijiaoyuClick()
	if self.m_curBeautyPanel == nil then
		return
	end
	
	local educationBeautys = self.m_curBeautyPanel:getCurPanelEducationBeautys()
	local len = table.getn(educationBeautys) 
	
	if len == 0 then
		return
	end
	
	if not self:canJiaoYu(len * 10) then
		local strTT = g_game.g_dictConfigManager:getLanTextById(424)
		g_game.g_utilManager:showMsg(strTT)
		return
	end
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	local costSilver = g_game.g_dictConfigManager:getPrinceEducationCostSilver(self.m_educationPrinceData["princeStar"])
	costSilver = costSilver * len
	
	if userSilver < costSilver then
--	    g_game.g_utilManager:showMsg("银两不足，进行寻访或者到金銮\n殿征税，都可获得大量银两哦!")
		require("scripts.game.main.common.f_less_silver_tip_popup")
		local panel = f_less_silver_tip_popup.static_create()
		g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
	else
		local beautyMainIds = {}
		for i = 1,len do
			local data = educationBeautys[i]:getData()
			beautyMainIds[i] = { ["id"] = data["id"]}
		end
		self.m_isGroupEducation = true
		
		g_game.g_userInfoManager:requestPrinceEducation(self.m_educationPrinceData["id"],len,beautyMainIds)
		
	end
		
end



