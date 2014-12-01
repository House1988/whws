require("scripts.auto.auto_nanzhengbeitao_content")
require("scripts.game.main.stage.f_stage_single_chapter")
require("scripts.game.main.stage.f_stage_big_battle_panel")
require("scripts.game.main.stage.f_stage_elite_stage")
require ("scripts.auto.auto_nanzhengbeitao_title")

--[[--
   章节
--]]--
f_stage_chapters = class("f_stage_chapters")
f_stage_chapters.__index = f_stage_chapters

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_stage_chapters.static_create()
	local nanzhengbeitao_titleTable = createnanzhengbeitao_title()
	local nanzhengbeitao_titlePanel = nanzhengbeitao_titleTable["nanzhengbeitao_title"]
	  
	local funTable = {}
	tolua.setpeer(nanzhengbeitao_titlePanel, funTable)
	setmetatable(funTable, f_stage_chapters)
	
	nanzhengbeitao_titlePanel.m_nanzhengbeitao_titleTable = nanzhengbeitao_titleTable
	return nanzhengbeitao_titlePanel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_chapters:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_total_pages	= 0	
	self.m_item_count	= 0
	
	self.m_page_container = nil
	self.m_item_array	= {}
	
	self.COL			= 4
	self.ROW			= 2
	
	self.m_selectChapter = nil
	
	self.m_contentTable = nil
	
	--是否是精英副本
	self.m_isElite = false
	self.m_panelIndex = 0
	self.m_pageRadioBtnArr = {}
	
	self.m_guideLineChapter = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_chapters:registerNodeEvent(handler)
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
-- @function [parent=#f_stage_chapters] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_chapters:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] onEnter
-------------------------------------------------------------------------------
function f_stage_chapters:onEnter()
	self:setStopTouchEvent(true)
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.GUANQIA_EFFECT[1])
	
	self.m_contentTable  = createnanzhengbeitao_content()
	local contentPanel = self.m_contentTable["nanzhengbeitao_content"]
	self:appendComponent(contentPanel)
	contentPanel:setAnchorPoint(cc.p(0.5,0.5))
	contentPanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
	
	self.m_nanzhengbeitao_titleTable["nzbt_title__close_image"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	
	self.m_pageRadioBtnArr[1] = self.m_nanzhengbeitao_titleTable["normal_pve"] --pve
   	self.m_pageRadioBtnArr[2] = self.m_nanzhengbeitao_titleTable["special_pve"] --精英副本
	
	self:initAllComponent()
	--发送播放选择关卡音乐事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_XUANGUAN)
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_BATTLE_SELECT)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] updatePagePanel
-- 更新每个切页 界面
-------------------------------------------------------------------------------
function f_stage_chapters:updatePagePanel()
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
		self.m_isElite = false
		self.m_contentTable["tips_label"]:setVisible(false)
		self.m_contentTable["elite_challenge_num"]:setVisible(false)
	else
		self.m_isElite = true
		self.m_contentTable["tips_label"]:setVisible(true)
		self.m_contentTable["elite_challenge_num"]:setVisible(true)
		local remainCount = g_game.g_userInfoManager:getUserPveProgress()["remainCount"]
		if LANGUAGE_TYPE == 3 then
			self.m_contentTable["elite_challenge_num"]:setString("今日剩餘挑戰次數"..remainCount.."/"..g_game.MAX_ELITE_CHALLENGE_NUM)		
		else
			self.m_contentTable["elite_challenge_num"]:setString("今日剩余挑战次数"..remainCount.."/"..g_game.MAX_ELITE_CHALLENGE_NUM)
		end
	end
	self:initAllChapters()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] onExit
-------------------------------------------------------------------------------
function f_stage_chapters:onExit()  
  self:unregisterNodeEvent()
  g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.GUANQIA_EFFECT[1])
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_chapters:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_chapters:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] onCleanup
-------------------------------------------------------------------------------
function f_stage_chapters:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] xiangqianClick
-- 向前按钮点击
-------------------------------------------------------------------------------
function f_stage_chapters:xiangqianClick()
	self.m_page_container:showPrePage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] xianghouClick
