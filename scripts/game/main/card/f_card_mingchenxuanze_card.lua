require("scripts.auto.auto_mingchenxuanze_card")
--[[--
    名臣选择 界面 显示卡牌
--]]--
f_card_mingchenxuanze_card = class("f_card_mingchenxuanze_card")
f_card_mingchenxuanze_card.__index = f_card_mingchenxuanze_card

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card.static_create()
	local mingchenxuanze_cardTable = createmingchenxuanze_card()
	local mingchenxuanze_card = mingchenxuanze_cardTable["mingchenxuanze_card"]
	
	local funTable = {}
	tolua.setpeer(mingchenxuanze_card, funTable)

	setmetatable(funTable, f_card_mingchenxuanze_card)
	
	mingchenxuanze_card.m_componentTable = mingchenxuanze_cardTable
	   
	return mingchenxuanze_card  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_data = nil
	self.m_isClick = false
	self.m_isSelect = false
	self.m_mingchenIndex = 0
	self.m_mingchenIndexInUnbattleList = 0
	
	self.m_mingchenCardCallBack = nil
	self.m_mingchenCardRemoveCallBack = nil
	
    self.m_soldierImage = {}
    --步兵
	self.m_soldierImage[1] = "batch_ui/bu_bingzhong_anniu.png"
	--弓兵
	self.m_soldierImage[2] = "batch_ui/gong_bingzhong_anniu.png"
	--骑兵
	self.m_soldierImage[3] = "batch_ui/qi_bingzhong_anniu.png"
	--枪兵
	self.m_soldierImage[4] = "batch_ui/qiang_bingzhong_anniu.png"
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:registerNodeEvent(handler)
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
-- @function [parent=#f_card_mingchenxuanze_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] onEnter
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:onEnter()

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] onExit
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:onExit()
	if self.m_mingchenCardRemoveCallBack ~= nil then
		self.m_mingchenCardRemoveCallBack(self)
	end  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] onCleanup
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] setMingchenIndex
-- 设置名臣选择的index
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:setMingchenIndex(index)
	self.m_mingchenIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] getMingchenIndex
-- 获得名臣选择的 index
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:getMingchenIndex()
	return self.m_mingchenIndex 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] setMingchenIndexInUnbattleList
-- 设置名臣在未上阵列表中的索引
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:setMingchenIndexInUnbattleList(index)
	self.m_mingchenIndexInUnbattleList = index
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] getMingchenIndexInUnbattleList
-- 获得名臣在未上阵列表中的 index
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:getMingchenIndexInUnbattleList()
	return self.m_mingchenIndexInUnbattleList 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] setMingchenCardEventCallBack
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:setMingchenCardEventCallBack(mingchenCardEventCallBack)
	self.m_mingchenCardCallBack = mingchenCardEventCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] setMingchenRemoveFromListCallback
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:setMingchenRemoveFromListCallback(mingchenCardRemoveCallBack)
	self.m_mingchenCardRemoveCallBack = mingchenCardRemoveCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:initAllComponent()

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
end


function f_card_mingchenxuanze_card:setSelect(isSelect)
	self.m_isSelect = isSelect
	
	if self.m_isSelect then
		self.m_mingchenCardCallBack(self)
	end 
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] getData
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] setData
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then
		self.m_componentTable["mcxz_card_yishangzhen_image"]:setVisible(false)
		
		local cardHeadRes = g_game.g_dictConfigManager:getCardHeadFile(self.m_data["officerId"])
		local cardHeadImage = g_game.g_resourceManager:getCardHead(cardHeadRes)
		
		local cardName = g_game.g_dictConfigManager:getCardName(self.m_data["officerId"])
		local officerQuality = g_game.g_dictConfigManager:getCardQuality(self.m_data["officerId"])
		local addAtk, addDef = g_game.g_dictConfigManager:getCardAddition(g_game.g_userInfoManager:getOfficerPosition(self.m_data["id"]), self.m_data, nil)
		local atk = ""..math.floor((self.m_data["attack"] + addAtk)) 
		local def = ""..math.floor((self.m_data["defense"] + addDef))
		
		self.m_componentTable["mingchenxuanze_card_head_image"]:setImage(cardHeadImage)
		self.m_componentTable["mingchenxuanze_card_head_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["mingchenxuanze_card_head_image"]:setSize(cc.size(90,90))
		self.m_componentTable["mingchenxuanze_card_head_rect_image"]:setImage(g_game.g_f_quality_image[officerQuality])
		self.m_componentTable["mingchenxuanze_card_head_rect_image"]:setSize(cc.size(102,102))
		self.m_componentTable["flabel_mingchenxuanze_card_name"]:setString(cardName)
		self.m_componentTable["mcxz_level_label"]:setString(self.m_data["officerLevel"])
		
		for i = 1, 5 do
   	  		 if i <= officerQuality then
   	    		 self.m_componentTable["star"..i]:setVisible(true)
   	   		else
   	    		 self.m_componentTable["star"..i]:setVisible(false)
   	   		end
    	end
 
    	self.m_componentTable["flabel_attack_num"]:setString(atk)
    	self.m_componentTable["flabel_defense_num"]:setString(def)
    	
    	local sinfo = g_game.g_dictConfigManager:getSoldierInfo(self.m_data["officerId"], self.m_data["advanced"])
    	
    	self.m_componentTable["soldier_type_image"]:setImage("nobatch/" .. sinfo[14])
    	self.m_componentTable["soldier_type_image"]:setSize(cc.size(36,37))
    	
		local battleList = g_game.g_userInfoManager:getBattleDataByType(g_game.g_f_battle_list_type.TYPE_CUR_BATTLE_ARR)
		local num = #battleList
		for j = 1, num do
			if self.m_data["id"] == battleList[j]["id"] then
				self.m_componentTable["mcxz_card_yishangzhen_image"]:setVisible(true)
				break
			end
		end
    	
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_mingchenxuanze_card] setSelectState
-- 显示选中状态
-------------------------------------------------------------------------------
function f_card_mingchenxuanze_card:setSelectState(isSelect)
	if isSelect then
		self.m_componentTable["mingchenxuanze_card_xuanzhong_image"]:setVisible(true)
	else
		self.m_componentTable["mingchenxuanze_card_xuanzhong_image"]:setVisible(false)
	end

end


