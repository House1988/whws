function createpublic_popup1()

    local table_public_popup1 = {}

    local public_popup1 = fc.FContainerPanel:create()
    public_popup1:setSize(cc.size(960,640))
    table_public_popup1["public_popup1"] = public_popup1

    local public_popup_bottom = fc.FContainerPanel:create()
    public_popup_bottom:setSize(cc.size(534,420))
    public_popup_bottom:setAnchorPoint(cc.p(0.5,0.5))
    public_popup1:appendComponent(public_popup_bottom)
    public_popup_bottom:setPositionInContainer(cc.p(480,320))
    table_public_popup1["public_popup_bottom"] = public_popup_bottom

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(412,350))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_bottom:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(267,210))
    table_public_popup1["wen_la"] = wen_la

    local zhou_up = fc.FExtensionsImage:create()
    zhou_up:setImage("nobatch/shengzhi_zhou.png")
    zhou_up:setSize(cc.size(52,534))
    zhou_up:setRotation(90)
    zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_bottom:appendComponent(zhou_up)
    zhou_up:setPositionInContainer(cc.p(267,26))
    table_public_popup1["zhou_up"] = zhou_up

    local zhou_down = fc.FExtensionsImage:create()
    zhou_down:setImage("nobatch/shengzhi_zhou.png")
    zhou_down:setSize(cc.size(52,534))
    zhou_down:setRotation(90)
    zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_bottom:appendComponent(zhou_down)
    zhou_down:setPositionInContainer(cc.p(267,388))
    table_public_popup1["zhou_down"] = zhou_down

    local pp1_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    pp1_title_bg:setSize(cc.size(260,50))
    pp1_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    pp1_title_bg:setScaleY(-1)
    public_popup_bottom:appendComponent(pp1_title_bg)
    pp1_title_bg:setPositionInContainer(cc.p(267,25))
    table_public_popup1["pp1_title_bg"] = pp1_title_bg

    local pp1_bg_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pp1_bg_rect1:setSize(cc.size(384,315))
    pp1_bg_rect1:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_bottom:appendComponent(pp1_bg_rect1)
    pp1_bg_rect1:setPositionInContainer(cc.p(267,206.5))
    table_public_popup1["pp1_bg_rect1"] = pp1_bg_rect1

    local pp1_bg_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pp1_bg_rect:setSize(cc.size(384,315))
    pp1_bg_rect:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_bottom:appendComponent(pp1_bg_rect)
    pp1_bg_rect:setPositionInContainer(cc.p(267,206.5))
    table_public_popup1["pp1_bg_rect"] = pp1_bg_rect

    local public_popup_yes_button = fc.FScaleButton:create()
    public_popup_yes_button:setSize(cc.size(144,53))
    public_popup_yes_button:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_yes_button:setButtonImage("batch_ui/putonganniu1_up.png")
    public_popup_bottom:appendComponent(public_popup_yes_button)
    public_popup_yes_button:setPositionInContainer(cc.p(269,292.5))
    table_public_popup1["public_popup_yes_button"] = public_popup_yes_button

    local pp1_ui_que = fc.FExtensionsImage:create()
    pp1_ui_que:setImage("batch_ui/que_uizi.png")
    pp1_ui_que:setSize(cc.size(32,32))
    pp1_ui_que:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_yes_button:appendComponent(pp1_ui_que)
    pp1_ui_que:setPositionInContainer(cc.p(45,26))
    table_public_popup1["pp1_ui_que"] = pp1_ui_que

    local pp1_ui_ding = fc.FExtensionsImage:create()
    pp1_ui_ding:setImage("batch_ui/ding_uizi.png")
    pp1_ui_ding:setSize(cc.size(32,32))
    pp1_ui_ding:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_yes_button:appendComponent(pp1_ui_ding)
    pp1_ui_ding:setPositionInContainer(cc.p(99,26))
    table_public_popup1["pp1_ui_ding"] = pp1_ui_ding

    local public_popup_flabel_content1 = fc.FLabel:createBMFont()
    public_popup_flabel_content1:setSize(cc.size(180,30))
    public_popup_flabel_content1:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_flabel_content1:setFontSize(20)
    public_popup_flabel_content1:setString("")
    public_popup_flabel_content1:setColor(cc.c3b(91,24,6))
    public_popup_bottom:appendComponent(public_popup_flabel_content1)
    public_popup_flabel_content1:setPositionInContainer(cc.p(269,134))
    table_public_popup1["public_popup_flabel_content1"] = public_popup_flabel_content1

    local public_popup_flabel_content2 = fc.FLabel:createBMFont()
    public_popup_flabel_content2:setSize(cc.size(180,30))
    public_popup_flabel_content2:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_flabel_content2:setFontSize(20)
    public_popup_flabel_content2:setString("")
    public_popup_flabel_content2:setColor(cc.c3b(91,24,6))
    public_popup_bottom:appendComponent(public_popup_flabel_content2)
    public_popup_flabel_content2:setPositionInContainer(cc.p(269,188))
    table_public_popup1["public_popup_flabel_content2"] = public_popup_flabel_content2

    local public_popup_flabel_title = fc.FLabel:createBMFont()
    public_popup_flabel_title:setSize(cc.size(100,30))
    public_popup_flabel_title:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_flabel_title:setFontSize(24)
    public_popup_flabel_title:setString("")
    public_popup_flabel_title:setColor(cc.c3b(255,255,255))
    public_popup_bottom:appendComponent(public_popup_flabel_title)
    public_popup_flabel_title:setPositionInContainer(cc.p(269,73))
    table_public_popup1["public_popup_flabel_title"] = public_popup_flabel_title

    local pp1title_panel = fc.FContainerPanel:create()
    pp1title_panel:setSize(cc.size(150,40))
    pp1title_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_popup_bottom:appendComponent(pp1title_panel)
    pp1title_panel:setPositionInContainer(cc.p(267,25))
    table_public_popup1["pp1title_panel"] = pp1title_panel

    local pp1_ui_sheng = fc.FExtensionsImage:create()
    pp1_ui_sheng:setImage("batch_ui/sheng1_uizi.png")
    pp1_ui_sheng:setSize(cc.size(32,32))
    pp1_ui_sheng:setAnchorPoint(cc.p(0.5,0.5))
    pp1title_panel:appendComponent(pp1_ui_sheng)
    pp1_ui_sheng:setPositionInContainer(cc.p(24,21))
    table_public_popup1["pp1_ui_sheng"] = pp1_ui_sheng

    local pp1_ui_ji = fc.FExtensionsImage:create()
    pp1_ui_ji:setImage("batch_ui/ji1_uizi.png")
    pp1_ui_ji:setSize(cc.size(32,32))
    pp1_ui_ji:setAnchorPoint(cc.p(0.5,0.5))
    pp1title_panel:appendComponent(pp1_ui_ji)
    pp1_ui_ji:setPositionInContainer(cc.p(58,21))
    table_public_popup1["pp1_ui_ji"] = pp1_ui_ji

    local pp1_ui_cheng = fc.FExtensionsImage:create()
    pp1_ui_cheng:setImage("batch_ui/cheng_uizi.png")
    pp1_ui_cheng:setSize(cc.size(32,32))
    pp1_ui_cheng:setAnchorPoint(cc.p(0.5,0.5))
    pp1title_panel:appendComponent(pp1_ui_cheng)
    pp1_ui_cheng:setPositionInContainer(cc.p(91,21))
    table_public_popup1["pp1_ui_cheng"] = pp1_ui_cheng

    local pp1_ui_gong = fc.FExtensionsImage:create()
    pp1_ui_gong:setImage("batch_ui/gong2_uizi.png")
    pp1_ui_gong:setSize(cc.size(32,32))
    pp1_ui_gong:setAnchorPoint(cc.p(0.5,0.5))
    pp1title_panel:appendComponent(pp1_ui_gong)
    pp1_ui_gong:setPositionInContainer(cc.p(125,21))
    table_public_popup1["pp1_ui_gong"] = pp1_ui_gong

    return table_public_popup1

end

