require ("scripts.manager.fluapanelmanager")

local f_loading_scene = class("f_loading_scene", function()
    return g_game.g_classFactory.newFLuaScene("f_loading_scene")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_loading_scene:ctor()  
  	self:registerNodeEvent()
  
  	self.STATE_LOADING_BATTLE 			= 1 --  加载战斗场景数据 
  	self.STATE_LOADING_MAINCITY 		= 2 --  加载主场景数据  
  	self.STATE_LOADING_LOGIN	 		= 3 --  加载登陆场景数据 
  	self.STATE_LOADING_STORY			= 4 --  加载剧情数据
  	
  	self.SUB_STATE_PRELOAD_REMOVE_DATA	= 1
  	self.SUB_STATE_PRELOAD_LOADING_DATA	= 2
  	self.SUB_STATE_RUNING				= 3
  	self.SUB_STATE_LOADING_FINISH		= 4
  		
  	self.m_update_function_table = {}  	
  	local loadBattle = function(dt)
  		self:updateLoadBattleData(dt)
  	end
  	self.m_update_function_table[self.STATE_LOADING_BATTLE] = loadBattle  	
  	local loadMaincity = function(dt)
  		self:updateLoadMainCityData(dt)
  	end
  	self.m_update_function_table[self.STATE_LOADING_MAINCITY] = loadMaincity  	
  	local loadLogin = function(dt)
  		self:updateLoadLoginData(dt)
  	end
  	self.m_update_function_table[self.STATE_LOADING_LOGIN] = loadLogin  
  	
  	local loadStory = function(dt)
  		self:updateLoadStoryData(dt)
  	end
  	self.m_update_function_table[self.STATE_LOADING_STORY] = loadStory 
  	
  	
  	self.m_current_loading_type	= self.STATE_LOADING_BATTLE
  	self.m_current_sub_state	= self.SUB_STATE_PRELOAD_REMOVE_DATA
  	
  	self.m_time = 5.0
  	self.m_load_index = 1
  	self.m_totalTime = 0
  	
  	self.m_data					= nil
  	
  	self.m_need_load_data_table = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] registerNodeEvent
-- 注册事件回调 
-------------------------------------------------------------------------------
function f_loading_scene:registerNodeEvent(handler)
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
-- @function [parent=#f_loading_scene] unregisterNodeEvent
-- 删除事件回调
-------------------------------------------------------------------------------
function f_loading_scene:unregisterNodeEvent()
    self:unregisterScriptHandler()
end



-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] onEnter
-------------------------------------------------------------------------------
function f_loading_scene:onEnter()
	
	g_game.g_panelManager:resetAllPanelConfig()
	
	self:config_layer()
	g_game.g_panelManager:createPanelContainer()   
	  
	self.m_panelTable = createloadingjiemian()
	
    self.m_progress_image = nil
    self.m_progress_panel = nil
    
    self:createImageProgress()
    
	g_game.g_panelManager:showUiPanel(self.m_panelTable["loadingjiemian"],"loadingjiemian")
	
	self.m_currentTip = 1
	self.m_tipArray = g_game.g_dictConfigManager:getLoadingTip()
	local str = g_game.g_dictConfigManager:getLanTextById(self.m_tipArray[self.m_currentTip][2])
	self.m_panelTable["tip"]:setString(str)
	self.m_panelTable["precent"]:setVisible(false)
	self.m_tipTime = 0

	send_lua_event(g_game.g_f_lua_game_event.F_LUA_CLEAR_LOADING_FLAG)
	
	g_game.g_gameManager:addUpdateObj(self)
end

function f_loading_scene:update(dt)
	self.m_totalTime = self.m_totalTime + dt
	if self.m_totalTime > 1.0 then
		self.m_update_function_table[self.m_current_loading_type](dt)
	end
	
	self.m_tipTime = self.m_tipTime + dt
	if self.m_tipTime > 5 then
		self.m_currentTip = self.m_currentTip + 1
		if self.m_currentTip > #self.m_tipArray then
			self.m_currentTip = 1
		end
		self.m_panelTable["tip"]:setString(self.m_tipArray[self.m_currentTip][2])
		self.m_tipTime = self.m_tipTime - 5
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] onExit
-------------------------------------------------------------------------------
function f_loading_scene:onExit()  
	g_game.g_gameManager:removeUpdateObj(self)  
	
	g_game.g_current_loading_scene = nil
	
    self:unregisterNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_loading_scene:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] onExitTransitionStart
