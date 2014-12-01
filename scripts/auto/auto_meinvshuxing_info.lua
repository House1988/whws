function createmeinvshuxing_info()

    local table_meinvshuxing_info = {}

    local meinvshuxing_info = fc.FContainerPanel:create()
    meinvshuxing_info:setSize(cc.size(960,420))
    table_meinvshuxing_info["meinvshuxing_info"] = meinvshuxing_info

    local mnsx_info_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/banzidikuangmeinv3_tongyong.png",cc.rect(79,105,5,5))
    mnsx_info_bg_scale9:setSize(cc.size(610,330))
    mnsx_info_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(mnsx_info_bg_scale9)
    mnsx_info_bg_scale9:setPositionInContainer(cc.p(654,241))
    table_meinvshuxing_info["mnsx_info_bg_scale9"] = mnsx_info_bg_scale9

    local att_btn = fc.FRadioButton:create()
    att_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    att_btn:setSize(cc.size(159,45))
    att_btn:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(att_btn)
    att_btn:setPositionInContainer(cc.p(459.5,32.5))
    table_meinvshuxing_info["att_btn"] = att_btn

    local intro_btn = fc.FRadioButton:create()
    intro_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    intro_btn:setSize(cc.size(159,45))
    intro_btn:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(intro_btn)
    intro_btn:setPositionInContainer(cc.p(625.5,32.5))
    table_meinvshuxing_info["intro_btn"] = intro_btn

    local shuxing_panel = fc.FContainerPanel:create()
    shuxing_panel:setSize(cc.size(500,300))
    shuxing_panel:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(shuxing_panel)
    shuxing_panel:setPositionInContainer(cc.p(650,241))
    table_meinvshuxing_info["shuxing_panel"] = shuxing_panel

    local mnsx_info_dengji_num_label = fc.FLabel:createBMFont()
    mnsx_info_dengji_num_label:setSize(cc.size(70,30))
    mnsx_info_dengji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_info_dengji_num_label:setFontSize(21)
    mnsx_info_dengji_num_label:setString("9")
    mnsx_info_dengji_num_label:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(mnsx_info_dengji_num_label)
    mnsx_info_dengji_num_label:setPositionInContainer(cc.p(175,76))
    table_meinvshuxing_info["mnsx_info_dengji_num_label"] = mnsx_info_dengji_num_label

    local mnsx_info_jingyan_num_label = fc.FLabel:createBMFont()
    mnsx_info_jingyan_num_label:setSize(cc.size(70,30))
    mnsx_info_jingyan_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_info_jingyan_num_label:setFontSize(21)
    mnsx_info_jingyan_num_label:setString("99/100")
    mnsx_info_jingyan_num_label:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(mnsx_info_jingyan_num_label)
    mnsx_info_jingyan_num_label:setPositionInContainer(cc.p(175,115))
    table_meinvshuxing_info["mnsx_info_jingyan_num_label"] = mnsx_info_jingyan_num_label

    local mnsx_info_qinmidu_num_label = fc.FLabel:createBMFont()
    mnsx_info_qinmidu_num_label:setSize(cc.size(70,30))
    mnsx_info_qinmidu_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_info_qinmidu_num_label:setFontSize(21)
    mnsx_info_qinmidu_num_label:setString("99")
    mnsx_info_qinmidu_num_label:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(mnsx_info_qinmidu_num_label)
    mnsx_info_qinmidu_num_label:setPositionInContainer(cc.p(175,153))
    table_meinvshuxing_info["mnsx_info_qinmidu_num_label"] = mnsx_info_qinmidu_num_label

    local mnsx_info_zhuwei_num_label = fc.FLabel:createBMFont()
    mnsx_info_zhuwei_num_label:setSize(cc.size(350,30))
    mnsx_info_zhuwei_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_info_zhuwei_num_label:setFontSize(20)
    mnsx_info_zhuwei_num_label:setString("攻击+200")
    mnsx_info_zhuwei_num_label:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(mnsx_info_zhuwei_num_label)
    mnsx_info_zhuwei_num_label:setPositionInContainer(cc.p(195,239))
    table_meinvshuxing_info["mnsx_info_zhuwei_num_label"] = mnsx_info_zhuwei_num_label

    local mnsx_info_ewaijiacheng_label = fc.FLabel:createBMFont()
    mnsx_info_ewaijiacheng_label:setSize(cc.size(350,30))
    mnsx_info_ewaijiacheng_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_info_ewaijiacheng_label:setFontSize(20)
    mnsx_info_ewaijiacheng_label:setString("")
    mnsx_info_ewaijiacheng_label:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(mnsx_info_ewaijiacheng_label)
    mnsx_info_ewaijiacheng_label:setPositionInContainer(cc.p(195,269))
    table_meinvshuxing_info["mnsx_info_ewaijiacheng_label"] = mnsx_info_ewaijiacheng_label

    local mnsx_gongdou_button = fc.FScaleButton:create()
    mnsx_gongdou_button:setSize(cc.size(144,53))
    mnsx_gongdou_button:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_gongdou_button:setButtonImage("batch_ui/putonganniu1_up.png")
    shuxing_panel:appendComponent(mnsx_gongdou_button)
    mnsx_gongdou_button:setPositionInContainer(cc.p(358,57.5))
    table_meinvshuxing_info["mnsx_gongdou_button"] = mnsx_gongdou_button

    local gong = fc.FShaderExtensionsImage:create(0)
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gong:setImage("batch_ui/gong_uizi.png")
    gong:setSize(cc.size(32,32))
    mnsx_gongdou_button:appendComponent(gong)
    gong:setPositionInContainer(cc.p(46,26))
    table_meinvshuxing_info["gong"] = gong

    local dou = fc.FShaderExtensionsImage:create(0)
    dou:setAnchorPoint(cc.p(0.5,0.5))
    dou:setImage("batch_ui/dou_uizi.png")
    dou:setSize(cc.size(32,32))
    mnsx_gongdou_button:appendComponent(dou)
    dou:setPositionInContainer(cc.p(96,26))
    table_meinvshuxing_info["dou"] = dou

    local mnsx_cefeng_button = fc.FScaleButton:create()
    mnsx_cefeng_button:setSize(cc.size(144,53))
    mnsx_cefeng_button:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_cefeng_button:setButtonImage("batch_ui/putonganniu1_up.png")
    shuxing_panel:appendComponent(mnsx_cefeng_button)
    mnsx_cefeng_button:setPositionInContainer(cc.p(358,141.5))
    table_meinvshuxing_info["mnsx_cefeng_button"] = mnsx_cefeng_button

    local ce = fc.FShaderExtensionsImage:create(0)
    ce:setAnchorPoint(cc.p(0.5,0.5))
    ce:setImage("batch_ui/ce_uizi.png")
    ce:setSize(cc.size(32,32))
    mnsx_cefeng_button:appendComponent(ce)
    ce:setPositionInContainer(cc.p(46,26))
    table_meinvshuxing_info["ce"] = ce

    local feng = fc.FShaderExtensionsImage:create(0)
    feng:setAnchorPoint(cc.p(0.5,0.5))
    feng:setImage("batch_ui/feng1_uizi.png")
    feng:setSize(cc.size(32,32))
    mnsx_cefeng_button:appendComponent(feng)
    feng:setPositionInContainer(cc.p(95,26))
    table_meinvshuxing_info["feng"] = feng

    local xingming = fc.FLabel:createBMFont()
    xingming:setSize(cc.size(70,30))
    xingming:setAnchorPoint(cc.p(0.5,0.5))
    xingming:setFontSize(21)
    xingming:setString("姓 名：")
    xingming:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(xingming)
    xingming:setPositionInContainer(cc.p(55,38))
    table_meinvshuxing_info["xingming"] = xingming

    local dengji = fc.FLabel:createBMFont()
    dengji:setSize(cc.size(70,30))
    dengji:setAnchorPoint(cc.p(0.5,0.5))
    dengji:setFontSize(21)
     if LANGUAGE_TYPE == 3 then
    	  dengji:setString("等 級：")
    else
    	  dengji:setString("等 级：")
    end
    dengji:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(dengji)
    dengji:setPositionInContainer(cc.p(55,76))
    table_meinvshuxing_info["dengji"] = dengji

    local jingyan = fc.FLabel:createBMFont()
    jingyan:setSize(cc.size(70,30))
    jingyan:setAnchorPoint(cc.p(0.5,0.5))
    jingyan:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	 jingyan:setString("經 驗：")
    else
    	 jingyan:setString("经 验：")
    end
    
    jingyan:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(jingyan)
    jingyan:setPositionInContainer(cc.p(55,115))
    table_meinvshuxing_info["jingyan"] = jingyan

    local qinmidu = fc.FLabel:createBMFont()
    qinmidu:setSize(cc.size(70,30))
    qinmidu:setAnchorPoint(cc.p(0.5,0.5))
    qinmidu:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	 qinmidu:setString("親密度：")
    else
    	 qinmidu:setString("亲密度：")
    end
    qinmidu:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(qinmidu)
    qinmidu:setPositionInContainer(cc.p(55,153))
    table_meinvshuxing_info["qinmidu"] = qinmidu

    local zhuzhenjiacheng = fc.FLabel:createBMFont()
    zhuzhenjiacheng:setSize(cc.size(90,48))
    zhuzhenjiacheng:setAnchorPoint(cc.p(0.5,0.5))
    zhuzhenjiacheng:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	zhuzhenjiacheng:setString("助陣加成：")
    else
    	zhuzhenjiacheng:setString("助阵加成：")
    end
    zhuzhenjiacheng:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(zhuzhenjiacheng)
    zhuzhenjiacheng:setPositionInContainer(cc.p(65,200))
    table_meinvshuxing_info["zhuzhenjiacheng"] = zhuzhenjiacheng

    local mnsx_touxiang_name_label = fc.FLabel:createBMFont()
    mnsx_touxiang_name_label:setSize(cc.size(70,30))
    mnsx_touxiang_name_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_touxiang_name_label:setFontSize(20)
    mnsx_touxiang_name_label:setVerString("贵妃")
    mnsx_touxiang_name_label:setColor(cc.c3b(91,24,6))
    shuxing_panel:appendComponent(mnsx_touxiang_name_label)
    mnsx_touxiang_name_label:setPositionInContainer(cc.p(175,38))
    table_meinvshuxing_info["mnsx_touxiang_name_label"] = mnsx_touxiang_name_label

    local jieshao_panel = fc.FContainerPanel:create()
    jieshao_panel:setSize(cc.size(467,284))
    jieshao_panel:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(jieshao_panel)
    jieshao_panel:setPositionInContainer(cc.p(653.5,241))
    table_meinvshuxing_info["jieshao_panel"] = jieshao_panel

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daojukuangdiwen_shangcheng.png",cc.rect(74,18,2,2))
    title_bg:setSize(cc.size(210,32))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_panel:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(220,31))
    table_meinvshuxing_info["title_bg"] = title_bg

    local mnsx_miaoshu_label = fc.FLabel:createBMFont()
    mnsx_miaoshu_label:setSize(cc.size(450,48))
    mnsx_miaoshu_label:setWidth(450)
    mnsx_miaoshu_label:setAnchorPoint(cc.p(0.5,0.5))
    mnsx_miaoshu_label:setFontSize(20)
    mnsx_miaoshu_label:setString("步兵步兵步步兵步兵步步步兵步兵步步兵步兵步步兵步兵步步兵步兵")
    mnsx_miaoshu_label:setColor(cc.c3b(91,24,6))
    jieshao_panel:appendComponent(mnsx_miaoshu_label)
    mnsx_miaoshu_label:setPositionInContainer(cc.p(233,129))
    table_meinvshuxing_info["mnsx_miaoshu_label"] = mnsx_miaoshu_label

    local meinvjieshao_label = fc.FLabel:createBMFont()
    meinvjieshao_label:setSize(cc.size(150,30))
    meinvjieshao_label:setAnchorPoint(cc.p(0.5,0.5))
    meinvjieshao_label:setFontSize(20)
    meinvjieshao_label:setString("美女介绍")
    meinvjieshao_label:setColor(cc.c3b(91,24,6))
    jieshao_panel:appendComponent(meinvjieshao_label)
    meinvjieshao_label:setPositionInContainer(cc.p(220,27))
    table_meinvshuxing_info["meinvjieshao_label"] = meinvjieshao_label

    local top_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    top_bar:setSize(cc.size(620,13))
    top_bar:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(top_bar)
    top_bar:setPositionInContainer(cc.p(650,68.5))
    table_meinvshuxing_info["top_bar"] = top_bar

    local bottom_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_bar:setSize(cc.size(620,13))
    bottom_bar:setAnchorPoint(cc.p(0.5,0.5))
    bottom_bar:setScaleY(-1)
    meinvshuxing_info:appendComponent(bottom_bar)
    bottom_bar:setPositionInContainer(cc.p(650,413.5))
    table_meinvshuxing_info["bottom_bar"] = bottom_bar

    local side_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    side_bar:setSize(cc.size(25,360))
    side_bar:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(side_bar)
    side_bar:setPositionInContainer(cc.p(957.5,240))
    table_meinvshuxing_info["side_bar"] = side_bar

    local shuxing_label = fc.FContainerPanel:create()
    shuxing_label:setSize(cc.size(80,30))
    shuxing_label:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(shuxing_label)
    shuxing_label:setPositionInContainer(cc.p(460,32))
    table_meinvshuxing_info["shuxing_label"] = shuxing_label

    local shu = fc.FExtensionsImage:create()
    shu:setImage("batch_ui/shu_uizi.png")
    shu:setSize(cc.size(32,32))
    shu:setAnchorPoint(cc.p(0.5,0.5))
    shuxing_label:appendComponent(shu)
    shu:setPositionInContainer(cc.p(16,16))
    table_meinvshuxing_info["shu"] = shu

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xing2_uizi.png")
    xing:setSize(cc.size(32,32))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    shuxing_label:appendComponent(xing)
    xing:setPositionInContainer(cc.p(64,16))
    table_meinvshuxing_info["xing"] = xing

    local jieshao_label = fc.FContainerPanel:create()
    jieshao_label:setSize(cc.size(80,30))
    jieshao_label:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_info:appendComponent(jieshao_label)
    jieshao_label:setPositionInContainer(cc.p(626,32))
    table_meinvshuxing_info["jieshao_label"] = jieshao_label

    local jie = fc.FExtensionsImage:create()
    jie:setImage("batch_ui/jie2_uizi.png")
    jie:setSize(cc.size(32,32))
    jie:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_label:appendComponent(jie)
    jie:setPositionInContainer(cc.p(16,16))
    table_meinvshuxing_info["jie"] = jie

    local shao = fc.FExtensionsImage:create()
    shao:setImage("batch_ui/shao2_uizi.png")
    shao:setSize(cc.size(32,32))
    shao:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_label:appendComponent(shao)
    shao:setPositionInContainer(cc.p(64,16))
    table_meinvshuxing_info["shao"] = shao

    return table_meinvshuxing_info

end

