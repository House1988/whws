--[[
	继承自container panel，显示美女头像多种状态
]]--

local f_game_beauty_cheer_head = class("f_game_beauty_cheer_head", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_cheer_head")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] cloneCardHead
-- 用于新手指引，复制对象
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:cloneCardHead(cardHead)
	self.m_currentState = self.STATE_EMPTY_STATE
    self.m_data				= nil
        
    self.m_isSelect			= false
    self.m_isBlock			= false
	self:setSize(cc.size(102, 102))
	
	self:updateState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:ctor()
    
    self:registerNodeEvent()   
    
    self.m_empty_image 	= nil
    self.m_block_image	= nil
    self.m_icon_image	= nil
    self.m_hight_light 	= nil
    self.m_quality_image = nil
    
    
    self.STATE_EMPTY_STATE	= 1
    self.STATE_BLOCK_STATE	= 2
    self.STATE_NORMAL_STATE = 3
    self.STATE_SELECT_STATE	= 4
    
    self.m_currentState		= self.STATE_BLOCK_STATE
    self.m_data				= nil
        
    self.m_isSelect			= false
    self.m_isBlock			= false
    
    self.m_isClick = false
    --选中索引
    self.m_selectIndexInList = nil
    self.m_cardEventCallBack = nil
	
	self.m_add_image = fc.FExtensionsImage:create()
    self.m_add_label = fc.FLabel:createBMFont() 
    
    self.m_empty_image 	= fc.FExtensionsImage:create()    
    self.m_block_image	= fc.FExtensionsImage:create()
    self.m_quality_image = fc.FExtensionsImage:create()
    self.m_icon_image	= fc.FExtensionsImage:create()
    self.m_hight_light 	= fc.FExtensionsImage:create()
    self.m_openNum_label	= fc.FLabel:createBMFont()
    self.m_level_label = fc.FLabel:createBMFont()
    self.m_level_bg = fc.FExtensionsImage:create()
    self.m_openNum_label:setFontSize(20)
    self.m_level_label:setFontSize(20)
    
 
    
    self:appendComponent(self.m_empty_image)
    self:appendComponent(self.m_block_image)
    self:appendComponent(self.m_quality_image)
    self:appendComponent(self.m_icon_image)
    self:appendComponent(self.m_openNum_label)
    self:appendComponent(self.m_level_bg)
    self:appendComponent(self.m_level_label)
    self:appendComponent(self.m_hight_light)
    self:appendComponent(self.m_add_image)
    self:appendComponent(self.m_add_label)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:onEnter()   
	
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
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)	
		if self.m_isClick == true then
			self:setSelect(true)
			self:updateState()	
			self:itemClick()
			self.m_isClick = false
		end	
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
    
    self.m_empty_image:setImage("batch_ui/baipinzhi_kuang.png")
    self.m_block_image:setImage("batch_ui/zhuangbei4_weikaiqi.png")
    self.m_hight_light:setImage("batch_ui/xuanzhongkuang.png")
    self.m_openNum_label:setAnchorPoint(cc.p(0.5, 0.5))
    self.m_level_label:setAnchorPoint(cc.p(0.5, 0.5))
    self.m_level_bg:setAnchorPoint(cc.p(0.5, 0.5))
    self.m_openNum_label:setScale(1.3)
    
    self.m_add_image:setImage("batch_ui/jiazhuangbei.png")
    self.m_add_label:setFontSize(24)
    self.m_add_label:setColor(cc.c3b(185,255,0))
    if LANGUAGE_TYPE == 3 then
    	 self.m_add_label:setString("可上陣")
    else
    	 self.m_add_label:setString("可上阵")
    end
    self.m_add_label:setAnchorPoint(cc.p(0.5,0.5))
    self.m_add_image:setSize(cc.size(36,37))
    
    self.m_add_image:setPositionInContainer(cc.p(74,29))
    self.m_add_label:setPositionInContainer(cc.p(46,79))
    
    self.m_empty_image:setSize(cc.size(102, 102))
    self.m_block_image:setSize(cc.size(102, 102))
    self.m_hight_light:setSize(cc.size(124, 124))
    self.m_level_label:setSize(cc.size(29, 34))
    self.m_level_label:setColor(cc.c3b(255, 255, 255))
    
    self.m_empty_image:setPositionInContainer(cc.p(51, 51))
    self.m_block_image:setPositionInContainer(cc.p(51, 51))
    self.m_hight_light:setPositionInContainer(cc.p(51, 51))
     self.m_quality_image:setPositionInContainer(cc.p(51,51))
    self.m_icon_image:setPositionInContainer(cc.p(51, 51))
    self.m_openNum_label:setPositionInContainer(cc.p(51, 51))
    self.m_level_label:setPositionInContainer(cc.p(85.5, 83))
    self.m_level_bg:setPositionInContainer(cc.p(85.5, 83))
    
	self.m_empty_image:setVisible(false)
	self.m_block_image:setVisible(false)
	self.m_icon_image:setVisible(false)
	self.m_hight_light:setVisible(false)
	self.m_quality_image:setVisible(false)

	self:updateState()
	
end


function f_game_beauty_cheer_head:onExit()    
    self:unregisterNodeEvent()
end

function f_game_beauty_cheer_head:onEnterTransitionFinish()
end

function f_game_beauty_cheer_head:onExitTransitionStart()
end

