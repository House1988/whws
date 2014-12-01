--[[--
    新手指引
    点击宫斗中的升级按钮
    步骤
--]]--

local f_guidelines_32 = class("f_guidelines_32")
f_guidelines_32.__index = f_guidelines_32

-------------------------------------------------
-- @function [parent=#f_guidelines_32] ctor
-------------------------------------------------
function f_guidelines_32:ctor()	
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
-- @function [parent=#f_guidelines_32] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_32:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_32:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_32:guidelinesNextIndex()	
	return 33
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_32:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_32:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		
		if not g_game.g_panelManager:isUiPanelShow("gongdou_bg") then
			return 
		end
		
		local gongdouMain = g_game.g_panelManager:getUiPanel("gongdou_bg")
		gongdouMain:setGongDouFinish(false)
			
		local stencilPanel = self.m_guidelines_manager:getComponent()
		stencilPanel:enableAllStencil(true)
		stencilPanel:scaleFullScreen(false)	
		stencilPanel:enableStencil(true)
		
		local levelUpBtn = gongdouMain.m_gongdouBottomTable["gd_shengji_button"]
		if levelUpBtn then			
			local posx, posy = levelUpBtn:getPosition()
			local pos = levelUpBtn:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setCircleType(pos, levelUpBtn:getSize()["width"]/2, false, false)
			
			local guidelinesBtn = fc.FScaleButton:create()
		    guidelinesBtn:setSize(cc.size(144,53))
		    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:setButtonImage("batch_ui/putonganniu1_up.png")
		
		    local sheng = fc.FShaderExtensionsImage:create(0)
		    sheng:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(sheng)
		    sheng:setPositionInContainer(cc.p(46,26))
		    sheng:setImage("batch_ui/sheng1_uizi.png")
		    sheng:setSize(cc.size(32,32))
		    
		    local ji = fc.FShaderExtensionsImage:create(0)
		    ji:setAnchorPoint(cc.p(0.5,0.5))
		    guidelinesBtn:appendComponent(ji)
		    ji:setPositionInContainer(cc.p(97,26))
		    ji:setImage("batch_ui/ji1_uizi.png")
		    ji:setSize(cc.size(32,32))
			
			stencilPanel:showIndicateComponent(guidelinesBtn, pos, levelUpBtn:getSize())
			stencilPanel:showIndicateAnimation(pos, levelUpBtn:getSize())
		
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
				
			--升级
			local lvupBtnCallBack = function()	
				local newstencilPanel = self.m_guidelines_manager:getComponent()
				newstencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
				newstencilPanel:hideIndicateAnimation()
				newstencilPanel:hideIndicateComponent()
				
				newstencilPanel:enableAllStencil(false)
				newstencilPanel:scaleFullScreen(false)	
				newstencilPanel:enableStencil(false)
			end
			guidelinesBtn:addHandleOfcomponentEvent(lvupBtnCallBack, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			
			
			
		end
		
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_32:state_Check(dt)
	local gongdouMain = g_game.g_panelManager:getUiPanel("gongdou_bg")	
	if gongdouMain:isGongDouFinish() then
		self.m_current_state = self.STATE_FINISH
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_32:state_Finish(dt)	
	g_game.g_userInfoManager:requestRecordGuidleStep(13)
	self.m_current_state = self.STATE_EXIT
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_32] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_32:state_Exit(dt)	
	self.m_finish = true
end

return f_guidelines_32