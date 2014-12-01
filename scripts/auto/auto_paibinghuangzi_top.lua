function createpaibinghuangzi_top()

    local table_paibinghuangzi_top = {}

    local paibinghuangzi_top = fc.FContainerPanel:create()
    paibinghuangzi_top:setSize(cc.size(960,640))
    table_paibinghuangzi_top["paibinghuangzi_top"] = paibinghuangzi_top

    local paibing_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    paibing_bg_image:setSize(cc.size(960,640))
    paibing_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(paibing_bg_image)
    paibing_bg_image:setPositionInContainer(cc.p(480,320))
    table_paibinghuangzi_top["paibing_bg_image"] = paibing_bg_image

    local biaoti_image = fc.FExtensionsImage:create()
    biaoti_image:setImage("nobatch/title_mingchen_.png")
    biaoti_image:setSize(cc.size(483,67))
    biaoti_image:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(biaoti_image)
    biaoti_image:setPositionInContainer(cc.p(241.5,33.5))
    table_paibinghuangzi_top["biaoti_image"] = biaoti_image

    local paibing_button = fc.FRadioButton:create()
    paibing_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    paibing_button:setSize(cc.size(159,45))
    paibing_button:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(paibing_button)
    paibing_button:setPositionInContainer(cc.p(390.5,37.5))
    table_paibinghuangzi_top["paibing_button"] = paibing_button

    local biaoti_image2 = fc.FExtensionsImage:create()
    biaoti_image2:setImage("nobatch/title_mingchen_.png")
    biaoti_image2:setSize(cc.size(483,67))
    biaoti_image2:setFlipType(2)
    biaoti_image2:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(biaoti_image2)
    biaoti_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_paibinghuangzi_top["biaoti_image2"] = biaoti_image2

    local pai_uizi = fc.FExtensionsImage:create()
    pai_uizi:setImage("batch_ui/pai_uizi.png")
    pai_uizi:setSize(cc.size(32,32))
    pai_uizi:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(pai_uizi)
    pai_uizi:setPositionInContainer(cc.p(352,39))
    table_paibinghuangzi_top["pai_uizi"] = pai_uizi

    local bing_uizi = fc.FExtensionsImage:create()
    bing_uizi:setImage("batch_ui/bing_uizi.png")
    bing_uizi:setSize(cc.size(32,32))
    bing_uizi:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(bing_uizi)
    bing_uizi:setPositionInContainer(cc.p(378,39))
    table_paibinghuangzi_top["bing_uizi"] = bing_uizi

    local bu_uizi = fc.FExtensionsImage:create()
    bu_uizi:setImage("batch_ui/bu_uizi.png")
    bu_uizi:setSize(cc.size(32,32))
    bu_uizi:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(bu_uizi)
    bu_uizi:setPositionInContainer(cc.p(404,39))
    table_paibinghuangzi_top["bu_uizi"] = bu_uizi

    local zhen_uizi = fc.FExtensionsImage:create()
    zhen_uizi:setImage("batch_ui/zhen_uizi.png")
    zhen_uizi:setSize(cc.size(32,32))
    zhen_uizi:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(zhen_uizi)
    zhen_uizi:setPositionInContainer(cc.p(430,39))
    table_paibinghuangzi_top["zhen_uizi"] = zhen_uizi

    local bg_wen1_l = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen1_paibingbuzhen.png",cc.rect(94,96,2,2))
    bg_wen1_l:setSize(cc.size(220,409))
    bg_wen1_l:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(bg_wen1_l)
    bg_wen1_l:setPositionInContainer(cc.p(110,278.5))
    table_paibinghuangzi_top["bg_wen1_l"] = bg_wen1_l

    local bg_wen2_l = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen2_paibingbuzhen.png",cc.rect(54,15,5,5))
    bg_wen2_l:setSize(cc.size(125,409))
    bg_wen2_l:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(bg_wen2_l)
    bg_wen2_l:setPositionInContainer(cc.p(282.5,278.5))
    table_paibinghuangzi_top["bg_wen2_l"] = bg_wen2_l

    local bg_wen1_r = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen1_paibingbuzhen.png",cc.rect(94,96,2,2))
    bg_wen1_r:setSize(cc.size(220,409))
    bg_wen1_r:setAnchorPoint(cc.p(0.5,0.5))
    bg_wen1_r:setScaleX(-1)
    paibinghuangzi_top:appendComponent(bg_wen1_r)
    bg_wen1_r:setPositionInContainer(cc.p(850,278.5))
    table_paibinghuangzi_top["bg_wen1_r"] = bg_wen1_r

    local bg_wen2_r = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen2_paibingbuzhen.png",cc.rect(54,15,5,5))
    bg_wen2_r:setSize(cc.size(125,409))
    bg_wen2_r:setAnchorPoint(cc.p(0.5,0.5))
    bg_wen2_r:setScaleX(-1)
    paibinghuangzi_top:appendComponent(bg_wen2_r)
    bg_wen2_r:setPositionInContainer(cc.p(677.5,278.5))
    table_paibinghuangzi_top["bg_wen2_r"] = bg_wen2_r

    local kuang_panel = fc.FContainerPanel:create()
    kuang_panel:setSize(cc.size(990,426))
    kuang_panel:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(kuang_panel)
    kuang_panel:setPositionInContainer(cc.p(479,282))
    table_paibinghuangzi_top["kuang_panel"] = kuang_panel

    local tiao_up_left = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_up_left:setSize(cc.size(223,13))
    tiao_up_left:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(tiao_up_left)
    tiao_up_left:setPositionInContainer(cc.p(131.5,6.5))
    table_paibinghuangzi_top["tiao_up_left"] = tiao_up_left

    local tiao_up_mid = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_up_mid:setSize(cc.size(510,13))
    tiao_up_mid:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(tiao_up_mid)
    tiao_up_mid:setPositionInContainer(cc.p(499,6.5))
    table_paibinghuangzi_top["tiao_up_mid"] = tiao_up_mid

    local tiao_up_right = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_up_right:setSize(cc.size(223,13))
    tiao_up_right:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(tiao_up_right)
    tiao_up_right:setPositionInContainer(cc.p(865.5,6.5))
    table_paibinghuangzi_top["tiao_up_right"] = tiao_up_right

    local tiao_bottom_left = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_bottom_left:setSize(cc.size(223,13))
    tiao_bottom_left:setAnchorPoint(cc.p(0.5,0.5))
    tiao_bottom_left:setScaleY(-1)
    kuang_panel:appendComponent(tiao_bottom_left)
    tiao_bottom_left:setPositionInContainer(cc.p(131.5,418.5))
    table_paibinghuangzi_top["tiao_bottom_left"] = tiao_bottom_left

    local tiao_bottom_mid = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_bottom_mid:setSize(cc.size(510,13))
    tiao_bottom_mid:setAnchorPoint(cc.p(0.5,0.5))
    tiao_bottom_mid:setScaleY(-1)
    kuang_panel:appendComponent(tiao_bottom_mid)
    tiao_bottom_mid:setPositionInContainer(cc.p(499,418.5))
    table_paibinghuangzi_top["tiao_bottom_mid"] = tiao_bottom_mid

    local tiao_bottom_right = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_bottom_right:setSize(cc.size(223,13))
    tiao_bottom_right:setAnchorPoint(cc.p(0.5,0.5))
    tiao_bottom_right:setScaleY(-1)
    kuang_panel:appendComponent(tiao_bottom_right)
    tiao_bottom_right:setPositionInContainer(cc.p(865.5,418.5))
    table_paibinghuangzi_top["tiao_bottom_right"] = tiao_bottom_right

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(25,25.5))
    table_paibinghuangzi_top["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_paibinghuangzi_top["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_paibinghuangzi_top["jiaowen2_r"] = jiaowen2_r

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(236,25.5))
    table_paibinghuangzi_top["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_paibinghuangzi_top["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_paibinghuangzi_top["jiaowen2_r"] = jiaowen2_r

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(756,25.5))
    table_paibinghuangzi_top["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_paibinghuangzi_top["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_paibinghuangzi_top["jiaowen2_r"] = jiaowen2_r

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(965,25.5))
    table_paibinghuangzi_top["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_paibinghuangzi_top["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_paibinghuangzi_top["jiaowen2_r"] = jiaowen2_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(25.5,210))
    table_paibinghuangzi_top["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(25,412.5))
    table_paibinghuangzi_top["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen11_r"] = jiaowen11_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(236.5,210))
    table_paibinghuangzi_top["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(237,412.5))
    table_paibinghuangzi_top["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen11_r"] = jiaowen11_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(756.5,210))
    table_paibinghuangzi_top["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(757,412.5))
    table_paibinghuangzi_top["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen11_r"] = jiaowen11_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(965.5,210))
    table_paibinghuangzi_top["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(966,412.5))
    table_paibinghuangzi_top["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen11_r"] = jiaowen11_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(966,13.5))
    table_paibinghuangzi_top["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen1_r"] = jiaowen1_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(757,13.5))
    table_paibinghuangzi_top["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen1_r"] = jiaowen1_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(237,13.5))
    table_paibinghuangzi_top["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen1_r"] = jiaowen1_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(25,13.5))
    table_paibinghuangzi_top["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_paibinghuangzi_top["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_paibinghuangzi_top["jiaowen1_r"] = jiaowen1_r

    local lian_image = fc.FExtensionsImage:create()
    lian_image:setImage("batch_ui/title_mingchen_2.png")
    lian_image:setSize(cc.size(62,121))
    lian_image:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(lian_image)
    lian_image:setPositionInContainer(cc.p(31,68.5))
    table_paibinghuangzi_top["lian_image"] = lian_image

    local lian_image_right = fc.FExtensionsImage:create()
    lian_image_right:setImage("batch_ui/title_mingchen_2.png")
    lian_image_right:setSize(cc.size(62,121))
    lian_image_right:setFlipType(2)
    lian_image_right:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(lian_image_right)
    lian_image_right:setPositionInContainer(cc.p(929,68.5))
    table_paibinghuangzi_top["lian_image_right"] = lian_image_right

    local close_button = fc.FScaleButton:create()
    close_button:setSize(cc.size(52,52))
    close_button:setAnchorPoint(cc.p(0.5,0.5))
    close_button:setButtonImage("batch_ui/guanbi_up.png")
    paibinghuangzi_top:appendComponent(close_button)
    close_button:setPositionInContainer(cc.p(932,34))
    table_paibinghuangzi_top["close_button"] = close_button

    local huangzi_dujun_top_panel = fc.FContainerPanel:create()
    huangzi_dujun_top_panel:setSize(cc.size(159,45))
    huangzi_dujun_top_panel:setAnchorPoint(cc.p(0.5,0.5))
    paibinghuangzi_top:appendComponent(huangzi_dujun_top_panel)
    huangzi_dujun_top_panel:setPositionInContainer(cc.p(563.5,37.5))
    table_paibinghuangzi_top["huangzi_dujun_top_panel"] = huangzi_dujun_top_panel

    local huangzi_button = fc.FRadioButton:create()
    huangzi_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    huangzi_button:setSize(cc.size(159,45))
    huangzi_button:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_dujun_top_panel:appendComponent(huangzi_button)
    huangzi_button:setPositionInContainer(cc.p(79.5,22.5))
    table_paibinghuangzi_top["huangzi_button"] = huangzi_button

    local huang_uizi = fc.FExtensionsImage:create()
    huang_uizi:setImage("batch_ui/huang_uizi.png")
    huang_uizi:setSize(cc.size(32,32))
    huang_uizi:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_dujun_top_panel:appendComponent(huang_uizi)
    huang_uizi:setPositionInContainer(cc.p(42,24))
    table_paibinghuangzi_top["huang_uizi"] = huang_uizi

    local zi_uizi = fc.FExtensionsImage:create()
    zi_uizi:setImage("batch_ui/zi_uizi.png")
    zi_uizi:setSize(cc.size(32,32))
    zi_uizi:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_dujun_top_panel:appendComponent(zi_uizi)
    zi_uizi:setPositionInContainer(cc.p(68,24))
    table_paibinghuangzi_top["zi_uizi"] = zi_uizi

    local du_uizi = fc.FExtensionsImage:create()
    du_uizi:setImage("batch_ui/du_uizi.png")
    du_uizi:setSize(cc.size(32,32))
    du_uizi:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_dujun_top_panel:appendComponent(du_uizi)
    du_uizi:setPositionInContainer(cc.p(94,24))
    table_paibinghuangzi_top["du_uizi"] = du_uizi

    local jun_uizi = fc.FExtensionsImage:create()
    jun_uizi:setImage("batch_ui/jun_uizi.png")
    jun_uizi:setSize(cc.size(32,32))
    jun_uizi:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_dujun_top_panel:appendComponent(jun_uizi)
    jun_uizi:setPositionInContainer(cc.p(120,24))
    table_paibinghuangzi_top["jun_uizi"] = jun_uizi

    return table_paibinghuangzi_top

end

