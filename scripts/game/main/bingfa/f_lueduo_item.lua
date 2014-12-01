--[[
	继承自container panel, 用于显示碎片列表
]]--

require("scripts.auto.auto_LueduoItem")

local f_lueduo_item = class("f_lueduo_item", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_lueduo_item")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_item] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_lueduo_item:ctor()    
    self:registerNodeEvent()   
    
	self.m_data = nil
	self.m_index = 0
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_item] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_lueduo_item:onEnter() 
end


function f_lueduo_item:onExit()   
    self:unregisterNodeEvent()
end

function f_lueduo_item:onEnterTransitionFinish()
end

function f_lueduo_item:onExitTransitionStart()
end

function f_lueduo_item:onCleanup()
end


function f_lueduo_item:registerNodeEvent(handler)
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

function f_lueduo_item:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lueduo_item:initAllComponent()	
	self:setSize(cc.size(850,140))
	local gonggaoItemTable = createLueduoItem()
	self.m_item = gonggaoItemTable["LueduoItem"]	
	self.m_componentTable = gonggaoItemTable
	self:appendComponent(self.m_item)
	self.m_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_item:setPositionInContainer(cc.p(425, 70))
	
	local click = function()		
		local userJunling = g_game.g_userInfoManager.m_user_info["military"]
		
		if userJunling <= 100 then
			g_game.g_utilManager:popupQuickBuyOrUse(g_game.g_f_quick_type.QUICK_TYPE_MILITARY)
		else
			g_game.g_userInfoManager:requestPvpLueduo(self.m_data["index"])
		end
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self.m_componentTable["btn"]:addHandleOfcomponentEvent(click, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lueduo_item] setData
-- 设置公告信息
-------------------------------------------------------------------------------
function f_lueduo_item:setData(data)	
	self.m_data = data

	self.m_componentTable["levelText"]:setString(data["level"])
	self.m_componentTable["nameText"]:setString(data["name"])
	self.m_componentTable["nianhaoText"]:setString(data["nianhao"])

	for i = 1, 4 do
		if i <= #data["battle"] then
			self.m_componentTable["frame" .. i]:setVisible(true)
			self.m_componentTable["icon" .. i]:setVisible(true)
			local id = data["battle"][i]["cardId"]
			local star = g_game.g_dictConfigManager:getCardQuality(id)
			self.m_componentTable["frame" .. i]:setImage(g_game.g_f_quality_image[star])
			local image = g_game.g_dictConfigManager:getCardResource(id)
			self.m_componentTable["icon" .. i]:setImage(g_game.g_resourceManager:getCardHead(image))
			self.m_componentTable["icon" .. i]:setExtensionsTextureRect(cc.rect(0, 0, 90, 90))
		else
			self.m_componentTable["frame" .. i]:setVisible(false)
			self.m_componentTable["icon" .. i]:setVisible(false)
		end
	end
end


return f_lueduo_item