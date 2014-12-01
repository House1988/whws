require("scripts.auto.auto_nanzhengbeitao_book")
--[[--
显示章节 界面
--]]--
f_stage_single_chapter = class("f_stage_single_chapter")
f_stage_single_chapter.__index = f_stage_single_chapter

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_stage_single_chapter.static_create()
	local nanzhengbeitao_bookTable = createnanzhengbeitao_book()
	local nanzhengbeitao_bookPanel = nanzhengbeitao_bookTable["nanzhengbeitao_book"]

	local funTable = {}
	tolua.setpeer(nanzhengbeitao_bookPanel, funTable)
	setmetatable(funTable, f_stage_single_chapter)

	nanzhengbeitao_bookPanel.m_componentTable = nanzhengbeitao_bookTable

	return nanzhengbeitao_bookPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] static_clone
-- 克隆对象
-------------------------------------------------------------------------------
function f_stage_single_chapter.static_clone(sigleChapter)
	local nanzhengbeitao_bookTable = createnanzhengbeitao_book()
	local nanzhengbeitao_bookPanel = nanzhengbeitao_bookTable["nanzhengbeitao_book"]

	local funTable = {}
	tolua.setpeer(nanzhengbeitao_bookPanel, funTable)
	setmetatable(funTable, f_stage_single_chapter)

	nanzhengbeitao_bookPanel.m_componentTable = nanzhengbeitao_bookTable
	
	--新手指引 非精英副本
	nanzhengbeitao_bookPanel:isEliteChapter(sigleChapter.m_isElite)
	nanzhengbeitao_bookPanel:panelInitBeforePopup()
	nanzhengbeitao_bookPanel:setChapterIndex(sigleChapter.m_chapterIndex)
	nanzhengbeitao_bookPanel:setChapterState(sigleChapter.m_chapterState)
	return nanzhengbeitao_bookPanel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_stage_single_chapter:panelInitBeforePopup()

	self.m_chapterIndex = 0
	self.m_chapterData = nil

	self.ALREADY_PASS = 1 --已通过
	self.UN_OPEN = 2-- 未开启
	self.IN_WAR = 3--正在打的副本

	self.m_chapterState = self.UN_OPEN

	self.m_isClick = false
	self.m_isSelect = false
	self.m_remove_callback = nil
	self.m_chapterClickCallback = nil

	self:registerNodeEvent()
	self.m_isElite = false
	
	self.m_animSelect = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] isEliteChapter
-------------------------------------------------------------------------------
function f_stage_single_chapter:isEliteChapter(isElite)
	self.m_isElite = isElite
	if self.m_isElite then
		self.m_componentTable["special_tag"]:setVisible(true)
	else
		self.m_componentTable["special_tag"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] getIsElite
-------------------------------------------------------------------------------
function f_stage_single_chapter:getIsElite()
	return self.m_isElite
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] registerNodeEvent
-------------------------------------------------------------------------------
function f_stage_single_chapter:registerNodeEvent(handler)
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


------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapter_panel] setChapterState
-- 设置chapter的state
-------------------------------------------------------------------------------
function f_stage_single_chapter:setChapterState(state)
	self.m_chapterState = state
	self:updateChapterState()
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapter_panel] getChapterState
-- 获得chapter的state
-------------------------------------------------------------------------------
function f_stage_single_chapter:getChapterState(state)
	return self.m_chapterState
end

