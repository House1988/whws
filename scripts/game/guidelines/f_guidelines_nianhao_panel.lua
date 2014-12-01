require("scripts.auto.auto_jinluandian_nianhao_new")
--[[--
     年号界面
--]]--
f_guidelines_nianhao_panel = class("f_guidelines_nianhao_panel")
f_guidelines_nianhao_panel.__index = f_guidelines_nianhao_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel.static_create()
	local nianhaoPanel_table = createjinluandian_nianhao_new()
	local nianhao_panel = nianhaoPanel_table["jinluandian_nianhao_new"]
	
	local funTable = {}
	tolua.setpeer(nianhao_panel, funTable)
	setmetatable(funTable, f_guidelines_nianhao_panel)
	
	nianhao_panel.m_componentTable = nianhaoPanel_table
	   
	return nianhao_panel  
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:panelInitBeforePopup()	
	self:registerNodeEvent()		
	
	self.m_create_nianhao_finish	= false
	self.m_nianhao = nil
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] resetInputPosition
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:resetInputPosition()	
	
		if device.platform == "ios" then
	    	self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,128))	
		else
	    	self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,128))	
		end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_guidelines_nianhao_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] onEnter
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:onEnter()
	if LANGUAGE_TYPE == 3 then
		self.m_componentTable["jld_nh_tishiyu_label"]:setString("皇上，請確定本朝年號：")
		self.m_componentTable["jld_nh_queding_button"]:setText("確  定",cc.c3b(255,255,255))
	end
	
	self:initAllComponent()
	self.m_inputText = ""
	g_game.g_gameManager:addUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] update
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:update()
	if device.platform == "android" and self.m_componentTable["jld_nh_input"]:getText() ~= self.m_inputText then
		self.m_inputText = self.m_componentTable["jld_nh_input"]:getText()
		self.m_componentTable["jld_nh_input"]:setText(self.m_inputText)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] onExit
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:onExit()	
  	self:unregisterNodeEvent() 
  	
  	self.m_nianhao = nil
  	
  	--移除注册的监听函数
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_UPDATE_HUANGDI_NIANHAO, self.event_updateHuangdiNianhao) 	
	g_game.g_gameManager:removeUpdateObj(self)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] onCleanup
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:initAllComponent()	
	local func = function()
	end
	local createCallBack = function()
		local nianhao = self.m_componentTable["jld_nh_input"]:getText()
		if DEBUG_USE_DEFAULT_USER then
			nianhao = "元年"
		end
		if nianhao ~= "" then
			if string.hybridTextLen(nianhao) > g_game.MAX_NIANHAO_LEN then
				local notice = require("scripts.game.main.common.f_common_floating_notice").new()
				notice:setSize(cc.size(500, 80))
			    self:appendComponent(notice)
			    notice:setComponentZOrder(10000)
			    notice:setNoticeString("皇帝年号不能超过两个字哦")
			    notice:setPositionInContainer(cc.p(self:getSize().width/2,self:getSize().height/2))
			else
				if not g_game.g_utilManager:checkInput(nianhao) then
					g_game.g_utilManager:showGuildLinePopup(g_game.g_f_error_msg_def.F_LUA_ERROR_INPUT_ERROR,func)
					return
				end
				self.m_nianhao = nianhao
				
				--开启网络缓冲
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING)
				--发送修改皇帝年号信息
				g_game.g_userInfoManager:requestAlterNianhao(nianhao)
				
			end
		else
			local notice = require("scripts.game.main.common.f_common_floating_notice").new()
			notice:setSize(cc.size(500, 80))
		    self:appendComponent(notice)
		    notice:setComponentZOrder(10000)
		    notice:setNoticeString("您还没有输入年号哦")
		    notice:setPositionInContainer(cc.p(self:getSize().width/2,self:getSize().height/2))
		end		
		
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
	end
	  
	self.m_componentTable["jld_nh_queding_button"]:addHandleOfcomponentEvent(createCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
	local nianhao = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		self.m_componentTable["jld_nh_input"]:setText(g_game.g_dictConfigManager:getRandomNianHao())
	end
	self.m_componentTable["suiji"]:addHandleOfcomponentEvent(nianhao, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	
    --注册更新皇帝年号事件
    self.event_updateHuangdiNianhao = function()
		self:updateHuangdiNianhao()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_UPDATE_HUANGDI_NIANHAO, self.event_updateHuangdiNianhao)
    
	if device.platform == "ios" then
		self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,125))
	else
    	self.m_componentTable["jld_nh_input"]:setPositionInContainer(cc.p(263,125))	
    end
    self.m_componentTable["jld_nh_input"]:setReturnType(1)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] updateHuangdiNianhao
-- 更新皇帝年号
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:updateHuangdiNianhao()	
	if self.m_nianhao ~= nil then
		local userInfo = g_game.g_userInfoManager:getUserInfo()
		userInfo["reign"] = self.m_nianhao
		--修改新手引导定年号结束标志
		self.m_create_nianhao_finish = true
	else 
		print("未获取到用户输入年号！")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_nianhao_panel] isFinishCreateNianhao
-- 判断年号创建是否完成
-------------------------------------------------------------------------------
function f_guidelines_nianhao_panel:isFinishCreateNianhao()
	return self.m_create_nianhao_finish
end
