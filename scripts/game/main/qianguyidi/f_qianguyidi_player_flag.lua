require("scripts.auto.auto_qgyd_flag")
--[[--
	pvp 玩家旗子
--]]--
f_qianguyidi_player_flag = class("f_qianguyidi_player_flag")
f_qianguyidi_player_flag.__index = f_qianguyidi_player_flag


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] static_clone
-- 新手指引，静态克隆方法，用于复制指定pvp对象
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag.static_clone(cloneObj)
	local pvp_cardTable = createqgyd_flag()
	local pvp_panel = pvp_cardTable["qgyd_flag"]

	local funTable = {}
	tolua.setpeer(pvp_panel, funTable)
	setmetatable(funTable, f_qianguyidi_player_flag)
	
	pvp_panel:panelInitBeforePopup()
	pvp_panel.m_componentTable = pvp_cardTable
	pvp_panel:setFlagData(cloneObj.m_data)
	
	return pvp_panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag.static_create()
	local pvp_cardTable = createqgyd_flag()
	local pvp_panel = pvp_cardTable["qgyd_flag"]

	local funTable = {}
	tolua.setpeer(pvp_panel, funTable)
	setmetatable(funTable, f_qianguyidi_player_flag)

	pvp_panel.m_componentTable = pvp_cardTable

	return pvp_panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] setFlagData
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:setFlagData(data)
	self.m_data = data
	
	--创建玩家名字的首字母label	
	local diyi_flag_name_label = fc.FLabel:createSystemFont()
    diyi_flag_name_label:setAnchorPoint(cc.p(0.5,0.5))
    diyi_flag_name_label:setColor(cc.c3b(0, 0, 0))
    self.m_componentTable["diyi_flag_image"]:appendComponent(diyi_flag_name_label)
    diyi_flag_name_label:setFontSize(80)
    diyi_flag_name_label:setString(string.getHybridChar(data["name"], 1))
    diyi_flag_name_label:setComponentZOrder(10000)
    diyi_flag_name_label:setPositionInContainer(cc.p(103,95))
    self.m_componentTable["diyi_flag_name_label"] = diyi_flag_name_label
    
--	local diyi_flag_name_label = cc.LabelTTF:create(string.getHybridChar(data["name"], 1), "", 80)
--	diyi_flag_name_label:setAnchorPoint(cc.p(0.5,0.5))
--	diyi_flag_name_label:setColor(cc.c3b(0,0,0))
--	self.m_componentTable["diyi_flag_image"]:addChild(diyi_flag_name_label)
--	diyi_flag_name_label:setComponentZOrder(10000)
--	diyi_flag_name_label:setPosition(cc.p(103,131))
--	self.m_componentTable["diyi_flag_name_label"] = diyi_flag_name_label
	
	local diyi_flag_paiming_label = fc.FLabel:createBMFont()
    diyi_flag_paiming_label:setSize(cc.size(50,25))
    diyi_flag_paiming_label:setAnchorPoint(cc.p(0.5,0.5))
    diyi_flag_paiming_label:setFontSize(20)
    diyi_flag_paiming_label:setString("第"..data["rank"].."名")
    diyi_flag_paiming_label:setColor(cc.c3b(0,0,0))
   	self.m_componentTable["diyi_flag_image"]:addChild(diyi_flag_paiming_label)
    diyi_flag_paiming_label:setPosition(cc.p(108,227))
    self.m_componentTable["diyi_flag_paiming_label"] = diyi_flag_paiming_label
	
	if data["rank"] == 1 then
		self.m_componentTable["diyi_flag_image"]:setButtonImage("nobatch/diyiming_qianguyidi.png")
		self.m_componentTable["diyi_flag_image"]:setSize(cc.size(215,240))
	elseif data["rank"] == 2 then
		self.m_componentTable["diyi_flag_image"]:setButtonImage("nobatch/dierming_qianguyidi.png")
		self.m_componentTable["diyi_flag_image"]:setSize(cc.size(215,240))
	elseif data["rank"] ==  3 then
		self.m_componentTable["diyi_flag_image"]:setButtonImage("nobatch/disanming_disanming.png")
		self.m_componentTable["diyi_flag_image"]:setSize(cc.size(215,240))
	else
		self.m_componentTable["diyi_flag_image"]:setButtonImage("nobatch/putongqizi_qianguyidi.png")
		self.m_componentTable["diyi_flag_image"]:setSize(cc.size(215,240))
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:panelInitBeforePopup()
	self.m_data = nil
	self.m_clickCallBack = nil
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] registerNodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:registerNodeEvent(handler)
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
-- @function [parent=#f_qianguyidi_player_flag] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] onEnter
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:onEnter()
	self:initAllComponent()
	
	--发送请求  玩家阵容数据
	local requestPlayerDataCallBack = function()
		if self.m_clickCallBack then
			self.m_clickCallBack(self.m_data)
		end
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	self.m_componentTable["diyi_flag_image"]:addHandleOfcomponentEvent(requestPlayerDataCallBack,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
		
end


-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] setClickCallBack
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:setClickCallBack(callback)
	self.m_clickCallBack = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] onExit
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:onExit()
	self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] onExitTransitionStart
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] onCleanup
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_qianguyidi_player_flag] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_qianguyidi_player_flag:initAllComponent()
end