-- 向后按钮点击
-------------------------------------------------------------------------------
function f_stage_chapters:xianghouClick()
	self.m_page_container:showNextPage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_chapters:initAllComponent()
	
	local normal = function()
		self:updateLastChapterFromServer()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[1]:addHandleOfcomponentEvent(normal,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local special = function()
--		local userLv = g_game.g_userInfoManager:getLevel()
--		if userLv < g_game.OPEN_ELITE_LV then
--			g_game.g_utilManager:showMsg(g_game.OPEN_ELITE_LV.."级开启。挑战精英BOSS，拿丰厚奖励！")
--			self.m_pageRadioBtnArr[2]:setIsEnabled(false)
--			self.m_pageRadioBtnArr[2]:setRadioButtonState(2)
--		else
			self:updateLastEliteChapterFromServer()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_SECOND_GUIDELINES_OPEN_ELITE)
--		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN)
	end
	self.m_pageRadioBtnArr[2]:addHandleOfcomponentEvent(special,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	 
	--点击选择向前按钮的点击事件
	local xiangqianClick = function()
		self:xiangqianClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_contentTable["nzbt_content_pre_button"]:addHandleOfcomponentEvent(xiangqianClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	--点击选择向后按钮的点击事件
	local xianghouClick = function()
		self:xianghouClick()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE)
	end
	self.m_contentTable["nzbt_content_next_button"]:addHandleOfcomponentEvent(xianghouClick,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	 
	 
   local closeCallback = function()
   		self:closeCurrnetPanel()
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_RELEASE_UNUSED_TEXTURE)
   		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
   end
   
   self.m_nanzhengbeitao_titleTable["nzbt_title__close_image"]:addHandleOfcomponentEvent(closeCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] initAllChapters
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_chapters:initAllChapters()	
	self.m_item_array = {}
	if self.m_page_container ~= nil then
		self:deleteComponent(self.m_page_container)
	end
	self.m_page_container = nil
	
	local maxChapter = g_game.g_dictConfigManager:getChapterNum()
	local chapterId = 0
	
	if  not g_game.g_utilManager:allGuidelinesIsFinish() then
		if self.m_guideLineChapter ~= 0 then
			chapterId = self.m_guideLineChapter
		else
			chapterId = g_game.g_userInfoManager:getUserPveProgress()["areaId"]		
		end
	else
		if self.m_isElite then
			chapterId = g_game.g_userInfoManager:getUserPveProgress()["eliteAreaId"]
		else
			chapterId = g_game.g_userInfoManager:getUserPveProgress()["areaId"]
		end
	end
	
	self.m_item_count = chapterId + 1
	if chapterId + 1 >= maxChapter then
		self.m_item_count = maxChapter
	end
	
	self.m_total_pages = math.ceil(self.m_item_count / (self.COL * self.ROW))
	
	self.m_page_container = fc.FContainerPage:create(1)
	self:appendComponent(self.m_page_container)
	self.m_page_container:setSize(cc.size(875,620))
	self.m_page_container:setAnchorPoint(cc.p(0,1))
	self.m_page_container:setPositionInContainer(cc.p(42,74))
    self.m_page_container:setStopTouchEvent(true) 
    self.m_page_container:enableClipping(true)
	
	local load = function(pageIndex)
    	self:loadPageData(pageIndex)
    end      
    self.m_page_container:registLoadPageCallback(load)
    
    self.m_page_container:setPageInfo(self.m_item_count, self.ROW, self.COL,28, 37, 168,238)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] loadPageData
