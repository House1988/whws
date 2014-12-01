function createmingchen_shengji()

    local table_mingchen_shengji = {}

    local mingchen_shengji = fc.FContainerPanel:create()
    mingchen_shengji:setSize(cc.size(960,640))
    table_mingchen_shengji["mingchen_shengji"] = mingchen_shengji

    local shengji_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    shengji_bg_image:setSize(cc.size(960,640))
    shengji_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_bg_image)
    shengji_bg_image:setPositionInContainer(cc.p(480,320))
    table_mingchen_shengji["shengji_bg_image"] = shengji_bg_image

    local shengji_pre_page_button = fc.FScaleButton:create()
    shengji_pre_page_button:setSize(cc.size(38,60))
    shengji_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    shengji_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    mingchen_shengji:appendComponent(shengji_pre_page_button)
    shengji_pre_page_button:setPositionInContainer(cc.p(23,325))
    table_mingchen_shengji["shengji_pre_page_button"] = shengji_pre_page_button

    local shengji_back_page_button = fc.FScaleButton:create()
    shengji_back_page_button:setSize(cc.size(38,60))
    shengji_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    shengji_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    shengji_back_page_button:setScaleX(-1)
    mingchen_shengji:appendComponent(shengji_back_page_button)
    shengji_back_page_button:setPositionInContainer(cc.p(936,325))
    table_mingchen_shengji["shengji_back_page_button"] = shengji_back_page_button

    local shengji_title_bg_image2 = fc.FExtensionsImage:create()
    shengji_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    shengji_title_bg_image2:setSize(cc.size(483,67))
    shengji_title_bg_image2:setFlipType(2)
    shengji_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_title_bg_image2)
    shengji_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_mingchen_shengji["shengji_title_bg_image2"] = shengji_title_bg_image2

    local shengji_title_bg_image = fc.FExtensionsImage:create()
    shengji_title_bg_image:setImage("nobatch/title_mingchen_.png")
    shengji_title_bg_image:setSize(cc.size(483,67))
    shengji_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_title_bg_image)
    shengji_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_mingchen_shengji["shengji_title_bg_image"] = shengji_title_bg_image

    local shengji_title_image = fc.FContainerPanel:create()
    shengji_title_image:setSize(cc.size(316,34))
    shengji_title_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_title_image)
    shengji_title_image:setPositionInContainer(cc.p(473,35))
    table_mingchen_shengji["shengji_title_image"] = shengji_title_image

    local sheng = fc.FExtensionsImage:create()
    sheng:setImage("batch_ui/sheng.png")
    sheng:setSize(cc.size(40,40))
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    shengji_title_image:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(20,20))
    table_mingchen_shengji["sheng"] = sheng

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji.png")
    ji:setSize(cc.size(40,40))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    shengji_title_image:appendComponent(ji)
    ji:setPositionInContainer(cc.p(75,20))
    table_mingchen_shengji["ji"] = ji

    local cai = fc.FExtensionsImage:create()
    cai:setImage("batch_ui/cai.png")
    cai:setSize(cc.size(40,40))
    cai:setAnchorPoint(cc.p(0.5,0.5))
    shengji_title_image:appendComponent(cai)
    cai:setPositionInContainer(cc.p(130,20))
    table_mingchen_shengji["cai"] = cai

    local liao = fc.FExtensionsImage:create()
    liao:setImage("batch_ui/liao.png")
    liao:setSize(cc.size(40,40))
    liao:setAnchorPoint(cc.p(0.5,0.5))
    shengji_title_image:appendComponent(liao)
    liao:setPositionInContainer(cc.p(186,20))
    table_mingchen_shengji["liao"] = liao

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    shengji_title_image:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(241,20))
    table_mingchen_shengji["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    shengji_title_image:appendComponent(ze)
    ze:setPositionInContainer(cc.p(296,20))
    table_mingchen_shengji["ze"] = ze

    local huawen_right = fc.FExtensionsImage:create()
    huawen_right:setImage("batch_ui/title_mingchen_2.png")
    huawen_right:setSize(cc.size(62,121))
    huawen_right:setFlipType(2)
    huawen_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(huawen_right)
    huawen_right:setPositionInContainer(cc.p(929,60.5))
    table_mingchen_shengji["huawen_right"] = huawen_right

    local shengji_close_button = fc.FScaleButton:create()
    shengji_close_button:setSize(cc.size(52,52))
    shengji_close_button:setAnchorPoint(cc.p(0.5,0.5))
    shengji_close_button:setButtonImage("batch_ui/guanbi_up.png")
    mingchen_shengji:appendComponent(shengji_close_button)
    shengji_close_button:setPositionInContainer(cc.p(930,33))
    table_mingchen_shengji["shengji_close_button"] = shengji_close_button

    local wen_left = fc.FExtensionsImage:create()
    wen_left:setImage("nobatch/banzidikuang_tongyong.png")
    wen_left:setSize(cc.size(220,163))
    wen_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(wen_left)
    wen_left:setPositionInContainer(cc.p(110,148.5))
    table_mingchen_shengji["wen_left"] = wen_left

    local wen_right = fc.FExtensionsImage:create()
    wen_right:setImage("nobatch/banzidikuang_tongyong.png")
    wen_right:setSize(cc.size(220,163))
    wen_right:setFlipType(2)
    wen_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(wen_right)
    wen_right:setPositionInContainer(cc.p(845,174.5))
    table_mingchen_shengji["wen_right"] = wen_right

    local wen_leftbottom = fc.FExtensionsImage:create()
    wen_leftbottom:setImage("nobatch/banzidikuang_tongyong.png")
    wen_leftbottom:setSize(cc.size(220,163))
    wen_leftbottom:setFlipType(4)
    wen_leftbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(wen_leftbottom)
    wen_leftbottom:setPositionInContainer(cc.p(110,558.5))
    table_mingchen_shengji["wen_leftbottom"] = wen_leftbottom

    local wen_rightbottom = fc.FExtensionsImage:create()
    wen_rightbottom:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rightbottom:setSize(cc.size(220,163))
    wen_rightbottom:setFlipType(8)
    wen_rightbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(wen_rightbottom)
    wen_rightbottom:setPositionInContainer(cc.p(850,558.5))
    table_mingchen_shengji["wen_rightbottom"] = wen_rightbottom

    local huawen_left = fc.FExtensionsImage:create()
    huawen_left:setImage("batch_ui/title_mingchen_2.png")
    huawen_left:setSize(cc.size(62,121))
    huawen_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(huawen_left)
    huawen_left:setPositionInContainer(cc.p(31,60.5))
    table_mingchen_shengji["huawen_left"] = huawen_left

    local shengji_shengji_button = fc.FScaleButton:create()
    shengji_shengji_button:setSize(cc.size(144,53))
    shengji_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    shengji_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchen_shengji:appendComponent(shengji_shengji_button)
    shengji_shengji_button:setPositionInContainer(cc.p(856,592.5))
    table_mingchen_shengji["shengji_shengji_button"] = shengji_shengji_button

    local btn_sheng = fc.FExtensionsImage:create()
    btn_sheng:setImage("batch_ui/sheng1_uizi.png")
    btn_sheng:setSize(cc.size(32,32))
    btn_sheng:setAnchorPoint(cc.p(0.5,0.5))
    shengji_shengji_button:appendComponent(btn_sheng)
    btn_sheng:setPositionInContainer(cc.p(54,26))
    table_mingchen_shengji["btn_sheng"] = btn_sheng

    local btn_ji = fc.FExtensionsImage:create()
    btn_ji:setImage("batch_ui/ji1_uizi.png")
    btn_ji:setSize(cc.size(32,32))
    btn_ji:setAnchorPoint(cc.p(0.5,0.5))
    shengji_shengji_button:appendComponent(btn_ji)
    btn_ji:setPositionInContainer(cc.p(90,26))
    table_mingchen_shengji["btn_ji"] = btn_ji

    local bottom_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    bottom_image:setSize(cc.size(720,89))
    bottom_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(bottom_image)
    bottom_image:setPositionInContainer(cc.p(403,584.5))
    table_mingchen_shengji["bottom_image"] = bottom_image

    local sj_quanxuan_check_box = fc.FCheckBox:create()
    sj_quanxuan_check_box:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    sj_quanxuan_check_box:setSize(cc.size(47,47))
    sj_quanxuan_check_box:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(sj_quanxuan_check_box)
    sj_quanxuan_check_box:setPositionInContainer(cc.p(91.5,585.5))
    table_mingchen_shengji["sj_quanxuan_check_box"] = sj_quanxuan_check_box

    local shengji_down_panel = fc.FContainerPanel:create()
    shengji_down_panel:setSize(cc.size(720,89))
    shengji_down_panel:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_down_panel)
    shengji_down_panel:setPositionInContainer(cc.p(403,584.5))
    table_mingchen_shengji["shengji_down_panel"] = shengji_down_panel

    local shengji_bottom_xiaohao_label = fc.FLabel:createBMFont()
    shengji_bottom_xiaohao_label:setSize(cc.size(130,30))
    shengji_bottom_xiaohao_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_xiaohao_label:setFontSize(20)
	shengji_bottom_xiaohao_label:setString("消耗名臣卡：")
    shengji_bottom_xiaohao_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_xiaohao_label)
    shengji_bottom_xiaohao_label:setPositionInContainer(cc.p(237,26))
    table_mingchen_shengji["shengji_bottom_xiaohao_label"] = shengji_bottom_xiaohao_label

    local shengji_bottom_xuyaoyinliang_label = fc.FLabel:createBMFont()
    shengji_bottom_xuyaoyinliang_label:setSize(cc.size(110,30))
    shengji_bottom_xuyaoyinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_xuyaoyinliang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 shengji_bottom_xuyaoyinliang_label:setString("需要銀兩：")
    else
	    shengji_bottom_xuyaoyinliang_label:setString("需要银两：")
    end
    shengji_bottom_xuyaoyinliang_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_xuyaoyinliang_label)
    shengji_bottom_xuyaoyinliang_label:setPositionInContainer(cc.p(227,66))
    table_mingchen_shengji["shengji_bottom_xuyaoyinliang_label"] = shengji_bottom_xuyaoyinliang_label

    local shengji_bottom_xiaohao_num_label = fc.FLabel:createBMFont()
    shengji_bottom_xiaohao_num_label:setSize(cc.size(50,30))
    shengji_bottom_xiaohao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_xiaohao_num_label:setFontSize(21)
    shengji_bottom_xiaohao_num_label:setString("25")
    shengji_bottom_xiaohao_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_xiaohao_num_label)
    shengji_bottom_xiaohao_num_label:setPositionInContainer(cc.p(317,26))
    table_mingchen_shengji["shengji_bottom_xiaohao_num_label"] = shengji_bottom_xiaohao_num_label

    local shengji_bottom_xuyaoyinliang_num_label = fc.FLabel:createBMFont()
    shengji_bottom_xuyaoyinliang_num_label:setSize(cc.size(60,30))
    shengji_bottom_xuyaoyinliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_xuyaoyinliang_num_label:setFontSize(21)
    shengji_bottom_xuyaoyinliang_num_label:setString("100")
    shengji_bottom_xuyaoyinliang_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_xuyaoyinliang_num_label)
    shengji_bottom_xuyaoyinliang_num_label:setPositionInContainer(cc.p(318,66))
    table_mingchen_shengji["shengji_bottom_xuyaoyinliang_num_label"] = shengji_bottom_xuyaoyinliang_num_label

    local shengji_bottom_dejingyan_label = fc.FLabel:createBMFont()
    shengji_bottom_dejingyan_label:setSize(cc.size(130,30))
    shengji_bottom_dejingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_dejingyan_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	shengji_bottom_dejingyan_label:setString("可獲得經驗：")
    else
    	shengji_bottom_dejingyan_label:setString("可获得经验：")
    end
    
    shengji_bottom_dejingyan_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_dejingyan_label)
    shengji_bottom_dejingyan_label:setPositionInContainer(cc.p(498,26))
    table_mingchen_shengji["shengji_bottom_dejingyan_label"] = shengji_bottom_dejingyan_label

    local shengji_bottom_keshengzhi_label = fc.FLabel:createBMFont()
    shengji_bottom_keshengzhi_label:setSize(cc.size(70,30))
    shengji_bottom_keshengzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_keshengzhi_label:setFontSize(20)
	shengji_bottom_keshengzhi_label:setString("可升至")
    shengji_down_panel:appendComponent(shengji_bottom_keshengzhi_label)
    shengji_bottom_keshengzhi_label:setPositionInContainer(cc.p(468,66))
    table_mingchen_shengji["shengji_bottom_keshengzhi_label"] = shengji_bottom_keshengzhi_label

    local shengji_bottom_dejingyan_num_label = fc.FLabel:createBMFont()
    shengji_bottom_dejingyan_num_label:setSize(cc.size(60,30))
    shengji_bottom_dejingyan_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_dejingyan_num_label:setFontSize(21)
    shengji_bottom_dejingyan_num_label:setString("11")
    shengji_bottom_dejingyan_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_dejingyan_num_label)
    shengji_bottom_dejingyan_num_label:setPositionInContainer(cc.p(587,26))
    table_mingchen_shengji["shengji_bottom_dejingyan_num_label"] = shengji_bottom_dejingyan_num_label

    local shengji_bottom_keshengzhi_num_label = fc.FLabel:createBMFont()
    shengji_bottom_keshengzhi_num_label:setSize(cc.size(50,30))
    shengji_bottom_keshengzhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_keshengzhi_num_label:setFontSize(21)
    shengji_bottom_keshengzhi_num_label:setString("56")
    shengji_bottom_keshengzhi_num_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_keshengzhi_num_label)
    shengji_bottom_keshengzhi_num_label:setPositionInContainer(cc.p(528,66))
    table_mingchen_shengji["shengji_bottom_keshengzhi_num_label"] = shengji_bottom_keshengzhi_num_label

    local shengji_bottom_keshengzhi_ji_label = fc.FLabel:createBMFont()
    shengji_bottom_keshengzhi_ji_label:setSize(cc.size(30,30))
    shengji_bottom_keshengzhi_ji_label:setAnchorPoint(cc.p(0.5,0.5))
    shengji_bottom_keshengzhi_ji_label:setFontSize(20)
      if LANGUAGE_TYPE == 3 then
	    shengji_bottom_keshengzhi_ji_label:setString("級")
      else
	    shengji_bottom_keshengzhi_ji_label:setString("级")
      end
    shengji_bottom_keshengzhi_ji_label:setColor(cc.c3b(106,68,19))
    shengji_down_panel:appendComponent(shengji_bottom_keshengzhi_ji_label)
    shengji_bottom_keshengzhi_ji_label:setPositionInContainer(cc.p(562,66))
    table_mingchen_shengji["shengji_bottom_keshengzhi_ji_label"] = shengji_bottom_keshengzhi_ji_label

    local delete_down_panel = fc.FContainerPanel:create()
    delete_down_panel:setSize(cc.size(720,89))
    delete_down_panel:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(delete_down_panel)
    delete_down_panel:setPositionInContainer(cc.p(403,584.5))
    table_mingchen_shengji["delete_down_panel"] = delete_down_panel

    local delete_tip_label = fc.FLabel:createBMFont()
    delete_tip_label:setSize(cc.size(300,30))
    delete_tip_label:setAnchorPoint(cc.p(0.5,0.5))
    delete_tip_label:setFontSize(20)
    delete_tip_label:setString("遣散后可获得银两：")
    delete_tip_label:setColor(cc.c3b(106,68,19))
    delete_down_panel:appendComponent(delete_tip_label)
    delete_tip_label:setPositionInContainer(cc.p(366,45))
    table_mingchen_shengji["delete_tip_label"] = delete_tip_label

    local delete_get_silver = fc.FLabel:createBMFont()
    delete_get_silver:setSize(cc.size(60,30))
    delete_get_silver:setAnchorPoint(cc.p(0.5,0.5))
    delete_get_silver:setFontSize(21)
    delete_get_silver:setString("101")
    delete_get_silver:setColor(cc.c3b(106,68,19))
    delete_down_panel:appendComponent(delete_get_silver)
    delete_get_silver:setPositionInContainer(cc.p(496,45))
    table_mingchen_shengji["delete_get_silver"] = delete_get_silver

    local delete_title_image = fc.FContainerPanel:create()
    delete_title_image:setSize(cc.size(396,36))
    delete_title_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(delete_title_image)
    delete_title_image:setPositionInContainer(cc.p(482,36))
    table_mingchen_shengji["delete_title_image"] = delete_title_image

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_3.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(qing)
    qing:setPositionInContainer(cc.p(20,20))
    table_mingchen_shengji["qing"] = qing

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(64,20))
    table_mingchen_shengji["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(ze)
    ze:setPositionInContainer(cc.p(109,20))
    table_mingchen_shengji["ze"] = ze

    local yao = fc.FExtensionsImage:create()
    yao:setImage("batch_ui/yao.png")
    yao:setSize(cc.size(40,40))
    yao:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(yao)
    yao:setPositionInContainer(cc.p(154,20))
    table_mingchen_shengji["yao"] = yao

    local qian = fc.FExtensionsImage:create()
    qian:setImage("batch_ui/qian.png")
    qian:setSize(cc.size(40,40))
    qian:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(qian)
    qian:setPositionInContainer(cc.p(198,20))
    table_mingchen_shengji["qian"] = qian

    local san = fc.FExtensionsImage:create()
    san:setImage("batch_ui/san.png")
    san:setSize(cc.size(40,40))
    san:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(san)
    san:setPositionInContainer(cc.p(242,20))
    table_mingchen_shengji["san"] = san

    local de = fc.FExtensionsImage:create()
    de:setImage("batch_ui/de.png")
    de:setSize(cc.size(40,40))
    de:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(de)
    de:setPositionInContainer(cc.p(287,20))
    table_mingchen_shengji["de"] = de

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming.png")
    ming:setSize(cc.size(40,40))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(ming)
    ming:setPositionInContainer(cc.p(332,20))
    table_mingchen_shengji["ming"] = ming

    local chen = fc.FExtensionsImage:create()
    chen:setImage("batch_ui/chen.png")
    chen:setSize(cc.size(40,40))
    chen:setAnchorPoint(cc.p(0.5,0.5))
    delete_title_image:appendComponent(chen)
    chen:setPositionInContainer(cc.p(376,20))
    table_mingchen_shengji["chen"] = chen

    local delete_button = fc.FScaleButton:create()
    delete_button:setSize(cc.size(144,53))
    delete_button:setAnchorPoint(cc.p(0.5,0.5))
    delete_button:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchen_shengji:appendComponent(delete_button)
    delete_button:setPositionInContainer(cc.p(856,592.5))
    table_mingchen_shengji["delete_button"] = delete_button

    local btn_qian = fc.FShaderExtensionsImage:create(0)
    btn_qian:setAnchorPoint(cc.p(0.5,0.5))
    btn_qian:setImage("batch_ui/qian3_uizi.png")
    btn_qian:setSize(cc.size(32,32))
    delete_button:appendComponent(btn_qian)
    btn_qian:setPositionInContainer(cc.p(54,26))
    table_mingchen_shengji["btn_qian"] = btn_qian

    local btn_san = fc.FShaderExtensionsImage:create(0)
    btn_san:setAnchorPoint(cc.p(0.5,0.5))
    btn_san:setImage("batch_ui/san_uizi.png")
    btn_san:setSize(cc.size(32,32))
    delete_button:appendComponent(btn_san)
    btn_san:setPositionInContainer(cc.p(90,26))
    table_mingchen_shengji["btn_san"] = btn_san

    local quanxuan_label = fc.FContainerPanel:create()
    quanxuan_label:setSize(cc.size(60,30))
    quanxuan_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(quanxuan_label)
    quanxuan_label:setPositionInContainer(cc.p(145,586))
    table_mingchen_shengji["quanxuan_label"] = quanxuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_mingchen_shengji["quan"] = quan

    local xuan1 = fc.FExtensionsImage:create()
    xuan1:setImage("batch_ui/xuan_uizi.png")
    xuan1:setSize(cc.size(32,32))
    xuan1:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(xuan1)
    xuan1:setPositionInContainer(cc.p(44,16))
    table_mingchen_shengji["xuan1"] = xuan1

    local shengji_yinliang_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    shengji_yinliang_di:setSize(cc.size(180,40))
    shengji_yinliang_di:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_yinliang_di)
    shengji_yinliang_di:setPositionInContainer(cc.p(804,35))
    table_mingchen_shengji["shengji_yinliang_di"] = shengji_yinliang_di

    local shengji_yinliang = fc.FExtensionsImage:create()
    shengji_yinliang:setImage("batch_ui/yinliangDouble.png")
    shengji_yinliang:setSize(cc.size(54,42))
    shengji_yinliang:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_shengji:appendComponent(shengji_yinliang)
    shengji_yinliang:setPositionInContainer(cc.p(747,35))
    table_mingchen_shengji["shengji_yinliang"] = shengji_yinliang

    local shengji_yinliang_num = fc.FLabel:createBMFont()
    shengji_yinliang_num:setSize(cc.size(70,30))
    shengji_yinliang_num:setAnchorPoint(cc.p(0.5,0.5))
    shengji_yinliang_num:setFontSize(21)
    shengji_yinliang_num:setString("9999")
    shengji_yinliang_num:setColor(cc.c3b(250,255,165))
    mingchen_shengji:appendComponent(shengji_yinliang_num)
    shengji_yinliang_num:setPositionInContainer(cc.p(831,34))
    table_mingchen_shengji["shengji_yinliang_num"] = shengji_yinliang_num

    return table_mingchen_shengji

end

