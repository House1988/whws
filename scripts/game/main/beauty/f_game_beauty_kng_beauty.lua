require("scripts.auto.auto_kunninggong_detail_card")
--[[--
	坤宁宫 美女头像
--]]--
f_game_beauty_kng_beauty = class("f_game_beauty_kng_beauty")
f_game_beauty_kng_beauty.__index = f_game_beauty_kng_beauty

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty.static_create()
	local meinv_cardTable = createkunninggong_detail_card()
	local meinv_cardPanel = meinv_cardTable["kunninggong_detail_card"]

	local funTable = {}
	tolua.setpeer(meinv_cardPanel, funTable)
	setmetatable(funTable, f_game_beauty_kng_beauty)

	meinv_cardPanel.m_componentTable = meinv_cardTable

	return meinv_cardPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:panelInitBeforePopup()
	self.m_index = 0
	self.m_isClick = false
	self.m_isSelect = false
	self.m_selectCallback = nil
	self.m_data = nil
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_kng_beauty] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:onEnter()

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] onExit
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:initAllComponent()
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
-- @function [parent=#f_game_beauty_kng_beauty] setSelect
-- 设置选中回调
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		self.m_selectCallback(self)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] setSelectCallBack
-- 设置选中回调
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:setSelectCallBack(callback)
	self.m_selectCallback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] setData
-- 设置 data
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:setData(data)
	self.m_data  = data
	
	local beautyId = self.m_data["beautyId"]
	
	local beautyName = g_game.g_dictConfigManager:getBeautiName(beautyId)
	self.m_componentTable["kng_card_name_label"]:setColor(cc.c3b(137,32,18))
	self.m_componentTable["kng_card_name_label"]:setString(beautyName)
	
	local cardResource = g_game.g_dictConfigManager:getBeautyResource(beautyId)
	local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
		
	self.m_componentTable["kng_card_touxiang_image"]:setImage(resourceImage)
	self.m_componentTable["kng_card_touxiang_image"]:setSize(cc.size(90,90))
	
	local quality = g_game.g_dictConfigManager:getBeautyQuality(beautyId)
	for i = 1 , 5 do
		if i <= quality then
			self.m_componentTable["kng_card_star"..i.."_image"]:setVisible(true)
		else
			self.m_componentTable["kng_card_star"..i.."_image"]:setVisible(false)
		end
	end
	
	self.m_componentTable["kng_card_touxiangkuang_image"]:setImage(g_game.g_f_quality_image[quality])
	self.m_componentTable["kng_card_touxiangkuang_image"]:setSize(cc.size(104,104))
	
	local beautyLv = self.m_data["beautyLevel"]
	self.m_componentTable["kng_card_lv_label"]:setColor(cc.c3b(137,32,18))
	self.m_componentTable["kng_card_lv_label"]:setString("LV."..beautyLv)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] setData
-- get data
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] setIndex
-- 设置选中回调
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beauty] getIndex
-- 返回 index
-------------------------------------------------------------------------------
function f_game_beauty_kng_beauty:getIndex()
	return self.m_index
end
