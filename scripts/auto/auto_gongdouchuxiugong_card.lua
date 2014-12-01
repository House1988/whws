function creategongdouchuxiugong_card()

    local table_gongdouchuxiugong_card = {}

    local gongdouchuxiugong_card = fc.FContainerPanel:create()
    gongdouchuxiugong_card:setSize(cc.size(169,238))
    table_gongdouchuxiugong_card["gongdouchuxiugong_card"] = gongdouchuxiugong_card

    local gd_card_bg_image = fc.FExtensionsImage:create()
    gd_card_bg_image:setImage("nobatch/touxiangdikuang_meinv1.png")
    gd_card_bg_image:setSize(cc.size(140,150))
    gd_card_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_bg_image)
    gd_card_bg_image:setPositionInContainer(cc.p(84,115))
    table_gongdouchuxiugong_card["gd_card_bg_image"] = gd_card_bg_image

    local gd_card_touxiangkuang_image = fc.FExtensionsImage:create()
    gd_card_touxiangkuang_image:setImage("batch_ui/baipinzhi_kuang.png")
    gd_card_touxiangkuang_image:setSize(cc.size(104,104))
    gd_card_touxiangkuang_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_touxiangkuang_image)
    gd_card_touxiangkuang_image:setPositionInContainer(cc.p(84,104))
    table_gongdouchuxiugong_card["gd_card_touxiangkuang_image"] = gd_card_touxiangkuang_image

    local gd_card_touxiang_image = fc.FExtensionsImage:create()
    gd_card_touxiang_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_touxiang_image)
    gd_card_touxiang_image:setPositionInContainer(cc.p(84.5,103.5))
    table_gongdouchuxiugong_card["gd_card_touxiang_image"] = gd_card_touxiang_image

    local xing_di = fc.FExtensionsImage:create()
    xing_di:setImage("batch_ui/xingxingdiwen.png")
    xing_di:setSize(cc.size(140,26))
    xing_di:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(xing_di)
    xing_di:setPositionInContainer(cc.p(84,177))
    table_gongdouchuxiugong_card["xing_di"] = xing_di

    local up_bar = fc.FExtensionsImage:create()
    up_bar:setImage("batch_ui/tongyongdi1.png")
    up_bar:setSize(cc.size(140,35))
    up_bar:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(up_bar)
    up_bar:setPositionInContainer(cc.p(84,27.5))
    table_gongdouchuxiugong_card["up_bar"] = up_bar

    local down_bar = fc.FExtensionsImage:create()
    down_bar:setImage("batch_ui/tongyongdi1.png")
    down_bar:setSize(cc.size(140,35))
    down_bar:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(down_bar)
    down_bar:setPositionInContainer(cc.p(84,208.5))
    table_gongdouchuxiugong_card["down_bar"] = down_bar

    local gd_card_lv_label = fc.FLabel:createBMFont()
    gd_card_lv_label:setSize(cc.size(80,30))
    gd_card_lv_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_card_lv_label:setFontSize(21)
    gd_card_lv_label:setString("LV15")
    gd_card_lv_label:setColor(cc.c3b(137,32,18))
    gongdouchuxiugong_card:appendComponent(gd_card_lv_label)
    gd_card_lv_label:setPositionInContainer(cc.p(84,203))
    table_gongdouchuxiugong_card["gd_card_lv_label"] = gd_card_lv_label

    local gd_card_name_label = fc.FLabel:createBMFont()
    gd_card_name_label:setSize(cc.size(110,30))
    gd_card_name_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_card_name_label:setFontSize(20)
    gd_card_name_label:setString("步兵步兵步")
    gd_card_name_label:setColor(cc.c3b(137,32,18))
    gongdouchuxiugong_card:appendComponent(gd_card_name_label)
    gd_card_name_label:setPositionInContainer(cc.p(85,27))
    table_gongdouchuxiugong_card["gd_card_name_label"] = gd_card_name_label

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(30.5,175.5))
    table_gongdouchuxiugong_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(57.5,175.5))
    table_gongdouchuxiugong_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(84.5,175.5))
    table_gongdouchuxiugong_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(111.5,175.5))
    table_gongdouchuxiugong_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(25,27))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(138.5,175.5))
    table_gongdouchuxiugong_card["star_dark"] = star_dark

    local gd_card_star1_image = fc.FExtensionsImage:create()
    gd_card_star1_image:setImage("batch_ui/xingxing.png")
    gd_card_star1_image:setSize(cc.size(25,27))
    gd_card_star1_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_star1_image)
    gd_card_star1_image:setPositionInContainer(cc.p(30.5,175.5))
    table_gongdouchuxiugong_card["gd_card_star1_image"] = gd_card_star1_image

    local gd_card_star2_image = fc.FExtensionsImage:create()
    gd_card_star2_image:setImage("batch_ui/xingxing.png")
    gd_card_star2_image:setSize(cc.size(25,27))
    gd_card_star2_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_star2_image)
    gd_card_star2_image:setPositionInContainer(cc.p(57.5,175.5))
    table_gongdouchuxiugong_card["gd_card_star2_image"] = gd_card_star2_image

    local gd_card_star3_image = fc.FExtensionsImage:create()
    gd_card_star3_image:setImage("batch_ui/xingxing.png")
    gd_card_star3_image:setSize(cc.size(25,27))
    gd_card_star3_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_star3_image)
    gd_card_star3_image:setPositionInContainer(cc.p(84.5,175.5))
    table_gongdouchuxiugong_card["gd_card_star3_image"] = gd_card_star3_image

    local gd_card_star4_image = fc.FExtensionsImage:create()
    gd_card_star4_image:setImage("batch_ui/xingxing.png")
    gd_card_star4_image:setSize(cc.size(25,27))
    gd_card_star4_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_star4_image)
    gd_card_star4_image:setPositionInContainer(cc.p(111.5,175.5))
    table_gongdouchuxiugong_card["gd_card_star4_image"] = gd_card_star4_image

    local gd_card_star5_image = fc.FExtensionsImage:create()
    gd_card_star5_image:setImage("batch_ui/xingxing.png")
    gd_card_star5_image:setSize(cc.size(25,27))
    gd_card_star5_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_star5_image)
    gd_card_star5_image:setPositionInContainer(cc.p(138.5,175.5))
    table_gongdouchuxiugong_card["gd_card_star5_image"] = gd_card_star5_image

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/touxiangdikuang_meinv2.png",cc.rect(53,54,5,2))
    card_rect:setSize(cc.size(160,232))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(83,119))
    table_gongdouchuxiugong_card["card_rect"] = card_rect

    local select_bg = fc.FExtensionsImage:create()
    select_bg:setImage("batch_ui/quanxuan_dikuang.png")
    select_bg:setSize(cc.size(47,47))
    select_bg:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(select_bg)
    select_bg:setPositionInContainer(cc.p(137.5,207.5))
    table_gongdouchuxiugong_card["select_bg"] = select_bg

    local gd_card_xuanzhong_image = fc.FExtensionsImage:create()
    gd_card_xuanzhong_image:setImage("batch_ui/xuanzhonggou.png")
    gd_card_xuanzhong_image:setSize(cc.size(72,63))
    gd_card_xuanzhong_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_xuanzhong_image)
    gd_card_xuanzhong_image:setPositionInContainer(cc.p(133,205.5))
    table_gongdouchuxiugong_card["gd_card_xuanzhong_image"] = gd_card_xuanzhong_image

    local chuxiugong_xuanzhong = fc.FScale9Image:createWithBatchUIFrame("nobatch/xuanzhongkuang_meinv.png",cc.rect(60,60,2,2))
    chuxiugong_xuanzhong:setSize(cc.size(169,238))
    chuxiugong_xuanzhong:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(chuxiugong_xuanzhong)
    chuxiugong_xuanzhong:setPositionInContainer(cc.p(84.5,119))
    table_gongdouchuxiugong_card["chuxiugong_xuanzhong"] = chuxiugong_xuanzhong

    local gd_card_yizhuzhen = fc.FExtensionsImage:create()
    gd_card_yizhuzhen:setImage("batch_ui/yizhuzhen.png")
    gd_card_yizhuzhen:setSize(cc.size(74,47))
    gd_card_yizhuzhen:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_yizhuzhen)
    gd_card_yizhuzhen:setPositionInContainer(cc.p(136,148.5))
    table_gongdouchuxiugong_card["gd_card_yizhuzhen"] = gd_card_yizhuzhen

    local gd_card_yihuaiyun = fc.FExtensionsImage:create()
    gd_card_yihuaiyun:setImage("batch_ui/huaiyunzhong_tubiao.png")
    gd_card_yihuaiyun:setSize(cc.size(62,60))
    gd_card_yihuaiyun:setAnchorPoint(cc.p(0.5,0.5))
    gongdouchuxiugong_card:appendComponent(gd_card_yihuaiyun)
    gd_card_yihuaiyun:setPositionInContainer(cc.p(34,70))
    table_gongdouchuxiugong_card["gd_card_yihuaiyun"] = gd_card_yihuaiyun

    return table_gongdouchuxiugong_card

end

