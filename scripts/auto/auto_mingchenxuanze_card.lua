function createmingchenxuanze_card()

    local table_mingchenxuanze_card = {}

    local mingchenxuanze_card = fc.FContainerPanel:create()
    mingchenxuanze_card:setSize(cc.size(195,248))
    table_mingchenxuanze_card["mingchenxuanze_card"] = mingchenxuanze_card

    local mingchenxuanze_card_bgrect_image = fc.FExtensionsImage:create()
    mingchenxuanze_card_bgrect_image:setImage("nobatch/touxiangtongyongdikuang.png")
    mingchenxuanze_card_bgrect_image:setSize(cc.size(156,231))
    mingchenxuanze_card_bgrect_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(mingchenxuanze_card_bgrect_image)
    mingchenxuanze_card_bgrect_image:setPositionInContainer(cc.p(98,123.5))
    table_mingchenxuanze_card["mingchenxuanze_card_bgrect_image"] = mingchenxuanze_card_bgrect_image

    local mingchenxuanze_card_head_rect_image = fc.FExtensionsImage:create()
    mingchenxuanze_card_head_rect_image:setImage("batch_ui/baipinzhi_kuang.png")
    mingchenxuanze_card_head_rect_image:setSize(cc.size(104,104))
    mingchenxuanze_card_head_rect_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(mingchenxuanze_card_head_rect_image)
    mingchenxuanze_card_head_rect_image:setPositionInContainer(cc.p(96,91))
    table_mingchenxuanze_card["mingchenxuanze_card_head_rect_image"] = mingchenxuanze_card_head_rect_image

    local upname_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    upname_bg:setSize(cc.size(155,28))
    upname_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(upname_bg)
    upname_bg:setPositionInContainer(cc.p(97.5,22))
    table_mingchenxuanze_card["upname_bg"] = upname_bg

    local flabel_mingchenxuanze_card_name = fc.FLabel:createBMFont()
    flabel_mingchenxuanze_card_name:setSize(cc.size(100,30))
    flabel_mingchenxuanze_card_name:setAnchorPoint(cc.p(0.5,0.5))
    flabel_mingchenxuanze_card_name:setFontSize(20)
    flabel_mingchenxuanze_card_name:setString("名字五个字")
    flabel_mingchenxuanze_card_name:setColor(cc.c3b(106,68,19))
    mingchenxuanze_card:appendComponent(flabel_mingchenxuanze_card_name)
    flabel_mingchenxuanze_card_name:setPositionInContainer(cc.p(96,22))
    table_mingchenxuanze_card["flabel_mingchenxuanze_card_name"] = flabel_mingchenxuanze_card_name

    local mingchenxuanze_card_head_image = fc.FExtensionsImage:create()
    mingchenxuanze_card_head_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(mingchenxuanze_card_head_image)
    mingchenxuanze_card_head_image:setPositionInContainer(cc.p(96,91))
    table_mingchenxuanze_card["mingchenxuanze_card_head_image"] = mingchenxuanze_card_head_image

    local down_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    down_bg:setSize(cc.size(155,70))
    down_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(down_bg)
    down_bg:setPositionInContainer(cc.p(97.5,203))
    table_mingchenxuanze_card["down_bg"] = down_bg

    local attack_image = fc.FExtensionsImage:create()
    attack_image:setImage("batch_ui/gongji_tubiao.png")
    attack_image:setSize(cc.size(21,25))
    attack_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(attack_image)
    attack_image:setPositionInContainer(cc.p(50.5,200.5))
    table_mingchenxuanze_card["attack_image"] = attack_image

    local defense_image = fc.FExtensionsImage:create()
    defense_image:setImage("batch_ui/fangyu_tubiao.png")
    defense_image:setSize(cc.size(19,22))
    defense_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(defense_image)
    defense_image:setPositionInContainer(cc.p(50.5,225))
    table_mingchenxuanze_card["defense_image"] = defense_image

    local flabel_attack_num = fc.FLabel:createBMFont()
    flabel_attack_num:setSize(cc.size(60,20))
    flabel_attack_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_attack_num:setFontSize(21)
    flabel_attack_num:setString("100")
    flabel_attack_num:setColor(cc.c3b(106,68,19))
    mingchenxuanze_card:appendComponent(flabel_attack_num)
    flabel_attack_num:setPositionInContainer(cc.p(107,196))
    table_mingchenxuanze_card["flabel_attack_num"] = flabel_attack_num

    local flabel_defense_num = fc.FLabel:createBMFont()
    flabel_defense_num:setSize(cc.size(60,20))
    flabel_defense_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_defense_num:setFontSize(21)
    flabel_defense_num:setString("100")
    flabel_defense_num:setColor(cc.c3b(106,68,19))
    mingchenxuanze_card:appendComponent(flabel_defense_num)
    flabel_defense_num:setPositionInContainer(cc.p(107,220))
    table_mingchenxuanze_card["flabel_defense_num"] = flabel_defense_num

    local mcxz_level = fc.FLabel:createBMFont()
    mcxz_level:setSize(cc.size(60,24))
    mcxz_level:setAnchorPoint(cc.p(0.5,0.5))
    mcxz_level:setFontSize(21)
    mcxz_level:setString("LV:")
    mcxz_level:setColor(cc.c3b(106,68,19))
    mingchenxuanze_card:appendComponent(mcxz_level)
    mcxz_level:setPositionInContainer(cc.p(55,177))
    table_mingchenxuanze_card["mcxz_level"] = mcxz_level

    local mcxz_level_label = fc.FLabel:createBMFont()
    mcxz_level_label:setSize(cc.size(60,24))
    mcxz_level_label:setAnchorPoint(cc.p(0.5,0.5))
    mcxz_level_label:setFontSize(21)
    mcxz_level_label:setString("33")
    mcxz_level_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_card:appendComponent(mcxz_level_label)
    mcxz_level_label:setPositionInContainer(cc.p(103,177))
    table_mingchenxuanze_card["mcxz_level_label"] = mcxz_level_label

    local mcxz_level_di = fc.FExtensionsImage:create()
    mcxz_level_di:setImage("batch_ui/xingxingdiwen.png")
    mcxz_level_di:setSize(cc.size(150,26))
    mcxz_level_di:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(mcxz_level_di)
    mcxz_level_di:setPositionInContainer(cc.p(97,159))
    table_mingchenxuanze_card["mcxz_level_di"] = mcxz_level_di

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(37.5,157.5))
    table_mingchenxuanze_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(66.5,157.5))
    table_mingchenxuanze_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(95.5,157.5))
    table_mingchenxuanze_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(124.5,157.5))
    table_mingchenxuanze_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(153.5,157.5))
    table_mingchenxuanze_card["xingxing_dark"] = xingxing_dark

    local mcxz_card_yishangzhen_image = fc.FExtensionsImage:create()
    mcxz_card_yishangzhen_image:setImage("batch_ui/yishangzhen_junjichu.png")
    mcxz_card_yishangzhen_image:setSize(cc.size(39,93))
    mcxz_card_yishangzhen_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(mcxz_card_yishangzhen_image)
    mcxz_card_yishangzhen_image:setPositionInContainer(cc.p(152.5,82.5))
    table_mingchenxuanze_card["mcxz_card_yishangzhen_image"] = mcxz_card_yishangzhen_image

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    card_rect:setSize(cc.size(156,231))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(98,123.5))
    table_mingchenxuanze_card["card_rect"] = card_rect

    local soldier_type_image = fc.FExtensionsImage:create()
    soldier_type_image:setImage("batch_ui/bu_bingzhong_anniu.png")
    soldier_type_image:setSize(cc.size(36,37))
    soldier_type_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(soldier_type_image)
    soldier_type_image:setPositionInContainer(cc.p(41,55.5))
    table_mingchenxuanze_card["soldier_type_image"] = soldier_type_image

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(star1)
    star1:setPositionInContainer(cc.p(37.5,157.5))
    table_mingchenxuanze_card["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(star2)
    star2:setPositionInContainer(cc.p(66.5,157.5))
    table_mingchenxuanze_card["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(star3)
    star3:setPositionInContainer(cc.p(96.5,157.5))
    table_mingchenxuanze_card["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(star4)
    star4:setPositionInContainer(cc.p(124.5,157.5))
    table_mingchenxuanze_card["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(star5)
    star5:setPositionInContainer(cc.p(153.5,157.5))
    table_mingchenxuanze_card["star5"] = star5

    local mingchenxuanze_card_xuanzhong_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    mingchenxuanze_card_xuanzhong_image:setSize(cc.size(175,250))
    mingchenxuanze_card_xuanzhong_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_card:appendComponent(mingchenxuanze_card_xuanzhong_image)
    mingchenxuanze_card_xuanzhong_image:setPositionInContainer(cc.p(97.5,124))
    table_mingchenxuanze_card["mingchenxuanze_card_xuanzhong_image"] = mingchenxuanze_card_xuanzhong_image

    return table_mingchenxuanze_card

end