-------------------------------------------------------------------------------
function f_loading_scene:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] onCleanup
-------------------------------------------------------------------------------
function f_loading_scene:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] registerServerMessage
-------------------------------------------------------------------------------
function f_loading_scene:registerServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] unregisterServerMessage
-------------------------------------------------------------------------------
function f_loading_scene:unregisterServerMessage()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] createImageProgress
-- 创建图像进度条
-------------------------------------------------------------------------------
function f_loading_scene:createImageProgress()	
	self.m_panelTable["loading_meinv"]:setImage(g_game.g_resourceManager:getUiMap("update_background"))
    self.m_panelTable["loading_meinv"]:setExtensionsTextureRect(cc.rect(0,0,960,640))

    local bgUpdateImage = fc.FShaderExtensionsImage:create(2)
    bgUpdateImage:setAnchorPoint(cc.p(0.5,0.5))
    bgUpdateImage:setImage("nobatch/loadingx.png")
    bgUpdateImage:setSize(cc.size(742, 55))
    self.m_panelTable["loadingjiemian"]:appendComponent(bgUpdateImage)
    bgUpdateImage:setPositionInContainer(cc.p(480,550))
    
    
    self.m_progress_panel = fc.FContainerPanel:create()
    self.m_progress_panel:setSize(cc.size(0, 173))
    	
    self.m_progress_image = fc.FShaderExtensionsImage:create(0)
    self.m_progress_image:setAnchorPoint(cc.p(0.5,0.5))
    self.m_progress_image:setImage("nobatch/loadingx.png")
    self.m_progress_image:setSize(cc.size(742, 55))
    self.m_progress_panel:appendComponent(self.m_progress_image)
    self.m_progress_image:setPositionInContainer(cc.p(742/2,173/2))
    
    self.m_panelTable["loadingjiemian"]:appendComponent(self.m_progress_panel)
    
    self.m_progress_panel:setAnchorPoint(cc.p(0, 0.5))
    self.m_progress_panel:setPositionInContainer(cc.p(480-742/2, 550))
    self.m_progress_panel:enableClipping(true)
end


-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] updateImageProgress
-- 更新图像进度
-------------------------------------------------------------------------------
function f_loading_scene:updateImageProgress(num)	
	if self.m_progress_panel then
		self.m_progress_panel:setSize(cc.size(num/100.0*742, 173))    	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] setLoadingType
-- 设置加载类型  1 战斗场景   2 主场景  3 登陆场景  4剧情
-------------------------------------------------------------------------------
function f_loading_scene:setLoadingType(loadingType)
  	self.m_current_loading_type	= loadingType
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] setLoadingData
-- 设置加载数据
-------------------------------------------------------------------------------
function f_loading_scene:setLoadingData(data)
	self.m_data = data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadBattleDataRemoveUnUsed
-- 预加载主场景资源列表,删除已使用的资源
-------------------------------------------------------------------------------
function f_loading_scene:preloadBattleDataRemoveUnUsed()  
	g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui0"))
    g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui1"))
	g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui2"))
    
	--卸载所有未使用资源
	g_game.g_resourceManager:removeAllAnimation()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadBattleData
-- 预加载战斗资源列表
-------------------------------------------------------------------------------
function f_loading_scene:preloadBattleData()

	--兵种普通攻击技能
	local resourceItem = {1, "tx_bubing_pugong"}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, "tx_gongbing_pugong"}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, "tx_huoqiajngshou_pugong"}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, "tx_qibing_pugong"}
	table.insert(self.m_need_load_data_table, resourceItem)
	
	--名臣技能
--	resourceItem = {1, "tx_zd_zhiliao_danti"}
--	table.insert(self.m_need_load_data_table, resourceItem)	
--	resourceItem = {1, "tx_bubing_mingchendanti"}
--	table.insert(self.m_need_load_data_table, resourceItem)	
--	resourceItem = {1, "tx_gongbing_mingchendanti"}
--	table.insert(self.m_need_load_data_table, resourceItem)	
--	resourceItem = {1, "tx_qibing_mingchendanti"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_huoqiangbing_mingchendanti"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_zd_lijian"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_zd_junxuguan"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_zd_yaohai"}
--	table.insert(self.m_need_load_data_table, resourceItem)
	
	--皇子技能
