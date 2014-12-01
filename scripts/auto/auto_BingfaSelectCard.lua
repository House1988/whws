function createBingfaSelectCard()

    local table_BingfaSelectCard = {}

    local BingfaSelectCard = fc.FContainerPanel:create()
    BingfaSelectCard:setSize(cc.size(155,204))
    table_BingfaSelectCard["BingfaSelectCard"] = BingfaSelectCard

    local sj_card_waikuang_scale9 = fc.FExtensionsImage:create()
    sj_card_waikuang_scale9:setImage("nobatch/touxiangtongyongdikuang.png")
    sj_card_waikuang_scale9:setSize(cc.size(155,204))
    sj_card_waikuang_scale9:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(sj_card_waikuang_scale9)
    sj_card_waikuang_scale9:setPositionInContainer(cc.p(77.5,102))
    table_BingfaSelectCard["sj_card_waikuang_scale9"] = sj_card_waikuang_scale9

    local sj_card_xingdiwen_image = fc.FExtensionsImage:create()
    sj_card_xingdiwen_image:setImage("batch_ui/xingxingdiwen.png")
    sj_card_xingdiwen_image:setSize(cc.size(155,26))
    sj_card_xingdiwen_image:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(sj_card_xingdiwen_image)
    sj_card_xingdiwen_image:setPositionInContainer(cc.p(77.5,150))
    table_BingfaSelectCard["sj_card_xingdiwen_image"] = sj_card_xingdiwen_image

    local sj_card_mingzibg_scale9 = fc.FExtensionsImage:create()
    sj_card_mingzibg_scale9:setImage("batch_ui/tongyongdi1.png")
    sj_card_mingzibg_scale9:setSize(cc.size(155,40))
    sj_card_mingzibg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(sj_card_mingzibg_scale9)
    sj_card_mingzibg_scale9:setPositionInContainer(cc.p(77.5,184))
    table_BingfaSelectCard["sj_card_mingzibg_scale9"] = sj_card_mingzibg_scale9

    local name_bg = fc.FExtensionsImage:create()
    name_bg:setImage("batch_ui/tongyongdi1.png")
    name_bg:setSize(cc.size(155,28))
    name_bg:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(name_bg)
    name_bg:setPositionInContainer(cc.p(77.5,14))
    table_BingfaSelectCard["name_bg"] = name_bg

    local cardframe = fc.FExtensionsImage:create()
    cardframe:setImage("batch_ui/baipinzhi_kuang.png")
    cardframe:setSize(cc.size(102,102))
    cardframe:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(cardframe)
    cardframe:setPositionInContainer(cc.p(77,83))
    table_BingfaSelectCard["cardframe"] = cardframe

    local sj_card_name_label = fc.FLabel:createBMFont()
    sj_card_name_label:setSize(cc.size(110,30))
    sj_card_name_label:setAnchorPoint(cc.p(0.5,0.5))
    sj_card_name_label:setFontSize(20)
    sj_card_name_label:setString("名字五个字")
    sj_card_name_label:setColor(cc.c3b(39,8,3))
    BingfaSelectCard:appendComponent(sj_card_name_label)
    sj_card_name_label:setPositionInContainer(cc.p(77,15))
    table_BingfaSelectCard["sj_card_name_label"] = sj_card_name_label

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(23.5,149.5))
    table_BingfaSelectCard["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(49.5,149.5))
    table_BingfaSelectCard["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(75.5,149.5))
    table_BingfaSelectCard["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(101.5,149.5))
    table_BingfaSelectCard["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(127.5,149.5))
    table_BingfaSelectCard["star_dark"] = star_dark

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star1)
    star1:setPositionInContainer(cc.p(23.5,149.5))
    table_BingfaSelectCard["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star2)
    star2:setPositionInContainer(cc.p(49.5,149.5))
    table_BingfaSelectCard["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star3)
    star3:setPositionInContainer(cc.p(75.5,149.5))
    table_BingfaSelectCard["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star4)
    star4:setPositionInContainer(cc.p(101.5,149.5))
    table_BingfaSelectCard["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(star5)
    star5:setPositionInContainer(cc.p(127.5,149.5))
    table_BingfaSelectCard["star5"] = star5

    local cardImage = fc.FExtensionsImage:create()
    cardImage:setImage("card_head/agui.png")
    cardImage:setSize(cc.size(90,90))
    cardImage:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(cardImage)
    cardImage:setPositionInContainer(cc.p(77,82))
    table_BingfaSelectCard["cardImage"] = cardImage

    local lv_label = fc.FLabel:createBMFont()
    lv_label:setSize(cc.size(60,24))
    lv_label:setAnchorPoint(cc.p(0.5,0.5))
    lv_label:setFontSize(21)
    lv_label:setString("LV:")
    lv_label:setColor(cc.c3b(106,68,19))
    BingfaSelectCard:appendComponent(lv_label)
    lv_label:setPositionInContainer(cc.p(35,183))
    table_BingfaSelectCard["lv_label"] = lv_label

    local lv_num_label = fc.FLabel:createBMFont()
    lv_num_label:setSize(cc.size(60,24))
    lv_num_label:setAnchorPoint(cc.p(0.5,0.5))
    lv_num_label:setFontSize(21)
    lv_num_label:setString("33")
    lv_num_label:setColor(cc.c3b(106,68,19))
    BingfaSelectCard:appendComponent(lv_num_label)
    lv_num_label:setPositionInContainer(cc.p(80,183))
    table_BingfaSelectCard["lv_num_label"] = lv_num_label

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    card_rect:setSize(cc.size(155,204))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(77.5,102))
    table_BingfaSelectCard["card_rect"] = card_rect

    local sj_card_check_box = fc.FExtensionsImage:create()
    sj_card_check_box:setImage("batch_ui/quanxuan_dikuang.png")
    sj_card_check_box:setSize(cc.size(47,47))
    sj_card_check_box:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(sj_card_check_box)
    sj_card_check_box:setPositionInContainer(cc.p(131.5,180.5))
    table_BingfaSelectCard["sj_card_check_box"] = sj_card_check_box

    local sj_card_duigou = fc.FExtensionsImage:create()
    sj_card_duigou:setImage("batch_ui/xuanzhonggou.png")
    sj_card_duigou:setSize(cc.size(60,52))
    sj_card_duigou:setAnchorPoint(cc.p(0.5,0.5))
    BingfaSelectCard:appendComponent(sj_card_duigou)
    sj_card_duigou:setPositionInContainer(cc.p(132,178))
    table_BingfaSelectCard["sj_card_duigou"] = sj_card_duigou

    return table_BingfaSelectCard

end

