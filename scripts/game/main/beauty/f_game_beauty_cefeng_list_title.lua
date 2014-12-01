require("scripts.auto.auto_hougong_cefeng_card")
--[[--
	美女title 卡牌
--]]--
f_game_beauty_cefeng_list_title = class("f_game_beauty_cefeng_list_title")
f_game_beauty_cefeng_list_title.__index = f_game_beauty_cefeng_list_title

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title.static_create()
	local cefeng_cardTable = createhougong_cefeng_card()
	local cefeng_cardPanel = cefeng_cardTable["hougong_cefeng_card"]

	local funTable = {}
	tolua.setpeer(cefeng_cardPanel, funTable)
	setmetatable(funTable, f_game_beauty_cefeng_list_title)

	cefeng_cardPanel.m_componentTable = cefeng_cardTable

	return cefeng_cardPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] setTargetBeautyData
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:setTargetBeautyData(data)
	self.m_data = data
	
	local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
	self.m_beautyQinmidu = data["beautyIntimacy"]
	
	local curTitleNeedSilver = g_game.g_dictConfigManager:getTitleCostSilver(self.m_beautyTitleIndex)
	local curTitleNeedQinmidu  = g_game.g_dictConfigManager:getTitleQinmidu(self.m_beautyTitleIndex)
	
	self.m_componentTable["effect_num"]:setString(g_game.g_dictConfigManager:getTitlePrincessAddition(self.m_beautyTitleIndex) .. "%")
	if data["beautyTitle"] ~= 0 and data["beautyTitle"] < self.m_beautyTitleIndex  then
		self.m_componentTable["hg_cf_card_dangqian_image"]:setVisible(false)
		self.m_componentTable["hg_cf_cefeng_button"]:setVisible(false)
	elseif data["beautyTitle"] == self.m_beautyTitleIndex  then
		self.m_componentTable["hg_cf_card_dangqian_image"]:setVisible(true)
		self.m_componentTable["hg_cf_cefeng_button"]:setVisible(false)
	else
		--条件不足
		if userSilver < curTitleNeedSilver or self.m_beautyQinmidu <curTitleNeedQinmidu then
			self.m_componentTable["hg_cf_card_tiaojian_image"]:setVisible(true)
--			self.m_componentTable["hg_cf_cefeng_button"]:setVisible(false)
		else
			self.m_componentTable["hg_cf_card_tiaojian_image"]:setVisible(false)
		end
	
		local titleLimit = g_game.g_dictConfigManager:getTitleLimit(self.m_beautyTitleIndex)
		local groupBeauty = g_game.g_userInfoManager:getTitleGroupBeauty(self.m_beautyTitleIndex)
		local groupNum = #groupBeauty
		
		if groupNum == titleLimit and titleLimit ~= 0 then
			self.m_componentTable["hg_cf_card_renyuan_image"]:setVisible(true)
--			self.m_componentTable["hg_cf_cefeng_button"]:setVisible(false)
		else
			self.m_componentTable["hg_cf_card_renyuan_image"]:setVisible(false)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:panelInitBeforePopup()
	self.m_clickCallback = nil
	self.m_cefengCallBack = nil

	self.m_isClick = false
	self.m_isSelect = false
	self.m_beautyTitleIndex = 0
	self.m_data = nil
	
	self.m_beautyQinmidu = 0
	
	self.m_isInPosition = false
	
	self.tableShanzi = {}
	self.tableShanzi[1] = "batch_ui/cheng_kunninggong.png"
	self.tableShanzi[2] = "batch_ui/zi_kunninggong.png"
	self.tableShanzi[3] = "batch_ui/zi_kunninggong.png"
	self.tableShanzi[4] = "batch_ui/lan_kunninggong.png"
	self.tableShanzi[5] = "batch_ui/lan_kunninggong.png"
	self.tableShanzi[6] = "batch_ui/lv_kunninggong.png"
	self.tableShanzi[7] = "batch_ui/lv_kunninggong.png"
	self.tableShanzi[8] = "batch_ui/bai_kunninggong.png"
	
--	self.tableTitle = {}
--	self.tableTitle[1] = "batch_ui/huanghou_zhiwei.png"
--	self.tableTitle[2] = "batch_ui/huangguifei.png"
--	self.tableTitle[3] = "batch_ui/guifei_zhiwei.png"
--	self.tableTitle[4] = "batch_ui/fei_zhiwei.png"
--	self.tableTitle[5] = "batch_ui/pin_zhiwei.png"
--	self.tableTitle[6] = "batch_ui/guiren_zhiwei.png"
--	self.tableTitle[7] = "batch_ui/changzai_zhiwei.png"
--	self.tableTitle[8] = "batch_ui/daying_zhiwei.png"
	
	self:registerNodeEvent()
