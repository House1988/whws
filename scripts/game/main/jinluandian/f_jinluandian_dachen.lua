require("scripts.auto.auto_jinluandian_zouzhangtanchu")
require("scripts.game.main.card.f_card_paibing_huangzi")

--定义不同种类的大臣
local dachen_type = {}
dachen_type.LIBU1   = 1
dachen_type.HUBU    = 2
dachen_type.LIBU2   = 3
dachen_type.BINGBU  = 4
dachen_type.XINGBU  = 5
dachen_type.GONGBU  = 6
dachen_type.PUTONG  = 7

--[[
	继承自container panel, 用于添加大臣动画
]]--

local FLuaJinluandianDachen = class("FLuaJinluandianDachen", function()
    return g_game.g_classFactory.newFLuaContainerPanel("FLuaJinluandianDachen")
end)


-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:ctor()     
    self:registerNodeEvent()  
    
    self.m_dachen = nil 
    self.m_dachen_fuzhuang = nil
    self.m_dachen_type = nil
    self.m_parent_panel = nil
    self.m_zouzhangtanchu_table = nil
    self.m_dachen_position_x = nil
    self.m_dachen_position_y = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] onEnter
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:onEnter()  
	self:setOpacity(255)
	self:setVisible(true)
end


function FLuaJinluandianDachen:onExit()    
    self:unregisterNodeEvent()
    
    self.m_dachen = nil 
    self.m_dachen_fuzhuang = nil
    self.m_dachen_type = nil
    self.m_parent_panel = nil
    self.m_zouzhangtanchu_table = nil
    self.m_dachen_position_x = nil
    
end

function FLuaJinluandianDachen:onEnterTransitionFinish()
end

function FLuaJinluandianDachen:onExitTransitionStart()
end

function FLuaJinluandianDachen:onCleanup()
end


function FLuaJinluandianDachen:registerNodeEvent(handler)
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
-- @function [parent=#FLuaJinluandianDachen] unregisterNodeEvent
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] setDachenFlip
-- 设置大臣是否需要反转
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:setDachenFlip(flip)	
	self.m_dachen:setScaleX(-1)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] setDachen
-- 设置大臣种类
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:setDachen(dachenType, parentPanel, position_x)
	
	self.m_parent_panel = parentPanel
	self.m_dachen_position_x = position_x
		
	--创建显示人物动画的组件
	if self.m_dachen == nil then
		self.m_dachen = g_game.g_classFactory.newFLuaAnimationComponent("FAC")		
		self:appendComponent(self.m_dachen)
	end
	self.m_dachen:setVisible(true)
	self.m_dachen:setAnchorPoint(cc.p(0.5,0.5))
	self.m_dachen:setPositionInContainer(cc.p(50, 50))	
	self.m_dachen:setLoop(false)	
	self.m_dachen:setAnimationScale(1.0)
	self.m_dachen_type = dachenType
	if dachenType == dachen_type.PUTONG then
		self.m_dachen_fuzhuang = "lan"
	else
		--特殊大臣添加标识
		local dachenzhiwei_bg = fc.FExtensionsImage:create()
		dachenzhiwei_bg:setImage("batch_ui/dachenzhiweidiwen_jinluandian.png")
		dachenzhiwei_bg:setSize(cc.size(23,90))
		dachenzhiwei_bg:setAnchorPoint(cc.p(0.5,0.5))		
		self:appendComponent(dachenzhiwei_bg)
		dachenzhiwei_bg:setPositionInContainer(cc.p(17,56))
		
		local dachenzhiwei_label = fc.FLabel:createBMFont()
	    dachenzhiwei_label:setSize(cc.size(23,40))
	    dachenzhiwei_label:setAnchorPoint(cc.p(0.5,0.5))
	    dachenzhiwei_label:setFontSize(20)	
	    
	    local t = {}
	    if LANGUAGE_TYPE == 3 then
	   		t[1]= "吏部"  t[2]= "戶部" t[3]= "禮部" t[4]="兵部" t[5]="刑部" t[6]="工部"
	    else
			t[1]= "吏部"  t[2]= "户部" t[3]= "礼部" t[4]="兵部" t[5]="刑部" t[6]="工部"
	    end			
		
		if dachenType == dachen_type.LIBU1 then
			self.m_dachen_fuzhuang = "lan"	
			dachenzhiwei_label:setVerString(t[1])
		elseif dachenType == dachen_type.HUBU then
			self.m_dachen_fuzhuang = "hong"
			dachenzhiwei_label:setVerString(t[2])
		elseif dachenType == dachen_type.LIBU2 then
			self.m_dachen_fuzhuang = "zi"
			dachenzhiwei_label:setVerString(t[3])
		elseif dachenType == dachen_type.BINGBU then
			self.m_dachen_fuzhuang = "lan"
			dachenzhiwei_label:setVerString(t[4])
		elseif dachenType == dachen_type.XINGBU then
			self.m_dachen_fuzhuang = "hong"
			dachenzhiwei_label:setVerString(t[5])
		elseif dachenType == dachen_type.GONGBU then
			self.m_dachen_fuzhuang = "zi"
			dachenzhiwei_label:setVerString(t[6])
		end
			    
	    dachenzhiwei_label:setWidth(25)
	    dachenzhiwei_label:setColor(cc.c3b(0,0,0))	    
	    self:appendComponent(dachenzhiwei_label)
	    dachenzhiwei_label:setPositionInContainer(cc.p(17,45))
	end	
	
	local xiaguiDonghua = function()
		--设置延长一段时间后播放下跪动画
		self:xiaguiDonghua()
	end
	
	--进入后播放站立动画
	--self.m_dachen:runAnimation("renwu_dachen", "dachen_" .. self.m_dachen_fuzhuang .."_zhanli")
	--站立动画播放完成，播放下跪动画
	--self.m_dachen:registeAnimationFinishCallback(xiaguiDonghua)	
	self:xiaguiDonghua()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] xiaguiDonghua
