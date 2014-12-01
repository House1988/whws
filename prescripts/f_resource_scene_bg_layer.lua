
local f_resource_scene_bg_layer = class("f_resource_scene_bg_layer", function()
    return fc.FContainerPanel:create()
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:ctor()  
  	self:registerNodeEvent()
  	
  	self.m_real_size = g_resource.g_real_size

  	self.m_autoPanel = require ("prescripts.common.f_pre_lua_autoscale_panel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)  
  	
  	g_resource.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 3)	
  	
  	
  	self.m_autoPanel:appendComponent(self)
	self:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))    	
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
  	
  		

    local loadingjiemian = fc.FContainerPanel:create()
    loadingjiemian:setSize(cc.size(960,640))

    local loading_meinv = fc.FExtensionsImage:create()
    loading_meinv:setImage(g_resource.getUiResource("update_background"))
    loading_meinv:setExtensionsTextureRect(cc.rect(0, 0, 960,640))
    loading_meinv:setAnchorPoint(cc.p(0.5,0.5))
    loadingjiemian:appendComponent(loading_meinv)
    loading_meinv:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))

    local tip = fc.FLabel:createSystemFont()
    tip:setSize(cc.size(78,19))
    tip:setAnchorPoint(cc.p(0.5,0.5))
    tip:setFontSize(21)
    tip:setString("")
    tip:setColor(cc.c3b(255,255,255))
    loadingjiemian:appendComponent(tip)
    tip:setPositionInContainer(cc.p(480,599.5))

    local precent = fc.FLabel:createSystemFont()
    precent:setSize(cc.size(78,19))
    precent:setAnchorPoint(cc.p(0.5,0.5))
    precent:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	precent:setString("正在載入資源...")
    else
    	precent:setString("正在加载资源...")
    end
    precent:setColor(cc.c3b(255,255,255))
    loadingjiemian:appendComponent(precent)
    precent:setPositionInContainer(cc.p(480,553))
    
    self:appendComponent(loadingjiemian)  
	loadingjiemian:setAnchorPoint(cc.p(0.5, 0.5))
	loadingjiemian:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
    
    self.m_loading_panel = loadingjiemian
    self.m_progress_image = nil
    
    self:createImageProgress()
    
    local updateNumb = function(num)
    	self:updateImageProgress(num)
    end
    g_resource.g_resource_update_manager:setStatePregressCallback(updateNumb)
    
    
    local updateStateText = function(text)
    	precent:setString(text)
    end
    g_resource.g_resource_update_manager:setStateTextCallback(updateStateText)
    
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:registerNodeEvent(handler)
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
-- @function [parent=#f_resource_scene_bg_layer] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] onEnter
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:onEnter()	
	  
	  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] onExit
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:onExit()  
    self:unregisterNodeEvent()	
    
 end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] onExitTransitionStart
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] onCleanup
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] registerServerMessage
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] unregisterServerMessage
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:unregisterServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] createImageProgress
-- 创建图像进度条
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:createImageProgress()	
    local bgUpdateImage = fc.FShaderExtensionsImage:create(2)
    bgUpdateImage:setAnchorPoint(cc.p(0.5,0.5))
    bgUpdateImage:setImage("nobatch/loadingx.png")
    bgUpdateImage:setSize(cc.size(742, 55))
    self.m_loading_panel:appendComponent(bgUpdateImage)
    bgUpdateImage:setPositionInContainer(cc.p(480,520))
    
    
    self.m_progress_panel = fc.FContainerPanel:create()
    self.m_progress_panel:setSize(cc.size(0, 173))
    	
    self.m_progress_image = fc.FShaderExtensionsImage:create(0)
    self.m_progress_image:setAnchorPoint(cc.p(0.5,0.5))
    self.m_progress_image:setImage("nobatch/loadingx.png")
    self.m_progress_image:setSize(cc.size(742, 55))
    self.m_progress_panel:appendComponent(self.m_progress_image)
    self.m_progress_image:setPositionInContainer(cc.p(742 / 2, 173 / 2))
    
    self.m_loading_panel:appendComponent(self.m_progress_panel)
    
    self.m_progress_panel:setAnchorPoint(cc.p(0, 0.5))
    self.m_progress_panel:setPositionInContainer(cc.p(480-742/2, 520))
    self.m_progress_panel:enableClipping(true)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_resource_scene_bg_layer] updateImageProgress
-- 更新图像进度
-------------------------------------------------------------------------------
function f_resource_scene_bg_layer:updateImageProgress(num)	
	if self.m_progress_panel then
		self.m_progress_panel:setSize(cc.size(num/100.0*742, 173))    	
	end
end

return f_resource_scene_bg_layer