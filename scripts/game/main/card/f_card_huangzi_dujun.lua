require("scripts.auto.auto_huangzidujun_card")
require("scripts.auto.auto_huangzidujun_content")
require("scripts.auto.auto_huangzidujun_array_bottom")

require("scripts.game.main.huangzi.f_huangzi_yuelongmen_panel")
require("scripts.game.main.huangzi.f_huangzi_dujunxuanze_panel")
require("scripts.game.main.huangzi.f_huangzi_shuxing_panel")
require("scripts.game.main.card.f_card_zongjiacheng")

--[[--
   皇子督军  主界面
--]]--
local f_card_huangzi_dujun = class("f_card_huangzi_dujun", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_card_huangzi_dujun")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:ctor()
	self:registerNodeEvent()
	
	self.m_huangzi_dujun_cardTable = nil
	self.m_huangzi_dujun_cardContentTable = nil
	self.m_huangzi_dujun_bottomArrTable = nil
	
	self.m_prince_data	= nil
	self.m_card_head_list = nil
	self.m_select_unbattle_prince = nil
	self.m_select_empty_index = 0
	
	self.m_dujunxuanze_panel = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:registerNodeEvent(handler)
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
-- @function [parent=#f_card_huangzi_dujun] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] onEnter
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:onEnter()
    self.m_huangzi_dujun_cardContentTable = createhuangzidujun_content()
    local huangzi_dujun_content_panel = self.m_huangzi_dujun_cardContentTable["huangzidujun_content"]
    self:appendComponent(huangzi_dujun_content_panel)
    huangzi_dujun_content_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_dujun_content_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
    
	self.m_huangzi_dujun_cardTable = createhuangzidujun_card()
	local huangzi_dujun_card_panel = self.m_huangzi_dujun_cardTable["huangzidujun_card"]
    self:appendComponent(huangzi_dujun_card_panel)
    huangzi_dujun_card_panel:setAnchorPoint(cc.p(0,1))
    huangzi_dujun_card_panel:setPositionInContainer(cc.p(210,60))
    
    self.m_huangzi_dujun_bottomArrTable = createhuangzidujun_array_bottom()
	local paibing_card_arr_bottom_panel = self.m_huangzi_dujun_bottomArrTable["huangzidujun_array_bottom"]
	self:appendComponent(paibing_card_arr_bottom_panel)
	paibing_card_arr_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
	paibing_card_arr_bottom_panel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,
    CONFIG_SCREEN_HEIGHT/2))
  
	self:initAllComponent()
	
	--注册监听函数
	self.event_updatePrinceNameCallback = function()
		self:updatePrinceLevelInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
	
	self.event_updatePrinceListCallback = function()
		if self.m_card_head_list then
			self.m_card_head_list:refershListData()
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_LIST, self.event_updatePrinceListCallback)
	
	self.recivePrinceChangePositionCallback = function(msg)
		self:recivePrinceChangePositionResult(msg)
	end
	g_game.g_netManager:registerMessage(g_network_message_type.SC_PRINCE_BATTLE,self.recivePrinceChangePositionCallback)
	
	--注册宗人府升级回调（修改目标卡牌的等级显示）
	self.event_updateZongrenfuShengji = function()
		self:updatePrinceLevelInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS, self.event_updateZongrenfuShengji)
	
	--注册上书房升级回调（修改目标卡牌的等级显示）
	self.event_updateShangshufangJiaoyu = function()
		self:updatePrinceLevelInfo()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU, self.event_updateShangshufangJiaoyu)		
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU, self.event_updateShangshufangJiaoyu)		
	
	self:fillEmptyCardInfo()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] onExit
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:onExit()  
  self:unregisterNodeEvent()
  
  	self.m_huangzi_dujun_cardTable = nil
	self.m_huangzi_dujun_cardContentTable = nil
	self.m_huangzi_dujun_bottomArrTable = nil
	
	--移除注册的监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_NAME, self.event_updatePrinceNameCallback)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_LIST, self.event_updatePrinceListCallback)
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_ZONGRENFU_SHENGJI_ALTER_SUCCESS,self.event_updateZongrenfuShengji)
	
	--移除上书房皇子升级界面更新回调
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_SHANGSHUFANG_JIAOYU, self.event_updateShangshufangJiaoyu)
	
  	g_game.g_netManager:removeMessage(g_network_message_type.SC_PRINCE_BATTLE, self.recivePrinceChangePositionCallback)
  	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_ZONGRENFU, self.event_updateShangshufangJiaoyu)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] onCleanup
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:initAllComponent() 
    
    --跃龙门按钮——弹出跃龙门界面
    local popYuelongmen = function()
    	self:popYuelongmen()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_huangzi_dujun_cardTable["hzdj_yuelongmen_button"]:addHandleOfcomponentEvent(popYuelongmen,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    --更换按钮——弹出皇子选择界面
    local popHuangzixuanze = function()
    	self:popHuangzixuanze()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_huangzi_dujun_cardTable["hzdj_change_button"]:addHandleOfcomponentEvent(popHuangzixuanze,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    --总加成按钮——弹出总加成界面
    local popZongjiacheng = function()
    	self:popZongjiacheng()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_huangzi_dujun_bottomArrTable["btn_bg_image"]:addHandleOfcomponentEvent(popZongjiacheng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    

	--点击卡牌，显示皇子属性界面
	local princeAtrr = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_prince_data ~= nil then
			self:popPrinceAtrrPanel()
		end
	end
	self.m_huangzi_dujun_cardContentTable["huangzi_detail"]:addHandleOfcomponentEvent(princeAtrr,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	self:initCardHeadList()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] popPrinceAtrrPanel
-- 弹出皇子属性面板
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:popPrinceAtrrPanel() 
	local huangzi_shuxing_panel = f_huangzi_shuxing_panel.static_create()
    huangzi_shuxing_panel:panelInitBeforePopup()
    huangzi_shuxing_panel:setStopTouchEvent(true)	
	huangzi_shuxing_panel:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))	
	
	g_game.g_panelManager:showUiPanel(huangzi_shuxing_panel, "huangzishuxing_bg")
	
	huangzi_shuxing_panel:setPrinceData(self.m_prince_data, true)	
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] popHuangzixuanze
-- 点击更换按钮弹出皇子选择
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:popHuangzixuanze() 
	self.m_dujunxuanze_panel = f_huangzi_dujunxuanze_panel.static_create()
    self.m_dujunxuanze_panel:panelInitBeforePopup(1)
    self.m_dujunxuanze_panel:setStopTouchEvent(true)    
    
	g_game.g_panelManager:showUiPanel(self.m_dujunxuanze_panel, "huangzi_xuanze")
    
    local changePrinceCallback = function(princeData)
    	self:replacePrinceBattle(princeData)
    end    
    self.m_dujunxuanze_panel:setUpdateCallback(changePrinceCallback)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] popHuangzixuanzeFromList
