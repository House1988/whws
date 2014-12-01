function createmeinvxuanze_card()

    local table_meinvxuanze_card = {}

    local meinvxuanze_card = fc.FContainerPanel:create()
    meinvxuanze_card:setSize(cc.size(169,238))
    table_meinvxuanze_card["meinvxuanze_card"] = meinvxuanze_card

    local mvxz_card_bg_image = fc.FExtensionsImage:create()
    mvxz_card_bg_image:setImage("nobatch/touxiangdikuang_meinv1.png")
    mvxz_card_bg_image:setSize(cc.size(140,150))
    mvxz_card_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_card_bg_image)
    mvxz_card_bg_image:setPositionInContainer(cc.p(83,127))
    table_meinvxuanze_card["mvxz_card_bg_image"] = mvxz_card_bg_image

    local mvxz_card_xingtiao_scale9 = fc.FExtensionsImage:create()
    mvxz_card_xingtiao_scale9:setImage("batch_ui/xingxingdiwen.png")
    mvxz_card_xingtiao_scale9:setSize(cc.size(140,26))
    mvxz_card_xingtiao_scale9:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_card_xingtiao_scale9)
    mvxz_card_xingtiao_scale9:setPositionInContainer(cc.p(82,177))
    table_meinvxuanze_card["mvxz_card_xingtiao_scale9"] = mvxz_card_xingtiao_scale9

    local mvxz_meinvkuang_image = fc.FExtensionsImage:create()
    mvxz_meinvkuang_image:setImage("batch_ui/baipinzhi_kuang.png")
    mvxz_meinvkuang_image:setSize(cc.size(104,104))
    mvxz_meinvkuang_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_meinvkuang_image)
    mvxz_meinvkuang_image:setPositionInContainer(cc.p(85,104))
    table_meinvxuanze_card["mvxz_meinvkuang_image"] = mvxz_meinvkuang_image

    local mvxz_meinvtouxiang_image = fc.FExtensionsImage:create()
    mvxz_meinvtouxiang_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_meinvtouxiang_image)
    mvxz_meinvtouxiang_image:setPositionInContainer(cc.p(84,104))
    table_meinvxuanze_card["mvxz_meinvtouxiang_image"] = mvxz_meinvtouxiang_image

    local up_image = fc.FExtensionsImage:create()
    up_image:setImage("batch_ui/tongyongdi1.png")
    up_image:setSize(cc.size(140,35))
    up_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(up_image)
    up_image:setPositionInContainer(cc.p(83,34.5))
    table_meinvxuanze_card["up_image"] = up_image

    local down_image = fc.FExtensionsImage:create()
    down_image:setImage("batch_ui/tongyongdi1.png")
    down_image:setSize(cc.size(140,35))
    down_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(down_image)
    down_image:setPositionInContainer(cc.p(83,209.5))
    table_meinvxuanze_card["down_image"] = down_image

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(26.5,178.5))
    table_meinvxuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(54.5,178.5))
    table_meinvxuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(82.5,178.5))
    table_meinvxuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(110.5,178.5))
    table_meinvxuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(138.5,178.5))
    table_meinvxuanze_card["star_dark"] = star_dark

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star1)
    star1:setPositionInContainer(cc.p(26.5,178.5))
    table_meinvxuanze_card["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star2)
    star2:setPositionInContainer(cc.p(54.5,178.5))
    table_meinvxuanze_card["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star3)
    star3:setPositionInContainer(cc.p(82.5,178.5))
    table_meinvxuanze_card["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star4)
    star4:setPositionInContainer(cc.p(110.5,178.5))
    table_meinvxuanze_card["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(star5)
    star5:setPositionInContainer(cc.p(138.5,178.5))
    table_meinvxuanze_card["star5"] = star5

    local mvxz_name_label = fc.FLabel:createBMFont()
    mvxz_name_label:setSize(cc.size(155,33))
    mvxz_name_label:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_name_label:setFontSize(20)
    mvxz_name_label:setString("步兵步兵步")
    mvxz_name_label:setColor(cc.c3b(137,32,18))
    meinvxuanze_card:appendComponent(mvxz_name_label)
    mvxz_name_label:setPositionInContainer(cc.p(85.5,34.5))
    table_meinvxuanze_card["mvxz_name_label"] = mvxz_name_label

    local mvxz_jineng_label = fc.FLabel:createBMFont()
    mvxz_jineng_label:setSize(cc.size(155,33))
    mvxz_jineng_label:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_jineng_label:setFontSize(20)
    mvxz_jineng_label:setString("步兵步兵步")
    mvxz_jineng_label:setColor(cc.c3b(137,32,18))
    meinvxuanze_card:appendComponent(mvxz_jineng_label)
    mvxz_jineng_label:setPositionInContainer(cc.p(83.5,208.5))
    table_meinvxuanze_card["mvxz_jineng_label"] = mvxz_jineng_label

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/touxiangdikuang_meinv2.png",cc.rect(53,54,5,2))
    card_rect:setSize(cc.size(160,232))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(84,121))
    table_meinvxuanze_card["card_rect"] = card_rect

    local mvxz_guangquan_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/xuanzhongkuang_meinv.png",cc.rect(60,60,2,2))
    mvxz_guangquan_image:setSize(cc.size(169,238))
    mvxz_guangquan_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_guangquan_image)
    mvxz_guangquan_image:setPositionInContainer(cc.p(84.5,120))
    table_meinvxuanze_card["mvxz_guangquan_image"] = mvxz_guangquan_image

    local mvxz_card_cheer = fc.FExtensionsImage:create()
    mvxz_card_cheer:setImage("batch_ui/yizhuzhen.png")
    mvxz_card_cheer:setSize(cc.size(74,47))
    mvxz_card_cheer:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_card_cheer)
    mvxz_card_cheer:setPositionInContainer(cc.p(131,145.5))
    table_meinvxuanze_card["mvxz_card_cheer"] = mvxz_card_cheer

    local mvxz_card_pregnant = fc.FExtensionsImage:create()
    mvxz_card_pregnant:setImage("batch_ui/huaiyunzhong_tubiao.png")
    mvxz_card_pregnant:setSize(cc.size(62,60))
    mvxz_card_pregnant:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_card:appendComponent(mvxz_card_pregnant)
    mvxz_card_pregnant:setPositionInContainer(cc.p(31,67))
    table_meinvxuanze_card["mvxz_card_pregnant"] = mvxz_card_pregnant

    return table_meinvxuanze_card

end

