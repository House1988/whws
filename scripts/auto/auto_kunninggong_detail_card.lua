function createkunninggong_detail_card()

    local table_kunninggong_detail_card = {}

    local kunninggong_detail_card = fc.FContainerPanel:create()
    kunninggong_detail_card:setSize(cc.size(165,235))
    table_kunninggong_detail_card["kunninggong_detail_card"] = kunninggong_detail_card

    local kng_card_bg_image = fc.FExtensionsImage:create()
    kng_card_bg_image:setImage("nobatch/touxiangdikuang_meinv1.png")
    kng_card_bg_image:setSize(cc.size(140,150))
    kng_card_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_bg_image)
    kng_card_bg_image:setPositionInContainer(cc.p(80,120))
    table_kunninggong_detail_card["kng_card_bg_image"] = kng_card_bg_image

    local kng_card_touxiangkuang_image = fc.FExtensionsImage:create()
    kng_card_touxiangkuang_image:setImage("batch_ui/baipinzhi_kuang.png")
    kng_card_touxiangkuang_image:setSize(cc.size(104,104))
    kng_card_touxiangkuang_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_touxiangkuang_image)
    kng_card_touxiangkuang_image:setPositionInContainer(cc.p(80,104))
    table_kunninggong_detail_card["kng_card_touxiangkuang_image"] = kng_card_touxiangkuang_image

    local kng_card_touxiang_image = fc.FExtensionsImage:create()
    kng_card_touxiang_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_touxiang_image)
    kng_card_touxiang_image:setPositionInContainer(cc.p(80,104))
    table_kunninggong_detail_card["kng_card_touxiang_image"] = kng_card_touxiang_image

    local down_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    down_bar:setSize(cc.size(140,35))
    down_bar:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(down_bar)
    down_bar:setPositionInContainer(cc.p(80,204.5))
    table_kunninggong_detail_card["down_bar"] = down_bar

    local up_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    up_bar:setSize(cc.size(140,35))
    up_bar:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(up_bar)
    up_bar:setPositionInContainer(cc.p(81,27.5))
    table_kunninggong_detail_card["up_bar"] = up_bar

    local xing_di = fc.FExtensionsImage:create()
    xing_di:setImage("batch_ui/xingxingdiwen.png")
    xing_di:setSize(cc.size(140,26))
    xing_di:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(xing_di)
    xing_di:setPositionInContainer(cc.p(80,172))
    table_kunninggong_detail_card["xing_di"] = xing_di

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(29.5,171.5))
    table_kunninggong_detail_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(53.5,171.5))
    table_kunninggong_detail_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(79.5,171.5))
    table_kunninggong_detail_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(129.5,171.5))
    table_kunninggong_detail_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(103.5,171.5))
    table_kunninggong_detail_card["star_dark"] = star_dark

    local kng_card_lv_label = fc.FLabel:createBMFont()
    kng_card_lv_label:setSize(cc.size(80,30))
    kng_card_lv_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_card_lv_label:setFontSize(21)
    kng_card_lv_label:setString("LV15")
    kng_card_lv_label:setColor(cc.c3b(137,32,18))
    kunninggong_detail_card:appendComponent(kng_card_lv_label)
    kng_card_lv_label:setPositionInContainer(cc.p(80,201))
    table_kunninggong_detail_card["kng_card_lv_label"] = kng_card_lv_label

    local kng_card_name_label = fc.FLabel:createBMFont()
    kng_card_name_label:setSize(cc.size(110,30))
    kng_card_name_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_card_name_label:setFontSize(20)
    kng_card_name_label:setString("步兵步兵步")
    kng_card_name_label:setColor(cc.c3b(137,32,18))
    kunninggong_detail_card:appendComponent(kng_card_name_label)
    kng_card_name_label:setPositionInContainer(cc.p(80,28))
    table_kunninggong_detail_card["kng_card_name_label"] = kng_card_name_label

    local kng_card_star2_image = fc.FExtensionsImage:create()
    kng_card_star2_image:setImage("batch_ui/xingxing.png")
    kng_card_star2_image:setSize(cc.size(25,27))
    kng_card_star2_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_star2_image)
    kng_card_star2_image:setPositionInContainer(cc.p(54.5,171.5))
    table_kunninggong_detail_card["kng_card_star2_image"] = kng_card_star2_image

    local kng_card_star3_image = fc.FExtensionsImage:create()
    kng_card_star3_image:setImage("batch_ui/xingxing.png")
    kng_card_star3_image:setSize(cc.size(25,27))
    kng_card_star3_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_star3_image)
    kng_card_star3_image:setPositionInContainer(cc.p(79.5,171.5))
    table_kunninggong_detail_card["kng_card_star3_image"] = kng_card_star3_image

    local kng_card_star4_image = fc.FExtensionsImage:create()
    kng_card_star4_image:setImage("batch_ui/xingxing.png")
    kng_card_star4_image:setSize(cc.size(25,27))
    kng_card_star4_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_star4_image)
    kng_card_star4_image:setPositionInContainer(cc.p(104.5,171.5))
    table_kunninggong_detail_card["kng_card_star4_image"] = kng_card_star4_image

    local kng_card_star5_image = fc.FExtensionsImage:create()
    kng_card_star5_image:setImage("batch_ui/xingxing.png")
    kng_card_star5_image:setSize(cc.size(25,27))
    kng_card_star5_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_star5_image)
    kng_card_star5_image:setPositionInContainer(cc.p(129.5,171.5))
    table_kunninggong_detail_card["kng_card_star5_image"] = kng_card_star5_image

    local kng_card_star1_image = fc.FExtensionsImage:create()
    kng_card_star1_image:setImage("batch_ui/xingxing.png")
    kng_card_star1_image:setSize(cc.size(25,27))
    kng_card_star1_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_star1_image)
    kng_card_star1_image:setPositionInContainer(cc.p(29.5,171.5))
    table_kunninggong_detail_card["kng_card_star1_image"] = kng_card_star1_image

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/touxiangdikuang_meinv2.png",cc.rect(53,54,5,2))
    card_rect:setSize(cc.size(155,230))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(80.5,116))
    table_kunninggong_detail_card["card_rect"] = card_rect

    local kng_card_shanguang_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/xuanzhongkuang_meinv.png",cc.rect(60,60,2,2))
    kng_card_shanguang_image:setSize(cc.size(168,232))
    kng_card_shanguang_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail_card:appendComponent(kng_card_shanguang_image)
    kng_card_shanguang_image:setPositionInContainer(cc.p(81,116))
    table_kunninggong_detail_card["kng_card_shanguang_image"] = kng_card_shanguang_image

    return table_kunninggong_detail_card

end

