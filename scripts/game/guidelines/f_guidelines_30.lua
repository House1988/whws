--[[--
    新手指引
    指向宫斗按钮
    步骤
--]]--

local f_guidelines_30 = class("f_guidelines_30")
f_guidelines_30.__index = f_guidelines_30

-------------------------------------------------
-- @function [parent=#f_guidelines_30] ctor
-------------------------------------------------
function f_guidelines_30:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	self.STATE_INIT			= 1
	self.STATE_CHECK		= 2
	self.STATE_FINISH		= 3
	self.STATE_EXIT			= 4
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_check = function(dt)
		self:state_Check(dt)
	end
	self.m_state_function_array[self.STATE_CHECK] = state_check
	
	local state_finish = function(dt)
		self:state_Finish(dt)
	end
	self.m_state_function_array[self.STATE_FINISH] = state_finish
	
	local state_exit = function(dt)
		self:state_Exit(dt)
	end
	self.m_state_function_array[self.STATE_EXIT] = state_exit
	
	self.m_current_state	= self.STATE_INIT
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_30:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_30:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_30:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_30:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("hougong_tangquangong_bg") then
			g_game.g_director:getRunningScene():getGameMap():enterBeauty()
			return 
		end
		
		local hougongMain = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
		if hougongMain.m_tangquangong.m_uiFavorState ~= hougongMain.m_tangquangong.UI_CURBEAUTY_STATE_NONE then	
			return
		end
		g_game.g_userInfoManager:requestRecordGuidleStep(30)
			
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local tangquangong = hougongMain.m_tangquangong
		local gongdouBtn = tangquangong.m_meinvInfo_table["hg_tqg_gongdou_button"]
	
		if gongdouBtn then
			local posx, posy = gongdouBtn:getPosition()
			local pos = gongdouBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, gongdouBtn:getSize()["width"]/2, false, false)
    		 
	 		local guideLinesButton = fc.FScaleButton:create()
			guideLinesButton:setSize(cc.size(144,53))
    		guideLinesButton:setAnchorPoint(cc.p(0.5,0.5))
   			guideLinesButton:setButtonImage("batch_ui/putonganniu1_up.png")
    		guideLinesButton:setSwallowsTouches(false)
    		
    		local gong = fc.FShaderExtensionsImage:create(0)
		    gong:setAnchorPoint(cc.p(0.5,0.5))
		    gong:setImage("batch_ui/gong_uizi.png")
		    gong:setSize(cc.size(32,32))
		    guideLinesButton:appendComponent(gong)
		    gong:setPositionInContainer(cc.p(43,26))
		
		    local dou = fc.FShaderExtensionsImage:create(0)
		    dou:setAnchorPoint(cc.p(0.5,0.5))
		    dou:setImage("batch_ui/dou_uizi.png")
		    dou:setSize(cc.size(32,32))
		    guideLinesButton:appendComponent(dou)
		    dou:setPositionInContainer(cc.p(98,26))
		    
			stencilPanel:showIndicateComponent(guideLinesButton, pos, guideLinesButton:getSize())
			stencilPanel:showIndicateAnimation(pos, guideLinesButton:getSize())
			
			self.guidelinesPanel = f_guidelines_text_show_panel.static_create()
			self.guidelinesPanel:panelInitBeforePopup()		
			stencilPanel:appendComponent(self.guidelinesPanel)
			self.guidelinesPanel:setComponentZOrder(100)
			local sizeT = self.guidelinesPanel:getSize()
			self.guidelinesPanel:setAnchorPoint(cc.p(0.5, 0.5))
			local stencilSize = stencilPanel:getStencilSize() 
			self.guidelinesPanel:setPositionInContainer(cc.p(stencilSize.width/2-50, stencilSize.height/2+100))
			self.guidelinesPanel:setSwallowsTouches(false)
			self.guidelinesPanel:showText(self.m_guidelines_manager:getGuidelinesText(28))
			self.guidelinesPanel:setGuidlinesPersonImage(self.m_guidelines_manager:getGuidelinesPerson(28), false)
				
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
			
			--注册监听函数
			self.event_gongdou = function()
				if self.m_current_state == self.STATE_CHECK then
					self.m_current_state = self.STATE_FINISH
				end
			end
			g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BEAUTY_GONGDOU_OPEN, self.event_gongdou)
			
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_30:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_30:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	if self.guidelinesPanel then
		stencilPanel:deleteComponent(self.guidelinesPanel)
		self.guidelinesPanel = nil
	end
	
	g_game.g_eventManager:removeLuaEventFunction(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BEAUTY_GONGDOU_OPEN, self.event_gongdou)

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_30:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_30:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_30] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_30:guidelinesNextIndex()	
	return 31
end


return f_guidelines_30