function createhuangzi_xuanze_card()

    local table_huangzi_xuanze_card = {}

    local huangzi_xuanze_card = fc.FContainerPanel:create()
    huangzi_xuanze_card:setSize(cc.size(176,246))
    table_huangzi_xuanze_card["huangzi_xuanze_card"] = huangzi_xuanze_card

    local hzxz_card_bgrect_image = fc.FExtensionsImage:create()
    hzxz_card_bgrect_image:setImage("nobatch/touxiangtongyongdikuang.png")
    hzxz_card_bgrect_image:setSize(cc.size(156,178))
    hzxz_card_bgrect_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_card_bgrect_image)
    hzxz_card_bgrect_image:setPositionInContainer(cc.p(89,140))
    table_huangzi_xuanze_card["hzxz_card_bgrect_image"] = hzxz_card_bgrect_image

    local hzxz_card_head_pinzhi_image = fc.FExtensionsImage:create()
    hzxz_card_head_pinzhi_image:setImage("batch_ui/baipinzhi_kuang.png")
    hzxz_card_head_pinzhi_image:setSize(cc.size(104,104))
    hzxz_card_head_pinzhi_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_card_head_pinzhi_image)
    hzxz_card_head_pinzhi_image:setPositionInContainer(cc.p(89,107))
    table_huangzi_xuanze_card["hzxz_card_head_pinzhi_image"] = hzxz_card_head_pinzhi_image

    local hzsx_card_image = fc.FExtensionsImage:create()
    hzsx_card_image:setImage("nobatch/tupian.png")
    hzsx_card_image:setSize(cc.size(90,90))
    hzsx_card_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzsx_card_image)
    hzsx_card_image:setPositionInContainer(cc.p(88,107))
    table_huangzi_xuanze_card["hzsx_card_image"] = hzsx_card_image

    local hzxz_card_down_board_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    hzxz_card_down_board_image:setSize(cc.size(155,35))
    hzxz_card_down_board_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_card_down_board_image)
    hzxz_card_down_board_image:setPositionInContainer(cc.p(88.5,209.5))
    table_huangzi_xuanze_card["hzxz_card_down_board_image"] = hzxz_card_down_board_image

    local hzxz_dengji_label = fc.FLabel:createBMFont()
    hzxz_dengji_label:setSize(cc.size(77,30))
    hzxz_dengji_label:setAnchorPoint(cc.p(0.5,0.5))
    hzxz_dengji_label:setFontSize(21)
    hzxz_dengji_label:setString("LV:33")
    hzxz_dengji_label:setColor(cc.c3b(106,68,19))
    huangzi_xuanze_card:appendComponent(hzxz_dengji_label)
    hzxz_dengji_label:setPositionInContainer(cc.p(87.5,209))
    table_huangzi_xuanze_card["hzxz_dengji_label"] = hzxz_dengji_label

    local hzxz_card_up_board_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    hzxz_card_up_board_image:setSize(cc.size(155,35))
    hzxz_card_up_board_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_card_up_board_image)
    hzxz_card_up_board_image:setPositionInContainer(cc.p(89.5,33.5))
    table_huangzi_xuanze_card["hzxz_card_up_board_image"] = hzxz_card_up_board_image

    local hzxz_star_bg_image = fc.FExtensionsImage:create()
    hzxz_star_bg_image:setImage("batch_ui/xingxingdiwen.png")
    hzxz_star_bg_image:setSize(cc.size(150,26))
    hzxz_star_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_star_bg_image)
    hzxz_star_bg_image:setPositionInContainer(cc.p(88,177))
    table_huangzi_xuanze_card["hzxz_star_bg_image"] = hzxz_star_bg_image

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(34.5,174.5))
    table_huangzi_xuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(61.5,174.5))
    table_huangzi_xuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(88.5,174.5))
    table_huangzi_xuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(115.5,174.5))
    table_huangzi_xuanze_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(142.5,174.5))
    table_huangzi_xuanze_card["star_dark"] = star_dark

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star1)
    star1:setPositionInContainer(cc.p(34.5,174.5))
    table_huangzi_xuanze_card["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star2)
    star2:setPositionInContainer(cc.p(61.5,174.5))
    table_huangzi_xuanze_card["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star3)
    star3:setPositionInContainer(cc.p(88.5,174.5))
    table_huangzi_xuanze_card["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star4)
    star4:setPositionInContainer(cc.p(115.5,174.5))
    table_huangzi_xuanze_card["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(star5)
    star5:setPositionInContainer(cc.p(142.5,174.5))
    table_huangzi_xuanze_card["star5"] = star5

    local hzxz_name_label = fc.FLabel:createSystemFont()
    hzxz_name_label:setSize(cc.size(108,30))
    hzxz_name_label:setAnchorPoint(cc.p(0.5,0.5))
    hzxz_name_label:setFontSize(20)
    hzxz_name_label:setString("步兵步兵")
    hzxz_name_label:setColor(cc.c3b(106,68,19))
    huangzi_xuanze_card:appendComponent(hzxz_name_label)
    hzxz_name_label:setPositionInContainer(cc.p(89,34))
    table_huangzi_xuanze_card["hzxz_name_label"] = hzxz_name_label

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    card_rect:setSize(cc.size(156,218))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(89,124))
    table_huangzi_xuanze_card["card_rect"] = card_rect

    local hzxz_yidujun_image = fc.FExtensionsImage:create()
    hzxz_yidujun_image:setImage("batch_ui/yidujun2.png")
    hzxz_yidujun_image:setSize(cc.size(80,49))
    hzxz_yidujun_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_yidujun_image)
    hzxz_yidujun_image:setPositionInContainer(cc.p(134,131.5))
    table_huangzi_xuanze_card["hzxz_yidujun_image"] = hzxz_yidujun_image

    local hzxz_sj_bg = fc.FExtensionsImage:create()
    hzxz_sj_bg:setImage("batch_ui/quanxuan_dikuang.png")
    hzxz_sj_bg:setSize(cc.size(47,47))
    hzxz_sj_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_sj_bg)
    hzxz_sj_bg:setPositionInContainer(cc.p(149.5,211.5))
    table_huangzi_xuanze_card["hzxz_sj_bg"] = hzxz_sj_bg

    local hzxz_sj_select = fc.FExtensionsImage:create()
    hzxz_sj_select:setImage("batch_ui/xuanzhonggou.png")
    hzxz_sj_select:setSize(cc.size(60,52))
    hzxz_sj_select:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_sj_select)
    hzxz_sj_select:setPositionInContainer(cc.p(143,209))
    table_huangzi_xuanze_card["hzxz_sj_select"] = hzxz_sj_select

    local hzxz_card_xuanzhong_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    hzxz_card_xuanzhong_image:setSize(cc.size(165,230))
    hzxz_card_xuanzhong_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze_card:appendComponent(hzxz_card_xuanzhong_image)
    hzxz_card_xuanzhong_image:setPositionInContainer(cc.p(88.5,123))
    table_huangzi_xuanze_card["hzxz_card_xuanzhong_image"] = hzxz_card_xuanzhong_image

    return table_huangzi_xuanze_card

end