------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapter_panel] updateChapterState
-- 更新chapter各状态
-------------------------------------------------------------------------------
function f_stage_single_chapter:updateChapterState()
	if self.m_chapterState == self.ALREADY_PASS then
		if self.m_isElite then
			self.m_componentTable["nzbt_book_tongguan_image"]:setVisible(false)
		else
			self.m_componentTable["nzbt_book_tongguan_image"]:setVisible(true)
		end
		self.m_componentTable["nzbt_book_weikaiqi_image"]:setVisible(false)
	elseif self.m_chapterState == self.UN_OPEN then
		self.m_componentTable["nzbt_book_weikaiqi_image"]:setVisible(true)
		self.m_componentTable["nzbt_book_weikaiqi_image"]:setImageType(2)
		self.m_componentTable["nzbt_book_bg_image"]:setImageType(2)
		if self.m_componentTable["special_tag"]:isVisible() then 
		   self.m_componentTable["special_tag"]:setImageType(2)
		end
		self.m_componentTable["nzbt_book_label"]:setColor(cc.c3b(103,101,96))
		self.m_componentTable["nzbt_book_tongguan_image"]:setVisible(false)
	elseif self.m_chapterState == self.IN_WAR  then
		self.m_componentTable["nzbt_book_weikaiqi_image"]:setVisible(false)
		self.m_componentTable["nzbt_book_tongguan_image"]:setVisible(false)
		
		self.m_animSelect = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self:appendComponent(self.m_animSelect)
		self.m_animSelect:setPositionInContainer(cc.p(168/2-8,238/2+2))
		self.m_animSelect:setLoop(true)
		self.m_animSelect:runAnimation(g_game.g_f_main_ui_effect.GUANQIA_EFFECT[2], g_game.g_f_main_ui_effect.GUANQIA_EFFECT[4])
	else
		print "chapter state error"
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] setChapterIndex
-- 设置chapter index
-------------------------------------------------------------------------------
function f_stage_single_chapter:setChapterIndex(index)
	self.m_chapterIndex = index

	self:updateChapterData()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] updateChapterData
-- 更新 chapter内容
-------------------------------------------------------------------------------
function f_stage_single_chapter:updateChapterData()
	local name = g_game.g_dictConfigManager:getChapterName(self.m_chapterIndex)	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["nzbt_book_label"]:setScale(0.8)
	end
	self.m_componentTable["nzbt_book_label"]:setVerString(name)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_chapter_panel_list] updateLastChapter
-- 更新从服务器传过来的上一次的 chapter状态
-------------------------------------------------------------------------------
function f_stage_single_chapter:updateLastChapter(chapterId)
	--获取服务器该副本状态
	
	if self.m_chapterIndex == chapterId then
		self:setChapterState(self.IN_WAR)
	elseif self.m_chapterIndex > chapterId then
		self:setChapterState(self.UN_OPEN)
	else
		self:setChapterState(self.ALREADY_PASS)
	end
	
end
-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] getChapterIndex
-- 设置chapter index
-------------------------------------------------------------------------------
function f_stage_single_chapter:getChapterIndex()
	return self.m_chapterIndex
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_stage_single_chapter:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] onEnter
-------------------------------------------------------------------------------
function f_stage_single_chapter:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] onExit
-------------------------------------------------------------------------------
function f_stage_single_chapter:onExit()
	if self.m_remove_callback ~= nil then
		self.m_remove_callback(self)
	end
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_stage_single_chapter:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] onExitTransitionStart
-------------------------------------------------------------------------------
function f_stage_single_chapter:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_card_genghuanzhenrong_card] onCleanup
-------------------------------------------------------------------------------
function f_stage_single_chapter:onCleanup()
end


-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_stage_single_chapter:initAllComponent()
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
		if self.m_isClick == true then
			self:setSelect(true)
			self.m_isClick = false
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end


function f_stage_single_chapter:setSelect(isSelect)
	self.m_isSelect = isSelect

	if self.m_isSelect then
		if self.m_chapterState == self.UN_OPEN then
			print ("not open ,cant press")
		else
			if self.m_chapterClickCallback then
				self.m_chapterClickCallback(self)
			end
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] setRemoveCallback
-- 设置美女数据从列表中移除的回调
-------------------------------------------------------------------------------
function f_stage_single_chapter:setRemoveCallback(removeCallback)
	self.m_remove_callback = removeCallback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_stage_single_chapter] setChapterClickCallback
-------------------------------------------------------------------------------
function f_stage_single_chapter:setChapterClickCallback(callBack)
	self.m_chapterClickCallback = callBack
end