-- 播放大臣下跪动画
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:xiaguiDonghua()
	local qishenCallback = function()
		self:qishenDonghua()
	end
	local qishenDonghua = function()
		--设置延长一段时间后播放下跪动画
		local sequence = g_game.g_transition.sequence({cc.DelayTime:create(1),cc.CallFunc:create(qishenCallback)})
		self:runAction(sequence)
	end
	self.m_dachen:setLoop(false)	
	self.m_dachen:runAnimation("renwu_dachen", "dachen_" .. self.m_dachen_fuzhuang .. "_xiagui")
	--下跪动画播放结束，停一段时间播放起身动画
	self.m_dachen:registeAnimationFinishCallback(qishenDonghua)		
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] xiaguiDonghuaFromClick
-- 播放大臣下跪动画(点击后的下跪动画，与上个函数的区别是回调不同，不起身，只弹出框)
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:xiaguiDonghuaFromClick()
	local popDuihuakuangCallback = function()
		self:popDuihuakuang()
	end
	local popDuihuakuang = function()
		--设置延长一段时间后播放下跪动画
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI)
		
		local sequence = g_game.g_transition.sequence({cc.DelayTime:create(0.5),cc.CallFunc:create(popDuihuakuangCallback)})
		self:runAction(sequence)
	end
	self.m_dachen:setLoop(false)		
	self.m_dachen:runAnimation("renwu_dachen", "dachen_" .. self.m_dachen_fuzhuang .. "_xiagui")
	--下跪动画播放结束，停一段时间播放起身动画
	self.m_dachen:registeAnimationFinishCallback(popDuihuakuang)		
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] qishenDonghua
-- 播放大臣起身动画
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:qishenDonghua()
	local zhanliDonghua = function()
	    local registerTanchu = function()
	    	self:registerTanchu()
	    end
		self.m_dachen:setLoop(false)	
		self.m_dachen:runAnimation("renwu_dachen", "dachen_" .. self.m_dachen_fuzhuang .. "_zhanli")
		--站立动画播放结束，注册触摸弹出事件
		self.m_dachen:registeAnimationFinishCallback(registerTanchu)	
		
	end	
	self.m_dachen:setLoop(false)	
	self.m_dachen:runAnimation("renwu_dachen", "dachen_" .. self.m_dachen_fuzhuang .. "_qishen")
	--起身动画播放结束，播放站立动画
	self.m_dachen:registeAnimationFinishCallback(zhanliDonghua)		
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] registerTanchu
-- 注册弹出事件
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:registerTanchu()
	self.m_parent_panel:removeWansui()
	--只有特殊大臣才有触摸事件
	if self.m_dachen_type ~= dachen_type.PUTONG then	
		--开启触摸事件
		self:setTouchEnabled(true)
		--绑定触摸事件——大臣移动到屏幕中央动作(同时取消其他任务的触摸事件)
		local gotoScreenCenter = function()
			self:gotoScreenCenter()
			send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		end
		self:addHandleOfcomponentEvent(gotoScreenCenter,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	end	
	--消除吾皇万岁的动画
	
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] gotoScreenCenter
-- 将大臣移动到屏幕中央，并且下跪
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:gotoScreenCenter()
	local cancelTouchCallback = function()
		self:cancelTouch()
	end
	
	local xiaguiDonghuaFromClickCallback = function()
		self:xiaguiDonghuaFromClick()
	end
	--sequence事件（取消其他特殊大臣的触摸事件  移动到屏幕中央  播放下跪动作）
	local sequence = g_game.g_transition.sequence({cc.CallFunc:create(cancelTouchCallback),
					cc.Place:create(cc.p(CONFIG_SCREEN_WIDTH/2-17,self:getPositionY())), 
					cc.CallFunc:create(xiaguiDonghuaFromClickCallback),
					})
	self:runAction(sequence)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] cancelTouch
