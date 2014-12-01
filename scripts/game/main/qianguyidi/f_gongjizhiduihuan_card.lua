require("scripts.auto.auto_qgyd_gjzdh_card")
require("scripts.game.main.common.f_common_floating_notice")

--[[--
     功绩值兑换卡
--]]--
f_gongjizhiduihuan_card = class("f_gongjizhiduihuan_card")
f_gongjizhiduihuan_card.__index = f_gongjizhiduihuan_card

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card.static_create()
	local gongjizhiduihuan_card_table = createqgyd_gjzdh_card()
	local gongjizhiduihuan_card_panel = gongjizhiduihuan_card_table["qgyd_gjzdh_card"]
	
	local funTable = {}
	tolua.setpeer(gongjizhiduihuan_card_panel, funTable)

	setmetatable(funTable, f_gongjizhiduihuan_card)
	
	gongjizhiduihuan_card_panel.m_componentTable = gongjizhiduihuan_card_table
	   
	return gongjizhiduihuan_card_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.DAOJU_TYPE = 1
	self.ZHUANGBEI_TYPE = 2		
	
	self.m_index = 0 --记录在本卡列表中的索引
	self.m_data = nil
	self.m_duihuan_button_callback = nil
	self.m_duihuan_remove_callback = nil
	
	--白绿蓝紫橙 对应 12345星级
	self.m_qualityRect = {}
    self.m_qualityRect[1] = "batch_ui/baipinzhi_kuang.png"
    self.m_qualityRect[2] = "batch_ui/lvpinzhi_kuang.png"
    self.m_qualityRect[3] = "batch_ui/lanpinzhi_kuang.png"
    self.m_qualityRect[4] = "batch_ui/zipinzhi_kuang.png"
    self.m_qualityRect[5] = "batch_ui/chengpinzhi_kuang.png"
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:registerNodeEvent(handler)
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
-- @function [parent=#f_gongjizhiduihuan_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] onEnter
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] onExit
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:onExit()  
  	if self.m_duihuan_remove_callback ~= nil then
		self.m_duihuan_remove_callback(self)
	end
	
  	self:unregisterNodeEvent()
  	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] setCardDuihuanCallback
-- 设置兑换按钮点击的回调
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:setCardDuihuanCallback(removeCallback)
	self.m_duihuan_button_callback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] setCardRemoveFromListCallback
