function createvip_pac_item()

    local table_vip_pac_item = {}

    local vip_pac_item = fc.FContainerPanel:create()
    vip_pac_item:setSize(cc.size(104,140))
    table_vip_pac_item["vip_pac_item"] = vip_pac_item

    local vip_pac_item_quality = fc.FExtensionsImage:create()
    vip_pac_item_quality:setImage("batch_ui/baipinzhi_kuang.png")
    vip_pac_item_quality:setSize(cc.size(104,104))
    vip_pac_item_quality:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_item:appendComponent(vip_pac_item_quality)
    vip_pac_item_quality:setPositionInContainer(cc.p(52,52))
    table_vip_pac_item["vip_pac_item_quality"] = vip_pac_item_quality

    local vip_pac_item_image = fc.FExtensionsImage:create()
    vip_pac_item_image:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_item:appendComponent(vip_pac_item_image)
    vip_pac_item_image:setPositionInContainer(cc.p(52,52))
    table_vip_pac_item["vip_pac_item_image"] = vip_pac_item_image

    local vip_animlabel = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    vip_animlabel:setAnchorPoint(cc.p(0.5,0.5))
    vip_animlabel:setSize(cc.size(60,28))
    vip_animlabel:setScale(0.6)
    vip_pac_item:appendComponent(vip_animlabel)
    vip_animlabel:setPositionInContainer(cc.p(67,83))
    table_vip_pac_item["vip_animlabel"] = vip_animlabel

    local vip_name_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    vip_name_di:setSize(cc.size(100,30))
    vip_name_di:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_item:appendComponent(vip_name_di)
    vip_name_di:setPositionInContainer(cc.p(52,123))
    table_vip_pac_item["vip_name_di"] = vip_name_di

    local vip_name = fc.FLabel:createBMFont()
    vip_name:setSize(cc.size(90,30))
    vip_name:setAnchorPoint(cc.p(0.5,0.5))
    vip_name:setFontSize(20)
    vip_name:setString("银两")
    vip_name:setColor(cc.c3b(91,24,6))
    vip_pac_item:appendComponent(vip_name)
    vip_name:setPositionInContainer(cc.p(51,122))
    table_vip_pac_item["vip_name"] = vip_name

    return table_vip_pac_item

end

