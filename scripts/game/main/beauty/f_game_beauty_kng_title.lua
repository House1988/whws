require("scripts.auto.auto_kunninggong_dengji_card")
--[[--
	美女 title的 分类 扇子
--]]--
f_game_beauty_kng_title = class("f_game_beauty_kng_title")
f_game_beauty_kng_title.__index = f_game_beauty_kng_title

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_game_beauty_kng_title.static_create()
	local meinv_title_table = createkunninggong_dengji_card()
	local meinv_title = meinv_title_table["kunninggong_dengji_card"]

	local funTable = {}
	tolua.setpeer(meinv_title, funTable)
	setmetatable(funTable, f_game_beauty_kng_title)

	meinv_title.m_componentTable = meinv_title_table
	return meinv_title
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:panelInitBeforePopup()
	self.m_titleClickCallback = nil

	self.m_isClick = false
	self.m_isSelect = false
	self.m_titleIndex = 0
	
	self:registerNodeEvent()

	self.tableShanzi = {}
	self.tableShanzi[1] = "batch_ui/cheng_kunninggong.png"
	self.tableShanzi[2] = "batch_ui/zi_kunninggong.png"
	self.tableShanzi[3] = "batch_ui/zi_kunninggong.png"
	self.tableShanzi[4] = "batch_ui/lan_kunninggong.png"
	self.tableShanzi[5] = "batch_ui/lan_kunninggong.png"
	self.tableShanzi[6] = "batch_ui/lv_kunninggong.png"
	self.tableShanzi[7] = "batch_ui/lv_kunninggong.png"
	self.tableShanzi[8] = "batch_ui/bai_kunninggong.png"
end

function f_game_beauty_kng_title:setSelect(isSelect)
	self.m_isSelect = isSelect
	if self.m_animation == nil then
		self.m_animation = g_game.g_classFactory.newFLuaAnimationComponent("FAC")	
		self:appendComponent(self.m_animation)
		self.m_animation:setSize(cc.size(178, 84))
		self.m_animation:setAnchorPoint(cc.p(0.5,0.5))
		self.m_animation:setPositionInContainer(cc.p(89, 30))	
		self.m_animation:setLoop(true)	
		self.m_animation:setAnimationScale(1)
		self.m_animation:setAnimationSpeedScale(0.4)
		
	end
		
	self.m_animation:setVisible(isSelect)
	if self.m_isSelect then
		self.m_animation:runAnimation(g_game.g_f_main_ui_effect.UI_SHENG_ZHI[2], g_game.g_f_main_ui_effect.UI_SHENG_ZHI[3])
		self.m_titleClickCallback(self)
	else
		self.m_animation:animationPause()
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] setCardEventCallBack
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:setCardEventCallBack(callBack)
	self.m_titleClickCallback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_kng_title] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] onExit
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:initAllComponent()
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
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_isClick == true then
			self:setSelect(true)
			self.m_isClick = false
		end
	end
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
--	self.m_componentTable["kng_dj_card_wenzi_Image"]:setComponentZOrder(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] getChapterIndex
-- 获得beauty index
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:getTitleIndex()
	return self.m_titleIndex
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] setChapterIndex
-- 设置chapter index
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:setTitleIndex(index)
	self.m_titleIndex = index
	
	self:updateTitleData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_title] updateTitleData
-- 更新 beauty title 内容
-------------------------------------------------------------------------------
function f_game_beauty_kng_title:updateTitleData()
	--皇贵妃
	self.m_componentTable["hg_cf_shanzi_image"]:setImage(self.tableShanzi[self.m_titleIndex])
	local t = g_game.g_cefeng_words[self.m_titleIndex]
	for i = 1, 5 do
		self.m_componentTable["zi" .. i]:setVisible(false)
	end
	if #t == 1 then
		self.m_componentTable["zi2"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_componentTable["zi2"]:setVisible(true)
	elseif #t == 2 then
		self.m_componentTable["zi4"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_componentTable["zi4"]:setVisible(true)
		self.m_componentTable["zi5"]:setImage("batch_ui/" .. t[2] .. ".png")
		self.m_componentTable["zi5"]:setVisible(true)
	else
		self.m_componentTable["zi1"]:setImage("batch_ui/" .. t[1] .. ".png")
		self.m_componentTable["zi1"]:setVisible(true)
		self.m_componentTable["zi2"]:setImage("batch_ui/" .. t[2] .. ".png")
		self.m_componentTable["zi2"]:setVisible(true)
		self.m_componentTable["zi3"]:setImage("batch_ui/" .. t[3] .. ".png")
		self.m_componentTable["zi3"]:setVisible(true)
	end
end

