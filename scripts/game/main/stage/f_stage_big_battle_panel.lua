require("scripts.auto.auto_zhanyi_ditu_bg")
require("scripts.auto.auto_zhanyi_ditu_bottom")

require("scripts.auto.auto_diyiciyapian_zhanyi")
require("scripts.auto.auto_dierciyapian_zhanyi")
require("scripts.auto.auto_zhongfa_zhanyi")
require("scripts.auto.auto_shoufuxinjiang_zhanyi")
require("scripts.auto.auto_jiawuzhongri_zhanyi")
require("scripts.auto.auto_xizangkangying_zhanyi")
require("scripts.auto.auto_baguolianjun_zhanyi")
require("scripts.auto.auto_yihetuan_zhanyi")
require("scripts.auto.auto_zhanyi_ditu_bottom")
require("scripts.auto.auto_yapianzhanzheng_zhanyi")

require("scripts.auto.auto_zhanyi_10th_map")
require("scripts.auto.auto_zhanyi_11th_map")
require("scripts.auto.auto_zhanyi_12th_map")
require("scripts.auto.auto_zhanyi_13th_map")
require("scripts.auto.auto_zhanyi_14th_map")


require("scripts.game.main.stage.f_stage_small_battle_panel")

--[[--
   章节
--]]--
f_stage_big_battle_panel = class("f_stage_big_battle_panel")
f_stage_big_battle_panel.__index = f_stage_big_battle_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_stage_big_battle_panel.static_create()
	local zhanyiDiTu_table = createzhanyi_ditu_bg()
	local zhanyiDiTu_panel = zhanyiDiTu_table["zhanyi_ditu_bg"]
	  
	local funTable = {}
	tolua.setpeer(zhanyiDiTu_panel, funTable)
	setmetatable(funTable, f_stage_big_battle_panel)
	
	zhanyiDiTu_panel.m_dituPanel = zhanyiDiTu_table
	return zhanyiDiTu_panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:panelInitBeforePopup()
	
	self:registerNodeEvent()
	
	--14个章节的战役
	self.m_smallBattleFuncTable = { "diyiciyapian_zhanyi",
									"dierciyapian_zhanyi",
									"zhongfa_zhanyi",
									"shoufuxinjiang_zhanyi",
									"jiawuzhongri_zhanyi",
									"xizangkangying_zhanyi",
									"baguolianjun_zhanyi",
									"yihetuan_zhanyi",
									"yapianzhanzheng_zhanyi",
									"zhanyi_10th_map",
									"zhanyi_11th_map",
									"zhanyi_12th_map",
									"zhanyi_13th_map",
									"zhanyi_14th_map",}
	self.m_curBattleMapTable = nil								
	self.m_chapterId = 0		
	self.m_bigStageId = 0	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_big_battle_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] onEnter
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:onEnter()
    self.m_dituPanel["zy_dt_bg_image"]:setImage(g_game.g_resourceManager:getUiMap("zhanyi_ditu"))
    self.m_dituPanel["zy_dt_bg_image"]:setExtensionsTextureRect(cc.rect(0,0,960,640))
    self.m_dituPanel["zy_dt_bg_image"]:setSize(cc.size(960,640))

	self:setStopTouchEvent(true)
	
	self.m_downBottomTable = createzhanyi_ditu_bottom()
	local downPanel = self.m_downBottomTable["zhanyi_ditu_bottom"]
	self:appendComponent(downPanel)
	downPanel:setAnchorPoint(cc.p(0,1))
	downPanel:setPositionInContainer(cc.p(1,CONFIG_SCREEN_HEIGHT-65))
