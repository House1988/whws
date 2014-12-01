function createmingchenxiangqing_card()

    local table_mingchenxiangqing_card = {}

    local mingchenxiangqing_card = fc.FContainerPanel:create()
    mingchenxiangqing_card:setSize(cc.size(306,536))
    table_mingchenxiangqing_card["mingchenxiangqing_card"] = mingchenxiangqing_card

    local card_bottom_bg = fc.FExtensionsImage:create()
    card_bottom_bg:setImage("batch_ui/diwen3_paibingbuzhen.png")
    card_bottom_bg:setSize(cc.size(300,110))
    card_bottom_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(card_bottom_bg)
    card_bottom_bg:setPositionInContainer(cc.p(152,475))
    table_mingchenxiangqing_card["card_bottom_bg"] = card_bottom_bg

    local card_bg = fc.FExtensionsImage:create()
    card_bg:setImage("nobatch/diwen1_paibingbuzhen.png")
    card_bg:setSize(cc.size(300,420))
    card_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(card_bg)
    card_bg:setPositionInContainer(cc.p(155,212))
    table_mingchenxiangqing_card["card_bg"] = card_bg

    local top_frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    top_frame:setSize(cc.size(300,50))
    top_frame:setAnchorPoint(cc.p(0.5,0.5))
    top_frame:setScaleY(-1)
    mingchenxiangqing_card:appendComponent(top_frame)
    top_frame:setPositionInContainer(cc.p(152,25))
    table_mingchenxiangqing_card["top_frame"] = top_frame

    local dizuo_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    dizuo_image:setSize(cc.size(300,40))
    dizuo_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(dizuo_image)
    dizuo_image:setPositionInContainer(cc.p(153,402))
    table_mingchenxiangqing_card["dizuo_image"] = dizuo_image

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(98.5,23.5))
    table_mingchenxiangqing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(125.5,23.5))
    table_mingchenxiangqing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(152.5,23.5))
    table_mingchenxiangqing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(177.5,23.5))
    table_mingchenxiangqing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(202.5,23.5))
    table_mingchenxiangqing_card["star_dark"] = star_dark

    local xq_star1_image = fc.FExtensionsImage:create()
    xq_star1_image:setImage("batch_ui/xingxing.png")
    xq_star1_image:setSize(cc.size(25,27))
    xq_star1_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_star1_image)
    xq_star1_image:setPositionInContainer(cc.p(98.5,23.5))
    table_mingchenxiangqing_card["xq_star1_image"] = xq_star1_image

    local xq_star2_image = fc.FExtensionsImage:create()
    xq_star2_image:setImage("batch_ui/xingxing.png")
    xq_star2_image:setSize(cc.size(25,27))
    xq_star2_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_star2_image)
    xq_star2_image:setPositionInContainer(cc.p(125.5,23.5))
    table_mingchenxiangqing_card["xq_star2_image"] = xq_star2_image

    local xq_star3_image = fc.FExtensionsImage:create()
    xq_star3_image:setImage("batch_ui/xingxing.png")
    xq_star3_image:setSize(cc.size(25,27))
    xq_star3_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_star3_image)
    xq_star3_image:setPositionInContainer(cc.p(152.5,23.5))
    table_mingchenxiangqing_card["xq_star3_image"] = xq_star3_image

    local xq_star4_image = fc.FExtensionsImage:create()
    xq_star4_image:setImage("batch_ui/xingxing.png")
    xq_star4_image:setSize(cc.size(25,27))
    xq_star4_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_star4_image)
    xq_star4_image:setPositionInContainer(cc.p(177.5,23.5))
    table_mingchenxiangqing_card["xq_star4_image"] = xq_star4_image

    local xq_star5_image = fc.FExtensionsImage:create()
    xq_star5_image:setImage("batch_ui/xingxing.png")
    xq_star5_image:setSize(cc.size(25,27))
    xq_star5_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_star5_image)
    xq_star5_image:setPositionInContainer(cc.p(202.5,23.5))
    table_mingchenxiangqing_card["xq_star5_image"] = xq_star5_image

    local xiangqing_shengji_button = fc.FScaleButton:create()
    xiangqing_shengji_button:setSize(cc.size(130,53))
    xiangqing_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    xiangqing_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchenxiangqing_card:appendComponent(xiangqing_shengji_button)
    xiangqing_shengji_button:setPositionInContainer(cc.p(224,490.5))
    table_mingchenxiangqing_card["xiangqing_shengji_button"] = xiangqing_shengji_button

    local sheng = fc.FExtensionsImage:create()
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    xiangqing_shengji_button:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(41,26))
    table_mingchenxiangqing_card["sheng"] = sheng

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    xiangqing_shengji_button:appendComponent(ji)
    ji:setPositionInContainer(cc.p(89,26))
    table_mingchenxiangqing_card["ji"] = ji

    local xq_card_image = fc.FExtensionsImage:create()
    xq_card_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_card_image)
    xq_card_image:setPositionInContainer(cc.p(154,217.5))
    table_mingchenxiangqing_card["xq_card_image"] = xq_card_image

    local xq_kapai_yimanji_image = fc.FExtensionsImage:create()
    xq_kapai_yimanji_image:setImage("batch_ui/yimanji_yinzhang.png")
    xq_kapai_yimanji_image:setSize(cc.size(83,65))
    xq_kapai_yimanji_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_kapai_yimanji_image)
    xq_kapai_yimanji_image:setPositionInContainer(cc.p(242.5,300.5))
    table_mingchenxiangqing_card["xq_kapai_yimanji_image"] = xq_kapai_yimanji_image

    local ciguan_button = fc.FScaleButton:create()
    ciguan_button:setSize(cc.size(130,53))
    ciguan_button:setAnchorPoint(cc.p(0.5,0.5))
    ciguan_button:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchenxiangqing_card:appendComponent(ciguan_button)
    ciguan_button:setPositionInContainer(cc.p(84,490.5))
    table_mingchenxiangqing_card["ciguan_button"] = ciguan_button

    local ci = fc.FExtensionsImage:create()
    ci:setImage("batch_ui/ci_uizi.png")
    ci:setSize(cc.size(32,32))
    ci:setAnchorPoint(cc.p(0.5,0.5))
    ciguan_button:appendComponent(ci)
    ci:setPositionInContainer(cc.p(41,26))
    table_mingchenxiangqing_card["ci"] = ci

    local guan = fc.FExtensionsImage:create()
    guan:setImage("batch_ui/guan1_uizi.png")
    guan:setSize(cc.size(32,32))
    guan:setAnchorPoint(cc.p(0.5,0.5))
    ciguan_button:appendComponent(guan)
    guan:setPositionInContainer(cc.p(89,26))
    table_mingchenxiangqing_card["guan"] = guan

    local guangZhibg = fc.FExtensionsImage:create()
    guangZhibg:setImage("batch_ui/guanzhi_ditu.png")
    guangZhibg:setSize(cc.size(85,39))
    guangZhibg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(guangZhibg)
    guangZhibg:setPositionInContainer(cc.p(242.5,359.5))
    table_mingchenxiangqing_card["guangZhibg"] = guangZhibg

    local guanzhi_label = fc.FLabel:createBMFont()
    guanzhi_label:setSize(cc.size(59,19))
    guanzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    guanzhi_label:setFontSize(20)
    guanzhi_label:setString("等级：")
    guanzhi_label:setColor(cc.c3b(0,0,255))
    mingchenxiangqing_card:appendComponent(guanzhi_label)
    guanzhi_label:setPositionInContainer(cc.p(243.5,356.5))
    table_mingchenxiangqing_card["guanzhi_label"] = guanzhi_label

    local bottom_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_bar:setSize(cc.size(306,13))
    bottom_bar:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(bottom_bar)
    bottom_bar:setPositionInContainer(cc.p(153,529.5))
    table_mingchenxiangqing_card["bottom_bar"] = bottom_bar

    local detail_card_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    detail_card_bg:setSize(cc.size(25,536))
    detail_card_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(detail_card_bg)
    detail_card_bg:setPositionInContainer(cc.p(2.5,268))
    table_mingchenxiangqing_card["detail_card_bg"] = detail_card_bg

    local detail_card_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    detail_card_bg:setSize(cc.size(25,536))
    detail_card_bg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(detail_card_bg)
    detail_card_bg:setPositionInContainer(cc.p(303.5,268))
    table_mingchenxiangqing_card["detail_card_bg"] = detail_card_bg

    local xq_label_di_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    xq_label_di_scale9:setSize(cc.size(40,28))
    xq_label_di_scale9:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_label_di_scale9)
    xq_label_di_scale9:setPositionInContainer(cc.p(95,447))
    table_mingchenxiangqing_card["xq_label_di_scale9"] = xq_label_di_scale9

    local xq_label_di_scale92 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    xq_label_di_scale92:setSize(cc.size(80,28))
    xq_label_di_scale92:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_label_di_scale92)
    xq_label_di_scale92:setPositionInContainer(cc.p(250,446))
    table_mingchenxiangqing_card["xq_label_di_scale92"] = xq_label_di_scale92

    local xq_tx_dengji_label = fc.FLabel:createBMFont()
    xq_tx_dengji_label:setSize(cc.size(59,19))
    xq_tx_dengji_label:setAnchorPoint(cc.p(0.5,0.5))
    xq_tx_dengji_label:setFontSize(20)
    xq_tx_dengji_label:setString("等级：")
    xq_tx_dengji_label:setColor(cc.c3b(139,255,240))
    mingchenxiangqing_card:appendComponent(xq_tx_dengji_label)
    xq_tx_dengji_label:setPositionInContainer(cc.p(52.5,445.5))
    table_mingchenxiangqing_card["xq_tx_dengji_label"] = xq_tx_dengji_label

    local xq_tx_dengji_num_label = fc.FLabel:createBMFont()
    xq_tx_dengji_num_label:setSize(cc.size(78,19))
    xq_tx_dengji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xq_tx_dengji_num_label:setFontSize(21)
    xq_tx_dengji_num_label:setString("100/100")
    xq_tx_dengji_num_label:setColor(cc.c3b(0,255,0))
    mingchenxiangqing_card:appendComponent(xq_tx_dengji_num_label)
    xq_tx_dengji_num_label:setPositionInContainer(cc.p(103,445.5))
    table_mingchenxiangqing_card["xq_tx_dengji_num_label"] = xq_tx_dengji_num_label

    local xq_tx_jingyan_label = fc.FLabel:createBMFont()
    xq_tx_jingyan_label:setSize(cc.size(59,19))
    xq_tx_jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    xq_tx_jingyan_label:setFontSize(20)
    xq_tx_jingyan_label:setString("经验：")
    xq_tx_jingyan_label:setColor(cc.c3b(139,255,240))
    mingchenxiangqing_card:appendComponent(xq_tx_jingyan_label)
    xq_tx_jingyan_label:setPositionInContainer(cc.p(178.5,445.5))
    table_mingchenxiangqing_card["xq_tx_jingyan_label"] = xq_tx_jingyan_label

    local xq_tx_jingyan_num_label = fc.FLabel:createBMFont()
    xq_tx_jingyan_num_label:setSize(cc.size(78,19))
    xq_tx_jingyan_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xq_tx_jingyan_num_label:setFontSize(21)
    xq_tx_jingyan_num_label:setString("100/100")
    xq_tx_jingyan_num_label:setColor(cc.c3b(0,255,0))
    mingchenxiangqing_card:appendComponent(xq_tx_jingyan_num_label)
    xq_tx_jingyan_num_label:setPositionInContainer(cc.p(247,445.5))
    table_mingchenxiangqing_card["xq_tx_jingyan_num_label"] = xq_tx_jingyan_num_label

    local xq_att_image = fc.FExtensionsImage:create()
    xq_att_image:setImage("batch_ui/gongji_tubiao.png")
    xq_att_image:setSize(cc.size(25,35))
    xq_att_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_att_image)
    xq_att_image:setPositionInContainer(cc.p(66.5,404.5))
    table_mingchenxiangqing_card["xq_att_image"] = xq_att_image

    local xq_def_image = fc.FExtensionsImage:create()
    xq_def_image:setImage("batch_ui/fangyu_tubiao.png")
    xq_def_image:setSize(cc.size(25,35))
    xq_def_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_card:appendComponent(xq_def_image)
    xq_def_image:setPositionInContainer(cc.p(186.5,405.5))
    table_mingchenxiangqing_card["xq_def_image"] = xq_def_image

    local xq_tx_gongji_num_label = fc.FLabel:createBMFont()
    xq_tx_gongji_num_label:setSize(cc.size(78,19))
    xq_tx_gongji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xq_tx_gongji_num_label:setFontSize(21)
    xq_tx_gongji_num_label:setString("100/100")
    xq_tx_gongji_num_label:setColor(cc.c3b(0,255,0))
    mingchenxiangqing_card:appendComponent(xq_tx_gongji_num_label)
    xq_tx_gongji_num_label:setPositionInContainer(cc.p(120,404.5))
    table_mingchenxiangqing_card["xq_tx_gongji_num_label"] = xq_tx_gongji_num_label

    local xq_tx_fangyu_num_label = fc.FLabel:createBMFont()
    xq_tx_fangyu_num_label:setSize(cc.size(78,19))
    xq_tx_fangyu_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xq_tx_fangyu_num_label:setFontSize(21)
    xq_tx_fangyu_num_label:setString("100/100")
    xq_tx_fangyu_num_label:setColor(cc.c3b(0,255,0))
    mingchenxiangqing_card:appendComponent(xq_tx_fangyu_num_label)
    xq_tx_fangyu_num_label:setPositionInContainer(cc.p(234,404.5))
    table_mingchenxiangqing_card["xq_tx_fangyu_num_label"] = xq_tx_fangyu_num_label

    return table_mingchenxiangqing_card

end

