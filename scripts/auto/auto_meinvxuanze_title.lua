function createmeinvxuanze_title()

    local table_meinvxuanze_title = {}

    local meinvxuanze_title = fc.FContainerPanel:create()
    meinvxuanze_title:setSize(cc.size(960,640))
    table_meinvxuanze_title["meinvxuanze_title"] = meinvxuanze_title

    local mnxz_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    mnxz_bg_image:setSize(cc.size(960,640))
    mnxz_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(mnxz_bg_image)
    mnxz_bg_image:setPositionInContainer(cc.p(480,320))
    table_meinvxuanze_title["mnxz_bg_image"] = mnxz_bg_image

    local tiao_l = fc.FExtensionsImage:create()
    tiao_l:setImage("nobatch/title_hougong.png")
    tiao_l:setSize(cc.size(480,67))
    tiao_l:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(tiao_l)
    tiao_l:setPositionInContainer(cc.p(240,33.5))
    table_meinvxuanze_title["tiao_l"] = tiao_l

    local tiao_r = fc.FExtensionsImage:create()
    tiao_r:setImage("nobatch/title_hougong.png")
    tiao_r:setSize(cc.size(480,67))
    tiao_r:setFlipType(2)
    tiao_r:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(tiao_r)
    tiao_r:setPositionInContainer(cc.p(720,33.5))
    table_meinvxuanze_title["tiao_r"] = tiao_r

    local mvxz_biaoti_image = fc.FContainerPanel:create()
    mvxz_biaoti_image:setSize(cc.size(205,35))
    mvxz_biaoti_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(mvxz_biaoti_image)
    mvxz_biaoti_image:setPositionInContainer(cc.p(484.5,40))
    table_meinvxuanze_title["mvxz_biaoti_image"] = mvxz_biaoti_image

    local mei = fc.FExtensionsImage:create()
    mei:setImage("batch_ui/mei.png")
    mei:setSize(cc.size(40,40))
    mei:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_biaoti_image:appendComponent(mei)
    mei:setPositionInContainer(cc.p(20,20))
    table_meinvxuanze_title["mei"] = mei

    local nv = fc.FExtensionsImage:create()
    nv:setImage("batch_ui/nv.png")
    nv:setSize(cc.size(40,40))
    nv:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_biaoti_image:appendComponent(nv)
    nv:setPositionInContainer(cc.p(75,20))
    table_meinvxuanze_title["nv"] = nv

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_biaoti_image:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(130,20))
    table_meinvxuanze_title["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_biaoti_image:appendComponent(ze)
    ze:setPositionInContainer(cc.p(185,20))
    table_meinvxuanze_title["ze"] = ze

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_meinvxuanze_title["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_meinvxuanze_title["wen_r"] = wen_r

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_meinvxuanze_title["wen_rb"] = wen_rb

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,67.5))
    table_meinvxuanze_title["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,67.5))
    table_meinvxuanze_title["lian_right"] = lian_right

    local mnxz_close_button = fc.FScaleButton:create()
    mnxz_close_button:setSize(cc.size(52,52))
    mnxz_close_button:setAnchorPoint(cc.p(0.5,0.5))
    mnxz_close_button:setButtonImage("batch_ui/guanbi_up.png")
    meinvxuanze_title:appendComponent(mnxz_close_button)
    mnxz_close_button:setPositionInContainer(cc.p(930,36))
    table_meinvxuanze_title["mnxz_close_button"] = mnxz_close_button

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_meinvxuanze_title["wen_lb"] = wen_lb

    local mvxz_word_bg1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    mvxz_word_bg1_scale9:setSize(cc.size(492,70))
    mvxz_word_bg1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_title:appendComponent(mvxz_word_bg1_scale9)
    mvxz_word_bg1_scale9:setPositionInContainer(cc.p(280,597))
    table_meinvxuanze_title["mvxz_word_bg1_scale9"] = mvxz_word_bg1_scale9

    local mvxz_word_label = fc.FLabel:createBMFont()
    mvxz_word_label:setSize(cc.size(395,30))
    mvxz_word_label:setAnchorPoint(cc.p(0.5,0.5))
    mvxz_word_label:setFontSize(20)
    local strT = g_game.g_dictConfigManager:getLanTextById(76)
    mvxz_word_label:setString(strT)
    mvxz_word_label:setColor(cc.c3b(106,68,19))
    meinvxuanze_title:appendComponent(mvxz_word_label)
    mvxz_word_label:setPositionInContainer(cc.p(292.5,593))
    table_meinvxuanze_title["mvxz_word_label"] = mvxz_word_label

    local meinvxuanze_xiangqing_button = fc.FScaleButton:create()
    meinvxuanze_xiangqing_button:setSize(cc.size(144,53))
    meinvxuanze_xiangqing_button:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_xiangqing_button:setButtonImage("batch_ui/putonganniu1_up.png")
    meinvxuanze_title:appendComponent(meinvxuanze_xiangqing_button)
    meinvxuanze_xiangqing_button:setPositionInContainer(cc.p(645,596.5))
    table_meinvxuanze_title["meinvxuanze_xiangqing_button"] = meinvxuanze_xiangqing_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_xiangqing_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(31,26))
    table_meinvxuanze_title["cha"] = cha

    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_xiangqing_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_meinvxuanze_title["kan"] = kan

    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    local xiang = fc.FShaderExtensionsImage:create(0)
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_xiangqing_button:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(84,26))
    table_meinvxuanze_title["xiang"] = xiang

    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    local qing = fc.FShaderExtensionsImage:create(0)
    qing:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_xiangqing_button:appendComponent(qing)
    qing:setPositionInContainer(cc.p(110,26))
    table_meinvxuanze_title["qing"] = qing

    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    local meinvxuanze_queding_button = fc.FScaleButton:create()
    meinvxuanze_queding_button:setSize(cc.size(144,53))
    meinvxuanze_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    meinvxuanze_title:appendComponent(meinvxuanze_queding_button)
    meinvxuanze_queding_button:setPositionInContainer(cc.p(836,596.5))
    table_meinvxuanze_title["meinvxuanze_queding_button"] = meinvxuanze_queding_button

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_queding_button:appendComponent(que)
    que:setPositionInContainer(cc.p(45,26))
    table_meinvxuanze_title["que"] = que

    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    meinvxuanze_queding_button:appendComponent(ding)
    ding:setPositionInContainer(cc.p(98,26))
    table_meinvxuanze_title["ding"] = ding

    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    return table_meinvxuanze_title

end

