function createxunfangRewardDetialItem()

    local table_xunfangRewardDetialItem = {}

    local xunfangRewardDetialItem = fc.FContainerPanel:create()
    xunfangRewardDetialItem:setSize(cc.size(90,110))
    table_xunfangRewardDetialItem["xunfangRewardDetialItem"] = xunfangRewardDetialItem

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(75,75))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    xunfangRewardDetialItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(45.5,37.5))
    table_xunfangRewardDetialItem["frame"] = frame

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/baipinzhi_kuang.png")
    image:setSize(cc.size(65,65))
    image:setAnchorPoint(cc.p(0.5,0.5))
    xunfangRewardDetialItem:appendComponent(image)
    image:setPositionInContainer(cc.p(44.5,37.5))
    table_xunfangRewardDetialItem["image"] = image

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(90,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfangRewardDetialItem:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(45,90.5))
    table_xunfangRewardDetialItem["textBg"] = textBg

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(70,25))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(15
)
    name:setString("")
    name:setColor(cc.c3b(255,255,255))
    xunfangRewardDetialItem:appendComponent(name)
    name:setPositionInContainer(cc.p(45,86.5))
    table_xunfangRewardDetialItem["name"] = name

    return table_xunfangRewardDetialItem

end

