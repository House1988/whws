function createmeinvshuxing_miaoshu()

    local table_meinvshuxing_miaoshu = {}

    local meinvshuxing_miaoshu = fc.FContainerPanel:create()
    meinvshuxing_miaoshu:setSize(cc.size(350,420))
    table_meinvshuxing_miaoshu["meinvshuxing_miaoshu"] = meinvshuxing_miaoshu

    local bg = fc.FExtensionsImage:create()
    bg:setImage("batch_ui/meinvpinzhi_lv.png")
    bg:setSize(cc.size(300,354))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(bg)
    bg:setPositionInContainer(cc.p(175,233))
    table_meinvshuxing_miaoshu["bg"] = bg

    local mnsx_touxiang_image = fc.FExtensionsImage:create()
    mnsx_touxiang_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_touxiang_image)
    mnsx_touxiang_image:setPositionInContainer(cc.p(175,247))
    table_meinvshuxing_miaoshu["mnsx_touxiang_image"] = mnsx_touxiang_image

    local bottomBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar:setSize(cc.size(350,13))
    bottomBar:setAnchorPoint(cc.p(0.5,0.5))
    bottomBar:setScaleY(-1)
    meinvshuxing_miaoshu:appendComponent(bottomBar)
    bottomBar:setPositionInContainer(cc.p(175,413.5))
    table_meinvshuxing_miaoshu["bottomBar"] = bottomBar

    local mnsx_huaiyun_tag1 = fc.FExtensionsImage:create()
    mnsx_huaiyun_tag1:setImage("batch_ui/chongxing_anniu.png")
    mnsx_huaiyun_tag1:setSize(cc.size(101,92))
    mnsx_huaiyun_tag1:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_huaiyun_tag1)
    mnsx_huaiyun_tag1:setPositionInContainer(cc.p(174.5,350))
    table_meinvshuxing_miaoshu["mnsx_huaiyun_tag1"] = mnsx_huaiyun_tag1

    local mnsx_huaiyun_tag2 = fc.FExtensionsImage:create()
    mnsx_huaiyun_tag2:setImage("batch_ui/huaiyunzhong.png")
    mnsx_huaiyun_tag2:setSize(cc.size(74,30))
    mnsx_huaiyun_tag2:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_huaiyun_tag2)
    mnsx_huaiyun_tag2:setPositionInContainer(cc.p(175,342))
    table_meinvshuxing_miaoshu["mnsx_huaiyun_tag2"] = mnsx_huaiyun_tag2

    local topbar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar:setSize(cc.size(350,13))
    topbar:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(topbar)
    topbar:setPositionInContainer(cc.p(175,13.5))
    table_meinvshuxing_miaoshu["topbar"] = topbar

    local conlb = fc.FExtensionsImage:create()
    conlb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conlb:setSize(cc.size(25,27))
    conlb:setFlipType(8)
    conlb:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(conlb)
    conlb:setPositionInContainer(cc.p(17.5,398.5))
    table_meinvshuxing_miaoshu["conlb"] = conlb

    local conrb = fc.FExtensionsImage:create()
    conrb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conrb:setSize(cc.size(25,27))
    conrb:setFlipType(4)
    conrb:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(conrb)
    conrb:setPositionInContainer(cc.p(332.5,398.5))
    table_meinvshuxing_miaoshu["conrb"] = conrb

    local conlb = fc.FExtensionsImage:create()
    conlb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conlb:setSize(cc.size(25,27))
    conlb:setFlipType(8)
    conlb:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(conlb)
    conlb:setPositionInContainer(cc.p(362.5,398.5))
    table_meinvshuxing_miaoshu["conlb"] = conlb

    local mnsx_xingtiao_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    mnsx_xingtiao_image:setSize(cc.size(350,50))
    mnsx_xingtiao_image:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_xingtiao_image:setScaleY(-1)
    meinvshuxing_miaoshu:appendComponent(mnsx_xingtiao_image)
    mnsx_xingtiao_image:setPositionInContainer(cc.p(175,45))
    table_meinvshuxing_miaoshu["mnsx_xingtiao_image"] = mnsx_xingtiao_image

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(104.5,44.5))
    table_meinvshuxing_miaoshu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(139.5,44.5))
    table_meinvshuxing_miaoshu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(174.5,44.5))
    table_meinvshuxing_miaoshu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(209.5,44.5))
    table_meinvshuxing_miaoshu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(244.5,44.5))
    table_meinvshuxing_miaoshu["xing_dark"] = xing_dark

    local mnsx_xingxing1_image = fc.FExtensionsImage:create()
    mnsx_xingxing1_image:setImage("batch_ui/xingxing.png")
    mnsx_xingxing1_image:setSize(cc.size(25,27))
    mnsx_xingxing1_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_xingxing1_image)
    mnsx_xingxing1_image:setPositionInContainer(cc.p(104.5,44.5))
    table_meinvshuxing_miaoshu["mnsx_xingxing1_image"] = mnsx_xingxing1_image

    local mnsx_xingxing2_image = fc.FExtensionsImage:create()
    mnsx_xingxing2_image:setImage("batch_ui/xingxing.png")
    mnsx_xingxing2_image:setSize(cc.size(25,27))
    mnsx_xingxing2_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_xingxing2_image)
    mnsx_xingxing2_image:setPositionInContainer(cc.p(138.5,44.5))
    table_meinvshuxing_miaoshu["mnsx_xingxing2_image"] = mnsx_xingxing2_image

    local mnsx_xingxing3_image = fc.FExtensionsImage:create()
    mnsx_xingxing3_image:setImage("batch_ui/xingxing.png")
    mnsx_xingxing3_image:setSize(cc.size(25,27))
    mnsx_xingxing3_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_xingxing3_image)
    mnsx_xingxing3_image:setPositionInContainer(cc.p(174.5,44.5))
    table_meinvshuxing_miaoshu["mnsx_xingxing3_image"] = mnsx_xingxing3_image

    local mnsx_xingxing4_image = fc.FExtensionsImage:create()
    mnsx_xingxing4_image:setImage("batch_ui/xingxing.png")
    mnsx_xingxing4_image:setSize(cc.size(25,27))
    mnsx_xingxing4_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_xingxing4_image)
    mnsx_xingxing4_image:setPositionInContainer(cc.p(208.5,44.5))
    table_meinvshuxing_miaoshu["mnsx_xingxing4_image"] = mnsx_xingxing4_image

    local mnsx_xingxing5_image = fc.FExtensionsImage:create()
    mnsx_xingxing5_image:setImage("batch_ui/xingxing.png")
    mnsx_xingxing5_image:setSize(cc.size(25,27))
    mnsx_xingxing5_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(mnsx_xingxing5_image)
    mnsx_xingxing5_image:setPositionInContainer(cc.p(244.5,44.5))
    table_meinvshuxing_miaoshu["mnsx_xingxing5_image"] = mnsx_xingxing5_image

    local conlt = fc.FExtensionsImage:create()
    conlt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conlt:setSize(cc.size(25,27))
    conlt:setFlipType(2)
    conlt:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(conlt)
    conlt:setPositionInContainer(cc.p(17.5,32.5))
    table_meinvshuxing_miaoshu["conlt"] = conlt

    local conrt = fc.FExtensionsImage:create()
    conrt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conrt:setSize(cc.size(25,27))
    conrt:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(conrt)
    conrt:setPositionInContainer(cc.p(332.5,33.5))
    table_meinvshuxing_miaoshu["conrt"] = conrt

    local conlt = fc.FExtensionsImage:create()
    conlt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conlt:setSize(cc.size(25,27))
    conlt:setFlipType(2)
    conlt:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(conlt)
    conlt:setPositionInContainer(cc.p(362.5,33.5))
    table_meinvshuxing_miaoshu["conlt"] = conlt

    local sidebar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sidebar:setSize(cc.size(25,413))
    sidebar:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(sidebar)
    sidebar:setPositionInContainer(cc.p(2.5,213.5))
    table_meinvshuxing_miaoshu["sidebar"] = sidebar

    local sidebar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sidebar:setSize(cc.size(25,413))
    sidebar:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(sidebar)
    sidebar:setPositionInContainer(cc.p(347.5,213.5))
    table_meinvshuxing_miaoshu["sidebar"] = sidebar

    local titile_image = fc.FExtensionsImage:create()
    titile_image:setImage("batch_ui/changzai_cefeng.png")
    titile_image:setSize(cc.size(51,204))
    titile_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_miaoshu:appendComponent(titile_image)
    titile_image:setPositionInContainer(cc.p(345.5,109))
    table_meinvshuxing_miaoshu["titile_image"] = titile_image

    return table_meinvshuxing_miaoshu

end