--	resourceItem = {1, "tx_huangzi_guwushiqi"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_huangzi_gunmu"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_huangzi_jianyu"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_huangzi_huopao"}
--	table.insert(self.m_need_load_data_table, resourceItem)
--	resourceItem = {1, "tx_huangzi_luoshi"}
--	table.insert(self.m_need_load_data_table, resourceItem)
	
	
	
	--决斗
    resourceItem = {1, "ui_juedou"}
	table.insert(self.m_need_load_data_table, resourceItem)
	
	--基础特效
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_KAICHANG_YUN[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_CARD_BACKGROUND_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_SOLIDER_FLAG_BUFFER[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_KEZHI_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_MINGCHENG_CHUCHANG[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_LOADING[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.XINSHOU_ZHIYIN_MAOBI[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] loadingBattleData
-- 加载战斗资源列表
-------------------------------------------------------------------------------
function f_loading_scene:loadingBattleData(index)
	local resourceItem = self.m_need_load_data_table[index]
	
	if resourceItem[1] == 1 then
		g_game.g_resourceManager:preloadFAnimation(resourceItem[2])
	end

end
-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] updateLoadBattleData
-- 加载战斗数据
-------------------------------------------------------------------------------
function f_loading_scene:updateLoadBattleData(dt)
	if self.m_data == nil then
		return 
	end
	self.m_time = self.m_time - dt
	
	if self.m_current_sub_state	== self.SUB_STATE_PRELOAD_REMOVE_DATA then
	    
		self:preloadBattleDataRemoveUnUsed()
		self.m_current_sub_state = self.SUB_STATE_PRELOAD_LOADING_DATA
	elseif self.m_current_sub_state	== self.SUB_STATE_PRELOAD_LOADING_DATA then
		self:preloadBattleData()
		self.m_current_sub_state = self.SUB_STATE_RUNING
	elseif self.m_current_sub_state	== self.SUB_STATE_RUNING then
		if self.m_load_index > #self.m_need_load_data_table then
			self.m_current_sub_state = self.SUB_STATE_LOADING_FINISH
			return 
		end
		self:loadingBattleData(self.m_load_index)		
		if #self.m_need_load_data_table == 0 then
			self:updateImageProgress(100)
		else
			local p = self.m_load_index/#self.m_need_load_data_table*100
			self:updateImageProgress(p)
		end
		
		self.m_load_index = self.m_load_index + 1
	elseif self.m_current_sub_state	== self.SUB_STATE_LOADING_FINISH then
		g_game.enterBattleScene()	
	end	
end
















-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadMaincityDataRemoveUnUsed
-- 预加载主场景资源列表,删除已使用的资源
-------------------------------------------------------------------------------
function f_loading_scene:preloadMaincityDataRemoveUnUsed()
	g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("login_ui"))	 
	g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("battle_ui"))
	

	--卸载所有未使用资源
	g_game.g_resourceManager:removeAllAnimation()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadMaincityData
-- 预加载主场景资源列表
-------------------------------------------------------------------------------
function f_loading_scene:preloadMaincityData()
	
	local resourceItem = {1, g_game.g_f_main_ui_effect.QIANGUYIDI_JIANTOU[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.XINSHOU_ZHIYIN_MAOBI[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_LOADING[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_CARD[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_BIG_CARD[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_JIE_MIAN[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.MAIN_SCENE_NPC[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_JIE_MIAN_B[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_JIE_MIAN_C[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_XUNFANG_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	resourceItem = {1,g_game.g_f_main_ui_effect.UI_XUANXIU_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	
	--
	resourceItem = {1, g_game.g_f_battle_ui_effect.BATTLE_UI_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	
	g_game.g_audioManager:preloadAllEffect()
end
-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] loadingMainData
-- 加载主场景资源列表
-------------------------------------------------------------------------------
function f_loading_scene:loadingMainData(index)
	local resourceItem = self.m_need_load_data_table[index]
	
	if resourceItem[1] == 1 then
		g_game.g_resourceManager:preloadFAnimation(resourceItem[2])
	end

end
-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] updateLoadMainCityData
-- 加载主场景数据
-------------------------------------------------------------------------------
function f_loading_scene:updateLoadMainCityData(dt)
	if self.m_data == nil then
		return 
	end
	self.m_time = self.m_time - dt

	if self.m_current_sub_state	== self.SUB_STATE_PRELOAD_REMOVE_DATA then
		self:preloadMaincityDataRemoveUnUsed()
		self.m_current_sub_state = self.SUB_STATE_PRELOAD_LOADING_DATA
	elseif self.m_current_sub_state	== self.SUB_STATE_PRELOAD_LOADING_DATA then	
		self:preloadMaincityData()
		self.m_current_sub_state = self.SUB_STATE_RUNING
	elseif self.m_current_sub_state	== self.SUB_STATE_RUNING then
		if self.m_load_index > #self.m_need_load_data_table then
			self.m_current_sub_state = self.SUB_STATE_LOADING_FINISH
			return 
		end
		self:loadingMainData(self.m_load_index)	
		if #self.m_need_load_data_table == 0 then
			self:updateImageProgress(100)
		else
			local p = self.m_load_index/#self.m_need_load_data_table*100
			self:updateImageProgress(p)
		end
		self.m_load_index = self.m_load_index + 1
	elseif self.m_current_sub_state	== self.SUB_STATE_LOADING_FINISH then
		g_game.enterGameScene()		
	end
end





-----------

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadLoginDataRemoveUnUsed
-- 预加载主场景资源列表,删除已使用的资源
-------------------------------------------------------------------------------
function f_loading_scene:preloadLoginDataRemoveUnUsed()  
	g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui0"))
    g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui1"))
	g_game.g_resourceManager:removeTextureByMsgpack(g_game.g_resourceManager:getBatchUIPath("main_ui2"))
    
	--卸载所有未使用资源
	g_game.g_resourceManager:removeAllAnimation()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadLoginData
-- 预加载登陆场景资源列表
-------------------------------------------------------------------------------
function f_loading_scene:preloadLoginData()
	
	
	local resourceItem = {1,g_game.g_f_main_ui_effect.UI_LOADING[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
	local resourceItem = {1,g_game.g_f_login_in_ui_effect.LOGIN_IN_EFFECT[1]}
	table.insert(self.m_need_load_data_table, resourceItem)
end
-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] loadingLoginData
-- 加载登陆场景资源列表
-------------------------------------------------------------------------------
function f_loading_scene:loadingLoginData(index)
	local resourceItem = self.m_need_load_data_table[index]
	
	if resourceItem[1] == 1 then
		g_game.g_resourceManager:preloadFAnimation(resourceItem[2])
	end

end


-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadStoryDataRemoveUnUsed
-------------------------------------------------------------------------------
function f_loading_scene:preloadStoryDataRemoveUnUsed()
	g_game.g_resourceManager:removeAllAnimation()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] preloadStoryData
-------------------------------------------------------------------------------
function f_loading_scene:preloadStoryData()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] loadingStoryData
-------------------------------------------------------------------------------
function f_loading_scene:loadingStoryData(index)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] updateLoadStoryData
-------------------------------------------------------------------------------
function f_loading_scene:updateLoadStoryData(dt)
	if self.m_data == nil then
		return 
	end
	
	self.m_time = self.m_time - dt
	
	if self.m_current_sub_state	== self.SUB_STATE_PRELOAD_REMOVE_DATA then
		self:preloadStoryDataRemoveUnUsed()
		self.m_current_sub_state = self.SUB_STATE_PRELOAD_LOADING_DATA
	elseif self.m_current_sub_state	== self.SUB_STATE_PRELOAD_LOADING_DATA then
		self:preloadStoryData()
		self.m_current_sub_state = self.SUB_STATE_RUNING
	elseif self.m_current_sub_state	== self.SUB_STATE_RUNING then
		if self.m_load_index > #self.m_need_load_data_table then
			self.m_current_sub_state = self.SUB_STATE_LOADING_FINISH
			return 
		end
		self:loadingStoryData(self.m_load_index)		
		if #self.m_need_load_data_table == 0 then
			self:updateImageProgress(100)
		else
			local p = self.m_load_index/#self.m_need_load_data_table*100
			self:updateImageProgress(p)
		end
		
		self.m_load_index = self.m_load_index + 1
	elseif self.m_current_sub_state	== self.SUB_STATE_LOADING_FINISH then
		g_game.enterStoryScene()
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_loading_scene] updateLoadLoginData
-- 加载登陆场景数据
-------------------------------------------------------------------------------
function f_loading_scene:updateLoadLoginData(dt)
	if self.m_data == nil then
		return 
	end
	self.m_time = self.m_time - dt

	if self.m_current_sub_state	== self.SUB_STATE_PRELOAD_REMOVE_DATA then
	   
		self:preloadLoginDataRemoveUnUsed()
		self.m_current_sub_state = self.SUB_STATE_PRELOAD_LOADING_DATA
	elseif self.m_current_sub_state	== self.SUB_STATE_PRELOAD_LOADING_DATA then
		self:preloadLoginData()
		self.m_current_sub_state = self.SUB_STATE_RUNING
	elseif self.m_current_sub_state	== self.SUB_STATE_RUNING then
		if self.m_load_index > #self.m_need_load_data_table then
			self.m_current_sub_state = self.SUB_STATE_LOADING_FINISH
			return 
		end
		self:loadingLoginData(self.m_load_index)	
		if #self.m_need_load_data_table == 0 then
			self:updateImageProgress(100)
		else
			local p = self.m_load_index/#self.m_need_load_data_table*100
			self:updateImageProgress(p)
		end
		self.m_load_index = self.m_load_index + 1
	elseif self.m_current_sub_state	== self.SUB_STATE_LOADING_FINISH then
		if DEBUG_SDK_TYPE == 3 or DEBUG_SDK_TYPE == 22 or DEBUG_SDK_TYPE == 11 then
			if g_resource.g_resource_update_manager.m_is_need_wait_app_update_result == nil or g_resource.g_resource_update_manager.m_is_need_wait_app_update_result == false then
				g_game.enterLoginScene()
			end
		else
			g_game.enterLoginScene()	
		end	
	end
end

return f_loading_scene
