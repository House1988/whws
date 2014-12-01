function createshangci_tip_popup()

    local table_shangci_tip_popup = {}

    local shangci_tip_popup = fc.FContainerPanel:create()
    shangci_tip_popup:setSize(cc.size(960,640))
    table_shangci_tip_popup["shangci_tip_popup"] = shangci_tip_popup

    local pop_bottom_panel = fc.FContainerPanel:create()
    pop_bottom_panel:setSize(cc.size(570,404))
    pop_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    shangci_tip_popup:appendComponent(pop_bottom_panel)
    pop_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_shangci_tip_popup["pop_bottom_panel"] = pop_bottom_panel

    local stp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(12,38,62,58))
    stp_wen_la:setSize(cc.size(443,350))
    stp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_wen_la)
    stp_wen_la:setPositionInContainer(cc.p(285.5,202))
    table_shangci_tip_popup["stp_wen_la"] = stp_wen_la

    local stp_dikuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    stp_dikuang1:setSize(cc.size(386,294))
    stp_dikuang1:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_dikuang1)
    stp_dikuang1:setPositionInContainer(cc.p(285,202))
    table_shangci_tip_popup["stp_dikuang1"] = stp_dikuang1

    local stp_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    stp_dikuang:setSize(cc.size(386,294))
    stp_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_dikuang)
    stp_dikuang:setPositionInContainer(cc.p(285,202))
    table_shangci_tip_popup["stp_dikuang"] = stp_dikuang

    local stp_left_btn = fc.FScaleButton:create()
    stp_left_btn:setSize(cc.size(144,53))
    stp_left_btn:setAnchorPoint(cc.p(0.5,0.5))
    stp_left_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(stp_left_btn)
    stp_left_btn:setPositionInContainer(cc.p(198,295.5))
    table_shangci_tip_popup["stp_left_btn"] = stp_left_btn

    local stp_guan = fc.FShaderExtensionsImage:create(0)
    stp_guan:setAnchorPoint(cc.p(0.5,0.5))
    stp_guan:setImage("batch_ui/guan_uizi.png")
    stp_guan:setSize(cc.size(32,32))
    stp_left_btn:appendComponent(stp_guan)
    stp_guan:setPositionInContainer(cc.p(50,26))
    table_shangci_tip_popup["stp_guan"] = stp_guan

    local stp_bi = fc.FShaderExtensionsImage:create(0)
    stp_bi:setAnchorPoint(cc.p(0.5,0.5))
    stp_bi:setImage("batch_ui/bi_uizi.png")
    stp_bi:setSize(cc.size(32,32))
    stp_left_btn:appendComponent(stp_bi)
    stp_bi:setPositionInContainer(cc.p(94,26))
    table_shangci_tip_popup["stp_bi"] = stp_bi

    local stp_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    stp_wenzi_di:setSize(cc.size(380,70))
    stp_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_wenzi_di)
    stp_wenzi_di:setPositionInContainer(cc.p(282,220))
    table_shangci_tip_popup["stp_wenzi_di"] = stp_wenzi_di

    local stp_pop_notice_label = fc.FLabel:createBMFont()
    stp_pop_notice_label:setSize(cc.size(380,95))
    stp_pop_notice_label:setWidth(380)
    stp_pop_notice_label:setAnchorPoint(cc.p(0.5,0.5))
    stp_pop_notice_label:setFontSize(20)
    stp_pop_notice_label:setString("步兵步兵步兵")
    stp_pop_notice_label:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(stp_pop_notice_label)
    stp_pop_notice_label:setPositionInContainer(cc.p(285,118.5))
    table_shangci_tip_popup["stp_pop_notice_label"] = stp_pop_notice_label

    local stp_zhou_down = fc.FExtensionsImage:create()
    stp_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    stp_zhou_down:setSize(cc.size(47,570))
    stp_zhou_down:setRotation(90)
    stp_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_zhou_down)
    stp_zhou_down:setPositionInContainer(cc.p(285,368.5))
    table_shangci_tip_popup["stp_zhou_down"] = stp_zhou_down

    local stp_zhou_up = fc.FExtensionsImage:create()
    stp_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    stp_zhou_up:setSize(cc.size(47,570))
    stp_zhou_up:setRotation(90)
    stp_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_zhou_up)
    stp_zhou_up:setPositionInContainer(cc.p(285,37.5))
    table_shangci_tip_popup["stp_zhou_up"] = stp_zhou_up

    local stp_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    stp_title_bg:setSize(cc.size(288,40))
    stp_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    stp_title_bg:setScaleY(-1)
    pop_bottom_panel:appendComponent(stp_title_bg)
    stp_title_bg:setPositionInContainer(cc.p(285,36))
    table_shangci_tip_popup["stp_title_bg"] = stp_title_bg

    local stp_ti = fc.FExtensionsImage:create()
    stp_ti:setImage("batch_ui/ti2_uizi.png")
    stp_ti:setSize(cc.size(32,32))
    stp_ti:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_ti)
    stp_ti:setPositionInContainer(cc.p(249,36))
    table_shangci_tip_popup["stp_ti"] = stp_ti

    local stp_shi = fc.FExtensionsImage:create()
    stp_shi:setImage("batch_ui/shi4_uizi.png")
    stp_shi:setSize(cc.size(32,32))
    stp_shi:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_shi)
    stp_shi:setPositionInContainer(cc.p(321,36))
    table_shangci_tip_popup["stp_shi"] = stp_shi

    local stp_right_btn = fc.FScaleButton:create()
    stp_right_btn:setSize(cc.size(144,53))
    stp_right_btn:setAnchorPoint(cc.p(0.5,0.5))
    stp_right_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(stp_right_btn)
    stp_right_btn:setPositionInContainer(cc.p(372,295.5))
    table_shangci_tip_popup["stp_right_btn"] = stp_right_btn

    local stp_gou = fc.FShaderExtensionsImage:create(0)
    stp_gou:setAnchorPoint(cc.p(0.5,0.5))
    stp_gou:setImage("batch_ui/gou_uizi.png")
    stp_gou:setSize(cc.size(32,32))
    stp_right_btn:appendComponent(stp_gou)
    stp_gou:setPositionInContainer(cc.p(50,26))
    table_shangci_tip_popup["stp_gou"] = stp_gou

    local stp_mai = fc.FShaderExtensionsImage:create(0)
    stp_mai:setAnchorPoint(cc.p(0.5,0.5))
    stp_mai:setImage("batch_ui/mai_uizi.png")
    stp_mai:setSize(cc.size(32,32))
    stp_right_btn:appendComponent(stp_mai)
    stp_mai:setPositionInContainer(cc.p(94,26))
    table_shangci_tip_popup["stp_mai"] = stp_mai

    local stp_close_btn = fc.FScaleButton:create()
    stp_close_btn:setSize(cc.size(41,45))
    stp_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    stp_close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    pop_bottom_panel:appendComponent(stp_close_btn)
    stp_close_btn:setPositionInContainer(cc.p(529.5,36.5))
    table_shangci_tip_popup["stp_close_btn"] = stp_close_btn

    local stp_jinshou_img = fc.FExtensionsImage:create()
    stp_jinshou_img:setImage("batch_ui/zhandou.png")
    stp_jinshou_img:setSize(cc.size(48,49))
    stp_jinshou_img:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_jinshou_img)
    stp_jinshou_img:setPositionInContainer(cc.p(150,220.5))
    table_shangci_tip_popup["stp_jinshou_img"] = stp_jinshou_img

    local stp_yuanbao_img = fc.FExtensionsImage:create()
    stp_yuanbao_img:setImage("batch_ui/yuanbao.png")
    stp_yuanbao_img:setSize(cc.size(58,43))
    stp_yuanbao_img:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_yuanbao_img)
    stp_yuanbao_img:setPositionInContainer(cc.p(299,217.5))
    table_shangci_tip_popup["stp_yuanbao_img"] = stp_yuanbao_img

    local stp_price_bg = fc.FExtensionsImage:create()
    stp_price_bg:setImage("batch_ui/shuzi_dikuang.png")
    stp_price_bg:setSize(cc.size(76,23))
    stp_price_bg:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(stp_price_bg)
    stp_price_bg:setPositionInContainer(cc.p(370,219.5))
    table_shangci_tip_popup["stp_price_bg"] = stp_price_bg

    local stp_price_label = fc.FLabel:createBMFont()
    stp_price_label:setSize(cc.size(100,22))
    stp_price_label:setAnchorPoint(cc.p(0.5,0.5))
    stp_price_label:setFontSize()
    stp_price_label:setString("500")
    stp_price_label:setColor(cc.c3b(0,255,255))
    pop_bottom_panel:appendComponent(stp_price_label)
    stp_price_label:setPositionInContainer(cc.p(370,216))
    table_shangci_tip_popup["stp_price_label"] = stp_price_label

    return table_shangci_tip_popup

end