-- 点击空上阵位置弹出皇子选择
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:popHuangzixuanzeFromList() 
	self.m_dujunxuanze_panel = f_huangzi_dujunxuanze_panel.static_create()
    self.m_dujunxuanze_panel:panelInitBeforePopup(1)
    self.m_dujunxuanze_panel:setStopTouchEvent(true)
        
	g_game.g_panelManager:showUiPanel(self.m_dujunxuanze_panel, "huangzi_xuanze")
	
    local setPrinceCallback = function(princeData)
    	self:setPrinceBattle(princeData)
    end    
    self.m_dujunxuanze_panel:setUpdateCallback(setPrinceCallback)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] removeHuangzixuanzePanel
-- 移除皇子选择界面
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:removeHuangzixuanzePanel() 
	g_game.g_panelManager:removeUiPanel("huangzi_xuanze")
	self.m_dujunxuanze_panel = nil
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] popYuelongmen
-- 弹出跃龙门
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:popYuelongmen() 
	if self.m_prince_data["princeLevel"] >= g_game.g_userInfoManager.m_user_info["level"] then
		local strTT = g_game.g_dictConfigManager:getLanTextById(424)
		g_game.g_utilManager:showMsg(strTT)
		return
	end
	
	local yuelongmen_panel = f_huangzi_yuelongmen_panel.static_create()
    yuelongmen_panel:panelInitBeforePopup()
    yuelongmen_panel:setStopTouchEvent(true)

	g_game.g_panelManager:showUiPanel(yuelongmen_panel, "huangzi_yuelongmen")

    yuelongmen_panel:setTargetPriceData(self.m_prince_data)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] popZongjiacheng
