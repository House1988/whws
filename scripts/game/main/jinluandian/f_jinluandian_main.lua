require("scripts.auto.auto_jinluandian_zouzhangtanchu")
require("scripts.game.main.common.f_jump_tip_popup")

local PUTONG_DACHEN_HALF_NUM = 8 --普通大臣的一半数量
local PUTONG_PIANYI_X, PUTONG_PIANYI_Y          = 17, 25 --普通大臣的左右偏移量（绝对值）
local PUTONG_JIANJU          = 90 -- 两个普通大臣的间距
local PUTONG_JIZHUNWEIZHIX, PUTONG_JIZHUNWEIZHIY   = 305, 260 --普通大臣的基准位置（最后的左边一个）
local PUTONG_SMALL_SCALE     = 0.7
local PUTONG_SCALE_CHAZHI    = 0.1

local TESHU_DACHEN_HALF_NUM  = 3 --特殊大臣的一半数量
local TESHU_DACHEN_JIZHUNX,TESHU_DACHEN_JIZHUNY  = 360, 380 --特殊大臣的基准位置
local TESHU_DACHEN_ZONGCHAZHI  = 5   --特殊大臣的纵向间距
local TESHU_DACHEN_JIANJU    = 110  --特殊大臣的间距

--[[--
   金銮殿主界面
--]]--
f_jinluandian_main = class("f_jinluandian_main")
f_jinluandian_main._index = f_jinluandian_main

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_jinluandian_main.static_create()
	local jinluandian_main_table = g_game.g_panelManager:create_panel("jinluandian_bg")
	local jinluandian_main_panel = jinluandian_main_table["jinluandian_bg"]
	  
	local funTable = {}
	tolua.setpeer(jinluandian_main_panel, funTable)
	setmetatable(funTable, f_jinluandian_main)
	
	jinluandian_main_panel.m_jinluandian_bg_table = jinluandian_main_table
	return jinluandian_main_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_jinluandian_main:panelInitBeforePopup()
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] registerNodeEvent
-------------------------------------------------------------------------------
function f_jinluandian_main:registerNodeEvent(handler)
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
-- @function [parent=#f_jinluandian_main] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_jinluandian_main:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] onEnter
-------------------------------------------------------------------------------
function f_jinluandian_main:onEnter() 
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.REN_WU_DACHEN[1])
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[1])
		
	--特殊大臣数组
	self.m_teshu_array        = {}
	
	--吾皇万岁图片
	self.m_wansui_image       = nil
	self.costTaxGold = 0
		
	self:addDachen()	
	
	self.zouzhangtanchu_table = nil
	
	self:initAllComponent()
	
	--发送消息 通知新手指引
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_JINGNUANDIAN)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] onExit
-------------------------------------------------------------------------------
function f_jinluandian_main:onExit() 
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.REN_WU_DACHEN[1])
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[1])
	
	self.zouzhangtanchu_table = nil
	--特殊大臣数组	
	self.m_teshu_array        = nil 
