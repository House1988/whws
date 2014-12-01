function createLueduoItem()

    local table_LueduoItem = {}

    local LueduoItem = fc.FContainerPanel:create()
    LueduoItem:setSize(cc.size(850,140))
    table_LueduoItem["LueduoItem"] = LueduoItem

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    bg:setSize(cc.size(840,130))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(bg)
    bg:setPositionInContainer(cc.p(425,70))
    table_LueduoItem["bg"] = bg

    local bgFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang_ciguan.png",cc.rect(12,12,2,2))
    bgFrame:setSize(cc.size(850,140))
    bgFrame:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(bgFrame)
    bgFrame:setPositionInContainer(cc.p(425,70))
    table_LueduoItem["bgFrame"] = bgFrame

    local nianhao = fc.FLabel:createBMFont()
    nianhao:setSize(cc.size(80,30))
    nianhao:setAnchorPoint(cc.p(0.5,0.5))
    nianhao:setFontSize(20)
    nianhao:setString("年号：")
    nianhao:setColor(cc.c3b(91, 24, 6))
    LueduoItem:appendComponent(nianhao)
    nianhao:setPositionInContainer(cc.p(62,35))
    table_LueduoItem["nianhao"] = nianhao

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(80,30))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("名字：")
    name:setColor(cc.c3b(91, 24, 6))
    LueduoItem:appendComponent(name)
    name:setPositionInContainer(cc.p(62,66))
    table_LueduoItem["name"] = name

    local level = fc.FLabel:createBMFont()
    level:setSize(cc.size(80,30))
    level:setAnchorPoint(cc.p(0.5,0.5))
    level:setFontSize(20)
    level:setString("LV：")
    level:setColor(cc.c3b(91, 24, 6))
    LueduoItem:appendComponent(level)
    level:setPositionInContainer(cc.p(62,97))
    table_LueduoItem["level"] = level

    local nianhaoText = fc.FLabel:createBMFont()
    nianhaoText:setSize(cc.size(80,30))
    nianhaoText:setAnchorPoint(cc.p(0.5,0.5))
    nianhaoText:setFontSize(20)
    nianhaoText:setString("LV：")
    nianhaoText:setColor(cc.c3b(0, 0, 255))
    LueduoItem:appendComponent(nianhaoText)
    nianhaoText:setPositionInContainer(cc.p(155,35))
    table_LueduoItem["nianhaoText"] = nianhaoText

    local nameText = fc.FLabel:createBMFont()
    nameText:setSize(cc.size(80,30))
    nameText:setAnchorPoint(cc.p(0.5,0.5))
    nameText:setFontSize(20)
    nameText:setString("LV：")
    nameText:setColor(cc.c3b(0, 0, 255))
    LueduoItem:appendComponent(nameText)
    nameText:setPositionInContainer(cc.p(155,65))
    table_LueduoItem["nameText"] = nameText

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(100,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(155,98))
    table_LueduoItem["textBg"] = textBg

    local levelText = fc.FLabel:createBMFont()
    levelText:setSize(cc.size(80,30))
    levelText:setAnchorPoint(cc.p(0.5,0.5))
    levelText:setFontSize(20)
    levelText:setString("LV：")
    levelText:setColor(cc.c3b(139, 255, 240))
    LueduoItem:appendComponent(levelText)
    levelText:setPositionInContainer(cc.p(155,95))
    table_LueduoItem["levelText"] = levelText

    local frame1 = fc.FExtensionsImage:create()
    frame1:setImage("batch_ui/baipinzhi_kuang.png")
    frame1:setSize(cc.size(104,104))
    frame1:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(frame1)
    frame1:setPositionInContainer(cc.p(284,70))
    table_LueduoItem["frame1"] = frame1

    local frame2 = fc.FExtensionsImage:create()
    frame2:setImage("batch_ui/baipinzhi_kuang.png")
    frame2:setSize(cc.size(104,104))
    frame2:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(frame2)
    frame2:setPositionInContainer(cc.p(409,70))
    table_LueduoItem["frame2"] = frame2

    local frame3 = fc.FExtensionsImage:create()
    frame3:setImage("batch_ui/baipinzhi_kuang.png")
    frame3:setSize(cc.size(104,104))
    frame3:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(frame3)
    frame3:setPositionInContainer(cc.p(533,70))
    table_LueduoItem["frame3"] = frame3

    local frame4 = fc.FExtensionsImage:create()
    frame4:setImage("batch_ui/baipinzhi_kuang.png")
    frame4:setSize(cc.size(104,104))
    frame4:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(frame4)
    frame4:setPositionInContainer(cc.p(658,70))
    table_LueduoItem["frame4"] = frame4

    local icon1 = fc.FExtensionsImage:create()
    icon1:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(icon1)
    icon1:setPositionInContainer(cc.p(284,70))
    table_LueduoItem["icon1"] = icon1

    local icon2 = fc.FExtensionsImage:create()
    icon2:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(icon2)
    icon2:setPositionInContainer(cc.p(409,70))
    table_LueduoItem["icon2"] = icon2

    local icon3 = fc.FExtensionsImage:create()
    icon3:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(icon3)
    icon3:setPositionInContainer(cc.p(533,70))
    table_LueduoItem["icon3"] = icon3

    local icon4 = fc.FExtensionsImage:create()
    icon4:setAnchorPoint(cc.p(0.5,0.5))
    LueduoItem:appendComponent(icon4)
    icon4:setPositionInContainer(cc.p(658,70))
    table_LueduoItem["icon4"] = icon4

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(80,79))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/lueduo_anniu.png")
    LueduoItem:appendComponent(btn)
    btn:setPositionInContainer(cc.p(770,69.5))
    table_LueduoItem["btn"] = btn

    return table_LueduoItem

end

