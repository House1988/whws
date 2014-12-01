function createhougong_tangquangong_meinvtu()

    local table_hougong_tangquangong_meinvtu = {}

    local hougong_tangquangong_meinvtu = fc.FContainerPanel:create()
    hougong_tangquangong_meinvtu:setSize(cc.size(420,440))
    table_hougong_tangquangong_meinvtu["hougong_tangquangong_meinvtu"] = hougong_tangquangong_meinvtu

    local bg = fc.FExtensionsImage:create()
    bg:setImage("batch_ui/meinvpinzhi_lan.png")
    bg:setSize(cc.size(400,300))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(bg)
    bg:setPositionInContainer(cc.p(210,212))
    table_hougong_tangquangong_meinvtu["bg"] = bg

    local lianziL = fc.FExtensionsImage:create()
    lianziL:setImage("nobatch/lianzi_tangquanxinggong.png")
    lianziL:setSize(cc.size(85,370))
    lianziL:setFlipType(2)
    lianziL:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(lianziL)
    lianziL:setPositionInContainer(cc.p(52.5,185))
    table_hougong_tangquangong_meinvtu["lianziL"] = lianziL

    local lianziR = fc.FExtensionsImage:create()
    lianziR:setImage("nobatch/lianzi_tangquanxinggong.png")
    lianziR:setSize(cc.size(85,370))
    lianziR:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(lianziR)
    lianziR:setPositionInContainer(cc.p(367.5,185))
    table_hougong_tangquangong_meinvtu["lianziR"] = lianziR

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(126.5,36.5))
    table_hougong_tangquangong_meinvtu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(162.5,36.5))
    table_hougong_tangquangong_meinvtu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(196.5,36.5))
    table_hougong_tangquangong_meinvtu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(231.5,36.5))
    table_hougong_tangquangong_meinvtu["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(25,27))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(266.5,36.5))
    table_hougong_tangquangong_meinvtu["xing_dark"] = xing_dark

    local hg_tqg_mv_image_naked = fc.FExtensionsImage:create()
    hg_tqg_mv_image_naked:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_image_naked)
    hg_tqg_mv_image_naked:setPositionInContainer(cc.p(210,217))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_image_naked"] = hg_tqg_mv_image_naked

    local hg_tqg_mv_image = fc.FExtensionsImage:create()
    hg_tqg_mv_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_image)
    hg_tqg_mv_image:setPositionInContainer(cc.p(210,217))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_image"] = hg_tqg_mv_image

    local topBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,40))
    topBg:setSize(cc.size(300,50))
    topBg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(topBg)
    topBg:setPositionInContainer(cc.p(210,37))
    table_hougong_tangquangong_meinvtu["topBg"] = topBg

    local hg_tqg_mv_xing1_image = fc.FExtensionsImage:create()
    hg_tqg_mv_xing1_image:setImage("batch_ui/xingxing.png")
    hg_tqg_mv_xing1_image:setSize(cc.size(25,27))
    hg_tqg_mv_xing1_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_xing1_image)
    hg_tqg_mv_xing1_image:setPositionInContainer(cc.p(140.5,36.5))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_xing1_image"] = hg_tqg_mv_xing1_image

    local hg_tqg_mv_xing2_image = fc.FExtensionsImage:create()
    hg_tqg_mv_xing2_image:setImage("batch_ui/xingxing.png")
    hg_tqg_mv_xing2_image:setSize(cc.size(25,27))
    hg_tqg_mv_xing2_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_xing2_image)
    hg_tqg_mv_xing2_image:setPositionInContainer(cc.p(176.5,36.5))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_xing2_image"] = hg_tqg_mv_xing2_image

    local hg_tqg_mv_xing3_image = fc.FExtensionsImage:create()
    hg_tqg_mv_xing3_image:setImage("batch_ui/xingxing.png")
    hg_tqg_mv_xing3_image:setSize(cc.size(25,27))
    hg_tqg_mv_xing3_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_xing3_image)
    hg_tqg_mv_xing3_image:setPositionInContainer(cc.p(210.5,36.5))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_xing3_image"] = hg_tqg_mv_xing3_image

    local hg_tqg_mv_xing4_image = fc.FExtensionsImage:create()
    hg_tqg_mv_xing4_image:setImage("batch_ui/xingxing.png")
    hg_tqg_mv_xing4_image:setSize(cc.size(25,27))
    hg_tqg_mv_xing4_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_xing4_image)
    hg_tqg_mv_xing4_image:setPositionInContainer(cc.p(244.5,36.5))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_xing4_image"] = hg_tqg_mv_xing4_image

    local hg_tqg_mv_xing5_image = fc.FExtensionsImage:create()
    hg_tqg_mv_xing5_image:setImage("batch_ui/xingxing.png")
    hg_tqg_mv_xing5_image:setSize(cc.size(25,27))
    hg_tqg_mv_xing5_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(hg_tqg_mv_xing5_image)
    hg_tqg_mv_xing5_image:setPositionInContainer(cc.p(280.5,36.5))
    table_hougong_tangquangong_meinvtu["hg_tqg_mv_xing5_image"] = hg_tqg_mv_xing5_image

    local topBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topBar:setSize(cc.size(420,13))
    topBar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(topBar)
    topBar:setPositionInContainer(cc.p(210,6.5))
    table_hougong_tangquangong_meinvtu["topBar"] = topBar

    local connerLT = fc.FExtensionsImage:create()
    connerLT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerLT:setSize(cc.size(25,27))
    connerLT:setFlipType(2)
    connerLT:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerLT)
    connerLT:setPositionInContainer(cc.p(27.5,23.5))
    table_hougong_tangquangong_meinvtu["connerLT"] = connerLT

    local connerRT = fc.FExtensionsImage:create()
    connerRT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerRT:setSize(cc.size(25,27))
    connerRT:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerRT)
    connerRT:setPositionInContainer(cc.p(392.5,23.5))
    table_hougong_tangquangong_meinvtu["connerRT"] = connerRT

    local connerLT = fc.FExtensionsImage:create()
    connerLT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerLT:setSize(cc.size(25,27))
    connerLT:setFlipType(2)
    connerLT:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerLT)
    connerLT:setPositionInContainer(cc.p(422.5,23.5))
    table_hougong_tangquangong_meinvtu["connerLT"] = connerLT

    local connerRT = fc.FExtensionsImage:create()
    connerRT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerRT:setSize(cc.size(25,27))
    connerRT:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerRT)
    connerRT:setPositionInContainer(cc.p(-2.5,23.5))
    table_hougong_tangquangong_meinvtu["connerRT"] = connerRT

    local connerRB = fc.FExtensionsImage:create()
    connerRB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerRB:setSize(cc.size(25,27))
    connerRB:setFlipType(4)
    connerRB:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerRB)
    connerRB:setPositionInContainer(cc.p(-2.5,361.5))
    table_hougong_tangquangong_meinvtu["connerRB"] = connerRB

    local connerLB = fc.FExtensionsImage:create()
    connerLB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerLB:setSize(cc.size(25,27))
    connerLB:setFlipType(8)
    connerLB:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerLB)
    connerLB:setPositionInContainer(cc.p(422.5,361.5))
    table_hougong_tangquangong_meinvtu["connerLB"] = connerLB

    local bottom_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_bar:setSize(cc.size(420,13))
    bottom_bar:setAnchorPoint(cc.p(0.5,0.5))
    bottom_bar:setScaleY(-1)
    hougong_tangquangong_meinvtu:appendComponent(bottom_bar)
    bottom_bar:setPositionInContainer(cc.p(210,368.5))
    table_hougong_tangquangong_meinvtu["bottom_bar"] = bottom_bar

    local connerLB = fc.FExtensionsImage:create()
    connerLB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerLB:setSize(cc.size(25,27))
    connerLB:setFlipType(8)
    connerLB:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerLB)
    connerLB:setPositionInContainer(cc.p(27.5,361.5))
    table_hougong_tangquangong_meinvtu["connerLB"] = connerLB

    local connerRB = fc.FExtensionsImage:create()
    connerRB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    connerRB:setSize(cc.size(25,27))
    connerRB:setFlipType(4)
    connerRB:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(connerRB)
    connerRB:setPositionInContainer(cc.p(392.5,361.5))
    table_hougong_tangquangong_meinvtu["connerRB"] = connerRB

    local sidebar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sidebar:setSize(cc.size(25,375))
    sidebar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(sidebar)
    sidebar:setPositionInContainer(cc.p(12.5,187.5))
    table_hougong_tangquangong_meinvtu["sidebar"] = sidebar

    local sidebar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sidebar:setSize(cc.size(25,375))
    sidebar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(sidebar)
    sidebar:setPositionInContainer(cc.p(407.5,187.5))
    table_hougong_tangquangong_meinvtu["sidebar"] = sidebar

    local titile_image = fc.FExtensionsImage:create()
    titile_image:setImage("batch_ui/changzai_cefeng.png")
    titile_image:setSize(cc.size(51,204))
    titile_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_meinvtu:appendComponent(titile_image)
    titile_image:setPositionInContainer(cc.p(385.5,102))
    table_hougong_tangquangong_meinvtu["titile_image"] = titile_image

    return table_hougong_tangquangong_meinvtu

end

