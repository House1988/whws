function createmingchenZuhe_item()

    local table_mingchenZuhe_item = {}

    local mingchenZuhe_item = fc.FContainerPanel:create()
    mingchenZuhe_item:setSize(cc.size(540,60))
    table_mingchenZuhe_item["mingchenZuhe_item"] = mingchenZuhe_item

    local item_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    item_bg:setSize(cc.size(540,60))
    item_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenZuhe_item:appendComponent(item_bg)
    item_bg:setPositionInContainer(cc.p(270,30))
    table_mingchenZuhe_item["item_bg"] = item_bg

    local item_diactive_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang2.png",cc.rect(25,25,4,4))
    item_diactive_bg:setSize(cc.size(540,60))
    item_diactive_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenZuhe_item:appendComponent(item_diactive_bg)
    item_diactive_bg:setPositionInContainer(cc.p(270,30))
    table_mingchenZuhe_item["item_diactive_bg"] = item_diactive_bg

    local item_label = fc.FLabel:createBMFont()
    item_label:setSize(cc.size(510,55))
    item_label:setWidth(510)
    item_label:setAnchorPoint(cc.p(0.5,0.5))
    item_label:setFontSize(20)
    item_label:setString("经验：")
    item_label:setColor(cc.c3b(91,24,6))
    mingchenZuhe_item:appendComponent(item_label)
    item_label:setPositionInContainer(cc.p(286,27.5))
    table_mingchenZuhe_item["item_label"] = item_label

    return table_mingchenZuhe_item

end