--	downPanel:setPositionInContainer(cc.p(-237,CONFIG_SCREEN_HEIGHT-65))
	
	self.m_dituPanel["zy_close_top_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] onExit
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:onExit()  
    self:unregisterNodeEvent()
    g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_NUM, self.event_updateUserPveNum)
   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] onCleanup
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:initAllComponent()
  
  local closeCallBack = function()
  	   self:deleteFromParent()
  	   send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
  end
  
  self.m_dituPanel["zy_close_top_button"]:addHandleOfcomponentEvent(closeCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
  self.event_updateUserPveNum = function()
		self:enterSmallBattle()
  end
  g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_PVE_LEVEL_NUM, self.event_updateUserPveNum)
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_small_battle_panel] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:deleteFromParent()
	local parent = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
	if parent ~= nil then
		parent:updateLastChapterFromServer()
		g_game.g_panelManager:removeUiPanel("zhanyi_ditu_bg")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] setChapterId
-- 设置 chapter id
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:setChapterId(chapterId)
	self.m_chapterId = chapterId
	
	local funcPre = "create"
	local functionName = funcPre .. self.m_smallBattleFuncTable[self.m_chapterId]
	
	self.m_curBattleMapTable = _G[functionName]()
	local mapPanel = self.m_curBattleMapTable[self.m_smallBattleFuncTable[self.m_chapterId]]
	
	self:appendComponent(mapPanel)
	mapPanel:setAnchorPoint(cc.p(0.5,0.5))
	mapPanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
	
	self:initBigBattle()
	
	local name = g_game.g_dictConfigManager:getChapterName(self.m_chapterId)
	self.m_downBottomTable["zy_name_label"]:setString(name)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] guideLinePveInitBigBattle
-- 新手指引 指向固定的 章节的某一战役
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:guideLinePveInitBigBattle(chapterId,stageId)
	local bigBattleDataTable = g_game.g_dictConfigManager:getChapterBigBattleArr(chapterId)
	local lastBigBattleId = stageId
	
	local unbattlePath = "batch_ui/zhandou_tubiao_weikaiqi.png"
	local inbattlePath = "batch_ui/zhandou_tubiao_kaiqi.png"
	local passbattlePath = "batch_ui/zhandou_tubiao_zhanling.png"
	
	if self.m_animations == nil then
		self.m_animations = {}	
		self.m_lockIcons = {}
		for i = 1, #bigBattleDataTable do
			self.m_animations[i] = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			self:appendComponent(self.m_animations[i])
			self.m_lockIcons[i] = fc.FExtensionsImage:create()
			self:appendComponent(self.m_lockIcons[i])
		end
	end

	local onFinish = function()
		self.m_animations[self.m_animationIndex]:setLoop(true)
		self.m_animations[self.m_animationIndex]:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[3])
	end
	
	for i = 1, #bigBattleDataTable do
		self.m_animations[i]:setSize(self.m_curBattleMapTable["small_battle_button"..i]:getSize())
		self.m_animations[i]:setAnchorPoint(cc.p(0.5,0.5))
		self.m_animations[i]:setPositionInContainer(self.m_curBattleMapTable["small_battle_button"..i]:getPositionInContainer())	
		self.m_animations[i]:setLoop(true)	
		self.m_animations[i]:setAnimationScale(1)
		self.m_animations[i]:setAnimationSpeedScale(0.3)
		self.m_lockIcons[i]:setVisible(false)
		if bigBattleDataTable[i][1] > lastBigBattleId then
			self.m_animations[i]:setVisible(false)
			self.m_lockIcons[i]:setImage(unbattlePath)
			self.m_lockIcons[i]:setSize(cc.size(71, 66))
			self.m_lockIcons[i]:setAnchorPoint(cc.p(0.5, 0.5))
			self.m_lockIcons[i]:setPositionInContainer(self.m_curBattleMapTable["small_battle_button"..i]:getPositionInContainer())
			self.m_lockIcons[i]:setVisible(true)
			self.m_curBattleMapTable["small_battle_button"..i]:setSize(cc.size(71,66))
		elseif bigBattleDataTable[i][1] == lastBigBattleId then
			self.m_animations[i]:setVisible(true)
			self.m_animationIndex = i
			self.m_curBattleMapTable["small_battle_button"..i]:setSize(cc.size(71,66))
			self.m_animations[i]:setLoop(false)	
			self.m_animations[i]:registeAnimationFinishCallback(onFinish)
			self.m_animations[i]:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[5])
		else
			self.m_animations[i]:setVisible(true)
			self.m_curBattleMapTable["small_battle_button"..i]:setSize(cc.size(50,75))
			self.m_animations[i]:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[4])
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] updateLastBigBattleFromServer
-- 更新big battle战役的状态
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:updateLastBigBattleFromServer()
	--last big battle id  从服务器接收  
	local bigBattleDataTable = g_game.g_dictConfigManager:getChapterBigBattleArr(self.m_chapterId)
