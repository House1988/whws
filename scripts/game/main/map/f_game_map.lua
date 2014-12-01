require("scripts.game.main.stage.f_stage_chapters")
require("scripts.game.main.beauty.f_game_beauty_main")
require("scripts.game.main.jinluandian.f_jinluandian_main")
require("scripts.game.main.huangzi.f_huangzi_qianqinggong_yangxindian")
require("scripts.game.main.junjichu.f_junjichu_panel")
require("scripts.game.main.common.f_jump_tip_popup")

local f_game_map = class("f_game_map", function()
    return g_game.g_classFactory.newFLuaContainerScroll("f_game_map")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_map:ctor()
	self.m_mapConfig = require("scripts.game.main.map.f_game_map_data")

	self.m_building_array = {}
	self.m_npc_array = {}
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_game_map:layout_in_parent()

  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE_ALLSCALE)
  	self.m_autoPanel:appendComponent(self)


	self:registerNodeEvent()--注册特殊回调函数

	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))

  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 1)

end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] registerNodeEvent
-- 注册事件回调
-------------------------------------------------------------------------------
function f_game_map:registerNodeEvent(handler)
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
-- @function [parent=#f_game_map] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_game_map:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] onEnter
-------------------------------------------------------------------------------
function f_game_map:onEnter()
	self.event_updateUserPveProgress = function()
		self:enterChapterSelect()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO, self.event_updateUserPveProgress)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] onExit
-------------------------------------------------------------------------------
function f_game_map:onExit()
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_INFO, self.event_updateUserPveProgress)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_map:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_map:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] onCleanup
-------------------------------------------------------------------------------
function f_game_map:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] registerServerMessage
-------------------------------------------------------------------------------
function f_game_map:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] unregisterServerMessage
-------------------------------------------------------------------------------
function f_game_map:unregisterServerMessage()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] loadMap
-------------------------------------------------------------------------------
function f_game_map:loadMap()
	self:setScrollContentSize(cc.size(self.m_mapConfig["mapConfig"]["map_width"] - self.m_mapConfig["mapConfig"]["strategy_left"] * 2, self.m_mapConfig["mapConfig"]["map_height"]))
	local top = self.m_mapConfig["mapConfig"]["top"]
	local bottom = self.m_mapConfig["mapConfig"]["bottom"]
	for i = 1, #top do
		local topImage = fc.FExtensionsImage:create()

		self:appendComponent(topImage)
		topImage:setImage(top[i][1])
		topImage:setSize(cc.size(top[i][2][1], top[i][2][2]))
		topImage:setAnchorPoint(cc.p(0, 1))
	   	topImage:setPositionInContainer(cc.p((i-1) * top[i][2][1] - self.m_mapConfig["mapConfig"]["strategy_left"],0))
	end
	for i = 1, #bottom do
		local bottomImage = fc.FExtensionsImage:create()
		self:appendComponent(bottomImage)
		bottomImage:setImage(bottom[i][1])
		bottomImage:setSize(cc.size(bottom[i][2][1], bottom[i][2][2]))
		bottomImage:setAnchorPoint(cc.p(0, 1))
	   	bottomImage:setPositionInContainer(cc.p((i-1) * bottom[i][2][1] - self.m_mapConfig["mapConfig"]["strategy_left"],top[1][2][2]))
	end

	self:setScrollOffset(cc.p(self.m_mapConfig["mapConfig"]["map_default_pos"][1], self.m_mapConfig["mapConfig"]["map_default_pos"][2]))
	self:setLeftRightRemove(cc.size(self.m_mapConfig["mapConfig"]["strategy_left"], self.m_mapConfig["mapConfig"]["strategy_right"]))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] loadNpc
-- 加载场景中的动画
-------------------------------------------------------------------------------
function f_game_map:loadNpc()
	local npcDataList = g_game.g_dictConfigManager:getNpcList()
	
	for i = 1, #npcDataList do
