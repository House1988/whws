require("scripts.auto.auto_meinvxuanze_card")
--[[--
	位助阵的 美女卡牌
--]]--
f_game_beauty_uncheer_card = class("f_game_beauty_uncheer_card")
f_game_beauty_uncheer_card.__index = f_game_beauty_uncheer_card

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card.static_create()
	local meinvxuanze_cardTable = createmeinvxuanze_card()
	local meinvxuanze_cardPanel = meinvxuanze_cardTable["meinvxuanze_card"]

	local funTable = {}
	tolua.setpeer(meinvxuanze_cardPanel, funTable)
	setmetatable(funTable, f_game_beauty_uncheer_card)

	meinvxuanze_cardPanel.m_componentTable = meinvxuanze_cardTable

	return meinvxuanze_cardPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:panelInitBeforePopup()
	self.m_beautyClickCallback = nil
	self.m_remove_callback = nil
	self.m_isClick = false
	self.m_isSelect = false
	self.m_beautyCardIndex = 0
	self.m_data = nil
	self:registerNodeEvent()
end

function f_game_beauty_uncheer_card:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		self.m_beautyClickCallback(self)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] setBeautyClickCallback
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:setBeautyClickCallback(callBack)
	self.m_beautyClickCallback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_uncheer_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:onEnter()
	self.m_componentTable["mvxz_guangquan_image"]:setSize(cc.size(179,246))

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] onExit
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:onExit()
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self)
	end
	
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] setRemoveCallback
-- 设置美女数据从列表中移除的回调
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:setRemoveCallback(removeCallback)
	self.m_remove_callback = removeCallback
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:initAllComponent()
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

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] getChapterIndex
-- 设置chapter index
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:getBeautyIndex()
	return self.m_beautyCardIndex
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_uncheer_card] setChapterIndex
-- 设置chapter index
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:setBeautyIndex(index)
	self.m_beautyCardIndex = index

end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] getData
--  beauty内容
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] setData
-- 设置
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:setData(data)
	 self.m_data = data
	 
	 self:updateBeautyData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] updateBeautyData
-- 更新 beauty内容
-------------------------------------------------------------------------------
function f_game_beauty_uncheer_card:updateBeautyData()
	self.m_componentTable["mvxz_card_cheer"]:setVisible(false)
	self.m_componentTable["mvxz_card_pregnant"]:setVisible(false)
	
	local beautyId = self.m_data["beautyId"]
	
	local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyId)
	local skillName = g_game.g_dictConfigManager:getBeautySkillName(beautyId)
	
	self.m_componentTable["mvxz_name_label"]:setString(beautyName)
	self.m_componentTable["mvxz_jineng_label"]:setString(skillName)
	
	local cardResource = g_game.g_dictConfigManager:getBeautyResource(beautyId)
	local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
	
	local selectBeautiQuality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
	
	self.m_componentTable["mvxz_meinvkuang_image"]:setImage(g_game.g_f_quality_image[selectBeautiQuality])
	self.m_componentTable["mvxz_meinvkuang_image"]:setSize(cc.size(102,102))	
		
	self.m_componentTable["mvxz_meinvtouxiang_image"]:setImage(resourceImage)
	self.m_componentTable["mvxz_meinvtouxiang_image"]:setSize(cc.size(90,90))
	
	local quality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
	for i = 1 , 5 do
		if i <= quality then
			self.m_componentTable["star"..i]:setVisible(true)
		else
			self.m_componentTable["star"..i]:setVisible(false)
		end
	end
	
	local cheeredList = g_game.g_userInfoManager:getBeautiListInfo()["battleList"]
	local num = g_game.g_userInfoManager:getBeautiListInfo()["battleList_Num"]
	for i = 1,num do
		if cheeredList[i]["id"] == self.m_data["id"] then
			self.m_componentTable["mvxz_card_cheer"]:setVisible(true)
			break
		end
	end
	
	if self.m_data["conceive"] ~= 0 then
		self.m_componentTable["mvxz_card_pregnant"]:setVisible(true)
	end

end

