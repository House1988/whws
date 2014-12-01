function createqgyd_gongjizhiduihuan()

    local table_qgyd_gongjizhiduihuan = {}

    local qgyd_gongjizhiduihuan = fc.FContainerPanel:create()
    qgyd_gongjizhiduihuan:setSize(cc.size(960,640))
    table_qgyd_gongjizhiduihuan["qgyd_gongjizhiduihuan"] = qgyd_gongjizhiduihuan

    local gjzdh_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    gjzdh_bg_image:setSize(cc.size(960,640))
    gjzdh_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_bg_image)
    gjzdh_bg_image:setPositionInContainer(cc.p(480,320))
    table_qgyd_gongjizhiduihuan["gjzdh_bg_image"] = gjzdh_bg_image

    local gjzdh_title_bg_image = fc.FExtensionsImage:create()
    gjzdh_title_bg_image:setImage("nobatch/title_hougong.png")
    gjzdh_title_bg_image:setSize(cc.size(480,67))
    gjzdh_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_title_bg_image)
    gjzdh_title_bg_image:setPositionInContainer(cc.p(240,33.5))
    table_qgyd_gongjizhiduihuan["gjzdh_title_bg_image"] = gjzdh_title_bg_image

    local gjzdh_pre_page_button = fc.FScaleButton:create()
    gjzdh_pre_page_button:setSize(cc.size(38,60))
    gjzdh_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_pre_page_button)
    gjzdh_pre_page_button:setPositionInContainer(cc.p(19,325))
    table_qgyd_gongjizhiduihuan["gjzdh_pre_page_button"] = gjzdh_pre_page_button

    local gjzdh_back_page_button = fc.FScaleButton:create()
    gjzdh_back_page_button:setSize(cc.size(38,60))
    gjzdh_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    gjzdh_back_page_button:setScaleX(-1)
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_back_page_button)
    gjzdh_back_page_button:setPositionInContainer(cc.p(936,325))
    table_qgyd_gongjizhiduihuan["gjzdh_back_page_button"] = gjzdh_back_page_button

    local gjzdh_title_bg_image2 = fc.FExtensionsImage:create()
    gjzdh_title_bg_image2:setImage("nobatch/title_hougong.png")
    gjzdh_title_bg_image2:setSize(cc.size(480,67))
    gjzdh_title_bg_image2:setFlipType(2)
    gjzdh_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_title_bg_image2)
    gjzdh_title_bg_image2:setPositionInContainer(cc.p(717,33.5))
    table_qgyd_gongjizhiduihuan["gjzdh_title_bg_image2"] = gjzdh_title_bg_image2

    local gjzdh_title_image = fc.FContainerPanel:create()
    gjzdh_title_image:setSize(cc.size(258,35))
    gjzdh_title_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_title_image)
    gjzdh_title_image:setPositionInContainer(cc.p(480,38))
    table_qgyd_gongjizhiduihuan["gjzdh_title_image"] = gjzdh_title_image

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong_4.png")
    gong:setSize(cc.size(40,40))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_title_image:appendComponent(gong)
    gong:setPositionInContainer(cc.p(20,20))
    table_qgyd_gongjizhiduihuan["gong"] = gong

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji_4.png")
    ji:setSize(cc.size(40,40))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_title_image:appendComponent(ji)
    ji:setPositionInContainer(cc.p(74,20))
    table_qgyd_gongjizhiduihuan["ji"] = ji

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi.png")
    zhi:setSize(cc.size(40,40))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_title_image:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(129,20))
    table_qgyd_gongjizhiduihuan["zhi"] = zhi

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui_2.png")
    dui:setSize(cc.size(40,40))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_title_image:appendComponent(dui)
    dui:setPositionInContainer(cc.p(183,20))
    table_qgyd_gongjizhiduihuan["dui"] = dui

    local huan = fc.FExtensionsImage:create()
    huan:setImage("batch_ui/huan.png")
    huan:setSize(cc.size(40,40))
    huan:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_title_image:appendComponent(huan)
    huan:setPositionInContainer(cc.p(238,20))
    table_qgyd_gongjizhiduihuan["huan"] = huan

    local gjzdh_close_button = fc.FScaleButton:create()
    gjzdh_close_button:setSize(cc.size(59,59))
    gjzdh_close_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_close_button:setButtonImage("batch_ui/guanbi_up.png")
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_close_button)
    gjzdh_close_button:setPositionInContainer(cc.p(928.5,31.5))
    table_qgyd_gongjizhiduihuan["gjzdh_close_button"] = gjzdh_close_button

    local gjzdh_shijian_label = fc.FLabel:createBMFont()
    gjzdh_shijian_label:setSize(cc.size(174,30))
    gjzdh_shijian_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shijian_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    gjzdh_shijian_label:setString("功績值刷新時間：")
    else
	    gjzdh_shijian_label:setString("功绩值刷新时间：")
    end
    gjzdh_shijian_label:setColor(cc.c3b(255, 255, 255))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_shijian_label)
    gjzdh_shijian_label:setPositionInContainer(cc.p(487,98))
    table_qgyd_gongjizhiduihuan["gjzdh_shijian_label"] = gjzdh_shijian_label

    local gjzdh_shijian_num_label = fc.FLabel:createBMFont()
    gjzdh_shijian_num_label:setSize(cc.size(97,30))
    gjzdh_shijian_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shijian_num_label:setFontSize(20)
    gjzdh_shijian_num_label:setString("10:59:59")
    gjzdh_shijian_num_label:setColor(cc.c3b(255, 255, 255))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_shijian_num_label)
    gjzdh_shijian_num_label:setPositionInContainer(cc.p(622.5,98))
    table_qgyd_gongjizhiduihuan["gjzdh_shijian_num_label"] = gjzdh_shijian_num_label

    local gjzdh_dangqian_label = fc.FLabel:createBMFont()
    gjzdh_dangqian_label:setSize(cc.size(140,30))
    gjzdh_dangqian_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_dangqian_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    gjzdh_dangqian_label:setString("當前功績值：")
    else
	    gjzdh_dangqian_label:setString("当前功绩值：")
    end
    gjzdh_dangqian_label:setColor(cc.c3b(255, 255, 255))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_dangqian_label)
    gjzdh_dangqian_label:setPositionInContainer(cc.p(98,98))
    table_qgyd_gongjizhiduihuan["gjzdh_dangqian_label"] = gjzdh_dangqian_label

    local gjzdh_dangqian_num_label = fc.FLabel:createBMFont()
    gjzdh_dangqian_num_label:setSize(cc.size(56,30))
    gjzdh_dangqian_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_dangqian_num_label:setFontSize(20)
    gjzdh_dangqian_num_label:setString("999")
    gjzdh_dangqian_num_label:setColor(cc.c3b(255, 255, 255))
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_dangqian_num_label)
    gjzdh_dangqian_num_label:setPositionInContainer(cc.p(196,98))
    table_qgyd_gongjizhiduihuan["gjzdh_dangqian_num_label"] = gjzdh_dangqian_num_label

    local gjzdh_shuaxin_button = fc.FScaleButton:create()
    gjzdh_shuaxin_button:setSize(cc.size(144,51))
    gjzdh_shuaxin_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuaxin_button:setButtonImage("batch_ui/goumai_anniu.png")
    qgyd_gongjizhiduihuan:appendComponent(gjzdh_shuaxin_button)
    gjzdh_shuaxin_button:setPositionInContainer(cc.p(886,105.5))
    table_qgyd_gongjizhiduihuan["gjzdh_shuaxin_button"] = gjzdh_shuaxin_button

    local shua = fc.FExtensionsImage:create()
    shua:setImage("batch_ui/shua_uizi.png")
    shua:setSize(cc.size(32,32))
    shua:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuaxin_button:appendComponent(shua)
    shua:setPositionInContainer(cc.p(22,23))
    table_qgyd_gongjizhiduihuan["shua"] = shua

    local xin = fc.FExtensionsImage:create()
    xin:setImage("batch_ui/xin1_uizi.png")
    xin:setSize(cc.size(32,32))
    xin:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuaxin_button:appendComponent(xin)
    xin:setPositionInContainer(cc.p(45,23))
    table_qgyd_gongjizhiduihuan["xin"] = xin

    local gong1 = fc.FExtensionsImage:create()
    gong1:setImage("batch_ui/gong2_uizi.png")
    gong1:setSize(cc.size(32,32))
    gong1:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuaxin_button:appendComponent(gong1)
    gong1:setPositionInContainer(cc.p(69,23))
    table_qgyd_gongjizhiduihuan["gong1"] = gong1

    local ji1 = fc.FExtensionsImage:create()
    ji1:setImage("batch_ui/ji6_uizi.png")
    ji1:setSize(cc.size(32,32))
    ji1:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuaxin_button:appendComponent(ji1)
    ji1:setPositionInContainer(cc.p(92,23))
    table_qgyd_gongjizhiduihuan["ji1"] = ji1

    local zhi1 = fc.FExtensionsImage:create()
    zhi1:setImage("batch_ui/zhi_uizi.png")
    zhi1:setSize(cc.size(32,32))
    zhi1:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuaxin_button:appendComponent(zhi1)
    zhi1:setPositionInContainer(cc.p(116,23))
    table_qgyd_gongjizhiduihuan["zhi1"] = zhi1

    local topbar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar:setSize(cc.size(960,13))
    topbar:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongjizhiduihuan:appendComponent(topbar)
    topbar:setPositionInContainer(cc.p(480,71.5))
    table_qgyd_gongjizhiduihuan["topbar"] = topbar

    local bottomBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar:setSize(cc.size(960,13))
    bottomBar:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongjizhiduihuan:appendComponent(bottomBar)
    bottomBar:setPositionInContainer(cc.p(480,137.5))
    table_qgyd_gongjizhiduihuan["bottomBar"] = bottomBar

    return table_qgyd_gongjizhiduihuan

end

