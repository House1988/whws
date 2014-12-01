function createBox_item()

    local table_Box_item = {}

    local Box_item = fc.FContainerPanel:create()
    Box_item:setSize(cc.size(220,221))
    table_Box_item["Box_item"] = Box_item

    local sc_cz_card_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    sc_cz_card_bg1:setSize(cc.size(220,161))
    sc_cz_card_bg1:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(sc_cz_card_bg1)
    sc_cz_card_bg1:setPositionInContainer(cc.p(110,80.5))
    table_Box_item["sc_cz_card_bg1"] = sc_cz_card_bg1

    local sc_cz_card_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    sc_cz_card_bg:setSize(cc.size(220,65))
    sc_cz_card_bg:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(sc_cz_card_bg)
    sc_cz_card_bg:setPositionInContainer(cc.p(110,188.5))
    table_Box_item["sc_cz_card_bg"] = sc_cz_card_bg

    local sc_titleBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jibieditu1_huodong.png",cc.rect(2,0,3,46))
    sc_titleBg:setSize(cc.size(220,46))
    sc_titleBg:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(sc_titleBg)
    sc_titleBg:setPositionInContainer(cc.p(110,30))
    table_Box_item["sc_titleBg"] = sc_titleBg

    local title = fc.FLabel:createBMFont()
    title:setSize(cc.size(200,30))
    title:setAnchorPoint(cc.p(0.5,0.5))
    title:setFontSize(21)
    title:setString("300")
    title:setColor(cc.c3b(255,255,255))
    Box_item:appendComponent(title)
    title:setPositionInContainer(cc.p(100,24))
    table_Box_item["title"] = title

    local number = fc.FLabel:createBMFont()
    number:setSize(cc.size(100,30))
    number:setAnchorPoint(cc.p(0.5,0.5))
    number:setFontSize(21)
    number:setString("300")
    number:setColor(cc.c3b(255,0,0))
    Box_item:appendComponent(number)
    number:setPositionInContainer(cc.p(143,164))
    table_Box_item["number"] = number

    local textbg = fc.FExtensionsImage:create()
    textbg:setImage("batch_ui/shuruwenzi.png")
    textbg:setSize(cc.size(80,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(168,195))
    table_Box_item["textbg"] = textbg

    local price = fc.FLabel:createBMFont()
    price:setSize(cc.size(100,30))
    price:setAnchorPoint(cc.p(0.5,0.5))
    price:setFontSize(21)
    price:setString("300")
    price:setColor(cc.c3b(0,255,255))
    Box_item:appendComponent(price)
    price:setPositionInContainer(cc.p(168,192))
    table_Box_item["price"] = price

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao.png")
    yuanbao:setSize(cc.size(50,35))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(101,195.5))
    table_Box_item["yuanbao"] = yuanbao

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/xianshibaoxiang.png")
    image:setSize(cc.size(119,102))
    image:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(image)
    image:setPositionInContainer(cc.p(109.5,103))
    table_Box_item["image"] = image

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/xiebiao.png")
    frame:setSize(cc.size(78,64))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(frame)
    frame:setPositionInContainer(cc.p(42,187))
    table_Box_item["frame"] = frame

    local left = fc.FLabel:createBMFont()
    left:setSize(cc.size(95.88808,87.26009))
    left:setAnchorPoint(cc.p(0.5,0.5))
    left:setFontSize(18)
    left:setString("300")
    left:setColor(cc.c3b(255,255,255))
    Box_item:appendComponent(left)
    left:setPositionInContainer(cc.p(27.9,186.6))
    table_Box_item["left"] = left

    local kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    kuang:setSize(cc.size(220,221))
    kuang:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(kuang)
    kuang:setPositionInContainer(cc.p(110,110.5))
    table_Box_item["kuang"] = kuang

    local blackmask = fc.FScale9Image:createWithBatchUIFrame("batch_ui/blackBG.png",cc.rect(1,1,2,2))
    blackmask:setSize(cc.size(220,221))
    blackmask:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(blackmask)
    blackmask:setPositionInContainer(cc.p(110,110.5))
    table_Box_item["blackmask"] = blackmask

    local shouwan = fc.FExtensionsImage:create()
    shouwan:setImage("batch_ui/yishouwan.png")
    shouwan:setSize(cc.size(130,58))
    shouwan:setRotation(330)
    shouwan:setAnchorPoint(cc.p(0.5,0.5))
    Box_item:appendComponent(shouwan)
    shouwan:setPositionInContainer(cc.p(148.8,163.6))
    table_Box_item["shouwan"] = shouwan

    return table_Box_item

end

