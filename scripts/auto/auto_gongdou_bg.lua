function creategongdou_bg()

    local table_gongdou_bg = {}

    local gongdou_bg = fc.FContainerPanel:create()
    gongdou_bg:setSize(cc.size(960,640))
    table_gongdou_bg["gongdou_bg"] = gongdou_bg

    local gd_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    gd_bg_image:setSize(cc.size(960,640))
    gd_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(gd_bg_image)
    gd_bg_image:setPositionInContainer(cc.p(480,320))
    table_gongdou_bg["gd_bg_image"] = gd_bg_image

    local tiao_left = fc.FExtensionsImage:create()
    tiao_left:setImage("nobatch/title_hougong.png")
    tiao_left:setSize(cc.size(480,67))
    tiao_left:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(tiao_left)
    tiao_left:setPositionInContainer(cc.p(240,33.5))
    table_gongdou_bg["tiao_left"] = tiao_left

    local tiao_right = fc.FExtensionsImage:create()
    tiao_right:setImage("nobatch/title_hougong.png")
    tiao_right:setSize(cc.size(480,67))
    tiao_right:setFlipType(2)
    tiao_right:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(tiao_right)
    tiao_right:setPositionInContainer(cc.p(720,33.5))
    table_gongdou_bg["tiao_right"] = tiao_right

    local gd_biaoti_image = fc.FContainerPanel:create()
    gd_biaoti_image:setSize(cc.size(129,34))
    gd_biaoti_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(gd_biaoti_image)
    gd_biaoti_image:setPositionInContainer(cc.p(480.5,35))
    table_gongdou_bg["gd_biaoti_image"] = gd_biaoti_image

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong.png")
    gong:setSize(cc.size(40,40))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gd_biaoti_image:appendComponent(gong)
    gong:setPositionInContainer(cc.p(20,20))
    table_gongdou_bg["gong"] = gong

    local dou = fc.FExtensionsImage:create()
    dou:setImage("batch_ui/dou.png")
    dou:setSize(cc.size(40,40))
    dou:setAnchorPoint(cc.p(0.5,0.5))
    gd_biaoti_image:appendComponent(dou)
    dou:setPositionInContainer(cc.p(109,20))
    table_gongdou_bg["dou"] = dou

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_gongdou_bg["wen_l"] = wen_l

    local lian_l = fc.FExtensionsImage:create()
    lian_l:setImage("batch_ui/title_mingchen_2.png")
    lian_l:setSize(cc.size(62,121))
    lian_l:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(lian_l)
    lian_l:setPositionInContainer(cc.p(31,70.5))
    table_gongdou_bg["lian_l"] = lian_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_gongdou_bg["wen_r"] = wen_r

    local lian_r = fc.FExtensionsImage:create()
    lian_r:setImage("batch_ui/title_mingchen_2.png")
    lian_r:setSize(cc.size(62,121))
    lian_r:setFlipType(2)
    lian_r:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(lian_r)
    lian_r:setPositionInContainer(cc.p(929,70.5))
    table_gongdou_bg["lian_r"] = lian_r

    local gd_close_button = fc.FScaleButton:create()
    gd_close_button:setSize(cc.size(52,52))
    gd_close_button:setAnchorPoint(cc.p(0.5,0.5))
    gd_close_button:setButtonImage("batch_ui/guanbi_up.png")
    gongdou_bg:appendComponent(gd_close_button)
    gd_close_button:setPositionInContainer(cc.p(931,37))
    table_gongdou_bg["gd_close_button"] = gd_close_button

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_gongdou_bg["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_gongdou_bg["wen_rb"] = wen_rb

    local gd_delete_image = fc.FContainerPanel:create()
    gd_delete_image:setSize(cc.size(394,30))
    gd_delete_image:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(gd_delete_image)
    gd_delete_image:setPositionInContainer(cc.p(481,35))
    table_gongdou_bg["gd_delete_image"] = gd_delete_image

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_3.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(qing)
    qing:setPositionInContainer(cc.p(20,20))
    table_gongdou_bg["qing"] = qing

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(64,20))
    table_gongdou_bg["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(ze)
    ze:setPositionInContainer(cc.p(108,20))
    table_gongdou_bg["ze"] = ze

    local yao = fc.FExtensionsImage:create()
    yao:setImage("batch_ui/yao.png")
    yao:setSize(cc.size(40,40))
    yao:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(yao)
    yao:setPositionInContainer(cc.p(153,20))
    table_gongdou_bg["yao"] = yao

    local qian = fc.FExtensionsImage:create()
    qian:setImage("batch_ui/qian.png")
    qian:setSize(cc.size(40,40))
    qian:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(qian)
    qian:setPositionInContainer(cc.p(197,20))
    table_gongdou_bg["qian"] = qian

    local san = fc.FExtensionsImage:create()
    san:setImage("batch_ui/san.png")
    san:setSize(cc.size(40,40))
    san:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(san)
    san:setPositionInContainer(cc.p(241,20))
    table_gongdou_bg["san"] = san

    local de = fc.FExtensionsImage:create()
    de:setImage("batch_ui/de.png")
    de:setSize(cc.size(40,40))
    de:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(de)
    de:setPositionInContainer(cc.p(286,20))
    table_gongdou_bg["de"] = de

    local mei = fc.FExtensionsImage:create()
    mei:setImage("batch_ui/mei.png")
    mei:setSize(cc.size(40,40))
    mei:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(mei)
    mei:setPositionInContainer(cc.p(330,20))
    table_gongdou_bg["mei"] = mei

    local nv = fc.FExtensionsImage:create()
    nv:setImage("batch_ui/nv.png")
    nv:setSize(cc.size(40,40))
    nv:setAnchorPoint(cc.p(0.5,0.5))
    gd_delete_image:appendComponent(nv)
    nv:setPositionInContainer(cc.p(374,20))
    table_gongdou_bg["nv"] = nv

    local gongdou_yinliang_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    gongdou_yinliang_di:setSize(cc.size(180,40))
    gongdou_yinliang_di:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(gongdou_yinliang_di)
    gongdou_yinliang_di:setPositionInContainer(cc.p(800,36))
    table_gongdou_bg["gongdou_yinliang_di"] = gongdou_yinliang_di

    local gongdou_yinliang = fc.FExtensionsImage:create()
    gongdou_yinliang:setImage("batch_ui/yinliangDouble.png")
    gongdou_yinliang:setSize(cc.size(54,42))
    gongdou_yinliang:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bg:appendComponent(gongdou_yinliang)
    gongdou_yinliang:setPositionInContainer(cc.p(745,35))
    table_gongdou_bg["gongdou_yinliang"] = gongdou_yinliang

    local gongdou_yinliang_num = fc.FLabel:createBMFont()
    gongdou_yinliang_num:setSize(cc.size(70,30))
    gongdou_yinliang_num:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_yinliang_num:setFontSize(21)
    gongdou_yinliang_num:setString("9999")
    gongdou_yinliang_num:setColor(cc.c3b(250,255,165))
    gongdou_bg:appendComponent(gongdou_yinliang_num)
    gongdou_yinliang_num:setPositionInContainer(cc.p(838,34))
    table_gongdou_bg["gongdou_yinliang_num"] = gongdou_yinliang_num

    return table_gongdou_bg

end