-- 弹出总加成
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:popZongjiacheng() 
	local huangzijiacheng_panel = f_card_zongjiacheng.static_create()
    huangzijiacheng_panel:panelInitBeforePopup(true)
	g_game.g_panelManager:showUiPanel(huangzijiacheng_panel,"card_zongjiacheng")
	huangzijiacheng_panel:loadhuangziZongjiachengData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] initCardHeadList
-- 初始化list，添加到界面
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:initCardHeadList()
	self.m_huangzi_dujun_bottomArrTable["hzdj_array_bg_image"]:setComponentZOrder(3)
	self.m_huangzi_dujun_bottomArrTable["btn_bg_image"]:setComponentZOrder(4)
	self.m_huangzi_dujun_bottomArrTable["chu_image"]:setComponentZOrder(4)
	self.m_huangzi_dujun_bottomArrTable["zong_ui"]:setComponentZOrder(4)
	self.m_huangzi_dujun_bottomArrTable["jia_ui"]:setComponentZOrder(4)
	self.m_huangzi_dujun_bottomArrTable["cheng_ui"]:setComponentZOrder(4)

	self.m_card_head_list = require("scripts.game.main.huangzi.f_prince_card_head_list").new()	
	self.m_huangzi_dujun_bottomArrTable["huangzidujun_array_bottom"]:appendComponent(self.m_card_head_list)
	self.m_card_head_list:setSize(cc.size(807,102))
	self.m_card_head_list:setListInfo(1, 0, 30, 104, 102)
	self.m_card_head_list:enableClipping(true)
	self.m_card_head_list:setAnchorPoint(cc.p(0,1))
	self.m_card_head_list:setComponentZOrder(2)
	self.m_card_head_list:setPositionInContainer(cc.p(140, 510))	
	
	local updateSelectPrince = function(princeData)
		self:showSelectPrince(princeData)
	end
	
	self.m_card_head_list:setUpdateCallback(updateSelectPrince)
	
	local openSelectPrinceCallback = function(position)
		self:popHuangzixuanzeFromList()
		self.m_select_empty_index = position
	end
	self.m_card_head_list:setEmptyPrinceCallback(openSelectPrinceCallback)
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] getQualityColor
-- 获取指定品质颜色
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:getQualityColor(quality)
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
-- @function [parent=#f_card_huangzi_dujun] showSelectPrince
-- 显示选中皇子信息
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:showSelectPrince(princeData)
	if self.m_prince_data == princeData then
		return
	end
	self.m_prince_data = princeData
	
	self:fillCardInfo()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] updatePrinceStarImage
-- 显示选中皇子卡牌星级
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:updatePrinceStarImage(princeStar)
	for i = 1, 5 do
		self.m_huangzi_dujun_cardTable["hzdj_star" .. i .. "_image"]:setVisible(false)
	end
	for i = 1, princeStar do
		self.m_huangzi_dujun_cardTable["hzdj_star" .. i .. "_image"]:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] updatePrinceLevelInfo
-- 显示选中皇子卡牌星级
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:updatePrinceLevelInfo()
	local princeStar = self.m_prince_data["princeStar"]
	local level = self.m_prince_data["princeLevel"]
	local expLimt = g_game.g_dictConfigManager:getPrinceExp(level, princeStar)
	local currentExp = self.m_prince_data["exp"]
	
	self.m_huangzi_dujun_cardTable["hzdj_tx_loading_num_label"]:setString(level)
	
	self.m_huangzi_dujun_cardTable["hzdj_card_name_label"]:setString(self.m_prince_data["princeName"])
	self.m_huangzi_dujun_cardTable["jingyan_num"]:setString(currentExp)
	
	self:updateSkillDesc(level)
	
	self.m_card_head_list:refreshSelectCard()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] updateSkillDesc
