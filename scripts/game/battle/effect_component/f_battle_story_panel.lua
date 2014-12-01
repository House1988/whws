--[[
	继承自container panel, 用于显示关卡剧情
]]--
require("scripts.auto.auto_stage_story_guide")

local f_battle_story_panel = class("f_battle_story_panel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_battle_story_panel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_story_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_battle_story_panel:ctor()       
    self:registerNodeEvent()   
    self.m_tipTable = nil
    self.m_tipPanel = nil
    
    self.m_storyData = nil
    self.m_isShowOver = false
    
    self.m_index = 1
    self.m_maxIndex = 0
    
	self.STATE_INIT = 0
	self.STATE_RUN = 1
	self.STATE_FINISH = 2
	self.STATE_NONE = 3
	self.m_state = self.STATE_NONE
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_story_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_battle_story_panel:onEnter()       
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))	
	
	self.m_tipTable  = createstage_story_guide()
	self.m_tipPanel = self.m_tipTable["stage_story_guide"]
    self:appendComponent(self.m_tipPanel)
    self.m_tipPanel:setAnchorPoint(cc.p(0.5,0.5))
    
	local action = g_game.g_transition.sequence({cc.MoveBy:create(0.3, cc.p(0, -10)), cc.MoveBy:create(0.3, cc.p(0, 10))})
	self.m_tipTable["xsyd_jiantou1"]:runAction(cc.RepeatForever:create(action))
    
	local action = g_game.g_transition.sequence({cc.MoveBy:create(0.3, cc.p(0, -10)), cc.MoveBy:create(0.3, cc.p(0, 10))})
	self.m_tipTable["xsyd_jiantou2"]:runAction(cc.RepeatForever:create(action))
    
    local gotoNext = function()
    	if self.m_index < self.m_maxIndex and self.m_state == self.STATE_RUN then
    		self.m_index = self.m_index + 1
    		self.m_state = self.STATE_INIT
    	elseif self.m_index == self.m_maxIndex and self.m_state == self.STATE_RUN then
    		self.m_isShowOver = true
    		self.m_state = self.STATE_FINISH
    	end
    end
    self:addHandleOfcomponentEvent(gotoNext,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_story_panel] update
-------------------------------------------------------------------------------
function f_battle_story_panel:update(dt)
	if self.m_state  == self.STATE_INIT then
		self:initTalk()
		self.m_state = self.STATE_RUN
	elseif self.m_state == self.STATE_RUN then
	elseif self.m_state == self.STATE_FINISH then
	end
end

------------------------------------------------------------------------------
-- @function [parent=#f_battle_story_panel] initTalk
-------------------------------------------------------------------------------
function f_battle_story_panel:initTalk()
	local curPersonData = self.m_storyData[self.m_index]
	if curPersonData["pos"] == "l" then
		self.m_tipTable["stage_story_guide_l"]:setVisible(true)
		self.m_tipTable["xsyd_content_label1"]:setString(curPersonData["content"])
		self.m_tipTable["xsyd_content_label1"]:setAlignment(0)
		self.m_tipTable["yindao_person1"]:setImage(curPersonData["path"])
		self.m_tipTable["yindao_person1"]:setScale(0.75)  
		self.m_tipTable["label_title1"]:setString(curPersonData["name"])
		self.m_tipTable["stage_story_guide_r"]:setVisible(false)
		self.m_tipPanel:setPositionInContainer(cc.p(330,CONFIG_SCREEN_HEIGHT-270))
		
	elseif curPersonData["pos"] == "r" then
		self.m_tipTable["stage_story_guide_l"]:setVisible(false)
		self.m_tipTable["stage_story_guide_r"]:setVisible(true)
		self.m_tipTable["xsyd_content_label2"]:setAlignment(0)
		self.m_tipTable["xsyd_content_label2"]:setString(curPersonData["content"])
		self.m_tipTable["yindao_person2"]:setImage(curPersonData["path"])
		self.m_tipTable["yindao_person2"]:setScale(0.75)
		self.m_tipTable["label_title2"]:setString(curPersonData["name"])
		
		self.m_tipPanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH - 330,160))
		
		
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_story_panel] setPersonData
-------------------------------------------------------------------------------
function f_battle_story_panel:isShowOver()
	return self.m_isShowOver 
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_story_panel] setPersonData
-------------------------------------------------------------------------------
function f_battle_story_panel:setPersonData(data)
	self.m_storyData = data
	
	self.m_index = 1
    self.m_maxIndex = #self.m_storyData
	
	self.m_state = self.STATE_INIT
	g_game.g_gameManager:addUpdateObj(self)
end

function f_battle_story_panel:onExit()    
    self:unregisterNodeEvent()
    g_game.g_gameManager:removeUpdateObj(self)
end

function f_battle_story_panel:onEnterTransitionFinish()
end

function f_battle_story_panel:onExitTransitionStart()
end

function f_battle_story_panel:onCleanup()
end


function f_battle_story_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_story_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_battle_story_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_battle_story_panel