function f_game_beauty_cheer_head:onCleanup()
end


function f_game_beauty_cheer_head:registerNodeEvent(handler)
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

function f_game_beauty_cheer_head:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] setData
-- 设置数据，并根据数据设置状态
--				["id"] Type:INTEGER Size:4 主键
-- 				["beautyId"] Type:SHORT Size:2 美女ID
-- 				["beautyLevel"] Type:SHORT Size:2 美女等级
-- 				["beautyTitle"] Type:BYTE Size:1 美女称号
-- 				["position"] Type:BYTE Size:1 助阵位置
-- 				["beautyIntimacy"] Type:INTEGER Size:4 美女亲密度
-- 				["beautyEducation"] Type:INTEGER Size:4 美女教育点
-- 				["beautySavor"] Type:INTEGER Size:4 美女兴趣点
-- 				["beautyAddition"] Type:INTEGER Size:4 美女加成
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:setData(data, isBlock)
	self.m_data = data
	self.m_isBlock = isBlock
	
	if self.m_isBlock then
		local openedLv = g_game.g_dictConfigManager:getBeautyNumOpenedLv(self.m_selectIndexInList)
		self.m_openNum_label:setColor(cc.c3b(255,255,255))
		if LANGUAGE_TYPE == 3 then
			self.m_openNum_label:setString(openedLv.."級\n開啟")
		else
			self.m_openNum_label:setString(openedLv.."级\n开启")
		end
	end
	
	if self.m_data ~= nil then
		local cardResource = g_game.g_dictConfigManager:getBeautyResource(self.m_data["beautyId"])
		local resourceImage = g_game.g_resourceManager:getBeautyCardHead(cardResource)
		
		self.m_icon_image:setImage(resourceImage)
		self.m_icon_image:setSize(cc.size(85, 85))
		
		
		self.m_level_label:setString(self.m_data["beautyLevel"].. "")
		
		local quality = g_game.g_dictConfigManager:getBeautyQuality(self.m_data["beautyId"])
		self.m_quality_image:setImage(g_game.g_f_quality_image[quality])
		self.m_quality_image:setSize(cc.size(102,102))
		self.m_level_bg:setImage(g_game.g_f_quality_corner[quality])
		self.m_level_bg:setSize(cc.size(29, 34))
	end
		
	self:updateState()		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] getData
-- 返回数据
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:getData()
	return self.m_data
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] setSelectIndex
-- 设置选中索引
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:setSelectIndex(index)
	self.m_selectIndexInList = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] getIndexInList
-- 返回选中索引
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:getIndexInList()
	return self.m_selectIndexInList
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] setCardEventCallBack
-- 设置监听
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:setCardEventCallBack(cardEventCallBack)
     self.m_cardEventCallBack = cardEventCallBack
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] setSelect
-- 设置是否选中
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:setSelect(isSelect)
	self.m_isSelect = isSelect
	
	self:updateState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] updateState
-- 更新显示状态
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:updateState()
	if self.m_isBlock == true then
		self.m_empty_image:setVisible(false)
		self.m_block_image:setVisible(true)
		self.m_add_image:setVisible(false)
		self.m_add_label:setVisible(false)
		self.m_icon_image:setVisible(false)
		self.m_quality_image:setVisible(false)
		self.m_hight_light:setVisible(false)
		
		self.m_currentState = self.STATE_BLOCK_STATE
		return
	end
	
	if self.m_data ~= nil then
		if self.m_isSelect == true then
			self.m_empty_image:setVisible(true)
			self.m_block_image:setVisible(false)
			self.m_add_image:setVisible(false)
			self.m_add_label:setVisible(false)
			self.m_icon_image:setVisible(true)
			self.m_hight_light:setVisible(true)
			self.m_quality_image:setVisible(true)
			self.m_currentState = self.STATE_SELECT_STATE
		else
			self.m_empty_image:setVisible(true)
			self.m_block_image:setVisible(false)
			self.m_add_image:setVisible(false)
			self.m_add_label:setVisible(false)
			self.m_icon_image:setVisible(true)
			self.m_quality_image:setVisible(true)
			self.m_hight_light:setVisible(false)
			self.m_currentState = self.STATE_NORMAL_STATE
		end
	else
		self.m_empty_image:setVisible(true)
		self.m_add_image:setVisible(true)
		self.m_add_label:setVisible(true)
		self.m_block_image:setVisible(false)
		self.m_icon_image:setVisible(false)
		self.m_quality_image:setVisible(false)
		self.m_hight_light:setVisible(false)
		self.m_currentState = self.STATE_EMPTY_STATE
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cheer_head] itemClick
-- 响应卡牌点击
-------------------------------------------------------------------------------
function f_game_beauty_cheer_head:itemClick()
	if self.m_currentState == self.STATE_BLOCK_STATE then
		return
	end
	if self.m_currentState == self.STATE_NORMAL_STATE then
		return
	end
	if self.m_currentState == self.STATE_EMPTY_STATE then
		if self.m_cardEventCallBack then
			self.m_cardEventCallBack(self)
		end
		return
	end
	if self.m_currentState == self.STATE_SELECT_STATE then
		if self.m_cardEventCallBack then
			self.m_cardEventCallBack(self)
		end
		return
	end
	
	
end

return f_game_beauty_cheer_head