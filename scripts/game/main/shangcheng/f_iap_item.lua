
require("scripts.auto.auto_shangcheng_chongzhi_card")
--[[--
	充值 物品item
--]]--
f_iap_item = class("f_iap_item")
f_iap_item.__index = f_iap_item


-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_iap_item.static_create()
	local chongzhiCardTable = createshangcheng_chongzhi_card()
	local chongzhiCard = chongzhiCardTable["shangcheng_chongzhi_card"]

	local funTable = {}
	tolua.setpeer(chongzhiCard, funTable)
	setmetatable(funTable, f_iap_item)
	
	chongzhiCard.m_componentTable = chongzhiCardTable
	return chongzhiCard  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_iap_item:panelInitBeforePopup()
	self:registerNodeEvent()
	
	
	self.m_remove_callback = nil
	self.m_buy_callback = nil
	
	self.m_index = 0 
	self.m_data = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] registerNodeEvent
-------------------------------------------------------------------------------
function f_iap_item:registerNodeEvent(handler)
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
-- @function [parent=#f_iap_item] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_iap_item:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

function f_iap_item:setCornerFlagVisible(b)
	self.m_componentTable["bottom_flag"]:setVisible(b)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] onEnter
-------------------------------------------------------------------------------
function f_iap_item:onEnter()
	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
		self.m_componentTable["sc_rmb_image"]:setVisible(false)
		local p = self.m_componentTable["sc_cz_card_rmb_label"]:getPositionInContainer()
		self.m_componentTable["sc_cz_card_rmb_label"]:setPositionInContainer(cc.p(p.x-4,p.y))
	end
	--添加充值卡的充值事件
	local clickChongzhi = function()
		if self.m_buy_callback then
			self.m_buy_callback(self.m_index)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["sc_cs_card_chongzhi_button"]:addHandleOfcomponentEvent(clickChongzhi, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] onExit
-------------------------------------------------------------------------------
function f_iap_item:onExit()  
    self:unregisterNodeEvent()
    
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self.m_index)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_iap_item:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] onExitTransitionStart
-------------------------------------------------------------------------------
function f_iap_item:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] onCleanup
-------------------------------------------------------------------------------
function f_iap_item:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] setRemoveCallback
-- 设置数据从列表中移除的回调
-------------------------------------------------------------------------------
function f_iap_item:setRemoveCallback(removeCallback)
	self.m_remove_callback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] setBuyCallback
-- 设置购买回调
-------------------------------------------------------------------------------
function f_iap_item:setBuyCallback(buyCallback)
	self.m_buy_callback = buyCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] setIndex
-- 设置在列表中的索引
-------------------------------------------------------------------------------
function f_iap_item:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] getIndex
-- 获取在列表中的索引
-------------------------------------------------------------------------------
function f_iap_item:getIndex()
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] getData
-------------------------------------------------------------------------------
function f_iap_item:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_iap_item] setData
-------------------------------------------------------------------------------
function f_iap_item:setData(data)
	self.m_data = data
	
	if self.m_data then
		if LANGUAGE_TYPE == 3 then
			self.m_componentTable["sc_cz_card_yuanbao_num_label"]:setString(self.m_data["info"]["gold"].."元寶")
		else
			self.m_componentTable["sc_cz_card_yuanbao_num_label"]:setString(self.m_data["info"]["gold"].."元宝")
		end
		
		if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
			self.m_componentTable["sc_cz_card_rmb_label"]:setString(self.m_data["info"]["discount"].."元")
		else
			self.m_componentTable["sc_cz_card_rmb_label"]:setString(self.m_data["info"]["discount"])
		end
	end
end