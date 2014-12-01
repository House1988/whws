--[[
	弹出提示板
]]--

local f_pre_tips_panel = class("f_pre_tips_panel", function()
    return fc.FContainerPanel:create()
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_pre_tips_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_pre_tips_panel:ctor()
    self:registerNodeEvent()   
    
  	self.m_real_size = g_resource.g_real_size

  	self.m_autoPanel = require ("prescripts.common.f_pre_lua_autoscale_panel").new()
  	self.m_autoPanel:bindSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT)
  	self.m_autoPanel:bindPos(self.m_autoPanel.MIDDLE_MIDDLE)  
  	
  	g_resource.g_director:getRunningScene():add_panel_to_layer(self.m_autoPanel, 4)	
  	  	
  	self.m_autoPanel:appendComponent(self)
	self:setSize(self.m_real_size)    	
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setPositionInContainer(cc.p(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2))
  	
	
    self:setStopTouchEvent(true)
	
	self.m_show_text = ""
	self.m_callback_array = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_pre_tips_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_pre_tips_panel:onEnter()    
end


function f_pre_tips_panel:onExit()    
    self:unregisterNodeEvent()
end

function f_pre_tips_panel:onEnterTransitionFinish()
end

function f_pre_tips_panel:onExitTransitionStart()
end

function f_pre_tips_panel:onCleanup()
end