--		local npcAnim  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
--		self:appendComponent(npcAnim)
--		npcAnim:setAnchorPoint(cc.p(0.5,0.5))
--		npcAnim:setLoop(true)
--		npcAnim:setAnimationSpeedScale(0.4)
--		npcAnim:runAnimation(g_game.g_f_main_ui_effect.MAIN_SCENE_NPC[1],npcDataList[i][2])
--		local posTable = g_game.g_dictConfigManager:getEffectSplitPos(i)
--		npcAnim:setPositionInContainer(cc.p(posTable[1]["x"]-35,posTable[1]["y"]+20))
		
		local npcComponent = require("scripts.game.main.map.f_npc_component").new()
		self:appendComponent(npcComponent)
		npcComponent:setAnchorPoint(cc.p(0.5,0.5))
		npcComponent:setIndex(i)
		
		local posTable = g_game.g_dictConfigManager:getEffectSplitPos(i)
		npcComponent:setPositionInContainer(cc.p(posTable[1]["x"]-35,posTable[1]["y"]+20))
		npcComponent:initAnim()
		table.insert(self.m_npc_array,npcComponent)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] loadBuilding
-- 加载场景中的建筑
-------------------------------------------------------------------------------
function f_game_map:loadBuilding()
	local buildList = g_game.g_userInfoManager:getBuildingList()
	for i,v in pairs(buildList) do
		local path = g_game.g_resourceManager:getBuilding(v[6])

		local buildingComponent = require("scripts.game.main.map.f_building_panel").new()
		self:appendComponent(buildingComponent)
		buildingComponent:setSize(cc.size(43, 105))
		buildingComponent:setScale(1.2)
		buildingComponent:setTouchRectAdjust(g_game.RECT_OFFSET)
		buildingComponent:setAnchorPoint(cc.p(0.5, 0.5))
		buildingComponent:setPositionInContainer(cc.p(v[4] - self.m_mapConfig["mapConfig"]["strategy_left"] + 26, v[5] + 56))
		buildingComponent:setLabels(v)
		buildingComponent:setNumber(0)
		
		local buildingImage = buildingComponent:getBuildingScaleButton()
		buildingImage:setButtonImage(path)
		buildingImage:setAnchorPoint(cc.p(0.5, 0.5))
		buildingImage:setPositionInContainer(cc.p(21.5, 52.5))
		buildingImage:setTouchRectAdjust(g_game.RECT_OFFSET)
		
		buildingComponent:buildingMove(true)
		
		--注册建筑回调函数
		local callback = function()
			self:triggerBuilding(v[1])
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
		buildingImage:addHandleOfcomponentEvent(callback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		
		self.m_building_array[v[1]] = buildingComponent
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] getBuilding
-- 获取场景中的建筑
-------------------------------------------------------------------------------
function f_game_map:getBuilding(buildingType)
	return self.m_building_array[buildingType]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] triggerBuilding
-- 触发建筑
-- type = 1,"金銮殿"
-- type = 2,"军机处"
-- type = 3,"后宫"
-- type = 4,"东宫"
-- type = 5,"德胜门"
-- type = 6,"寻访"
-- type = 7,"藏书阁"
-- type = 8,"尚书省"
-- type = 9,"中书省"
-- type = 10,"门下省"
-- type = 11,"将军府"
-- type = 12,"太尉府"
-- type = 13,"枢密院"
-------------------------------------------------------------------------------
function f_game_map:triggerBuilding(type)
	if type == 1 then
		if g_game.g_guidelinesManager:canBtnClick("jinluandian") then
			self:enterJinluandian()
		end
	elseif type == 2 then
		if g_game.g_guidelinesManager:canBtnClick("junjichu") then
			self:enterJunjichu()
		end
	elseif type == 3 then
		if g_game.g_guidelinesManager:canBtnClick("hougong") then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)	
			self:enterBeauty()
		end
	elseif type == 4 then
		if g_game.g_guidelinesManager:canBtnClick("donggong") then
			local hasPrince = g_game.g_userInfoManager:hasPrince()
			if not hasPrince then
