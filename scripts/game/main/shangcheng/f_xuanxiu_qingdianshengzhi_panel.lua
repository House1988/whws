--[[--
	钦点圣旨
--]]--
f_xuanxiu_qingdianshengzhi_panel = class("f_xuanxiu_qingdianshengzhi_panel")
f_xuanxiu_qingdianshengzhi_panel.__index = f_xuanxiu_qingdianshengzhi_panel

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] static_create
-- 静态创建方法，用于创建面板并返回实例
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel.static_create()
	local xuanxiu_qingdianshengzhi_Table = g_game.g_panelManager:create_panel("xuanxiu_qingdianshengzhi")
	local xuanxiu_qingdianshengzhi_Panel = xuanxiu_qingdianshengzhi_Table["xuanxiu_qingdianshengzhi"]
	  
	local funTable = {}
	tolua.setpeer(xuanxiu_qingdianshengzhi_Panel, funTable)
	setmetatable(funTable, f_xuanxiu_qingdianshengzhi_panel)
	
	xuanxiu_qingdianshengzhi_Panel.m_componentTable = xuanxiu_qingdianshengzhi_Table
	return xuanxiu_qingdianshengzhi_Panel  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] panelInitBeforePopup
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:panelInitBeforePopup()
	self:registerNodeEvent()
	
	--记录是否点击，以防再次响应点击
	self.m_flag_touch = false
	
	--皇帝圣旨内容
	if LANGUAGE_TYPE == 3 then
		self.m_shengzhi_content = {"本次舉辦的選秀大賽圓滿結束", "，容貌聰慧，秀外慧", "中，御筆親賜，納入後宮！"}
	else
		self.m_shengzhi_content = {"本次举办的选秀大赛圆满结束", "，容貌聪慧，秀外慧", "中，御笔亲赐，纳入后宫！"}
	end
	
	--圣旨封赏对象信息
	self.m_renwu_data = nil	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] registerNodeEvent
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] onEnter
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:onEnter()
	--屏蔽事件穿透    
	self:initAllComponent()
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] onExit
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:onExit()  
    self:unregisterNodeEvent()
    
    self.m_renwu_data = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] onEnterTransitionFinish
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:onEnterTransitionFinish()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] onExitTransitionStart
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:onExitTransitionStart()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] onCleanup
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:onCleanup()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:initAllComponent()
	--背景设置透明度
	self.m_componentTable["xx_qdsz_bantouming"]:setOpacity(175)
	self.m_componentTable["xx_qdsz_yinzhang_image"]:setOpacity(0)
	--设置触摸屏幕事件（印章弹出，圣旨渐灭）
	local closeShengzhi = function()
		self:closeShengzhi()
	end	
	self:addHandleOfcomponentEvent(closeShengzhi, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	if self.m_renwu_data ~= nil then
		self.m_componentTable["xx_qdsz_name_label"]:setVerString(self.m_renwu_data["name"])
		
		if self.m_renwu_data["type"] == 1 then
			self.m_componentTable["xx_qdsz_meinv_image"]:setImage(self.m_renwu_data["image"])
			self.m_componentTable["xx_qdsz_meinv_image"]:setExtensionsTextureRect(cc.rect(0, 0, 512, 373))
			self.m_componentTable["xx_qdsz_meinv_image"]:setSize(cc.size(512,373))
		else
			self.m_componentTable["xx_qdsz_meinv_image"]:setImage(self.m_renwu_data["image"])
			self.m_componentTable["xx_qdsz_meinv_image"]:setSize(cc.size(367,373))
		end
		--依据星级显示星星
		for k = 1,5 do
			if k <= self.m_renwu_data["star"] then
				self.m_componentTable["xx_qdsz_xingxing" .. k .."_image"]:setVisible(true)	
			else
				self.m_componentTable["xx_qdsz_xingxing" .. k .."_image"]:setVisible(false)
			end
		end
		if self.m_renwu_data["type"] == 2 then	
			self.m_componentTable["xx_qdsz_gongxi_label"]:setVerString(self.m_shengzhi_content[1])
			self.m_componentTable["xx_qdsz_wei_label"]:setVerString(self.m_shengzhi_content[2])
			self.m_componentTable["xx_qdsz_title_label"]:setVerString(self.m_shengzhi_content[3])		
		end
	else
--		print("圣旨选上对象为空，显示默认信息！")
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] closeShengzhi
-- 关闭圣旨（印章弹出，圣旨渐灭）
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:closeShengzhi()
	
	if self.m_flag_touch == false then
		--移除圣旨
		local removeShengzhi = function()
			g_game.g_panelManager:removeUiPanel("xuanxiu_qingdianshengzhi")
		end
		--圣旨渐灭
		--[[local closePanel = function()
			local sequence = g_game.g_transition.sequence({cc.FadeOut:create(0.5),cc.CallFunc:create(removeShengzhi)})
			self:runAction(sequence)
		end]]--	
		--显示出来
		local spwanAction = cc.Spawn:createWithTwoActions(cc.FadeIn:create(0.5), CCEaseBounceOut:create(cc.ScaleTo:create(0.5, 1.0)))
		local sequence = g_game.g_transition.sequence({spwanAction,cc.DelayTime:create(2.0),cc.CallFunc:create(removeShengzhi)})
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_GAIZHANG)
		self.m_componentTable["xx_qdsz_yinzhang_image"]:setScale(3.0)
		self.m_componentTable["xx_qdsz_yinzhang_image"]:runAction(sequence)
		self.m_flag_touch = true
	end	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_xuanxiu_qingdianshengzhi_panel] setShengzhiData
-- 设置圣旨的名臣 或者 美女数据
-------------------------------------------------------------------------------
function f_xuanxiu_qingdianshengzhi_panel:setShengzhiData(renwuData)
	self.m_renwu_data = renwuData
end