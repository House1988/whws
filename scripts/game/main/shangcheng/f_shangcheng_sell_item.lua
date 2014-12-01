require("scripts.auto.auto_shangcheng_daoju")
--[[--
商城 道具
--]]--
f_shangcheng_sell_item = class("f_shangcheng_sell_item")
f_shangcheng_sell_item.__index = f_shangcheng_sell_item

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_shangcheng_sell_item.static_create()
	local user_itemTable = createshangcheng_daoju()
	local user_itemPanel = user_itemTable["shangcheng_daoju"]

	local funTable = {}
	tolua.setpeer(user_itemPanel, funTable)
	setmetatable(funTable, f_shangcheng_sell_item)

	user_itemPanel.m_componentTable = user_itemTable

	return user_itemPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_index = 0
	self.m_data = 0
	self.m_buy = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] setBuyCallBack
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:setBuyCallBack(callback)
	self.m_buy = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] registerNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:registerNodeEvent(handler)
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
-- @function [parent=#f_shangcheng_sell_item] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] onEnter
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] onExit
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] setIndex
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] getIndex
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:getIndex(index)
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] getData
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] setData
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:setData(data)
	self.m_data =  data
	
	if self.m_data ~= nil then
		local itemName =  g_game.g_dictConfigManager:getLanTextById(self.m_data[2])
		self.m_componentTable["sc_dj_name_label"]:setString(itemName)
		
		local itemResName = self.m_data[10]
		local itemImage = g_game.g_resourceManager:getItemImage(itemResName)
		self.m_componentTable["sc_dj_renwu_image"]:setImage(itemImage)
		self.m_componentTable["sc_dj_renwu_image"]:setSize(cc.size(90,90))
		
		local des = g_game.g_dictConfigManager:getLanTextById(self.m_data[7])
		self.m_componentTable["sc_dj_miaoshu_label"]:setString(des)

		self.m_componentTable["frame"]:setImage(g_game.g_f_quality_image[self.m_data[9]])
		
		--先判定元宝
		if self.m_data[5] ~=  0 then
			self.m_componentTable["sc_dj_xianjia_label"]:setString(self.m_data[5])
			--判定原价
			if self.m_data[12] ~= 0 then
--				self.m_componentTable["sc_dj_yuanjia_label"]:setString(self.m_data[12])
			else
--				self.m_componentTable["sc_dj_yuanjia_label"]:setVisible(false)
--				self.m_componentTable["vip_xq_libao_yuanjia_label"]:setVisible(false)
--				self.m_componentTable["x_image_left"]:setVisible(false)
--				self.m_componentTable["x_image_right"]:setVisible(false)
--				self.m_componentTable["ss_dj_yuanbao_yuanjia"]:setVisible(false)
			end
		else
			--判定 银两
			if self.m_data[6] ~= 0 then
				self.m_componentTable["ss_dj_yuanbao_xianjia"]:setImage("batch_ui/yinliang_tubiao.png")
				self.m_componentTable["ss_dj_yuanbao_xianjia"]:setSize(cc.size(29,24))
				self.m_componentTable["sc_dj_xianjia_label"]:setString(self.m_data[6])
			end
			
--			self.m_componentTable["sc_dj_yuanjia_label"]:setVisible(false)
--			self.m_componentTable["vip_xq_libao_yuanjia_label"]:setVisible(false)
--			self.m_componentTable["x_image_left"]:setVisible(false)
--			self.m_componentTable["x_image_right"]:setVisible(false)
--			self.m_componentTable["ss_dj_yuanbao_yuanjia"]:setVisible(false)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] onExitTransitionStart
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] onCleanup
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_shangcheng_sell_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_shangcheng_sell_item:initAllComponent()
	local buy = function()
		self.m_buy(self)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["ss_dj_goumai_button"]:addHandleOfcomponentEvent(buy,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
end



