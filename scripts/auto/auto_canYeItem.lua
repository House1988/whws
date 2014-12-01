function createcanYeItem()

    local table_canYeItem = {}

    local canYeItem = fc.FContainerPanel:create()
    canYeItem:setSize(cc.size(104,150))
    table_canYeItem["canYeItem"] = canYeItem

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    canYeItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(52,60))
    table_canYeItem["frame"] = frame

    local icon = fc.FExtensionsImage:create()
    icon:setAnchorPoint(cc.p(0.5,0.5))
    canYeItem:appendComponent(icon)
    icon:setPositionInContainer(cc.p(52,60))
    table_canYeItem["icon"] = icon

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(80,30))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("军令：")
    name:setColor(cc.c3b(125, 1, 1))
    canYeItem:appendComponent(name)
    name:setPositionInContainer(cc.p(52,124))
    table_canYeItem["name"] = name

    local hightlight = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    hightlight:setSize(cc.size(110,110))
    hightlight:setAnchorPoint(cc.p(0.5,0.5))
    canYeItem:appendComponent(hightlight)
    hightlight:setPositionInContainer(cc.p(51,59))
    table_canYeItem["hightlight"] = hightlight

    return table_canYeItem

end

