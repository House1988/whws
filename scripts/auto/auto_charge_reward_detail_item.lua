function createcharge_reward_detail_item()

    local table_charge_reward_detail_item = {}

    local charge_reward_detail_item = fc.FContainerPanel:create()
    charge_reward_detail_item:setSize(cc.size(104,150))
    table_charge_reward_detail_item["charge_reward_detail_item"] = charge_reward_detail_item

    local cri_item_bg = fc.FExtensionsImage:create()
    cri_item_bg:setImage("batch_ui/lvpinzhi_kuang.png")
    cri_item_bg:setSize(cc.size(104,104))
    cri_item_bg:setAnchorPoint(cc.p(0.5,0.5))
    charge_reward_detail_item:appendComponent(cri_item_bg)
    cri_item_bg:setPositionInContainer(cc.p(52,52))
    table_charge_reward_detail_item["cri_item_bg"] = cri_item_bg

    local cri_item_image = fc.FExtensionsImage:create()
    cri_item_image:setImage("batch_ui/libao_zhandoujiangli.png")
    cri_item_image:setSize(cc.size(92,92))
    cri_item_image:setAnchorPoint(cc.p(0.5,0.5))
    charge_reward_detail_item:appendComponent(cri_item_image)
    cri_item_image:setPositionInContainer(cc.p(52,52))
    table_charge_reward_detail_item["cri_item_image"] = cri_item_image

    local cri_count_lbl = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    cri_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    cri_count_lbl:setSize(cc.size(80,20))
    cri_count_lbl:setAlignment(2)
    cri_count_lbl:setScale(0.45)
    charge_reward_detail_item:appendComponent(cri_count_lbl)
    cri_count_lbl:setPositionInContainer(cc.p(75,90))
    table_charge_reward_detail_item["cri_count_lbl"] = cri_count_lbl

    local cri_name_bg = fc.FExtensionsImage:create()
    cri_name_bg:setImage("batch_ui/shangci_sekuai.png")
    cri_name_bg:setSize(cc.size(90,25))
    cri_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    charge_reward_detail_item:appendComponent(cri_name_bg)
    cri_name_bg:setPositionInContainer(cc.p(52,135.5))
    table_charge_reward_detail_item["cri_name_bg"] = cri_name_bg

    local cri_name_lbl = fc.FLabel:createBMFont()
    cri_name_lbl:setSize(cc.size(100,25))
    cri_name_lbl:setAnchorPoint(cc.p(0.5,0.5))
    cri_name_lbl:setFontSize(21)
    cri_name_lbl:setString("夜明珠")
    cri_name_lbl:setColor(cc.c3b(63,12,11))
    charge_reward_detail_item:appendComponent(cri_name_lbl)
    cri_name_lbl:setPositionInContainer(cc.p(52,130.5))
    table_charge_reward_detail_item["cri_name_lbl"] = cri_name_lbl

    return table_charge_reward_detail_item

end

