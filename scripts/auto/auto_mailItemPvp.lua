function createmailItemPvp()

    local table_mailItemPvp = {}

    local mailItemPvp = fc.FContainerPanel:create()
    mailItemPvp:setSize(cc.size(800,125))
    table_mailItemPvp["mailItemPvp"] = mailItemPvp

    local bgup = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    bgup:setSize(cc.size(800,45))
    bgup:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(bgup)
    bgup:setPositionInContainer(cc.p(400,22.5))
    table_mailItemPvp["bgup"] = bgup

    local bgdown = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    bgdown:setSize(cc.size(800,80))
    bgdown:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(bgdown)
    bgdown:setPositionInContainer(cc.p(400,85))
    table_mailItemPvp["bgdown"] = bgdown

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(100,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(697,26))
    table_mailItemPvp["textbg"] = textbg

    local timeText = fc.FLabel:createSystemFont()
    timeText:setSize(cc.size(100,24))
    timeText:setAnchorPoint(cc.p(0.5,0.5))
    timeText:setFontSize(21)
    timeText:setString("aaaaaaaa")
    timeText:setColor(cc.c3b(0,255,255))
    mailItemPvp:appendComponent(timeText)
    timeText:setPositionInContainer(cc.p(697,22))
    table_mailItemPvp["timeText"] = timeText

    local title = fc.FLabel:createSystemFont()
    title:setSize(cc.size(300,24))
    title:setAnchorPoint(cc.p(0.5,0.5))
    title:setFontSize(21)
    title:setString("aaaaaaaa")
    title:setColor(cc.c3b(0,0,0))
    mailItemPvp:appendComponent(title)
    title:setPositionInContainer(cc.p(240,21))
    table_mailItemPvp["title"] = title

    local contentText = fc.FLabel:createSystemFont()
    contentText:setSize(cc.size(400,70))
    contentText:setWidth(400)
    contentText:setAnchorPoint(cc.p(0.5,0.5))
    contentText:setFontSize(21)
    contentText:setString("aaaaaaaa")
    contentText:setColor(cc.c3b(106,68,19))
    mailItemPvp:appendComponent(contentText)
    contentText:setPositionInContainer(cc.p(267,78))
    table_mailItemPvp["contentText"] = contentText

    local shanchu_btn = fc.FScaleButton:create()
    shanchu_btn:setSize(cc.size(144,53))
    shanchu_btn:setAnchorPoint(cc.p(0.5,0.5))
    shanchu_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    mailItemPvp:appendComponent(shanchu_btn)
    shanchu_btn:setPositionInContainer(cc.p(723,81.5))
    table_mailItemPvp["shanchu_btn"] = shanchu_btn

    local shan = fc.FShaderExtensionsImage:create(0)
    shan:setAnchorPoint(cc.p(0.5,0.5))
    shan:setImage("batch_ui/shan_uizi.png")
    shan:setSize(cc.size(32,32))
    shanchu_btn:appendComponent(shan)
    shan:setPositionInContainer(cc.p(54,26))
    table_mailItemPvp["shan"] = shan

    local chu = fc.FShaderExtensionsImage:create(0)
    chu:setAnchorPoint(cc.p(0.5,0.5))
    chu:setImage("batch_ui/chu2_uizi.png")
    chu:setSize(cc.size(32,32))
    shanchu_btn:appendComponent(chu)
    chu:setPositionInContainer(cc.p(90,26))
    table_mailItemPvp["chu"] = chu

    local huifang_btn = fc.FScaleButton:create()
    huifang_btn:setSize(cc.size(146,53))
    huifang_btn:setAnchorPoint(cc.p(0.5,0.5))
    huifang_btn:setButtonImage("batch_ui/teshuanniu.png")
    mailItemPvp:appendComponent(huifang_btn)
    huifang_btn:setPositionInContainer(cc.p(576,81.5))
    table_mailItemPvp["huifang_btn"] = huifang_btn

    local guan = fc.FShaderExtensionsImage:create(0)
    guan:setAnchorPoint(cc.p(0.5,0.5))
    guan:setImage("batch_ui/guan_uizi (2).png")
    guan:setSize(cc.size(32,32))
    huifang_btn:appendComponent(guan)
    guan:setPositionInContainer(cc.p(31,26))
    table_mailItemPvp["guan"] = guan

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    huifang_btn:appendComponent(kan)
    kan:setPositionInContainer(cc.p(59,25))
    table_mailItemPvp["kan"] = kan

    local hui = fc.FShaderExtensionsImage:create(0)
    hui:setAnchorPoint(cc.p(0.5,0.5))
    hui:setImage("batch_ui/hui_uizi.png")
    hui:setSize(cc.size(32,32))
    huifang_btn:appendComponent(hui)
    hui:setPositionInContainer(cc.p(87,27))
    table_mailItemPvp["hui"] = hui

    local fang = fc.FShaderExtensionsImage:create(0)
    fang:setAnchorPoint(cc.p(0.5,0.5))
    fang:setImage("batch_ui/fang_uizi (2).png")
    fang:setSize(cc.size(32,32))
    huifang_btn:appendComponent(fang)
    fang:setPositionInContainer(cc.p(115,26))
    table_mailItemPvp["fang"] = fang

    local fujianbgl = fc.FExtensionsImage:create()
    fujianbgl:setImage("batch_ui/fujian.png")
    fujianbgl:setSize(cc.size(119,37))
    fujianbgl:setFlipType(2)
    fujianbgl:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(fujianbgl)
    fujianbgl:setPositionInContainer(cc.p(553.5,26.5))
    table_mailItemPvp["fujianbgl"] = fujianbgl

    local baye_label = fc.FContainerPanel:create()
    baye_label:setSize(cc.size(60,30))
    baye_label:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(baye_label)
    baye_label:setPositionInContainer(cc.p(554,25))
    table_mailItemPvp["baye_label"] = baye_label

    local ba = fc.FShaderExtensionsImage:create(0)
    ba:setAnchorPoint(cc.p(0.5,0.5))
    ba:setImage("batch_ui/ba_uizi.png")
    ba:setSize(cc.size(32,32))
    baye_label:appendComponent(ba)
    ba:setPositionInContainer(cc.p(16,16))
    table_mailItemPvp["ba"] = ba

    local ye = fc.FShaderExtensionsImage:create(0)
    ye:setAnchorPoint(cc.p(0.5,0.5))
    ye:setImage("batch_ui/ye_uizi.png")
    ye:setSize(cc.size(32,32))
    baye_label:appendComponent(ye)
    ye:setPositionInContainer(cc.p(44,16))
    table_mailItemPvp["ye"] = ye

    local lueduo_label = fc.FContainerPanel:create()
    lueduo_label:setSize(cc.size(60,30))
    lueduo_label:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(lueduo_label)
    lueduo_label:setPositionInContainer(cc.p(554,25))
    table_mailItemPvp["lueduo_label"] = lueduo_label

    local lue = fc.FShaderExtensionsImage:create(0)
    lue:setAnchorPoint(cc.p(0.5,0.5))
    lue:setImage("batch_ui/lue_uizi.png")
    lue:setSize(cc.size(32,32))
    lueduo_label:appendComponent(lue)
    lue:setPositionInContainer(cc.p(16,16))
    table_mailItemPvp["lue"] = lue

    local duo = fc.FShaderExtensionsImage:create(0)
    duo:setAnchorPoint(cc.p(0.5,0.5))
    duo:setImage("batch_ui/duo_uizi.png")
    duo:setSize(cc.size(32,32))
    lueduo_label:appendComponent(duo)
    duo:setPositionInContainer(cc.p(44,16))
    table_mailItemPvp["duo"] = duo

    local leftTop = fc.FShaderExtensionsImage:create(0)
    leftTop:setAnchorPoint(cc.p(0.5,0.5))
    leftTop:setImage("batch_ui/jibieditu_huodong.png")
    leftTop:setSize(cc.size(80,70))
    mailItemPvp:appendComponent(leftTop)
    leftTop:setPositionInContainer(cc.p(42,43))
    table_mailItemPvp["leftTop"] = leftTop

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng (2).png")
    sheng:setSize(cc.size(40,40))
    sheng:setRotation(325)
    mailItemPvp:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(23.9,30.9))
    table_mailItemPvp["sheng"] = sheng

    local frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frame:setSize(cc.size(800,125))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    mailItemPvp:appendComponent(frame)
    frame:setPositionInContainer(cc.p(400,62.5))
    table_mailItemPvp["frame"] = frame

    local level = fc.FLabel:createSystemFont()
    level:setSize(cc.size(300,24))
    level:setAnchorPoint(cc.p(0.5,0.5))
    level:setFontSize(21)
    level:setString("aaaaaaaa")
    level:setColor(cc.c3b(255,0,0))
    mailItemPvp:appendComponent(level)
    level:setPositionInContainer(cc.p(412,21))
    table_mailItemPvp["level"] = level

    return table_mailItemPvp

end

