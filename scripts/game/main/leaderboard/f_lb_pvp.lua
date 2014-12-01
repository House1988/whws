--[[
	继承自container panel, 用于显示邮件列表
]]--

require("scripts.auto.auto_lb_pvppage")

local f_lb_pvp = class("f_lb_pvp", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_lb_pvp")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_lb_pvp] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_lb_pvp:ctor()    
    self:registerNodeEvent()   
    	
	self.m_datas = nil
	self.m_componentTable = nil
	self:setSize(cc.size(960, 640))
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_pvp] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_lb_pvp:onEnter() 
		self:initAllComponent()
end


function f_lb_pvp:onExit()    
    self:unregisterNodeEvent()
end

function f_lb_pvp:onEnterTransitionFinish()
end

function f_lb_pvp:onExitTransitionStart()
end

function f_lb_pvp:onCleanup()
end


function f_lb_pvp:registerNodeEvent(handler)
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

function f_lb_pvp:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_pvp] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lb_pvp:initAllComponent()
	self.m_componentTable = createlb_pvppage()
	self.mailPage = self.m_componentTable["lb_pvppage"]
	self.m_currentPage = 0
	self.m_maxPage = 0
	self.m_list = nil
	self.m_componentTable["page_num"]:setString("")
	
	local clickL = function()
		if self.m_currentPage > 1 then
			if self.m_type == 1 then
				g_game.g_userInfoManager:requestPvpLeaderboard((self.m_currentPage - 2) * 20 + 1)
			elseif self.m_type == 2 then
				g_game.g_userInfoManager:requestLevelRankLeaderboard((self.m_currentPage - 2) * 20 + 1)
			end
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	local clickR = function()
		if self.m_currentPage < self.m_maxPage then
			if self.m_type == 1 then
				g_game.g_userInfoManager:requestPvpLeaderboard(self.m_currentPage * 20 + 1)
			elseif self.m_type == 2 then
				g_game.g_userInfoManager:requestLevelRankLeaderboard(self.m_currentPage * 20 + 1)
			end
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	
	self.m_componentTable["left"]:addHandleOfcomponentEvent(clickL, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	self.m_componentTable["right"]:addHandleOfcomponentEvent(clickR, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

	
	self:appendComponent(self.mailPage)
	
	self.mailPage:setAnchorPoint(cc.p(0.5, 0.5))
	self.mailPage:setPositionInContainer(cc.p(480, 320))
	
	self.m_componentTable["pvpTitle"]:setVisible(false)
	self.m_componentTable["levelRankTitle"]:setVisible(false)
	self.m_componentTable["level"]:setVisible(false)
	self.m_componentTable["level_num"]:setVisible(false)

end

function f_lb_pvp:getLevelName(level)	
	return g_game.g_dictConfigManager:getPvelevelName(level)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_pvp] setData
-- 设置邮件信息
-------------------------------------------------------------------------------
function f_lb_pvp:setLevelData(data)	
	self.m_datas = data["rankList"]
	self.m_type = 2
	
	self.m_componentTable["pvpTitle"]:setVisible(false)
	self.m_componentTable["levelRankTitle"]:setVisible(true)
	self.m_componentTable["level"]:setVisible(true)
	self.m_componentTable["level_num"]:setVisible(true)
	
	local rank = data["selfRank"]
	if rank <= 0 or rank > 5000 then
		self.m_componentTable["rank_num"]:setString("未上榜")
	else
		self.m_componentTable["rank_num"]:setString("第" .. rank .. "名")
	end
	
	self.m_componentTable["level_num"]:setString(data["selfLevelNum"] .. "")
	
	if self.m_list ~= nil then
		self:deleteComponent(self.m_list)
	end
	
	self.m_list = fc.FContainerList:create(1)
    self.m_list:setSize(cc.size(854,338))
    self.m_list:setAnchorPoint(cc.p(0.5, 1))
    self:appendComponent(self.m_list)
    self.m_list:setPositionInContainer(cc.p(480,190))
    self.m_list:enableClipping(true)
    
    self.m_list:setListInfo(10, 0, 0, 854, 40)

	rank = data["startRank"] + 1
	self.m_currentPage = math.floor(rank / 20) + 1
	self.m_maxPage = math.ceil(data["listNum"] / 20)
	
	self.m_componentTable["page_num"]:setString(self.m_currentPage .. "/" .. self.m_maxPage)
	
	for i = 1, #self.m_datas do
		local item = require("scripts.game.main.leaderboard.f_lb_levelRank_item").new()
		item:setData(self.m_datas[i], rank, self:getLevelName(self.m_datas[i]["current"]))
		rank = rank + 1
		self.m_list:appendComponent(item)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_pvp] setData
-- 设置邮件信息
-------------------------------------------------------------------------------
function f_lb_pvp:setData(data)	
	self.m_datas = data["rankList"]
	self.m_type = 1
	
	self.m_componentTable["pvpTitle"]:setVisible(true)
	self.m_componentTable["levelRankTitle"]:setVisible(false)
	self.m_componentTable["level"]:setVisible(false)
	self.m_componentTable["level_num"]:setVisible(false)
	
	local rank = data["selfRank"]
	if rank <= 0 or rank > 5000 then
		self.m_componentTable["rank_num"]:setString("未上榜")
	else
		self.m_componentTable["rank_num"]:setString("第" .. rank .. "名")
	end
	if self.m_list ~= nil then
		self:deleteComponent(self.m_list)
	end
	
	self.m_list = fc.FContainerList:create(1)
    self.m_list:setSize(cc.size(854,338))
    self.m_list:setAnchorPoint(cc.p(0.5, 1))
    self:appendComponent(self.m_list)
    self.m_list:setPositionInContainer(cc.p(480,190))
    self.m_list:enableClipping(true)
    
    self.m_list:setListInfo(10, 0, 0, 854, 40)

	rank = data["startRank"] + 1
	self.m_currentPage = math.floor(rank / 20) + 1
	self.m_maxPage = math.ceil(data["listNum"] / 20)
	
	self.m_componentTable["page_num"]:setString(self.m_currentPage .. "/" .. self.m_maxPage)
	
	for i = 1, #self.m_datas do
		local item = require("scripts.game.main.leaderboard.f_lb_pvpItem").new()
		item:setData(self.m_datas[i], rank)
		rank = rank + 1
		self.m_list:appendComponent(item)
	end
end

return f_lb_pvp