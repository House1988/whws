require("scripts.auto.auto_genghuanzhenrong_card")
--[[--
更换阵容显示卡牌
--]]--
f_card_genghuanzhenrong_card = class("f_card_genghuanzhenrong_card")
f_card_genghuanzhenrong_card.__index = f_card_genghuanzhenrong_card

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] static_clone
-- 新手指引，静态克隆方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card.static_clone(cloneObj)
	local genghuanzhenrong_cardTable = creategenghuanzhenrong_card()
	local genghuanzhenrong_card = genghuanzhenrong_cardTable["genghuanzhenrong_card"]

	local funTable = {}
	tolua.setpeer(genghuanzhenrong_card, funTable)
	setmetatable(funTable, f_card_genghuanzhenrong_card)

	genghuanzhenrong_card:panelInitBeforePopup()
	genghuanzhenrong_card.m_componentTable = genghuanzhenrong_cardTable
	
	genghuanzhenrong_card:setData(cloneObj:getData())

	return genghuanzhenrong_card
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card.static_create()
	local genghuanzhenrong_cardTable = creategenghuanzhenrong_card()
	local genghuanzhenrong_card = genghuanzhenrong_cardTable["genghuanzhenrong_card"]

	local funTable = {}
	tolua.setpeer(genghuanzhenrong_card, funTable)
	setmetatable(funTable, f_card_genghuanzhenrong_card)

	genghuanzhenrong_card.m_componentTable = genghuanzhenrong_cardTable

	return genghuanzhenrong_card
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_data = nil
	self.m_isClick = false
	self.m_isSelect = false
	self.m_huanzhenIndex = 0

	self.GENG_HUAN = 1
	self.CARD_SELECT = 2

	self.m_huanzhenCardCallBack = nil
	self.m_changPositionCallBack = nil
	
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
-- @function [parent=#f_card_genghuanzhenrong_card] setCardState
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:setCardState(state)
	if state == self.GENG_HUAN then
		self.m_componentTable["genghuanzhenrong_card_xuanzhong_image"]:setVisible(false)
		self.m_componentTable["genghuan_button"]:setVisible(true)
	elseif state == self.CARD_SELECT then
		self.m_componentTable["genghuanzhenrong_card_xuanzhong_image"]:setVisible(true)
		self.m_componentTable["genghuan_button"]:setVisible(false)
	else
		print "state error"
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] getData
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] setData
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:setData(data)
	self.m_data = clone(data)

	if self.m_data ~= nil then
		local cardHeadRes = g_game.g_dictConfigManager:getCardHeadFile(self.m_data["officerId"])
		local cardHeadImage = g_game.g_resourceManager:getCardHead(cardHeadRes)

		local cardName = g_game.g_dictConfigManager:getCardName(self.m_data["officerId"])
		local officerQuality = g_game.g_dictConfigManager:getCardQuality(self.m_data["officerId"])

		self.m_componentTable["genghuanzhenrong_card_head_image"]:setImage(cardHeadImage)
		self.m_componentTable["genghuanzhenrong_card_head_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["genghuanzhenrong_card_head_image"]:setSize(cc.size(90,90))

		self.m_componentTable["genghuanzhenrong_card_head_rect_image"]:setImage(g_game.g_f_quality_image[officerQuality])
		self.m_componentTable["genghuanzhenrong_card_head_rect_image"]:setSize(cc.size(102,102))
		for i = 1, 5 do
			if i <= officerQuality then
				self.m_componentTable["star"..i]:setVisible(true)
			else
				self.m_componentTable["star"..i]:setVisible(false)
			end
		end
		self.m_componentTable["flabel_genghuanzhenrong_card_name"]:setString(cardName)

		local sinfo = g_game.g_dictConfigManager:getSoldierInfo(self.m_data["officerId"], self.m_data["advanced"])
    	
		self.m_componentTable["soldier_type_image"]:setImage("nobatch/" .. sinfo[14])
		self.m_componentTable["soldier_type_image"]:setSize(cc.size(36,37))
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] setHuanzhenIndex
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:setHuanzhenIndex(index)
	self.m_huanzhenIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] getHuanzhenIndex
-- 获得换阵界面卡牌的 index
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:getHuanzhenIndex()
	return self.m_huanzhenIndex
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] setHuanzhenCallBack
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:setHuanzhenCallBack(huanzhenCardCallBack)
	self.m_huanzhenCardCallBack = huanzhenCardCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] setChangePositionCallBack
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:setChangePositionCallBack(changePositonCallBack)
	self.m_changPositionCallBack = changePositonCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:registerNodeEvent(handler)
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
-- @function [parent=#f_card_genghuanzhenrong_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] onEnter
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:onEnter()


	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] onExit
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] onCleanup
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:initAllComponent()

	local downCallback = function()
		self.m_isClick = true
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )

	local downCallback = function()
	--		self.m_isClick = false
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

	local pressHuanButton = function()
		self.m_changPositionCallBack(self)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["genghuan_button"]:addHandleOfcomponentEvent(pressHuanButton, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_genghuanzhenrong_card:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		if self.m_huanzhenCardCallBack then
			self.m_huanzhenCardCallBack(self)
		end
	end
end


--

