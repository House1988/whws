require("scripts.auto.auto_shengji_card")
--[[--
    名臣卡牌
--]]--
f_mingchen_shengji_card = class("f_mingchen_shengji_card")
f_mingchen_shengji_card.__index = f_mingchen_shengji_card



-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] static_clone
-- 静态clone方法，创建使用传入对象进行构造的对象
-------------------------------------------------------------------------------
function f_mingchen_shengji_card.static_clone(cloneObj)
	local mingchen_shengji_card_table = createshengji_card()
	local mingchen_shengji_card_panel = mingchen_shengji_card_table["shengji_card"]
	
	local funTable = {}
	tolua.setpeer(mingchen_shengji_card_panel, funTable)

	setmetatable(funTable, f_mingchen_shengji_card)
	
	
	mingchen_shengji_card_panel:panelInitBeforePopup()	
	
	mingchen_shengji_card_panel.m_componentTable = mingchen_shengji_card_table
	   
	   
	return mingchen_shengji_card_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_mingchen_shengji_card.static_create()
	local mingchen_shengji_card_table = createshengji_card()
	local mingchen_shengji_card_panel = mingchen_shengji_card_table["shengji_card"]
	
	local funTable = {}
	tolua.setpeer(mingchen_shengji_card_panel, funTable)

	setmetatable(funTable, f_mingchen_shengji_card)
	
	mingchen_shengji_card_panel.m_componentTable = mingchen_shengji_card_table
	
	   
	return mingchen_shengji_card_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:panelInitBeforePopup()
	self:registerNodeEvent()		
	
	self.m_index = 0 --记录在名臣展示列表中的索引
	self.m_data = nil --名臣卡牌的数据
	self.m_isClick = false
	self.m_isSelect = false
	
	self.m_mingchenCardCallBack = nil	
	self.m_mingchenRemoveCallback = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:registerNodeEvent(handler)
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
-- @function [parent=#f_mingchen_shengji_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] onEnter
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:onEnter()

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] onExit
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:onExit()  
	if self.m_mingchenRemoveCallback ~= nil then
		self.m_mingchenRemoveCallback(self)
	end
	
  	self:unregisterNodeEvent()
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] onCleanup
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] setMingchenCardEventCallBack
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:setMingchenCardEventCallBack(mingchenCardEventCallBack)
	self.m_mingchenCardCallBack = mingchenCardEventCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] setMingchenRemoveFromListCallback
-- 设置皇子数据从列表中移除的回调
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:setMingchenRemoveFromListCallback(removeCallback)
	self.m_mingchenRemoveCallback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] setIndex
-- 设置在列表中的索引
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] getIndex
-- 获取在列表中的索引
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:getIndex()
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:initAllComponent()
	
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
-- @function [parent=#f_mingchen_shengji_card] setDuigouVisible
-- 设置对勾是否显示
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:setDuigouVisible(duigouVisible)
	self.m_componentTable["sj_card_duigou"]:setVisible(duigouVisible)
end

function f_mingchen_shengji_card:isSelect()
	return self.m_isSelect
end
-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] setSelect
-- 设置选择后的回调
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:setSelect(isSelect)
	self.m_isSelect = isSelect
	
	if self.m_isSelect and self.m_mingchenCardCallBack ~= nil then
		self.m_mingchenCardCallBack(self)
		--新手指引
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_SELECT_MINGCHENG_CARD)
	end 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] getData
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_mingchen_shengji_card] setData
-------------------------------------------------------------------------------
function f_mingchen_shengji_card:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then	
		self:setDuigouVisible(false)
		
		local mingchenImage = "card_head/" .. g_game.g_dictConfigManager:getCardHeadFile(self.m_data["officerId"]) .. ".png"
		local mingchenQuality = g_game.g_dictConfigManager:getCardQuality(self.m_data["officerId"])
		local cardName = g_game.g_dictConfigManager:getCardName(self.m_data["officerId"])
		local level = self.m_data["officerLevel"]
		
		self.m_componentTable["sj_card_quality_bg"]:setImage(g_game.g_f_quality_image[mingchenQuality])
		self.m_componentTable["sj_card_quality_bg"]:setSize(cc.size(102,102))
		
		self.m_componentTable["sj_card_touxiang_image"]:setImage(mingchenImage)
		self.m_componentTable["sj_card_touxiang_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["sj_card_touxiang_image"]:setSize(cc.size(90,90))
		
		self.m_componentTable["sj_card_name_label"]:setString(cardName)
		
		for i = 1, 5 do
   	  		 if i <= mingchenQuality then
   	    		 self.m_componentTable["sj_card_star" .. i .. "_image"]:setVisible(true)
   	   		else
   	    		 self.m_componentTable["sj_card_star" .. i .. "_image"]:setVisible(false)
   	   		end
    	end
    	
    	self.m_componentTable["lv_num_label"]:setString(level)
    	
	end	
end


