--[[
	继承自container panel, 用于显示碎片列表
]]--

require("scripts.auto.auto_BingfaCard")
require("scripts.auto.auto_BingfaSelectCard")

local f_bingfa_card = class("f_bingfa_card", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_bingfa_card")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_bingfa_card:ctor()    
    self:registerNodeEvent()   
    
	self.m_data = nil
	self.m_index = 0

	self.m_remove_callback = nil
	self.m_item_select_callback = nil
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_bingfa_card:onEnter() 

end

function f_bingfa_card:isSelect(isSelect)
	self.m_isSelect = isSelect
end


function f_bingfa_card:onExit()   
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self)
	end 
    self:unregisterNodeEvent()
end

function f_bingfa_card:onEnterTransitionFinish()
end

function f_bingfa_card:onExitTransitionStart()
end

function f_bingfa_card:onCleanup()
end


function f_bingfa_card:registerNodeEvent(handler)
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

function f_bingfa_card:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] setSelect
-- 设置选中状态
-------------------------------------------------------------------------------
function f_bingfa_card:setSelect(isSelect)	
	if self.m_isSelect then
		self.m_componentTable["sj_card_duigou"]:setVisible(isSelect)
	else
		self.m_componentTable["cardhightlight"]:setVisible(isSelect)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] isSelect
-- 设置选中状态
-------------------------------------------------------------------------------
function f_bingfa_card:isSelected()	
	if self.m_isSelect then
		return self.m_componentTable["sj_card_duigou"]:isVisible()
	else
		return self.m_componentTable["cardhightlight"]:isVisible()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_bingfa_card:initAllComponent()	
	if self.m_isSelect then
		self:setSize(cc.size(155,204))
		local gonggaoItemTable = createBingfaSelectCard()
		self.m_item = gonggaoItemTable["BingfaSelectCard"]	
		self.m_componentTable = gonggaoItemTable
		self:appendComponent(self.m_item)
		self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
		self.m_item:setPositionInContainer(cc.p(77.5, 102))
	else
		self:setSize(cc.size(195,248))
		local gonggaoItemTable = createBingfaCard()
		self.m_item = gonggaoItemTable["BingfaCard"]	
		self.m_componentTable = gonggaoItemTable
		self:appendComponent(self.m_item)
		self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
		self.m_item:setPositionInContainer(cc.p(97.5, 124))
	end
	
	
	
	
	--注册touch回调函数
	local downCallback = function()	
		self.m_isClick = true
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DOWN )
	local downCallback = function()		
		self.m_isClick = false
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_INSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_OUTSIDE )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_ENTER )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_DRAG_EXIT )
	local downCallback = function()			
		self.m_isClick = false
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPOUTSIDE )
	
	
	local downCallback = function()		
		if self.m_isClick == true then
			self:itemClick()			
			self.m_isClick = false
		end	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_item:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end


-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] setData
-- 设置公告信息
-------------------------------------------------------------------------------
function f_bingfa_card:setData(data, index)	
	self.m_data = data
	self.m_index = index
	self:initAllComponent()
	self:display()	
end

function f_bingfa_card:display()
	local data = self.m_data
	local id = data["equip_id"]
	local star = g_game.g_dictConfigManager:getEquipStar(id)
	for i = 1, 5 do
		if i <= star then
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing.png")
		else
			self.m_componentTable["star" .. i]:setImage("batch_ui/xingxing_dark.png")
		end
	end
	self.m_componentTable["cardframe"]:setImage(g_game.g_f_quality_image[star])
	self.m_componentTable["sj_card_name_label"]:setString(g_game.g_dictConfigManager:getEquipName(id))
	self.m_componentTable["cardImage"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	self.m_componentTable["cardImage"]:setImage(g_game.g_resourceManager:getItemImage(g_game.g_dictConfigManager:getEquipImage(id)))
	
	self.m_componentTable["lv_num_label"]:setString(data["equip_level"])
	
	if self.m_isSelect then
		self.m_componentTable["sj_card_duigou"]:setVisible(false)
	else
		local att = g_game.g_dictConfigManager:getWeaponAddition(id, data["equip_level"])
		local def = g_game.g_dictConfigManager:getArmorAddition(id, data["equip_level"])
		self.m_componentTable["flabel_attack_num"]:setString(string.format("%.1f",att) .. "%")
		self.m_componentTable["flabel_defense_num"]:setString(string.format("%.1f", def) .. "%")
--		self.m_componentTable["cardhightlight"]:setVisible(false)
	end
--	self:setSelect(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] setItemSelectClick
-- 设置公告选择回调
-------------------------------------------------------------------------------
function f_bingfa_card:setItemSelectClick(callback)
	self.m_item_select_callback = callback
end

function f_bingfa_card:setRemoveCallback(callBack)
	self.m_remove_callback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_bingfa_card] itemClick
-- 公告条目选择
-------------------------------------------------------------------------------
function f_bingfa_card:itemClick()	
	if self.m_item_select_callback then
		self.m_item_select_callback(self)
	end
end

return f_bingfa_card