--	self.m_wansui_image       = nil
	
	--发送播放主场景音乐事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_ASK_TAX, self.m_updateAskTax)
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZOUZHANG_SUCCESS,self.m_updateZouzhang)
    
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] addDachen
-- 添加大臣
-------------------------------------------------------------------------------
function f_jinluandian_main:addDachen()
	local teshuDachenCount = 1
	--添加左边普通大臣
	for i = 1, PUTONG_DACHEN_HALF_NUM do
		local countY = math.floor((i-1)/2)
		local countX = (i-1)%2
		local dachen = require("scripts.game.main.jinluandian.f_jinluandian_dachen").new()
		self:appendComponent(dachen)
		dachen:setScale(PUTONG_SMALL_SCALE + PUTONG_SCALE_CHAZHI * countY)
		dachen:setSize(cc.size(70, 145))
		dachen:setDachen(7, self, PUTONG_JIZHUNWEIZHIX + PUTONG_JIANJU * countX- PUTONG_PIANYI_X * countY)
		dachen:setAnchorPoint(cc.p(0.5, 0.5))
	    dachen:setPositionInContainer(cc.p(PUTONG_JIZHUNWEIZHIX + PUTONG_JIANJU * countX- PUTONG_PIANYI_X * countY, PUTONG_JIZHUNWEIZHIY + PUTONG_PIANYI_Y * countY))	
	end
	
	--添加左边特殊大臣
	for i = 1, TESHU_DACHEN_HALF_NUM do		  
		local dachen = require("scripts.game.main.jinluandian.f_jinluandian_dachen").new()
		self:appendComponent(dachen)
		dachen:setScale(PUTONG_SMALL_SCALE + PUTONG_SCALE_CHAZHI * 5)
		dachen:setSize(cc.size(70, 145))
		dachen:setDachen(teshuDachenCount, self, TESHU_DACHEN_JIZHUNX - TESHU_DACHEN_JIANJU * (i - 1))
		--添加到数组
		self.m_teshu_array[teshuDachenCount] = dachen
		teshuDachenCount = teshuDachenCount + 1
		dachen:setAnchorPoint(cc.p(0.5, 0.5))
	    dachen:setPositionInContainer(cc.p(TESHU_DACHEN_JIZHUNX - TESHU_DACHEN_JIANJU * (i - 1), TESHU_DACHEN_JIZHUNY + TESHU_DACHEN_ZONGCHAZHI * (i - 1)))	
	end
	
	--添加右边普通大臣
	for i = 1, PUTONG_DACHEN_HALF_NUM do
		local countY = math.floor((i-1)/2)
		local countX = (i-1)%2
		local dachen = require("scripts.game.main.jinluandian.f_jinluandian_dachen").new()
		self:appendComponent(dachen)
		dachen:setScale(PUTONG_SMALL_SCALE + PUTONG_SCALE_CHAZHI * countY)
		dachen:setSize(cc.size(70, 145))
		dachen:setDachen(7, self, 960-(PUTONG_JIZHUNWEIZHIX + PUTONG_JIANJU * countX- PUTONG_PIANYI_X * countY) - 23)
		dachen:setAnchorPoint(cc.p(0.5, 0.5))
	    dachen:setPositionInContainer(cc.p(960-(PUTONG_JIZHUNWEIZHIX + PUTONG_JIANJU * countX- PUTONG_PIANYI_X * countY) - 23, PUTONG_JIZHUNWEIZHIY + PUTONG_PIANYI_Y * countY))	
			
		dachen:setDachenFlip(true)
	end  
	
	--添加右边特殊大臣
	for i = 1, TESHU_DACHEN_HALF_NUM do
		local dachen = require("scripts.game.main.jinluandian.f_jinluandian_dachen").new()
		self:appendComponent(dachen)
		dachen:setScale(PUTONG_SMALL_SCALE + PUTONG_SCALE_CHAZHI * 5)
		dachen:setSize(cc.size(70, 145))
		dachen:setDachen(teshuDachenCount, self, 960-(TESHU_DACHEN_JIZHUNX - TESHU_DACHEN_JIANJU * (i - 1)) - 27)
		--添加到数组
		self.m_teshu_array[teshuDachenCount] = dachen
		teshuDachenCount = teshuDachenCount + 1
		dachen:setAnchorPoint(cc.p(0.5, 0.5))
	    dachen:setPositionInContainer(cc.p(960-(TESHU_DACHEN_JIZHUNX - TESHU_DACHEN_JIANJU * (i - 1)) - 27, TESHU_DACHEN_JIZHUNY + TESHU_DACHEN_ZONGCHAZHI * (i - 1)))		
			
		dachen:setDachenFlip(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_jinluandian_main:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] onExitTransitionStart
