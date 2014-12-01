require("scripts.auto.auto_vip_xiangqing")

--[[--
     vip详情
--]]--
f_vip_detail = class("f_vip_detail")
f_vip_detail.__index = f_vip_detail

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_vip_detail.static_create()
	local vip_detail_table = createvip_xiangqing()
	local vip_detail_panel = vip_detail_table["vip_xiangqing"]
	
	local funTable = {}
	tolua.setpeer(vip_detail_panel, funTable)
	setmetatable(funTable, f_vip_detail)
	
	vip_detail_panel.m_componentTable = vip_detail_table	   
	return vip_detail_panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_vip_detail:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_index = 0
	self.m_data = nil
	self.m_vipNumLeft = nil
	self.m_vipNumRight = nil
	self.m_vip_remove_callback = nil
	
	--添加用户当前vip等级的label
	self.m_vipNumLeft = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(self.m_vipNumLeft)	
	self.m_vipNumLeft:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_vipNumLeft:setPositionInContainer(cc.p(196, 33))
	self.m_vipNumLeft:setAlignment(1)
	self.m_vipNumLeft:setTextWithInt(15)
	--添加用户下一级vip等级的label
	self.m_vipNumRight = fc.FAnimationLabel:create("", g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
	self:appendComponent(self.m_vipNumRight)	
	self.m_vipNumRight:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_vipNumRight:setPositionInContainer(cc.p(649, 33))
	self.m_vipNumRight:setAlignment(1)
	self.m_vipNumRight:setTextWithInt(15)
	self.m_handler = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] registerNodeEvent
-------------------------------------------------------------------------------
function f_vip_detail:registerNodeEvent(handler)
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
-- @function [parent=#f_vip_detail] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_vip_detail:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] onEnter
-------------------------------------------------------------------------------
function f_vip_detail:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] onExit
-------------------------------------------------------------------------------
function f_vip_detail:onExit()
  	self:unregisterNodeEvent()
  	if self.m_vip_remove_callback then
  		self.m_vip_remove_callback(self.m_index)
  	end
  	self.m_vip_remove_callback = nil
  	self.m_handler = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_vip_detail:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] onExitTransitionStart
-------------------------------------------------------------------------------
function f_vip_detail:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] onCleanup
-------------------------------------------------------------------------------
function f_vip_detail:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_vip_detail:initAllComponent()

	local buyCallback = function()
		CCLOG("购买vip等级礼包:"..self.m_index)
		if self.m_handler ~= nil then
			self.m_handler(self.m_index)
		end
		g_game.g_userInfoManager:requestGetVipPack(self.m_index)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["vip_xq_goumai_button"]:addHandleOfcomponentEvent(buyCallback,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local checkPacDetail = function()
		require("scripts.game.main.shangcheng.f_vip_package_detail")
		local pacPopup = f_vip_package_detail.static_create()
	    pacPopup:panelInitBeforePopup()
		pacPopup:setPacIndex(self.m_index)
		g_game.g_panelManager:showUiPanel(pacPopup,"vip_detail_pac")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["vip_xq_chakan_button"]:addHandleOfcomponentEvent(checkPacDetail,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] setIndex
-- 设置该页的索引
-------------------------------------------------------------------------------
function f_vip_detail:setIndex(index)
	self.m_index = index 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] getIndex
-- 获取在列表中的索引
-------------------------------------------------------------------------------
function f_vip_detail:getIndex()
	return self.m_index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] setData
