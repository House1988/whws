--[[--
    新手指引
  	 第二次已经打完  跳转到战斗小关卡界面  此时其实第三个已开启 指向小关卡界面排兵布阵按钮
    步骤
--]]--

local f_guidelines_51 = class("f_guidelines_51")
f_guidelines_51.__index = f_guidelines_51

-------------------------------------------------
-- @function [parent=#f_guidelines_51] ctor
-------------------------------------------------
function f_guidelines_51:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_FINISH		= 3
	self.STATE_EXIT			= 4
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_check = function(dt)
		self:state_Check(dt)
	end
	self.m_state_function_array[self.STATE_CHECK] = state_check
	
	local state_finish = function(dt)
		self:state_Finish(dt)
	end
	self.m_state_function_array[self.STATE_FINISH] = state_finish
	
	local state_exit = function(dt)
		self:state_Exit(dt)
	end
	self.m_state_function_array[self.STATE_EXIT] = state_exit
	
	self.m_current_state	= self.STATE_INIT
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] createUi
-------------------------------------------------------------------------------
function f_guidelines_51:createUi()
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)
		stencilPanel:enableStencil(true)
		
		if not g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
		
			local stageChapter = f_stage_chapters.static_create()
		    stageChapter:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(stageChapter,"nanzhengbeitao_title")
			stageChapter:guideLinePveInitChapter(1) --打开章节 初始化章节为1
			
			--打开战役	
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_ditu_bg") then
				local bigBattlePanel = f_stage_big_battle_panel.static_create()
				bigBattlePanel:panelInitBeforePopup()    
				g_game.g_panelManager:showUiPanel(bigBattlePanel,"zhanyi_ditu_bg")	
				bigBattlePanel:setChapterId(1)
				bigBattlePanel:guideLinePveInitBigBattle(1,1)--打开战役 初始化战役为1
			end
			
			--打开stage
			if not g_game.g_panelManager:isUiPanelShow("zhanyi_waikuang") then
				local smallBattlePanel = f_stage_small_battle_panel.static_create()
				smallBattlePanel:panelInitBeforePopup()    
				g_game.g_panelManager:showUiPanel(smallBattlePanel,"zhanyi_waikuang")
				smallBattlePanel:setGuideLineSmallBattleData(1,1,3)
				smallBattlePanel:guideLinePveInitSmallBattle(1,3)
			end
			
			local thirdChapter = g_game.g_panelManager:getUiPanel("zhanyi_waikuang")
			
			if thirdChapter then
				local pabingBtn = thirdChapter.m_battlePanel_title["zy_paibing_button"]
		
				local stageList = thirdChapter.m_stage_list
				if stageList then
					stageList:enableScroll(false)
				end
				if pabingBtn then
			
					local stencilPanel = self.m_guidelines_manager:getComponent()
					local posx, posy = pabingBtn:getPosition()
					local pos = pabingBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
					stencilPanel:setRectType(pos, pabingBtn:getSize(), false, false)
			
					local guideLinesBtn = fc.FScaleButton:create()
				    guideLinesBtn:setSize(cc.size(65,124))
				    guideLinesBtn:setAnchorPoint(cc.p(0.5,0.5))
				    guideLinesBtn:setButtonImage("batch_ui/huanzhen2_anniu.png")
		
				    local zy_ui_pai = fc.FExtensionsImage:create()
				    zy_ui_pai:setImage("batch_ui/pai_uizi.png")
				    zy_ui_pai:setSize(cc.size(32,32))
				    zy_ui_pai:setAnchorPoint(cc.p(0.5,0.5))
				    guideLinesBtn:appendComponent(zy_ui_pai)
				    zy_ui_pai:setPositionInContainer(cc.p(49,21))
		
				    local zy_ui_bing = fc.FExtensionsImage:create()
				    zy_ui_bing:setImage("batch_ui/bing_uizi.png")
				    zy_ui_bing:setSize(cc.size(32,32))
				    zy_ui_bing:setAnchorPoint(cc.p(0.5,0.5))
				    guideLinesBtn:appendComponent(zy_ui_bing)
				    zy_ui_bing:setPositionInContainer(cc.p(49,48))
		
				    local zy_ui_bu = fc.FExtensionsImage:create()
				    zy_ui_bu:setImage("batch_ui/bu_uizi.png")
				    zy_ui_bu:setSize(cc.size(32,32))
				    zy_ui_bu:setAnchorPoint(cc.p(0.5,0.5))
				    guideLinesBtn:appendComponent(zy_ui_bu)
				    zy_ui_bu:setPositionInContainer(cc.p(49,75))
		
				    local zy_ui_zhen = fc.FExtensionsImage:create()
				    zy_ui_zhen:setImage("batch_ui/zhen_uizi.png")
				    zy_ui_zhen:setSize(cc.size(32,32))
				    zy_ui_zhen:setAnchorPoint(cc.p(0.5,0.5))
				    guideLinesBtn:appendComponent(zy_ui_zhen)
				    zy_ui_zhen:setPositionInContainer(cc.p(49,102))
			
					stencilPanel:showIndicateComponent(guideLinesBtn, pos, pabingBtn:getSize())
					stencilPanel:showIndicateAnimation(pos, pabingBtn:getSize())
			
					local openbuzhen = function()
						if self.m_current_state == self.STATE_CHECK then
							self.m_current_state = self.STATE_FINISH
						end
					end
					guideLinesBtn:addHandleOfcomponentEvent(openbuzhen, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
					self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
					self.guidelinesPanel:panelInitBeforePopup()		
					stencilPanel:appendComponent(self.guidelinesPanel)
					self.guidelinesPanel:setComponentZOrder(100)
					local sizeT = self.guidelinesPanel:getSize()
					self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
					local stencilSize = stencilPanel:getStencilSize() 
					self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
					self.guidelinesPanel:setSwallowsTouches(false)
					self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(51))
					self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(51), false)
			
					self.m_time = 0
				
				end
			end
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_51:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_51:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_51:state_Init(dt)	
	self.event_createUi = function()
		self:createUi()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE3, self.event_createUi)
	
	self.m_current_state	= self.STATE_CHECK
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] state_Check
-------------------------------------------------------------------------------
function f_guidelines_51:state_Check(dt)	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_51:state_Finish(dt)	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE3, self.event_createUi)

	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_51:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_51:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_51] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_51:guidelinesNextIndex()	
	return 64
end


return f_guidelines_51