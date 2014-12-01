function createlianhuaPanel()

    local table_lianhuaPanel = {}

    local lianhuaPanel = fc.FContainerPanel:create()
    lianhuaPanel:setSize(cc.size(960,640))
    table_lianhuaPanel["lianhuaPanel"] = lianhuaPanel

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    bg:setSize(cc.size(960,640))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bg)
    bg:setPositionInContainer(cc.p(480,320))
    table_lianhuaPanel["bg"] = bg

    local midbgL = fc.FExtensionsImage:create()
    midbgL:setImage("nobatch/jitianbg.png")
    midbgL:setSize(cc.size(257,542))
    midbgL:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(midbgL)
    midbgL:setPositionInContainer(cc.p(351.5,369))
    table_lianhuaPanel["midbgL"] = midbgL

    local midbgR = fc.FExtensionsImage:create()
    midbgR:setImage("nobatch/jitianbg.png")
    midbgR:setSize(cc.size(257,542))
    midbgR:setFlipType(2)
    midbgR:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(midbgR)
    midbgR:setPositionInContainer(cc.p(608.5,369))
    table_lianhuaPanel["midbgR"] = midbgR

    local xiangqing_biaotidiwen_image = fc.FExtensionsImage:create()
    xiangqing_biaotidiwen_image:setImage("nobatch/title_mingchen_.png")
    xiangqing_biaotidiwen_image:setSize(cc.size(483,67))
    xiangqing_biaotidiwen_image:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(xiangqing_biaotidiwen_image)
    xiangqing_biaotidiwen_image:setPositionInContainer(cc.p(241.5,33.5))
    table_lianhuaPanel["xiangqing_biaotidiwen_image"] = xiangqing_biaotidiwen_image

    local xiangqing_biaotidiwen_image2 = fc.FExtensionsImage:create()
    xiangqing_biaotidiwen_image2:setImage("nobatch/title_mingchen_.png")
    xiangqing_biaotidiwen_image2:setSize(cc.size(483,67))
    xiangqing_biaotidiwen_image2:setFlipType(2)
    xiangqing_biaotidiwen_image2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(xiangqing_biaotidiwen_image2)
    xiangqing_biaotidiwen_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_lianhuaPanel["xiangqing_biaotidiwen_image2"] = xiangqing_biaotidiwen_image2

    local titlelabel = fc.FContainerPanel:create()
    titlelabel:setSize(cc.size(180,50))
    titlelabel:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(titlelabel)
    titlelabel:setPositionInContainer(cc.p(480,37))
    table_lianhuaPanel["titlelabel"] = titlelabel

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji1 (2).png")
    ji:setSize(cc.size(40,40))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    titlelabel:appendComponent(ji)
    ji:setPositionInContainer(cc.p(20,20))
    table_lianhuaPanel["ji"] = ji

    local tan = fc.FExtensionsImage:create()
    tan:setImage("batch_ui/tan.png")
    tan:setSize(cc.size(40,40))
    tan:setAnchorPoint(cc.p(0.5,0.5))
    titlelabel:appendComponent(tan)
    tan:setPositionInContainer(cc.p(160,20))
    table_lianhuaPanel["tan"] = tan

    local tian = fc.FExtensionsImage:create()
    tian:setImage("batch_ui/tian (2).png")
    tian:setSize(cc.size(40,40))
    tian:setAnchorPoint(cc.p(0.5,0.5))
    titlelabel:appendComponent(tian)
    tian:setPositionInContainer(cc.p(90,20))
    table_lianhuaPanel["tian"] = tian

    local topshort = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    topshort:setSize(cc.size(210,50))
    topshort:setAnchorPoint(cc.p(0.5,0.5))
    topshort:setScaleY(-1)
    lianhuaPanel:appendComponent(topshort)
    topshort:setPositionInContainer(cc.p(105,92))
    table_lianhuaPanel["topshort"] = topshort

    local toplong = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    toplong:setSize(cc.size(490,50))
    toplong:setAnchorPoint(cc.p(0.5,0.5))
    toplong:setScaleY(-1)
    lianhuaPanel:appendComponent(toplong)
    toplong:setPositionInContainer(cc.p(480,92))
    table_lianhuaPanel["toplong"] = toplong

    local bottomlong = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    bottomlong:setSize(cc.size(490,50))
    bottomlong:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bottomlong)
    bottomlong:setPositionInContainer(cc.p(480,615))
    table_lianhuaPanel["bottomlong"] = bottomlong

    local bottomshort = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    bottomshort:setSize(cc.size(210,50))
    bottomshort:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bottomshort)
    bottomshort:setPositionInContainer(cc.p(105,615))
    table_lianhuaPanel["bottomshort"] = bottomshort

    local frameout = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frameout:setSize(cc.size(210,470))
    frameout:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(frameout)
    frameout:setPositionInContainer(cc.p(110,352))
    table_lianhuaPanel["frameout"] = frameout

    local frameout = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frameout:setSize(cc.size(210,470))
    frameout:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(frameout)
    frameout:setPositionInContainer(cc.p(851,351))
    table_lianhuaPanel["frameout"] = frameout

    local mingchengbtn = fc.FRadioButton:create()
    mingchengbtn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    mingchengbtn:setSize(cc.size(159,45))
    mingchengbtn:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(mingchengbtn)
    mingchengbtn:setPositionInContainer(cc.p(105.5,166.5))
    table_lianhuaPanel["mingchengbtn"] = mingchengbtn

    local meimvbtn = fc.FRadioButton:create()
    meimvbtn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    meimvbtn:setSize(cc.size(159,45))
    meimvbtn:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(meimvbtn)
    meimvbtn:setPositionInContainer(cc.p(105.5,219.5))
    table_lianhuaPanel["meimvbtn"] = meimvbtn

    local zhuangbeibtn = fc.FRadioButton:create()
    zhuangbeibtn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    zhuangbeibtn:setSize(cc.size(159,45))
    zhuangbeibtn:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(zhuangbeibtn)
    zhuangbeibtn:setPositionInContainer(cc.p(105.5,272.5))
    table_lianhuaPanel["zhuangbeibtn"] = zhuangbeibtn

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming_uizi.png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(ming)
    ming:setPositionInContainer(cc.p(65,166))
    table_lianhuaPanel["ming"] = ming

    local chen = fc.FExtensionsImage:create()
    chen:setImage("batch_ui/chen_uizi.png")
    chen:setSize(cc.size(32,32))
    chen:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(chen)
    chen:setPositionInContainer(cc.p(92,166))
    table_lianhuaPanel["chen"] = chen

    local ji1 = fc.FExtensionsImage:create()
    ji1:setImage("batch_ui/ji_uizi (3).png")
    ji1:setSize(cc.size(32,32))
    ji1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(ji1)
    ji1:setPositionInContainer(cc.p(119,166))
    table_lianhuaPanel["ji1"] = ji1

    local tian1 = fc.FExtensionsImage:create()
    tian1:setImage("batch_ui/tian_uizi.png")
    tian1:setSize(cc.size(32,32))
    tian1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(tian1)
    tian1:setPositionInContainer(cc.p(146,166))
    table_lianhuaPanel["tian1"] = tian1

    local zhuang = fc.FExtensionsImage:create()
    zhuang:setImage("batch_ui/zhuang_uizi.png")
    zhuang:setSize(cc.size(32,32))
    zhuang:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(zhuang)
    zhuang:setPositionInContainer(cc.p(65,272))
    table_lianhuaPanel["zhuang"] = zhuang

    local bei = fc.FExtensionsImage:create()
    bei:setImage("batch_ui/bei_uizi.png")
    bei:setSize(cc.size(32,32))
    bei:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bei)
    bei:setPositionInContainer(cc.p(92,272))
    table_lianhuaPanel["bei"] = bei

    local mei = fc.FExtensionsImage:create()
    mei:setImage("batch_ui/mei_uizi (2).png")
    mei:setSize(cc.size(32,32))
    mei:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(mei)
    mei:setPositionInContainer(cc.p(65,220))
    table_lianhuaPanel["mei"] = mei

    local nv = fc.FExtensionsImage:create()
    nv:setImage("batch_ui/nv_uizi.png")
    nv:setSize(cc.size(32,32))
    nv:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(nv)
    nv:setPositionInContainer(cc.p(92,220))
    table_lianhuaPanel["nv"] = nv

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(146,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/teshuanniu.png")
    lianhuaPanel:appendComponent(btn)
    btn:setPositionInContainer(cc.p(105,528.5))
    table_lianhuaPanel["btn"] = btn

    local zhen = fc.FExtensionsImage:create()
    zhen:setImage("batch_ui/zhen_uizi(2).png")
    zhen:setSize(cc.size(32,32))
    zhen:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(zhen)
    zhen:setPositionInContainer(cc.p(31,26))
    table_lianhuaPanel["zhen"] = zhen

    local long = fc.FExtensionsImage:create()
    long:setImage("batch_ui/long_uizi.png")
    long:setSize(cc.size(32,32))
    long:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(long)
    long:setPositionInContainer(cc.p(59,26))
    table_lianhuaPanel["long"] = long

    local bao = fc.FExtensionsImage:create()
    bao:setImage("batch_ui/bao_uizi (2).png")
    bao:setSize(cc.size(32,32))
    bao:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(bao)
    bao:setPositionInContainer(cc.p(86,27))
    table_lianhuaPanel["bao"] = bao

    local ge = fc.FExtensionsImage:create()
    ge:setImage("batch_ui/ge1_uizi.png")
    ge:setSize(cc.size(32,32))
    ge:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(ge)
    ge:setPositionInContainer(cc.p(114,26))
    table_lianhuaPanel["ge"] = ge

    local des1 = fc.FLabel:createBMFont()
    des1:setSize(cc.size(180,20))
    des1:setWidth(180)
    des1:setAnchorPoint(cc.p(0.5,0.5))
    des1:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    des1:setString("消耗三星及以上材料進行祭天，可獲得")    
    else
   		des1:setString("消耗三星及以上材料进行祭天，可获得")
    end
    des1:setColor(cc.c3b(254,255,232))
    lianhuaPanel:appendComponent(des1)
    des1:setPositionInContainer(cc.p(105,342))
    table_lianhuaPanel["des1"] = des1

    local des2 = fc.FLabel:createBMFont()
    des2:setSize(cc.size(180,20))
    des2:setWidth(180)
    des2:setAnchorPoint(cc.p(0.5,0.5))
    des2:setFontSize(21)
     if LANGUAGE_TYPE == 3 then
     	 des2:setString("真龍寶印")
     else
     	 des2:setString("真龙宝印")
     end
    des2:setColor(cc.c3b(0,255,255))
    lianhuaPanel:appendComponent(des2)
    des2:setPositionInContainer(cc.p(105,394))
    table_lianhuaPanel["des2"] = des2

    local des3 = fc.FLabel:createBMFont()
    des3:setSize(cc.size(180,20))
    des3:setWidth(180)
    des3:setAnchorPoint(cc.p(0.5,0.5))
    des3:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	 des3:setString("可在真龍寶閣中兌換卡牌、裝備、道具")
    else
    	 des3:setString("可在真龙宝阁中兑换卡牌、装备、道具")
    end
    des3:setColor(cc.c3b(254,255,232))
    lianhuaPanel:appendComponent(des3)
    des3:setPositionInContainer(cc.p(105,444))
    table_lianhuaPanel["des3"] = des3

    local btnYijian = fc.FScaleButton:create()
    btnYijian:setSize(cc.size(144,53))
    btnYijian:setAnchorPoint(cc.p(0.5,0.5))
    btnYijian:setButtonImage("batch_ui/putonganniu1_up.png")
    lianhuaPanel:appendComponent(btnYijian)
    btnYijian:setPositionInContainer(cc.p(317,553.5))
    table_lianhuaPanel["btnYijian"] = btnYijian

    local yi = fc.FExtensionsImage:create()
    yi:setImage("batch_ui/yi_uizi.png")
    yi:setSize(cc.size(32,32))
    yi:setAnchorPoint(cc.p(0.5,0.5))
    btnYijian:appendComponent(yi)
    yi:setPositionInContainer(cc.p(29,26))
    table_lianhuaPanel["yi"] = yi

    local jian = fc.FExtensionsImage:create()
    jian:setImage("batch_ui/jian_uizi (2).png")
    jian:setSize(cc.size(32,32))
    jian:setAnchorPoint(cc.p(0.5,0.5))
    btnYijian:appendComponent(jian)
    jian:setPositionInContainer(cc.p(57,26))
    table_lianhuaPanel["jian"] = jian

    local tian = fc.FExtensionsImage:create()
    tian:setImage("batch_ui/tian_uizi (2).png")
    tian:setSize(cc.size(32,32))
    tian:setAnchorPoint(cc.p(0.5,0.5))
    btnYijian:appendComponent(tian)
    tian:setPositionInContainer(cc.p(85,26))
    table_lianhuaPanel["tian"] = tian

    local jia = fc.FExtensionsImage:create()
    jia:setImage("batch_ui/jia_uizi.png")
    jia:setSize(cc.size(32,32))
    jia:setAnchorPoint(cc.p(0.5,0.5))
    btnYijian:appendComponent(jia)
    jia:setPositionInContainer(cc.p(113,26))
    table_lianhuaPanel["jia"] = jia

    local btnChongzhi = fc.FScaleButton:create()
    btnChongzhi:setSize(cc.size(144,53))
    btnChongzhi:setAnchorPoint(cc.p(0.5,0.5))
    btnChongzhi:setButtonImage("batch_ui/putonganniu1_up.png")
    lianhuaPanel:appendComponent(btnChongzhi)
    btnChongzhi:setPositionInContainer(cc.p(643,553.5))
    table_lianhuaPanel["btnChongzhi"] = btnChongzhi

    local chong = fc.FExtensionsImage:create()
    chong:setImage("batch_ui/chong3_uizi.png")
    chong:setSize(cc.size(32,32))
    chong:setAnchorPoint(cc.p(0.5,0.5))
    btnChongzhi:appendComponent(chong)
    chong:setPositionInContainer(cc.p(42,27))
    table_lianhuaPanel["chong"] = chong

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi1_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    btnChongzhi:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(100,25))
    table_lianhuaPanel["zhi"] = zhi

    local rp1 = fc.FContainerPanel:create()
    rp1:setSize(cc.size(94,125))
    rp1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(rp1)
    rp1:setPositionInContainer(cc.p(799,198.5))
    table_lianhuaPanel["rp1"] = rp1

    local rp2 = fc.FContainerPanel:create()
    rp2:setSize(cc.size(94,125))
    rp2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(rp2)
    rp2:setPositionInContainer(cc.p(903,198.5))
    table_lianhuaPanel["rp2"] = rp2

    local rp3 = fc.FContainerPanel:create()
    rp3:setSize(cc.size(94,125))
    rp3:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(rp3)
    rp3:setPositionInContainer(cc.p(799,345.5))
    table_lianhuaPanel["rp3"] = rp3

    local rp4 = fc.FContainerPanel:create()
    rp4:setSize(cc.size(94,125))
    rp4:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(rp4)
    rp4:setPositionInContainer(cc.p(903,346.5))
    table_lianhuaPanel["rp4"] = rp4

    local rp5 = fc.FContainerPanel:create()
    rp5:setSize(cc.size(94,125))
    rp5:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(rp5)
    rp5:setPositionInContainer(cc.p(799,492.5))
    table_lianhuaPanel["rp5"] = rp5

    local rp6 = fc.FContainerPanel:create()
    rp6:setSize(cc.size(94,125))
    rp6:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(rp6)
    rp6:setPositionInContainer(cc.p(903,492.5))
    table_lianhuaPanel["rp6"] = rp6

    local title1 = fc.FLabel:createBMFont()
    title1:setSize(cc.size(180,20))
    title1:setWidth(180)
    title1:setAnchorPoint(cc.p(0.5,0.5))
    title1:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    title1:setString("當前擁有真龍寶印")
    else
	    title1:setString("当前拥有真龙宝印")
    end
    title1:setColor(cc.c3b(0,255,0))
    lianhuaPanel:appendComponent(title1)
    title1:setPositionInContainer(cc.p(419,87))
    table_lianhuaPanel["title1"] = title1

    local titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    titlebg:setSize(cc.size(120,30))
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(571,92))
    table_lianhuaPanel["titlebg"] = titlebg

    local num = fc.FLabel:createBMFont()
    num:setSize(cc.size(120,20))
    num:setWidth(180)
    num:setAnchorPoint(cc.p(0.5,0.5))
    num:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	num:setString("當前擁有真龍寶印")
    else
    	num:setString("当前拥有真龙宝印")
    end
    num:setColor(cc.c3b(0,255,255))
    lianhuaPanel:appendComponent(num)
    num:setPositionInContainer(cc.p(571,87))
    table_lianhuaPanel["num"] = num

    local ji2 = fc.FExtensionsImage:create()
    ji2:setImage("batch_ui/ji_uizi (3).png")
    ji2:setSize(cc.size(32,32))
    ji2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(ji2)
    ji2:setPositionInContainer(cc.p(121,219))
    table_lianhuaPanel["ji2"] = ji2

    local ji3 = fc.FExtensionsImage:create()
    ji3:setImage("batch_ui/ji_uizi (3).png")
    ji3:setSize(cc.size(32,32))
    ji3:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(ji3)
    ji3:setPositionInContainer(cc.p(122,272))
    table_lianhuaPanel["ji3"] = ji3

    local tian2 = fc.FExtensionsImage:create()
    tian2:setImage("batch_ui/tian_uizi.png")
    tian2:setSize(cc.size(32,32))
    tian2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(tian2)
    tian2:setPositionInContainer(cc.p(146,219))
    table_lianhuaPanel["tian2"] = tian2

    local tian3 = fc.FExtensionsImage:create()
    tian3:setImage("batch_ui/tian_uizi.png")
    tian3:setSize(cc.size(32,32))
    tian3:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(tian3)
    tian3:setPositionInContainer(cc.p(146,272))
    table_lianhuaPanel["tian3"] = tian3

    local topshort1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    topshort1:setSize(cc.size(210,50))
    topshort1:setAnchorPoint(cc.p(0.5,0.5))
    topshort1:setScaleY(-1)
    lianhuaPanel:appendComponent(topshort1)
    topshort1:setPositionInContainer(cc.p(855,92))
    table_lianhuaPanel["topshort1"] = topshort1

    local title2 = fc.FLabel:createBMFont()
    title2:setSize(cc.size(180,20))
    title2:setWidth(180)
    title2:setAnchorPoint(cc.p(0.5,0.5))
    title2:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    title2:setString("此次祭天可獲得")    
    else
	    title2:setString("此次祭天可获得")
    end
    title2:setColor(cc.c3b(0,255,255))
    lianhuaPanel:appendComponent(title2)
    title2:setPositionInContainer(cc.p(853,87))
    table_lianhuaPanel["title2"] = title2

    local bottomshort1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    bottomshort1:setSize(cc.size(210,50))
    bottomshort1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bottomshort1)
    bottomshort1:setPositionInContainer(cc.p(852,615))
    table_lianhuaPanel["bottomshort1"] = bottomshort1

    local bottombar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottombar:setSize(cc.size(960,13))
    bottombar:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bottombar)
    bottombar:setPositionInContainer(cc.p(481,633.5))
    table_lianhuaPanel["bottombar"] = bottombar

    local bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    bar:setSize(cc.size(25,573))
    bar:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bar)
    bar:setPositionInContainer(cc.p(222.5,352.5))
    table_lianhuaPanel["bar"] = bar

    local bar1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    bar1:setSize(cc.size(25,573))
    bar1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(bar1)
    bar1:setPositionInContainer(cc.p(737.5,352.5))
    table_lianhuaPanel["bar1"] = bar1

    local pos1 = fc.FContainerPanel:create()
    pos1:setSize(cc.size(75,100))
    pos1:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos1)
    pos1:setPositionInContainer(cc.p(294.5,177))
    table_lianhuaPanel["pos1"] = pos1

    local pos2 = fc.FContainerPanel:create()
    pos2:setSize(cc.size(75,100))
    pos2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos2)
    pos2:setPositionInContainer(cc.p(271.5,290))
    table_lianhuaPanel["pos2"] = pos2

    local pos3 = fc.FContainerPanel:create()
    pos3:setSize(cc.size(75,100))
    pos3:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos3)
    pos3:setPositionInContainer(cc.p(332.5,401))
    table_lianhuaPanel["pos3"] = pos3

    local pos4 = fc.FContainerPanel:create()
    pos4:setSize(cc.size(75,100))
    pos4:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos4)
    pos4:setPositionInContainer(cc.p(429.5,475))
    table_lianhuaPanel["pos4"] = pos4

    local pos5 = fc.FContainerPanel:create()
    pos5:setSize(cc.size(75,100))
    pos5:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos5)
    pos5:setPositionInContainer(cc.p(533.5,475))
    table_lianhuaPanel["pos5"] = pos5

    local pos6 = fc.FContainerPanel:create()
    pos6:setSize(cc.size(75,100))
    pos6:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos6)
    pos6:setPositionInContainer(cc.p(628.5,401))
    table_lianhuaPanel["pos6"] = pos6

    local pos7 = fc.FContainerPanel:create()
    pos7:setSize(cc.size(75,100))
    pos7:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos7)
    pos7:setPositionInContainer(cc.p(688.5,291))
    table_lianhuaPanel["pos7"] = pos7

    local pos8 = fc.FContainerPanel:create()
    pos8:setSize(cc.size(75,100))
    pos8:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaPanel:appendComponent(pos8)
    pos8:setPositionInContainer(cc.p(672.5,177))
    table_lianhuaPanel["pos8"] = pos8

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    lianhuaPanel:appendComponent(close)
    close:setPositionInContainer(cc.p(929,37))
    table_lianhuaPanel["close"] = close

    local jitianBtn = fc.FScaleButton:create()
    jitianBtn:setSize(cc.size(124,159))
    jitianBtn:setAnchorPoint(cc.p(0.5,0.5))
    jitianBtn:setButtonImage("batch_ui/jitianjian.png")
    lianhuaPanel:appendComponent(jitianBtn)
    jitianBtn:setPositionInContainer(cc.p(480,300.5))
    table_lianhuaPanel["jitianBtn"] = jitianBtn

    return table_lianhuaPanel

end

