function createlianhuaItem()

    local table_lianhuaItem = {}

    local lianhuaItem = fc.FContainerPanel:create()
    lianhuaItem:setSize(cc.size(94,125))
    table_lianhuaItem["lianhuaItem"] = lianhuaItem

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(90,90))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(47,45))
    table_lianhuaItem["frame"] = frame

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(94,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaItem:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(47,110))
    table_lianhuaItem["textbg"] = textbg

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(94,20))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(18)
    name:setString("")
    name:setColor(cc.c3b(0,255,255))
    lianhuaItem:appendComponent(name)
    name:setPositionInContainer(cc.p(47,106))
    table_lianhuaItem["name"] = name

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/baipinzhi_kuang.png")
    image:setSize(cc.size(80,80))
    image:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaItem:appendComponent(image)
    image:setPositionInContainer(cc.p(47,45))
    table_lianhuaItem["image"] = image

    local levelbg = fc.FExtensionsImage:create()
    levelbg:setImage("batch_ui/tubiaokuang2_bai.png")
    levelbg:setSize(cc.size(25,28))
    levelbg:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaItem:appendComponent(levelbg)
    levelbg:setPositionInContainer(cc.p(76.5,72))
    table_lianhuaItem["levelbg"] = levelbg

    local level = fc.FLabel:createBMFont()
    level:setSize(cc.size(50,20))
    level:setAnchorPoint(cc.p(0.5,0.5))
    level:setFontSize(18)
    level:setString("")
    level:setColor(cc.c3b(0,255,255))
    lianhuaItem:appendComponent(level)
    level:setPositionInContainer(cc.p(60,71))
    table_lianhuaItem["level"] = level

    local btn = fc.FContainerPanel:create()
    btn:setSize(cc.size(80,80))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaItem:appendComponent(btn)
    btn:setPositionInContainer(cc.p(47,45))
    table_lianhuaItem["btn"] = btn

    return table_lianhuaItem

end

