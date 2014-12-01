function creategonggaoItem()

    local table_gonggaoItem = {}

    local gonggaoItem = fc.FContainerPanel:create()
    gonggaoItem:setSize(cc.size(200,70))
    table_gonggaoItem["gonggaoItem"] = gonggaoItem

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(2,2,3,3))
    bg:setSize(cc.size(200,70))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    gonggaoItem:appendComponent(bg)
    bg:setPositionInContainer(cc.p(100,35))
    table_gonggaoItem["bg"] = bg

    local bgdark = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    bgdark:setSize(cc.size(200,68))
    bgdark:setAnchorPoint(cc.p(0.5,0.5))
    gonggaoItem:appendComponent(bgdark)
    bgdark:setPositionInContainer(cc.p(100,35))
    table_gonggaoItem["bgdark"] = bgdark

    local new_label = fc.FContainerPanel:create()
    new_label:setSize(cc.size(60,55))
    new_label:setAnchorPoint(cc.p(0.5,0.5))
    gonggaoItem:appendComponent(new_label)
    new_label:setPositionInContainer(cc.p(30,27.5))
    table_gonggaoItem["new_label"] = new_label

    local conner = fc.FExtensionsImage:create()
    conner:setImage("batch_ui/jibieditu_huodong.png")
    conner:setSize(cc.size(60,55))
    conner:setAnchorPoint(cc.p(0.5,0.5))
    new_label:appendComponent(conner)
    conner:setPositionInContainer(cc.p(30,27.5))
    table_gonggaoItem["conner"] = conner

    local new = fc.FExtensionsImage:create()
    new:setImage("batch_ui/new.png")
    new:setSize(cc.size(30,29))
    new:setAnchorPoint(cc.p(0.5,0.5))
    new_label:appendComponent(new)
    new:setPositionInContainer(cc.p(17,16.5))
    table_gonggaoItem["new"] = new

    local text = fc.FLabel:createSystemFont()
    text:setSize(cc.size(130,30))
    text:setWidth(130)
    text:setAnchorPoint(cc.p(0.5,0.5))
    text:setFontSize(21)
    text:setString("aaaaaaaa")
    text:setColor(cc.c3b(91,24,6))
    gonggaoItem:appendComponent(text)
    text:setPositionInContainer(cc.p(121,31))
    table_gonggaoItem["text"] = text

    return table_gonggaoItem

end

