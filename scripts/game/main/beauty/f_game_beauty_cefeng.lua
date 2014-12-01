require("scripts.auto.auto_hougong_cefeng_bg")


--[[--
   册封  
--]]--
f_game_beauty_cefeng = class("f_game_beauty_cefeng")
f_game_beauty_cefeng.__index = f_game_beauty_cefeng

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------

function f_game_beauty_cefeng.static_create()
	local cefeng_table = createhougong_cefeng_bg()
	local cefeng_panel = cefeng_table["hougong_cefeng_bg"]
	  
	local funTable = {}
	tolua.setpeer(cefeng_panel, funTable)
	setmetatable(funTable, f_game_beauty_cefeng)
	
	cefeng_panel.m_cefeng_table = cefeng_table
	return cefeng_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_cefengTargetBeauty = nil
	
	self.m_cefengTitleList = nil
	self.m_cefengTitleIndex = 0
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] setCefengBeauty
-- 设置册封的 beauty
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:setCefengBeauty(beauty)
	self.m_cefengTargetBeauty = beauty
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] initCefengTitleList
-- 初始化册封title list
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:initCefengTitleList(beauty)
	if self.m_cefengTitleList == nil then
		self.m_cefengTitleList = require("scripts.game.main.beauty.f_game_beauty_cefeng_list").new()
		self.m_cefengTitleList:setTargetBeauty(self.m_cefengTargetBeauty)	
		self:appendComponent(self.m_cefengTitleList)
		self.m_cefengTitleList:setSize(cc.size(839,550))
		self.m_cefengTitleList:setListInfo(1, 10, 10, 244, 487)
		self.m_cefengTitleList:enableClipping(true)
		self.m_cefengTitleList:setAnchorPoint(cc.p(0,1))
		self.m_cefengTitleList:setPositionInContainer(cc.p(50, 120))
		
		local cefengCallback = function(titleIndex)
			self:sendCefengMessage(titleIndex)
		end
		self.m_cefengTitleList:setCefengCallBack(cefengCallback)		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] sendCefengMessage
-- 发送册封数据
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:sendCefengMessage(titleIndex)
	self.m_cefengTitleIndex = titleIndex
	
	local data = self.m_cefengTargetBeauty:getData()
	
	local getCostSilver = g_game.g_dictConfigManager:getTitleCostSilver(titleIndex)
	local getCostQinmidu = g_game.g_dictConfigManager:getTitleQinmidu(titleIndex)
	
	local userInfo = g_game.g_userInfoManager:getUserInfo()
	userInfo["silver"] = userInfo["silver"] - getCostSilver
	
	data["beautyTitle"] = titleIndex
		
	g_game.g_userInfoManager:requestPromoteBeauty(data["id"],data["beautyId"],titleIndex)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] updateCefengResult
-- 更新册封结果
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:updateCefengResult()
	g_game.g_panelManager:removeUiPanel("hougong_cefeng_bg")
	
	--播放音效
--	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENG)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] getTargetCefengTitleIndex
-- 获取给目标卡牌起的称号的id
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:getTargetCefengTitleIndex()
	return self.m_cefengTitleIndex
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] registerNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:registerNodeEvent(handler)
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
-- @function [parent=#f_game_beauty_cefeng] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] onEnter
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:onEnter()
  	self.m_cefeng_table["hg_cf_close_button"]:setTouchRectAdjust(g_game.RECT_OFFSET)
  	
	self:initAllComponent()
	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] onExit
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:onExit()  
  self:unregisterNodeEvent()
  g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefeng)
		
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] onExitTransitionStart
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] onCleanup
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:initAllComponent()
	self:setStopTouchEvent(true)
	
	local closeCefeng = function()
		self:deleteFromParent()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_cefeng_table["hg_cf_close_button"]:addHandleOfcomponentEvent(closeCefeng,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
	self.event_updateCefeng = function()
		self:updateCefengResult()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_CEFENG_BEAUTY, self.event_updateCefeng)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_cefeng] deleteFromParent
-- 从父节点删除
-------------------------------------------------------------------------------
function f_game_beauty_cefeng:deleteFromParent()
	g_game.g_panelManager:removeUiPanel("hougong_cefeng_bg")
end



