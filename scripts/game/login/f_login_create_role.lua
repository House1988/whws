--[[
	继承自container panel, 用于显示创建角色
]]--

require("scripts.auto.auto_jinluandian_nianhao")

local FLuaLoginCreateRole = class("FLuaLoginCreateRole", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaLoginCreateRole")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginCreateRole] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaLoginCreateRole:ctor()    
    self:registerNodeEvent()   
    	
	self:setSize(cc.size(g_game.g_display.sizeInPixels.width, g_game.g_display.sizeInPixels.height))
   
	self.m_tips_text = ""
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginCreateRole] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function FLuaLoginCreateRole:onEnter()   
	self:setStopTouchEvent(true)
	self:initAllComponent()
end


function FLuaLoginCreateRole:onExit()    
    self:unregisterNodeEvent()
end

function FLuaLoginCreateRole:onEnterTransitionFinish()
end

function FLuaLoginCreateRole:onExitTransitionStart()
end

function FLuaLoginCreateRole:onCleanup()
end


function FLuaLoginCreateRole:registerNodeEvent(handler)
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

function FLuaLoginCreateRole:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

function FLuaLoginCreateRole:getRandomButton()
	return self.m_componentTable["suiji"]
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginCreateRole] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function FLuaLoginCreateRole:initAllComponent()	
	local func = function()
	end
	local nianhaoPanel_table = createjinluandian_nianhao()
	self.m_name_panel = nianhaoPanel_table["jinluandian_nianhao"]	
	self.m_componentTable = nianhaoPanel_table
	self:appendComponent(self.m_name_panel)
	self.m_name_panel:setAnchorPoint(cc.p(0.5, 0.5))
	self.m_name_panel:setPositionInContainer(cc.p(g_game.g_display.sizeInPixels.width*0.5, g_game.g_display.sizeInPixels.height*0.5))
	
	local random = function()
		
	end
	
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["jld_nh_tishiyu_label"]:setString("皇上，請確定本朝年號：")
		self.m_componentTable["jld_nh_queding_button"]:setText("確  定",cc.c3b(255,255,255))
	end
	
	self.m_componentTable["suiji"]:addHandleOfcomponentEvent(random, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)

	local createCallBack = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		local nianhao = self.m_componentTable["jld_nh_input"]:getText()
		if not g_game.g_utilManager:checkInput(nianhao) then
			g_game.g_utilManager:showPublicMessagePanel(g_game.g_f_error_msg_def.F_LUA_ERROR_INPUT_ERROR,func)
			return
		end
		if DEBUG_USE_DEFAULT_USER then
			nianhao = g_default_user[1]
		end
		if nianhao ~= "" then
			if string.hybridTextLen(nianhao) > g_game.MAX_WANJIA_NAME_LEN then
				g_game.g_utilManager:showMsg("用户名称不能超过" .. g_game.MAX_WANJIA_NAME_LEN .. "个字哦")
			else							
				self.m_nianhao = nianhao
				if self.m_input_done_callback then
					self.m_input_done_callback(self.m_nianhao)
				end
			end
		else
			g_game.g_utilManager:showMsg("您还没有输入角色名称哦")
			
		end	
	end
	self.m_componentTable["jld_nh_queding_button"]:addHandleOfcomponentEvent(createCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	self.m_componentTable["jld_nh_tishiyu_label"]:setString(self.m_tips_text)
	
    self.m_componentTable["jld_nh_input"]:setReturnType(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginCreateRole] setInputDoneCallback
-- 输入后回调
-------------------------------------------------------------------------------
function FLuaLoginCreateRole:setInputDoneCallback(callback)	
	self.m_input_done_callback = callback
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginCreateRole] showInput
-- 重新设置input位置
-------------------------------------------------------------------------------
function FLuaLoginCreateRole:showInput(isNianHao)
	if device.platform == "ios" then
    	self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,125))	
	else
    	self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,125))	
	end
	
	local nianHao = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_SUIJI)
		self.m_componentTable["jld_nh_input"]:setText(g_game.g_dictConfigManager:getRandomNianHao())
	end
	
	local name = function()
		self.m_componentTable["jld_nh_input"]:setText(g_game.g_dictConfigManager:getRandomName())
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_SUIJI)
	end
	
	self.m_componentTable["suiji"]:setVisible(true)
	
	if isNianHao then
		self.m_componentTable["suiji"]:addHandleOfcomponentEvent(nianHao, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	else
		self.m_componentTable["suiji"]:addHandleOfcomponentEvent(name, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	end
end	

-------------------------------------------------------------------------------
-- @function [parent=#FLuaLoginCreateRole] setInputTipsText
-- 显示的提示文本
-------------------------------------------------------------------------------
function FLuaLoginCreateRole:setInputTipsText(text)	
	self.m_tips_text = text
end


return FLuaLoginCreateRole