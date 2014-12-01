function createopen_service_gift_item()

    local table_open_service_gift_item = {}

    local open_service_gift_item = fc.FContainerPanel:create()
    open_service_gift_item:setSize(cc.size(100,113))
    table_open_service_gift_item["open_service_gift_item"] = open_service_gift_item

    local oi_item_bg = fc.FExtensionsImage:create()
    oi_item_bg:setImage("batch_ui/chengpinzhi_kuang.png")
    oi_item_bg:setSize(cc.size(80,80))
    oi_item_bg:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift_item:appendComponent(oi_item_bg)
    oi_item_bg:setPositionInContainer(cc.p(50,42))
    table_open_service_gift_item["oi_item_bg"] = oi_item_bg

    local oi_item_image = fc.FExtensionsImage:create()
    oi_item_image:setImage("item/feicuixianglian.png")
    oi_item_image:setSize(cc.size(70,70))
    oi_item_image:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift_item:appendComponent(oi_item_image)
    oi_item_image:setPositionInContainer(cc.p(50,42))
    table_open_service_gift_item["oi_item_image"] = oi_item_image

    local oi_name_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    oi_name_bg:setSize(cc.size(106,25))
    oi_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift_item:appendComponent(oi_name_bg)
    oi_name_bg:setPositionInContainer(cc.p(50,100.5))
    table_open_service_gift_item["oi_name_bg"] = oi_name_bg

    local oi_name_lbl = fc.FLabel:createBMFont()
    oi_name_lbl:setSize(cc.size(100,25))
    oi_name_lbl:setAnchorPoint(cc.p(0.5,0.5))
    oi_name_lbl:setFontSize(21)
    oi_name_lbl:setString("夜明珠")
    oi_name_lbl:setColor(cc.c3b(0,255,255))
    open_service_gift_item:appendComponent(oi_name_lbl)
    oi_name_lbl:setPositionInContainer(cc.p(50,96.5))
    table_open_service_gift_item["oi_name_lbl"] = oi_name_lbl

    local oi_count_lbl = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    oi_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    oi_count_lbl:setSize(cc.size(80,20))
    oi_count_lbl:setAlignment(2)
    oi_count_lbl:setScale(0.45)
    open_service_gift_item:appendComponent(oi_count_lbl)
    oi_count_lbl:setPositionInContainer(cc.p(68,71))
    table_open_service_gift_item["oi_count_lbl"] = oi_count_lbl

    return table_open_service_gift_item

end

