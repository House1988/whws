--[[--
    新手指引
    战斗再次选择关卡
    步骤
--]]--

local f_guidelines_21 = class("f_guidelines_21")
f_guidelines_21.__index = f_guidelines_21

-------------------------------------------------
-- @function [parent=#f_guidelines_21] ctor
-------------------------------------------------
function f_guidelines_21:ctor()	
	self.m_guidelines_manager = nil
	
	self.m_time = 0
	self.m_finish = false
	
	
	self.STATE_INIT			= 1
	self.STATE_OPEN_CHAPTER	= 2
	self.STATE_CHECK		= 3
	self.STATE_FINISH		= 4
	self.STATE_EXIT			= 5
	
	self.m_state_function_array = {}
	
	local state_init = function(dt)
		self:state_Init(dt)
	end
	self.m_state_function_array[self.STATE_INIT] = state_init
	
	local state_checkChapter = function(dt)
		self:state_CheckChapter(dt)
	end
	self.m_state_function_array[self.STATE_OPEN_CHAPTER] = state_checkChapter
	
	
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
-- @function [parent=#f_guidelines_21] setGuidelinesManager
-- 设置新手指引管理
-------------------------------------------------------------------------------
function f_guidelines_21:setGuidelinesManager(manager)	
	self.m_guidelines_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] update
-- 新手指引更新函数
-------------------------------------------------------------------------------
function f_guidelines_21:update(dt)	
	self.m_state_function_array[self.m_current_state](dt)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] state_Init
-- 初始化当前状态
-------------------------------------------------------------------------------
function f_guidelines_21:state_Init(dt)	
	if g_game.g_current_scene_type == g_game.SCENE_TYPE_GAME then
		
		if not g_game.g_panelManager:isUiPanelShow("nanzhengbeitao_title") then
			g_game.g_director:getRunningScene():getGameMap():triggerBuilding(5)
		end
		
		self.m_current_state = self.STATE_OPEN_CHAPTER
	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] state_CheckChapter
-- 检查面板是否打开
-------------------------------------------------------------------------------
function f_guidelines_21:state_CheckChapter(dt)		
		local hougongMain = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
		if hougongMain and hougongMain.m_selectChapter then
			local stencilPanel = self.m_guidelines_manager:getComponent()
			stencilPanel:enableAllStencil(true)
			stencilPanel:scaleFullScreen(false)	
			stencilPanel:enableStencil(true)
			
			hougongMain.m_page_container:enableScroll(false)
			
			local posx, posy = hougongMain.m_selectChapter:getPosition()
			local pos = hougongMain.m_selectChapter:getParent():convertToWorldSpace(cc.p(posx, posy))			
			stencilPanel:setRectType(pos, hougongMain.m_selectChapter:getSize(), false, false)
			
			local createPanel = f_stage_single_chapter.static_clone(hougongMain.m_selectChapter)
			
			local clickCallback = function(obj)
				self.m_current_state = self.STATE_FINISH
				self.m_time = 0
			end
			createPanel:setChapterClickCallback(clickCallback)
			
			stencilPanel:showIndicateComponent(createPanel, pos, hougongMain.m_selectChapter:getSize())
			
			stencilPanel:showIndicateAnimation(pos, hougongMain.m_selectChapter:getSize())
			
			
			self.m_current_state = self.STATE_CHECK
			self.m_time = 0
		end	
end


-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] state_Check
-- 检查是否点击了金銮殿按钮
-------------------------------------------------------------------------------
function f_guidelines_21:state_Check(dt)	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] state_Finish
-- 结束当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_21:state_Finish(dt)	
	self.m_current_state = self.STATE_EXIT
	
	local stencilPanel = self.m_guidelines_manager:getComponent()
	stencilPanel:setRectType(cc.p(0,0), cc.size(0,0), true, false)
	stencilPanel:hideIndicateAnimation()
	stencilPanel:hideIndicateComponent()
		
	local hougongMain = g_game.g_panelManager:getUiPanel("nanzhengbeitao_title")
	if hougongMain then
		hougongMain.m_page_container:enableScroll(true)
	end
	

end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] state_Exit
-- 退出当前步骤指引
-------------------------------------------------------------------------------
function f_guidelines_21:state_Exit(dt)	
	self.m_finish = true
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] guidelinesFinish
-- 判断当前指引是否结束
-------------------------------------------------------------------------------
function f_guidelines_21:guidelinesFinish()	
	return self.m_finish
end

-------------------------------------------------------------------------------
-- @function [parent=#f_guidelines_21] guidelinesNextIndex
-- 获取下一步指引index
-------------------------------------------------------------------------------
function f_guidelines_21:guidelinesNextIndex()	
	return 22
end


return f_guidelines_21