-- 显示选中皇子技能描述
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:updateSkillDesc(level)
	local skillId = self.m_prince_data["princeSkill"]
	local passiveSkillId = self.m_prince_data["passiveSkillId"]
	
	local skillName = g_game.g_dictConfigManager:getSkillName(skillId)
	local skillDesc = g_game.g_dictConfigManager:getSkillDesc(skillId)
	local skillAddtionNum = g_game.g_dictConfigManager:getSkillAddtion(skillId)
	local skillQuality = g_game.g_dictConfigManager:getSkillQuality(skillId)
	
	local labelText = skillName  	
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo1_label"]:setString(labelText)

	local desLabelText = skillDesc
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo2_label"]:setAlignment(0)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo2_label"]:setString(desLabelText)
	
	
	local passiveSkillValue = g_game.g_dictConfigManager:getPassiveSkillValue(passiveSkillId)
	local passiveSkillGrow = g_game.g_dictConfigManager:getPassiveSkillGrow(passiveSkillId)	
	local passiveSkillAddtionNum = math.ceil((passiveSkillValue + (level - 1) * passiveSkillGrow) / 100)	
	local passiveSkillName = g_game.g_dictConfigManager:getPassiveSkillName(passiveSkillId)
	local passiveSkillDesc = g_game.g_dictConfigManager:getPassiveSkillDesc(passiveSkillId)
	local passiveSkillQuality = g_game.g_dictConfigManager:getPassiveSkillQuality(passiveSkillId)
	
	local passiveLabelText = passiveSkillName 	
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo3_label"]:setString(passiveLabelText)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo3_label"]:setVisible(false)
	
	local passiveDesLabelText = passiveSkillDesc .. passiveSkillAddtionNum
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo4_label"]:setAlignment(0)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo4_label"]:setString(passiveDesLabelText)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] fillEmptyCardInfo
-- 当没有皇子列表并且没有皇子被选中时，填充所有信息为空
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:fillEmptyCardInfo()	
	for i = 1, 5 do
		self.m_huangzi_dujun_cardTable["hzdj_star" .. i .. "_image"]:setVisible(false)
	end
	
	self.m_huangzi_dujun_cardTable["hzdj_touxiang_image"]:setVisible(false)
	self.m_huangzi_dujun_cardTable["hzdj_tx_loading_num_label"]:setVisible(false)
	self.m_huangzi_dujun_cardTable["hzdj_card_name_label"]:setVisible(false)	
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo1_label"]:setVisible(false)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo2_label"]:setVisible(false)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo3_label"]:setVisible(false)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo4_label"]:setVisible(false)
	
	self.m_huangzi_dujun_cardTable["hzdj_yuelongmen_button"]:setButtonState(8)
	self.m_huangzi_dujun_cardTable["hzdj_change_button"]:setButtonState(8)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] fillCardInfo
-- 显示选中皇子卡牌以及品质
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:fillCardInfo()	
	self.m_huangzi_dujun_cardTable["hzdj_touxiang_image"]:setVisible(true)
	self.m_huangzi_dujun_cardTable["hzdj_tx_loading_num_label"]:setVisible(true)
	self.m_huangzi_dujun_cardTable["hzdj_card_name_label"]:setVisible(true)	
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo1_label"]:setVisible(true)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo2_label"]:setVisible(true)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo3_label"]:setVisible(true)
	self.m_huangzi_dujun_cardContentTable["hzdj_xiaoguo4_label"]:setVisible(true)
	
	self.m_huangzi_dujun_cardTable["hzdj_yuelongmen_button"]:setButtonState(2)
	self.m_huangzi_dujun_cardTable["hzdj_change_button"]:setButtonState(2)

	local princeStar = self.m_prince_data["princeStar"]
	local level = self.m_prince_data["princeLevel"]
	local resource = g_game.g_dictConfigManager:getPrinceImage(princeStar, self.m_prince_data["princeResource"], self.m_prince_data["princeLevel"])
	local princeImage = g_game.g_resourceManager:getPrinceImage(resource)
	
	
	self.m_huangzi_dujun_cardTable["hzdj_touxiang_image"]:setImage(princeImage)
	self.m_huangzi_dujun_cardTable["hzdj_touxiang_image"]:setSize(cc.size(482,363))
	self:updatePrinceStarImage(princeStar)
	self:updatePrinceLevelInfo()
	self:updateSkillDesc(level)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] setPrinceBattle
