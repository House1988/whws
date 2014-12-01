--[[
	继承自container panel, 用于显示邮件列表
]]--

require("scripts.auto.auto_mailPageItem")
require("scripts.auto.auto_mailItemPvp")

local f_mailpageItem = class("f_mailpageItem", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_mailpageItem")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_mailpageItem:ctor()    
    self:registerNodeEvent()   
    	
	self.m_data = nil
	self.m_index = 0
	self.m_componentTable = nil
	self:setSize(cc.size(800, 125))
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_mailpageItem:onEnter() 
	

end


function f_mailpageItem:onExit()    
    self:unregisterNodeEvent()
end

function f_mailpageItem:onEnterTransitionFinish()
end

function f_mailpageItem:onExitTransitionStart()
end

function f_mailpageItem:onCleanup()
end


function f_mailpageItem:registerNodeEvent(handler)
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

function f_mailpageItem:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_mailpageItem:initAllComponent()	
	local btnClick = function()
		self:clickBtn()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	
	local btnHuifang = function()
		g_game.g_userInfoManager:requestReplay(self.m_data["mailID"], self.m_data["roleName"])
	end

	local btnShanchu = function()
		g_game.g_userInfoManager:requestDeleteMail(self.m_data["mailID"], self.m_type)
	end
	
	if self.m_type == 1 then
		self.m_componentTable = createmailPageItem()
		self.mailPage = self.m_componentTable["mailPageItem"]
		self.m_componentTable["accept_btn"]:addHandleOfcomponentEvent(btnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		self.m_componentTable["shanchu_btn"]:addHandleOfcomponentEvent(btnClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	elseif self.m_type == 2 then
		self.m_componentTable = createmailItemPvp()
		self.mailPage = self.m_componentTable["mailItemPvp"]
		self.m_componentTable["huifang_btn"]:addHandleOfcomponentEvent(btnHuifang, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		self.m_componentTable["shanchu_btn"]:addHandleOfcomponentEvent(btnShanchu, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	end	

	self:setSize(cc.size(800, 125))
	self:setAnchorPoint(cc.p(0.5, 0.5))
	
	self:appendComponent(self.mailPage)
	
	self.mailPage:setAnchorPoint(cc.p(0.5, 0.5))
	self.mailPage:setPositionInContainer(cc.p(400, 62.5))

end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] clickBtn
-- 按钮点击
-------------------------------------------------------------------------------
function f_mailpageItem:clickBtn()
	local data = self.m_data
	if data["hasConfirmedAm"] == 1 or #(data["attachment"]) <= 0 then
		g_game.g_userInfoManager:requestDeleteMail(data["mailID"], 1)
	else
		g_game.g_userInfoManager:requestDealMail(data["mailID"])
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] setData
-- 设置邮件信息
-------------------------------------------------------------------------------
function f_mailpageItem:setData(data, type)	
	self.m_data = data
	self.m_type = type
	self:initAllComponent()
	
	if type == 1 then
		self:setupXitong(data)
	elseif type == 2 then
		self:setupPvp(data)
	end
end

function f_mailpageItem:setupPvp(data)	
	self.m_componentTable["title"]:setString(data["roleName"])
	self.m_componentTable["title"]:setColor(cc.c3b(255,0,0))
	self.m_componentTable["baye_label"]:setVisible(false)
	self.m_componentTable["lueduo_label"]:setVisible(false)
	self.m_componentTable["title"]:setAlignment(0)
	self.m_componentTable["level"]:setString("等级 " .. data["level"])
	self.m_componentTable["level"]:setAlignment(0)
	if data["type"] == 0 then
		self.m_componentTable["baye_label"]:setVisible(true)
	elseif data["type"] == 1 then
		self.m_componentTable["lueduo_label"]:setVisible(true)
	end
	if data["status"] == 0 then
		self.m_componentTable["leftTop"]:setImageType(0)
		self.m_componentTable["sheng"]:setImageType(0)
		self.m_componentTable["sheng"]:setImage("batch_ui/sheng (2).png")
	else
		self.m_componentTable["leftTop"]:setImageType(2)
		self.m_componentTable["sheng"]:setImageType(2)
		self.m_componentTable["sheng"]:setImage("batch_ui/bai.png")
	end
	local str = ""
	if data["type"] == 0 then
		if data["status"] == 1 then
			if LANGUAGE_TYPE == 3 then
				str = "報！！！" .. data["roleName"] .. "帶兵犯境，我方將士誓死守衛，奈何實力不敵，敗下陣來……"
			else
				str = "报！！！" .. data["roleName"] .. "带兵犯境，我方将士誓死守卫，奈何实力不敌，败下阵来……"
			end
		else
			if LANGUAGE_TYPE == 3 then
				str = "報！！！" .. data["roleName"] .. "帶兵犯境，我方將士誓死守衛，對方潰不成軍，丟盔棄甲而逃了"
			else
				str = "报！！！" .. data["roleName"] .. "带兵犯境，我方将士誓死守卫，对方溃不成军，丢盔弃甲而逃了"
			end
		end
	elseif data["type"] == 1 then
		if data["status"] == 0 then
			if LANGUAGE_TYPE == 3 then
				str = "報！！！" .. data["roleName"] .. "帶兵犯境，妄想掠奪我朝寶物，我方將士誓死守衛，對方潰不成軍，無功而返！"
			else
				str = "报！！！" .. data["roleName"] .. "带兵犯境，妄想掠夺我朝宝物，我方将士誓死守卫，对方溃不成军，无功而返！"
			end
			
		elseif data["status"] == 2 then
			local name = g_game.g_dictConfigManager:getPieceName(data["chipId"])
			if LANGUAGE_TYPE == 3 then
				str = "報！！！" .. data["roleName"] .. "帶兵犯境，奪我寶物，我方將士措手不及，" .. name .. "被搶。請皇上重整旗鼓，再揚國威！！"
			else
				str = "报！！！" .. data["roleName"] .. "带兵犯境，夺我宝物，我方将士措手不及，" .. name .. "被抢。请皇上重整旗鼓，再扬国威！！"
			end
			
		else
			if LANGUAGE_TYPE == 3 then
				str = "報！！！" .. data["roleName"] .. "帶兵犯境，妄想掠奪我朝寶物，我方將士雖實力不敵，但拼死守衛了寶物，雖敗猶榮！"
			else
				str = "报！！！" .. data["roleName"] .. "带兵犯境，妄想掠夺我朝宝物，我方将士虽实力不敌，但拼死守卫了宝物，虽败犹荣！"
			end
		end
	end
	self.m_componentTable["contentText"]:setString(str)
	self.m_componentTable["timeText"]:setString(self:getLeftTimeText(data["timestamp"], g_game.g_userInfoManager.m_mailServerTime))
end

function f_mailpageItem:setupXitong(data)	
	local call = function()
	end
	
	self.m_componentTable["title"]:setString(data["sendUser"])
	self.m_componentTable["text"]:setComplexString(g_game.g_utilManager:getEncodeString(data["content"], g_game.g_f_text_default_color), call)
	self.m_componentTable["timeText"]:setString(self:getTimeText(data["timestamp"], g_game.g_userInfoManager.m_mailServerTime))
	local hasAttach = #(data["attachment"]) > 0
	self.m_componentTable["fujian_panel"]:setVisible(hasAttach)
	local confirm = data["hasConfirmedAm"] == 1 or not hasAttach
	self.m_componentTable["chuli"]:setVisible(confirm and hasAttach)
	if confirm then
		self.m_componentTable["accept_btn"]:setVisible(false)
		self.m_componentTable["shanchu_btn"]:setVisible(true)
	else
		self.m_componentTable["accept_btn"]:setVisible(true)
		self.m_componentTable["shanchu_btn"]:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] getTimeText
-- 获取邮件时间
-------------------------------------------------------------------------------
function f_mailpageItem:getLeftTimeText(stamp, now)
	local offset = 7 - (now - stamp) / 86400
	local str = string.format("%d天后删除", offset)
	return str
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] getTimeText
-- 获取邮件时间
-------------------------------------------------------------------------------
function f_mailpageItem:getTimeText(stamp, now)
	local stampT = os.date("*t",stamp)
	local nowT = os.date("*t",now)
	if nowT["year"] == stampT["year"] and nowT["month"] == stampT["month"] and nowT["day"] == stampT["day"] then
		return string.format("今天%02d:%02d", stampT["hour"], stampT["min"])
	else
		local diff = os.difftime(now, stamp)
		diff = math.ceil(diff / 86400)
		return diff .. "天前"
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] setIndex
-- 设置公告信息
-------------------------------------------------------------------------------
function f_mailpageItem:setIndex(index)	
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] setItemSelectClick
-- 设置公告选择回调
-------------------------------------------------------------------------------
function f_mailpageItem:setItemSelectClick(callback)
	self.m_item_select_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_mailpageItem] itemClick
-- 公告条目选择
-------------------------------------------------------------------------------
function f_mailpageItem:itemClick()	
	if self.m_item_select_callback then
		self.m_item_select_callback(self.m_index)
	end
end

return f_mailpageItem