function f_pre_tips_panel:registerNodeEvent(handler)
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
-- @function [parent=#f_pre_tips_panel] unregisterNodeEvent
-------------------------------------------------------------------------------
function f_pre_tips_panel:unregisterNodeEvent()
    self:unregisterScriptHandler()
end


function f_pre_tips_panel:createLayoutPanel()

    local table_public_network_error_pop = {}

    local public_network_error_pop = fc.FContainerPanel:create()
    public_network_error_pop:setSize(cc.size(960,640))
    table_public_network_error_pop["public_network_error_pop"] = public_network_error_pop

    local pop_bottom_panel = fc.FContainerPanel:create()
    pop_bottom_panel:setSize(cc.size(534,350))
    pop_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_network_error_pop:appendComponent(pop_bottom_panel)
    pop_bottom_panel:setPositionInContainer(cc.p(480,319.5))
    table_public_network_error_pop["pop_bottom_panel"] = pop_bottom_panel

    local pnep_wen_la = fc.FScale9Image:createWithBatchUIFrame("nobatch/shengzhi_ditu.png",cc.rect(40,63,4,4))
    pnep_wen_la:setSize(cc.size(412,293))
    pnep_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_wen_la)
    pnep_wen_la:setPositionInContainer(cc.p(267,176.5))
    table_public_network_error_pop["pnep_wen_la"] = pnep_wen_la

    local pnep_zhou_up = fc.FExtensionsImage:create()
    pnep_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    pnep_zhou_up:setSize(cc.size(52,534))
    pnep_zhou_up:setRotation(90)
    pnep_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_zhou_up)
    pnep_zhou_up:setPositionInContainer(cc.p(267,26))
    table_public_network_error_pop["pnep_zhou_up"] = pnep_zhou_up

    local pnep_zhou_down = fc.FExtensionsImage:create()
    pnep_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    pnep_zhou_down:setSize(cc.size(52,534))
    pnep_zhou_down:setRotation(90)
    pnep_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_zhou_down)
    pnep_zhou_down:setPositionInContainer(cc.p(267,324))
    table_public_network_error_pop["pnep_zhou_down"] = pnep_zhou_down

    local pnep_title_bg = fc.FScale9Image:createWithBatchUIFrame("nobatch/zongjiachengdikuang_tangquanxinggong.png",cc.rect(66,18,2,2))
    pnep_title_bg:setSize(cc.size(240,50))
    pnep_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_title_bg)
    pnep_title_bg:setPositionInContainer(cc.p(267,24))
    table_public_network_error_pop["pnep_title_bg"] = pnep_title_bg

    local pnep_title_label = fc.FLabel:createBMFont()
    pnep_title_label:setSize(cc.size(100,30))
    pnep_title_label:setAnchorPoint(cc.p(0.5,0.5))
    pnep_title_label:setFontSize(32)
    pnep_title_label:setString("提 示")
    pnep_title_label:setColor(cc.c3b(255,255,255))
    pop_bottom_panel:appendComponent(pnep_title_label)
    pnep_title_label:setPositionInContainer(cc.p(267,25))
    table_public_network_error_pop["pnep_title_label"] = pnep_title_label

    local pnep_dikuang1 = fc.FScale9Image:createWithBatchUIFrame("nobatch/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pnep_dikuang1:setSize(cc.size(384,251))
    pnep_dikuang1:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_dikuang1)
    pnep_dikuang1:setPositionInContainer(cc.p(267,176.5))
    table_public_network_error_pop["pnep_dikuang1"] = pnep_dikuang1

    local pnep_dikuang = fc.FScale9Image:createWithBatchUIFrame("nobatch/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pnep_dikuang:setSize(cc.size(384,251))
    pnep_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_dikuang)
    pnep_dikuang:setPositionInContainer(cc.p(267,176.5))
    table_public_network_error_pop["pnep_dikuang"] = pnep_dikuang


    local pnep_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("nobatch/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    pnep_wenzi_di:setSize(cc.size(380,49))
    pnep_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_wenzi_di)
    pnep_wenzi_di:setPositionInContainer(cc.p(267,147.5))
    table_public_network_error_pop["pnep_wenzi_di"] = pnep_wenzi_di

    local pnep_pop_notice_label = fc.FLabel:createBMFont()
    pnep_pop_notice_label:setSize(cc.size(250,30))
    pnep_pop_notice_label:setAnchorPoint(cc.p(0.5,0.5))
    pnep_pop_notice_label:setFontSize(20)
    pnep_pop_notice_label:setString("步兵步兵步兵")
    pnep_pop_notice_label:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(pnep_pop_notice_label)
    pnep_pop_notice_label:setPositionInContainer(cc.p(267,147))
    table_public_network_error_pop["pnep_pop_notice_label"] = pnep_pop_notice_label


    local pop_queding_button = fc.FScaleButton:create()
    pop_queding_button:setSize(cc.size(144,53))
    pop_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    pop_queding_button:setButtonImage("nobatch/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(pop_queding_button)
    pop_queding_button:setPositionInContainer(cc.p(357,255.5))
    table_public_network_error_pop["pop_queding_button"] = pop_queding_button
    
    
    local pnep_que = fc.FExtensionsImage:create()
    pnep_que:setImage("nobatch/que_uizi.png")
    pnep_que:setSize(cc.size(32,32))
    pnep_que:setAnchorPoint(cc.p(0.5,0.5))
    pop_queding_button:appendComponent(pnep_que)
    pnep_que:setPositionInContainer(cc.p(50,26))

    local pnep_ding = fc.FExtensionsImage:create()
    pnep_ding:setImage("nobatch/ding_uizi.png")
    pnep_ding:setSize(cc.size(32,32))
    pnep_ding:setAnchorPoint(cc.p(0.5,0.5))
    pop_queding_button:appendComponent(pnep_ding)
    pnep_ding:setPositionInContainer(cc.p(90,26))
    
    
    
    local pop_exit_button = fc.FScaleButton:create()
    pop_exit_button:setSize(cc.size(144,53))
    pop_exit_button:setAnchorPoint(cc.p(0.5,0.5))
    pop_exit_button:setButtonImage("nobatch/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(pop_exit_button)
    pop_exit_button:setPositionInContainer(cc.p(180,255.5))
    table_public_network_error_pop["pop_exit_button"] = pop_exit_button
    
    local pnep_qu = fc.FExtensionsImage:create()
    pnep_qu:setImage("nobatch/qu_uizi.png")
    pnep_qu:setSize(cc.size(32,32))
    pnep_qu:setAnchorPoint(cc.p(0.5,0.5))
    pop_exit_button:appendComponent(pnep_qu)
    pnep_qu:setPositionInContainer(cc.p(50,26))

    local pnep_xiao = fc.FExtensionsImage:create()
    pnep_xiao:setImage("nobatch/xiao_uizi.png")
    pnep_xiao:setSize(cc.size(32,32))
    pnep_xiao:setAnchorPoint(cc.p(0.5,0.5))
    pop_exit_button:appendComponent(pnep_xiao)
    pnep_xiao:setPositionInContainer(cc.p(90,26))

    return table_public_network_error_pop

end

-------------------------------------------------------------------------------
-- @function [parent=#f_pre_tips_panel] createCommonTips
-- 创建一般提示窗体，只有确定按钮
-------------------------------------------------------------------------------
function f_pre_tips_panel:createCommonTips()	
	self.m_noticeTable = self:createLayoutPanel()

	self.m_actionPanel = self.m_noticeTable["pop_bottom_panel"]
	
    local panel = self.m_noticeTable["public_network_error_pop"]
    self:appendComponent(panel)
    panel:setAnchorPoint(cc.p(0.5,0.5))
    panel:setPositionInContainer(cc.p(self.m_real_size.width/2,
    self.m_real_size.height/2))
    
    self.m_noticeTable["pnep_pop_notice_label"]:setString(self.m_show_text)
    
	local noticeYes = function()
		if self.m_callback_array[1] then
			self.m_callback_array[1]()
		end
	end	
	self.m_noticeTable["pop_queding_button"]:addHandleOfcomponentEvent(noticeYes, g_resource.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	local noticeExit = function()
		if self.m_callback_array[2] then
			self.m_callback_array[2]()
		end
	end	
	self.m_noticeTable["pop_exit_button"]:addHandleOfcomponentEvent(noticeExit, g_resource.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_pre_tips_panel] setShowText
--设置显示面板中文本
-------------------------------------------------------------------------------
function f_pre_tips_panel:setShowText(text)
	self.m_show_text = text
end


-------------------------------------------------------------------------------
-- @function [parent=#f_pre_tips_panel] addCallback
--添加按钮回调函数，自左向右顺序添加
-------------------------------------------------------------------------------
function f_pre_tips_panel:addCallback(callback)
	table.insert(self.m_callback_array, callback)
end



-------------------------------------------------------------------------------
-- @function [parent=#f_pre_tips_panel] hide
--隐藏面板
-------------------------------------------------------------------------------
function f_pre_tips_panel:hide()
	local layer = g_resource.g_director:getRunningScene():get_layer_from_config(4)
	layer:removeChild(self.m_autoPanel, true)
end

return f_pre_tips_panel