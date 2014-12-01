require("scripts.auto.auto_keju_qingdian_card")
require("scripts.game.main.shangcheng.f_xuanxiu_qingdianshengzhi_panel")

--[[--
	科举钦点大臣
--]]--
f_keju_qindiandachen_panel = class("f_keju_qindiandachen_panel")
f_keju_qindiandachen_panel.__index = f_keju_qindiandachen_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel.static_create()
	local keju_qindiandachen_Table = g_game.g_panelManager:create_panel("keju_qindiandachen")
	local keju_qindiandachen_Panel = keju_qindiandachen_Table["keju_qindiandachen"]
	  
	local funTable = {}
	tolua.setpeer(keju_qindiandachen_Panel, funTable)
	setmetatable(funTable, f_keju_qindiandachen_panel)
	
	keju_qindiandachen_Panel.m_componentTable = keju_qindiandachen_Table
	return keju_qindiandachen_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	self.m_keju_mingchen_list = nil
	
	self.m_keju_type = 0
	
	--试卷文字内容
	self.m_keju_shijuan_neirong = {}  
	if LANGUAGE_TYPE == 3 then
		self.m_keju_shijuan_neirong[1] = {"能得皇上賞識，誠","惶誠恐，必當為天","朝鞠躬盡瘁！"}
		self.m_keju_shijuan_neirong[2] = {"久聞皇上慧眼識賢 ","才，今日一試，果","然名不虛傳！"}
		self.m_keju_shijuan_neirong[3] = {"自比那姜太公釣魚","，皇上您比那周文","王更勝一籌！ "}
		self.m_keju_shijuan_neirong[4] = {"終於見到皇上龍顏","了！果然真龍在世","，器宇不凡！"}
	else
		self.m_keju_shijuan_neirong[1] = {"能得皇上赏识，诚","惶诚恐，必当为天","朝鞠躬尽瘁！"}
		self.m_keju_shijuan_neirong[2] = {"久闻皇上慧眼识贤 ","才，今日一试，果","然名不虚传！"}
		self.m_keju_shijuan_neirong[3] = {"自比那姜太公钓鱼","，皇上您比那周文","王更胜一筹！ "}
		self.m_keju_shijuan_neirong[4] = {"终于见到皇上龙颜","了！果然真龙在世","，器宇不凡！"}
	end

	
	self.m_kejuGuideTable = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_keju_qindiandachen_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] onEnter
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:onEnter()
	--设置吞没触摸
	self:setStopTouchEvent(true)
	--屏蔽事件穿透
	local selfSize = self:getSize()
    local touch_stop_panel = fc.FContainerPanel:create()
    touch_stop_panel:setSize(g_game.g_real_size)
    self:appendComponent(touch_stop_panel)
    touch_stop_panel:setAnchorPoint(cc.p(0.5, 0.5))
    touch_stop_panel:setPositionInContainer(cc.p(selfSize.width/2, selfSize.height/2))
    touch_stop_panel:setStopTouchEvent(true)   
    touch_stop_panel:getParent():reorderChild(touch_stop_panel, -1)

	--调整半透明背景
	self.m_componentTable["kj_qddc_bantouming"]:setOpacity(175)
	self:initAllComponent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_KEJU)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] onExit
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:onExit()  
    self:unregisterNodeEvent()
    
    self.m_keju_mingchen_list = nil
    self.m_keju_shijuan_neirong = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] onCleanup
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:initAllComponent()	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] setKaoshiData
-- 设置科举考试的数据
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:setKaoshiData(type, kejuMingchenList)
	self.m_keju_mingchen_list = kejuMingchenList
	self.m_keju_type = type
	self:showShijuan()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] showShijuan
