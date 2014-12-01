function createhuangzidujun_content()

    local table_huangzidujun_content = {}

    local huangzidujun_content = fc.FContainerPanel:create()
    huangzidujun_content:setSize(cc.size(960,640))
    table_huangzidujun_content["huangzidujun_content"] = huangzidujun_content

    local bg_wen1_l = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen1_paibingbuzhen.png",cc.rect(94,96,2,2))
    bg_wen1_l:setSize(cc.size(290,409))
    bg_wen1_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(bg_wen1_l)
    bg_wen1_l:setPositionInContainer(cc.p(145,279.5))
    table_huangzidujun_content["bg_wen1_l"] = bg_wen1_l

    local bg_wen2_l = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen2_paibingbuzhen.png",cc.rect(54,15,5,5))
    bg_wen2_l:setSize(cc.size(64,409))
    bg_wen2_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(bg_wen2_l)
    bg_wen2_l:setPositionInContainer(cc.p(322,279.5))
    table_huangzidujun_content["bg_wen2_l"] = bg_wen2_l

    local bg_wen1_r = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen1_paibingbuzhen.png",cc.rect(94,96,2,2))
    bg_wen1_r:setSize(cc.size(290,409))
    bg_wen1_r:setAnchorPoint(cc.p(0.5,0.5))
    bg_wen1_r:setScaleX(-1)
    huangzidujun_content:appendComponent(bg_wen1_r)
    bg_wen1_r:setPositionInContainer(cc.p(815,279.5))
    table_huangzidujun_content["bg_wen1_r"] = bg_wen1_r

    local bg_wen2_r = fc.FScale9Image:createWithBatchUIFrame("nobatch/diwen2_paibingbuzhen.png",cc.rect(54,15,5,5))
    bg_wen2_r:setSize(cc.size(64,409))
    bg_wen2_r:setAnchorPoint(cc.p(0.5,0.5))
    bg_wen2_r:setScaleX(-1)
    huangzidujun_content:appendComponent(bg_wen2_r)
    bg_wen2_r:setPositionInContainer(cc.p(638,279.5))
    table_huangzidujun_content["bg_wen2_r"] = bg_wen2_r

    local kuang_panel = fc.FContainerPanel:create()
    kuang_panel:setSize(cc.size(990,426))
    kuang_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(kuang_panel)
    kuang_panel:setPositionInContainer(cc.p(468.5,283))
    table_huangzidujun_content["kuang_panel"] = kuang_panel

    local tiao_up_left = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_up_left:setSize(cc.size(290,13))
    tiao_up_left:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(tiao_up_left)
    tiao_up_left:setPositionInContainer(cc.p(171,6.5))
    table_huangzidujun_content["tiao_up_left"] = tiao_up_left

    local tiao_up_mid = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_up_mid:setSize(cc.size(383,13))
    tiao_up_mid:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(tiao_up_mid)
    tiao_up_mid:setPositionInContainer(cc.p(507.5,6.5))
    table_huangzidujun_content["tiao_up_mid"] = tiao_up_mid

    local tiao_up_right = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_up_right:setSize(cc.size(290,13))
    tiao_up_right:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(tiao_up_right)
    tiao_up_right:setPositionInContainer(cc.p(844,6.5))
    table_huangzidujun_content["tiao_up_right"] = tiao_up_right

    local tiao_bottom_left = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_bottom_left:setSize(cc.size(290,13))
    tiao_bottom_left:setAnchorPoint(cc.p(0.5,0.5))
    tiao_bottom_left:setScaleY(-1)
    kuang_panel:appendComponent(tiao_bottom_left)
    tiao_bottom_left:setPositionInContainer(cc.p(171,418.5))
    table_huangzidujun_content["tiao_bottom_left"] = tiao_bottom_left

    local tiao_bottom_mid = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_bottom_mid:setSize(cc.size(383,13))
    tiao_bottom_mid:setAnchorPoint(cc.p(0.5,0.5))
    tiao_bottom_mid:setScaleY(-1)
    kuang_panel:appendComponent(tiao_bottom_mid)
    tiao_bottom_mid:setPositionInContainer(cc.p(507.5,418.5))
    table_huangzidujun_content["tiao_bottom_mid"] = tiao_bottom_mid

    local tiao_bottom_right = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    tiao_bottom_right:setSize(cc.size(290,13))
    tiao_bottom_right:setAnchorPoint(cc.p(0.5,0.5))
    tiao_bottom_right:setScaleY(-1)
    kuang_panel:appendComponent(tiao_bottom_right)
    tiao_bottom_right:setPositionInContainer(cc.p(844,418.5))
    table_huangzidujun_content["tiao_bottom_right"] = tiao_bottom_right

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(29,25.5))
    table_huangzidujun_content["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_huangzidujun_content["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_huangzidujun_content["jiaowen2_r"] = jiaowen2_r

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(313,25.5))
    table_huangzidujun_content["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_huangzidujun_content["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_huangzidujun_content["jiaowen2_r"] = jiaowen2_r

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(693,25.5))
    table_huangzidujun_content["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_huangzidujun_content["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_huangzidujun_content["jiaowen2_r"] = jiaowen2_r

    local jiaowen2 = fc.FContainerPanel:create()
    jiaowen2:setSize(cc.size(50,27))
    jiaowen2:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen2)
    jiaowen2:setPositionInContainer(cc.p(976,25.5))
    table_huangzidujun_content["jiaowen2"] = jiaowen2

    local jiaowen2_l = fc.FExtensionsImage:create()
    jiaowen2_l:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_l:setSize(cc.size(25,27))
    jiaowen2_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_l)
    jiaowen2_l:setPositionInContainer(cc.p(12.5,13.5))
    table_huangzidujun_content["jiaowen2_l"] = jiaowen2_l

    local jiaowen2_r = fc.FExtensionsImage:create()
    jiaowen2_r:setImage("batch_ui/tongyongbiankuang4_paibingbuzhen.png")
    jiaowen2_r:setSize(cc.size(25,27))
    jiaowen2_r:setFlipType(2)
    jiaowen2_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen2:appendComponent(jiaowen2_r)
    jiaowen2_r:setPositionInContainer(cc.p(36.5,13.5))
    table_huangzidujun_content["jiaowen2_r"] = jiaowen2_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(29.5,210))
    table_huangzidujun_content["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(29,412.5))
    table_huangzidujun_content["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen11_r"] = jiaowen11_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(313.5,210))
    table_huangzidujun_content["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(314,412.5))
    table_huangzidujun_content["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen11_r"] = jiaowen11_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(693.5,210))
    table_huangzidujun_content["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(694,412.5))
    table_huangzidujun_content["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen11_r"] = jiaowen11_r

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_paibingbuzhen.png",cc.rect(2,25,1,1))
    mid_bar:setSize(cc.size(7,400))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(976.5,210))
    table_huangzidujun_content["mid_bar"] = mid_bar

    local jiaowen11 = fc.FContainerPanel:create()
    jiaowen11:setSize(cc.size(26,27))
    jiaowen11:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen11)
    jiaowen11:setPositionInContainer(cc.p(977,412.5))
    table_huangzidujun_content["jiaowen11"] = jiaowen11

    local jiaowen11_l = fc.FExtensionsImage:create()
    jiaowen11_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_l:setSize(cc.size(13,27))
    jiaowen11_l:setFlipType(4)
    jiaowen11_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_l)
    jiaowen11_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen11_l"] = jiaowen11_l

    local jiaowen11_r = fc.FExtensionsImage:create()
    jiaowen11_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen11_r:setSize(cc.size(13,27))
    jiaowen11_r:setFlipType(8)
    jiaowen11_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen11:appendComponent(jiaowen11_r)
    jiaowen11_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen11_r"] = jiaowen11_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(977,13.5))
    table_huangzidujun_content["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen1_r"] = jiaowen1_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(694,13.5))
    table_huangzidujun_content["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen1_r"] = jiaowen1_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(314,13.5))
    table_huangzidujun_content["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen1_r"] = jiaowen1_r

    local jiaowen1 = fc.FContainerPanel:create()
    jiaowen1:setSize(cc.size(26,27))
    jiaowen1:setAnchorPoint(cc.p(0.5,0.5))
    kuang_panel:appendComponent(jiaowen1)
    jiaowen1:setPositionInContainer(cc.p(29,13.5))
    table_huangzidujun_content["jiaowen1"] = jiaowen1

    local jiaowen1_l = fc.FExtensionsImage:create()
    jiaowen1_l:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_l:setSize(cc.size(13,27))
    jiaowen1_l:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_l)
    jiaowen1_l:setPositionInContainer(cc.p(6.5,13.5))
    table_huangzidujun_content["jiaowen1_l"] = jiaowen1_l

    local jiaowen1_r = fc.FExtensionsImage:create()
    jiaowen1_r:setImage("batch_ui/tongyongbiankuang1_paibingbuzhen.png")
    jiaowen1_r:setSize(cc.size(13,27))
    jiaowen1_r:setFlipType(2)
    jiaowen1_r:setAnchorPoint(cc.p(0.5,0.5))
    jiaowen1:appendComponent(jiaowen1_r)
    jiaowen1_r:setPositionInContainer(cc.p(18.5,13.5))
    table_huangzidujun_content["jiaowen1_r"] = jiaowen1_r

    local des_di_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(11,9,3,3))
    des_di_image:setSize(cc.size(235,116))
    des_di_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(des_di_image)
    des_di_image:setPositionInContainer(cc.p(147.5,182))
    table_huangzidujun_content["des_di_image"] = des_di_image

    local des_di_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(11,9,3,3))
    des_di_image:setSize(cc.size(235,116))
    des_di_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(des_di_image)
    des_di_image:setPositionInContainer(cc.p(147.5,324))
    table_huangzidujun_content["des_di_image"] = des_di_image

    local huangzi_detail = fc.FScaleButton:create()
    huangzi_detail:setSize(cc.size(144,53))
    huangzi_detail:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_detail:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzidujun_content:appendComponent(huangzi_detail)
    huangzi_detail:setPositionInContainer(cc.p(150,432.5))
    table_huangzidujun_content["huangzi_detail"] = huangzi_detail

    local huang = fc.FExtensionsImage:create()
    huang:setImage("batch_ui/huang_uizi.png")
    huang:setSize(cc.size(32,32))
    huang:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(huang)
    huang:setPositionInContainer(cc.p(110,432))
    table_huangzidujun_content["huang"] = huang

    local zi = fc.FExtensionsImage:create()
    zi:setImage("batch_ui/zi_uizi.png")
    zi:setSize(cc.size(32,32))
    zi:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(zi)
    zi:setPositionInContainer(cc.p(136,432))
    table_huangzidujun_content["zi"] = zi

    local shu_ui = fc.FExtensionsImage:create()
    shu_ui:setImage("batch_ui/shu_uizi.png")
    shu_ui:setSize(cc.size(32,32))
    shu_ui:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(shu_ui)
    shu_ui:setPositionInContainer(cc.p(162,432))
    table_huangzidujun_content["shu_ui"] = shu_ui

    local xing_uizi = fc.FExtensionsImage:create()
    xing_uizi:setImage("batch_ui/xing2_uizi.png")
    xing_uizi:setSize(cc.size(32,32))
    xing_uizi:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_content:appendComponent(xing_uizi)
    xing_uizi:setPositionInContainer(cc.p(186,432))
    table_huangzidujun_content["xing_uizi"] = xing_uizi

    local jineng = fc.FLabel:createBMFont()
    jineng:setSize(cc.size(60,30))
    jineng:setAnchorPoint(cc.p(0.5,0.5))
    jineng:setFontSize(20)
    jineng:setString("技能：")
    jineng:setColor(cc.c3b(250,255,165))
    jineng:setAlignment(0)
    huangzidujun_content:appendComponent(jineng)
    jineng:setPositionInContainer(cc.p(66,147))
    table_huangzidujun_content["jineng"] = jineng

    local jiacheng = fc.FLabel:createBMFont()
    jiacheng:setSize(cc.size(60,30))
    jiacheng:setAnchorPoint(cc.p(0.5,0.5))
    jiacheng:setFontSize(20)
    jiacheng:setString("加成：")
    jiacheng:setColor(cc.c3b(250,255,165))
    jiacheng:setAlignment(0)
    huangzidujun_content:appendComponent(jiacheng)
    jiacheng:setPositionInContainer(cc.p(66,287))
    table_huangzidujun_content["jiacheng"] = jiacheng

    local hzdj_xiaoguo1_label = fc.FLabel:createBMFont()
    hzdj_xiaoguo1_label:setSize(cc.size(130,30))
    hzdj_xiaoguo1_label:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_xiaoguo1_label:setFontSize(20)
    hzdj_xiaoguo1_label:setString("督军效果描述：")
    hzdj_xiaoguo1_label:setColor(cc.c3b(139,255,240))
    hzdj_xiaoguo1_label:setAlignment(0)
    huangzidujun_content:appendComponent(hzdj_xiaoguo1_label)
    hzdj_xiaoguo1_label:setPositionInContainer(cc.p(163,147))
    table_huangzidujun_content["hzdj_xiaoguo1_label"] = hzdj_xiaoguo1_label

    local hzdj_xiaoguo3_label = fc.FLabel:createBMFont()
    hzdj_xiaoguo3_label:setSize(cc.size(130,30))
    hzdj_xiaoguo3_label:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_xiaoguo3_label:setFontSize(20)
    hzdj_xiaoguo3_label:setWidth(130)
    hzdj_xiaoguo3_label:setString("督军效果描述：")
    hzdj_xiaoguo3_label:setColor(cc.c3b(139,255,240))
    hzdj_xiaoguo3_label:setAlignment(0)
    huangzidujun_content:appendComponent(hzdj_xiaoguo3_label)
    hzdj_xiaoguo3_label:setPositionInContainer(cc.p(163,287))
    table_huangzidujun_content["hzdj_xiaoguo3_label"] = hzdj_xiaoguo3_label

    local hzdj_xiaoguo2_label = fc.FLabel:createBMFont()
    hzdj_xiaoguo2_label:setSize(cc.size(220,57))
    hzdj_xiaoguo2_label:setWidth(220)
    hzdj_xiaoguo2_label:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_xiaoguo2_label:setFontSize(20)
    hzdj_xiaoguo2_label:setString("步兵步兵步兵")
    hzdj_xiaoguo2_label:setColor(cc.c3b(139,255,240))
    hzdj_xiaoguo2_label:setAlignment(0)
    huangzidujun_content:appendComponent(hzdj_xiaoguo2_label)
    hzdj_xiaoguo2_label:setPositionInContainer(cc.p(146,200.5))
    table_huangzidujun_content["hzdj_xiaoguo2_label"] = hzdj_xiaoguo2_label

    local hzdj_xiaoguo4_label = fc.FLabel:createBMFont()
    hzdj_xiaoguo4_label:setSize(cc.size(220,57))
    hzdj_xiaoguo4_label:setWidth(220)
    hzdj_xiaoguo4_label:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_xiaoguo4_label:setFontSize(20)
    hzdj_xiaoguo4_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵")
    hzdj_xiaoguo4_label:setColor(cc.c3b(139,255,240))
    hzdj_xiaoguo4_label:setAlignment(0)
    huangzidujun_content:appendComponent(hzdj_xiaoguo4_label)
    hzdj_xiaoguo4_label:setPositionInContainer(cc.p(146,340.5))
    table_huangzidujun_content["hzdj_xiaoguo4_label"] = hzdj_xiaoguo4_label

    return table_huangzidujun_content

end

