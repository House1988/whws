function createpublic_reconnect_popup()

    local table_public_reconnect_popup = {}

    local public_reconnect_popup = fc.FContainerPanel:create()
    public_reconnect_popup:setSize(cc.size(960,640))
    table_public_reconnect_popup["public_reconnect_popup"] = public_reconnect_popup

    local bottom_panel = fc.FContainerPanel:create()
    bottom_panel:setSize(cc.size(534,400))
    bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_reconnect_popup:appendComponent(bottom_panel)
    bottom_panel:setPositionInContainer(cc.p(497,282))
    table_public_reconnect_popup["bottom_panel"] = bottom_panel

    local prp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    prp_wen_la:setSize(cc.size(412,350))
    prp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_wen_la)
    prp_wen_la:setPositionInContainer(cc.p(267,200))
    table_public_reconnect_popup["prp_wen_la"] = prp_wen_la

    local prp_zhou_u = fc.FExtensionsImage:create()
    prp_zhou_u:setImage("nobatch/shengzhi_zhou.png")
    prp_zhou_u:setSize(cc.size(52,534))
    prp_zhou_u:setRotation(90)
    prp_zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_zhou_u)
    prp_zhou_u:setPositionInContainer(cc.p(267,26))
    table_public_reconnect_popup["prp_zhou_u"] = prp_zhou_u

    local prp_title_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    prp_title_image:setSize(cc.size(260,50))
    prp_title_image:setAnchorPoint(cc.p(0.5,0.5))
    prp_title_image:setScaleY(-1)
    bottom_panel:appendComponent(prp_title_image)
    prp_title_image:setPositionInContainer(cc.p(273,25))
    table_public_reconnect_popup["prp_title_image"] = prp_title_image

    local prp_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    prp_rect1:setSize(cc.size(384,302))
    prp_rect1:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_rect1)
    prp_rect1:setPositionInContainer(cc.p(267,200))
    table_public_reconnect_popup["prp_rect1"] = prp_rect1

    local prp_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    prp_rect2:setSize(cc.size(384,302))
    prp_rect2:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_rect2)
    prp_rect2:setPositionInContainer(cc.p(267,200))
    table_public_reconnect_popup["prp_rect2"] = prp_rect2

    local prp_zhou_d = fc.FExtensionsImage:create()
    prp_zhou_d:setImage("nobatch/shengzhi_zhou.png")
    prp_zhou_d:setSize(cc.size(52,534))
    prp_zhou_d:setRotation(90)
    prp_zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_zhou_d)
    prp_zhou_d:setPositionInContainer(cc.p(267,374))
    table_public_reconnect_popup["prp_zhou_d"] = prp_zhou_d

    local notice_label = fc.FLabel:createBMFont()
    notice_label:setSize(cc.size(300,30))
    notice_label:setWidth(300)
    notice_label:setAnchorPoint(cc.p(0.5,0.5))
    notice_label:setFontSize(24)
    notice_label:setString("步兵步兵步兵")
    notice_label:setColor(cc.c3b(91,24,6))
    notice_label:setAlignment(0)
    bottom_panel:appendComponent(notice_label)
    notice_label:setPositionInContainer(cc.p(267,154))
    table_public_reconnect_popup["notice_label"] = notice_label

    local left_btn = fc.FScaleButton:create()
    left_btn:setSize(cc.size(144,53))
    left_btn:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(left_btn)
    left_btn:setPositionInContainer(cc.p(168,261.5))
    table_public_reconnect_popup["left_btn"] = left_btn

    local prp_fan = fc.FExtensionsImage:create()
    prp_fan:setImage("batch_ui/fan_uizi.png")
    prp_fan:setSize(cc.size(32,32))
    prp_fan:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:appendComponent(prp_fan)
    prp_fan:setPositionInContainer(cc.p(28,26))
    table_public_reconnect_popup["prp_fan"] = prp_fan

    local prp_hui = fc.FExtensionsImage:create()
    prp_hui:setImage("batch_ui/hui_uizi.png")
    prp_hui:setSize(cc.size(32,32))
    prp_hui:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:appendComponent(prp_hui)
    prp_hui:setPositionInContainer(cc.p(56,26))
    table_public_reconnect_popup["prp_hui"] = prp_hui

    local prp_deng = fc.FExtensionsImage:create()
    prp_deng:setImage("batch_ui/deng_uizi.png")
    prp_deng:setSize(cc.size(32,32))
    prp_deng:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:appendComponent(prp_deng)
    prp_deng:setPositionInContainer(cc.p(83,25))
    table_public_reconnect_popup["prp_deng"] = prp_deng

    local prp_lu = fc.FExtensionsImage:create()
    prp_lu:setImage("batch_ui/lu_uizi.png")
    prp_lu:setSize(cc.size(32,32))
    prp_lu:setAnchorPoint(cc.p(0.5,0.5))
    left_btn:appendComponent(prp_lu)
    prp_lu:setPositionInContainer(cc.p(111,26))
    table_public_reconnect_popup["prp_lu"] = prp_lu

    local right_btn = fc.FScaleButton:create()
    right_btn:setSize(cc.size(144,53))
    right_btn:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(right_btn)
    right_btn:setPositionInContainer(cc.p(366,261.5))
    table_public_reconnect_popup["right_btn"] = right_btn

    local prp_chong = fc.FExtensionsImage:create()
    prp_chong:setImage("batch_ui/chong3_uizi.png")
    prp_chong:setSize(cc.size(32,32))
    prp_chong:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:appendComponent(prp_chong)
    prp_chong:setPositionInContainer(cc.p(29,27))
    table_public_reconnect_popup["prp_chong"] = prp_chong

    local prp_xin = fc.FExtensionsImage:create()
    prp_xin:setImage("batch_ui/xin1_uizi.png")
    prp_xin:setSize(cc.size(32,32))
    prp_xin:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:appendComponent(prp_xin)
    prp_xin:setPositionInContainer(cc.p(58,26))
    table_public_reconnect_popup["prp_xin"] = prp_xin

    local prp_lian = fc.FExtensionsImage:create()
    prp_lian:setImage("batch_ui/lian_uizi.png")
    prp_lian:setSize(cc.size(32,32))
    prp_lian:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:appendComponent(prp_lian)
    prp_lian:setPositionInContainer(cc.p(86,26))
    table_public_reconnect_popup["prp_lian"] = prp_lian

    local prp_jie = fc.FExtensionsImage:create()
    prp_jie:setImage("batch_ui/jie1_uizi.png")
    prp_jie:setSize(cc.size(32,32))
    prp_jie:setAnchorPoint(cc.p(0.5,0.5))
    right_btn:appendComponent(prp_jie)
    prp_jie:setPositionInContainer(cc.p(115,26))
    table_public_reconnect_popup["prp_jie"] = prp_jie

    local prp_ti = fc.FExtensionsImage:create()
    prp_ti:setImage("batch_ui/ti2_uizi.png")
    prp_ti:setSize(cc.size(32,32))
    prp_ti:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_ti)
    prp_ti:setPositionInContainer(cc.p(238,26))
    table_public_reconnect_popup["prp_ti"] = prp_ti

    local prp_shi = fc.FExtensionsImage:create()
    prp_shi:setImage("batch_ui/shi4_uizi.png")
    prp_shi:setSize(cc.size(32,32))
    prp_shi:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(prp_shi)
    prp_shi:setPositionInContainer(cc.p(308,26))
    table_public_reconnect_popup["prp_shi"] = prp_shi

    return table_public_reconnect_popup

end