-------------------------------------------------------------------------------
function f_jinluandian_main:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] onCleanup
-------------------------------------------------------------------------------
function f_jinluandian_main:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_jinluandian_main:initAllComponent()
	self:initTaxButton()
	
	self.m_zouzhangAnim  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_zouzhangAnim)
	self.m_zouzhangAnim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_zouzhangAnim:setLoop(true)
	self.m_zouzhangAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_zouzhangAnim:setPositionInContainer(self.m_jinluandian_bg_table["jld_zouzhang_button"]:getPositionInContainer())
	self.m_zouzhangAnim:setVisible(g_game.g_userInfoManager:getUserLv() >= 4 and g_game.g_userInfoManager:getLeftReportsNum() > 0)
	
	self.m_zhengshuiAnim  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_zhengshuiAnim)
	self.m_zhengshuiAnim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_zhengshuiAnim:setLoop(true)
	self.m_zhengshuiAnim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	self.m_zhengshuiAnim:setPositionInContainer(self.m_jinluandian_bg_table["zs_button"]:getPositionInContainer())
	self.m_zhengshuiAnim:setVisible(g_game.g_userInfoManager:getUserLv() >= 16 and self:checkTax())

	-- 奏章按钮
	local zouzhang = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		local userLevel = g_game.g_userInfoManager:getUserLv()
		if userLevel < 4 then
			local str = g_game.g_dictConfigManager:getLanTextById(438)
			g_game.g_utilManager:showMsg(str)
			return
		end
		
		local reportsNum = g_game.g_userInfoManager:getLeftReportsNum()
		if reportsNum > 0 then
			self:askZouzhang()
		else
			-- 显示奏章不足面板
			local zouzhangBuzuPanel = g_game.g_panelManager:getUiPanel("zouzhang_buzu_pop")
			if zouzhangBuzuPanel == nil then
				require("scripts.game.main.jinluandian.f_zouzhang_buzu_panel")
				zouzhangBuzuPanel = f_zouzhang_buzu_panel.static_create()
				g_game.g_panelManager:showUiPanel(zouzhangBuzuPanel,"zouzhang_buzu_pop")
			end
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_jinluandian_bg_table["jld_zouzhang_button"]:addHandleOfcomponentEvent(zouzhang,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
	-- 奏章数目
	local reportsNum = g_game.g_userInfoManager:getLeftReportsNum()
	self.m_jinluandian_bg_table["zouzhang_num"]:setString(tostring(reportsNum))
	
	--征税
	local zhengshuiPress = function()
		local userLv = g_game.g_userInfoManager:getUserInfo()["level"]
		if userLv < 16 then
			local str = g_game.g_dictConfigManager:getLanTextById(439)
			g_game.g_utilManager:showMsg(str)	
		else
			self:askTax()
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		
	end
	self.m_jinluandian_bg_table["zs_button"]:addHandleOfcomponentEvent(zhengshuiPress,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local touchDown = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_jinluandian_bg_table["jld_tuchao_button"]:addHandleOfcomponentEvent(touchDown,g_game.g_f_touch_event.F_TOUCH_DOWN)
	--绑定退朝事件
	local closeCurPanel = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_TUICAO)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		self:closeCurrentPanel()
	end
	self.m_jinluandian_bg_table["jld_tuchao_button"]:addHandleOfcomponentEvent(closeCurPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	--设置背景图片
	local jld_bg_image = self.m_jinluandian_bg_table["jld_bg_image"]
	jld_bg_image:setImage(g_game.g_resourceManager:getUiMap("jinluandian_bg"))
	jld_bg_image:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	jld_bg_image:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	jld_bg_image:setAnchorPoint(cc.p(0,1))
	jld_bg_image:setPositionInContainer(cc.p(0,0))
	self:setStopTouchEvent(true)
	--添加“吾皇万岁”图片
	self.m_wansui_image = fc.FExtensionsImage:create()
	self:appendComponent(self.m_wansui_image)
	self.m_wansui_image:setImage("nobatch/wuhuangwansui.png")
	self.m_wansui_image:setAnchorPoint(cc.p(0.5,0.5))
	self.m_wansui_image:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2-160))
	self.m_wansui_image:setScale(0.0)
	
	local sound = function()		
		--发送播放金銮殿音乐事件
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_WUHUANGWANSUI)
	end
	--添加吾皇万岁的动画
	local sequence = g_game.g_transition.sequence({cc.DelayTime:create(0.2), cc.CallFunc:create(sound),cc.ScaleTo:create(1.5,1.0)})
	self.m_wansui_image:runAction(sequence)
	
	self.m_updateAskTax = function()
		self:updateTaxResult()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_ASK_TAX, self.m_updateAskTax)
	
	self.m_updateZouzhang = function()
		self:updateZouzhangResult()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZOUZHANG_SUCCESS,self.m_updateZouzhang)
	
	-- 奏章数目
	local leftNum = g_game.g_userInfoManager:getLeftReportsNum()
	local userVipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local maxNum = g_game.g_dictConfigManager:getMaxReportsNum(userVipInfo["level"])
	if leftNum == maxNum then
		self:refreshZouzhangNum(leftNum, 0)
	else
		local leftTime = g_game.g_userInfoManager:getZouZhangAddTime()
		self:refreshZouzhangNum(leftNum, leftTime)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] askZouzhang
-------------------------------------------------------------------------------
function f_jinluandian_main:askZouzhang()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local sendMsg = {["roleId"] = userInfo["roleId"]}
	g_game.g_netManager:send_message(g_network_message_type.CS_READ_REPORTS, sendMsg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] updateZouzhangResult