-- 设置皇子上阵
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:setPrinceBattle(princeData)
	if self.m_select_empty_index ~= 0 then
		
		local princeInfo = g_game.g_userInfoManager:getPrinceData()
		local battleList = princeInfo["battleList"]		
		
		g_game.g_userInfoManager:requestChangePrincePosition(princeData["id"], #battleList + 1)		
	end
	self.m_select_unbattle_prince = princeData
--	self.m_select_empty_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] replacePrinceBattle
-- 更换皇子上阵
-------------------------------------------------------------------------------
function f_card_huangzi_dujun:replacePrinceBattle(princeData)
	print("要下阵" .. self.m_prince_data["princeName"] .. "的位置:" .. self.m_prince_data["position"])
	print("要上阵" .. princeData["princeName"] .. "的位置:" .. princeData["position"])
	
	g_game.g_userInfoManager:requestChangePrincePosition(princeData["id"], self.m_prince_data["position"])	
	self.m_select_unbattle_prince = princeData
end



-------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] recivePrinceChangePositionResult
-- 皇子上阵或更换结果
-------------------------------------------------
function f_card_huangzi_dujun:recivePrinceChangePositionResult(msg)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)
	if msg["result"] == 1 then
		if self.m_select_empty_index ~= 0 then
			self:addPrinceToBattle()
			self.m_select_empty_index = 0
		else
			self:swapPrinceToBattle()
		end
	
		--发送刷新皇子名称事件
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_PRINCE_LIST)	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_UPDATE_TEAM_ATKDEF)	
		
		self:removeHuangzixuanzePanel() 
		g_game.g_panelManager:showEffect(7)
	else
		CCLOG("prince change position error!")
	end
end

-------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] addPrinceToBattle
-- 从未上阵列表中移动皇子上阵列表
-------------------------------------------------
function f_card_huangzi_dujun:addPrinceToBattle()	
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	local unbattleList = princeInfo["unbattleList"]
	local battleList = princeInfo["battleList"]
	
	for i = 1, #unbattleList do
		if unbattleList[i] == self.m_select_unbattle_prince then
			table.remove(unbattleList, i)
			break
		end
	end
	local count = #battleList
	
	self.m_select_unbattle_prince["position"] = count+1
	
	table.insert(battleList, count+1, self.m_select_unbattle_prince)
end

-------------------------------------------------
-- @function [parent=#f_card_huangzi_dujun] swapPrinceToBattle
-- 从未上阵列表中替换皇子上阵列表
-------------------------------------------------
function f_card_huangzi_dujun:swapPrinceToBattle()
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	local unbattleList = princeInfo["unbattleList"]
	local battleList = princeInfo["battleList"]
	
	local unbattleIndex = 0
	local battleIndex = 0
	for i = 1, #unbattleList do
		if unbattleList[i] == self.m_select_unbattle_prince then
			unbattleIndex = i
			break
		end
	end
	
	for i = 1, #battleList do
		if battleList[i] == self.m_prince_data then
			battleIndex = i
			break
		end
	end
	
	unbattleList[unbattleIndex]["position"] = battleList[battleIndex]["position"]
	
	table.remove(battleList, battleIndex)
	table.remove(unbattleList, unbattleIndex)
	
	table.insert(battleList, battleIndex, self.m_select_unbattle_prince)
	table.insert(unbattleList, unbattleIndex, self.m_prince_data)
	
end

return f_card_huangzi_dujun