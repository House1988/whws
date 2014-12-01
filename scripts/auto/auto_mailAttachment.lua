function createmailAttachment()

    local table_mailAttachment = {}

    local mailAttachment = fc.FContainerPanel:create()
    mailAttachment:setSize(cc.size(960,640))
    table_mailAttachment["mailAttachment"] = mailAttachment

    local mailAttackmentBottom = fc.FContainerPanel:create()
    mailAttackmentBottom:setSize(cc.size(538,495))
    mailAttackmentBottom:setAnchorPoint(cc.p(0.5,0.5))
    mailAttachment:appendComponent(mailAttackmentBottom)
    mailAttackmentBottom:setPositionInContainer(cc.p(480,319.5))
    table_mailAttachment["mailAttackmentBottom"] = mailAttackmentBottom

    local bgLT = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bgLT:setSize(cc.size(412,420))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(268,250))
    table_mailAttachment["bgLT"] = bgLT

    local juanzhou = fc.FExtensionsImage:create()
    juanzhou:setImage("nobatch/shengzhi_zhou.png")
    juanzhou:setSize(cc.size(52,534))
    juanzhou:setRotation(90)
    juanzhou:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(juanzhou)
    juanzhou:setPositionInContainer(cc.p(268,30))
    table_mailAttachment["juanzhou"] = juanzhou

    local juanzhou = fc.FExtensionsImage:create()
    juanzhou:setImage("nobatch/shengzhi_zhou.png")
    juanzhou:setSize(cc.size(52,534))
    juanzhou:setRotation(90)
    juanzhou:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(juanzhou)
    juanzhou:setPositionInContainer(cc.p(268,464))
    table_mailAttachment["juanzhou"] = juanzhou

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(34,33))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    mailAttackmentBottom:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(495,33.5))
    table_mailAttachment["close_btn"] = close_btn

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg:setSize(cc.size(260,50))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    title_bg:setScaleY(-1)
    mailAttackmentBottom:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(278,30))
    table_mailAttachment["title_bg"] = title_bg

    local ui_ling = fc.FExtensionsImage:create()
    ui_ling:setImage("batch_ui/ling_uizi.png")
    ui_ling:setSize(cc.size(32,32))
    ui_ling:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_ling)
    ui_ling:setPositionInContainer(cc.p(222,30))
    table_mailAttachment["ui_ling"] = ui_ling

    local ui_qu = fc.FExtensionsImage:create()
    ui_qu:setImage("batch_ui/qu_uizi.png")
    ui_qu:setSize(cc.size(32,32))
    ui_qu:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_qu)
    ui_qu:setPositionInContainer(cc.p(254,30))
    table_mailAttachment["ui_qu"] = ui_qu

    local ui_jiang = fc.FExtensionsImage:create()
    ui_jiang:setImage("batch_ui/jiang2_uizi.png")
    ui_jiang:setSize(cc.size(32,32))
    ui_jiang:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_jiang)
    ui_jiang:setPositionInContainer(cc.p(286,30))
    table_mailAttachment["ui_jiang"] = ui_jiang

    local ui_li = fc.FExtensionsImage:create()
    ui_li:setImage("batch_ui/li3_uizi.png")
    ui_li:setSize(cc.size(32,32))
    ui_li:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_li)
    ui_li:setPositionInContainer(cc.p(318,30))
    table_mailAttachment["ui_li"] = ui_li

    local ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    ui_rect3:setSize(cc.size(384,390))
    ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_rect3)
    ui_rect3:setPositionInContainer(cc.p(268,249))
    table_mailAttachment["ui_rect3"] = ui_rect3

    local ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect1:setSize(cc.size(384,390))
    ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_rect1)
    ui_rect1:setPositionInContainer(cc.p(268,249))
    table_mailAttachment["ui_rect1"] = ui_rect1

    local ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_rect2:setSize(cc.size(380,280))
    ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_rect2)
    ui_rect2:setPositionInContainer(cc.p(268,240))
    table_mailAttachment["ui_rect2"] = ui_rect2

    local title_label = fc.FLabel:createSystemFont()
    title_label:setSize(cc.size(100,25))
    title_label:setAnchorPoint(cc.p(0.5,0.5))
    title_label:setFontSize(20)
    title_label:setString("")
    title_label:setColor(cc.c3b(206, 53, 0))
    mailAttackmentBottom:appendComponent(title_label)
    title_label:setPositionInContainer(cc.p(267,77.5))
    table_mailAttachment["title_label"] = title_label

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(144,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/putonganniu1_up.png")
    mailAttackmentBottom:appendComponent(btn)
    btn:setPositionInContainer(cc.p(268,414.5))
    table_mailAttachment["btn"] = btn

    local ling = fc.FShaderExtensionsImage:create(0)
    ling:setAnchorPoint(cc.p(0.5,0.5))
    ling:setImage("batch_ui/ling_uizi.png")
    ling:setSize(cc.size(32,32))
    btn:appendComponent(ling)
    ling:setPositionInContainer(cc.p(54,26))
    table_mailAttachment["ling"] = ling

    local qu = fc.FShaderExtensionsImage:create(0)
    qu:setAnchorPoint(cc.p(0.5,0.5))
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    btn:appendComponent(qu)
    qu:setPositionInContainer(cc.p(90,26))
    table_mailAttachment["qu"] = qu

    return table_mailAttachment

end