-- 点击后取消特殊大臣的触摸事件
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:cancelTouch()
	self.m_parent_panel:cancelTouch()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] recoverTouch
-- 恢复特殊大臣的触摸事件
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:recoverTouch()
	self.m_parent_panel:recoverTouch()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] popDuihuakuang
-- 弹出对话框
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:popDuihuakuang()
	self.m_zouzhangtanchu_table = createjinluandian_zouzhangtanchu()
    local zouzhang = self.m_zouzhangtanchu_table["jinluandian_zouzhangtanchu"]
    --设置变大动作
    local zouzhangTanchuPanel = self.m_zouzhangtanchu_table["jld_zztc_tc_panel"]
    zouzhangTanchuPanel:setScale(0.1)
    local biandaDonghua = cc.ScaleTo:create(0.2, 1.0)
    zouzhangTanchuPanel:runAction(biandaDonghua)
    --设置奏章位置       
    self.m_parent_panel:appendComponent(zouzhang)
    zouzhang:setAnchorPoint(cc.p(0.5,0.5)) 
    zouzhang:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
    
    --设置奏章“请皇上吩咐”的人物
    if LANGUAGE_TYPE == 3 then
    	if self.m_dachen_type == dachen_type.LIBU1 then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("吏部尚書：請皇上吩咐")
		elseif self.m_dachen_type == dachen_type.HUBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("戶部尚書：請皇上吩咐")
		elseif self.m_dachen_type == dachen_type.LIBU2 then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("禮部尚書：請皇上吩咐")
		elseif self.m_dachen_type == dachen_type.BINGBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("兵部尚書：請皇上吩咐")
		elseif self.m_dachen_type == dachen_type.XINGBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("刑部尚書：請皇上吩咐")
		elseif self.m_dachen_type == dachen_type.GONGBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("工部尚書：請皇上吩咐")
		end 
    
    else	
    	if self.m_dachen_type == dachen_type.LIBU1 then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("吏部尚书：请皇上吩咐")
		elseif self.m_dachen_type == dachen_type.HUBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("户部尚书：请皇上吩咐")
		elseif self.m_dachen_type == dachen_type.LIBU2 then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("礼部尚书：请皇上吩咐")
		elseif self.m_dachen_type == dachen_type.BINGBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("兵部尚书：请皇上吩咐")
		elseif self.m_dachen_type == dachen_type.XINGBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("刑部尚书：请皇上吩咐")
		elseif self.m_dachen_type == dachen_type.GONGBU then
			self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setString("工部尚书：请皇上吩咐")
		end 
    end
    
    
        
    
    --设置奏章的背景为半透明
    self.m_zouzhangtanchu_table["jld_bantouming_image"]:setOpacity(175)
    --设置事件的吞没
    zouzhang:setStopTouchEvent(true)
    
    --设置绑定事件
    local buttonLeft = function()
    	self:buttonLeftClick()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_zouzhangtanchu_table["jld_zztc_button1"]:addHandleOfcomponentEvent(buttonLeft,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local buttonMiddle = function()
    	self:buttonMiddleClick()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_zouzhangtanchu_table["jld_zztc_button2"]:addHandleOfcomponentEvent(buttonMiddle,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local buttonRight = function()
    	self:buttonRightClick()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_zouzhangtanchu_table["jld_zztc_button3"]:addHandleOfcomponentEvent(buttonRight,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
    
    local buttonCancel = function()
    	self:buttonCancelClick()
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUIQU)
    	send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
    end
    self.m_zouzhangtanchu_table["jld_zztc_button4"]:addHandleOfcomponentEvent(buttonCancel,g_game.g_f_touch_event.F_TOUCH_UPINSIDE)	
	
	--依据不同的大臣类型，动态显示按钮（个数和按钮的显示文字）
	local leftButton = self.m_zouzhangtanchu_table["jld_zztc_button1"];
	local middleButton = self.m_zouzhangtanchu_table["jld_zztc_button2"];
	local rightButton = self.m_zouzhangtanchu_table["jld_zztc_button3"];
	if self.m_dachen_type == dachen_type.LIBU1 then
		--设置中右按钮隐藏
		middleButton:setVisible(false)
		rightButton:setVisible(false)
		--调整科举按钮位置与文字
		leftButton:setPositionInContainer(cc.p(245,143))
		if LANGUAGE_TYPE == 3 then
			leftButton:setText("科舉", g_game.g_yellow_btn_text_color)
		else	
			leftButton:setText("科举", g_game.g_yellow_btn_text_color)
		end
	elseif self.m_dachen_type == dachen_type.HUBU then
		--设置右按钮隐藏
		rightButton:setVisible(false)
		--调整选秀和寻访按钮位置与文字
		leftButton:setPositionInContainer(cc.p(168,143))
		if LANGUAGE_TYPE == 3 then
			leftButton:setText("選秀", g_game.g_yellow_btn_text_color)
			middleButton:setText("微服私訪", g_game.g_yellow_btn_text_color)
		else
			leftButton:setText("选秀", g_game.g_yellow_btn_text_color)
			middleButton:setText("微服私访", g_game.g_yellow_btn_text_color)
		end
		middleButton:setPositionInContainer(cc.p(322,143))
	elseif self.m_dachen_type == dachen_type.LIBU2 then
		--设置右按钮隐藏
		rightButton:setVisible(false)
		--调整成就和目标按钮位置与文字
		leftButton:setPositionInContainer(cc.p(168,143))
		if LANGUAGE_TYPE == 3 then
			leftButton:setText("真龍寶閣", g_game.g_yellow_btn_text_color)
			middleButton:setText("祭天", g_game.g_yellow_btn_text_color)
		else
			leftButton:setText("真龙宝阁", g_game.g_yellow_btn_text_color)
			middleButton:setText("祭天", g_game.g_yellow_btn_text_color)
		end
		
		middleButton:setPositionInContainer(cc.p(322,143))
	elseif self.m_dachen_type == dachen_type.BINGBU then
		--设置右按钮隐藏
		rightButton:setVisible(false)
		--调整选秀和寻访按钮位置与文字
		leftButton:setPositionInContainer(cc.p(168,143))
		if LANGUAGE_TYPE == 3 then
			leftButton:setText("南征北討", g_game.g_yellow_btn_text_color)
			middleButton:setText("排兵佈陣", g_game.g_yellow_btn_text_color)
		else
			leftButton:setText("南征北讨", g_game.g_yellow_btn_text_color)
			middleButton:setText("排兵布阵", g_game.g_yellow_btn_text_color)
		end
		
		middleButton:setPositionInContainer(cc.p(322,143))
		
	elseif self.m_dachen_type == dachen_type.XINGBU then
		--设置三个按钮隐藏
		leftButton:setVisible(false)
		middleButton:setVisible(false)
		rightButton:setVisible(false)
		self.m_zouzhangtanchu_table["jld_zztc_button4"]:setPositionInContainer(cc.p(245,185))
		self.m_zouzhangtanchu_table["jld_zztc_fenfu_label"]:setPositionInContainer(cc.p(245,88))
	elseif self.m_dachen_type == dachen_type.GONGBU then
		--设置右按钮隐藏
		rightButton:setVisible(false)
		leftButton:setVisible(false)
		--调整内政和兵器按钮位置与文字
--		leftButton:setPositionInContainer(cc.p(168,143))
--		leftButton:setText("内政建筑", g_game.g_yellow_btn_text_color)
--		middleButton:setPositionInContainer(cc.p(322,143))
		if LANGUAGE_TYPE == 3 then
			middleButton:setText("藏書閣", g_game.g_yellow_btn_text_color)
		else
			middleButton:setText("藏书阁", g_game.g_yellow_btn_text_color)
		end
		
	end 
end

------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] buttonLeftClick
-- remove 弹出奏章界面的左按钮的事件
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:buttonLeftClick()
	print("左边按钮被按下！")
	--依据不同的大臣，确定点击事件的效果
	if self.m_dachen_type == dachen_type.LIBU1 then
		g_game.g_utilManager:enterShop(1)
		print("弹出科举界面")
	elseif self.m_dachen_type == dachen_type.HUBU then
--		if g_game.g_userInfoManager:getLevel() < g_game.OPEN_XUNXIU_LV then
--			local str = g_game.g_dictConfigManager:getLanTextById(434)
--			g_game.g_utilManager:showMsg(g_game.OPEN_XUNXIU_LV..str)
--		else
			g_game.g_utilManager:enterShop(2)
--		end
   		print("弹出选秀界面")
	elseif self.m_dachen_type == dachen_type.LIBU2 then
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(8)
		if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
			g_game.g_userInfoManager:requestLianHuaShop(false)
		else
			local str = g_game.g_dictConfigManager:getLanTextById(435)
			g_game.g_utilManager:showMsg(getOpenLv .. str)
		end
	elseif self.m_dachen_type == dachen_type.BINGBU then
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_NETWORK_LOADING )
		g_game.g_userInfoManager:requestUserPveProgress()
	elseif self.m_dachen_type == dachen_type.XINGBU then
		
	elseif self.m_dachen_type == dachen_type.GONGBU then
