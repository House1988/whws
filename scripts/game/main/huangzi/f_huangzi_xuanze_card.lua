require("scripts.auto.auto_huangzi_xuanze_card")
--[[--
     皇子卡牌
--]]--
f_huangzi_xuanze_card = class("f_huangzi_xuanze_card")
f_huangzi_xuanze_card.__index = f_huangzi_xuanze_card



-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card.static_create()
	local huangzi_xuanze_card_table = createhuangzi_xuanze_card()
	local huangzi_xuanze_card_panel = huangzi_xuanze_card_table["huangzi_xuanze_card"]
	
	local funTable = {}
	tolua.setpeer(huangzi_xuanze_card_panel, funTable)

	setmetatable(funTable, f_huangzi_xuanze_card)
	
	huangzi_xuanze_card_panel.m_componentTable = huangzi_xuanze_card_table
	   
	return huangzi_xuanze_card_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:panelInitBeforePopup()
	self:registerNodeEvent()		
	
	self.m_show_dujun = false
	self.m_index = 0 --记录在皇子展示列表中的索引
	self.m_data = nil
	self.m_isClick = false
	self.m_isSelect = false
		
	self.m_haungziCardCallBack = nil
	
	self.m_prince_remove_callback = nil
	self.m_duigouDi = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_xuanze_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] onEnter
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] onExit
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:onExit()  
	if self.m_prince_remove_callback ~= nil then
		self.m_prince_remove_callback(self.m_index)
	end
	
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setShowDujun
-- 设置是否显示已督军按钮
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setShowDujun(showDujun)
	if showDujun == false then
		self.m_componentTable["hzxz_yidujun_image"]:setVisible(false)
	else
		self.m_componentTable["hzxz_yidujun_image"]:setVisible(true)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setHuangziCardEventCallBack
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setHuangziCardEventCallBack(huangziCardEventCallBack)
	self.m_huangziCardCallBack = huangziCardEventCallBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setPrinceRemoveFromListCallback
-- 设置皇子数据从列表中移除的回调
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setPrinceRemoveFromListCallback(removeCallback)
	self.m_prince_remove_callback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setIndex
-- 设置在列表中的索引
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] getIndex
-- 获取在列表中的索引
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:getIndex()
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:initAllComponent()
	
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
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setDuigouVisible
-- 设置对勾显示属性
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setDuigouVisible(duigouVisible)
	if duigouVisible == true then
		self.m_componentTable["hzxz_sj_select"]:setVisible(true)
	else
		self.m_componentTable["hzxz_sj_select"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setDuigouDiVisible
-- 设置对勾底显示属性
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setDuigouDiVisible(duigouDiVisible)
	if duigouDiVisible == true then
		self.m_componentTable["hzxz_sj_bg"]:setVisible(true)
	else
		self.m_componentTable["hzxz_sj_bg"]:setVisible(false)
	end
end


function f_huangzi_xuanze_card:setSelect(isSelect)
	self.m_isSelect = isSelect
	
	if self.m_isSelect and self.m_huangziCardCallBack ~= nil then
		self.m_huangziCardCallBack(self.m_index)
	end 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setSelectState
-- 显示选中状态
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setSelectState(isSelect)
	if isSelect then
		self.m_componentTable["hzxz_card_xuanzhong_image"]:setVisible(true)
	else
		self.m_componentTable["hzxz_card_xuanzhong_image"]:setVisible(false)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] getData
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setData
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then	
		local resource = g_game.g_dictConfigManager:getPrinceImage(self.m_data["princeStar"], self.m_data["princeResource"], self.m_data["princeLevel"])
		local princeImage = g_game.g_resourceManager:getPrinceHeadImage(resource)
		local huangziQuality = self.m_data["princeStar"]
		local title = self.m_data["princeTitle"]
		local cardName = self.m_data["princeName"]
		local level = self.m_data["princeLevel"]
		
		self.m_componentTable["hzsx_card_image"]:setImage(princeImage)
		self.m_componentTable["hzsx_card_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_componentTable["hzsx_card_image"]:setSize(cc.size(90,90))
		if title == 0 then
		else
		end
		self.m_componentTable["hzxz_card_head_pinzhi_image"]:setImage(g_game.g_f_quality_image[huangziQuality])
		self.m_componentTable["hzxz_card_head_pinzhi_image"]:setSize(cc.size(102,102))
		self.m_componentTable["hzxz_name_label"]:setString(cardName)
		self.m_componentTable["hzxz_dengji_label"]:setString("LV:" .. level)
		
		for i = 1, 5 do
   	  		if i <= huangziQuality then
   	    		 self.m_componentTable["star"..i]:setVisible(true)
   	   		else
   	    		 self.m_componentTable["star"..i]:setVisible(false)
   	   		end
    	end
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_xuanze_card] setDujunVisible
-------------------------------------------------------------------------------
function f_huangzi_xuanze_card:setDujunVisible(isDujunVisible)
	self.m_componentTable["hzxz_yidujun_image"]:setVisible(isDujunVisible)
end


