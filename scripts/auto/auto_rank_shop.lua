function createrank_shop()

    local table_rank_shop = {}

    local rank_shop = fc.FContainerPanel:create()
    rank_shop:setSize(cc.size(960,640))
    table_rank_shop["rank_shop"] = rank_shop

    local gjzdh_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    gjzdh_bg_image:setSize(cc.size(960,640))
    gjzdh_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(gjzdh_bg_image)
    gjzdh_bg_image:setPositionInContainer(cc.p(480,320))
    table_rank_shop["gjzdh_bg_image"] = gjzdh_bg_image

    local gjzdh_title_bg_image = fc.FExtensionsImage:create()
    gjzdh_title_bg_image:setImage("nobatch/title_hougong.png")
    gjzdh_title_bg_image:setSize(cc.size(480,67))
    gjzdh_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(gjzdh_title_bg_image)
    gjzdh_title_bg_image:setPositionInContainer(cc.p(240,33.5))
    table_rank_shop["gjzdh_title_bg_image"] = gjzdh_title_bg_image

    local gjzdh_title_bg_image2 = fc.FExtensionsImage:create()
    gjzdh_title_bg_image2:setImage("nobatch/title_hougong.png")
    gjzdh_title_bg_image2:setSize(cc.size(480,67))
    gjzdh_title_bg_image2:setFlipType(2)
    gjzdh_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(gjzdh_title_bg_image2)
    gjzdh_title_bg_image2:setPositionInContainer(cc.p(717,33.5))
    table_rank_shop["gjzdh_title_bg_image2"] = gjzdh_title_bg_image2

    local gjzdh_close_button = fc.FScaleButton:create()
    gjzdh_close_button:setSize(cc.size(59,59))
    gjzdh_close_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_close_button:setButtonImage("batch_ui/guanbi_up.png")
    rank_shop:appendComponent(gjzdh_close_button)
    gjzdh_close_button:setPositionInContainer(cc.p(928.5,31.5))
    table_rank_shop["gjzdh_close_button"] = gjzdh_close_button

    local gjzdh_dangqian_label = fc.FLabel:createBMFont()
    gjzdh_dangqian_label:setSize(cc.size(140,30))
    gjzdh_dangqian_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_dangqian_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	gjzdh_dangqian_label:setString("當前積分：")
    else
    	gjzdh_dangqian_label:setString("当前积分：")
    end
    gjzdh_dangqian_label:setColor(cc.c3b(250, 255, 165))
    rank_shop:appendComponent(gjzdh_dangqian_label)
    gjzdh_dangqian_label:setPositionInContainer(cc.p(98,98))
    table_rank_shop["gjzdh_dangqian_label"] = gjzdh_dangqian_label

    local gjzdh_dangqian_num_label = fc.FLabel:createBMFont()
    gjzdh_dangqian_num_label:setSize(cc.size(56,30))
    gjzdh_dangqian_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_dangqian_num_label:setFontSize(20)
    gjzdh_dangqian_num_label:setString("999")
    gjzdh_dangqian_num_label:setColor(cc.c3b(250, 255, 165))
    rank_shop:appendComponent(gjzdh_dangqian_num_label)
    gjzdh_dangqian_num_label:setPositionInContainer(cc.p(196,98))
    table_rank_shop["gjzdh_dangqian_num_label"] = gjzdh_dangqian_num_label

    local topbar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar:setSize(cc.size(960,13))
    topbar:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(topbar)
    topbar:setPositionInContainer(cc.p(480,71.5))
    table_rank_shop["topbar"] = topbar

    local bottomBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar:setSize(cc.size(960,13))
    bottomBar:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(bottomBar)
    bottomBar:setPositionInContainer(cc.p(480,137.5))
    table_rank_shop["bottomBar"] = bottomBar

    local title_label = fc.FContainerPanel:create()
    title_label:setSize(cc.size(180,30))
    title_label:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(title_label)
    title_label:setPositionInContainer(cc.p(480,34))
    table_rank_shop["title_label"] = title_label

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/ji1.png")
    gong:setSize(cc.size(40,40))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(20,20))
    table_rank_shop["gong"] = gong

    local fen = fc.FExtensionsImage:create()
    fen:setImage("batch_ui/fen1.png")
    fen:setSize(cc.size(40,40))
    fen:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(fen)
    fen:setPositionInContainer(cc.p(67,20))
    table_rank_shop["fen"] = fen

    local shang = fc.FExtensionsImage:create()
    shang:setImage("batch_ui/shang (2).png")
    shang:setSize(cc.size(40,40))
    shang:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(shang)
    shang:setPositionInContainer(cc.p(113,20))
    table_rank_shop["shang"] = shang

    local dian = fc.FExtensionsImage:create()
    dian:setImage("batch_ui/dian.png")
    dian:setSize(cc.size(40,40))
    dian:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(dian)
    dian:setPositionInContainer(cc.p(160,20))
    table_rank_shop["dian"] = dian

    local rs_list = fc.FContainerList:create(2)
    rs_list:setSize(cc.size(960,460))
    rs_list:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(rs_list)
    rs_list:setPositionInContainer(cc.p(480,384))
    table_rank_shop["rs_list"] = rs_list

    local shuaxin_label = fc.FLabel:createBMFont()
    shuaxin_label:setSize(cc.size(140,30))
    shuaxin_label:setAnchorPoint(cc.p(0.5,0.5))
    shuaxin_label:setFontSize(20)
    shuaxin_label:setString("本次刷新消耗")
    shuaxin_label:setColor(cc.c3b(250, 255, 165))
    rank_shop:appendComponent(shuaxin_label)
    shuaxin_label:setPositionInContainer(cc.p(616,98))
    table_rank_shop["shuaxin_label"] = shuaxin_label

    local refreshBtn = fc.FScaleButton:create()
    refreshBtn:setSize(cc.size(146,53))
    refreshBtn:setAnchorPoint(cc.p(0.5,0.5))
    refreshBtn:setButtonImage("batch_ui/teshuanniu.png")
    rank_shop:appendComponent(refreshBtn)
    refreshBtn:setPositionInContainer(cc.p(889,103.5))
    table_rank_shop["refreshBtn"] = refreshBtn

    local shua = fc.FExtensionsImage:create()
    shua:setImage("batch_ui/shua_uizi.png")
    shua:setSize(cc.size(32,32))
    shua:setAnchorPoint(cc.p(0.5,0.5))
    refreshBtn:appendComponent(shua)
    shua:setPositionInContainer(cc.p(47,26))
    table_rank_shop["shua"] = shua

    local xin = fc.FExtensionsImage:create()
    xin:setImage("batch_ui/xin1_uizi.png")
    xin:setSize(cc.size(32,32))
    xin:setAnchorPoint(cc.p(0.5,0.5))
    refreshBtn:appendComponent(xin)
    xin:setPositionInContainer(cc.p(97,26))
    table_rank_shop["xin"] = xin

    local numBg = fc.FExtensionsImage:create()
    numBg:setImage("batch_ui/shuruwenzi.png")
    numBg:setSize(cc.size(80,30))
    numBg:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(numBg)
    numBg:setPositionInContainer(cc.p(768,104))
    table_rank_shop["numBg"] = numBg

    local shuaxin_num = fc.FLabel:createBMFont()
    shuaxin_num:setSize(cc.size(60,30))
    shuaxin_num:setAnchorPoint(cc.p(0.5,0.5))
    shuaxin_num:setFontSize(20)
    shuaxin_num:setString("本次刷新消耗")
    shuaxin_num:setColor(cc.c3b(250, 255, 165))
    rank_shop:appendComponent(shuaxin_num)
    shuaxin_num:setPositionInContainer(cc.p(768,98))
    table_rank_shop["shuaxin_num"] = shuaxin_num

    local xiaci_label = fc.FLabel:createBMFont()
    xiaci_label:setSize(cc.size(140,30))
    xiaci_label:setAnchorPoint(cc.p(0.5,0.5))
    xiaci_label:setFontSize(20)
    xiaci_label:setColor(cc.c3b(250, 255, 165))
    rank_shop:appendComponent(xiaci_label)
    xiaci_label:setPositionInContainer(cc.p(336,98))
    table_rank_shop["xiaci_label"] = xiaci_label

    local timer_label = fc.FLabel:createBMFont()
    timer_label:setSize(cc.size(140,30))
    timer_label:setAnchorPoint(cc.p(0.5,0.5))
    timer_label:setFontSize(20)
    timer_label:setString("下次刷新")
    timer_label:setColor(cc.c3b(250, 255, 165))
    rank_shop:appendComponent(timer_label)
    timer_label:setPositionInContainer(cc.p(449,98))
    table_rank_shop["timer_label"] = timer_label

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao.png")
    yuanbao:setSize(cc.size(50,35))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    rank_shop:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(706,104.5))
    table_rank_shop["yuanbao"] = yuanbao

    return table_rank_shop

end

