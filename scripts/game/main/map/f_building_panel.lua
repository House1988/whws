--[[
	继承自container panel, 实现建筑组件
]]--

local FLuaBuildingComponent = class("FLuaBuildingComponent", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaBuildingComponent")
end)

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBuildingComponent] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaBuildingComponent:ctor()    
    self:registerNodeEvent()   
    
    
	self.m_buildingImage = fc.FScaleButton:create()
	self:appendComponent(self.m_buildingImage)
	self.m_buildingImage:setSize(cc.size(43, 105))
	self.m_buildingImage:setTouchRectAdjust(g_game.RECT_OFFSET)
	self.m_buildingImage:setAnchorPoint(cc.p(0.5, 0.5))
	
	self.m_red = fc.FExtensionsImage:create()
	self:appendComponent(self.m_red)
	self.m_red:setImage("batch_ui/shuzi.png")
	self.m_red:setSize(cc.size(25, 25))
	self.m_red:setAnchorPoint(0.5, 0.5)
	
	self.m_number = fc.FLabel:createSystemFont()
	self:appendComponent(self.m_number)
	self.m_number:setSize(cc.size(25, 25))
	self.m_number:setAnchorPoint(0.5, 0.5)
	self.m_number:setColor(cc.c3b(255, 255, 255))
	self.m_number:setScale(0.7)
	
	self.m_anim = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	self:appendComponent(self.m_anim)
	self.m_anim:setAnchorPoint(cc.p(0.5,0.5))
	self.m_anim:setLoop(true)
	self.m_anim:setAnimationScale(0.8)
	self.m_anim:setVisible(false)
	
	self.m_words = {}
	
    self:setStopTouchEvent(true)
	
end

function FLuaBuildingComponent:enableAnim(enable)
	if enable then
		self.m_anim:setPositionInContainer(cc.p(17, 50))
		self.m_anim:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1], g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[15])
	end
	self.m_anim:setVisible(enable)
end


function FLuaBuildingComponent:setNumber(num)
	if num <= 0 then
		self.m_number:setVisible(false)
		self.m_red:setVisible(false)
	else
		self.m_number:setVisible(true)
		self.m_red:setVisible(true)
		if num > 9 then
			self.m_number:setString("!")
		else
			self.m_number:setString(num .. "")
		end
	end
	self.m_red:setPositionInContainer(cc.p(40, 95))
	self.m_number:setPositionInContainer(cc.p(40, 91))
end


function FLuaBuildingComponent:setLabels(data)
	for i = 1, #self.m_words do
		self:deleteComponent(self.m_words[i])
	end
	self.m_words = {}
	for i = 7, #data do
		if data[i] ~= 0 then
			local word = fc.FExtensionsImage:create()
			self.m_buildingImage:appendComponent(word)
			word:setImage("batch_ui/" .. data[i] .. ".png")
			word:setSize(cc.size(20, 20))
			word:setAnchorPoint(0.5, 0.5)
			table.insert(self.m_words, word)
		end
	end
	local start = 0
	local step = 0
	if #self.m_words == 3 then
		start = 32.5
		step = 20
	elseif #self.m_words == 2 then
		start = 37.5
		step = 30
	elseif #self.m_words == 4 then
		start = 27
		step = 16
	end
	for i = 1, #self.m_words do
		self.m_words[i]:setPositionInContainer(cc.p(21.5, start))
		start = start + step
	end
end 

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBuildingComponent] resetWordsPosition
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBuildingComponent:resetWordsPosition()
	if self.m_words == nil then return end
	
	local start = 37.5
	local step = 30
	for i = 1, #self.m_words do
		self.m_words[i]:setPositionInContainer(cc.p(24.5, start))
		start = start + step
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBuildingComponent] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaBuildingComponent:onEnter()   
	
	
end


function FLuaBuildingComponent:onExit()    
    self:unregisterNodeEvent()
end

function FLuaBuildingComponent:onEnterTransitionFinish()
end

function FLuaBuildingComponent:onExitTransitionStart()
end

function FLuaBuildingComponent:onCleanup()
end


function FLuaBuildingComponent:registerNodeEvent(handler)
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

function FLuaBuildingComponent:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBuildingComponent] setBuildingImage
-- 响应卡牌点击
-------------------------------------------------------------------------------
function FLuaBuildingComponent:setBuildingImage(path)
	self.m_buildingImage:setButtonImage(path)
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaBuildingComponent] getBuildingScaleButton
-- 获取建筑组件按钮
-------------------------------------------------------------------------------
function FLuaBuildingComponent:getBuildingScaleButton()
	return self.m_buildingImage
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaBuildingComponent] buildingMove
-- 建筑组件移动
-------------------------------------------------------------------------------
function FLuaBuildingComponent:buildingMove(move)
	if move then		
		local actionUp = cc.MoveBy:create(1.5,cc.p(0,10))
		local actionDown = cc.MoveBy:create(1.5,cc.p(0,-10))
		local updown = g_game.g_transition.sequence({actionUp,actionDown})
		local repeatFloating = cc.RepeatForever:create(updown)
		self:runAction(repeatFloating)
	else
		self:stopAllActions()
	end
end
	
return FLuaBuildingComponent
