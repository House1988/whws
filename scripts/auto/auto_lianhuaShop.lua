function createlianhuaShop()

    local table_lianhuaShop = {}

    local lianhuaShop = fc.FContainerPanel:create()
    lianhuaShop:setSize(cc.size(960,640))
    table_lianhuaShop["lianhuaShop"] = lianhuaShop

    local gjzdh_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    gjzdh_bg_image:setSize(cc.size(960,640))
    gjzdh_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(gjzdh_bg_image)
    gjzdh_bg_image:setPositionInContainer(cc.p(480,320))
    table_lianhuaShop["gjzdh_bg_image"] = gjzdh_bg_image

    local gjzdh_title_bg_image = fc.FExtensionsImage:create()
    gjzdh_title_bg_image:setImage("nobatch/title_hougong.png")
    gjzdh_title_bg_image:setSize(cc.size(480,67))
    gjzdh_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(gjzdh_title_bg_image)
    gjzdh_title_bg_image:setPositionInContainer(cc.p(240,33.5))
    table_lianhuaShop["gjzdh_title_bg_image"] = gjzdh_title_bg_image

    local gjzdh_title_bg_image2 = fc.FExtensionsImage:create()
    gjzdh_title_bg_image2:setImage("nobatch/title_hougong.png")
    gjzdh_title_bg_image2:setSize(cc.size(480,67))
    gjzdh_title_bg_image2:setFlipType(2)
    gjzdh_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(gjzdh_title_bg_image2)
    gjzdh_title_bg_image2:setPositionInContainer(cc.p(717,33.5))
    table_lianhuaShop["gjzdh_title_bg_image2"] = gjzdh_title_bg_image2

    local gjzdh_close_button = fc.FScaleButton:create()
    gjzdh_close_button:setSize(cc.size(59,59))
    gjzdh_close_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_close_button:setButtonImage("batch_ui/guanbi_up.png")
    lianhuaShop:appendComponent(gjzdh_close_button)
    gjzdh_close_button:setPositionInContainer(cc.p(928.5,31.5))
    table_lianhuaShop["gjzdh_close_button"] = gjzdh_close_button

    local gjzdh_dangqian_label = fc.FLabel:createBMFont()
    gjzdh_dangqian_label:setSize(cc.size(140,30))
    gjzdh_dangqian_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_dangqian_label:setFontSize(20)
    gjzdh_dangqian_label:setString("当前真龙宝印：")
    gjzdh_dangqian_label:setColor(cc.c3b(250, 255, 165))
    lianhuaShop:appendComponent(gjzdh_dangqian_label)
    gjzdh_dangqian_label:setPositionInContainer(cc.p(77,98))
    table_lianhuaShop["gjzdh_dangqian_label"] = gjzdh_dangqian_label

    local topbar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar:setSize(cc.size(960,13))
    topbar:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(topbar)
    topbar:setPositionInContainer(cc.p(480,71.5))
    table_lianhuaShop["topbar"] = topbar

    local bottomBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar:setSize(cc.size(960,13))
    bottomBar:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(bottomBar)
    bottomBar:setPositionInContainer(cc.p(480,137.5))
    table_lianhuaShop["bottomBar"] = bottomBar

    local title_label = fc.FContainerPanel:create()
    title_label:setSize(cc.size(180,30))
    title_label:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(title_label)
    title_label:setPositionInContainer(cc.p(480,34))
    table_lianhuaShop["title_label"] = title_label

    local zhen = fc.FExtensionsImage:create()
    zhen:setImage("batch_ui/zhen (2).png")
    zhen:setSize(cc.size(40,40))
    zhen:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(zhen)
    zhen:setPositionInContainer(cc.p(20,20))
    table_lianhuaShop["zhen"] = zhen

    local long = fc.FExtensionsImage:create()
    long:setImage("batch_ui/long.png")
    long:setSize(cc.size(40,40))
    long:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(long)
    long:setPositionInContainer(cc.p(67,20))
    table_lianhuaShop["long"] = long

    local bao = fc.FExtensionsImage:create()
    bao:setImage("batch_ui/bao (2).png")
    bao:setSize(cc.size(40,40))
    bao:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(bao)
    bao:setPositionInContainer(cc.p(113,20))
    table_lianhuaShop["bao"] = bao

    local ge = fc.FExtensionsImage:create()
    ge:setImage("batch_ui/ge.png")
    ge:setSize(cc.size(40,40))
    ge:setAnchorPoint(cc.p(0.5,0.5))
    title_label:appendComponent(ge)
    ge:setPositionInContainer(cc.p(160,20))
    table_lianhuaShop["ge"] = ge

    local rs_list = fc.FContainerList:create(2)
    rs_list:setSize(cc.size(960,460))
    rs_list:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(rs_list)
    rs_list:setPositionInContainer(cc.p(480,384))
    table_lianhuaShop["rs_list"] = rs_list

    local shuaxin_label = fc.FLabel:createBMFont()
    shuaxin_label:setSize(cc.size(140,30))
    shuaxin_label:setAnchorPoint(cc.p(0.5,0.5))
    shuaxin_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	shuaxin_label:setString("下次刷新時間")
    else
	    shuaxin_label:setString("下次刷新时间")
    end
    shuaxin_label:setColor(cc.c3b(250, 255, 165))
    lianhuaShop:appendComponent(shuaxin_label)
    shuaxin_label:setPositionInContainer(cc.p(621,98))
    table_lianhuaShop["shuaxin_label"] = shuaxin_label

    local refreshBtn = fc.FScaleButton:create()
    refreshBtn:setSize(cc.size(146,53))
    refreshBtn:setAnchorPoint(cc.p(0.5,0.5))
    refreshBtn:setButtonImage("batch_ui/teshuanniu.png")
    lianhuaShop:appendComponent(refreshBtn)
    refreshBtn:setPositionInContainer(cc.p(889,103.5))
    table_lianhuaShop["refreshBtn"] = refreshBtn

    local shua = fc.FExtensionsImage:create()
    shua:setImage("batch_ui/shua_uizi.png")
    shua:setSize(cc.size(32,32))
    shua:setAnchorPoint(cc.p(0.5,0.5))
    refreshBtn:appendComponent(shua)
    shua:setPositionInContainer(cc.p(47,26))
    table_lianhuaShop["shua"] = shua

    local xin = fc.FExtensionsImage:create()
    xin:setImage("batch_ui/xin1_uizi.png")
    xin:setSize(cc.size(32,32))
    xin:setAnchorPoint(cc.p(0.5,0.5))
    refreshBtn:appendComponent(xin)
    xin:setPositionInContainer(cc.p(97,26))
    table_lianhuaShop["xin"] = xin

    local numBg = fc.FExtensionsImage:create()
    numBg:setImage("batch_ui/shuruwenzi.png")
    numBg:setSize(cc.size(120,30))
    numBg:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(numBg)
    numBg:setPositionInContainer(cc.p(748,103))
    table_lianhuaShop["numBg"] = numBg

    local shuaxin_num = fc.FLabel:createBMFont()
    shuaxin_num:setSize(cc.size(60,30))
    shuaxin_num:setAnchorPoint(cc.p(0.5,0.5))
    shuaxin_num:setFontSize(20)
    shuaxin_num:setString("本次刷新消耗")
    shuaxin_num:setColor(cc.c3b(0, 255, 255))
    lianhuaShop:appendComponent(shuaxin_num)
    shuaxin_num:setPositionInContainer(cc.p(748,98))
    table_lianhuaShop["shuaxin_num"] = shuaxin_num

    local numbgshort = fc.FExtensionsImage:create()
    numbgshort:setImage("batch_ui/shuruwenzi.png")
    numbgshort:setSize(cc.size(100,30))
    numbgshort:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(numbgshort)
    numbgshort:setPositionInContainer(cc.p(190,103))
    table_lianhuaShop["numbgshort"] = numbgshort

    local gjzdh_dangqian_num_label = fc.FLabel:createBMFont()
    gjzdh_dangqian_num_label:setSize(cc.size(56,30))
    gjzdh_dangqian_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_dangqian_num_label:setFontSize(20)
    gjzdh_dangqian_num_label:setString("999")
    gjzdh_dangqian_num_label:setColor(cc.c3b(0, 255, 255))
    lianhuaShop:appendComponent(gjzdh_dangqian_num_label)
    gjzdh_dangqian_num_label:setPositionInContainer(cc.p(190,98))
    table_lianhuaShop["gjzdh_dangqian_num_label"] = gjzdh_dangqian_num_label

    local jitianBtn = fc.FScaleButton:create()
    jitianBtn:setSize(cc.size(146,53))
    jitianBtn:setAnchorPoint(cc.p(0.5,0.5))
    jitianBtn:setButtonImage("batch_ui/teshuanniu.png")
    lianhuaShop:appendComponent(jitianBtn)
    jitianBtn:setPositionInContainer(cc.p(314,103.5))
    table_lianhuaShop["jitianBtn"] = jitianBtn

    local qian = fc.FExtensionsImage:create()
    qian:setImage("batch_ui/qian_uizi.png")
    qian:setSize(cc.size(32,32))
    qian:setAnchorPoint(cc.p(0.5,0.5))
    jitianBtn:appendComponent(qian)
    qian:setPositionInContainer(cc.p(31,26))
    table_lianhuaShop["qian"] = qian

    local wang = fc.FExtensionsImage:create()
    wang:setImage("batch_ui/wang_uizi.png")
    wang:setSize(cc.size(32,32))
    wang:setAnchorPoint(cc.p(0.5,0.5))
    jitianBtn:appendComponent(wang)
    wang:setPositionInContainer(cc.p(59,26))
    table_lianhuaShop["wang"] = wang

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji_uizi (3).png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    jitianBtn:appendComponent(ji)
    ji:setPositionInContainer(cc.p(86,26))
    table_lianhuaShop["ji"] = ji

    local tian = fc.FExtensionsImage:create()
    tian:setImage("batch_ui/tian_uizi.png")
    tian:setSize(cc.size(32,32))
    tian:setAnchorPoint(cc.p(0.5,0.5))
    jitianBtn:appendComponent(tian)
    tian:setPositionInContainer(cc.p(114,26))
    table_lianhuaShop["tian"] = tian

    local numbgshort1 = fc.FExtensionsImage:create()
    numbgshort1:setImage("batch_ui/shuruwenzi.png")
    numbgshort1:setSize(cc.size(80,30))
    numbgshort1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaShop:appendComponent(numbgshort1)
    numbgshort1:setPositionInContainer(cc.p(517,103))
    table_lianhuaShop["numbgshort1"] = numbgshort1

    local shuaxinLing = fc.FLabel:createBMFont()
    shuaxinLing:setSize(cc.size(80,30))
    shuaxinLing:setAnchorPoint(cc.p(0.5,0.5))
    shuaxinLing:setFontSize(20)
    shuaxinLing:setString("刷新令：")
    shuaxinLing:setColor(cc.c3b(250, 255, 165))
    lianhuaShop:appendComponent(shuaxinLing)
    shuaxinLing:setPositionInContainer(cc.p(435,98))
    table_lianhuaShop["shuaxinLing"] = shuaxinLing

    local shuaxinlingNum = fc.FLabel:createBMFont()
    shuaxinlingNum:setSize(cc.size(56,30))
    shuaxinlingNum:setAnchorPoint(cc.p(0.5,0.5))
    shuaxinlingNum:setFontSize(20)
    shuaxinlingNum:setString("999")
    shuaxinlingNum:setColor(cc.c3b(0, 255, 255))
    lianhuaShop:appendComponent(shuaxinlingNum)
    shuaxinlingNum:setPositionInContainer(cc.p(517,98))
    table_lianhuaShop["shuaxinlingNum"] = shuaxinlingNum

    return table_lianhuaShop

end