-------------------------------------------------------------------------------
function f_jinluandian_main:updateZouzhangResult()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local userLv = g_game.g_userInfoManager:getUserLv()
	local msg = g_game.g_userInfoManager.m_zouzhangResult
	local silver,exp = g_game.g_dictConfigManager:getZouZhangReward(userLv)
	silver = silver*msg["multiply"]
	exp = exp*msg["multiply"]
	
	if g_game.g_panelManager:isUiPanelShow("zozhang_result_view") then
		g_game.g_panelManager:removeUiPanel("zozhang_result_view")
	end
	
	-- 更新银两和经验值
	userInfo["silver"] = msg["silver"]
	userInfo["exp"] = msg["exp"]
	
	local zouzhangResult = require("scripts.game.main.jinluandian.f_zouzhang_reward_popup").new()
	if msg["rewardList_Num"] > 0 and msg["rewardList"][1]["type"] ~= 8  then
		zouzhangResult:setType(1) -- card
	else
		zouzhangResult:setType(2) -- exp silver
	end
	g_game.g_panelManager:showUiPanel(zouzhangResult,"zozhang_result_view")
	
	-- 是否升级
	local downcountTime = 0
	if msg["level"] > userLv then
		local create = function()
			local isOpenPosition = g_game.g_dictConfigManager:isOpenPosition(userLv, msg["level"])
			require("scripts.game.battle.layout.f_battle_emperor_lvup")
			local emperorlvupBoard = f_battle_emperor_lvup.static_create()
			emperorlvupBoard:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(emperorlvupBoard,"pve_emperor_lvup")
			emperorlvupBoard:setReportsPosType(isOpenPosition, msg["level"], msg["strength"], msg["military"], msg["energy"])
			g_game.g_userInfoManager:refershUserLevelInfo(msg["level"], msg["exp"])
		end
		
		local action = g_game.g_transition.sequence({CCDelayTime:create(1),CCCallFunc:create(create)})
		self:runAction(action)
	else
		g_game.g_userInfoManager:refershUserLevelInfo(userLv, msg["exp"])
		g_game.g_userInfoManager:changeReportsNum(1) -- 修改奏章数目
		downcountTime = g_game.g_userInfoManager.m_zouzhangAddTime
	end
	
	-- 刷新金銮殿奏章数目
	local leftNum = g_game.g_userInfoManager:getLeftReportsNum()
	self:refreshZouzhangNum(leftNum, downcountTime)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] showTaxResult
-------------------------------------------------------------------------------
function f_jinluandian_main:showTaxResult(addSilver)
	local texResult = require("scripts.game.main.jinluandian.f_show_tax_result_view").new()	
	texResult:setAddSilver(addSilver)
	g_game.g_panelManager:showUiPanel(texResult,"tax_result_view")
end

function f_jinluandian_main:checkTax()
	local userInfo = g_game.g_userInfoManager:getUserInfo()

	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	
	local curMaxTaxNum = g_game.g_dictConfigManager:getMaxTaxNum(vipInfo["level"])
	local curTaxTimes = vipInfo["texTimes"]
	
	return curTaxTimes < curMaxTaxNum
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] askTax
-- 征税
-------------------------------------------------------------------------------
function f_jinluandian_main:askTax()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	local userGold = userInfo["gold"]
	
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	
	local curMaxTaxNum = g_game.g_dictConfigManager:getMaxTaxNum(vipInfo["level"])
	local curTaxTimes = vipInfo["texTimes"]
	
	if curTaxTimes == curMaxTaxNum then
--		g_game.g_utilManager:showMsg("征税次数不足\nVIP等级越高，可征税次数越多")
		
		local panel = f_jump_tip_popup.static_create()
		panel:setPanelByType(6)
		local leftBtnCallback = function()
			g_game.g_panelManager:removeUiPanel("jump_tip_popup")
		end
		local rightBtnCallback = function()
			g_game.g_panelManager:removeAllUiPanel()
			local chongzhiPanel = g_game.g_panelManager:getUiPanel("shangcheng_chongzhi")
		    if chongzhiPanel == nil then
				chongzhiPanel = f_shangcheng_chongzhi_panel.static_create()
			    chongzhiPanel:panelInitBeforePopup()
			    g_game.g_panelManager:showUiPanel(chongzhiPanel, "shangcheng_chongzhi")
		    end
		end
		panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
		g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		
	else
		if userGold < self.costTaxGold then
			require("scripts.game.main.common.f_quick_charge_popup")
			local quickCharge = f_quick_charge_popup.static_create()
		    quickCharge:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(quickCharge,"quick_charge_ui")
		else
			g_game.g_userInfoManager:requestAskTax()
			
