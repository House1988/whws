local alertlayer = class("alertlayer",function (  )
	local panel = fc.FContainerPanel:create()
    panel:setSize(cc.size(960,640))
    return panel
end)

function alertlayer:ctor( text )

	-- local colorlayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 96))
 --    self:appendComponent(colorlayer)

	local bottom_panel = fc.FContainerPanel:create()
    bottom_panel:setSize(cc.size(534,400))
    bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    self:appendComponent(bottom_panel)
    bottom_panel:setPositionInContainer(cc.p(497,282))

    
    local prp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    prp_wen_la:setSize(cc.size(412,350))
    prp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_wen_la)
    prp_wen_la:setPositionInContainer(cc.p(267,200))

    local prp_zhou_u = fc.FExtensionsImage:create()
    prp_zhou_u:setImage("nobatch/shengzhi_zhou.png")
    prp_zhou_u:setSize(cc.size(52,534))
    prp_zhou_u:setRotation(90)
    prp_zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_zhou_u)
    prp_zhou_u:setPositionInContainer(cc.p(267,26))

    local prp_title_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    prp_title_image:setSize(cc.size(260,50))
    prp_title_image:setAnchorPoint(cc.p(0.5,0.5))
    prp_title_image:setScaleY(-1)
    bottom_panel:appendComponent(prp_title_image)
    prp_title_image:setPositionInContainer(cc.p(273,25))

    local prp_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    prp_rect1:setSize(cc.size(384,302))
    prp_rect1:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_rect1)
    prp_rect1:setPositionInContainer(cc.p(267,200))

    local prp_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    prp_rect2:setSize(cc.size(384,302))
    prp_rect2:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_rect2)
    prp_rect2:setPositionInContainer(cc.p(267,200))

    local prp_zhou_d = fc.FExtensionsImage:create()
    prp_zhou_d:setImage("nobatch/shengzhi_zhou.png")
    prp_zhou_d:setSize(cc.size(52,534))
    prp_zhou_d:setRotation(90)
    prp_zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_zhou_d)
    prp_zhou_d:setPositionInContainer(cc.p(267,374))

    local notice_label = fc.FLabel:createBMFont()
    notice_label:setSize(cc.size(300,30))
    notice_label:setWidth(300)
    notice_label:setAnchorPoint(cc.p(0.5,0.5))
    notice_label:setFontSize(24)
    notice_label:setString(text)
    notice_label:setColor(cc.c3b(91,24,6))
    notice_label:setAlignment(0)
    bottom_panel:appendComponent(notice_label)
    notice_label:setPositionInContainer(cc.p(267,154))

    local left_btn = fc.FScaleButton:create()
    left_btn:setSize(cc.size(144,53))
    left_btn:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(left_btn)
    left_btn:setPositionInContainer(cc.p(168,300))

    local right_btn = fc.FScaleButton:create()
    right_btn:setSize(cc.size(144,53))
    right_btn:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(right_btn)
    right_btn:setPositionInContainer(cc.p(366,300))

    local prp_fan = fc.FExtensionsImage:create()
    prp_fan:setImage("batch_ui/fan_uizi.png")
    prp_fan:setSize(cc.size(32,32))
    prp_fan:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:appendComponent(prp_fan)
    prp_fan:setPositionInContainer(cc.p(50,26))

    local prp_hui = fc.FExtensionsImage:create()
    prp_hui:setImage("batch_ui/hui_uizi.png")
    prp_hui:setSize(cc.size(32,32))
    prp_hui:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:appendComponent(prp_hui)
    prp_hui:setPositionInContainer(cc.p(94,26))

    local pnep_que = fc.FExtensionsImage:create()
    pnep_que:setImage("batch_ui/que_uizi.png")
    pnep_que:setSize(cc.size(32,32))
    pnep_que:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:appendComponent(pnep_que)
    pnep_que:setPositionInContainer(cc.p(50,26))

    local pnep_ding = fc.FExtensionsImage:create()
    pnep_ding:setImage("batch_ui/ding_uizi.png")
    pnep_ding:setSize(cc.size(32,32))
    pnep_ding:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:appendComponent(pnep_ding)
    pnep_ding:setPositionInContainer(cc.p(94,26))



    local prp_ti = fc.FExtensionsImage:create()
    prp_ti:setImage("batch_ui/ti2_uizi.png")
    prp_ti:setSize(cc.size(32,32))
    prp_ti:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_ti)
    prp_ti:setPositionInContainer(cc.p(238,26))

    local prp_shi = fc.FExtensionsImage:create()
    prp_shi:setImage("batch_ui/shi4_uizi.png")
    prp_shi:setSize(cc.size(32,32))
    prp_shi:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_shi)
    prp_shi:setPositionInContainer(cc.p(308,26))

    self.right_btn = right_btn
    self.left_btn = left_btn
end

-- 确定按钮回调
function alertlayer:setOkCallBack( callback )
	self.left_btn:addHandleOfcomponentEvent(callback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

--取消按钮回调
function alertlayer:setCancelBack( callback )
	self.right_btn:addHandleOfcomponentEvent(callback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
end

return alertlayer