end

function f_game_beauty_cefeng_list_title:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		self.m_clickCallback(self)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] setBeautyClickCallback
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:setClickCallback(callBack)
	self.m_clickCallback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_cefeng_list_title] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] onExit
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:initAllComponent()
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
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_isClick == true then
			self:setSelect(true)
			self.m_isClick = false
		end
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local cefengCallBack = function()
		local curTitleNeedQinmidu  = g_game.g_dictConfigManager:getTitleQinmidu(self.m_beautyTitleIndex)
		if self.m_beautyQinmidu < curTitleNeedQinmidu then
			local panel = f_jump_tip_popup.static_create()
			panel:setPanelByType(15)
			local leftBtnCallback = function()
				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			end
			local rightBtnCallback = function()
				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
				local meinvAwardPanel = g_game.g_panelManager:getUiPanel("meinv_award_ui")
				if meinvAwardPanel == nil then
					meinvAwardPanel = f_game_beauty_award_panel.static_create()
					g_game.g_panelManager:showUiPanel(meinvAwardPanel,"meinv_award_ui")
				end
				-- 美女数据
				if self.m_data ~= nil then
					meinvAwardPanel:showAwardPanel(self.m_data)
				end
			end
			panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
			g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
			return
		end
		
		local userSilver = g_game.g_userInfoManager:getUserInfo()["silver"]
		local curTitleNeedSilver = g_game.g_dictConfigManager:getTitleCostSilver(self.m_beautyTitleIndex)
		if userSilver < curTitleNeedSilver then
			require("scripts.game.main.common.f_less_silver_tip_popup")
			local panel = f_less_silver_tip_popup.static_create()
			g_game.g_panelManager:showUiPanel(panel, "less_silver_tip_popup")
			return
		end
		
		self.m_cefengCallBack(self.m_beautyTitleIndex)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hg_cf_cefeng_button"]:addHandleOfcomponentEvent(cefengCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] getTitleIndex
-- 获得title index
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:getTitleIndex()
	return self.m_beautyTitleIndex
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] setTitleIndex
-- 设置title index
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:setTitleIndex(index)
	self.m_beautyTitleIndex = index
	
	self.m_componentTable["hg_cf_shanzi_image"]:setImage(self.tableShanzi[self.m_beautyTitleIndex])
--	self.m_componentTable["hg_cf_name_image"]:setImage(self.tableTitle[self.m_beautyTitleIndex])
	local t = g_game.g_cefeng_words[index]
	for i = 1, 5 do
		self.m_componentTable["zi" .. i]:setVisible(false)
	end
	if #t == 1 then
		self.m_componentTable["zi2"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_componentTable["zi2"]:setVisible(true)
	elseif #t == 2 then
		self.m_componentTable["zi4"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_componentTable["zi4"]:setVisible(true)
		self.m_componentTable["zi5"]:setImage("batch_ui/" .. t[2] .. ".png")
		self.m_componentTable["zi5"]:setVisible(true)
	else
		self.m_componentTable["zi1"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_componentTable["zi1"]:setVisible(true)
		self.m_componentTable["zi2"]:setImage("batch_ui/" .. t[2] .. ".png")
		self.m_componentTable["zi2"]:setVisible(true)
		self.m_componentTable["zi3"]:setImage("batch_ui/" .. t[3] .. ".png")
		self.m_componentTable["zi3"]:setVisible(true)
	end
	
	local qinmidu = g_game.g_dictConfigManager:getTitleQinmidu(self.m_beautyTitleIndex)
	self.m_componentTable["hg_cf_qinmidu_num_label"]:setString(qinmidu)
	
	local silver = g_game.g_dictConfigManager:getTitleCostSilver(self.m_beautyTitleIndex)
	self.m_componentTable["hg_cf_yinliang_num_label"]:setString(silver)
	
	--条件不足
	self.m_componentTable["hg_cf_card_tiaojian_image"]:setVisible(false)
	--已在位
	self.m_componentTable["hg_cf_card_dangqian_image"]:setVisible(false)
	--人员已满
	self.m_componentTable["hg_cf_card_renyuan_image"]:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] setData
--  设置beauty内容
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:setData(data)
	self.m_data = data
	self:updateBeautyData()
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] getData
--  title内容
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] updateBeautyData
-- 更新 title 内容
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:updateBeautyData()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng_list_title] setCefengCallback
-- 设置册封button的回调
-------------------------------------------------------------------------------
function f_game_beauty_cefeng_list_title:setCefengCallback(callback)
	self.m_cefengCallBack = callback
end

