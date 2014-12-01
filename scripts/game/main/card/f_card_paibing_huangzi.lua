require("scripts.game.main.common.f_jump_tip_popup")
require("scripts.game.main.beauty.f_game_beauty_main")
require("scripts.game.main.huangzi.f_huangzi_qianqinggong_yangxindian")

--[[--
   排兵布阵， 皇子督军  主界面弹出面板  
--]]--
f_card_paibing_huangzi = class("f_card_paibing_huangzi")
f_card_paibing_huangzi.__index = f_card_paibing_huangzi

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_card_paibing_huangzi.static_create()
	local paibingHuangziTopTable = g_game.g_panelManager:create_panel("paibinghuangzi_top")
	local paibingHuangzi_Panel = paibingHuangziTopTable["paibinghuangzi_top"]
	  
	local funTable = {}
	tolua.setpeer(paibingHuangzi_Panel, funTable)
	setmetatable(funTable, f_card_paibing_huangzi)
	
	paibingHuangzi_Panel.m_paibing_huangziTopTable = paibingHuangziTopTable
	return paibingHuangzi_Panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_paibing_buzhen = nil
	self.m_huangzi_dujun = nil
	
	self.m_panelIndex = 0
	self.m_pageRadioBtnArr = {}
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] registerNodeEvent
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:registerNodeEvent(handler)
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
-- @function [parent=#f_card_paibing_huangzi] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] onEnter
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:onEnter()
    self.m_pageRadioBtnArr[1] = self.m_paibing_huangziTopTable["paibing_button"] --排兵布阵
   	self.m_pageRadioBtnArr[2] = self.m_paibing_huangziTopTable["huangzi_button"] --皇子督军
   	
   	--默认panel index 为 排兵布阵
    self.m_panelIndex = 1
    self:updatePagePanel()
    
    self.m_paibing_huangziTopTable["lian_image"]:setComponentZOrder(3)
    self.m_paibing_huangziTopTable["lian_image_right"]:setComponentZOrder(3)
    self.m_paibing_huangziTopTable["close_button"]:setComponentZOrder(4)
    self.m_paibing_huangziTopTable["close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
    
	self:initAllComponent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BUZHEN)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] setPanelIndex
-- 设置默认显示panel index  1 排兵布阵  2 皇子督军 
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:setPanelIndex(index)
	self.m_panelIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] updatePagePanel
