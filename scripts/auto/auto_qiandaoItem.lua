function createqiandaoItem()

    local table_qiandaoItem = {}

    local qiandaoItem = fc.FContainerPanel:create()
    qiandaoItem:setSize(cc.size(360,115))
    table_qiandaoItem["qiandaoItem"] = qiandaoItem

    local bgDown = fc.FScale9Image:createWithBatchUIFrame("batch_ui/chongzhianniukuang.png",cc.rect(10,0,2,99))
    bgDown:setSize(cc.size(350,110))
    bgDown:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(bgDown)
    bgDown:setPositionInContainer(cc.p(180,57))
    table_qiandaoItem["bgDown"] = bgDown

    local bgChongzhi = fc.FExtensionsImage:create()
    bgChongzhi:setImage("nobatch/chongzhianniu.png")
    bgChongzhi:setSize(cc.size(360,125))
    bgChongzhi:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(bgChongzhi)
    bgChongzhi:setPositionInContainer(cc.p(180,57.5))
    table_qiandaoItem["bgChongzhi"] = bgChongzhi

    local item1 = fc.FExtensionsImage:create()
    item1:setImage("batch_ui/chengpinzhi_kuang.png")
    item1:setSize(cc.size(80,80))
    item1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(item1)
    item1:setPositionInContainer(cc.p(54,49))
    table_qiandaoItem["item1"] = item1

    local it_name1 = fc.FLabel:createBMFont()
    it_name1:setSize(cc.size(60,25))
    it_name1:setAnchorPoint(cc.p(0.5,0.5))
    it_name1:setFontSize(16)
    it_name1:setString("教育点")
    it_name1:setColor(cc.c3b(0,255,255))
    qiandaoItem:appendComponent(it_name1)
    it_name1:setPositionInContainer(cc.p(54,94.5))
    table_qiandaoItem["it_name1"] = it_name1

    local label = fc.FExtensionsImage:create()
    label:setImage("batch_ui/yilingqu_huodong.png")
    label:setSize(cc.size(114,81))
    label:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(label)
    label:setPositionInContainer(cc.p(284,57.5))
    table_qiandaoItem["label"] = label

    local item2 = fc.FExtensionsImage:create()
    item2:setImage("batch_ui/chengpinzhi_kuang.png")
    item2:setSize(cc.size(80,80))
    item2:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(item2)
    item2:setPositionInContainer(cc.p(155,49))
    table_qiandaoItem["item2"] = item2

    local it_name2 = fc.FLabel:createBMFont()
    it_name2:setSize(cc.size(60,25))
    it_name2:setAnchorPoint(cc.p(0.5,0.5))
    it_name2:setFontSize(16)
    it_name2:setString("教育点")
    it_name2:setColor(cc.c3b(0,255,255))
    qiandaoItem:appendComponent(it_name2)
    it_name2:setPositionInContainer(cc.p(155,94.5))
    table_qiandaoItem["it_name2"] = it_name2

    local box = fc.FExtensionsImage:create()
    box:setImage("batch_ui/weiqiandaoanniu.png")
    box:setSize(cc.size(121,90))
    box:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(box)
    box:setPositionInContainer(cc.p(281.5,58))
    table_qiandaoItem["box"] = box

    local boxText = fc.FLabel:createBMFont()
    boxText:setSize(cc.size(60,25))
    boxText:setAnchorPoint(cc.p(0.5,0.5))
    boxText:setFontSize(21)
    boxText:setString("教育点")
    boxText:setColor(cc.c3b(255,255,0))
    qiandaoItem:appendComponent(boxText)
    boxText:setPositionInContainer(cc.p(288,73.5))
    table_qiandaoItem["boxText"] = boxText

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(130,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/teshuanniu.png")
    qiandaoItem:appendComponent(btn)
    btn:setPositionInContainer(cc.p(279,58.5))
    table_qiandaoItem["btn"] = btn

    local ling = fc.FShaderExtensionsImage:create(0)
    ling:setAnchorPoint(cc.p(0.5,0.5))
    ling:setImage("batch_ui/ling_uizi.png")
    ling:setSize(cc.size(32,32))
    btn:appendComponent(ling)
    ling:setPositionInContainer(cc.p(39,27))
    table_qiandaoItem["ling"] = ling

    local qu = fc.FShaderExtensionsImage:create(0)
    qu:setAnchorPoint(cc.p(0.5,0.5))
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    btn:appendComponent(qu)
    qu:setPositionInContainer(cc.p(87,27))
    table_qiandaoItem["qu"] = qu

    local chongzhiBtn = fc.FContainerPanel:create()
    chongzhiBtn:setSize(cc.size(100,100))
    chongzhiBtn:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(chongzhiBtn)
    chongzhiBtn:setPositionInContainer(cc.p(282,56))
    table_qiandaoItem["chongzhiBtn"] = chongzhiBtn

    local image1 = fc.FExtensionsImage:create()
    image1:setImage("batch_ui/chengpinzhi_kuang.png")
    image1:setSize(cc.size(70,70))
    image1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(image1)
    image1:setPositionInContainer(cc.p(54,49))
    table_qiandaoItem["image1"] = image1

    local number1 = fc.FLabel:createBMFont()
    number1:setSize(cc.size(60,25))
    number1:setAnchorPoint(cc.p(0.5,0.5))
    number1:setFontSize(14)
    number1:setString("教育点")
    number1:setColor(cc.c3b(0,255,255))
    qiandaoItem:appendComponent(number1)
    number1:setPositionInContainer(cc.p(57,75.5))
    table_qiandaoItem["number1"] = number1

    local image2 = fc.FExtensionsImage:create()
    image2:setImage("batch_ui/chengpinzhi_kuang.png")
    image2:setSize(cc.size(70,70))
    image2:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(image2)
    image2:setPositionInContainer(cc.p(155,49))
    table_qiandaoItem["image2"] = image2

    local number2 = fc.FLabel:createBMFont()
    number2:setSize(cc.size(60,25))
    number2:setAnchorPoint(cc.p(0.5,0.5))
    number2:setFontSize(14)
    number2:setString("教育点")
    number2:setColor(cc.c3b(0,255,255))
    qiandaoItem:appendComponent(number2)
    number2:setPositionInContainer(cc.p(158,75.5))
    table_qiandaoItem["number2"] = number2

    local piece1 = fc.FExtensionsImage:create()
    piece1:setImage("batch_ui/suipian_junjichu.png")
    piece1:setSize(cc.size(56,44))
    piece1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(piece1)
    piece1:setPositionInContainer(cc.p(79,55))
    table_qiandaoItem["piece1"] = piece1

    local piece2 = fc.FExtensionsImage:create()
    piece2:setImage("batch_ui/suipian_junjichu.png")
    piece2:setSize(cc.size(56,44))
    piece2:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(piece2)
    piece2:setPositionInContainer(cc.p(182,55))
    table_qiandaoItem["piece2"] = piece2

    local hunpo1 = fc.FExtensionsImage:create()
    hunpo1:setImage("batch_ui/hunpi_biaozhi.png")
    hunpo1:setSize(cc.size(33,48))
    hunpo1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(hunpo1)
    hunpo1:setPositionInContainer(cc.p(89.5,48))
    table_qiandaoItem["hunpo1"] = hunpo1

    local hunpo2 = fc.FExtensionsImage:create()
    hunpo2:setImage("batch_ui/hunpi_biaozhi.png")
    hunpo2:setSize(cc.size(33,48))
    hunpo2:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoItem:appendComponent(hunpo2)
    hunpo2:setPositionInContainer(cc.p(192.5,48))
    table_qiandaoItem["hunpo2"] = hunpo2

    return table_qiandaoItem

end

