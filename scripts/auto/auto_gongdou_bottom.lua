function creategongdou_bottom()

    local table_gongdou_bottom = {}

    local gongdou_bottom = fc.FContainerPanel:create()
    gongdou_bottom:setSize(cc.size(960,640))
    table_gongdou_bottom["gongdou_bottom"] = gongdou_bottom

    local gd_btm_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    gd_btm_bg_scale9:setSize(cc.size(735,80))
    gd_btm_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(gd_btm_bg_scale9)
    gd_btm_bg_scale9:setPositionInContainer(cc.p(400.5,598))
    table_gongdou_bottom["gd_btm_bg_scale9"] = gd_btm_bg_scale9

    local gd_btm_xiaohaomvk_label = fc.FLabel:createBMFont()
    gd_btm_xiaohaomvk_label:setSize(cc.size(130,30))
    gd_btm_xiaohaomvk_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_xiaohaomvk_label:setFontSize(20)
	gd_btm_xiaohaomvk_label:setString("消耗美女卡：")
    gd_btm_xiaohaomvk_label:setColor(cc.c3b(91,24,6))
    gongdou_bottom:appendComponent(gd_btm_xiaohaomvk_label)
    gd_btm_xiaohaomvk_label:setPositionInContainer(cc.p(244,578))
    table_gongdou_bottom["gd_btm_xiaohaomvk_label"] = gd_btm_xiaohaomvk_label

    local gd_btm_jingyan_label = fc.FLabel:createBMFont()
    gd_btm_jingyan_label:setSize(cc.size(110,30))
    gd_btm_jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_jingyan_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	gd_btm_jingyan_label:setString("可得經驗：")
    else
    	gd_btm_jingyan_label:setString("可得经验：")
    end
    gd_btm_jingyan_label:setColor(cc.c3b(91,24,6))
    gongdou_bottom:appendComponent(gd_btm_jingyan_label)
    gd_btm_jingyan_label:setPositionInContainer(cc.p(234,616))
    table_gongdou_bottom["gd_btm_jingyan_label"] = gd_btm_jingyan_label

    local gd_btm_yinliang_label = fc.FLabel:createBMFont()
    gd_btm_yinliang_label:setSize(cc.size(110,30))
    gd_btm_yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_yinliang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	gd_btm_yinliang_label:setString("消耗銀兩：")
    else
	    gd_btm_yinliang_label:setString("消耗银两：")
    end
    gd_btm_yinliang_label:setColor(cc.c3b(91,24,6))
    gongdou_bottom:appendComponent(gd_btm_yinliang_label)
    gd_btm_yinliang_label:setPositionInContainer(cc.p(449,578))
    table_gongdou_bottom["gd_btm_yinliang_label"] = gd_btm_yinliang_label

    local gd_btm_keshengdao_label = fc.FLabel:createBMFont()
    gd_btm_keshengdao_label:setSize(cc.size(90,30))
    gd_btm_keshengdao_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_keshengdao_label:setFontSize(20)
    gd_btm_keshengdao_label:setString("可升到：")
    gd_btm_keshengdao_label:setColor(cc.c3b(91,24,6))
    gongdou_bottom:appendComponent(gd_btm_keshengdao_label)
    gd_btm_keshengdao_label:setPositionInContainer(cc.p(632,579))
    table_gongdou_bottom["gd_btm_keshengdao_label"] = gd_btm_keshengdao_label

    local gd_btm_qinmidu_label = fc.FLabel:createBMFont()
    gd_btm_qinmidu_label:setSize(cc.size(130,30))
    gd_btm_qinmidu_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_qinmidu_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	gd_btm_qinmidu_label:setString("可得親密度：")
    else
    	gd_btm_qinmidu_label:setString("可得亲密度：")
    end
    gd_btm_qinmidu_label:setColor(cc.c3b(91,24,6))
    gongdou_bottom:appendComponent(gd_btm_qinmidu_label)
    gd_btm_qinmidu_label:setPositionInContainer(cc.p(444,617))
    table_gongdou_bottom["gd_btm_qinmidu_label"] = gd_btm_qinmidu_label

    local gd_shengji_button = fc.FScaleButton:create()
    gd_shengji_button:setSize(cc.size(144,53))
    gd_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    gd_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    gongdou_bottom:appendComponent(gd_shengji_button)
    gd_shengji_button:setPositionInContainer(cc.p(868,591.5))
    table_gongdou_bottom["gd_shengji_button"] = gd_shengji_button

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    gd_shengji_button:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(46,26))
    table_gongdou_bottom["sheng"] = sheng

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    gd_shengji_button:appendComponent(ji)
    ji:setPositionInContainer(cc.p(97,26))
    table_gongdou_bottom["ji"] = ji

    local gd_quanxuan_checkbox = fc.FCheckBox:create()
    gd_quanxuan_checkbox:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    gd_quanxuan_checkbox:setSize(cc.size(47,47))
    gd_quanxuan_checkbox:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(gd_quanxuan_checkbox)
    gd_quanxuan_checkbox:setPositionInContainer(cc.p(72.5,600.5))
    table_gongdou_bottom["gd_quanxuan_checkbox"] = gd_quanxuan_checkbox

    local quanxuan_label = fc.FContainerPanel:create()
    quanxuan_label:setSize(cc.size(60,30))
    quanxuan_label:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(quanxuan_label)
    quanxuan_label:setPositionInContainer(cc.p(126,601))
    table_gongdou_bottom["quanxuan_label"] = quanxuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_gongdou_bottom["quan"] = quan

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(44,16))
    table_gongdou_bottom["xuan"] = xuan

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(90,25))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(347,581.5))
    table_gongdou_bottom["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(90,25))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(532,581.5))
    table_gongdou_bottom["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(90,25))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(324,618.5))
    table_gongdou_bottom["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(90,25))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(548,619.5))
    table_gongdou_bottom["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(90,25))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    gongdou_bottom:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(716,582.5))
    table_gongdou_bottom["textbg"] = textbg

    local gd_btm_xiaohaomvk_num_label = fc.FLabel:createBMFont()
    gd_btm_xiaohaomvk_num_label:setSize(cc.size(70,30))
    gd_btm_xiaohaomvk_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_xiaohaomvk_num_label:setFontSize(21)
    gd_btm_xiaohaomvk_num_label:setString("999")
    gd_btm_xiaohaomvk_num_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_xiaohaomvk_num_label)
    gd_btm_xiaohaomvk_num_label:setPositionInContainer(cc.p(324,578))
    table_gongdou_bottom["gd_btm_xiaohaomvk_num_label"] = gd_btm_xiaohaomvk_num_label

    local gd_btm_zhang_label = fc.FLabel:createBMFont()
    gd_btm_zhang_label:setSize(cc.size(30,30))
    gd_btm_zhang_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_zhang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    gd_btm_zhang_label:setString("張")
    else
	    gd_btm_zhang_label:setString("张")
    end
    gd_btm_zhang_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_zhang_label)
    gd_btm_zhang_label:setPositionInContainer(cc.p(362,578))
    table_gongdou_bottom["gd_btm_zhang_label"] = gd_btm_zhang_label

    local gd_btm_jignyan_num_label = fc.FLabel:createBMFont()
    gd_btm_jignyan_num_label:setSize(cc.size(70,30))
    gd_btm_jignyan_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_jignyan_num_label:setFontSize(21)
    gd_btm_jignyan_num_label:setString("999")
    gd_btm_jignyan_num_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_jignyan_num_label)
    gd_btm_jignyan_num_label:setPositionInContainer(cc.p(305,616))
    table_gongdou_bottom["gd_btm_jignyan_num_label"] = gd_btm_jignyan_num_label

    local gd_btm_yinliang_num_label = fc.FLabel:createBMFont()
    gd_btm_yinliang_num_label:setSize(cc.size(80,30))
    gd_btm_yinliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_yinliang_num_label:setFontSize(21)
    gd_btm_yinliang_num_label:setString("9999")
    gd_btm_yinliang_num_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_yinliang_num_label)
    gd_btm_yinliang_num_label:setPositionInContainer(cc.p(526,579))
    table_gongdou_bottom["gd_btm_yinliang_num_label"] = gd_btm_yinliang_num_label

    local gd_btm_keshengdao_num_label = fc.FLabel:createBMFont()
    gd_btm_keshengdao_num_label:setSize(cc.size(80,30))
    gd_btm_keshengdao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_keshengdao_num_label:setFontSize(21)
    gd_btm_keshengdao_num_label:setString("9999")
    gd_btm_keshengdao_num_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_keshengdao_num_label)
    gd_btm_keshengdao_num_label:setPositionInContainer(cc.p(698,579))
    table_gongdou_bottom["gd_btm_keshengdao_num_label"] = gd_btm_keshengdao_num_label

    local gd_btm_ji_label = fc.FLabel:createBMFont()
    gd_btm_ji_label:setSize(cc.size(30,30))
    gd_btm_ji_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_ji_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	gd_btm_ji_label:setString("級")
    else	
    	gd_btm_ji_label:setString("级")
    end
    gd_btm_ji_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_ji_label)
    gd_btm_ji_label:setPositionInContainer(cc.p(745,579))
    table_gongdou_bottom["gd_btm_ji_label"] = gd_btm_ji_label

    local gd_btm_qinmidu_num_label = fc.FLabel:createBMFont()
    gd_btm_qinmidu_num_label:setSize(cc.size(80,30))
    gd_btm_qinmidu_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gd_btm_qinmidu_num_label:setFontSize(21)
    gd_btm_qinmidu_num_label:setString("9999")
    gd_btm_qinmidu_num_label:setColor(cc.c3b(139,255,240))
    gongdou_bottom:appendComponent(gd_btm_qinmidu_num_label)
    gd_btm_qinmidu_num_label:setPositionInContainer(cc.p(532,617))
    table_gongdou_bottom["gd_btm_qinmidu_num_label"] = gd_btm_qinmidu_num_label

    return table_gongdou_bottom

end