-- 显示四张试卷
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:showShijuan()
	if self.m_keju_mingchen_list ~=nil then		
		--设置随机内容
		local contentIndex = nil
		local value = math.random(1,4)  
		if value == 1 then
			contentIndex = {1,4,2,3}
		elseif value == 2 then
			contentIndex = {2,3,4,1}
		elseif value == 3 then 
			contentIndex = {3,1,4,2}
		else 
			contentIndex = {4,2,1,3}
		end
		
		self.m_keju_effect = {}
		
		self.m_mingChenCards = {}
		for i = 0, 3 do
			local offsetX, offsetY = 39, 89
			local cardWidth, cardHeight = 423, 260
			local JianjuX, JianjuY = 27, 9
			--获取到当前大臣的信息
			local mingchenInfo = {}
			local mingchenId = self.m_keju_mingchen_list["officerList"][i+1]["officerId"] 			
			mingchenInfo["mingchenId"] = mingchenId
			mingchenInfo["mingchenName"] = g_game.g_dictConfigManager:getCardName(mingchenId)
			mingchenInfo["mingchenHead"] = g_game.g_dictConfigManager:getCardHeadFile(mingchenId)
			mingchenInfo["mingchenStar"]  =g_game.g_dictConfigManager:getCardQuality(mingchenId)
			mingchenInfo["mingchenContent"] = self.m_keju_shijuan_neirong[contentIndex[i+1]]						
			
			local positionX = offsetX + (cardWidth + JianjuX) * (i%2)
			local positionY = offsetY + (cardHeight + JianjuY) * math.floor(i/2)
			local shijuan_table = createkeju_qingdian_card()
			self.m_mingChenCards[i + 1] = shijuan_table
			local shijuan_panel = shijuan_table["keju_qingdian_card"]
			shijuan_panel:setAnchorPoint(cc.p(0,1))
			self:appendComponent(shijuan_panel)
			shijuan_panel:setPositionInContainer(cc.p(positionX, positionY))
			
			-- 科举特效
			self.m_keju_effect[i+1] = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			self:appendComponent(self.m_keju_effect[i+1])
			self.m_keju_effect[i+1]:setAnchorPoint(cc.p(0.5, 0.5))
			self.m_keju_effect[i+1]:setLoop(mingchenInfo["mingchenStar"] >= 4)
			self.m_keju_effect[i+1]:runAnimation(g_game.g_f_main_ui_effect.UI_XUANXIU_EFFECT[1], g_game.g_f_main_ui_effect.UI_XUANXIU_EFFECT[3])
			self.m_keju_effect[i+1]:setPositionInContainer(cc.p(positionX+214, positionY+130))
			local keju_effect_finish = function()
				self:deleteComponent(self.m_keju_effect[i+1])
			end
			self.m_keju_effect[i+1]:registeAnimationFinishCallback(keju_effect_finish)
			
			--弹出圣旨,发送选择结果消息
			local tanchuShengzhi = function()
				g_game.g_panelManager:removeUiPanel("keju_qindiandachen")		    		    
				local shengzhi = f_xuanxiu_qingdianshengzhi_panel.static_create()
				shengzhi:panelInitBeforePopup()
				local renwuData = {}
				renwuData["name"] = mingchenInfo["mingchenName"]
				renwuData["star"] = mingchenInfo["mingchenStar"]
				renwuData["type"] = 1 --1 for 名臣 2 for 秀女
				renwuData["image"] = "card/" .. mingchenInfo["mingchenHead"] .. ".png"
 				--设置封赏人物信息
				shengzhi:setShengzhiData(renwuData)
				g_game.g_panelManager:showUiPanel(shengzhi,"xuanxiu_qingdianshengzhi")
				--发送选择消息
				g_game.g_userInfoManager:sendKejuMingchenSelectResult(self.m_keju_type,i+1)
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			end
			
			local q = g_game.g_dictConfigManager:getCardQuality(mingchenId)
			shijuan_table["keju_frame"]:setImage(g_game.g_f_quality_image[q])
			shijuan_table["keju_card_qindian_button"]:addHandleOfcomponentEvent(tanchuShengzhi, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			shijuan_table["keju_touxiang"]:setImage("card_head/" .. mingchenInfo["mingchenHead"] .. ".png")
			shijuan_table["keju_touxiang"]:setExtensionsTextureRect(cc.rect(0,0,90,90))
			shijuan_table["keju_card_name_label"]:setVerString(mingchenInfo["mingchenName"])
			shijuan_table["keju_card_other1_label"]:setVerString(mingchenInfo["mingchenContent"][1])
			shijuan_table["keju_card_other2_label"]:setVerString(mingchenInfo["mingchenContent"][2])
			shijuan_table["keju_card_other3_label"]:setVerString(mingchenInfo["mingchenContent"][3])
			
			local sinfo = g_game.g_dictConfigManager:getSoldierInfo(mingchenId, 1)
			shijuan_table["keju_type"]:setImage("nobatch/" .. sinfo[14])
			shijuan_table["keju_type"]:setSize(cc.size(36, 37))
			
			--依据星级显示星星
			for k = 1,5 do
				if k <= mingchenInfo["mingchenStar"] then
					shijuan_table["keju_card_xingxing" .. k .."_image"]:setVisible(true)	
				else
					shijuan_table["keju_card_xingxing" .. k .."_image"]:setVisible(false)
				end
			end
		end
		local onClick = function()
			self:showMingChenDetial(1)
		end
		self.m_mingChenCards[1]["image_btn"]:addHandleOfcomponentEvent(onClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		onClick = function()
			self:showMingChenDetial(2)
		end
		self.m_mingChenCards[2]["image_btn"]:addHandleOfcomponentEvent(onClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		onClick = function()
			self:showMingChenDetial(3)
		end
		self.m_mingChenCards[3]["image_btn"]:addHandleOfcomponentEvent(onClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
		onClick = function()
			self:showMingChenDetial(4)
		end
		self.m_mingChenCards[4]["image_btn"]:addHandleOfcomponentEvent(onClick, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
	else
		print("科举考试界面未设置大臣数据！")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_keju_qindiandachen_panel] showMingChenDetial
-- 显示名臣详情
-------------------------------------------------------------------------------
function f_keju_qindiandachen_panel:showMingChenDetial(index)
	local detailPanel = f_card_mingchen_detail.static_create()
	detailPanel:panelInitBeforePopup()
	local data = g_game.g_utilManager:fakeMingChenData(self.m_keju_mingchen_list["officerList"][index]["officerId"])
	detailPanel:setDetail(data)
	g_game.g_panelManager:showUiPanel(detailPanel, "mingchen_xiangqing")

end