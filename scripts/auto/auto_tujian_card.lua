function createtujian_card()

    local table_tujian_card = {}

    local tujian_card = fc.FContainerPanel:create()
    tujian_card:setSize(cc.size(124,136))
    table_tujian_card["tujian_card"] = tujian_card

    local tjc_item_bg = fc.FExtensionsImage:create()
    tjc_item_bg:setImage("batch_ui/chengpinzhi_kuang.png")
    tjc_item_bg:setSize(cc.size(104,104))
    tjc_item_bg:setAnchorPoint(cc.p(0.5,0.5))
    tujian_card:appendComponent(tjc_item_bg)
    tjc_item_bg:setPositionInContainer(cc.p(62,52))
    table_tujian_card["tjc_item_bg"] = tjc_item_bg

    local tjc_item_image = fc.FShaderExtensionsImage:create(0)
    tjc_item_image:setAnchorPoint(cc.p(0.5,0.5))
    tjc_item_image:setImage("item/feicuixianglian.png")
    tjc_item_image:setSize(cc.size(90,90))
    tujian_card:appendComponent(tjc_item_image)
    tjc_item_image:setPositionInContainer(cc.p(62,52))
    table_tujian_card["tjc_item_image"] = tjc_item_image

    local tjc_name_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    tjc_name_bg:setSize(cc.size(124,25))
    tjc_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    tujian_card:appendComponent(tjc_name_bg)
    tjc_name_bg:setPositionInContainer(cc.p(62,123.5))
    table_tujian_card["tjc_name_bg"] = tjc_name_bg

    local tjc_name_lbl = fc.FLabel:createBMFont()
    tjc_name_lbl:setSize(cc.size(124,25))
    tjc_name_lbl:setAnchorPoint(cc.p(0.5,0.5))
    tjc_name_lbl:setFontSize(21)
    tjc_name_lbl:setString("夜明珠")
    tjc_name_lbl:setColor(cc.c3b(0,255,255))
    tujian_card:appendComponent(tjc_name_lbl)
    tjc_name_lbl:setPositionInContainer(cc.p(62,120.5))
    table_tujian_card["tjc_name_lbl"] = tjc_name_lbl

    local btn = fc.FContainerPanel:create()
    btn:setSize(cc.size(104,104))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    tujian_card:appendComponent(btn)
    btn:setPositionInContainer(cc.p(62,52))
    table_tujian_card["btn"] = btn

    return table_tujian_card

end