--		g_game.g_utilManager:showMsg("功能未开放")
--		print("弹出内政建筑界面")
	end 
end


------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] buttonLeftClick
-- remove 弹出奏章界面的中部按钮的事件
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:buttonMiddleClick()
	print("中部按钮被按下！")
	--依据不同的大臣，确定点击事件的效果
	if self.m_dachen_type == dachen_type.LIBU1 then
		
	elseif self.m_dachen_type == dachen_type.HUBU then
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(6)
		if getOpenLv > g_game.g_userInfoManager:getUserLv() then
			local str = g_game.g_dictConfigManager:getLanTextById(436)
			g_game.g_utilManager:showMsg(getOpenLv ..  str)
		else
			require("scripts.game.main.bingfa.f_xunfang_panel")
			local panel = f_xunfang_panel.static_create()
			panel:panelInitBeforePopup()
			g_game.g_panelManager:showUiPanel(panel, "xunfang_panel")
		end
		print("弹出寻访界面")
	elseif self.m_dachen_type == dachen_type.LIBU2 then
		require("scripts.game.main.lianhua.f_lianhua_panel")
		local panel = f_lianhua_panel.static_create()
		panel:panelInitBeforePopup()
		g_game.g_panelManager:showUiPanel(panel, "lianhua_panel")
		g_game.g_panelManager:removeUiPanel("main_popup")
		print("弹出目标界面")
	elseif self.m_dachen_type == dachen_type.BINGBU then
		print("弹出排兵布阵界面")
		self.m_paibing_huangzi_panel = f_card_paibing_huangzi.static_create()
    	self.m_paibing_huangzi_panel:panelInitBeforePopup()    
		g_game.g_panelManager:showUiPanel(self.m_paibing_huangzi_panel,"paibinghuangzi_top")
	elseif self.m_dachen_type == dachen_type.XINGBU then
		
	elseif self.m_dachen_type == dachen_type.GONGBU then
		local getOpenLv = g_game.g_dictConfigManager:getOpenLv(7)
		if getOpenLv <= g_game.g_userInfoManager:getUserLv() then
			g_game.g_userInfoManager:requestBingfaPiece()
			g_game.g_panelManager:removeUiPanel("main_popup")
		else
			local str = g_game.g_dictConfigManager:getLanTextById(437)
			g_game.g_utilManager:showMsg(getOpenLv .. str)
		end
	end 
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] buttonRightClick
-- remove 弹出奏章界面的左按钮的事件
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:buttonRightClick()
	print("右边按钮被按下！")
	--依据不同的大臣，确定点击事件的效果
	if self.m_dachen_type == dachen_type.LIBU1 then
		
	elseif self.m_dachen_type == dachen_type.HUBU then
		
	elseif self.m_dachen_type == dachen_type.LIBU2 then
		
	elseif self.m_dachen_type == dachen_type.BINGBU then
		
	elseif self.m_dachen_type == dachen_type.XINGBU then
		
	elseif self.m_dachen_type == dachen_type.GONGBU then
		
	end 
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaJinluandianDachen] buttonRightClick
-- remove 弹出奏章界面的“想看看你”按钮按下，关闭奏章
-------------------------------------------------------------------------------
function FLuaJinluandianDachen:buttonCancelClick()
	print("想看看你！")
	--移动大臣到初始位置，并回归站立动画
	self:setPosition(cc.p(self.m_dachen_position_x, self:getPositionY()))
	self.m_dachen:setLoop(false)
	self.m_dachen:runAnimation("renwu_dachen", "dachen_" .. self.m_dachen_fuzhuang .. "_zhanli")
	
	local zouzhang = self.m_zouzhangtanchu_table["jinluandian_zouzhangtanchu"]
	if zouzhang ~= nil then
		zouzhang:removeFromParent()
		--恢复特殊大臣的触摸
		self.m_parent_panel:recoverTouch()
	end
end

return FLuaJinluandianDachen