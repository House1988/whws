function createsuipianItem()

    local table_suipianItem = {}

    local suipianItem = fc.FContainerPanel:create()
    suipianItem:setSize(cc.size(195,248))
    table_suipianItem["suipianItem"] = suipianItem

    local bg = fc.FExtensionsImage:create()
    bg:setImage("nobatch/touxiangtongyongdikuang.png")
    bg:setSize(cc.size(156,231))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(bg)
    bg:setPositionInContainer(cc.p(98,123.5))
    table_suipianItem["bg"] = bg

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(98,98))
    table_suipianItem["frame"] = frame

    local image = fc.FExtensionsImage:create()
    image:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(image)
    image:setPositionInContainer(cc.p(98,98))
    table_suipianItem["image"] = image

    local nameBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    nameBg:setSize(cc.size(155,28))
    nameBg:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(nameBg)
    nameBg:setPositionInContainer(cc.p(97.5,24))
    table_suipianItem["nameBg"] = nameBg

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(100,30))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("名字五个字")
    name:setColor(cc.c3b(106,68,19))
    suipianItem:appendComponent(name)
    name:setPositionInContainer(cc.p(98,22))
    table_suipianItem["name"] = name

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,24))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(star1)
    star1:setPositionInContainer(cc.p(43.5,165))
    table_suipianItem["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(star2)
    star2:setPositionInContainer(cc.p(71.5,166.5))
    table_suipianItem["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(star3)
    star3:setPositionInContainer(cc.p(99.5,166.5))
    table_suipianItem["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(star4)
    star4:setPositionInContainer(cc.p(126.5,166.5))
    table_suipianItem["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(star5)
    star5:setPositionInContainer(cc.p(154.5,166.5))
    table_suipianItem["star5"] = star5

    local number = fc.FLabel:createBMFont()
    number:setSize(cc.size(100,30))
    number:setAnchorPoint(cc.p(0.5,0.5))
    number:setFontSize(20)
    number:setString("名字五个字")
    number:setColor(cc.c3b(106,68,19))
    suipianItem:appendComponent(number)
    number:setPositionInContainer(cc.p(128,190))
    table_suipianItem["number"] = number

    local cost = fc.FLabel:createBMFont()
    cost:setSize(cc.size(100,30))
    cost:setAnchorPoint(cc.p(0.5,0.5))
    cost:setFontSize(20)
    cost:setString("名字五个字")
    cost:setColor(cc.c3b(106,68,19))
    suipianItem:appendComponent(cost)
    cost:setPositionInContainer(cc.p(161,217))
    table_suipianItem["cost"] = cost

    local suipianIcon = fc.FExtensionsImage:create()
    suipianIcon:setImage("batch_ui/hunpi_biaozhi.png")
    suipianIcon:setSize(cc.size(42,61))
    suipianIcon:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(suipianIcon)
    suipianIcon:setPositionInContainer(cc.p(148,123.5))
    table_suipianItem["suipianIcon"] = suipianIcon

    local shuliang = fc.FLabel:createBMFont()
    shuliang:setSize(cc.size(50,30))
    shuliang:setAnchorPoint(cc.p(0.5,0.5))
    shuliang:setFontSize(20)
    shuliang:setString("数量：")
    shuliang:setColor(cc.c3b(106,68,19))
    suipianItem:appendComponent(shuliang)
    shuliang:setPositionInContainer(cc.p(53,190))
    table_suipianItem["shuliang"] = shuliang

    local xiaohao = fc.FLabel:createBMFont()
    xiaohao:setSize(cc.size(50,30))
    xiaohao:setAnchorPoint(cc.p(0.5,0.5))
    xiaohao:setFontSize(20)
    xiaohao:setString("消耗：")
    xiaohao:setColor(cc.c3b(106,68,19))
    suipianItem:appendComponent(xiaohao)
    xiaohao:setPositionInContainer(cc.p(53,217))
    table_suipianItem["xiaohao"] = xiaohao

    local yinliang = fc.FExtensionsImage:create()
    yinliang:setImage("batch_ui/yinliang_tubiao.png")
    yinliang:setSize(cc.size(29,24))
    yinliang:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(yinliang)
    yinliang:setPositionInContainer(cc.p(94.5,222))
    table_suipianItem["yinliang"] = yinliang

    local outLine = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    outLine:setSize(cc.size(156,231))
    outLine:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(outLine)
    outLine:setPositionInContainer(cc.p(98,123.5))
    table_suipianItem["outLine"] = outLine

    local highLight = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    highLight:setSize(cc.size(175,250))
    highLight:setAnchorPoint(cc.p(0.5,0.5))
    suipianItem:appendComponent(highLight)
    highLight:setPositionInContainer(cc.p(97.5,123))
    table_suipianItem["highLight"] = highLight

    return table_suipianItem

end

