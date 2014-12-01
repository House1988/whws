function createpublic_popup2()

    local table_public_popup2 = {}

    local public_popup2 = fc.FContainerPanel:create()
    public_popup2:setSize(cc.size(960,640))
    table_public_popup2["public_popup2"] = public_popup2

    local public_popup2_bottom_panel = fc.FContainerPanel:create()
    public_popup2_bottom_panel:setSize(cc.size(534,350))
    public_popup2_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2:appendComponent(public_popup2_bottom_panel)
    public_popup2_bottom_panel:setPositionInContainer(cc.p(488,314))
    table_public_popup2["public_popup2_bottom_panel"] = public_popup2_bottom_panel

    local bg_diwen_pp2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bg_diwen_pp2:setSize(cc.size(412,280))
    bg_diwen_pp2:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_bottom_panel:appendComponent(bg_diwen_pp2)
    bg_diwen_pp2:setPositionInContainer(cc.p(267,175))
    table_public_popup2["bg_diwen_pp2"] = bg_diwen_pp2

    local zhou_up = fc.FExtensionsImage:create()
    zhou_up:setImage("nobatch/shengzhi_zhou.png")
    zhou_up:setSize(cc.size(52,534))
    zhou_up:setRotation(90)
    zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_bottom_panel:appendComponent(zhou_up)
    zhou_up:setPositionInContainer(cc.p(267,26))
    table_public_popup2["zhou_up"] = zhou_up

    local zhou_down = fc.FExtensionsImage:create()
    zhou_down:setImage("nobatch/shengzhi_zhou.png")
    zhou_down:setSize(cc.size(52,534))
    zhou_down:setRotation(90)
    zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_bottom_panel:appendComponent(zhou_down)
    zhou_down:setPositionInContainer(cc.p(267,324))
    table_public_popup2["zhou_down"] = zhou_down

    local pp2_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pp2_rect2:setSize(cc.size(384,250))
    pp2_rect2:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_bottom_panel:appendComponent(pp2_rect2)
    pp2_rect2:setPositionInContainer(cc.p(267,176))
    table_public_popup2["pp2_rect2"] = pp2_rect2

    local pp2_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pp2_rect1:setSize(cc.size(384,250))
    pp2_rect1:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_bottom_panel:appendComponent(pp2_rect1)
    pp2_rect1:setPositionInContainer(cc.p(267,175))
    table_public_popup2["pp2_rect1"] = pp2_rect1

    local jld_zztc_fenfu_label = fc.FLabel:createBMFont()
    jld_zztc_fenfu_label:setSize(cc.size(300,30))
    jld_zztc_fenfu_label:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_fenfu_label:setFontSize(20)
    jld_zztc_fenfu_label:setString("")
    jld_zztc_fenfu_label:setColor(cc.c3b(91,24,6))
    public_popup2_bottom_panel:appendComponent(jld_zztc_fenfu_label)
    jld_zztc_fenfu_label:setPositionInContainer(cc.p(267,77))
    table_public_popup2["jld_zztc_fenfu_label"] = jld_zztc_fenfu_label

    local bling_panel = fc.FContainerPanel:create()
    bling_panel:setSize(cc.size(162,112))
    bling_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_bottom_panel:appendComponent(bling_panel)
    bling_panel:setPositionInContainer(cc.p(267,158))
    table_public_popup2["bling_panel"] = bling_panel

    local bling_up = fc.FExtensionsImage:create()
    bling_up:setImage("nobatch/bulingbuling.png")
    bling_up:setSize(cc.size(162,56))
    bling_up:setAnchorPoint(cc.p(0.5,0.5))
    bling_panel:appendComponent(bling_up)
    bling_up:setPositionInContainer(cc.p(81,28))
    table_public_popup2["bling_up"] = bling_up

    local bling_down = fc.FExtensionsImage:create()
    bling_down:setImage("nobatch/bulingbuling.png")
    bling_down:setSize(cc.size(162,56))
    bling_down:setFlipType(4)
    bling_down:setAnchorPoint(cc.p(0.5,0.5))
    bling_panel:appendComponent(bling_down)
    bling_down:setPositionInContainer(cc.p(81,84))
    table_public_popup2["bling_down"] = bling_down

    local public_popup2_content1_label = fc.FLabel:createBMFont()
    public_popup2_content1_label:setSize(cc.size(100,30))
    public_popup2_content1_label:setAnchorPoint(cc.p(0.5,0.5))
    public_popup2_content1_label:setFontSize(20)
    public_popup2_content1_label:setString("")
    public_popup2_content1_label:setColor(cc.c3b(91,24,6))
    public_popup2_bottom_panel:appendComponent(public_popup2_content1_label)
    public_popup2_content1_label:setPositionInContainer(cc.p(264,159))
    table_public_popup2["public_popup2_content1_label"] = public_popup2_content1_label

    local popup2_yes_button = fc.FScaleButton:create()
    popup2_yes_button:setSize(cc.size(144,53))
    popup2_yes_button:setAnchorPoint(cc.p(0.5,0.5))
    popup2_yes_button:setButtonImage("batch_ui/putonganniu1_up.png")
    public_popup2_bottom_panel:appendComponent(popup2_yes_button)
    popup2_yes_button:setPositionInContainer(cc.p(267,261.5))
    table_public_popup2["popup2_yes_button"] = popup2_yes_button

    local pp2_que = fc.FExtensionsImage:create()
    pp2_que:setImage("batch_ui/que_uizi.png")
    pp2_que:setSize(cc.size(32,32))
    pp2_que:setAnchorPoint(cc.p(0.5,0.5))
    popup2_yes_button:appendComponent(pp2_que)
    pp2_que:setPositionInContainer(cc.p(43,26))
    table_public_popup2["pp2_que"] = pp2_que

    local pp2_ding = fc.FExtensionsImage:create()
    pp2_ding:setImage("batch_ui/ding_uizi.png")
    pp2_ding:setSize(cc.size(32,32))
    pp2_ding:setAnchorPoint(cc.p(0.5,0.5))
    popup2_yes_button:appendComponent(pp2_ding)
    pp2_ding:setPositionInContainer(cc.p(101,26))
    table_public_popup2["pp2_ding"] = pp2_ding

    return table_public_popup2

end

