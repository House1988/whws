function createkunninggong_detail()

    local table_kunninggong_detail = {}

    local kunninggong_detail = fc.FContainerPanel:create()
    kunninggong_detail:setSize(cc.size(960,580))
    table_kunninggong_detail["kunninggong_detail"] = kunninggong_detail

    local topbg = fc.FExtensionsImage:create()
    topbg:setImage("nobatch/diwen2_tangquanxinggong.png")
    topbg:setSize(cc.size(440,450))
    topbg:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(topbg)
    topbg:setPositionInContainer(cc.p(738,238))
    table_kunninggong_detail["topbg"] = topbg

    local bottomBgL = fc.FScale9Image:createWithBatchUIFrame("nobatch/tuopan2_tangquanxinggong.png",cc.rect(190,0,2,143))
    bottomBgL:setSize(cc.size(215,105))
    bottomBgL:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(bottomBgL)
    bottomBgL:setPositionInContainer(cc.p(631.5,503.5))
    table_kunninggong_detail["bottomBgL"] = bottomBgL

    local bottomBgR = fc.FScale9Image:createWithBatchUIFrame("nobatch/tuopan2_tangquanxinggong.png",cc.rect(190,0,2,143))
    bottomBgR:setSize(cc.size(215,105))
    bottomBgR:setAnchorPoint(cc.p(0.5,0.5))
    bottomBgR:setScaleX(-1)
    kunninggong_detail:appendComponent(bottomBgR)
    bottomBgR:setPositionInContainer(cc.p(846.5,503.5))
    table_kunninggong_detail["bottomBgR"] = bottomBgR

    local list_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    list_di:setSize(cc.size(300,565))
    list_di:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(list_di)
    list_di:setPositionInContainer(cc.p(367,282.5))
    table_kunninggong_detail["list_di"] = list_di

    local kng_detail_feiweimiaoshu_label = fc.FLabel:createBMFont()
    kng_detail_feiweimiaoshu_label:setSize(cc.size(264,130))
    kng_detail_feiweimiaoshu_label:setWidth(275)
    kng_detail_feiweimiaoshu_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_feiweimiaoshu_label:setFontSize(20)
    kng_detail_feiweimiaoshu_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    kng_detail_feiweimiaoshu_label:setColor(cc.c3b(91,24,6))
    kunninggong_detail:appendComponent(kng_detail_feiweimiaoshu_label)
    kng_detail_feiweimiaoshu_label:setPositionInContainer(cc.p(368,143))
    table_kunninggong_detail["kng_detail_feiweimiaoshu_label"] = kng_detail_feiweimiaoshu_label

    local kng_detail_qinmidu_label = fc.FLabel:createBMFont()
    kng_detail_qinmidu_label:setSize(cc.size(140,30))
    kng_detail_qinmidu_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_qinmidu_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kng_detail_qinmidu_label:setString("親密度不低於")
    else
	    kng_detail_qinmidu_label:setString("亲密度不低于")
    end
    kng_detail_qinmidu_label:setColor(cc.c3b(91,24,6))
    kunninggong_detail:appendComponent(kng_detail_qinmidu_label)
    kng_detail_qinmidu_label:setPositionInContainer(cc.p(313,301))
    table_kunninggong_detail["kng_detail_qinmidu_label"] = kng_detail_qinmidu_label

    local kng_detail_yinliang_label = fc.FLabel:createBMFont()
    kng_detail_yinliang_label:setSize(cc.size(100,30))
    kng_detail_yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_yinliang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kng_detail_yinliang_label:setString("消耗銀兩")
    else
    	kng_detail_yinliang_label:setString("消耗银两")
    end
    kng_detail_yinliang_label:setColor(cc.c3b(91,24,6))
    kunninggong_detail:appendComponent(kng_detail_yinliang_label)
    kng_detail_yinliang_label:setPositionInContainer(cc.p(294,341))
    table_kunninggong_detail["kng_detail_yinliang_label"] = kng_detail_yinliang_label

    local kng_detail_jiacheng_num_label = fc.FLabel:createBMFont()
    kng_detail_jiacheng_num_label:setSize(cc.size(211,30))
    kng_detail_jiacheng_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_jiacheng_num_label:setFontSize(20)
    kng_detail_jiacheng_num_label:setString("999")
    kng_detail_jiacheng_num_label:setColor(cc.c3b(137,32,18))
    kunninggong_detail:appendComponent(kng_detail_jiacheng_num_label)
    kng_detail_jiacheng_num_label:setPositionInContainer(cc.p(365.5,482))
    table_kunninggong_detail["kng_detail_jiacheng_num_label"] = kng_detail_jiacheng_num_label

    local kunninggong_diwen = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daojukuangdiwen_shangcheng.png",cc.rect(74,18,2,2))
    kunninggong_diwen:setSize(cc.size(230,32))
    kunninggong_diwen:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(kunninggong_diwen)
    kunninggong_diwen:setPositionInContainer(cc.p(361,53))
    table_kunninggong_detail["kunninggong_diwen"] = kunninggong_diwen

    local kunninggong_diwen = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daojukuangdiwen_shangcheng.png",cc.rect(74,18,2,2))
    kunninggong_diwen:setSize(cc.size(230,32))
    kunninggong_diwen:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(kunninggong_diwen)
    kunninggong_diwen:setPositionInContainer(cc.p(361,245))
    table_kunninggong_detail["kunninggong_diwen"] = kunninggong_diwen

    local kng_detail_tiaojian_image = fc.FContainerPanel:create()
    kng_detail_tiaojian_image:setSize(cc.size(130,30))
    kng_detail_tiaojian_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(kng_detail_tiaojian_image)
    kng_detail_tiaojian_image:setPositionInContainer(cc.p(361,245))
    table_kunninggong_detail["kng_detail_tiaojian_image"] = kng_detail_tiaojian_image

    local ce = fc.FShaderExtensionsImage:create(0)
    ce:setAnchorPoint(cc.p(0.5,0.5))
    ce:setImage("batch_ui/ce_uizi.png")
    ce:setSize(cc.size(32,32))
    kng_detail_tiaojian_image:appendComponent(ce)
    ce:setPositionInContainer(cc.p(16,16))
    table_kunninggong_detail["ce"] = ce

    local feng = fc.FShaderExtensionsImage:create(0)
    feng:setAnchorPoint(cc.p(0.5,0.5))
    feng:setImage("batch_ui/feng1_uizi.png")
    feng:setSize(cc.size(32,32))
    kng_detail_tiaojian_image:appendComponent(feng)
    feng:setPositionInContainer(cc.p(49,16))
    table_kunninggong_detail["feng"] = feng

    local tiao = fc.FExtensionsImage:create()
    tiao:setImage("batch_ui/tiao2_uizi.png")
    tiao:setSize(cc.size(32,32))
    tiao:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_tiaojian_image:appendComponent(tiao)
    tiao:setPositionInContainer(cc.p(81,16))
    table_kunninggong_detail["tiao"] = tiao

    local jian = fc.FExtensionsImage:create()
    jian:setImage("batch_ui/jian2_uizi.png")
    jian:setSize(cc.size(32,32))
    jian:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_tiaojian_image:appendComponent(jian)
    jian:setPositionInContainer(cc.p(114,16))
    table_kunninggong_detail["jian"] = jian

    local kunninggong_diwen = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daojukuangdiwen_shangcheng.png",cc.rect(74,18,2,2))
    kunninggong_diwen:setSize(cc.size(230,32))
    kunninggong_diwen:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(kunninggong_diwen)
    kunninggong_diwen:setPositionInContainer(cc.p(361,412))
    table_kunninggong_detail["kunninggong_diwen"] = kunninggong_diwen

    local kng_detail_zhuzhen_image = fc.FContainerPanel:create()
    kng_detail_zhuzhen_image:setSize(cc.size(130,30))
    kng_detail_zhuzhen_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(kng_detail_zhuzhen_image)
    kng_detail_zhuzhen_image:setPositionInContainer(cc.p(361,412))
    table_kunninggong_detail["kng_detail_zhuzhen_image"] = kng_detail_zhuzhen_image

    local zhu = fc.FExtensionsImage:create()
    zhu:setImage("batch_ui/zhu_uizi.png")
    zhu:setSize(cc.size(32,32))
    zhu:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_zhuzhen_image:appendComponent(zhu)
    zhu:setPositionInContainer(cc.p(16,16))
    table_kunninggong_detail["zhu"] = zhu

    local zhen = fc.FExtensionsImage:create()
    zhen:setImage("batch_ui/zhen_uizi.png")
    zhen:setSize(cc.size(32,32))
    zhen:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_zhuzhen_image:appendComponent(zhen)
    zhen:setPositionInContainer(cc.p(49,16))
    table_kunninggong_detail["zhen"] = zhen

    local jia = fc.FExtensionsImage:create()
    jia:setImage("batch_ui/jia_uizi.png")
    jia:setSize(cc.size(32,32))
    jia:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_zhuzhen_image:appendComponent(jia)
    jia:setPositionInContainer(cc.p(81,16))
    table_kunninggong_detail["jia"] = jia

    local cheng = fc.FExtensionsImage:create()
    cheng:setImage("batch_ui/cheng_uizi.png")
    cheng:setSize(cc.size(32,32))
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_zhuzhen_image:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(114,16))
    table_kunninggong_detail["cheng"] = cheng

    local kng_card_qifei_button = fc.FScaleButton:create()
    kng_card_qifei_button:setSize(cc.size(144,53))
    kng_card_qifei_button:setAnchorPoint(cc.p(0.5,0.5))
    kng_card_qifei_button:setButtonImage("batch_ui/putonganniu1_up.png")
    kunninggong_detail:appendComponent(kng_card_qifei_button)
    kng_card_qifei_button:setPositionInContainer(cc.p(648,503.5))
    table_kunninggong_detail["kng_card_qifei_button"] = kng_card_qifei_button

    local qi = fc.FShaderExtensionsImage:create(0)
    qi:setAnchorPoint(cc.p(0.5,0.5))
    qi:setImage("batch_ui/qi_uizi.png")
    qi:setSize(cc.size(32,32))
    kng_card_qifei_button:appendComponent(qi)
    qi:setPositionInContainer(cc.p(43,26))
    table_kunninggong_detail["qi"] = qi

    local fei = fc.FShaderExtensionsImage:create(0)
    fei:setAnchorPoint(cc.p(0.5,0.5))
    fei:setImage("batch_ui/fei_uizi.png")
    fei:setSize(cc.size(32,32))
    kng_card_qifei_button:appendComponent(fei)
    fei:setPositionInContainer(cc.p(98,26))
    table_kunninggong_detail["fei"] = fei

    local kng_card_cefeng_button = fc.FScaleButton:create()
    kng_card_cefeng_button:setSize(cc.size(144,53))
    kng_card_cefeng_button:setAnchorPoint(cc.p(0.5,0.5))
    kng_card_cefeng_button:setButtonImage("batch_ui/putonganniu1_up.png")
    kunninggong_detail:appendComponent(kng_card_cefeng_button)
    kng_card_cefeng_button:setPositionInContainer(cc.p(828,503.5))
    table_kunninggong_detail["kng_card_cefeng_button"] = kng_card_cefeng_button

    local ce = fc.FShaderExtensionsImage:create(0)
    ce:setAnchorPoint(cc.p(0.5,0.5))
    ce:setImage("batch_ui/ce_uizi.png")
    ce:setSize(cc.size(32,32))
    kng_card_cefeng_button:appendComponent(ce)
    ce:setPositionInContainer(cc.p(42,26))
    table_kunninggong_detail["ce"] = ce

    local feng = fc.FShaderExtensionsImage:create(0)
    feng:setAnchorPoint(cc.p(0.5,0.5))
    feng:setImage("batch_ui/feng1_uizi.png")
    feng:setSize(cc.size(32,32))
    kng_card_cefeng_button:appendComponent(feng)
    feng:setPositionInContainer(cc.p(99,26))
    table_kunninggong_detail["feng"] = feng

    local name1 = fc.FExtensionsImage:create()
    name1:setImage("batch_ui/ce_uizi.png")
    name1:setSize(cc.size(32,32))
    name1:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(name1)
    name1:setPositionInContainer(cc.p(328,53))
    table_kunninggong_detail["name1"] = name1

    local name2 = fc.FExtensionsImage:create()
    name2:setImage("batch_ui/ce_uizi.png")
    name2:setSize(cc.size(32,32))
    name2:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(name2)
    name2:setPositionInContainer(cc.p(361,53))
    table_kunninggong_detail["name2"] = name2

    local name3 = fc.FExtensionsImage:create()
    name3:setImage("batch_ui/ce_uizi.png")
    name3:setSize(cc.size(32,32))
    name3:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(name3)
    name3:setPositionInContainer(cc.p(394,53))
    table_kunninggong_detail["name3"] = name3

    local topbar1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar1:setSize(cc.size(300,13))
    topbar1:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(topbar1)
    topbar1:setPositionInContainer(cc.p(368,6.5))
    table_kunninggong_detail["topbar1"] = topbar1

    local bottomBar1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar1:setSize(cc.size(300,13))
    bottomBar1:setAnchorPoint(cc.p(0.5,0.5))
    bottomBar1:setScaleY(-1)
    kunninggong_detail:appendComponent(bottomBar1)
    bottomBar1:setPositionInContainer(cc.p(366,558.5))
    table_kunninggong_detail["bottomBar1"] = bottomBar1

    local topbar2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar2:setSize(cc.size(440,13))
    topbar2:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(topbar2)
    topbar2:setPositionInContainer(cc.p(743,6.5))
    table_kunninggong_detail["topbar2"] = topbar2

    local bottomBar2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar2:setSize(cc.size(430,13))
    bottomBar2:setAnchorPoint(cc.p(0.5,0.5))
    bottomBar2:setScaleY(-1)
    kunninggong_detail:appendComponent(bottomBar2)
    bottomBar2:setPositionInContainer(cc.p(738,558.5))
    table_kunninggong_detail["bottomBar2"] = bottomBar2

    local topbar2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    topbar2:setSize(cc.size(440,13))
    topbar2:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(topbar2)
    topbar2:setPositionInContainer(cc.p(738,446.5))
    table_kunninggong_detail["topbar2"] = topbar2

    local titleBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    titleBg:setSize(cc.size(380,50))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    titleBg:setScaleY(-1)
    kunninggong_detail:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(743,38))
    table_kunninggong_detail["titleBg"] = titleBg

    local kng_detail_dangweizhe_num_label = fc.FLabel:createBMFont()
    kng_detail_dangweizhe_num_label:setSize(cc.size(90,30))
    kng_detail_dangweizhe_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_dangweizhe_num_label:setFontSize(32)
    kng_detail_dangweizhe_num_label:setString("(99/99)")
    kng_detail_dangweizhe_num_label:setColor(cc.c3b(240,224,171))
    kunninggong_detail:appendComponent(kng_detail_dangweizhe_num_label)
    kng_detail_dangweizhe_num_label:setPositionInContainer(cc.p(738,32))
    table_kunninggong_detail["kng_detail_dangweizhe_num_label"] = kng_detail_dangweizhe_num_label

    local conlt = fc.FExtensionsImage:create()
    conlt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conlt:setSize(cc.size(25,27))
    conlt:setFlipType(2)
    conlt:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(conlt)
    conlt:setPositionInContainer(cc.p(537.5,26.5))
    table_kunninggong_detail["conlt"] = conlt

    local conrt = fc.FExtensionsImage:create()
    conrt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conrt:setSize(cc.size(25,27))
    conrt:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(conrt)
    conrt:setPositionInContainer(cc.p(504.5,26.5))
    table_kunninggong_detail["conrt"] = conrt

    local conlb = fc.FExtensionsImage:create()
    conlb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conlb:setSize(cc.size(25,27))
    conlb:setFlipType(8)
    conlb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(conlb)
    conlb:setPositionInContainer(cc.p(537.5,551.5))
    table_kunninggong_detail["conlb"] = conlb

    local conrb = fc.FExtensionsImage:create()
    conrb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conrb:setSize(cc.size(25,27))
    conrb:setFlipType(4)
    conrb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(conrb)
    conrb:setPositionInContainer(cc.p(504.5,551.5))
    table_kunninggong_detail["conrb"] = conrb

    local conrt = fc.FExtensionsImage:create()
    conrt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conrt:setSize(cc.size(25,27))
    conrt:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(conrt)
    conrt:setPositionInContainer(cc.p(942.5,26.5))
    table_kunninggong_detail["conrt"] = conrt

    local conrb = fc.FExtensionsImage:create()
    conrb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conrb:setSize(cc.size(25,27))
    conrb:setFlipType(4)
    conrb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(conrb)
    conrb:setPositionInContainer(cc.p(942.5,551.5))
    table_kunninggong_detail["conrb"] = conrb

    local sideBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sideBar:setSize(cc.size(25,565))
    sideBar:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(sideBar)
    sideBar:setPositionInContainer(cc.p(519.5,282.5))
    table_kunninggong_detail["sideBar"] = sideBar

    local sideBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sideBar:setSize(cc.size(25,565))
    sideBar:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(sideBar)
    sideBar:setPositionInContainer(cc.p(957.5,282.5))
    table_kunninggong_detail["sideBar"] = sideBar

    local name4 = fc.FExtensionsImage:create()
    name4:setImage("batch_ui/ce_uizi.png")
    name4:setSize(cc.size(32,32))
    name4:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(name4)
    name4:setPositionInContainer(cc.p(344,53))
    table_kunninggong_detail["name4"] = name4

    local name5 = fc.FExtensionsImage:create()
    name5:setImage("batch_ui/ce_uizi.png")
    name5:setSize(cc.size(32,32))
    name5:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(name5)
    name5:setPositionInContainer(cc.p(376,53))
    table_kunninggong_detail["name5"] = name5

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(120,28))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(443,302))
    table_kunninggong_detail["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(120,28))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_detail:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(443,340))
    table_kunninggong_detail["textbg"] = textbg

    local kng_detail_qinmidu_num_label = fc.FLabel:createBMFont()
    kng_detail_qinmidu_num_label:setSize(cc.size(100,30))
    kng_detail_qinmidu_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_qinmidu_num_label:setFontSize(21)
    kng_detail_qinmidu_num_label:setString("999")
    kng_detail_qinmidu_num_label:setColor(cc.c3b(139,255,240))
    kunninggong_detail:appendComponent(kng_detail_qinmidu_num_label)
    kng_detail_qinmidu_num_label:setPositionInContainer(cc.p(443,301))
    table_kunninggong_detail["kng_detail_qinmidu_num_label"] = kng_detail_qinmidu_num_label

    local kng_detail_yinliang_num_label = fc.FLabel:createBMFont()
    kng_detail_yinliang_num_label:setSize(cc.size(120,30))
    kng_detail_yinliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kng_detail_yinliang_num_label:setFontSize(21)
    kng_detail_yinliang_num_label:setString("999")
    kng_detail_yinliang_num_label:setColor(cc.c3b(139,255,240))
    kunninggong_detail:appendComponent(kng_detail_yinliang_num_label)
    kng_detail_yinliang_num_label:setPositionInContainer(cc.p(443,341))
    table_kunninggong_detail["kng_detail_yinliang_num_label"] = kng_detail_yinliang_num_label

    return table_kunninggong_detail

end

