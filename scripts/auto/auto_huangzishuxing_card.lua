function createhuangzishuxing_card()

    local table_huangzishuxing_card = {}

    local huangzishuxing_card = fc.FContainerPanel:create()
    huangzishuxing_card:setSize(cc.size(307,560))
    table_huangzishuxing_card["huangzishuxing_card"] = huangzishuxing_card

    local hzsx_person_bg = fc.FExtensionsImage:create()
    hzsx_person_bg:setImage("nobatch/diwen1_paibingbuzhen.png")
    hzsx_person_bg:setSize(cc.size(295,420))
    hzsx_person_bg:setFlipType(8)
    hzsx_person_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_person_bg)
    hzsx_person_bg:setPositionInContainer(cc.p(152.5,218))
    table_huangzishuxing_card["hzsx_person_bg"] = hzsx_person_bg

    local hzsx_card_image = fc.FExtensionsImage:create()
    hzsx_card_image:setImage("nobatch/tupian.png")
    hzsx_card_image:setSize(cc.size(297,379))
    hzsx_card_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_card_image)
    hzsx_card_image:setPositionInContainer(cc.p(149.5,229.5))
    table_huangzishuxing_card["hzsx_card_image"] = hzsx_card_image

    local hzsx_top_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(55,0,2,29))
    hzsx_top_bg:setSize(cc.size(291,42))
    hzsx_top_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_top_bg)
    hzsx_top_bg:setPositionInContainer(cc.p(150.5,21))
    table_huangzishuxing_card["hzsx_top_bg"] = hzsx_top_bg

    local hzsx_star1 = fc.FExtensionsImage:create()
    hzsx_star1:setImage("batch_ui/xingxing.png")
    hzsx_star1:setSize(cc.size(20,19))
    hzsx_star1:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_star1)
    hzsx_star1:setPositionInContainer(cc.p(86,21.5))
    table_huangzishuxing_card["hzsx_star1"] = hzsx_star1

    local hzsx_star2 = fc.FExtensionsImage:create()
    hzsx_star2:setImage("batch_ui/xingxing.png")
    hzsx_star2:setSize(cc.size(20,19))
    hzsx_star2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_star2)
    hzsx_star2:setPositionInContainer(cc.p(116,21.5))
    table_huangzishuxing_card["hzsx_star2"] = hzsx_star2

    local hzsx_star3 = fc.FExtensionsImage:create()
    hzsx_star3:setImage("batch_ui/xingxing.png")
    hzsx_star3:setSize(cc.size(20,19))
    hzsx_star3:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_star3)
    hzsx_star3:setPositionInContainer(cc.p(146,21.5))
    table_huangzishuxing_card["hzsx_star3"] = hzsx_star3

    local hzsx_star4 = fc.FExtensionsImage:create()
    hzsx_star4:setImage("batch_ui/xingxing.png")
    hzsx_star4:setSize(cc.size(20,19))
    hzsx_star4:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_star4)
    hzsx_star4:setPositionInContainer(cc.p(180,21.5))
    table_huangzishuxing_card["hzsx_star4"] = hzsx_star4

    local hzsx_bg_b2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tuopan1_paibingbuzhen.png",cc.rect(120,37,4,4))
    hzsx_bg_b2:setSize(cc.size(145,130))
    hzsx_bg_b2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_bg_b2)
    hzsx_bg_b2:setPositionInContainer(cc.p(222.5,495))
    table_huangzishuxing_card["hzsx_bg_b2"] = hzsx_bg_b2

    local hzsx_bg_b1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tuopan1_paibingbuzhen.png",cc.rect(120,37,4,4))
    hzsx_bg_b1:setSize(cc.size(145,130))
    hzsx_bg_b1:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_bg_b1)
    hzsx_bg_b1:setPositionInContainer(cc.p(77.5,495))
    table_huangzishuxing_card["hzsx_bg_b1"] = hzsx_bg_b1

    local bottom_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(55,5,2,3))
    bottom_bar:setSize(cc.size(290,13))
    bottom_bar:setAnchorPoint(cc.p(0.5,0.5))
    bottom_bar:setScaleY(-1)
    huangzishuxing_card:appendComponent(bottom_bar)
    bottom_bar:setPositionInContainer(cc.p(151,553.5))
    table_huangzishuxing_card["bottom_bar"] = bottom_bar

    local hzsx_star5 = fc.FExtensionsImage:create()
    hzsx_star5:setImage("batch_ui/xingxing.png")
    hzsx_star5:setSize(cc.size(20,19))
    hzsx_star5:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_star5)
    hzsx_star5:setPositionInContainer(cc.p(210,21.5))
    table_huangzishuxing_card["hzsx_star5"] = hzsx_star5

    local hzsx_miaoshu_label = fc.FLabel:createBMFont()
    hzsx_miaoshu_label:setSize(cc.size(260,60))
    hzsx_miaoshu_label:setWidth(250)
    hzsx_miaoshu_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_miaoshu_label:setFontSize(20)
    hzsx_miaoshu_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    hzsx_miaoshu_label:setColor(cc.c3b(250,255,165))
    huangzishuxing_card:appendComponent(hzsx_miaoshu_label)
    hzsx_miaoshu_label:setPositionInContainer(cc.p(151,494))
    table_huangzishuxing_card["hzsx_miaoshu_label"] = hzsx_miaoshu_label

    local hzsx_character_tile = fc.FLabel:createBMFont()
    hzsx_character_tile:setSize(cc.size(60,30))
    hzsx_character_tile:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_character_tile:setFontSize(21)
    hzsx_character_tile:setString("性格")
    hzsx_character_tile:setColor(cc.c3b(139,255,240))
    huangzishuxing_card:appendComponent(hzsx_character_tile)
    hzsx_character_tile:setPositionInContainer(cc.p(149,445))
    table_huangzishuxing_card["hzsx_character_tile"] = hzsx_character_tile

    local hzsx_line = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(55,5,2,3))
    hzsx_line:setSize(cc.size(290,13))
    hzsx_line:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_line)
    hzsx_line:setPositionInContainer(cc.p(151,426.5))
    table_huangzishuxing_card["hzsx_line"] = hzsx_line

    local hzsx_card_rect_image_up = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    hzsx_card_rect_image_up:setSize(cc.size(25,560))
    hzsx_card_rect_image_up:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_card_rect_image_up)
    hzsx_card_rect_image_up:setPositionInContainer(cc.p(297.5,280))
    table_huangzishuxing_card["hzsx_card_rect_image_up"] = hzsx_card_rect_image_up

    local hzsx_img3 = fc.FExtensionsImage:create()
    hzsx_img3:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    hzsx_img3:setSize(cc.size(13,27))
    hzsx_img3:setFlipType(4)
    hzsx_img3:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_img3)
    hzsx_img3:setPositionInContainer(cc.p(292.5,413.5))
    table_huangzishuxing_card["hzsx_img3"] = hzsx_img3

    local hzsx_img4 = fc.FExtensionsImage:create()
    hzsx_img4:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    hzsx_img4:setSize(cc.size(13,27))
    hzsx_img4:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_img4)
    hzsx_img4:setPositionInContainer(cc.p(292.5,440.5))
    table_huangzishuxing_card["hzsx_img4"] = hzsx_img4

    local hzsx_card_rect_image_up = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    hzsx_card_rect_image_up:setSize(cc.size(25,560))
    hzsx_card_rect_image_up:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_card_rect_image_up)
    hzsx_card_rect_image_up:setPositionInContainer(cc.p(2.5,280))
    table_huangzishuxing_card["hzsx_card_rect_image_up"] = hzsx_card_rect_image_up

    local hzsx_img1 = fc.FExtensionsImage:create()
    hzsx_img1:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    hzsx_img1:setSize(cc.size(13,27))
    hzsx_img1:setFlipType(8)
    hzsx_img1:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_img1)
    hzsx_img1:setPositionInContainer(cc.p(6.5,413.5))
    table_huangzishuxing_card["hzsx_img1"] = hzsx_img1

    local hzsx_img2 = fc.FExtensionsImage:create()
    hzsx_img2:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    hzsx_img2:setSize(cc.size(13,27))
    hzsx_img2:setFlipType(2)
    hzsx_img2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_card:appendComponent(hzsx_img2)
    hzsx_img2:setPositionInContainer(cc.p(6.5,440.5))
    table_huangzishuxing_card["hzsx_img2"] = hzsx_img2

    return table_huangzishuxing_card

end

