--[[
	继承自container panel, 用于显示连续登陆奖励
]]--

require("scripts.auto.auto_choujiang_rank_panel")
require("scripts.auto.auto_choujiang_rank_item")


f_choujiang_rank_panel = class("f_choujiang_rank_panel")
f_choujiang_rank_panel.__index = f_choujiang_rank_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_choujiang_rank_panel.static_create()
	local rewardTable = createchoujiang_rank_panel()
	local reward = rewardTable["choujiang_rank_panel"]

	local funTable = {}
	tolua.setpeer(reward, funTable)
	setmetatable(funTable, f_choujiang_rank_panel)

	reward.m_componentTable = rewardTable

	return reward
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:panelInitBeforePopup(datas)
	self:registerNodeEvent()
	
	self.m_datas = datas
	
	-- 关闭按钮
	local close = function()
		g_game.g_panelManager:removeUiPanel("choujiang_rank")
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["close_btn"]:addHandleOfcomponentEvent(close,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	self.m_componentTable["rp_list"]:setListInfo(10, 0, 0, 370, 35)
	self.m_componentTable["rp_list"]:enableClipping(true)
	
	self.m_componentTable["rp_leiji_number"]:setString("" .. self.m_datas["score"])
	if self.m_datas["score"] > 0 then
		self.m_componentTable["rp_jifen_number"]:setString("" .. self.m_datas["rank"])
	else
		self.m_componentTable["rp_jifen_number"]:setString("未上榜")
	end
	self:fillList()
end

function f_choujiang_rank_panel:fillList()

	local bg = true
	for i = 1, #self.m_datas["list"] do
		local data = self.m_datas["list"][i]
		local itemT = createchoujiang_rank_item()
		local item = itemT["choujiang_rank_item"]
		item:setSize(cc.size(370, 35))
		itemT["rank_label"]:setString("" .. i)
		itemT["name_label"]:setString(data["name"] .. "【" .. data["nianhao"] .. "】")
		itemT["jifen_label"]:setString("" .. data["score"])
		itemT["darkbg"]:setVisible(bg)
		itemT["lightBg"]:setVisible(not bg)
		bg = not bg
		self.m_componentTable["rp_list"]:appendComponent(item)
	end
end

--------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] registerNodeEvent
--------------------------------------------------------------
function f_choujiang_rank_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_choujiang_rank_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] onEnter
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:onEnter()
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] onExit
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] onCleanup
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_choujiang_rank_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_choujiang_rank_panel:initAllComponent()

end

