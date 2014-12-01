--[[
	战斗场景地图
]]--
local f_battle_map_layer = class("f_battle_map_layer", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_battle_map_layer")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_battle_map_layer:ctor()  
	self.m_mapComponent = nil
	self.m_battle_manager = nil
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] layout_in_parent
-- 添加到父面板，并自动适应
-------------------------------------------------------------------------------
function f_battle_map_layer:layout_in_parent()

  	self.m_autoPanel = require ("scripts.extend.fluaautoscalepanel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE_ALLSCALE)
	self:registerNodeEvent()--注册特殊回调函数     
	
  	self.m_autoPanel:appendComponent(self)
  	g_game.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 1)
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	
	
	self:setVisible(false)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_battle_map_layer:registerNodeEvent(handler)
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
-- @function [parent=#f_battle_map_layer] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_battle_map_layer:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] onEnter
-------------------------------------------------------------------------------
function f_battle_map_layer:onEnter()
	  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] onExit
-------------------------------------------------------------------------------
function f_battle_map_layer:onExit()        
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_battle_map_layer:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] onExitTransitionStart
-------------------------------------------------------------------------------
function f_battle_map_layer:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] onCleanup
-------------------------------------------------------------------------------
function f_battle_map_layer:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] registerServerMessage
-------------------------------------------------------------------------------
function f_battle_map_layer:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] unregisterServerMessage
-------------------------------------------------------------------------------
function f_battle_map_layer:unregisterServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] setBattleManager
-- 设置battle manager
-------------------------------------------------------------------------------
function f_battle_map_layer:setBattleManager(manager)
	self.m_battle_manager = manager
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] loadMap
-- 根据关卡id获取地图
-------------------------------------------------------------------------------
function f_battle_map_layer:loadMap()
	if self.m_mapComponent == nil then		
		self.m_mapComponent = fc.FExtensionsImage:create()	
		
		self:appendComponent(self.m_mapComponent)
		self.m_mapComponent:setImage(self.m_battle_manager:getBattleMap())
		self.m_mapComponent:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
		
		self.m_mapComponent:setAnchorPoint(cc.p(0.5, 0.5))    
	   	self.m_mapComponent:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	   	
	    self.m_mapComponent:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	    
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_battle_map_layer] showMap
-- 是否显示地图
-------------------------------------------------------------------------------
function f_battle_map_layer:showMap(isShow)
	self.m_mapComponent:setVisible(isShow)
end


return f_battle_map_layer
