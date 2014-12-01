require("scripts.auto.auto_xuanxiu_qindiansijin_card")
require("scripts.game.main.shangcheng.f_xuanxiu_qingdianshengzhi_panel")
require("scripts.game.main.beauty.f_game_beauty_card_detail")

--[[--
	科举钦点秀女
--]]--
f_xuanxiu_qindianxiunv_panel = class("f_xuanxiu_qindianxiunv_panel")
f_xuanxiu_qindianxiunv_panel.__index = f_xuanxiu_qindianxiunv_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel.static_create()
	local xuanxiu_qindianxiunv_Table = g_game.g_panelManager:create_panel("xuanxiu_qindianxiunv")
	local xuanxiu_qindianxiunv_Panel = xuanxiu_qindianxiunv_Table["xuanxiu_qindianxiunv"]
	  
	local funTable = {}
	tolua.setpeer(xuanxiu_qindianxiunv_Panel, funTable)
	setmetatable(funTable, f_xuanxiu_qindianxiunv_panel)
	
	xuanxiu_qindianxiunv_Panel.m_componentTable = xuanxiu_qindianxiunv_Table
	return xuanxiu_qindianxiunv_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	self.m_xuanxiu_xiunv_list = nil
	self.m_xuanxiu_type = 0
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] onEnter
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:onEnter()

	--调整半透明背景
	self.m_componentTable["xx_qdxn_bantouming"]:setOpacity(175) 
	self:initAllComponent()
	
	send_lua_event(g_game.g_f_lua_game_event.F_LUA_GUIDELINES_OPEN_QINDIAN_XUANXIU)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] onExit
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:onExit()  
    self:unregisterNodeEvent()
    self.m_xuanxiu_xiunv_list = nil
    
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] onCleanup
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:initAllComponent()	
	--设置吞没触摸
	self:setStopTouchEvent(true)
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] setXuanxiuData
-- 设置选秀的数据
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:setXuanxiuData(type, xuanxiuXiunvList)
	self.m_xuanxiu_xiunv_list = xuanxiuXiunvList
	self.m_xuanxiu_type = type
	self:showXuanxiu()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] showXuanxiu
-- 显示四张选秀卡
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:showXuanxiu()
	if self.m_xuanxiu_xiunv_list ~=nil then
		local offsetX, offsetY = 21, 99
		local cardWidth = 228
		local JianjuX = 2
		
		self.m_xuanxiu_effect = {}
		
		for i = 0, 3 do
			--获取到当前美女的信息
			local meinvInfo = {}
			local meinvId = self.m_xuanxiu_xiunv_list["beautyList"][i+1]["beautyId"]
			meinvInfo["meinvId"] = meinvId
			meinvInfo["meinvName"] = g_game.g_dictConfigManager:getBeautiName(meinvId)
			meinvInfo["meinvResource"] = g_game.g_dictConfigManager:getBeautyResource(meinvId)
			meinvInfo["meinvStar"] = g_game.g_dictConfigManager:getBeautyQuality(meinvId)
			meinvInfo["meinvDes"]  = g_game.g_dictConfigManager:getBeautyDesc(meinvId)
		
			local positionX = offsetX + (cardWidth + JianjuX) * i
			local positionY = offsetY
			local xuanxiucard_table = createxuanxiu_qindiansijin_card()
			local xuanxiucard = xuanxiucard_table["xuanxiu_qindiansijin_card"]
			xuanxiucard:setAnchorPoint(cc.p(0,1))
			self:appendComponent(xuanxiucard)
			xuanxiucard:setPositionInContainer(cc.p(positionX, positionY))
			
			-- 选秀特效
			self.m_xuanxiu_effect[i+1] = g_game.g_classFactory.newFLuaAnimationComponent("FAC")
			self:appendComponent(self.m_xuanxiu_effect[i+1])
			self.m_xuanxiu_effect[i+1]:setAnchorPoint(cc.p(0.5, 0.5))
			self.m_xuanxiu_effect[i+1]:setLoop(meinvInfo["meinvStar"] >= 4)
			self.m_xuanxiu_effect[i+1]:runAnimation(g_game.g_f_main_ui_effect.UI_XUANXIU_EFFECT[1], g_game.g_f_main_ui_effect.UI_XUANXIU_EFFECT[2])
			self.m_xuanxiu_effect[i+1]:setPositionInContainer(cc.p(positionX+105, positionY+156))
			local xuanxiu_effect_finish = function()
				self:deleteComponent(self.m_xuanxiu_effect[i+1])
			end
			self.m_xuanxiu_effect[i+1]:registeAnimationFinishCallback(xuanxiu_effect_finish)
			
			--弹出美女属性
			local tanchuMeinvshuxing = function()
				--初始化 显示 美女属性		    		    
				self:initAndShowShuxing(meinvInfo)
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			end
			--弹出圣旨,发送选择结果消息
			local tanchuShengzhi = function()
				g_game.g_panelManager:removeUiPanel("xuanxiu_qindianxiunv")		    		    
				local shengzhi = f_xuanxiu_qingdianshengzhi_panel.static_create()
				shengzhi:panelInitBeforePopup()
				local renwuData = {}
				renwuData["name"] = meinvInfo["meinvName"]
				renwuData["star"] = meinvInfo["meinvStar"]
				renwuData["type"] = 2 --1 for 名臣 2 for 秀女
				renwuData["image"] = "beauty_card/" .. meinvInfo["meinvResource"] .. "01.png"
 				--设置封赏人物信息
				shengzhi:setShengzhiData(renwuData)
				g_game.g_panelManager:showUiPanel(shengzhi,"xuanxiu_qingdianshengzhi")
				--发送选择消息
				g_game.g_userInfoManager:sendXuanxiuXiunvSelectResult(self.m_xuanxiu_type,i+1)
				send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
			end
			xuanxiucard_table["xx_qdsj_qingdian_button"]:addHandleOfcomponentEvent(tanchuShengzhi, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			xuanxiucard_table["xx_qdsj_xiangqing_button"]:addHandleOfcomponentEvent(tanchuMeinvshuxing, g_game.g_f_touch_event.F_TOUCH_UPINSIDE )
			
			xuanxiucard_table["xx_qdsj_meinv_name_label"]:setString(meinvInfo["meinvName"])
			xuanxiucard_table["xx_qdsj_renwu_image"]:setImage("beauty_head/" .. meinvInfo["meinvResource"] .. ".png")
			xuanxiucard_table["frame"]:setImage(g_game.g_f_quality_image[meinvInfo["meinvStar"]])
			
			
			--依据星级显示星星
			for k = 1,5 do
				if k <= meinvInfo["meinvStar"] then
					xuanxiucard_table["xx_qdsj_xingxing" .. k .."_image"]:setVisible(true)	
				else
					xuanxiucard_table["xx_qdsj_xingxing" .. k .."_image"]:setVisible(false)
				end
			end
		end
	else
		print("选秀界面未设置秀女数据！")
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qindianxiunv_panel] initAndShowShuxing
-- 初始化 显示 美女属性
-------------------------------------------------------------------------------
function f_xuanxiu_qindianxiunv_panel:initAndShowShuxing(meinvInfo)	
	local detailPanel = f_game_beauty_card_detail.static_create()
	detailPanel:panelInitBeforePopup()
	detailPanel:setStopTouchEvent(true)
	g_game.g_panelManager:showUiPanel(detailPanel,"meinvshuxing_title")
	local beauty = require("scripts.game.main.suipian.f_fake_beauty").new()
	beauty:setData(meinvInfo["meinvId"])
	detailPanel:setDetail(beauty)
end