-- 更新每个切页 界面
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:updatePagePanel()
	-- 1 stand for radio btn bright ,2 stand for radio btn dark
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
		
		 --排兵布阵
		if  self.m_paibing_buzhen == nil then
		    self.m_paibing_buzhen = require("scripts.game.main.card.f_card_paibing_buzhen").new()	
			self.m_paibing_buzhen:setSize(cc.size(960,640))	  
			self:appendComponent(self.m_paibing_buzhen)
			self.m_paibing_buzhen:setAnchorPoint(cc.p(0,1))
			self.m_paibing_buzhen:setPositionInContainer(cc.p(0,0))
		else
			 self.m_paibing_buzhen:setVisible(true)
		end
		
		if self.m_huangzi_dujun ~= nil then
			self.m_huangzi_dujun:setVisible(false)
		end
		
		self:setExtraVisible(true)
	elseif  self.m_panelIndex == 2  then
		
		--皇子督军
		if self.m_huangzi_dujun == nil then
			self.m_huangzi_dujun = require("scripts.game.main.card.f_card_huangzi_dujun").new()	
			self.m_huangzi_dujun:setSize(cc.size(960,640))	  
			self:appendComponent(self.m_huangzi_dujun)
			self.m_huangzi_dujun:setAnchorPoint(cc.p(0,1))
			self.m_huangzi_dujun:setPositionInContainer(cc.p(0,0))
			
		else
			self.m_huangzi_dujun:setVisible(true)
		end
		
		if self.m_paibing_buzhen ~= nil then
			self.m_paibing_buzhen:setVisible(false)
		end
		
		self:setExtraVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] setExtraVisible
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:setExtraVisible(b)
	self.m_paibing_huangziTopTable["kuang_panel"]:setVisible(b)
	self.m_paibing_huangziTopTable["bg_wen1_l"]:setVisible(b)
	self.m_paibing_huangziTopTable["bg_wen2_l"]:setVisible(b)
	self.m_paibing_huangziTopTable["bg_wen2_r"]:setVisible(b)
	self.m_paibing_huangziTopTable["bg_wen1_r"]:setVisible(b)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] onExit
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:onExit()  
	self.m_paibing_buzhen = nil
	self.m_huangzi_dujun = nil
    self:unregisterNodeEvent()
    
    send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_CLOSE_BUZHEN)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] onExitTransitionStart
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] onCleanup
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:initAllComponent()
 	--关闭排兵布阵 皇子督军界面
	local closeCallBack = function()
		if g_game.g_guidelinesManager:canBtnClick("paibingClose") then
			self:closeCurrentPanel()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	end
    self.m_paibing_huangziTopTable["close_button"]:addHandleOfcomponentEvent(closeCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
	
	--切换到排兵布阵
	local changeToPaibing = function()
		self.m_panelIndex = 1
		self:updatePagePanel()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(changeToPaibing,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	--切换到皇子督军
	local changeToHuangzi = function()
		local huangziNum = g_game.g_userInfoManager:huangZiNum()
		if huangziNum <= 0 then
			local panel = f_jump_tip_popup.static_create()
			panel:setPanelByType(7)
			local leftBtnCallback = function()
				g_game.g_panelManager:removeUiPanel("jump_tip_popup")
			end
			local rightBtnCallback = function()
				g_game.g_panelManager:removeAllUiPanel()
				local beautyPalace = f_game_beauty_main.static_create()
				beautyPalace:panelInitBeforePopup()
				g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
			end
			panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
			g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
		else
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
			local currentLevel = g_game.g_userInfoManager:getLevel()
			local openedPrinceNum = g_game.g_dictConfigManager:getOpenedPrinceNum(currentLevel)
			if openedPrinceNum > 0 and g_game.g_userInfoManager:hasHuangZiLv5() then
				self.m_panelIndex = 2
		    	self:updatePagePanel()
		    else
				self.m_pageRadioBtnArr[2]:setRadioButtonState(2)
--				g_game.g_utilManager:showFloatingMsg("您还没有5级及以上的皇子")
				local panel = f_jump_tip_popup.static_create()
				panel:setPanelByType(8)
				local leftBtnCallback = function()
					g_game.g_panelManager:removeUiPanel("jump_tip_popup")
				end
				local rightBtnCallback = function()
					g_game.g_panelManager:removeAllUiPanel()
					local yangxindian = f_huangzi_qianqinggong_yangxindian.static_create()
					yangxindian:panelInitBeforePopup()
					g_game.g_panelManager:showUiPanel(yangxindian,"huangzi_qianqinggong_top")
				end
				panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
				g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
			end
		end
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(changeToHuangzi,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
    
    self:setStopTouchEvent(true)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] closePopUpBuzhen
-- 删除换阵 皇子界面
-------------------------------------------------------------------------------

function f_card_paibing_huangzi:closeCurrentPanel()
    g_game.g_panelManager:removeUiPanel("paibinghuangzi_top")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] removeHuanZhenPanel
-- 删除换阵界面
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:removeHuanZhenPanel()
	if self.m_paibing_buzhen ~= nil and self.m_paibing_buzhen:isVisible() then
		self.m_paibing_buzhen:removeHuanZhenPanel()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_paibing_huangzi] removeMingchanPanel
-- 删除名臣界面
-------------------------------------------------------------------------------
function f_card_paibing_huangzi:removeMingchanPanel()
	if self.m_paibing_buzhen ~= nil and self.m_paibing_buzhen:isVisible() then
		self.m_paibing_buzhen:removeMingchanPanel()
	end
end

