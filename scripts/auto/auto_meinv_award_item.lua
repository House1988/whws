function createmeinv_award_item()

    local table_meinv_award_item = {}

    local meinv_award_item = fc.FContainerPanel:create()
    meinv_award_item:setSize(cc.size(128,140))
    table_meinv_award_item["meinv_award_item"] = meinv_award_item

    local mi_item_bg = fc.FShaderExtensionsImage:create(0)
    mi_item_bg:setAnchorPoint(cc.p(0.5,0.5))
    mi_item_bg:setImage("batch_ui/chengpinzhi_kuang.png")
    mi_item_bg:setSize(cc.size(80,80))
    meinv_award_item:appendComponent(mi_item_bg)
    mi_item_bg:setPositionInContainer(cc.p(64,48))
    table_meinv_award_item["mi_item_bg"] = mi_item_bg

    local mi_item_image = fc.FShaderExtensionsImage:create(0)
    mi_item_image:setAnchorPoint(cc.p(0.5,0.5))
    mi_item_image:setImage("item/feicuixianglian.png")
    mi_item_image:setSize(cc.size(70,70))
    meinv_award_item:appendComponent(mi_item_image)
    mi_item_image:setPositionInContainer(cc.p(64,48))
    table_meinv_award_item["mi_item_image"] = mi_item_image

    local mi_count_lbl = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    mi_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mi_count_lbl:setSize(cc.size(80,20))
    mi_count_lbl:setAlignment(2)
    mi_count_lbl:setScale(0.45)
    meinv_award_item:appendComponent(mi_count_lbl)
    mi_count_lbl:setPositionInContainer(cc.p(81,76))
    table_meinv_award_item["mi_count_lbl"] = mi_count_lbl

    local mi_name_bg = fc.FExtensionsImage:create()
    mi_name_bg:setImage("batch_ui/shangci_sekuai.png")
    mi_name_bg:setSize(cc.size(90,25))
    mi_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_item:appendComponent(mi_name_bg)
    mi_name_bg:setPositionInContainer(cc.p(64,101.5))
    table_meinv_award_item["mi_name_bg"] = mi_name_bg

    local mi_name_lbl = fc.FLabel:createBMFont()
    mi_name_lbl:setSize(cc.size(70,25))
    mi_name_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mi_name_lbl:setFontSize(21)
    mi_name_lbl:setString("夜明珠")
    mi_name_lbl:setColor(cc.c3b(63,12,11))
    meinv_award_item:appendComponent(mi_name_lbl)
    mi_name_lbl:setPositionInContainer(cc.p(64,96.5))
    table_meinv_award_item["mi_name_lbl"] = mi_name_lbl

    local mi_title = fc.FLabel:createBMFont()
    mi_title:setSize(cc.size(70,25))
    mi_title:setAnchorPoint(cc.p(0.5,0.5))
    mi_title:setFontSize(21)
    mi_title:setString("兴趣点")
    mi_title:setColor(cc.c3b(63,12,11))
    meinv_award_item:appendComponent(mi_title)
    mi_title:setPositionInContainer(cc.p(42,124.5))
    table_meinv_award_item["mi_title"] = mi_title

    local mi_add_value_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    mi_add_value_bg:setSize(cc.size(45,24))
    mi_add_value_bg:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_item:appendComponent(mi_add_value_bg)
    mi_add_value_bg:setPositionInContainer(cc.p(96.5,128))
    table_meinv_award_item["mi_add_value_bg"] = mi_add_value_bg

    local mi_add_value_lbl = fc.FLabel:createBMFont()
    mi_add_value_lbl:setSize(cc.size(50,25))
    mi_add_value_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mi_add_value_lbl:setFontSize(21)
    mi_add_value_lbl:setString("99")
    mi_add_value_lbl:setColor(cc.c3b(135,255,247))
    meinv_award_item:appendComponent(mi_add_value_lbl)
    mi_add_value_lbl:setPositionInContainer(cc.p(101,124.5))
    table_meinv_award_item["mi_add_value_lbl"] = mi_add_value_lbl

    local clickBtn = fc.FContainerPanel:create()
    clickBtn:setSize(cc.size(80,80))
    clickBtn:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_item:appendComponent(clickBtn)
    clickBtn:setPositionInContainer(cc.p(64,48))
    table_meinv_award_item["clickBtn"] = clickBtn

    return table_meinv_award_item

end

