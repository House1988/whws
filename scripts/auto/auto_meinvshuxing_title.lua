function createmeinvshuxing_title()

    local table_meinvshuxing_title = {}

    local meinvshuxing_title = fc.FContainerPanel:create()
    meinvshuxing_title:setSize(cc.size(960,640))
    table_meinvshuxing_title["meinvshuxing_title"] = meinvshuxing_title

    local mvsx_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    mvsx_bg_image:setSize(cc.size(960,640))
    mvsx_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(mvsx_bg_image)
    mvsx_bg_image:setPositionInContainer(cc.p(480,320))
    table_meinvshuxing_title["mvsx_bg_image"] = mvsx_bg_image

    local tiao_l = fc.FExtensionsImage:create()
    tiao_l:setImage("nobatch/title_hougong.png")
    tiao_l:setSize(cc.size(480,67))
    tiao_l:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(tiao_l)
    tiao_l:setPositionInContainer(cc.p(240,33.5))
    table_meinvshuxing_title["tiao_l"] = tiao_l

    local tiao_r = fc.FExtensionsImage:create()
    tiao_r:setImage("nobatch/title_hougong.png")
    tiao_r:setSize(cc.size(480,67))
    tiao_r:setFlipType(2)
    tiao_r:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(tiao_r)
    tiao_r:setPositionInContainer(cc.p(720,33.5))
    table_meinvshuxing_title["tiao_r"] = tiao_r

    local mvsx_biaoti_image = fc.FContainerPanel:create()
    mvsx_biaoti_image:setSize(cc.size(205,35))
    mvsx_biaoti_image:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(mvsx_biaoti_image)
    mvsx_biaoti_image:setPositionInContainer(cc.p(476.5,38))
    table_meinvshuxing_title["mvsx_biaoti_image"] = mvsx_biaoti_image

    local mei = fc.FExtensionsImage:create()
    mei:setImage("batch_ui/mei.png")
    mei:setSize(cc.size(40,40))
    mei:setAnchorPoint(cc.p(0.5,0.5))
    mvsx_biaoti_image:appendComponent(mei)
    mei:setPositionInContainer(cc.p(20,20))
    table_meinvshuxing_title["mei"] = mei

    local nv = fc.FExtensionsImage:create()
    nv:setImage("batch_ui/nv.png")
    nv:setSize(cc.size(40,40))
    nv:setAnchorPoint(cc.p(0.5,0.5))
    mvsx_biaoti_image:appendComponent(nv)
    nv:setPositionInContainer(cc.p(75,20))
    table_meinvshuxing_title["nv"] = nv

    local shu = fc.FExtensionsImage:create()
    shu:setImage("batch_ui/shu.png")
    shu:setSize(cc.size(40,40))
    shu:setAnchorPoint(cc.p(0.5,0.5))
    mvsx_biaoti_image:appendComponent(shu)
    shu:setPositionInContainer(cc.p(130,20))
    table_meinvshuxing_title["shu"] = shu

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xing.png")
    xing:setSize(cc.size(40,40))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    mvsx_biaoti_image:appendComponent(xing)
    xing:setPositionInContainer(cc.p(185,20))
    table_meinvshuxing_title["xing"] = xing

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_meinvshuxing_title["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_meinvshuxing_title["wen_r"] = wen_r

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_meinvshuxing_title["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(849,558.5))
    table_meinvshuxing_title["wen_rb"] = wen_rb

    local lian_l = fc.FExtensionsImage:create()
    lian_l:setImage("batch_ui/title_mingchen_2.png")
    lian_l:setSize(cc.size(62,121))
    lian_l:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(lian_l)
    lian_l:setPositionInContainer(cc.p(31,70.5))
    table_meinvshuxing_title["lian_l"] = lian_l

    local lian_r = fc.FExtensionsImage:create()
    lian_r:setImage("batch_ui/title_mingchen_2.png")
    lian_r:setSize(cc.size(62,121))
    lian_r:setFlipType(2)
    lian_r:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_title:appendComponent(lian_r)
    lian_r:setPositionInContainer(cc.p(928,69.5))
    table_meinvshuxing_title["lian_r"] = lian_r

    local mvsx_close_button = fc.FScaleButton:create()
    mvsx_close_button:setSize(cc.size(52,52))
    mvsx_close_button:setAnchorPoint(cc.p(0.5,0.5))
    mvsx_close_button:setButtonImage("batch_ui/guanbi_up.png")
    meinvshuxing_title:appendComponent(mvsx_close_button)
    mvsx_close_button:setPositionInContainer(cc.p(933,35))
    table_meinvshuxing_title["mvsx_close_button"] = mvsx_close_button

    return table_meinvshuxing_title

end

