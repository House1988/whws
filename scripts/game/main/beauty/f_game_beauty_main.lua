--[[--
   美女主界面  默认打开 汤泉宫
--]]--
f_game_beauty_main = class("f_game_beauty_main")
f_game_beauty_main.__index = f_game_beauty_main

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_game_beauty_main.static_create()
	local beauti_main_table = g_game.g_panelManager:create_panel("hougong_tangquangong_bg")
	local beauti_main_panel = beauti_main_table["hougong_tangquangong_bg"]
	  
	local funTable = {}
	tolua.setpeer(beauti_main_panel, funTable)
	setmetatable(funTable, f_game_beauty_main)
	
	beauti_main_panel.m_beauti_main_bg_table = beauti_main_table
	return beauti_main_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_main:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_tangquangong = nil
	self.m_chuxiugong = nil
	self.m_kunninggong = nil
	
	self.m_panelIndex = 0
	
	self.m_pageRadioBtnArr = {}

end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_main:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_main] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_main:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_main:onEnter()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[1])

    self.m_beauti_main_bg_table["hg_tqg_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
    self.m_beauti_main_bg_table["lian_left"]:setComponentZOrder(100)
    self.m_beauti_main_bg_table["lian_right"]:setComponentZOrder(100)
    self.m_beauti_main_bg_table["hg_tqg_close_button"]:setComponentZOrder(101)
   
    self.m_pageRadioBtnArr[1] = self.m_beauti_main_bg_table["hg_tqg_xinggong_button"] --汤泉宫
   	self.m_pageRadioBtnArr[2] = self.m_beauti_main_bg_table["hg_tqg_chuxiu_button"] --储秀宫
   	self.m_pageRadioBtnArr[3] = self.m_beauti_main_bg_table["hg_tqg_kunning_button"] --坤宁宫
   	self.m_pageRadioBtnArr[4] = self.m_beauti_main_bg_table["btn_piece"] --碎片
    --默认panel index 为 汤泉宫
    self.m_panelIndex = 1

    self:updatePagePanel()
  
	self:initAllComponent()
	
	
	--发送播放后宫音乐事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_JIXIANG)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_HOUGONG)
	--发送消息 通知新手指引
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_HOUGONG)
	
	self.m_refresh = function()
		if self.m_chuxiugong ~= nil then
			self:deleteComponent(self.m_chuxiugong)
			self.m_chuxiugong = nil
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLOSE_NETWORK_LOADING)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] setPanelIndex
-- 设置默认显示panel index  1 汤泉宫  2储秀宫  3坤宁宫
-------------------------------------------------------------------------------
function f_game_beauty_main:setPanelIndex(index)
	self.m_panelIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] updatePagePanel
-- 更新每个切页 界面
-------------------------------------------------------------------------------
function f_game_beauty_main:updatePagePanel()
	-- 1 stand for radio btn bright ,2 stand for radio btn dark
	
	if	self.m_tangquangong ~= nil and
	 self.m_tangquangong:isVisible() and self.m_tangquangong.m_uiFavorState 
				== self.m_tangquangong.UI_CURBEAUTY_STATE_IN_FAVOR then
		for i = 1, #self.m_pageRadioBtnArr do
			if 1 == i then
				self.m_pageRadioBtnArr[i]:setIsEnabled(true)
				self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
			else
				self.m_pageRadioBtnArr[i]:setIsEnabled(false)
				self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
			end
		end
		return
	end
		
	for i = 1, #self.m_pageRadioBtnArr do
		if self.m_panelIndex == i then
			self.m_pageRadioBtnArr[i]:setIsEnabled(true)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(1)
		else
			self.m_pageRadioBtnArr[i]:setIsEnabled(false)
			self.m_pageRadioBtnArr[i]:setRadioButtonState(2)
		end
	end
	
	if  self.m_panelIndex == 1  then
		 --汤泉宫
		if  self.m_tangquangong == nil then
		    self.m_tangquangong = require("scripts.game.main.beauty.f_game_beauty_tangquangong").new()	
			self.m_tangquangong:setSize(cc.size(946, 565))	  
			self:appendComponent(self.m_tangquangong)
			self.m_tangquangong:setAnchorPoint(cc.p(0,1))
			self.m_tangquangong:setPositionInContainer(cc.p(6,68))
		else
			 self.m_tangquangong:setVisible(true)
			 self.m_tangquangong:updateSelectCardInfo()
		end
		
		if self.m_chuxiugong ~= nil then
			self.m_chuxiugong:setVisible(false)
		end
		
		if self.m_kunninggong ~= nil then
			self.m_kunninggong:setVisible(false)
		end
		if self.m_piece ~= nil then
			self.m_piece:setVisible(false)
		end
		
	elseif  self.m_panelIndex == 2  then
		--储秀宫
		if self.m_chuxiugong == nil then
		    self.m_chuxiugong = require("scripts.game.main.beauty.f_game_beauty_chuxiugong").new()	
			self.m_chuxiugong:setSize(cc.size(946, 565))	  
			self:appendComponent(self.m_chuxiugong)
			self.m_chuxiugong:setAnchorPoint(cc.p(0,1))
			self.m_chuxiugong:setPositionInContainer(cc.p(6,68))
		else
			 self.m_chuxiugong:setVisible(true)
