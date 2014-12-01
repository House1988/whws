--[[
	继承自container panel, 实现跑马灯滚动消息
]]--

local f_common_moving_msg = class("f_common_moving_msg", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_common_moving_msg")
end)


--使用方法
--local msg1 = {
--			 ["messageiList_Num"] = 2,
--			 ["messageiList"] = 
--			 {
--			 	{["content"] = "我是走马灯1，我走1遍",["times"] = 1},
--			 	{["content"] = "我是走马灯2，我走2遍",["times"] = 2},
--			 }
--}
--g_game.g_userInfoManager:setMovingMsg(msg1)

-------------------------------------------------------------------------------
-- @function [parent=#f_common_moving_msg] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_common_moving_msg:ctor()    
    self:setSize(cc.size(CONFIG_SCREEN_WIDTH,30))
    
    self.STATE_NONE = 0
    self.STATE_INIT = 1 --计算当前条label的长度   初始化index等  循环移动的次数
    self.STATE_BEGIN_MOVE = 2 --开始移动
    self.STATE_MOVING = 3 --移动中  处理一些函数逻辑
    self.STATE_MOVE_END = 4 --当前此次移动结束  要根据次数判断是否移动到  begin_move的状态
    self.STATE_IS_NEXT = 5 --先更新下 总的条数    再删掉之前已经移动显示过的一条    判断当前index是否还有下一条   如果有  跳转到 state_init 如果没有，跳转到state_end
    self.STATE_END = 6 --播放完所有走马灯 ，推出 并删除 该panel
    
    self.m_state = self.STATE_NONE
    self.m_times = 0 --当前走马灯需要走几次
    self.m_msgTable = nil
    
	self.m_componentTable = {}
    self.m_strMoveOffset = 0 --每次label移动的偏移量
end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_moving_msg] layout_in_parent
-------------------------------------------------------------------------------
function f_common_moving_msg:layout_in_parent()
  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE_ALLSCALE)

	self:registerNodeEvent()--注册特殊回调函数     
	
  	self.m_autoPanel:appendComponent(self)
  	self.m_componentTable["panel_layer_config"] = 6
	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel,self.m_componentTable["panel_layer_config"])

end

-------------------------------------------------------------------------------
-- @function [parent=#f_common_moving_msg] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_common_moving_msg:onEnter()   
	local m_layer_color	= cc.LayerColor:create(cc.c4b(8, 25, 26, 255*0.8))
    self:addChild(m_layer_color)
    m_layer_color:setContentSize(cc.size(CONFIG_SCREEN_WIDTH,22))
	m_layer_color:setPosition(cc.p(CONFIG_SCREEN_WIDTH/2,11))
	
	self.movingLabel = fc.FLabel:createBMFont()
    self:appendComponent(self.movingLabel)
    self.movingLabel:setFontSize(20)	
	
	self.m_state = self.STATE_INIT
	
	self.m_times = 0
	self.m_startTime = 0 --其实移动次数
	self.m_msgTable = g_game.g_userInfoManager:getMovingMsg()
	self.m_strMoveOffset = 0
	
	g_game.g_gameManager:addUpdateObj(self)
end

function f_common_moving_msg:update(dt)
	if self.m_state == self.STATE_INIT then
		if #self.m_msgTable == 0 then
			self.m_state = self.STATE_END
		end
		
		local func = function()
		end
		self.m_times = self.m_msgTable[1]["count"]
		self.m_startTime = 0
		local strLen = string.hybridTextLen(self.m_msgTable[1]["content"])
		self.m_strMoveOffset = strLen * 21  --走马灯用20号字  稍微加一点偏移
		
--		self.movingLabel:setColor(cc.c3b(255,252,0))
--		self.movingLabel:setString(self.m_msgTable[1]["content"])
		self.movingLabel:setComplexString(g_game.g_utilManager:getEncodeString(self.m_msgTable[1]["content"],cc.c3b(255,252,0)), func)
		
		self.m_state = self.STATE_BEGIN_MOVE
	elseif self.m_state == self.STATE_BEGIN_MOVE then
		local moveEndLogic = function()
			self.m_state = self.STATE_MOVE_END
		end
		
		if self.m_startTime < self.m_times then
			self.m_startTime = self.m_startTime + 1
		end
		
		self.movingLabel:setAnchorPoint(cc.p(0.5, 0.5))
 		self.movingLabel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH*1.5+self.m_strMoveOffset/2, 3))
 		local prePosX,prePosY = self.movingLabel:getPosition()
		local moveTo = cc.MoveBy:create(10,cc.p(-CONFIG_SCREEN_WIDTH-self.m_strMoveOffset,0))
		local actions = g_game.g_transition.sequence({moveTo,cc.CallFunc:create(moveEndLogic)})
		self.movingLabel:runAction(actions)
		
		self.m_state = self.STATE_MOVING
	elseif self.m_state == self.STATE_MOVING then

	elseif self.m_state == self.STATE_MOVE_END then
	
		if self.m_startTime < self.m_times then
			self.m_state = self.STATE_BEGIN_MOVE
		else
			self.m_state = self.STATE_IS_NEXT
		end
	elseif self.m_state == self.STATE_IS_NEXT then
		self.m_msgTable = g_game.g_userInfoManager:getMovingMsg()
		table.remove(self.m_msgTable,1)
	
		if #self.m_msgTable ~= 0 then
			self.m_state = self.STATE_INIT
		else
			self.m_state = self.STATE_END
		end
		
	elseif self.m_state == self.STATE_END then
		g_game.g_utilManager:hideMovingMsg()
	end
end

function f_common_moving_msg:hide()
	local layer = g_game.g_director:getRunningScene():get_layer_from_config(6)
	layer:removeChild(self.m_autoPanel, true)
end

function f_common_moving_msg:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end

function f_common_moving_msg:onEnterTransitionFinish()
end

function f_common_moving_msg:onExitTransitionStart()
end

function f_common_moving_msg:onCleanup()
end


function f_common_moving_msg:registerNodeEvent(handler)
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

function f_common_moving_msg:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_common_moving_msg