-- 设置物品卡数据从列表中移除的回调
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:setCardRemoveFromListCallback(removeCallback)
	self.m_duihuan_remove_callback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] onCleanup
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] setIndex
-- 设置在列表中的索引
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] getIndex
-- 获取在列表中的索引
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:getIndex()
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:initAllComponent()
	--点击兑换按钮
	local duihuanClick = function()
		self:duihuanClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["gjzdh_duihuan_button"]:addHandleOfcomponentEvent(duihuanClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] duihuanClick
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:duihuanClick()
	if self.m_duihuan_button_callback ~= nil then
		self.m_duihuan_button_callback(self)
	end 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] getData
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] setData
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:setData2(type, id, des, price, num, hasBuy, coinText)
	self.m_isGongji = false
	self.m_id = id
	self.m_componentTable["gjzdh_gongjizhi_label"]:setString(coinText)
	self.m_componentTable["gjzdh_shuoming_label"]:setString(des)		
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(type, id)
	self.m_componentTable["gjzdh_pingzhi"]:setImage(self.m_qualityRect[q])	
	self.m_componentTable["gjzdh_wuping_image"]:setImage(imagePath)
	self.m_componentTable["gjzdh_wuping_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	self.m_componentTable["gjzdh_wupin_label"]:setString(name)
	self.m_componentTable["gjzdh_gongjizhi_num_label"]:setString(price .. "")	
	self.m_componentTable["number"]:setString("x" .. num)
	
	if type == 10 or type == 11 then
		self.m_componentTable["piece"]:setVisible(true)
		self.m_componentTable["piece"]:setImage("batch_ui/hunpi_biaozhi.png")
	elseif type == 12 or type == 13 then
		self.m_componentTable["piece"]:setVisible(true)
		self.m_componentTable["piece"]:setImage("batch_ui/suipian_junjichu.png")
	else
		self.m_componentTable["piece"]:setVisible(false)
	end
	
	local clickEquip = function()
		require("scripts.game.main.equipBag.f_equipDetial_panel")
		local panel = f_equipDetial_panel.static_create()
		local data = g_game.g_utilManager:fakeEquipment(self.m_id)
		panel:panelInitBeforePopup(data, false)
		g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
	end
	
	local clickEquipSuipian = function()
		require("scripts.game.main.equipBag.f_equipDetial_panel")
		local panel = f_equipDetial_panel.static_create()
		local data = g_game.g_utilManager:fakeEquipment(g_game.g_dictConfigManager:getPieceCardID(self.m_id))
		panel:panelInitBeforePopup(data, false)
		g_game.g_panelManager:showUiPanel(panel, "equip_detial_panel")
	end
	
	local clickMeinv = function()
		require("scripts.game.main.beauty.f_game_beauty_card_detail")
		local detailPanel = f_game_beauty_card_detail.static_create()
		detailPanel:panelInitBeforePopup()
		detailPanel:setStopTouchEvent(true)
		g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
		local beauty = require("scripts.game.main.suipian.f_fake_beauty").new()
		beauty:setData(self.m_id)
		detailPanel:setDetail(beauty)
	end
	
	local clickMeinvSuipian = function()
		require("scripts.game.main.beauty.f_game_beauty_card_detail")
		local detailPanel = f_game_beauty_card_detail.static_create()
		detailPanel:panelInitBeforePopup()
		detailPanel:setStopTouchEvent(true)
		g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
		local beauty = require("scripts.game.main.suipian.f_fake_beauty").new()
		beauty:setData(g_game.g_dictConfigManager:getPieceCardID(self.m_id))
		detailPanel:setDetail(beauty)
	end
	
	local clickMingchenSuipian = function()
		require("scripts.game.main.card.f_card_mingchen_detail")
		local detailPanel = f_card_mingchen_detail.static_create()
		detailPanel:panelInitBeforePopup()
		local data = g_game.g_utilManager:fakeMingChenData(g_game.g_dictConfigManager:getPieceCardID(self.m_id))
		detailPanel:setDetail(data)
		g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")

	end
	
	local clickMingchen = function()
		require("scripts.game.main.card.f_card_mingchen_detail")
		local detailPanel = f_card_mingchen_detail.static_create()
		detailPanel:panelInitBeforePopup()
		local data = g_game.g_utilManager:fakeMingChenData(self.m_id)
		detailPanel:setDetail(data)
		g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")

	end
	
	self.m_componentTable["gjzdh_duihuan_button"]:setVisible(not hasBuy)
	self.m_componentTable["duihuan"]:setVisible(hasBuy)
	
	if type == 2 then	
		self.m_componentTable["detialBtn"]:addHandleOfcomponentEvent(clickMeinv,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	elseif type == 3 then
		self.m_componentTable["detialBtn"]:addHandleOfcomponentEvent(clickMingchen,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	elseif type == 6 then
		self.m_componentTable["detialBtn"]:addHandleOfcomponentEvent(clickEquip,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	elseif type == 10 then
		self.m_componentTable["detialBtn"]:addHandleOfcomponentEvent(clickMingchenSuipian,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	elseif type == 11 then
		self.m_componentTable["detialBtn"]:addHandleOfcomponentEvent(clickMeinvSuipian,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	elseif type == 12 or type == 13 then
		self.m_componentTable["detialBtn"]:addHandleOfcomponentEvent(clickEquipSuipian,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_gongjizhiduihuan_card] setData
-------------------------------------------------------------------------------
function f_gongjizhiduihuan_card:setData(data)
	self.m_data = data	
	self.m_isGongji = true
	local wupin_id = data[3]
	local wupin_info = nil
	self.m_componentTable["piece"]:setVisible(false)
	self.m_componentTable["number"]:setVisible(false)
	if self.m_data ~= nil then	
		if self.m_data[2] == self.DAOJU_TYPE then
			wupin_info = g_game.g_dictConfigManager:getPropById(wupin_id)
			local nameText = g_game.g_dictConfigManager:getLanTextById(wupin_info[2])
			self.m_componentTable["gjzdh_wupin_label"]:setString(nameText)
			self.m_componentTable["gjzdh_pingzhi"]:setImage(self.m_qualityRect[wupin_info[9]])
			self.m_componentTable["gjzdh_wuping_image"]:setImage("item/" .. wupin_info[10] .. ".png")
			local desText = g_game.g_dictConfigManager:getLanTextById(wupin_info[7])
			self.m_componentTable["gjzdh_shuoming_label"]:setString(desText)						
		elseif self.m_data[2] == self.ZHUANGBEI_TYPE then
			--wupin_info = g_game.g_dictConfigManager:getEquipById(wupin_id)
		end
		self.m_componentTable["gjzdh_gongjizhi_num_label"]:setString(self.m_data[4])	
	end	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["gjzdh_gongjizhi_label"]:setString("功績值")
	else
		self.m_componentTable["gjzdh_gongjizhi_label"]:setString("功绩值")
	end
end