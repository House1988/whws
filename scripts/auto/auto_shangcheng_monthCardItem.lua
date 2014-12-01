function createshangcheng_monthCardItem()

    local table_shangcheng_monthCardItem = {}

    local shangcheng_monthCardItem = fc.FContainerPanel:create()
    shangcheng_monthCardItem:setSize(cc.size(126,100))
    table_shangcheng_monthCardItem["shangcheng_monthCardItem"] = shangcheng_monthCardItem

    local scm_quality_bg = fc.FExtensionsImage:create()
    scm_quality_bg:setImage("batch_ui/baipinzhi_kuang.png")
    scm_quality_bg:setSize(cc.size(72,72))
    scm_quality_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_monthCardItem:appendComponent(scm_quality_bg)
    scm_quality_bg:setPositionInContainer(cc.p(63,36))
    table_shangcheng_monthCardItem["scm_quality_bg"] = scm_quality_bg

    local scm_name_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(20,10,3,10))
    scm_name_bg:setSize(cc.size(122,24))
    scm_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_monthCardItem:appendComponent(scm_name_bg)
    scm_name_bg:setPositionInContainer(cc.p(61,88))
    table_shangcheng_monthCardItem["scm_name_bg"] = scm_name_bg

    local scm_img = fc.FExtensionsImage:create()
    scm_img:setImage("batch_ui/baipinzhi_kuang.png")
    scm_img:setSize(cc.size(62,62))
    scm_img:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_monthCardItem:appendComponent(scm_img)
    scm_img:setPositionInContainer(cc.p(63,36))
    table_shangcheng_monthCardItem["scm_img"] = scm_img

    local scm_count_lbl = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    scm_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    scm_count_lbl:setSize(cc.size(62,24))
    scm_count_lbl:setAlignment(2)
    scm_count_lbl:setScale(0.45)
    shangcheng_monthCardItem:appendComponent(scm_count_lbl)
    scm_count_lbl:setPositionInContainer(cc.p(81,60))
    table_shangcheng_monthCardItem["scm_count_lbl"] = scm_count_lbl

    local scm_name_lbl = fc.FLabel:createBMFont()
    scm_name_lbl:setSize(cc.size(126,24))
    scm_name_lbl:setAnchorPoint(cc.p(0.5,0.5))
    scm_name_lbl:setFontSize(21)
    scm_name_lbl:setString("9999")
    scm_name_lbl:setColor(cc.c3b(0,255,255))
    shangcheng_monthCardItem:appendComponent(scm_name_lbl)
    scm_name_lbl:setPositionInContainer(cc.p(61,84))
    table_shangcheng_monthCardItem["scm_name_lbl"] = scm_name_lbl

    return table_shangcheng_monthCardItem

end

