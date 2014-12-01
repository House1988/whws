function createmailPageItem()

    local table_mailPageItem = {}

    local mailPageItem = fc.FContainerPanel:create()
    mailPageItem:setSize(cc.size(800,125))
    table_mailPageItem["mailPageItem"] = mailPageItem

    local bgup = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    bgup:setSize(cc.size(800,45))
    bgup:setAnchorPoint(cc.p(0.5,0.5))
    mailPageItem:appendComponent(bgup)
    bgup:setPositionInContainer(cc.p(400,22.5))
    table_mailPageItem["bgup"] = bgup

    local bgdown = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    bgdown:setSize(cc.size(800,80))
    bgdown:setAnchorPoint(cc.p(0.5,0.5))
    mailPageItem:appendComponent(bgdown)
    bgdown:setPositionInContainer(cc.p(400,85))
    table_mailPageItem["bgdown"] = bgdown

    local fujian_panel = fc.FContainerPanel:create()
    fujian_panel:setSize(cc.size(119,37))
    fujian_panel:setAnchorPoint(cc.p(0.5,0.5))
    mailPageItem:appendComponent(fujian_panel)
    fujian_panel:setPositionInContainer(cc.p(409.5,26.5))
    table_mailPageItem["fujian_panel"] = fujian_panel

    local fujianbgl = fc.FExtensionsImage:create()
    fujianbgl:setImage("batch_ui/fujian.png")
    fujianbgl:setSize(cc.size(119,37))
    fujianbgl:setFlipType(2)
    fujianbgl:setAnchorPoint(cc.p(0.5,0.5))
    fujian_panel:appendComponent(fujianbgl)
    fujianbgl:setPositionInContainer(cc.p(59.5,18.5))
    table_mailPageItem["fujianbgl"] = fujianbgl

    local jian = fc.FExtensionsImage:create()
    jian:setImage("batch_ui/jian2_uizi.png")
    jian:setSize(cc.size(32,32))
    jian:setAnchorPoint(cc.p(0.5,0.5))
    fujian_panel:appendComponent(jian)
    jian:setPositionInContainer(cc.p(76,19))
    table_mailPageItem["jian"] = jian

    local fu = fc.FExtensionsImage:create()
    fu:setImage("batch_ui/fu3_uizi.png")
    fu:setSize(cc.size(32,32))
    fu:setAnchorPoint(cc.p(0.5,0.5))
    fujian_panel:appendComponent(fu)
    fu:setPositionInContainer(cc.p(44,19))
    table_mailPageItem["fu"] = fu

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(100,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    mailPageItem:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(697,24))
    table_mailPageItem["textbg"] = textbg

    local timeText = fc.FLabel:createSystemFont()
    timeText:setSize(cc.size(100,24))
    timeText:setAnchorPoint(cc.p(0.5,0.5))
    timeText:setFontSize(21)
    timeText:setString("aaaaaaaa")
    timeText:setColor(cc.c3b(0,255,255))
    mailPageItem:appendComponent(timeText)
    timeText:setPositionInContainer(cc.p(697,22))
    table_mailPageItem["timeText"] = timeText

    local title = fc.FLabel:createSystemFont()
    title:setSize(cc.size(300,24))
    title:setAnchorPoint(cc.p(0.5,0.5))
    title:setFontSize(21)
    title:setString("aaaaaaaa")
    title:setColor(cc.c3b(0,0,0))
    mailPageItem:appendComponent(title)
    title:setPositionInContainer(cc.p(163,20))
    table_mailPageItem["title"] = title

    local frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frame:setSize(cc.size(800,125))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    mailPageItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(400,62.5))
    table_mailPageItem["frame"] = frame

    local accept_btn = fc.FScaleButton:create()
    accept_btn:setSize(cc.size(144,53))
    accept_btn:setAnchorPoint(cc.p(0.5,0.5))
    accept_btn:setButtonImage("batch_ui/teshuanniu.png")
    mailPageItem:appendComponent(accept_btn)
    accept_btn:setPositionInContainer(cc.p(706,82.5))
    table_mailPageItem["accept_btn"] = accept_btn

    local ling = fc.FShaderExtensionsImage:create(0)
    ling:setAnchorPoint(cc.p(0.5,0.5))
    ling:setImage("batch_ui/ling_uizi.png")
    ling:setSize(cc.size(32,32))
    accept_btn:appendComponent(ling)
    ling:setPositionInContainer(cc.p(54,26))
    table_mailPageItem["ling"] = ling

    local qu = fc.FShaderExtensionsImage:create(0)
    qu:setAnchorPoint(cc.p(0.5,0.5))
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    accept_btn:appendComponent(qu)
    qu:setPositionInContainer(cc.p(90,26))
    table_mailPageItem["qu"] = qu

    local text = fc.FLabel:createSystemFont()
    text:setSize(cc.size(600,70))
    text:setWidth(500)
    text:setAnchorPoint(cc.p(0.5,0.5))
    text:setFontSize(21)
    text:setString("aaaaaaaa")
    text:setColor(cc.c3b(106,68,19))
    mailPageItem:appendComponent(text)
    text:setPositionInContainer(cc.p(324,84))
    table_mailPageItem["text"] = text

    local chuli = fc.FExtensionsImage:create()
    chuli:setImage("batch_ui/yichuli_youjian.png")
    chuli:setSize(cc.size(127,83))
    chuli:setAnchorPoint(cc.p(0.5,0.5))
    mailPageItem:appendComponent(chuli)
    chuli:setPositionInContainer(cc.p(560.5,56.5))
    table_mailPageItem["chuli"] = chuli

    local shanchu_btn = fc.FScaleButton:create()
    shanchu_btn:setSize(cc.size(144,53))
    shanchu_btn:setAnchorPoint(cc.p(0.5,0.5))
    shanchu_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    mailPageItem:appendComponent(shanchu_btn)
    shanchu_btn:setPositionInContainer(cc.p(706,82.5))
    table_mailPageItem["shanchu_btn"] = shanchu_btn

    local shan = fc.FShaderExtensionsImage:create(0)
    shan:setAnchorPoint(cc.p(0.5,0.5))
    shan:setImage("batch_ui/shan_uizi.png")
    shan:setSize(cc.size(32,32))
    shanchu_btn:appendComponent(shan)
    shan:setPositionInContainer(cc.p(54,26))
    table_mailPageItem["shan"] = shan

    local chu = fc.FShaderExtensionsImage:create(0)
    chu:setAnchorPoint(cc.p(0.5,0.5))
    chu:setImage("batch_ui/chu2_uizi.png")
    chu:setSize(cc.size(32,32))
    shanchu_btn:appendComponent(chu)
    chu:setPositionInContainer(cc.p(90,26))
    table_mailPageItem["chu"] = chu

    return table_mailPageItem

end

