function createBingfaCard()

    local table_BingfaCard = {}

    local BingfaCard = fc.FContainerPanel:create()
    BingfaCard:setSize(cc.size(195,248))
    table_BingfaCard["BingfaCard"] = BingfaCard

    local mingchenxuanze_card_bgrect_image = fc.FExtensionsImage:create()
    mingchenxuanze_card_bgrect_image:setImage("nobatch/touxiangtongyongdikuang.png")
    mingchenxuanze_card_bgrect_image:setSize(cc.size(156,231))
    mingchenxuanze_card_bgrect_image:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(mingchenxuanze_card_bgrect_image)
    mingchenxuanze_card_bgrect_image:setPositionInContainer(cc.p(98,123.5))
    table_BingfaCard["mingchenxuanze_card_bgrect_image"] = mingchenxuanze_card_bgrect_image

    local cardframe = fc.FExtensionsImage:create()
    cardframe:setImage("batch_ui/baipinzhi_kuang.png")
    cardframe:setSize(cc.size(104,104))
    cardframe:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(cardframe)
    cardframe:setPositionInContainer(cc.p(96,91))
    table_BingfaCard["cardframe"] = cardframe

    local upname_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    upname_bg:setSize(cc.size(155,28))
    upname_bg:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(upname_bg)
    upname_bg:setPositionInContainer(cc.p(97.5,22))
    table_BingfaCard["upname_bg"] = upname_bg

    local sj_card_name_label = fc.FLabel:createBMFont()
    sj_card_name_label:setSize(cc.size(100,30))
    sj_card_name_label:setAnchorPoint(cc.p(0.5,0.5))
    sj_card_name_label:setFontSize(20)
    sj_card_name_label:setString("名字五个字")
    sj_card_name_label:setColor(cc.c3b(106,68,19))
    BingfaCard:appendComponent(sj_card_name_label)
    sj_card_name_label:setPositionInContainer(cc.p(96,22))
    table_BingfaCard["sj_card_name_label"] = sj_card_name_label

    local cardImage = fc.FExtensionsImage:create()
    cardImage:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(cardImage)
    cardImage:setPositionInContainer(cc.p(96,92))
    table_BingfaCard["cardImage"] = cardImage

    local down_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    down_bg:setSize(cc.size(155,70))
    down_bg:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(down_bg)
    down_bg:setPositionInContainer(cc.p(97.5,203))
    table_BingfaCard["down_bg"] = down_bg

    local attack_image = fc.FExtensionsImage:create()
    attack_image:setImage("batch_ui/gongji_tubiao.png")
    attack_image:setSize(cc.size(21,25))
    attack_image:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(attack_image)
    attack_image:setPositionInContainer(cc.p(50.5,200.5))
    table_BingfaCard["attack_image"] = attack_image

    local defense_image = fc.FExtensionsImage:create()
    defense_image:setImage("batch_ui/fangyu_tubiao.png")
    defense_image:setSize(cc.size(19,22))
    defense_image:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(defense_image)
    defense_image:setPositionInContainer(cc.p(50.5,225))
    table_BingfaCard["defense_image"] = defense_image

    local flabel_attack_num = fc.FLabel:createBMFont()
    flabel_attack_num:setSize(cc.size(60,20))
    flabel_attack_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_attack_num:setFontSize(21)
    flabel_attack_num:setString("100")
    flabel_attack_num:setColor(cc.c3b(106,68,19))
    BingfaCard:appendComponent(flabel_attack_num)
    flabel_attack_num:setPositionInContainer(cc.p(107,196))
    table_BingfaCard["flabel_attack_num"] = flabel_attack_num

    local flabel_defense_num = fc.FLabel:createBMFont()
    flabel_defense_num:setSize(cc.size(60,20))
    flabel_defense_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_defense_num:setFontSize(21)
    flabel_defense_num:setString("100")
    flabel_defense_num:setColor(cc.c3b(106,68,19))
    BingfaCard:appendComponent(flabel_defense_num)
    flabel_defense_num:setPositionInContainer(cc.p(107,220))
    table_BingfaCard["flabel_defense_num"] = flabel_defense_num

    local mcxz_level = fc.FLabel:createBMFont()
    mcxz_level:setSize(cc.size(60,24))
    mcxz_level:setAnchorPoint(cc.p(0.5,0.5))
    mcxz_level:setFontSize(21)
    mcxz_level:setString("LV:")
    mcxz_level:setColor(cc.c3b(106,68,19))
    BingfaCard:appendComponent(mcxz_level)
    mcxz_level:setPositionInContainer(cc.p(55,177))
    table_BingfaCard["mcxz_level"] = mcxz_level

    local lv_num_label = fc.FLabel:createBMFont()
    lv_num_label:setSize(cc.size(60,24))
    lv_num_label:setAnchorPoint(cc.p(0.5,0.5))
    lv_num_label:setFontSize(21)
    lv_num_label:setString("33")
    lv_num_label:setColor(cc.c3b(106,68,19))
    BingfaCard:appendComponent(lv_num_label)
    lv_num_label:setPositionInContainer(cc.p(107,177))
    table_BingfaCard["lv_num_label"] = lv_num_label

    local mcxz_level_di = fc.FExtensionsImage:create()
    mcxz_level_di:setImage("batch_ui/xingxingdiwen.png")
    mcxz_level_di:setSize(cc.size(150,26))
    mcxz_level_di:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(mcxz_level_di)
    mcxz_level_di:setPositionInContainer(cc.p(97,159))
    table_BingfaCard["mcxz_level_di"] = mcxz_level_di

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(37.5,157.5))
    table_BingfaCard["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(66.5,157.5))
    table_BingfaCard["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(95.5,157.5))
    table_BingfaCard["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(124.5,157.5))
    table_BingfaCard["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(153.5,157.5))
    table_BingfaCard["xingxing_dark"] = xingxing_dark

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    card_rect:setSize(cc.size(156,231))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(98,123.5))
    table_BingfaCard["card_rect"] = card_rect

    local cardhightlight = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    cardhightlight:setSize(cc.size(175,250))
    cardhightlight:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(cardhightlight)
    cardhightlight:setPositionInContainer(cc.p(97.5,124))
    table_BingfaCard["cardhightlight"] = cardhightlight

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(star1)
    star1:setPositionInContainer(cc.p(37.5,157.5))
    table_BingfaCard["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(star2)
    star2:setPositionInContainer(cc.p(66.5,157.5))
    table_BingfaCard["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(star3)
    star3:setPositionInContainer(cc.p(96.5,157.5))
    table_BingfaCard["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(star4)
    star4:setPositionInContainer(cc.p(124.5,157.5))
    table_BingfaCard["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    BingfaCard:appendComponent(star5)
    star5:setPositionInContainer(cc.p(153.5,157.5))
    table_BingfaCard["star5"] = star5

    return table_BingfaCard

end