--				local tips = g_game.g_utilManager:getTipsMsg(g_game.g_f_tip_msg_def.F_LUA_TIPS_NEED_CHONGXING_MEINV)
--				g_game.g_utilManager:showMsg(tips)
				
				local panel = f_jump_tip_popup.static_create()
				panel:setPanelByType(7)
				local leftBtnCallback = function()
					g_game.g_panelManager:removeUiPanel("jump_tip_popup")
				end
				local rightBtnCallback = function()
					g_game.g_panelManager:removeUiPanel("jump_tip_popup")
					self:enterBeauty()
				end
				panel:setBtnHandler(leftBtnCallback, rightBtnCallback)
				g_game.g_panelManager:showUiPanel(panel, "jump_tip_popup")
			else
				self:enterYangxindian()
			end
		end
	elseif type == 5 then
		if g_game.g_guidelinesManager:canBtnClick("deshengmen") then
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
			g_game.g_userInfoManager:requestUserPveProgress()
		end
	elseif type == 6 then
		if g_game.g_guidelinesManager:canBtnClick("xunfang") then
			local getOpenLv = g_game.g_dictConfigManager:getOpenLv(type)
			if getOpenLv > g_game.g_userInfoManager:getUserLv() then
				local str = g_game.g_dictConfigManager:getLanTextById(436)
				g_game.g_utilManager:showMsg(getOpenLv ..  str)
			else
				require("scripts.game.main.bingfa.f_xunfang_panel")
				local panel = f_xunfang_panel.static_create()
				panel:panelInitBeforePopup()
				g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
			end
		end
	elseif type == 7 then
		if g_game.g_guidelinesManager:canBtnClick("cangshuge") then
			local getOpenLv = g_game.g_dictConfigManager:getOpenLv(type)
			if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
				g_game.g_userInfoManager:requestBingfaPiece()
				g_game.g_panelManager:removeUiPanel("main_popup")
			else
				local str = g_game.g_dictConfigManager:getLanTextById(437)
				g_game.g_utilManager:showMsg(getOpenLv ..  str)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	elseif type == 8 then
		if g_game.g_guidelinesManager:canBtnClick("jitian") then
			local getOpenLv = g_game.g_dictConfigManager:getOpenLv(type)
			if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
				g_game.g_userInfoManager:requestLianHuaShop(false)
			else
				local str = g_game.g_dictConfigManager:getLanTextById(435)
				g_game.g_utilManager:showMsg(getOpenLv .. str)
			end
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
	else
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(type)
		
		local msg = ""
		if LANGUAGE_TYPE == 3 then
			msg = getOpenLv .. "級開啟，敬請期待"
		else
			msg = getOpenLv .. "级开启，敬请期待"
		end
		g_game.g_utilManager:showMsg(msg)
--	elseif type == 7 then
--	elseif type == 8 then
--	elseif type == 9 then
--	elseif type == 10 then
--	elseif type == 11 then
--	elseif type == 12 then
--	elseif type == 13 then
	end
	g_game.g_panelManager:removeUiPanel("main_popup")
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] enterChapterSelect
-- 进入 关卡章节选择
-------------------------------------------------------------------------------
function f_game_map:enterChapterSelect()
	local stageChapter = f_stage_chapters.static_create()
    stageChapter:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(stageChapter,"nanzhengbeitao_title")
	stageChapter:updateLastChapterFromServer()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_DSM)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] enterJinluandian
-- 进入金銮殿
-------------------------------------------------------------------------------
function f_game_map:enterJinluandian()
	local jinluandian = f_jinluandian_main.static_create()
	jinluandian:panelInitBeforePopup()

	g_game.g_panelManager:showUiPanel(jinluandian,"jinluandian_bg")

end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_map] enterYangxindian
-- 进入养心殿
-------------------------------------------------------------------------------
function f_game_map:enterYangxindian()
	local yangxindian = f_huangzi_qianqinggong_yangxindian.static_create()
	yangxindian:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(yangxindian,"huangzi_qianqinggong_top")
end

-------------------------------------------------
-- @function [parent=#f_game_map] enterBeauty
-- 打开美女
-------------------------------------------------
function f_game_map:enterBeauty()

	local beautyPalace = f_game_beauty_main.static_create()
	beautyPalace:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(beautyPalace,"hougong_tangquangong_bg")
end

-------------------------------------------------
-- @function [parent=#f_game_map] enterJunjichu
-- 进入军机处
-------------------------------------------------
function f_game_map:enterJunjichu()
	local junjichu = f_junjichu_panel.static_create()
	junjichu:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(junjichu,"junjichu_title")
end

return f_game_map
