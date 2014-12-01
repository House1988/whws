require("scripts.auto.auto_huangzi_ssf_niangniangka")
--[[--
    教育皇子 的美女卡牌
--]]--
f_huangzi_education_beauty_card = class("f_huangzi_education_beauty_card")
f_huangzi_education_beauty_card.__index = f_huangzi_education_beauty_card

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card.static_create()
	local beauty_cardTable = createhuangzi_ssf_niangniangka()
	local beauty_card = beauty_cardTable["huangzi_ssf_niangniangka"]
	
	local funTable = {}
	tolua.setpeer(beauty_card, funTable)

	setmetatable(funTable, f_huangzi_education_beauty_card)
	
	beauty_card.m_componentTable = beauty_cardTable
	   
	return beauty_card  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_data = nil
	self.m_index = 0
	self.m_btnSelectCallBack = nil
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] registerNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:registerNodeEvent(handler)
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
-- @function [parent=#f_huangzi_education_beauty_card] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] onEnter
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:onEnter()

	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] onExit
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:onExit()  
  	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] onExitTransitionStart
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] onCleanup
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:initAllComponent()
	local btnSelect = function()
		self.m_btnSelectCallBack(self)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["hz_nnk_jiaoyu_button"]:addHandleOfcomponentEvent(btnSelect,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] getData
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:getData()
	return self.m_data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] setData
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then
		self.m_componentTable["hz_nnk_eniang_imag"]:setVisible(false)
		--beauty name
		local beautyName = g_game.g_dictConfigManager:getBeautiName(data["beautyId"])
		self.m_componentTable["hz_nnk_name_label"]:setString(beautyName)
		--beauty image
		local cardResource = g_game.g_dictConfigManager:getBeautyResource(data["beautyId"])
		local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
		self.m_componentTable["hz_nnk_card_image"]:setImage(resourceImage)
		self.m_componentTable["hz_nnk_card_image"]:setSize(cc.size(90,90))
		--beauty quality
		local quality = g_game.g_dictConfigManager:getBeautyQuality(data["beautyId"])
		self.m_componentTable["hz_nnk_card_head_pinzhi_image"]:setImage(g_game.g_f_quality_image[quality])
		self.m_componentTable["hz_nnk_card_head_pinzhi_image"]:setSize(cc.size(104,104))
		--beauty education num
		
		self.m_componentTable["hz_nnk_xueshi_num_label"]:setString(data["beautyEducation"])
		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] setPrinceMotherId
-- 设置皇子母亲的id
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:setPrinceMotherId(beautyId)
	if self.m_data["id"] == beautyId then
		self.m_componentTable["hz_nnk_eniang_imag"]:setVisible(true)
	else
		self.m_componentTable["hz_nnk_eniang_imag"]:setVisible(false)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] educationBtnSelectCallBack
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:educationBtnSelectCallBack(callback)
	self.m_btnSelectCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] setIndex
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:setIndex(index)
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_card] getIndex
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_card:getIndex()
	return self.m_index
end