-- 加载指定页数据
-------------------------------------------------------------------------------
function f_stage_chapters:loadPageData(pageIndex)	
	if pageIndex < 0 then
		return 
	end	
	if pageIndex > self.m_total_pages then
		return
	end
	
	if not self.m_page_container:needLoadPage(pageIndex) then
		return
	end
		
	local chapterSelect = function(item)
		self:selectChapterEvent(item)
	end
	
	local removeItem = function(item)
		self:removeItem(item)
	end
	
	local startIndex = (pageIndex-1) * (self.COL * self.ROW) + 1
	local endIndex = startIndex + (self.COL * self.ROW) - 1
	
	for i = startIndex, endIndex do
		if self.m_item_count >= i then
			local chapter = f_stage_single_chapter.static_create()
			chapter:panelInitBeforePopup()
			chapter:setSize(cc.size(168,238))
			self.m_page_container:addComponentToPage(chapter, pageIndex)
			chapter:setChapterIndex(i)
			
			chapter:setRemoveCallback(removeItem)
			chapter:setChapterClickCallback(chapterSelect)
			chapter:isEliteChapter(self.m_isElite)
			
			if i == 1 then
				self.m_selectChapter = chapter
			end
			
			table.insert(self.m_item_array, chapter)
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] removeItem
-- 删除
-------------------------------------------------------------------------------
function f_stage_chapters:removeItem(item)
	local index = item:getChapterIndex()
	
	for i = 1, #self.m_item_array do
		if index == self.m_item_array[i]:getChapterIndex() then
			table.remove(self.m_item_array, i)
			break
		end	
	end		
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] selectChapterEvent
-- 更新选中 章节
-------------------------------------------------------------------------------
function f_stage_chapters:selectChapterEvent(item)
	self.m_selectChapter = item
	
	local chapterIndex = self.m_selectChapter:getChapterIndex()
	
	if item:getIsElite() then
		self:showSelelctEliteChapter(chapterIndex)	
	else
	    self:showSelectChapter(chapterIndex)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] showSelelctEliteChapter
-- 显示精英副本界面
-------------------------------------------------------------------------------
function f_stage_chapters:showSelelctEliteChapter(index)
	local eliteStage = f_stage_elite_stage.static_create()
    eliteStage:panelInitBeforePopup()
	g_game.g_panelManager:showUiPanel(eliteStage,"elite_stage")
	eliteStage:setChapterId(index)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] showSelectChapter
-- 显示pve副本界面
-------------------------------------------------------------------------------
function f_stage_chapters:showSelectChapter(index)
	local bigBattlePanel = g_game.g_panelManager:getUiPanel("zhanyi_ditu_bg")
	if bigBattlePanel ~= nil then
		return
	end

    bigBattlePanel = f_stage_big_battle_panel.static_create()
	bigBattlePanel:panelInitBeforePopup()    
	g_game.g_panelManager:showUiPanel(bigBattlePanel,"zhanyi_ditu_bg")	
	bigBattlePanel:setChapterId(index)
	bigBattlePanel:updateLastBigBattleFromServer()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] guideLinePveInitChapter
-- 用于新手指引按某一章节开启
-------------------------------------------------------------------------------
function f_stage_chapters:guideLinePveInitChapter(id)
	self.m_panelIndex = 1
	self.m_guideLineChapter = id
	self:updatePagePanel()
	
	for i = 1, #self.m_item_array do
		self.m_item_array[i]:updateLastChapter(id)
	end
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] updateLastChapterFromServer
-- 用于更新服务器传递来的  上次打的最后一个章节 id
-------------------------------------------------------------------------------
function f_stage_chapters:updateLastChapterFromServer()
	self.m_panelIndex = 1
	self:updatePagePanel()
	
	local chapterId = g_game.g_userInfoManager:getUserPveProgress()["areaId"]
	
	for i = 1, #self.m_item_array do
		self.m_item_array[i]:updateLastChapter(chapterId)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] updateLastEliteChapterFromServer
-- 用于更新服务器传递来的  上次打的最后一个精英副本 章节 id
-------------------------------------------------------------------------------
function f_stage_chapters:updateLastEliteChapterFromServer()
	self.m_panelIndex = 2
	self:updatePagePanel()
	
	local chapterId = g_game.g_userInfoManager:getUserPveProgress()["eliteAreaId"]
	
	for i = 1, #self.m_item_array do
		self.m_item_array[i]:updateLastChapter(chapterId)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapters] closeCurrnetPanel
-- 删除此界面
-------------------------------------------------------------------------------

function f_stage_chapters:closeCurrnetPanel()
    g_game.g_panelManager:removeUiPanel("nanzhengbeitao_title")
    
	--发送播放主场景音乐事件
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY)
end