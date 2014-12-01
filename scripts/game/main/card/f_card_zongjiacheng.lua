require("scripts.auto.auto_huangzidujun_zongjiacheng")
--[[--
	总加成弹出
--]]--
f_card_zongjiacheng = class("f_card_zongjiacheng")
f_card_zongjiacheng.__index = f_card_zongjiacheng

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_zongjiacheng.static_create()
							 
	local zongjiachengTable = createhuangzidujun_zongjiacheng()
	local panel = zongjiachengTable["huangzidujun_zongjiacheng"]

	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_card_zongjiacheng)

	panel.m_componentTable = zongjiachengTable

	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_zongjiacheng:panelInitBeforePopup(isPrince)
	self:registerNodeEvent()
	
	self.m_componentTable["downLabel"]:setVisible(not isPrince)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_zongjiacheng:registerNodeEvent(handler)
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
-- @function [parent=#f_card_zongjiacheng] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_zongjiacheng:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] onEnter
-------------------------------------------------------------------------------
function f_card_zongjiacheng:onEnter()
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] onExit
-------------------------------------------------------------------------------
function f_card_zongjiacheng:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_zongjiacheng:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_zongjiacheng:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] onCleanup
-------------------------------------------------------------------------------
function f_card_zongjiacheng:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_zongjiacheng:initAllComponent()
     --设置总加成关闭和确定事件
    local closeJiacheng = function()
    	g_game.g_panelManager:removeUiPanel("card_zongjiacheng")
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_componentTable["hzdj_zjc_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
    self.m_componentTable["hzdj_zjc_close_button"]:addHandleOfcomponentEvent(closeJiacheng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    self.m_componentTable["hzdj_zjc_queding_button"]:addHandleOfcomponentEvent(closeJiacheng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_zongjiacheng] loadhuangziZongjiachengData
-- 加载总加成数据用于显示
-------------------------------------------------------------------------------
function f_card_zongjiacheng:loadhuangziZongjiachengData() 
	local princeInfo = g_game.g_userInfoManager:getPrinceData()
	local battleList = princeInfo["battleList"]
	local princeAddtionList = self.m_componentTable["hzdj_zjc_container_list"]
    princeAddtionList:enableClipping(true)
	princeAddtionList:enableScroll(false)
	princeAddtionList:setListInfo(1, 0, 0, 430, 30)
	
	for i = 1, #battleList do		
		local item = require("scripts.game.main.common.f_common_text_panel").new()
		item:setSize(cc.size(430, 30))
	    princeAddtionList:appendComponent(item)
	    
	    local level = battleList[i]["princeLevel"]
		local passiveSkillId = battleList[i]["passiveSkillId"]
		local passiveSkillValue = g_game.g_dictConfigManager:getPassiveSkillValue(passiveSkillId)
		local passiveSkillGrow = g_game.g_dictConfigManager:getPassiveSkillGrow(passiveSkillId)	
		local passiveSkillAddtionNum = math.ceil((passiveSkillValue + (level - 1) * passiveSkillGrow) / 100)
		local passiveSkillDesc = g_game.g_dictConfigManager:getPassiveSkillDesc(passiveSkillId)
		local passiveDesLabelText = passiveSkillDesc .. passiveSkillAddtionNum
		
	    item:addItem(battleList[i]["princeName"], passiveSkillDesc .. passiveSkillAddtionNum)
	end
end

function f_card_zongjiacheng:loadmeinvZongjiachengData()
	local containerList = self.m_componentTable["hzdj_zjc_container_list"]
	containerList:enableClipping(true)
	containerList:enableScroll(false)
	containerList:setListInfo(1, 0, 0, 430, 30);

	local cheerBeautyArr = g_game.g_userInfoManager:getBeautiListInfo()["battleList"]
	for i = 1, #cheerBeautyArr do
		local beautyId = cheerBeautyArr[i]["beautyId"]
		local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyId)
		
		local beautyLv = cheerBeautyArr[i]["beautyLevel"]
		
		local jiachengId = g_game.g_dictConfigManager:getBeautyAdditionId(beautyId)
   	    local jiachengData = g_game.g_dictConfigManager:getBeautyAddition(jiachengId)
   	    local addPercent = 0
   		if cheerBeautyArr[i]["beautyTitle"] ~= 0 then
    		addPercent = g_game.g_dictConfigManager:getTitlePrincessAddition(cheerBeautyArr[i]["beautyTitle"])
   		end
   		
   	    local finalAddition = jiachengData[5]/1000 + (beautyLv-1)*jiachengData[6]/1000 + addPercent
        
        local item = require("scripts.game.main.common.f_common_beauty_text_panel").new()
		item:setSize(cc.size(430, 30))
		containerList:appendComponent(item)
		
	    local textJineng = g_game.g_dictConfigManager:getLanTextById(jiachengData[3])
		item:addItem(beautyName, textJineng.. string.format("%.1f%%", finalAddition))
	end
end
