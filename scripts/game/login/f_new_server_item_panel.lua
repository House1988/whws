--[[
	继承自container panel, 用于显示服务器列表项
]]--

require("scripts.auto.auto_login_xuanfu_tiao_new")

local f_new_server_item_panel = class("f_new_server_item_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_new_server_item_panel")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_new_server_item_panel:ctor()    
    self:registerNodeEvent()   
    
	self:setSize(cc.size(372, 46))	
	
	self.m_data = nil
	self.m_index = 0
	self.m_item_select_callback = nil
		
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_new_server_item_panel:onEnter() 
	
end


function f_new_server_item_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_new_server_item_panel:onEnterTransitionFinish()
end

function f_new_server_item_panel:onExitTransitionStart()
end

function f_new_server_item_panel:onCleanup()
end


function f_new_server_item_panel:registerNodeEvent(handler)
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

function f_new_server_item_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] setSelect
-- 设置选中状态
-------------------------------------------------------------------------------
function f_new_server_item_panel:setSelect(isSelect)	
	if isSelect then
		self.m_componentTable["login_xf_t_xuanzhong"]:setVisible(true)
		self.m_componentTable["login_xf_t_weixuanzhong"]:setVisible(false)
	else
		self.m_componentTable["login_xf_t_xuanzhong"]:setVisible(false)
		self.m_componentTable["login_xf_t_weixuanzhong"]:setVisible(true)
	end
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_new_server_item_panel:initAllComponent()	
	local serverItemPanel_table = createlogin_xuanfu_tiao_new()
	self.m_server_list_item = serverItemPanel_table["login_xuanfu_tiao_new"]	
	self.m_componentTable = serverItemPanel_table
	
	self:appendComponent(self.m_server_list_item)
	
	self.m_server_list_item:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_server_list_item:setPositionInContainer(cc.p(372/2, 46/2))
	
	serverItemPanel_table["login_xf_t_xuanzhong"]:setVisible(false)
	
	--注册touch回调函数
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
			self:itemClick()			
			self.m_isClick = false
		end	
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end	
	self:addHandleOfcomponentEvent(downCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
end


-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] setData
-- 设置服务器信息
-------------------------------------------------------------------------------
function f_new_server_item_panel:setData(data)	
	self.m_data = data
	
	self.m_componentTable["login_xf_t_fuwuqi_name"]:setString(self.m_data["name"])
	
	if self.m_data["status"] == 2 then
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setVisible(true)
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setImage("batch_ui/fuwuqitubiao_xin.png")
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setSize(cc.size(32,41))
	elseif self.m_data["status"] == 3 then
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setVisible(true)
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setImage("batch_ui/fuwuqitubiao_re.png")
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setSize(cc.size(32,41))
	elseif self.m_data["status"] == 1 then
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setVisible(false)
	elseif self.m_data["status"] == 0 then
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setVisible(false)
	else
		self.m_componentTable["login_xf_t_fuwuqi_state"]:setVisible(false)
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] setIndex
-- 设置服务器信息
-------------------------------------------------------------------------------
function f_new_server_item_panel:setIndex(index)	
	self.m_index = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] setItemSelectClick
-- 设置服务器选择回调
-------------------------------------------------------------------------------
function f_new_server_item_panel:setItemSelectClick(callback)
	self.m_item_select_callback = callback
end

-------------------------------------------------------------------------------
-- @function [parent=#f_new_server_item_panel] itemClick
-- 服务器条目选择
-------------------------------------------------------------------------------
function f_new_server_item_panel:itemClick()	
	if self.m_item_select_callback then
		self.m_item_select_callback(self.m_index)
	end
end

return f_new_server_item_panel