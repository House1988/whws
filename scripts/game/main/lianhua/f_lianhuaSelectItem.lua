--[[
	继承自container panel, 用于显示邮件列表
]]--

require("scripts.auto.auto_lianhuaSelectItem")

local f_lianhuaSelectItem = class("f_lianhuaSelectItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_lianhuaSelectItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_lianhuaSelectItem:ctor()    
    self:registerNodeEvent()   
    	
	self:setSize(cc.size(169, 238))
	
	local item = createlianhuaSelectItem()
	self.m_item = item["lianhuaSelectItem"]	
	self.m_componentTable = item
	self:appendComponent(self.m_item)
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(84.5, 119))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_lianhuaSelectItem:onEnter() 
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
			if self.m_callback ~= nil then
				self.m_callback(self)
			end
			self.m_isClick = false
		end
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end


function f_lianhuaSelectItem:onExit()    
    self:unregisterNodeEvent()
    if self.m_remove ~= nil then
    	self.m_remove(self)
 	end
end

function f_lianhuaSelectItem:onEnterTransitionFinish()
end

function f_lianhuaSelectItem:onExitTransitionStart()
end

function f_lianhuaSelectItem:onCleanup()
end


function f_lianhuaSelectItem:registerNodeEvent(handler)
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

function f_lianhuaSelectItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lianhuaSelectItem] setData
-- 设置邮件附件信息
-- 1 名臣 2 美女 3装备
-------------------------------------------------------------------------------
function f_lianhuaSelectItem:setData(data, type, callback)

	self.m_type = type
	self.m_data = data
	self.m_callback = callback
	
	local id = 0
	local level = 0
	local t = 0
	if type == 1 then
		id = data["officerId"]
		t = 3
		level = data["officerLevel"]
	elseif type == 2 then
		id = data["beautyId"]
		t = 2
		level = data["beautyLevel"]
	elseif type == 3 then
		id = data["equip_id"]
		t = 6
		level = data["equip_level"]
	end
	
	local imagePath, q, name = g_game.g_dictConfigManager:getResByType(t, id)

	self.m_componentTable["gd_card_touxiang_image"]:setImage(imagePath)
	self.m_componentTable["gd_card_touxiang_image"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
	self.m_componentTable["gd_card_name_label"]:setString(name)
	self.m_componentTable["gd_card_lv_label"]:setString("LV" .. level)
	self.m_componentTable["gd_card_touxiangkuang_image"]:setImage(g_game.g_f_quality_image[q])
	
	for i = 1, 5 do
		self.m_componentTable["gd_card_star" .. i .. "_image"]:setVisible(i <= q)
	end
end

function f_lianhuaSelectItem:setRemove(callback)
	self.m_remove = callback
end

function f_lianhuaSelectItem:setIndex(index)
	self.m_index = index
end

function f_lianhuaSelectItem:getIndex()
	return self.m_index
end

function f_lianhuaSelectItem:isSelect()
	return self.m_componentTable["gd_card_xuanzhong_image"]:isVisible()
end

function f_lianhuaSelectItem:setSelect(select)
	self.m_componentTable["gd_card_xuanzhong_image"]:setVisible(select)
end

return f_lianhuaSelectItem