
local f_game_beauty_sons_head = class("f_game_beauty_sons_head", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_sons_head")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:ctor()
    
    self:registerNodeEvent()   
    
    self.m_icon_image	= nil
    self.m_hight_light 	= nil
    self.m_quality_image = nil
    
    self.m_data				= nil
        
    self.m_isSelect			= false
    self.m_isClick = false
    --选中索引
    self.m_selectIndexInList = nil
    self.m_cardEventCallBack = nil
	
    self.m_quality_image = fc.FExtensionsImage:create()
    self.m_icon_image	= fc.FExtensionsImage:create()
    self.m_hight_light 	= fc.FExtensionsImage:create()
    self.m_level_label = fc.FLabel:createBMFont()
    self.m_level_bg = fc.FExtensionsImage:create()
    
    self:appendComponent(self.m_quality_image)
    self:appendComponent(self.m_icon_image)
    self:appendComponent(self.m_level_bg)
    self:appendComponent(self.m_level_label)
    self:appendComponent(self.m_hight_light)
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:onEnter()   
	
	--注册touch回调函数
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
    
    self.m_hight_light:setImage("batch_ui/xuanzhongkuang.png")
    self.m_hight_light:setSize(cc.size(124, 124))
    self.m_hight_light:setPositionInContainer(cc.p(51, 51))
    self.m_level_label:setSize(cc.size(29, 34))
    self.m_level_label:setColor(cc.c3b(255, 255, 255))
    self.m_level_label:setPositionInContainer(cc.p(85.5, 83))
    self.m_level_bg:setPositionInContainer(cc.p(85.5, 83))
    
    self.m_quality_image:setPositionInContainer(cc.p(51,51))
    self.m_icon_image:setPositionInContainer(cc.p(51, 51))
    
	self.m_hight_light:setVisible(false)
end


function f_game_beauty_sons_head:onExit()    
    self:unregisterNodeEvent()
end

function f_game_beauty_sons_head:onEnterTransitionFinish()
end

function f_game_beauty_sons_head:onExitTransitionStart()
end

function f_game_beauty_sons_head:onCleanup()
end


function f_game_beauty_sons_head:registerNodeEvent(handler)
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

function f_game_beauty_sons_head:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] setData
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:setData(data)
	self.m_data = data
	
	if self.m_data ~= nil then
		local resource = g_game.g_dictConfigManager:getPrinceImage(self.m_data["princeStar"], self.m_data["princeResource"], self.m_data["princeLevel"])
		local princeImage = g_game.g_resourceManager:getPrinceHeadImage(resource)
		
		self.m_icon_image:setImage(princeImage)
		self.m_icon_image:setExtensionsTextureRect(cc.rect(0,0,90,90))
		self.m_icon_image:setSize(cc.size(90, 90))

		self.m_level_label:setString(self.m_data["princeLevel"].. "")
		self.m_quality_image:setImage(g_game.g_f_quality_image[self.m_data["princeStar"]])
		self.m_quality_image:setSize(cc.size(102,102))
		
		self.m_level_bg:setImage(g_game.g_f_quality_corner[self.m_data["princeStar"]])
		self.m_level_bg:setSize(cc.size(29, 34))
	
	end
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] getData
-- 返回数据
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] setSelectIndex
-- 设置选中索引
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:setSelectIndex(index)
	self.m_selectIndexInList = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] getIndexInList
-- 返回选中索引
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:getIndexInList()
	return self.m_selectIndexInList
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] setCardEventCallBack
-- 设置监听
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:setCardEventCallBack(cardEventCallBack)
     self.m_cardEventCallBack = cardEventCallBack
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_sons_head] setSelect
-- 设置是否选中
-------------------------------------------------------------------------------
function f_game_beauty_sons_head:setSelect(isSelect)
	self.m_isSelect = isSelect
	
	if self.m_isSelect then
		self.m_cardEventCallBack(self)
	end
end


return f_game_beauty_sons_head