-- 设置该页的数据
-------------------------------------------------------------------------------
function f_vip_detail:setData(data, hasBuy)	
	--先隐藏 礼品名称
	for i = 1, 10 do
		self.m_componentTable["vip_xq_lipin_name"..i.."_label"]:setVisible(false)
	end
	
	local vipPackInfo = g_game.g_dictConfigManager:getVipPropInfo(self.m_index)
	--原价
	local originPrice = vipPackInfo[5]*5
	self.m_componentTable["vip_xq_libao_yuanjia_num_label"]:setString(originPrice)
	--现价
	self.m_componentTable["vip_xq_libao_jinshou_num_label"]:setString(vipPackInfo[5])
	
	if hasBuy == true then
		self.m_componentTable["vip_xq_goumai_button"]:setButtonState(8)
	else 
		self.m_componentTable["vip_xq_goumai_button"]:setButtonState(2)
	end
	
	if data ~= nil then
		self.m_data = data
		--设置详情描述
		self.m_componentTable["vip_xq_xiangqing_content"]:setAlignment(0)
		self.m_componentTable["vip_xq_xiangqing_content"]:setAnchorPoint(cc.p(0, 1))
		self.m_componentTable["vip_xq_xiangqing_content"]:setPositionInContainer(cc.p(40, 108))
		local nameTxt = g_game.g_dictConfigManager:getLanTextById(self.m_data[14])
		self.m_componentTable["vip_xq_xiangqing_content"]:setString(nameTxt)
		--设置需要累计充的元宝数
		self.m_componentTable["vip_xq_xuyao_num_label"]:setString(self.m_data[3])
		--设置vip等级
		self.m_vipNumLeft:setTextWithInt(self.m_index)
		self.m_vipNumRight:setTextWithInt(self.m_index)
		
		local getVipRewardInfo = g_game.g_dictConfigManager:getVipRewardByViplv(self.m_index)
		for i = 1, #getVipRewardInfo do
			local itemName = self:getItemNameByType(getVipRewardInfo[i][3],getVipRewardInfo[i][4])
			self.m_componentTable["vip_xq_lipin_name"..i.."_label"]:setVisible(true)
			self.m_componentTable["vip_xq_lipin_name"..i.."_label"]:setAlignment(0)
			if getVipRewardInfo[i][3] ~= 4 and getVipRewardInfo[i][3] ~= 7 and getVipRewardInfo[i][3] ~= 5 then
				self.m_componentTable["vip_xq_lipin_name"..i.."_label"]:setString(itemName.."x"..getVipRewardInfo[i][5])			
			else
				self.m_componentTable["vip_xq_lipin_name"..i.."_label"]:setString(itemName.."x"..getVipRewardInfo[i][5])
			end
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] getItemNameByType
-------------------------------------------------------------------------------
function f_vip_detail:getItemNameByType(type,id)
	local name = nil
	if type == 1 then --道具
		name = g_game.g_dictConfigManager:getItemName(id)
	elseif type == 2 then -- 美女
		name = g_game.g_dictConfigManager:getBeautiName(id)
	elseif type == 3 then --名臣
		name = g_game.g_dictConfigManager:getCardName(id)
	elseif type == 4  then --元宝/vip元宝
		if LANGUAGE_TYPE == 3 then
			name = "元寶"
		else
			name = "元宝"
		end
	elseif type == 5 then--银两
		if LANGUAGE_TYPE == 3 then
			name = "銀兩"
		else
			name = "银两"
		end
		
	elseif type == 6 then--装备
		name = g_game.g_dictConfigManager:getEquipName(id)
	elseif type == 7 then
		if LANGUAGE_TYPE == 3 then
			name = "vip元寶"
		else
			name = "vip元宝"
		end
		
	elseif type == 8 then
		if LANGUAGE_TYPE == 3 then
			name = "功績值"
		else
			name = "功绩值"
		end
		
	elseif type == 9 or  type == 10 or type == 11 or type == 12 or type == 13 then
		name = g_game.g_dictConfigManager:getPieceName(id)
	end
	return name
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] setVipItemRemoveFromListCallback
-- 设置该页的数据
-------------------------------------------------------------------------------
function f_vip_detail:setVipItemRemoveFromListCallback(removeCallback)
	self.m_vip_remove_callback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] setFuncHandler
-------------------------------------------------------------------------------
function f_vip_detail:setFuncHandler(handler)
	self.m_handler = handler
end

-------------------------------------------------------------------------------
-- @function [parent=#f_vip_detail] setButtonState
-------------------------------------------------------------------------------
function f_vip_detail:setButtonState(state)
	self.m_componentTable["vip_xq_goumai_button"]:setButtonState(state)
end