--			 self.m_chuxiugong:initAllBeautyList()
		end
		
		if self.m_tangquangong ~= nil then
			self.m_tangquangong:setVisible(false)
		end
		
		if self.m_kunninggong ~= nil then
			self.m_kunninggong:setVisible(false)
		end
		if self.m_piece ~= nil then
			self.m_piece:setVisible(false)
		end
	elseif  self.m_panelIndex == 3  then
		--坤宁宫
		if self.m_kunninggong == nil then
			 self.m_kunninggong = require("scripts.game.main.beauty.f_game_beauty_kunninggong").new()	
			 self.m_kunninggong:setSize(cc.size(946, 565))	  
			 self:appendComponent(self.m_kunninggong)
			 self.m_kunninggong:setAnchorPoint(cc.p(0,1))
			 self.m_kunninggong:setPositionInContainer(cc.p(0,60))
		else
			 self.m_kunninggong:setVisible(true)
		end
		
		if self.m_tangquangong ~= nil then
			self.m_tangquangong:setVisible(false)
		end
		
		if self.m_chuxiugong ~= nil then
			self.m_chuxiugong:setVisible(false)
		end
		if self.m_piece ~= nil then
			self.m_piece:setVisible(false)
		end
	elseif self.m_panelIndex == 4 then
		if self.m_piece == nil then
			 self.m_piece = require("scripts.game.main.suipian.f_suipianPanel").new()	
			 self:appendComponent(self.m_piece)
			 self.m_piece:setSize(cc.size(960, 640))	  
			 self.m_piece:panelInitBeforePopup(2)
			 self.m_piece:setAnchorPoint(cc.p(0,1))
			 self.m_piece:setPositionInContainer(cc.p(0, 0))
		else
			self.m_piece:setVisible(true)
		end
		if self.m_tangquangong ~= nil then
			self.m_tangquangong:setVisible(false)
		end
		if self.m_chuxiugong ~= nil then
			self.m_chuxiugong:setVisible(false)
		end
		
		if self.m_kunninggong ~= nil then
			self.m_kunninggong:setVisible(false)
		end
	end
end
-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] onExit
-------------------------------------------------------------------------------
function f_game_beauty_main:onExit()  
  self:unregisterNodeEvent()
  g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[1])
  
  self.m_tangquangong = nil
  self.m_chuxiugong = nil
  self.m_kunninggong = nil
  
  g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[1])
	
  self.m_pageRadioBtnArr = {}
  
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PIECE, self.m_refresh)
	--发送播放主场景音乐事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_main:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_main:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_main:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_main:initAllComponent()
	local touchDown = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_beauti_main_bg_table["hg_tqg_close_button"]:addHandleOfcomponentEvent(touchDown,g_game.g_f_touch_event.F_TOUCH_DOWN)
	
	local closeCurPanel = function()	
		if self.m_tangquangong:isVisible() and self.m_tangquangong.m_uiFavorState 
				== self.m_tangquangong.UI_CURBEAUTY_STATE_IN_FAVOR then
			return
		end		
--		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_HOUGONG)
		self:closeCurrentPanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIJIA)
	end
	self.m_beauti_main_bg_table["hg_tqg_close_button"]:addHandleOfcomponentEvent(closeCurPanel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeToTangquan = function()
		if self.m_panelIndex ~= 1 then
			self.m_panelIndex = 1
			self:updatePagePanel()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
		end
		self.m_pageRadioBtnArr[1]:setIsEnabled(true)
		self.m_pageRadioBtnArr[1]:setRadioButtonState(1)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(changeToTangquan,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeToPiece = function()
		if self.m_panelIndex ~= 4 then
			self.m_panelIndex = 4
			self:updatePagePanel()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
		end
		self.m_pageRadioBtnArr[4]:setIsEnabled(true)
		self.m_pageRadioBtnArr[4]:setRadioButtonState(1)
	end
	self.m_pageRadioBtnArr[4]:addHandleOfcomponentEvent(changeToPiece,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeToChuxiu = function()
		if self.m_panelIndex ~= 2 then
			self.m_panelIndex = 2
	    	self:updatePagePanel()
	    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP)
	    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
    	end
    	self.m_pageRadioBtnArr[2]:setIsEnabled(true)
		self.m_pageRadioBtnArr[2]:setRadioButtonState(1)
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(changeToChuxiu,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local changeToKunning = function()
		if self.m_panelIndex ~= 3 then
			self.m_panelIndex = 3
	   		self:updatePagePanel()
	   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP)
	   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
   		end
   		self.m_pageRadioBtnArr[3]:setIsEnabled(true)
		self.m_pageRadioBtnArr[3]:setRadioButtonState(1)
	end
	self.m_pageRadioBtnArr[3]:addHandleOfcomponentEvent(changeToKunning,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self:setStopTouchEvent(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] closeCurrentPanel
-- remove 当前美女界面
-------------------------------------------------------------------------------

function f_game_beauty_main:closeCurrentPanel()
    g_game.g_panelManager:removeUiPanel("hougong_tangquangong_bg")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] updateQifeiResult
-- 播放弃妃结果
-------------------------------------------------------------------------------
function f_game_beauty_main:updateQifeiResult()
	if self.m_kunninggong ~= nil and self.m_kunninggong:isVisible() then
		self.m_kunninggong:updateQifeiResult()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_main] updateTqxgCardInfo
-- 刷新汤泉行宫数据
-------------------------------------------------------------------------------
function f_game_beauty_main:updateTqxgCardInfo()
	self.m_tangquangong:updateSelectCardInfo()
end
