local MainScene = class("MainScene", function()
    return cc.Scene:create()
end)



function MainScene:ctor()
	g_game.g_resourceManager:preloadFAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[1])
	 local zhang  = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
	 self:addChild(zhang)
	 zhang:setAnchorPoint(cc.p(0.5,0.5))
	 zhang:runAnimation(g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[2], g_game.g_f_main_ui_effect.UI_ZOUZHANG_TAX[5])
	 zhang:setPosition(cc.p(480,320))
end



function MainScene:onEnter()
--	FNetService:sharedFNetService():initMsgProtocol()

    if device.platform ~= "android" then return end

    -- avoid unmeant back
    self:performWithDelay(function()
        -- keypad layer, for android
        local layer = display.newLayer()
        layer:addKeypadEventListener(function(event)
            if event == "back" then game.exit() end
        end)
        self:addChild(layer)

        layer:setKeypadEnabled(true)
    end, 0.5)
end

return MainScene
