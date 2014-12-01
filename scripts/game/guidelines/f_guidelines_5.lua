--[[--
    新手指引
    进入后宫
    步骤
--]]--

local f_guidelines_5 = class("f_guidelines_5")
f_guidelines_5.__index = f_guidelines_5

-------------------------------------------------
-- @function [parent=#f_guidelines_5] ctor
-------------------------------------------------
function f_guidelines_5:ctor()	
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
	
	self.guidelinesPanel = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_5:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_5:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_5:guidelinesNextIndex()	
	return 28
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_5:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_5:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		g_game.g_guidelinesManager:enableBtnAndDisOther("hougong")
		--获取地图后宫按钮
		local jingnuanDianBtn = g_game.g_director:getRunningScene():getGameMap():getBuilding(3)	
		if jingnuanDianBtn then
			g_game.g_userInfoManager:requestRecordGuidleStep(5)
			
			--注册监听函数
			self.event_openHougong = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_HOUGONG, self.event_openHougong)
			
		
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)	
			stencilPanel:enableStencil(true)
			
			local posx, posy = jingnuanDianBtn:getPosition()
			local pos = jingnuanDianBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, jingnuanDianBtn:getSize(), false, false)
			
			local buildList = g_game.g_userInfoManager:getBuildingList()
			local path = g_game.g_resourceManager:getBuilding(buildList[3][6])
			
			local buildingComponent = require("scripts.game.main.map.f_building_panel").new()
			buildingComponent:setSize(cc.size(43, 105))
			buildingComponent:setScale(1.2)
			buildingComponent:setTouchRectAdjust(g_game.RECT_OFFSET)
			buildingComponent:setLabels(buildList[3])
			buildingComponent:resetWordsPosition()
			
			local guidelinesBtn = buildingComponent:getBuildingScaleButton()
			guidelinesBtn:setButtonImage(path)
			guidelinesBtn:setSize(cc.size(50,105))
			guidelinesBtn:setAnchorPoint(cc.p(0.5, 0.5))
			guidelinesBtn:setPositionInContainer(cc.p(21.5, 52.5))
			guidelinesBtn:setTouchRectAdjust(g_game.RECT_OFFSET)
			guidelinesBtn:setSwallowsTouches(false)
			
			
			stencilPanel:showIndicateComponent(buildingComponent, pos, buildingComponent:getSize())
			stencilPanel:showIndicateAnimation(pos, buildingComponent:getSize())
			buildingComponent:setNumber(0)
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2, stencilSize.height/2))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(5))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(5), false)
			
			
			jingnuanDianBtn:buildingMove(false)
		end
		
		self.m_current_state = self.STATE_CHECK

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_5:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_5:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local jingnuanDianBtn = g_game.g_director:getRunningScene():getGameMap():getBuilding(3)	
	if jingnuanDianBtn then
		jingnuanDianBtn:buildingMove(true)
	end
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
		
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_HOUGONG, self.event_openHougong)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_5] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_5:state_Exit(dt)	
	self.m_finish = true
end


return f_guidelines_5