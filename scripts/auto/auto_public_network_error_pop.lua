function createpublic_network_error_pop()

    local table_public_network_error_pop = {}

    local public_network_error_pop = fc.FContainerPanel:create()
    public_network_error_pop:setSize(cc.size(960,640))
    table_public_network_error_pop["public_network_error_pop"] = public_network_error_pop

    local pop_bottom_panel = fc.FContainerPanel:create()
    pop_bottom_panel:setSize(cc.size(534,350))
    pop_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_network_error_pop:appendComponent(pop_bottom_panel)
    pop_bottom_panel:setPositionInContainer(cc.p(480,319))
    table_public_network_error_pop["pop_bottom_panel"] = pop_bottom_panel

    local pnep_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
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

    local pnep_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    pnep_title_bg:setSize(cc.size(260,50))
    pnep_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    pnep_title_bg:setScaleY(-1)
    pop_bottom_panel:appendComponent(pnep_title_bg)
    pnep_title_bg:setPositionInContainer(cc.p(267,25))
    table_public_network_error_pop["pnep_title_bg"] = pnep_title_bg

    local pnep_dikuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pnep_dikuang1:setSize(cc.size(384,251))
    pnep_dikuang1:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_dikuang1)
    pnep_dikuang1:setPositionInContainer(cc.p(267,176.5))
    table_public_network_error_pop["pnep_dikuang1"] = pnep_dikuang1

    local pnep_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pnep_dikuang:setSize(cc.size(384,251))
    pnep_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_dikuang)
    pnep_dikuang:setPositionInContainer(cc.p(267,176.5))
    table_public_network_error_pop["pnep_dikuang"] = pnep_dikuang

    local pop_queding_button = fc.FScaleButton:create()
    pop_queding_button:setSize(cc.size(144,53))
    pop_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    pop_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(pop_queding_button)
    pop_queding_button:setPositionInContainer(cc.p(267,255.5))
    table_public_network_error_pop["pop_queding_button"] = pop_queding_button

    local pnep_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    pnep_wenzi_di:setSize(cc.size(380,49))
    pnep_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_wenzi_di)
    pnep_wenzi_di:setPositionInContainer(cc.p(267,147.5))
    table_public_network_error_pop["pnep_wenzi_di"] = pnep_wenzi_di

    local pnep_pop_notice_label = fc.FLabel:createBMFont()
    pnep_pop_notice_label:setSize(cc.size(380,49))
    pnep_pop_notice_label:setWidth(380)
    pnep_pop_notice_label:setAnchorPoint(cc.p(0.5,0.5))
    pnep_pop_notice_label:setFontSize(20)
    pnep_pop_notice_label:setString("步兵步兵步兵")
    pnep_pop_notice_label:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(pnep_pop_notice_label)
    pnep_pop_notice_label:setPositionInContainer(cc.p(267,144.5))
    table_public_network_error_pop["pnep_pop_notice_label"] = pnep_pop_notice_label

    local pnep_que = fc.FExtensionsImage:create()
    pnep_que:setImage("batch_ui/que_uizi.png")
    pnep_que:setSize(cc.size(32,32))
    pnep_que:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_que)
    pnep_que:setPositionInContainer(cc.p(245,256))
    table_public_network_error_pop["pnep_que"] = pnep_que

    local pnep_ding = fc.FExtensionsImage:create()
    pnep_ding:setImage("batch_ui/ding_uizi.png")
    pnep_ding:setSize(cc.size(32,32))
    pnep_ding:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_ding)
    pnep_ding:setPositionInContainer(cc.p(287,256))
    table_public_network_error_pop["pnep_ding"] = pnep_ding

    local pnep_ti = fc.FExtensionsImage:create()
    pnep_ti:setImage("batch_ui/ti2_uizi.png")
    pnep_ti:setSize(cc.size(32,32))
    pnep_ti:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_ti)
    pnep_ti:setPositionInContainer(cc.p(238,25))
    table_public_network_error_pop["pnep_ti"] = pnep_ti

    local pnep_shi = fc.FExtensionsImage:create()
    pnep_shi:setImage("batch_ui/shi4_uizi.png")
    pnep_shi:setSize(cc.size(32,32))
    pnep_shi:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(pnep_shi)
    pnep_shi:setPositionInContainer(cc.p(296,25))
    table_public_network_error_pop["pnep_shi"] = pnep_shi

    return table_public_network_error_pop

end

