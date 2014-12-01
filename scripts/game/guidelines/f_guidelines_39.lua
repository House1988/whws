--[[--
    新手指引
    排兵布阵界面指向装备栏
    步骤
--]]--

local f_guidelines_39 = class("f_guidelines_39")
f_guidelines_39.__index = f_guidelines_39

-------------------------------------------------
-- @function [parent=#f_guidelines_39] ctor
-------------------------------------------------
function f_guidelines_39:ctor()	
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
-- @function [parent=#f_guidelines_39] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_39:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_39:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_39:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then		
		if not g_game.g_panelManager:isUiPanelShow("paibinghuangzi_top") then
			return 
		end
		
		local mainPanel = g_game.g_panelManager:getUiPanel("paibinghuangzi_top")
		local buzhenPanel = mainPanel.m_paibing_buzhen	
		if buzhenPanel then
			local item = buzhenPanel.m_paibing_huangzi_cardTable["item_panel_1"]
			
			if item then		
				local stencilPanel = self.m_guidelines_manager:getComponent()
				stencilPanel:enableAllStencil(true)
				stencilPanel:scaleFullScreen(false)		
				stencilPanel:enableStencil(true)
						
				local posx, posy = item:getPosition()
				local pos = item:getParent():convertToWorldSpace(cc.p(posx, posy))			
				stencilPanel:setRectType(pos, item:getSize(), false, false)
				
				local guidelinesBtn = fc.FContainerPanel:create()
			    guidelinesBtn:setSize(cc.size(104,104))
			    guidelinesBtn:setAnchorPoint(cc.p(0.5,0.5))			
			    
			    local public_icon_di = fc.FExtensionsImage:create()
			    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
			    public_icon_di:setSize(cc.size(104,104))
			    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(public_icon_di)
			    public_icon_di:setPositionInContainer(cc.p(52,52))
			
				local item_bg_1 = fc.FExtensionsImage:create()
			    item_bg_1:setImage("batch_ui/zhuangbei3_weikaiqi.png")
			    item_bg_1:setSize(cc.size(90,90))
			    item_bg_1:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(item_bg_1)
			    item_bg_1:setPositionInContainer(cc.p(52,52))
			
			    local plus_img = fc.FExtensionsImage:create()
			    plus_img:setImage("batch_ui/jiazhuangbei.png")
			    plus_img:setSize(cc.size(36,37))
			    plus_img:setAnchorPoint(cc.p(0.5,0.5))
			    guidelinesBtn:appendComponent(plus_img)
			    plus_img:setPositionInContainer(cc.p(73,30.5))
			
			    local label_kezhuangbei = fc.FLabel:createBMFont()
			    label_kezhuangbei:setSize(cc.size(70,28))
			    label_kezhuangbei:setAnchorPoint(cc.p(0.5,0.5))
			    label_kezhuangbei:setFontSize(24)
			    
			    if LANGUAGE_TYPE == 3 then
			    	label_kezhuangbei:setString("可裝備")
			    else
			    	label_kezhuangbei:setString("可装备")
			    end
			    
			    label_kezhuangbei:setColor(cc.c3b(185,255,0))
			    guidelinesBtn:appendComponent(label_kezhuangbei)
			    label_kezhuangbei:setPositionInContainer(cc.p(46,77))
				
				stencilPanel:showIndicateComponent(guidelinesBtn, pos, item:getSize())
				stencilPanel:showIndicateAnimation(pos, item:getSize())
				
			    local itemPress1 = function()
					if self.m_current_state == self.STATE_CHECK then
						self.m_current_state = self.STATE_FINISH
					end
			    end
			    guidelinesBtn:addHandleOfcomponentEvent(itemPress1,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
			  			
				self.m_current_state = self.STATE_CHECK
				self.m_time = 0
			end
		end
		

	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] state_Check
-- 检查万岁是否结束
-------------------------------------------------------------------------------
function f_guidelines_39:state_Check(dt)	
	self.m_time = self.m_time + dt
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_39:state_Finish(dt)
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_39:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_39:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_39] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_39:guidelinesNextIndex()	
	return 40
end


return f_guidelines_39