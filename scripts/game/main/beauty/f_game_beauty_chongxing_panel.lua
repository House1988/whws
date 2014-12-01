local f_game_beauty_chongxing_panel = class("f_game_beauty_chongxing_panel", function()
	return g_game.g_classFactory.newFLuaContainerPanel("f_game_beauty_chongxing_panel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:ctor()
	self.m_chongxingBefore_table = nil
	self.m_chongxingAfter_table = nil
	self.m_uiLalian = nil
	self.m_returnCall = nil
	
	self.m_deltaTime = 0 
	
	self.m_beautyId = 0
	self.STATE_NONE = 0
	self.STATE_SHOW_BEFORE = 1
	self.STATE_SHOW_WAITING_FUCK = 2 
	self.STATE_SHOW_LALIAN = 3
	self.STATE_SHOW_FUCKING = 4
	self.m_chongxing_state = self.STATE_NONE
	
	self:registerNodeEvent()
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] createChongxingBefore
-- 创建宠幸之前的panel
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:createChongxingBefore()
	local chongxingBefore_table = {}

	local chongxingBefore = fc.FContainerPanel:create()
    chongxingBefore:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))
    chongxingBefore_table["chongxing_before_panel"] = chongxingBefore
    
    local chongxingBefore_bg = fc.FExtensionsImage:create()	
	chongxingBefore_bg:setImage(g_game.g_resourceManager:getUiMap("hougong_bg2"))
	chongxingBefore_bg:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	chongxingBefore_bg:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	chongxingBefore_bg:setAnchorPoint(cc.p(0.5, 0.5))   
	chongxingBefore:appendComponent(chongxingBefore_bg) 
   	chongxingBefore_bg:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
	chongxingBefore_table["chongxing_before_bg"] = chongxingBefore_bg
 
 	local  beautyNameBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tiaozhancishu_ditu3.png",cc.rect(24,39,1,1))
    beautyNameBg:setSize(cc.size(45,253))
    beautyNameBg:setAnchorPoint(cc.p(0.5,0.5))
    chongxingBefore:appendComponent(beautyNameBg)
    beautyNameBg:setPositionInContainer(cc.p(206,278))
    chongxingBefore_table["beautyNameBg"] = beautyNameBg
    
    local  beautyName = fc.FLabel:createBMFont()
	beautyName:setSize(cc.size(30,220))
	beautyName:setWidth(25)
	beautyName:setAnchorPoint(cc.p(0.5,0.5))
	beautyName:setFontSize(20)
	beautyName:setVerString("步兵步兵")
	beautyName:setColor(cc.c3b(0,0,0))
	chongxingBefore:appendComponent(beautyName)
	beautyName:setPositionInContainer(cc.p(205,274))
	chongxingBefore_table["beautyName"] = beautyName
	
    local beautyImage = fc.FExtensionsImage:create()
    beautyImage:setAnchorPoint(cc.p(0.5,0.5))
    chongxingBefore:appendComponent(beautyImage)
    beautyImage:setPositionInContainer(cc.p(232,CONFIG_SCREEN_HEIGHT-460/2))
    chongxingBefore_table["beautyImage"] = beautyImage
    
    local beautyNakedImagePanel = fc.FContainerPanel:create()
    beautyNakedImagePanel:setSize(cc.size(452,460))
    beautyNakedImagePanel:setAnchorPoint(cc.p(0.5,0.5))
    chongxingBefore:appendComponent(beautyNakedImagePanel)
	beautyNakedImagePanel:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT-460/2))
    chongxingBefore_table["beautyNakedImagePanel"] = beautyNakedImagePanel
    
    local beautyImageNaked = fc.FExtensionsImage:create()
    beautyImageNaked:setAnchorPoint(cc.p(0.5,0.5))
    beautyNakedImagePanel:appendComponent(beautyImageNaked)
    beautyImageNaked:setPositionInContainer(cc.p(452/2,460/2))
    chongxingBefore_table["beautyImageNaked"] = beautyImageNaked
    
	local huangshangdianwoImage = fc.FExtensionsImage:create()
	huangshangdianwoImage:setImage("nobatch/huangshangdianwo.png")
	huangshangdianwoImage:setAnchorPoint(cc.p(0.5,0.5))
	chongxingBefore:appendComponent(huangshangdianwoImage)
	huangshangdianwoImage:setPositionInContainer(cc.p(527,100))
	huangshangdianwoImage:setVisible(false)
	chongxingBefore_table["huangshangdianwoImage"] = huangshangdianwoImage
	
	return chongxingBefore_table
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] createChongxingAfter
-- 创建宠幸之后的panel
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:createChongxingAfter()
	local chongxingAfter_table = {}

	local chongxingAfter = fc.FContainerPanel:create()
    chongxingAfter:setSize(cc.size(CONFIG_SCREEN_WIDTH,CONFIG_SCREEN_HEIGHT))
    chongxingAfter_table["chongxing_after_panel"] = chongxingAfter
    
    local chongxingAfter_bg = fc.FExtensionsImage:create()	
	chongxingAfter_bg:setImage(g_game.g_resourceManager:getUiMap("hougong_bg1"))
	chongxingAfter_bg:setExtensionsTextureRect(cc.rect(0,0,CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	chongxingAfter_bg:setSize(cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT))
	chongxingAfter_bg:setAnchorPoint(cc.p(0.5, 0.5))   
	chongxingAfter:appendComponent(chongxingAfter_bg) 
   	chongxingAfter_bg:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
   	
 -- 	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
 	if  DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
		local skipPanel = fc.FContainerPanel:create()
	    skipPanel:setSize(cc.size(144,53))
	    skipPanel:setStopTouchEvent(true)
	    skipPanel:setAnchorPoint(cc.p(0.5,0.5))
	    chongxingAfter:appendComponent(skipPanel)
	    skipPanel:setPositionInContainer(cc.p(796,572))
	    chongxingAfter_table["skipPanel"] = skipPanel
	    
	    local skipBtn = fc.FScaleButton:create()
	    skipBtn:setSize(cc.size(144,53))
	    skipBtn:setAnchorPoint(cc.p(0.5,0.5))
	    skipBtn:setButtonImage("batch_ui/teshuanniu.png")
	    skipPanel:appendComponent(skipBtn)
	    skipBtn:setPositionInContainer(cc.p(144/2,53/2))
	    chongxingAfter_table["skipBtn"] = skipBtn
	
	    local zhandou_tiao = fc.FShaderExtensionsImage:create(0)
	    zhandou_tiao:setAnchorPoint(cc.p(0.5,0.5))
	    zhandou_tiao:setImage("batch_ui/tiao1_uizi.png")
	    zhandou_tiao:setSize(cc.size(32,32))
	    skipBtn:appendComponent(zhandou_tiao)
	    zhandou_tiao:setPositionInContainer(cc.p(52,26))
	    chongxingAfter_table["zhandou_tiao"] = zhandou_tiao
	
	    local zhandou_guo = fc.FShaderExtensionsImage:create(0)
	    zhandou_guo:setAnchorPoint(cc.p(0.5,0.5))
	    zhandou_guo:setImage("batch_ui/guo1_uizi.png")
	    zhandou_guo:setSize(cc.size(32,32))
	    skipBtn:appendComponent(zhandou_guo)
	    zhandou_guo:setPositionInContainer(cc.p(92,27))
	    chongxingAfter_table["zhandou_guo"] = zhandou_guo
  	end
    
    return chongxingAfter_table
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:onEnter()
	 g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.CHONGXING_LALIAN[1])
	 g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.CHONGXING[1])

     self:setStopTouchEvent(true)

	--宠幸前
	 self.m_chongxingBefore_table = self:createChongxingBefore()
     self:appendComponent(self.m_chongxingBefore_table["chongxing_before_panel"])
	 self.m_chongxingBefore_table["chongxing_before_panel"]:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
    
	--宠幸后
	 self.m_chongxingAfter_table = self:createChongxingAfter()
	 self:appendComponent(self.m_chongxingAfter_table["chongxing_after_panel"])
	 self.m_chongxingAfter_table["chongxing_after_panel"]:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
     self.m_chongxingAfter_table["chongxing_after_panel"]:setVisible(false)
	 self.m_chongxingAfter_table["chongxing_after_panel"]:setStopTouchEvent(true)
	 
	--宠幸前 与 宠幸后之间的拉帘动画
	 self.m_uiLalian = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
	 self.m_uiLalian:setScale(2.0)
	 self:appendComponent(self.m_uiLalian)
	 self.m_uiLalian:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,0))
	 self.m_uiLalian:setLoop(false)
	 self.m_uiLalian:setAnimationScale(1.0)
	 self.m_uiLalian:setVisible(false)
	 
	 local changeStateToLalian = function()
	 	if self.m_chongxing_state == self.STATE_SHOW_WAITING_FUCK then
	 		self:setState(self.STATE_SHOW_LALIAN)
	 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_SHAZHANG)
	 	end
	 end
	 self.m_chongxingBefore_table["beautyNakedImagePanel"]:addHandleOfcomponentEvent(changeStateToLalian, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )

--	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
	if DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
		 local removeSelf = function()
		 	 g_game.g_panelManager:removeUiPanel("chongxing_panel")
		 end
	
		 local goBackToHougong = function()
		 	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		 	if self.m_chongxing_state == self.STATE_SHOW_FUCKING then	 
		 		send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING_SKIP)		
		 		
		 		self.m_chongxingAfter_table["skipPanel"]:setVisible(false)
		 		local actions1 = g_game.g_transition.sequence({cc.FadeOut:create(0.5),CCCallFunc:create(removeSelf),CCCallFunc:create(self.m_returnCall)})
		 		self.m_chongxingAfter_table["chongxing_after_panel"]:runAction(actions1)
		 		local hougong_main = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
		 		hougong_main:setOpacity(255)
		 		--hougong_main:runAction(cc.FadeIn:create(2))
		 	end
		 end
		 
		 self.m_chongxingAfter_table["skipBtn"]:addHandleOfcomponentEvent(goBackToHougong, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		 
		 local playFuckSound = function()
		 	if self.m_chongxing_state == self.STATE_SHOW_FUCKING and self.m_deltaTime == 0  then
		 		if g_game.g_userInfoManager:beautySoundEffectIsEnable() then
		 			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING1)
		 		end
		 		self.m_deltaTime = 3
		 	end
		 end
		 self.m_chongxingAfter_table["chongxing_after_panel"]:addHandleOfcomponentEvent(playFuckSound, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		 
		 g_game.g_gameManager:addUpdateObj(self)
	end
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] setState
-- 设置state
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:setState(state)
	if self.m_chongxing_state == state then
		return
	end	

	self.m_chongxing_state = state
	
	self:updateState()
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] updateState
-- 更新宠幸状态
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:updateState()

	if self.m_chongxing_state == self.STATE_SHOW_BEFORE then
		--显示美女名字
		local selectBeautiName = g_game.g_dictConfigManager:getBeautiName(self.m_beautyId)
		self.m_chongxingBefore_table["beautyName"]:setVerString(selectBeautiName)
		--显示穿衣服美女的image
		local selectBeautiName = g_game.g_dictConfigManager:getBeautyResource(self.m_beautyId)
		local beautiImage = g_game.g_resourceManager:getBeautyDressedImage(selectBeautiName)
		self.m_chongxingBefore_table["beautyImage"]:setImage(beautiImage)
		self.m_chongxingBefore_table["beautyImage"]:setSize(cc.size(452,460))
		--设置脱光了的 image
		local nakedeImage = g_game.g_resourceManager:getBeautyNakedImage(selectBeautiName)
		self.m_chongxingBefore_table["beautyImageNaked"]:setImage(nakedeImage)
		self.m_chongxingBefore_table["beautyImageNaked"]:setSize(cc.size(452,460))
		
	--	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then 
	    if DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then 
			self.m_chongxingBefore_table["beautyNakedImagePanel"]:setOpacity(0)
		
			local showTips = function()
				self.m_chongxingBefore_table["huangshangdianwoImage"]:setVisible(true)
				local actionUp = cc.MoveBy:create(1,cc.p(0,10))
				local actionDown = cc.MoveBy:create(1,cc.p(0,-10))
				 
				local updown = g_game.g_transition.sequence({actionUp,actionDown})
				local repeatFloating = CCRepeatForever:create(updown)
				self.m_chongxingBefore_table["huangshangdianwoImage"]:runAction(repeatFloating)
			end
			
			local changeStateToWaitingTouch = function()
				self:setState(self.STATE_SHOW_WAITING_FUCK)
			end
			
			local movetoByAndCallBack = g_game.g_transition.sequence({cc.DelayTime:create(1),cc.MoveBy:create(1,cc.p(CONFIG_SCREEN_WIDTH/2-232,0))
				,cc.FadeOut:create(1),CCCallFunc:create(showTips)})
			self.m_chongxingBefore_table["beautyImage"]:runAction(movetoByAndCallBack)
			
			local showNakedAndCallBack = g_game.g_transition.sequence({cc.DelayTime:create(2),
				cc.FadeIn:create(1),CCCallFunc:create(changeStateToWaitingTouch)})
			self.m_chongxingBefore_table["beautyNakedImagePanel"]:runAction(showNakedAndCallBack)
		
		else
			self.m_chongxingBefore_table["beautyNakedImagePanel"]:setVisible(false)
		
			local showTips = function()
				self.m_chongxingBefore_table["beautyImage"]:setVisible(false)
				self.m_chongxingBefore_table["beautyNakedImagePanel"]:setVisible(true)
				self.m_chongxingBefore_table["huangshangdianwoImage"]:setVisible(true)
				local actionUp = cc.MoveBy:create(1,cc.p(0,10))
				local actionDown = cc.MoveBy:create(1,cc.p(0,-10))
				 
				local updown = g_game.g_transition.sequence({actionUp,actionDown})
				local repeatFloating = CCRepeatForever:create(updown)
				self.m_chongxingBefore_table["huangshangdianwoImage"]:runAction(repeatFloating)
				
				self:setState(self.STATE_SHOW_WAITING_FUCK)
			end
			
			local movetoByAndCallBack = g_game.g_transition.sequence({cc.DelayTime:create(1),cc.MoveBy:create(1,cc.p(CONFIG_SCREEN_WIDTH/2-232,0))
				,CCCallFunc:create(showTips)})
			self.m_chongxingBefore_table["beautyImage"]:runAction(movetoByAndCallBack)
		
		end
		
	elseif self.m_chongxing_state == self.STATE_SHOW_WAITING_FUCK then
		
	elseif self.m_chongxing_state == self.STATE_SHOW_LALIAN then
	
		self.m_uiLalian:setVisible(true)
		self.m_uiLalian:runAnimation(g_game.g_f_main_ui_effect.CHONGXING_LALIAN[2], g_game.g_f_main_ui_effect.CHONGXING_LALIAN[3])
		
		local changeStateToFucking = function()
	 		self:setState(self.STATE_SHOW_FUCKING)
		end
		
		self.m_uiLalian:registeAnimationFinishCallback(changeStateToFucking)
		
	elseif self.m_chongxing_state == self.STATE_SHOW_FUCKING then
		local removeSelf = function()
 	 		g_game.g_panelManager:removeUiPanel("chongxing_panel")
		end
	
		local gobackToHougong = function()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_BUT_CHONGXING_SKIP)		
	 		local actions1 = g_game.g_transition.sequence({cc.FadeOut:create(0.5),CCCallFunc:create(removeSelf),CCCallFunc:create(self.m_returnCall)})
	 		self.m_chongxingAfter_table["chongxing_after_panel"]:runAction(actions1)
	 		local hougong_main = g_game.g_panelManager:getUiPanel("hougong_tangquangong_bg")
	 		hougong_main:setOpacity(255)
		end
	
		local setInvisible = function()
			self.m_chongxingBefore_table["chongxing_before_panel"]:setVisible(false)
		end
		
		local fadeOut = cc.FadeOut:create(1)
		self.m_uiLalian:runAction(fadeOut)
		
		self.m_chongxingAfter_table["chongxing_after_panel"]:setVisible(true)
		self.m_chongxingAfter_table["chongxing_after_panel"]:setOpacity(0)
		self.m_chongxingAfter_table["chongxing_after_panel"]:setStopTouchEvent(true)
		
		local chongxingIng = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
		self.m_chongxingAfter_table["chongxing_after_panel"]:appendComponent(chongxingIng)
		chongxingIng:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT/2))
		chongxingIng:setAnimationSpeedScale(0.2)
		chongxingIng:setLoop(true)
		chongxingIng:runAnimation(g_game.g_f_main_ui_effect.CHONGXING[2], g_game.g_f_main_ui_effect.CHONGXING[3])
		
	--	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then 
		if  DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then 
			local actions = g_game.g_transition.sequence({cc.FadeIn:create(1),CCCallFunc:create(setInvisible)})
			self.m_chongxingAfter_table["chongxing_after_panel"]:runAction(actions)
		else
			local actions = g_game.g_transition.sequence({cc.FadeIn:create(1),CCCallFunc:create(setInvisible),cc.DelayTime:create(0.5),CCCallFunc:create(gobackToHougong)})
			self.m_chongxingAfter_table["chongxing_after_panel"]:runAction(actions)
		end
		
	end
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] update
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:update(dt)
	if self.m_chongxing_state == self.STATE_SHOW_FUCKING then
		self.m_deltaTime = self.m_deltaTime - dt
		
		if self.m_deltaTime <= 0 then
			self.m_deltaTime = 0
 		end
	end
end


------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] setReturnCallBack
-- 设置beauty id
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:setReturnCallBack(callback)
	self.m_returnCall = callback
end

------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_chongxing_panel] setBeautyId
-- 设置beauty id
-------------------------------------------------------------------------------
function f_game_beauty_chongxing_panel:setBeautyId(beautyid)
	self.m_beautyId = beautyid
	
	self:setState(self.STATE_SHOW_BEFORE)
	
end

function f_game_beauty_chongxing_panel:onExit()
	if self.m_uiLalian ~= nil then
		self:deleteComponent(self.m_uiLalian)
	end	
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.CHONGXING[1])
	g_game.g_resourceManager:removeFAnimation(g_game.g_f_main_ui_effect.CHONGXING_LALIAN[1])
	self:unregisterNodeEvent()
	
	g_game.g_gameManager:removeUpdateObj(self)
end

function f_game_beauty_chongxing_panel:onEnterTransitionFinish()
end

function f_game_beauty_chongxing_panel:onExitTransitionStart()
end

function f_game_beauty_chongxing_panel:onCleanup()
end


function f_game_beauty_chongxing_panel:registerNodeEvent(handler)
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

function f_game_beauty_chongxing_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

return f_game_beauty_chongxing_panel