--			local yesCall = function()
--				g_game.g_userInfoManager:requestAskTax()
--			end
--			
--			local pop = require("scripts.game.main.common.f_common_popup_notice").new()	
--			g_game.g_panelManager:showUiPanel(pop,"notice_popup_panel")
--			local userLevel = userInfo["level"]
--			local gainSilver = 30000 + 500*(userLevel - 1)
--			if self.costTaxGold == 0 then
--				pop:setNoticeContent(nil,"首次征税不消耗元宝，可获得"..gainSilver.."银两，是否继续？",nil,nil)
--			else
--				pop:setNoticeContent(nil,"此次征税需要消耗"..self.costTaxGold.."元宝，可获得"..gainSilver.."银两，是否继续？",nil,nil)
--			end
--			pop:popUpNotice(29)
--			pop:setActionType(1)
--			pop:setYesCallBack(yesCall)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] updateTaxResult
--更新  征税结果
-------------------------------------------------------------------------------
function f_jinluandian_main:updateTaxResult()
	local result = g_game.g_userInfoManager:getTaxResult()
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	vipInfo["texTimes"] =  vipInfo["texTimes"] +1
	
	local curMaxTaxNum = g_game.g_dictConfigManager:getMaxTaxNum(vipInfo["level"])
	local leftTaxTimes = curMaxTaxNum - vipInfo["texTimes"]
	
	local addSilver = result["silver"] - userInfo["silver"]
	
	self:showTaxResult(addSilver)
--	g_game.g_utilManager:showMsg("征收成功，银两+"..addSilver.."\n今日剩余征收次数"..leftTaxTimes)	
	
	userInfo["silver"] = result["silver"]
	userInfo["gold"] = result["gold"]
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_USER_INFO)
	
	self:initTaxButton()
	self.m_zhengshuiAnim:setVisible(g_game.g_userInfoManager:getUserLv() >= 16 and self:checkTax())
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] initTaxButton
-- 初始化征税button
-------------------------------------------------------------------------------
function f_jinluandian_main:initTaxButton()
	local vipInfo = g_game.g_userInfoManager:getUserVipInfo()
	local curMaxTaxNum = g_game.g_dictConfigManager:getMaxTaxNum(vipInfo["level"])
	local curTaxTimes = vipInfo["texTimes"]
	local leftTaxTimes = curMaxTaxNum - curTaxTimes
	self.m_jinluandian_bg_table["zs_num"]:setString(leftTaxTimes)
	
	self.costTaxGold = 0
	--当天第一次征税免费 ，第二次20  往后就是  20+10*次数
	if curMaxTaxNum == leftTaxTimes or leftTaxTimes == 0 then
		self.costTaxGold = 0
	else
		self.costTaxGold = 10 + (curMaxTaxNum - leftTaxTimes-1)*10
		if self.costTaxGold > 100 then  self.costTaxGold = 100 end
	end
	self.m_jinluandian_bg_table["zs_yuanbao_num"]:setString(self.costTaxGold)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] closeCurrentPanel
-- remove 当前金銮殿界面
-------------------------------------------------------------------------------
function f_jinluandian_main:closeCurrentPanel()
    g_game.g_panelManager:removeUiPanel("jinluandian_bg")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] cancelTouch
-- 点击一个特殊大臣，取消特殊大臣们的触摸事件
-------------------------------------------------------------------------------
function f_jinluandian_main:cancelTouch(dachenType)
	for i = 1, #self.m_teshu_array do
		self.m_teshu_array[i]:setTouchEnabled(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] recoverTouch
-- 恢复特殊大臣们的触摸事件
-------------------------------------------------------------------------------
function f_jinluandian_main:recoverTouch()
	for i = 1, #self.m_teshu_array do
		self.m_teshu_array[i]:setTouchEnabled(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] removeWansui
-- 移除万岁
-------------------------------------------------------------------------------
function f_jinluandian_main:removeWansui()
	local remove = function()
		self:deleteComponent(self.m_wansui_image)
	end
	
	local sequence = g_game.g_transition.sequence({cc.FadeOut:create(0.5),cc.CallFunc:create(remove)})
	self.m_wansui_image:runAction(sequence)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jinluandian_main] refreshZouzhangNum
-- 设置奏章数目
-------------------------------------------------------------------------------
function f_jinluandian_main:refreshZouzhangNum(count, leftTime)
	local userLevel = g_game.g_userInfoManager:getUserLv()
	if userLevel < 4 then
		self.m_jinluandian_bg_table["zouzhang_num"]:setString("0")
		self.m_jinluandian_bg_table["zouzhang_time_num"]:setString("00:00")
	else
		-- 奏章数目
		self.m_jinluandian_bg_table["zouzhang_num"]:setString(count)
		-- 恢复奏章倒计时
		local min = math.floor(leftTime/60)
		local sec = leftTime%60
		local coutdownStr = string.format("%02d:%02d", min, sec)
		self.m_jinluandian_bg_table["zouzhang_time_num"]:setString(coutdownStr)
		self.m_zouzhangAnim:setVisible(g_game.g_userInfoManager:getLeftReportsNum() > 0)
	end
end
