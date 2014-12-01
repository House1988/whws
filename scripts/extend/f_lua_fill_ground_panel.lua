local FLuaFillGroundPanel = class("FLuaFillGroundPanel", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaFillGroundPanel")
end)



function FLuaFillGroundPanel:ctor()     
    self:registerNodeEvent()    
    
end

--c++组件中的onenter回调
function FLuaFillGroundPanel:onEnter()	
end


function FLuaFillGroundPanel:onExit()    
    self:unregisterNodeEvent()
end

function FLuaFillGroundPanel:onEnterTransitionFinish()
end

function FLuaFillGroundPanel:onExitTransitionStart()
end

function FLuaFillGroundPanel:onCleanup()
end


function FLuaFillGroundPanel:registerNodeEvent(handler)
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

function FLuaFillGroundPanel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


function FLuaFillGroundPanel:createFillPanel()
	
	local maxSize = cc.size(g_game.g_real_size.width, g_game.g_real_size.height)
	local minSize = cc.size(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
	

    local w = g_game.g_real_size.width
    local h = g_game.g_real_size.height
    local scale = h / CONFIG_SCREEN_HEIGHT	  	
    
    if CONFIG_SCREEN_WIDTH * scale > w then
    	scale = w / CONFIG_SCREEN_WIDTH	  
    end
    minSize = cc.size(CONFIG_SCREEN_WIDTH * scale, CONFIG_SCREEN_HEIGHT * scale)
	
	
	
	local topbottom_HorFillCount = math.ceil(g_game.g_real_size.width/390)
	local topbottom_VerFillCount = math.ceil((maxSize.height - minSize.height)/115)
	
	local leftright_HorFillCount = math.ceil((maxSize.width - minSize.width)/115)
	local leftright_VerFillCount = math.ceil(g_game.g_real_size.height/390)
	
	for i = 1, topbottom_VerFillCount do
		for j = 1, topbottom_HorFillCount do
			local topItem = fc.FExtensionsImage:create()
	   		topItem:setImage("nobatch/tiechong.png")
	    	topItem:setSize(cc.size(390,115))
			self:appendComponent(topItem)
			topItem:setAnchorPoint(cc.p(0, 0))
			local yPos = - ((i - 1) * 115)
			topItem:setPositionInContainer(cc.p((j - 1) * 390, yPos))
			
			local bottomItem = fc.FExtensionsImage:create()
	   		bottomItem:setImage("nobatch/tiechong.png")
	    	bottomItem:setSize(cc.size(390,115))
			self:appendComponent(bottomItem)
			bottomItem:setAnchorPoint(cc.p(0, 1))
			yPos = CONFIG_SCREEN_HEIGHT + ((i - 1) * 115)
			bottomItem:setPositionInContainer(cc.p((j - 1) * 390, yPos))
	
		end
	end

	for i = 1, leftright_HorFillCount do
		for j = 1, leftright_VerFillCount do
			local leftItem = fc.FExtensionsImage:create()
	   		leftItem:setImage("nobatch/tiechong.png")
	    	leftItem:setSize(cc.size(390,115))
    		leftItem:setRotation(90)
			self:appendComponent(leftItem)
			leftItem:setAnchorPoint(cc.p(0.5, 0.5))
			local xPos = - ((i - 1) * 115 + 55)
			leftItem:setPosition(cc.p( xPos, (j - 1) *390 + 195))
			
			
			local rightItem = fc.FExtensionsImage:create()
	   		rightItem:setImage("nobatch/tiechong.png")
	    	rightItem:setSize(cc.size(390,115))
    		rightItem:setRotation(-90)
			self:appendComponent(rightItem)
			rightItem:setAnchorPoint(cc.p(0.5, 0.5))
			xPos = CONFIG_SCREEN_WIDTH + (i - 1) * 115 + 55
			rightItem:setPosition(cc.p(xPos, (j - 1) *390 + 195))
		end	
	end

end

return FLuaFillGroundPanel