function creategenghuanzhenrong_card()

    local table_genghuanzhenrong_card = {}

    local genghuanzhenrong_card = fc.FContainerPanel:create()
    genghuanzhenrong_card:setSize(cc.size(145,220))
    table_genghuanzhenrong_card["genghuanzhenrong_card"] = genghuanzhenrong_card

    local genghuanzhenrong_card_bgrect_image = fc.FExtensionsImage:create()
    genghuanzhenrong_card_bgrect_image:setImage("nobatch/touxiangtongyongdikuang.png")
    genghuanzhenrong_card_bgrect_image:setSize(cc.size(130,203))
    genghuanzhenrong_card_bgrect_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(genghuanzhenrong_card_bgrect_image)
    genghuanzhenrong_card_bgrect_image:setPositionInContainer(cc.p(71,111.5))
    table_genghuanzhenrong_card["genghuanzhenrong_card_bgrect_image"] = genghuanzhenrong_card_bgrect_image

    local genghuanzhenrong_card_head_rect_image = fc.FExtensionsImage:create()
    genghuanzhenrong_card_head_rect_image:setImage("batch_ui/baipinzhi_kuang.png")
    genghuanzhenrong_card_head_rect_image:setSize(cc.size(102,102))
    genghuanzhenrong_card_head_rect_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(genghuanzhenrong_card_head_rect_image)
    genghuanzhenrong_card_head_rect_image:setPositionInContainer(cc.p(71,90))
    table_genghuanzhenrong_card["genghuanzhenrong_card_head_rect_image"] = genghuanzhenrong_card_head_rect_image

    local genghuanzhenrong_card_head_image = fc.FExtensionsImage:create()
    genghuanzhenrong_card_head_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(genghuanzhenrong_card_head_image)
    genghuanzhenrong_card_head_image:setPositionInContainer(cc.p(70.5,89.5))
    table_genghuanzhenrong_card["genghuanzhenrong_card_head_image"] = genghuanzhenrong_card_head_image

    local di_image = fc.FExtensionsImage:create()
    di_image:setImage("batch_ui/xingxingdiwen.png")
    di_image:setSize(cc.size(130,26))
    di_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(di_image)
    di_image:setPositionInContainer(cc.p(71,184))
    table_genghuanzhenrong_card["di_image"] = di_image

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(18.5,185.5))
    table_genghuanzhenrong_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(44.5,185.5))
    table_genghuanzhenrong_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(70.5,185.5))
    table_genghuanzhenrong_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(95.5,185.5))
    table_genghuanzhenrong_card["xingxing_dark"] = xingxing_dark

    local xingxing_dark = fc.FExtensionsImage:create()
    xingxing_dark:setImage("batch_ui/xingxing_dark.png")
    xingxing_dark:setSize(cc.size(25,27))
    xingxing_dark:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(xingxing_dark)
    xingxing_dark:setPositionInContainer(cc.p(121.5,185.5))
    table_genghuanzhenrong_card["xingxing_dark"] = xingxing_dark

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(star1)
    star1:setPositionInContainer(cc.p(18.5,185.5))
    table_genghuanzhenrong_card["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(star2)
    star2:setPositionInContainer(cc.p(44.5,185.5))
    table_genghuanzhenrong_card["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(star3)
    star3:setPositionInContainer(cc.p(70.5,185.5))
    table_genghuanzhenrong_card["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(star4)
    star4:setPositionInContainer(cc.p(95.5,185.5))
    table_genghuanzhenrong_card["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(star5)
    star5:setPositionInContainer(cc.p(121.5,185.5))
    table_genghuanzhenrong_card["star5"] = star5

    local genghuan_button_panel = fc.FContainerPanel:create()
    genghuan_button_panel:setSize(cc.size(40,40))
    genghuan_button_panel:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(genghuan_button_panel)
    genghuan_button_panel:setPositionInContainer(cc.p(110,151))
    table_genghuanzhenrong_card["genghuan_button_panel"] = genghuan_button_panel

    local genghuan_button = fc.FScaleButton:create()
    genghuan_button:setSize(cc.size(40,40))
    genghuan_button:setAnchorPoint(cc.p(0.5,0.5))
    genghuan_button:setButtonImage("batch_ui/huan_up.png")
    genghuan_button_panel:appendComponent(genghuan_button)
    genghuan_button:setPositionInContainer(cc.p(20,20))
    table_genghuanzhenrong_card["genghuan_button"] = genghuan_button

    local my_name_bg = fc.FExtensionsImage:create()
    my_name_bg:setImage("batch_ui/tongyongdi1.png")
    my_name_bg:setSize(cc.size(130,28))
    my_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(my_name_bg)
    my_name_bg:setPositionInContainer(cc.p(71,24))
    table_genghuanzhenrong_card["my_name_bg"] = my_name_bg

    local flabel_genghuanzhenrong_card_name = fc.FLabel:createBMFont()
    flabel_genghuanzhenrong_card_name:setSize(cc.size(100,30))
    flabel_genghuanzhenrong_card_name:setAnchorPoint(cc.p(0.5,0.5))
    flabel_genghuanzhenrong_card_name:setFontSize(20)
    flabel_genghuanzhenrong_card_name:setString("名字五个字")
    flabel_genghuanzhenrong_card_name:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_card:appendComponent(flabel_genghuanzhenrong_card_name)
    flabel_genghuanzhenrong_card_name:setPositionInContainer(cc.p(71,26))
    table_genghuanzhenrong_card["flabel_genghuanzhenrong_card_name"] = flabel_genghuanzhenrong_card_name

    local soldier_type_image = fc.FExtensionsImage:create()
    soldier_type_image:setImage("batch_ui/bu_bingzhong_anniu.png")
    soldier_type_image:setSize(cc.size(36,37))
    soldier_type_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(soldier_type_image)
    soldier_type_image:setPositionInContainer(cc.p(28,59.5))
    table_genghuanzhenrong_card["soldier_type_image"] = soldier_type_image

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    card_rect:setSize(cc.size(130,203))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(71,111.5))
    table_genghuanzhenrong_card["card_rect"] = card_rect

    local genghuanzhenrong_card_xuanzhong_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    genghuanzhenrong_card_xuanzhong_image:setSize(cc.size(145,220))
    genghuanzhenrong_card_xuanzhong_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_card:appendComponent(genghuanzhenrong_card_xuanzhong_image)
    genghuanzhenrong_card_xuanzhong_image:setPositionInContainer(cc.p(72.5,110))
    table_genghuanzhenrong_card["genghuanzhenrong_card_xuanzhong_image"] = genghuanzhenrong_card_xuanzhong_image

    return table_genghuanzhenrong_card

end

