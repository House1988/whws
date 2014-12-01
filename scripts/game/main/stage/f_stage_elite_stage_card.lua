require("scripts.auto.auto_elite_stage_card")
--[[--
精英副本
--]]--
f_stage_elite_stage_card = class("f_stage_elite_stage_card")
f_stage_elite_stage_card.__index = f_stage_elite_stage_card

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_elite_stage_card.static_create()
							 
	local eliteCardTable = createelite_stage_card()
	local info = eliteCardTable["elite_stage_card"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_stage_elite_stage_card)

	info.m_componentTable = eliteCardTable

	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] static_clone
-- 克隆对象
-------------------------------------------------------------------------------
function f_stage_elite_stage_card.static_clone(sigleEliteCard)
	local eliteCardTable = createelite_stage_card()
	local info = eliteCardTable["elite_stage_card"]

	local funTable = {}
	tolua.setpeer(info, funTable)
	setmetatable(funTable, f_stage_elite_stage_card)

	info.m_componentTable = eliteCardTable
	
	info:panelInitBeforePopup()
	info:setSize(cc.size(231,394))
	info:setIndex(sigleEliteCard.m_index)
	info:setStageData(sigleEliteCard.m_stageData)
	info:setEliteData(sigleEliteCard.m_eliteData)
	return info
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:panelInitBeforePopup()
	self.m_index = 0
	self.m_selectCall = nil
	self.m_removeCall = nil
	self.m_isSelect = false
	self.m_isClick = false
	self.m_stageData = nil
	self.m_eliteData = nil
	
	self.TYPE_UNOPEN = 1
	self.TYPE_OPEN = 2
	self.m_type = self.TYPE_UNOPEN
	self:registerNodeEvent()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_elite_stage_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] setIndex
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] getIndex
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:getIndex()
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] setStageData
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:setStageData(data)
	self.m_stageData = data 
	
	local txt = g_game.g_dictConfigManager:getLanTextById(self.m_stageData[2])
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["stage_name"]:setString("通過"..txt.."后開啟")
	else
		self.m_componentTable["stage_name"]:setString("通过"..txt.."后开启")
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] setEliteData
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:setEliteData(data)
	self.m_eliteData = data 
	
	local cardRes = g_game.g_dictConfigManager:getCardFile(self.m_eliteData[38])
	local cardImage = g_game.g_resourceManager:getCard(cardRes)
	self.m_componentTable["stage_card"]:setImage(cardImage)
	self.m_componentTable["stage_card"]:setSize(cc.size(338,260))
	self.m_componentTable["stage_card"]:setComponentZOrder(4)
	local  txt = g_game.g_dictConfigManager:getLanTextById(self.m_eliteData[2])
	self.m_componentTable["label_name"]:setString(txt)
	
	if self.m_eliteData[3] == 1 then
		self.m_componentTable["elite_stage_flag"]:setImage("batch_ui/gongji_tubiao.png")
		self.m_componentTable["elite_stage_flag"]:setSize(cc.size(43,60))
	else
		self.m_componentTable["elite_stage_flag"]:setImage("batch_ui/fangyu_tubiao.png")
		self.m_componentTable["elite_stage_flag"]:setSize(cc.size(43,60))
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] getEliteData
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:getEliteData()
	return self.m_eliteData
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] setSelectCallback
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:setSelectCallback(call)
	self.m_selectCall = call
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] setRemoveCallback
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:setRemoveCallback(call)
	self.m_removeCall = call
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] onEnter
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:onEnter()
	local lastEliteStageId = g_game.g_userInfoManager:getUserPveProgress()["eliteStageId"]
	
	if self.m_eliteData[1] <= lastEliteStageId then
		self.m_type = self.TYPE_OPEN
	else
		self.m_type = self.TYPE_UNOPEN
		self.m_componentTable["stage_card"]:setImageType(2)
		self.m_componentTable["card_bg"]:setImageType(2)
	end
	
	if self.m_index == 1 then
		self.m_componentTable["card_select_rect"]:setVisible(true)
	else
		self.m_componentTable["card_select_rect"]:setVisible(false)
	end
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] onExit
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:onExit()
	if self.m_removeCall ~= nil then
		self.m_removeCall(self)
	end
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] onCleanup
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_elite_stage_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:initAllComponent()
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
-- @function [parent=#f_stage_elite_stage_card] setSelect
-------------------------------------------------------------------------------
function f_stage_elite_stage_card:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect and self.m_selectCall ~= nil then
		if self.m_type == self.TYPE_OPEN then
			self.m_selectCall(self)
		end
	end
end


