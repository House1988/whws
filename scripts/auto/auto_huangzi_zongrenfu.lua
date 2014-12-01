function createhuangzi_zongrenfu()

    local table_huangzi_zongrenfu = {}

    local huangzi_zongrenfu = fc.FContainerPanel:create()
    huangzi_zongrenfu:setSize(cc.size(960,640))
    table_huangzi_zongrenfu["huangzi_zongrenfu"] = huangzi_zongrenfu

    local hz_zzf_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    hz_zzf_bg_image:setSize(cc.size(960,640))
    hz_zzf_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(hz_zzf_bg_image)
    hz_zzf_bg_image:setPositionInContainer(cc.p(480,320))
    table_huangzi_zongrenfu["hz_zzf_bg_image"] = hz_zzf_bg_image

    local hz_zzf_back_page_button = fc.FScaleButton:create()
    hz_zzf_back_page_button:setSize(cc.size(38,60))
    hz_zzf_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    hz_zzf_back_page_button:setScaleX(-1)
    huangzi_zongrenfu:appendComponent(hz_zzf_back_page_button)
    hz_zzf_back_page_button:setPositionInContainer(cc.p(941,320))
    table_huangzi_zongrenfu["hz_zzf_back_page_button"] = hz_zzf_back_page_button

    local hz_zzf_pre_page_button = fc.FScaleButton:create()
    hz_zzf_pre_page_button:setSize(cc.size(38,60))
    hz_zzf_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    huangzi_zongrenfu:appendComponent(hz_zzf_pre_page_button)
    hz_zzf_pre_page_button:setPositionInContainer(cc.p(19,320))
    table_huangzi_zongrenfu["hz_zzf_pre_page_button"] = hz_zzf_pre_page_button

    local hz_zzf_title_bg_image2 = fc.FExtensionsImage:create()
    hz_zzf_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    hz_zzf_title_bg_image2:setSize(cc.size(483,67))
    hz_zzf_title_bg_image2:setFlipType(2)
    hz_zzf_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(hz_zzf_title_bg_image2)
    hz_zzf_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_huangzi_zongrenfu["hz_zzf_title_bg_image2"] = hz_zzf_title_bg_image2

    local hz_zzf_title_bg_image = fc.FExtensionsImage:create()
    hz_zzf_title_bg_image:setImage("nobatch/title_mingchen_.png")
    hz_zzf_title_bg_image:setSize(cc.size(483,67))
    hz_zzf_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(hz_zzf_title_bg_image)
    hz_zzf_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_huangzi_zongrenfu["hz_zzf_title_bg_image"] = hz_zzf_title_bg_image

    local hz_zzf_title_image = fc.FContainerPanel:create()
    hz_zzf_title_image:setSize(cc.size(146,34))
    hz_zzf_title_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(hz_zzf_title_image)
    hz_zzf_title_image:setPositionInContainer(cc.p(488,40))
    table_huangzi_zongrenfu["hz_zzf_title_image"] = hz_zzf_title_image

    local zong = fc.FExtensionsImage:create()
    zong:setImage("batch_ui/zong.png")
    zong:setSize(cc.size(40,40))
    zong:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_title_image:appendComponent(zong)
    zong:setPositionInContainer(cc.p(20,20))
    table_huangzi_zongrenfu["zong"] = zong

    local ren = fc.FExtensionsImage:create()
    ren:setImage("batch_ui/ren.png")
    ren:setSize(cc.size(40,40))
    ren:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_title_image:appendComponent(ren)
    ren:setPositionInContainer(cc.p(73,20))
    table_huangzi_zongrenfu["ren"] = ren

    local fu = fc.FExtensionsImage:create()
    fu:setImage("batch_ui/fu.png")
    fu:setSize(cc.size(40,40))
    fu:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_title_image:appendComponent(fu)
    fu:setPositionInContainer(cc.p(126,20))
    table_huangzi_zongrenfu["fu"] = fu

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_huangzi_zongrenfu["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_huangzi_zongrenfu["wen_r"] = wen_r

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_huangzi_zongrenfu["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_huangzi_zongrenfu["wen_rb"] = wen_rb

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_huangzi_zongrenfu["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_huangzi_zongrenfu["lian_right"] = lian_right

    local hz_zzf_close_button = fc.FScaleButton:create()
    hz_zzf_close_button:setSize(cc.size(52,52))
    hz_zzf_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_close_button:setButtonImage("batch_ui/guanbi_up.png")
    huangzi_zongrenfu:appendComponent(hz_zzf_close_button)
    hz_zzf_close_button:setPositionInContainer(cc.p(933,31))
    table_huangzi_zongrenfu["hz_zzf_close_button"] = hz_zzf_close_button

    local hz_zzf_shengji_button = fc.FScaleButton:create()
    hz_zzf_shengji_button:setSize(cc.size(144,53))
    hz_zzf_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_zongrenfu:appendComponent(hz_zzf_shengji_button)
    hz_zzf_shengji_button:setPositionInContainer(cc.p(849,576.5))
    table_huangzi_zongrenfu["hz_zzf_shengji_button"] = hz_zzf_shengji_button

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    hz_zzf_shengji_button:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(54,26))
    table_huangzi_zongrenfu["sheng"] = sheng

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    hz_zzf_shengji_button:appendComponent(ji)
    ji:setPositionInContainer(cc.p(90,26))
    table_huangzi_zongrenfu["ji"] = ji

    local bottom_wen = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    bottom_wen:setSize(cc.size(720,89))
    bottom_wen:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(bottom_wen)
    bottom_wen:setPositionInContainer(cc.p(380,576.5))
    table_huangzi_zongrenfu["bottom_wen"] = bottom_wen

    local shengji_down_panel = fc.FContainerPanel:create()
    shengji_down_panel:setSize(cc.size(720,89))
    shengji_down_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(shengji_down_panel)
    shengji_down_panel:setPositionInContainer(cc.p(380,576.5))
    table_huangzi_zongrenfu["shengji_down_panel"] = shengji_down_panel

    local hz_zzf_xioahao_label = fc.FLabel:createBMFont()
    hz_zzf_xioahao_label:setSize(cc.size(120,30))
    hz_zzf_xioahao_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_xioahao_label:setFontSize(20)
    hz_zzf_xioahao_label:setString("消耗皇子卡")
    hz_zzf_xioahao_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_xioahao_label)
    hz_zzf_xioahao_label:setPositionInContainer(cc.p(256,28))
    table_huangzi_zongrenfu["hz_zzf_xioahao_label"] = hz_zzf_xioahao_label

    local hz_zzf_xiaohao_num_label = fc.FLabel:createBMFont()
    hz_zzf_xiaohao_num_label:setSize(cc.size(51,30))
    hz_zzf_xiaohao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_xiaohao_num_label:setFontSize(21)
    hz_zzf_xiaohao_num_label:setString("999")
    hz_zzf_xiaohao_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_xiaohao_num_label)
    hz_zzf_xiaohao_num_label:setPositionInContainer(cc.p(341.5,28))
    table_huangzi_zongrenfu["hz_zzf_xiaohao_num_label"] = hz_zzf_xiaohao_num_label

    local hz_zzf_zhang_label = fc.FLabel:createBMFont()
    hz_zzf_zhang_label:setSize(cc.size(42,30))
    hz_zzf_zhang_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_zhang_label:setFontSize(20)
    hz_zzf_zhang_label:setString("张")
    hz_zzf_zhang_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_zhang_label)
    hz_zzf_zhang_label:setPositionInContainer(cc.p(390,28))
    table_huangzi_zongrenfu["hz_zzf_zhang_label"] = hz_zzf_zhang_label

    local hz_zzf_yinliang_label = fc.FLabel:createBMFont()
    hz_zzf_yinliang_label:setSize(cc.size(120,30))
    hz_zzf_yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_yinliang_label:setFontSize(20)
    hz_zzf_yinliang_label:setString("消耗银两")
    hz_zzf_yinliang_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_yinliang_label)
    hz_zzf_yinliang_label:setPositionInContainer(cc.p(256,58))
    table_huangzi_zongrenfu["hz_zzf_yinliang_label"] = hz_zzf_yinliang_label

    local hz_zzf_yinliang_num_label = fc.FLabel:createBMFont()
    hz_zzf_yinliang_num_label:setSize(cc.size(51,30))
    hz_zzf_yinliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_yinliang_num_label:setFontSize(21)
    hz_zzf_yinliang_num_label:setString("999")
    hz_zzf_yinliang_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_yinliang_num_label)
    hz_zzf_yinliang_num_label:setPositionInContainer(cc.p(341.5,58))
    table_huangzi_zongrenfu["hz_zzf_yinliang_num_label"] = hz_zzf_yinliang_num_label

    local hz_zzf_jingyan_label = fc.FLabel:createBMFont()
    hz_zzf_jingyan_label:setSize(cc.size(102,30))
    hz_zzf_jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_jingyan_label:setFontSize(20)
    hz_zzf_jingyan_label:setString("可得经验")
    hz_zzf_jingyan_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_jingyan_label)
    hz_zzf_jingyan_label:setPositionInContainer(cc.p(515,28))
    table_huangzi_zongrenfu["hz_zzf_jingyan_label"] = hz_zzf_jingyan_label

    local hz_zzf_jingyan_num_label = fc.FLabel:createBMFont()
    hz_zzf_jingyan_num_label:setSize(cc.size(51,30))
    hz_zzf_jingyan_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_jingyan_num_label:setFontSize(21)
    hz_zzf_jingyan_num_label:setString("999")
    hz_zzf_jingyan_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_jingyan_num_label)
    hz_zzf_jingyan_num_label:setPositionInContainer(cc.p(591.5,26))
    table_huangzi_zongrenfu["hz_zzf_jingyan_num_label"] = hz_zzf_jingyan_num_label

    local hz_zzf_shengzhi_label = fc.FLabel:createBMFont()
    hz_zzf_shengzhi_label:setSize(cc.size(78,30))
    hz_zzf_shengzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_shengzhi_label:setFontSize(20)
    hz_zzf_shengzhi_label:setString("可升至")
    hz_zzf_shengzhi_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_shengzhi_label)
    hz_zzf_shengzhi_label:setPositionInContainer(cc.p(503,58))
    table_huangzi_zongrenfu["hz_zzf_shengzhi_label"] = hz_zzf_shengzhi_label

    local hz_zzf_keshengzhi_num_label = fc.FLabel:createBMFont()
    hz_zzf_keshengzhi_num_label:setSize(cc.size(51,30))
    hz_zzf_keshengzhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_keshengzhi_num_label:setFontSize(21)
    hz_zzf_keshengzhi_num_label:setString("999")
    hz_zzf_keshengzhi_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_keshengzhi_num_label)
    hz_zzf_keshengzhi_num_label:setPositionInContainer(cc.p(567.5,58))
    table_huangzi_zongrenfu["hz_zzf_keshengzhi_num_label"] = hz_zzf_keshengzhi_num_label

    local hz_zzf_ji_label = fc.FLabel:createBMFont()
    hz_zzf_ji_label:setSize(cc.size(42,30))
    hz_zzf_ji_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_zzf_ji_label:setFontSize(20)
    hz_zzf_ji_label:setString("级")
    hz_zzf_ji_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(hz_zzf_ji_label)
    hz_zzf_ji_label:setPositionInContainer(cc.p(615,56))
    table_huangzi_zongrenfu["hz_zzf_ji_label"] = hz_zzf_ji_label

    local delete_down_panel = fc.FContainerPanel:create()
    delete_down_panel:setSize(cc.size(720,89))
    delete_down_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(delete_down_panel)
    delete_down_panel:setPositionInContainer(cc.p(380,576.5))
    table_huangzi_zongrenfu["delete_down_panel"] = delete_down_panel

    local delete_tip_label = fc.FLabel:createBMFont()
    delete_tip_label:setSize(cc.size(300,30))
    delete_tip_label:setAnchorPoint(cc.p(0.5,0.5))
    delete_tip_label:setFontSize(20)
    delete_tip_label:setString("遣散后可获得银两：")
    delete_tip_label:setColor(cc.c3b(106,68,19))
    delete_down_panel:appendComponent(delete_tip_label)
    delete_tip_label:setPositionInContainer(cc.p(394,45))
    table_huangzi_zongrenfu["delete_tip_label"] = delete_tip_label

    local delete_get_silver = fc.FLabel:createBMFont()
    delete_get_silver:setSize(cc.size(60,30))
    delete_get_silver:setAnchorPoint(cc.p(0.5,0.5))
    delete_get_silver:setFontSize(21)
    delete_get_silver:setString("101")
    delete_get_silver:setColor(cc.c3b(106,68,19))
    delete_down_panel:appendComponent(delete_get_silver)
    delete_get_silver:setPositionInContainer(cc.p(514,45))
    table_huangzi_zongrenfu["delete_get_silver"] = delete_get_silver

    local hz_zzf_quanxuan_check_box = fc.FCheckBox:create()
    hz_zzf_quanxuan_check_box:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    hz_zzf_quanxuan_check_box:setSize(cc.size(47,47))
    hz_zzf_quanxuan_check_box:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(hz_zzf_quanxuan_check_box)
    hz_zzf_quanxuan_check_box:setPositionInContainer(cc.p(75.5,576.5))
    table_huangzi_zongrenfu["hz_zzf_quanxuan_check_box"] = hz_zzf_quanxuan_check_box

    local delete_button = fc.FScaleButton:create()
    delete_button:setSize(cc.size(144,53))
    delete_button:setAnchorPoint(cc.p(0.5,0.5))
    delete_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_zongrenfu:appendComponent(delete_button)
    delete_button:setPositionInContainer(cc.p(849,576.5))
    table_huangzi_zongrenfu["delete_button"] = delete_button

    local fei1 = fc.FShaderExtensionsImage:create(0)
    fei1:setAnchorPoint(cc.p(0.5,0.5))
    fei1:setImage("batch_ui/fei1_uizi.png")
    fei1:setSize(cc.size(32,32))
    delete_button:appendComponent(fei1)
    fei1:setPositionInContainer(cc.p(54,26))
    table_huangzi_zongrenfu["fei1"] = fei1

    local chu1 = fc.FShaderExtensionsImage:create(0)
    chu1:setAnchorPoint(cc.p(0.5,0.5))
    chu1:setImage("batch_ui/chu4_uizi.png")
    chu1:setSize(cc.size(32,32))
    delete_button:appendComponent(chu1)
    chu1:setPositionInContainer(cc.p(90,26))
    table_huangzi_zongrenfu["chu1"] = chu1

    local title_image = fc.FContainerPanel:create()
    title_image:setSize(cc.size(394,30))
    title_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(title_image)
    title_image:setPositionInContainer(cc.p(488,39))
    table_huangzi_zongrenfu["title_image"] = title_image

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_3.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(qing)
    qing:setPositionInContainer(cc.p(20,20))
    table_huangzi_zongrenfu["qing"] = qing

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(64,20))
    table_huangzi_zongrenfu["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(ze)
    ze:setPositionInContainer(cc.p(108,20))
    table_huangzi_zongrenfu["ze"] = ze

    local yaoo = fc.FExtensionsImage:create()
    yaoo:setImage("batch_ui/yao.png")
    yaoo:setSize(cc.size(40,40))
    yaoo:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(yaoo)
    yaoo:setPositionInContainer(cc.p(153,20))
    table_huangzi_zongrenfu["yaoo"] = yaoo

    local fei = fc.FExtensionsImage:create()
    fei:setImage("batch_ui/fei_2.png")
    fei:setSize(cc.size(40,40))
    fei:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(fei)
    fei:setPositionInContainer(cc.p(197,20))
    table_huangzi_zongrenfu["fei"] = fei

    local chu = fc.FExtensionsImage:create()
    chu:setImage("batch_ui/chu_2.png")
    chu:setSize(cc.size(40,40))
    chu:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(chu)
    chu:setPositionInContainer(cc.p(241,20))
    table_huangzi_zongrenfu["chu"] = chu

    local de = fc.FExtensionsImage:create()
    de:setImage("batch_ui/de.png")
    de:setSize(cc.size(40,40))
    de:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(de)
    de:setPositionInContainer(cc.p(285,20))
    table_huangzi_zongrenfu["de"] = de

    local huang = fc.FExtensionsImage:create()
    huang:setImage("batch_ui/huang.png")
    huang:setSize(cc.size(40,40))
    huang:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(huang)
    huang:setPositionInContainer(cc.p(330,20))
    table_huangzi_zongrenfu["huang"] = huang

    local zi = fc.FExtensionsImage:create()
    zi:setImage("batch_ui/zi.png")
    zi:setSize(cc.size(40,40))
    zi:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(zi)
    zi:setPositionInContainer(cc.p(374,20))
    table_huangzi_zongrenfu["zi"] = zi

    local quanxuan_label = fc.FContainerPanel:create()
    quanxuan_label:setSize(cc.size(60,30))
    quanxuan_label:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_zongrenfu:appendComponent(quanxuan_label)
    quanxuan_label:setPositionInContainer(cc.p(128,576))
    table_huangzi_zongrenfu["quanxuan_label"] = quanxuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_huangzi_zongrenfu["quan"] = quan

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(44,16))
    table_huangzi_zongrenfu["xuan"] = xuan

    return table_huangzi_zongrenfu

end

