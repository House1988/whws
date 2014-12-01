require("scripts.auto.auto_gongdouchuxiugong_card")
--[[--
	所有美女 美女卡牌
--]]--
f_game_beauty_allbeauty_card = class("f_game_beauty_allbeauty_card")
f_game_beauty_allbeauty_card.__index = f_game_beauty_allbeauty_card


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] static_clone
-- 新手指引，clone当前组件
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card.static_clone(colone)
	local meinv_cardTable = creategongdouchuxiugong_card()
	local meinv_cardPanel = meinv_cardTable["gongdouchuxiugong_card"]

	local funTable = {}
	tolua.setpeer(meinv_cardPanel, funTable)
	setmetatable(funTable, f_game_beauty_allbeauty_card)

	meinv_cardPanel:registerNodeEvent()
	meinv_cardPanel.m_componentTable = meinv_cardTable
	
	meinv_cardPanel:setData(colone:getData())

	return meinv_cardPanel
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card.static_create()
	local meinv_cardTable = creategongdouchuxiugong_card()
	local meinv_cardPanel = meinv_cardTable["gongdouchuxiugong_card"]

	local funTable = {}
	tolua.setpeer(meinv_cardPanel, funTable)
	setmetatable(funTable, f_game_beauty_allbeauty_card)

	meinv_cardPanel.m_componentTable = meinv_cardTable

	return meinv_cardPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:panelInitBeforePopup()
	self.m_beautyClickCallback = nil

	self.m_isClick = false
	self.m_isSelect = false
	self.m_beautyCardIndex = 0
	self.m_data = nil
	self:registerNodeEvent()
	
	self.m_remove_callback = nil
end

function f_game_beauty_allbeauty_card:isSelect()
	return self.m_isSelect
end


function f_game_beauty_allbeauty_card:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect and self.m_beautyClickCallback then
		self.m_beautyClickCallback(self)
		
		--新手指引
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_BEAUTY_CARD)
	end
end

function f_game_beauty_allbeauty_card:setIsGongDou(b)
	if b then --是宫斗
		self.m_componentTable["chuxiugong_xuanzhong"]:setVisible(false)
	else
		self.m_componentTable["gd_card_xuanzhong_image"]:setVisible(false)
		self.m_componentTable["select_bg"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] setBeautyClickCallback
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:setBeautyClickCallback(callBack)
	self.m_beautyClickCallback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] setRemoveCallback
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:setRemoveCallback(callBack)
	self.m_remove_callback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_allbeauty_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:onEnter()

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] onExit
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:onExit()
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self)
	end
	
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:initAllComponent()
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
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] getChapterIndex
-- 获得beauty index
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:getBeautyIndex()
	return self.m_beautyCardIndex
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] setChapterIndex
-- 设置chapter index
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:setBeautyIndex(index)
	self.m_beautyCardIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] setData
--  设置beauty内容
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:setData(data)

	self.m_data = data
	self:updateBeautyData()
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] getData
--  beauty内容
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_allbeauty_card] updateBeautyData
-- 更新 beauty内容
-------------------------------------------------------------------------------
function f_game_beauty_allbeauty_card:updateBeautyData()
	self.m_componentTable["gd_card_xuanzhong_image"]:setVisible(false)
	self.m_componentTable["chuxiugong_xuanzhong"]:setVisible(false)
	self.m_componentTable["gd_card_yizhuzhen"]:setVisible(false)
	self.m_componentTable["gd_card_yihuaiyun"]:setVisible(false)
	
	local beautyId = self.m_data["beautyId"]
	
	
	local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyId)
	self.m_componentTable["gd_card_name_label"]:setString(beautyName)
	
	local cardResource = g_game.g_dictConfigManager:getBeautyResource(beautyId)
	local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
		
	self.m_componentTable["gd_card_touxiang_image"]:setImage(resourceImage)
	self.m_componentTable["gd_card_touxiang_image"]:setSize(cc.size(90,90))
	
	local quality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
	for i = 1 , 5 do
		if i <= quality then
			self.m_componentTable["gd_card_star"..i.."_image"]:setVisible(true)
		else
			self.m_componentTable["gd_card_star"..i.."_image"]:setVisible(false)
		end
	end
	
	self.m_componentTable["gd_card_touxiangkuang_image"]:setImage(g_game.g_f_quality_image[quality])
	self.m_componentTable["gd_card_touxiangkuang_image"]:setSize(cc.size(104,104))
	
	local beautyLv = self.m_data["beautyLevel"]
	self.m_componentTable["gd_card_lv_label"]:setString("LV."..beautyLv)
	
	local cheeredList = g_game.g_userInfoManager:getBeautiListInfo()["battleList"]
	local num = g_game.g_userInfoManager:getBeautiListInfo()["battleList_Num"]
	for i = 1,num do
		if cheeredList[i]["id"] == self.m_data["id"] then
			self.m_componentTable["gd_card_yizhuzhen"]:setVisible(true)
			break
		end
	end
	
	if self.m_data["conceive"] ~= 0 then
		self.m_componentTable["gd_card_yihuaiyun"]:setVisible(true)
	end
end

