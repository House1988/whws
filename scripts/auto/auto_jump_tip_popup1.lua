function createjump_tip_popup1()

    local table_jump_tip_popup1 = {}

    local jump_tip_popup1 = fc.FContainerPanel:create()
    jump_tip_popup1:setSize(cc.size(960,640))
    table_jump_tip_popup1["jump_tip_popup1"] = jump_tip_popup1

    local pop_bottom_panel = fc.FContainerPanel:create()
    pop_bottom_panel:setSize(cc.size(570,404))
    pop_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    jump_tip_popup1:appendComponent(pop_bottom_panel)
    pop_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_jump_tip_popup1["pop_bottom_panel"] = pop_bottom_panel

    local jtp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(12,38,62,58))
    jtp_wen_la:setSize(cc.size(443,350))
    jtp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_wen_la)
    jtp_wen_la:setPositionInContainer(cc.p(285.5,202))
    table_jump_tip_popup1["jtp_wen_la"] = jtp_wen_la

    local jtp_dikuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    jtp_dikuang1:setSize(cc.size(386,294))
    jtp_dikuang1:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_dikuang1)
    jtp_dikuang1:setPositionInContainer(cc.p(285,202))
    table_jump_tip_popup1["jtp_dikuang1"] = jtp_dikuang1

    local jtp_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    jtp_dikuang:setSize(cc.size(386,294))
    jtp_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_dikuang)
    jtp_dikuang:setPositionInContainer(cc.p(285,202))
    table_jump_tip_popup1["jtp_dikuang"] = jtp_dikuang

    local jtp_left_btn = fc.FScaleButton:create()
    jtp_left_btn:setSize(cc.size(144,53))
    jtp_left_btn:setAnchorPoint(cc.p(0.5,0.5))
    jtp_left_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(jtp_left_btn)
    jtp_left_btn:setPositionInContainer(cc.p(198,291.5))
    table_jump_tip_popup1["jtp_left_btn"] = jtp_left_btn

    local jtp_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    jtp_wenzi_di:setSize(cc.size(380,95))
    jtp_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_wenzi_di)
    jtp_wenzi_di:setPositionInContainer(cc.p(285,173.5))
    table_jump_tip_popup1["jtp_wenzi_di"] = jtp_wenzi_di

    local jtp_pop_notice_label = fc.FLabel:createBMFont()
    jtp_pop_notice_label:setSize(cc.size(380,95))
    jtp_pop_notice_label:setWidth(380)
    jtp_pop_notice_label:setAnchorPoint(cc.p(0.5,0.5))
    jtp_pop_notice_label:setFontSize(20)
    jtp_pop_notice_label:setString("步兵步兵步兵")
    jtp_pop_notice_label:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(jtp_pop_notice_label)
    jtp_pop_notice_label:setPositionInContainer(cc.p(285,173.5))
    table_jump_tip_popup1["jtp_pop_notice_label"] = jtp_pop_notice_label

    local jtp_zhou_down = fc.FExtensionsImage:create()
    jtp_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    jtp_zhou_down:setSize(cc.size(47,570))
    jtp_zhou_down:setRotation(90)
    jtp_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_zhou_down)
    jtp_zhou_down:setPositionInContainer(cc.p(285,368.5))
    table_jump_tip_popup1["jtp_zhou_down"] = jtp_zhou_down

    local jtp_zhou_up = fc.FExtensionsImage:create()
    jtp_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    jtp_zhou_up:setSize(cc.size(47,570))
    jtp_zhou_up:setRotation(90)
    jtp_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_zhou_up)
    jtp_zhou_up:setPositionInContainer(cc.p(285,37.5))
    table_jump_tip_popup1["jtp_zhou_up"] = jtp_zhou_up

    local jtp_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    jtp_title_bg:setSize(cc.size(288,40))
    jtp_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    jtp_title_bg:setScaleY(-1)
    pop_bottom_panel:appendComponent(jtp_title_bg)
    jtp_title_bg:setPositionInContainer(cc.p(285,36))
    table_jump_tip_popup1["jtp_title_bg"] = jtp_title_bg

    local jtp_ti = fc.FExtensionsImage:create()
    jtp_ti:setImage("batch_ui/ti2_uizi.png")
    jtp_ti:setSize(cc.size(32,32))
    jtp_ti:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_ti)
    jtp_ti:setPositionInContainer(cc.p(249,36))
    table_jump_tip_popup1["jtp_ti"] = jtp_ti

    local jtp_shi = fc.FExtensionsImage:create()
    jtp_shi:setImage("batch_ui/shi4_uizi.png")
    jtp_shi:setSize(cc.size(32,32))
    jtp_shi:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(jtp_shi)
    jtp_shi:setPositionInContainer(cc.p(321,36))
    table_jump_tip_popup1["jtp_shi"] = jtp_shi

    local jtp_right_btn = fc.FScaleButton:create()
    jtp_right_btn:setSize(cc.size(144,53))
    jtp_right_btn:setAnchorPoint(cc.p(0.5,0.5))
    jtp_right_btn:setButtonImage("batch_ui/teshuanniu.png")
    pop_bottom_panel:appendComponent(jtp_right_btn)
    jtp_right_btn:setPositionInContainer(cc.p(372,291.5))
    table_jump_tip_popup1["jtp_right_btn"] = jtp_right_btn

    local jtp_close_btn = fc.FScaleButton:create()
    jtp_close_btn:setSize(cc.size(41,45))
    jtp_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    jtp_close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    pop_bottom_panel:appendComponent(jtp_close_btn)
    jtp_close_btn:setPositionInContainer(cc.p(529.5,36.5))
    table_jump_tip_popup1["jtp_close_btn"] = jtp_close_btn

    return table_jump_tip_popup1

end