--	local len = table.getn(bigBattleDataTable)
--	local lastBigBattleId = bigBattleDataTable[len][1]
	local lastBigBattleId = g_game.g_userInfoManager:getUserPveProgress()["stageId"]
	
	local unbattlePath = "batch_ui/zhandou_tubiao_weikaiqi.png"
	local inbattlePath = "batch_ui/zhandou_tubiao_kaiqi.png"
	local passbattlePath = "batch_ui/zhandou_tubiao_zhanling.png"
	
	if self.m_animations == nil then
		self.m_animations = {}	
		self.m_lockIcons = {}
		for i = 1, #bigBattleDataTable do
			self.m_animations[i] = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			self:appendComponent(self.m_animations[i])
			self.m_lockIcons[i] = fc.FExtensionsImage:create()
			self:appendComponent(self.m_lockIcons[i])
		end
	end

	local onFinish = function()
		self.m_animations[self.m_animationIndex]:setLoop(true)
		self.m_animations[self.m_animationIndex]:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[3])
	end
	
	for i = 1, #bigBattleDataTable do
		self.m_animations[i]:setSize(self.m_curBattleMapTable["small_battle_button"..i]:getSize())
		self.m_animations[i]:setAnchorPoint(cc.p(0.5,0.5))
		self.m_animations[i]:setPositionInContainer(self.m_curBattleMapTable["small_battle_button"..i]:getPositionInContainer())	
		self.m_animations[i]:setLoop(true)	
		self.m_animations[i]:setAnimationScale(1)
		self.m_animations[i]:setAnimationSpeedScale(0.3)
		self.m_lockIcons[i]:setVisible(false)
		if bigBattleDataTable[i][1] > lastBigBattleId then
			self.m_animations[i]:setVisible(false)
			--self.m_curBattleMapTable["small_battle_button"..i]:setButtonImage(unbattlePath)
			self.m_lockIcons[i]:setImage(unbattlePath)
			self.m_lockIcons[i]:setSize(cc.size(71, 66))
			self.m_lockIcons[i]:setAnchorPoint(cc.p(0.5, 0.5))
			self.m_lockIcons[i]:setPositionInContainer(self.m_curBattleMapTable["small_battle_button"..i]:getPositionInContainer())
			self.m_lockIcons[i]:setVisible(true)
			self.m_curBattleMapTable["small_battle_button"..i]:setSize(cc.size(71,66))
		elseif bigBattleDataTable[i][1] == lastBigBattleId then
			self.m_animations[i]:setVisible(true)
			self.m_animationIndex = i
			--self.m_curBattleMapTable["small_battle_button"..i]:setButtonImage("")
			self.m_curBattleMapTable["small_battle_button"..i]:setSize(cc.size(71,66))
			self.m_animations[i]:setLoop(false)	
			self.m_animations[i]:registeAnimationFinishCallback(onFinish)
			self.m_animations[i]:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[5])
		else
			self.m_animations[i]:setVisible(true)
			--self.m_curBattleMapTable["small_battle_button"..i]:setButtonImage("")
			self.m_curBattleMapTable["small_battle_button"..i]:setSize(cc.size(50,75))
			self.m_animations[i]:runAnimation(g_game.g_f_main_ui_effect.UI_JIE_MIAN[2], g_game.g_f_main_ui_effect.UI_JIE_MIAN[4])
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] initBigBattle
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:initBigBattle()
	
	--该table 1为当前选择大关卡 id  
	local bigBattleDataTable = g_game.g_dictConfigManager:getChapterBigBattleArr(self.m_chapterId)
	
	local n1 = g_game.g_dictConfigManager:getLanTextById(bigBattleDataTable[1][2])
	local n2 = g_game.g_dictConfigManager:getLanTextById(bigBattleDataTable[2][2])
	local n3 = g_game.g_dictConfigManager:getLanTextById(bigBattleDataTable[3][2])
	local n4 = g_game.g_dictConfigManager:getLanTextById(bigBattleDataTable[4][2])
	local n5 = g_game.g_dictConfigManager:getLanTextById(bigBattleDataTable[5][2])
	
	self.m_curBattleMapTable["small_battle_button_label1"]:setString(n1)
	self.m_curBattleMapTable["small_battle_button_label2"]:setString(n2)
	self.m_curBattleMapTable["small_battle_button_label3"]:setString(n3)
	self.m_curBattleMapTable["small_battle_button_label4"]:setString(n4)
	self.m_curBattleMapTable["small_battle_button_label5"]:setString(n5)
	
	self.m_curBattleMapTable["small_battle_button1"]:setTouchRectAdjust(15)
	self.m_curBattleMapTable["small_battle_button2"]:setTouchRectAdjust(15)
	self.m_curBattleMapTable["small_battle_button3"]:setTouchRectAdjust(15)
	self.m_curBattleMapTable["small_battle_button4"]:setTouchRectAdjust(15)
	self.m_curBattleMapTable["small_battle_button5"]:setTouchRectAdjust(15)
	
	local enterBigBattle1 = function()
    	self:enterBigBattleByIndex(bigBattleDataTable[1][1])
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    
  	self.m_curBattleMapTable["small_battle_button1"]:addHandleOfcomponentEvent(enterBigBattle1, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	local enterBigBattle2 = function()
    	self:enterBigBattleByIndex(bigBattleDataTable[2][1])
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    
  	self.m_curBattleMapTable["small_battle_button2"]:addHandleOfcomponentEvent(enterBigBattle2, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local enterBigBattle3 = function()
    	self:enterBigBattleByIndex(bigBattleDataTable[3][1])
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    
  	self.m_curBattleMapTable["small_battle_button3"]:addHandleOfcomponentEvent(enterBigBattle3, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local enterBigBattle4 = function()
    	self:enterBigBattleByIndex(bigBattleDataTable[4][1])
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    
  	self.m_curBattleMapTable["small_battle_button4"]:addHandleOfcomponentEvent(enterBigBattle4, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
    local enterBigBattle5 = function()
    	self:enterBigBattleByIndex(bigBattleDataTable[5][1])
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    
  	self.m_curBattleMapTable["small_battle_button5"]:addHandleOfcomponentEvent(enterBigBattle5, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:enterBigBattleByIndex(index)
	--index为大关卡id
	--self.m_chapterId 章节id
	--从服务器获取的 big battle id  用于测试
	--local bigBattleDataTable = g_game.g_dictConfigManager:getChapterBigBattleArr(self.m_chapterId)
	--local lastBigBattleId = bigBattleDataTable[5][1]
	
	local lastBigBattleId = g_game.g_userInfoManager:getUserPveProgress()["stageId"]
	
	if index > lastBigBattleId then
		print "cur big battle not open!"
		return
	end
	self.m_bigStageId = index
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
	g_game.g_userInfoManager:requestPveLevelsNum(self.m_chapterId,self.m_bigStageId)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_big_battle_panel] enterSmallBattle
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_big_battle_panel:enterSmallBattle()
	local smallBattlePanel = f_stage_small_battle_panel.static_create()
	smallBattlePanel:panelInitBeforePopup()    
	g_game.g_panelManager:showUiPanel(smallBattlePanel,"zhanyi_waikuang")
	
	smallBattlePanel:setSmallBattleData(self.m_chapterId,self.m_bigStageId)
	smallBattlePanel:updateLastSmallBattleFromServer()
end
