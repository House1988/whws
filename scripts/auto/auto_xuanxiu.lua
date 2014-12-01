function createxuanxiu()

    local table_xuanxiu = {}

    local xuanxiu = fc.FContainerPanel:create()
    xuanxiu:setSize(cc.size(960,578))
    table_xuanxiu["xuanxiu"] = xuanxiu

    local xuanxiu_big_bg = fc.FExtensionsImage:create()
    xuanxiu_big_bg:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xuanxiu_big_bg)
    xuanxiu_big_bg:setPositionInContainer(cc.p(512,512))
    table_xuanxiu["xuanxiu_big_bg"] = xuanxiu_big_bg

    local xx_xiangshi_kehuode_label = fc.FLabel:createBMFont()
    xx_xiangshi_kehuode_label:setSize(cc.size(120,30))
    xx_xiangshi_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_xiangshi_kehuode_label:setFontSize(20)
    local str1 =  g_game.g_dictConfigManager:getLanTextById(147)
    xx_xiangshi_kehuode_label:setString(str1)
    xx_xiangshi_kehuode_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_xiangshi_kehuode_label)
    xx_xiangshi_kehuode_label:setPositionInContainer(cc.p(159,84))
    table_xuanxiu["xx_xiangshi_kehuode_label"] = xx_xiangshi_kehuode_label

    local xx_huishi_kehuode_label = fc.FLabel:createBMFont()
    xx_huishi_kehuode_label:setSize(cc.size(120,30))
    xx_huishi_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_huishi_kehuode_label:setFontSize(20)
    local str2 =  g_game.g_dictConfigManager:getLanTextById(148)
    xx_huishi_kehuode_label:setString(str2)
    xx_huishi_kehuode_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_huishi_kehuode_label)
    xx_huishi_kehuode_label:setPositionInContainer(cc.p(479,84))
    table_xuanxiu["xx_huishi_kehuode_label"] = xx_huishi_kehuode_label

    local xx_dianshi_kehuode_label = fc.FLabel:createBMFont()
    xx_dianshi_kehuode_label:setSize(cc.size(120,30))
    xx_dianshi_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_dianshi_kehuode_label:setFontSize(20)
    local str3 =  g_game.g_dictConfigManager:getLanTextById(149)
    xx_dianshi_kehuode_label:setString(str3)
    xx_dianshi_kehuode_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_dianshi_kehuode_label)
    xx_dianshi_kehuode_label:setPositionInContainer(cc.p(798,84))
    table_xuanxiu["xx_dianshi_kehuode_label"] = xx_dianshi_kehuode_label

    local xx_xiangxuan_button = fc.FScaleButton:create()
    xx_xiangxuan_button:setSize(cc.size(146,53))
    xx_xiangxuan_button:setAnchorPoint(cc.p(0.5,0.5))
    xx_xiangxuan_button:setButtonImage("batch_ui/teshuanniu.png")
    xuanxiu:appendComponent(xx_xiangxuan_button)
    xx_xiangxuan_button:setPositionInContainer(cc.p(159,474.5))
    table_xuanxiu["xx_xiangxuan_button"] = xx_xiangxuan_button

    local xuan1 = fc.FExtensionsImage:create()
    xuan1:setImage("batch_ui/xuan_uizi.png")
    xuan1:setSize(cc.size(32,32))
    xuan1:setAnchorPoint(cc.p(0.5,0.5))
    xx_xiangxuan_button:appendComponent(xuan1)
    xuan1:setPositionInContainer(cc.p(52,26))
    table_xuanxiu["xuan1"] = xuan1

    local xiu1 = fc.FExtensionsImage:create()
    xiu1:setImage("batch_ui/xiu_uizi.png")
    xiu1:setSize(cc.size(32,32))
    xiu1:setAnchorPoint(cc.p(0.5,0.5))
    xx_xiangxuan_button:appendComponent(xiu1)
    xiu1:setPositionInContainer(cc.p(94,26))
    table_xuanxiu["xiu1"] = xiu1

    local xx_huixuan_button = fc.FScaleButton:create()
    xx_huixuan_button:setSize(cc.size(146,53))
    xx_huixuan_button:setAnchorPoint(cc.p(0.5,0.5))
    xx_huixuan_button:setButtonImage("batch_ui/teshuanniu.png")
    xuanxiu:appendComponent(xx_huixuan_button)
    xx_huixuan_button:setPositionInContainer(cc.p(483,474.5))
    table_xuanxiu["xx_huixuan_button"] = xx_huixuan_button

    local xuan2 = fc.FExtensionsImage:create()
    xuan2:setImage("batch_ui/xuan_uizi.png")
    xuan2:setSize(cc.size(32,32))
    xuan2:setAnchorPoint(cc.p(0.5,0.5))
    xx_huixuan_button:appendComponent(xuan2)
    xuan2:setPositionInContainer(cc.p(52,26))
    table_xuanxiu["xuan2"] = xuan2

    local xiu2 = fc.FExtensionsImage:create()
    xiu2:setImage("batch_ui/xiu_uizi.png")
    xiu2:setSize(cc.size(32,32))
    xiu2:setAnchorPoint(cc.p(0.5,0.5))
    xx_huixuan_button:appendComponent(xiu2)
    xiu2:setPositionInContainer(cc.p(94,26))
    table_xuanxiu["xiu2"] = xiu2

    local xx_dianxuan_button = fc.FScaleButton:create()
    xx_dianxuan_button:setSize(cc.size(146,53))
    xx_dianxuan_button:setAnchorPoint(cc.p(0.5,0.5))
    xx_dianxuan_button:setButtonImage("batch_ui/teshuanniu.png")
    xuanxiu:appendComponent(xx_dianxuan_button)
    xx_dianxuan_button:setPositionInContainer(cc.p(803,475.5))
    table_xuanxiu["xx_dianxuan_button"] = xx_dianxuan_button

    local xuan3 = fc.FExtensionsImage:create()
    xuan3:setImage("batch_ui/xuan_uizi.png")
    xuan3:setSize(cc.size(32,32))
    xuan3:setAnchorPoint(cc.p(0.5,0.5))
    xx_dianxuan_button:appendComponent(xuan3)
    xuan3:setPositionInContainer(cc.p(52,26))
    table_xuanxiu["xuan3"] = xuan3

    local xiu3 = fc.FExtensionsImage:create()
    xiu3:setImage("batch_ui/xiu_uizi.png")
    xiu3:setSize(cc.size(32,32))
    xiu3:setAnchorPoint(cc.p(0.5,0.5))
    xx_dianxuan_button:appendComponent(xiu3)
    xiu3:setPositionInContainer(cc.p(94,26))
    table_xuanxiu["xiu3"] = xiu3

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang (2).png")
    xiang:setSize(cc.size(40,35))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(126,31.5))
    table_xuanxiu["xiang"] = xiang

    local xuan1 = fc.FExtensionsImage:create()
    xuan1:setImage("batch_ui/xuan(1).png")
    xuan1:setSize(cc.size(40,35))
    xuan1:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xuan1)
    xuan1:setPositionInContainer(cc.p(196,31.5))
    table_xuanxiu["xuan1"] = xuan1

    local hui = fc.FExtensionsImage:create()
    hui:setImage("batch_ui/hui.png")
    hui:setSize(cc.size(40,35))
    hui:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(hui)
    hui:setPositionInContainer(cc.p(448,31.5))
    table_xuanxiu["hui"] = hui

    local dian = fc.FExtensionsImage:create()
    dian:setImage("batch_ui/dian (3).png")
    dian:setSize(cc.size(40,35))
    dian:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(dian)
    dian:setPositionInContainer(cc.p(771,31.5))
    table_xuanxiu["dian"] = dian

    local xuan2 = fc.FExtensionsImage:create()
    xuan2:setImage("batch_ui/xuan(2).png")
    xuan2:setSize(cc.size(40,35))
    xuan2:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xuan2)
    xuan2:setPositionInContainer(cc.p(518,31.5))
    table_xuanxiu["xuan2"] = xuan2

    local xuan3 = fc.FExtensionsImage:create()
    xuan3:setImage("batch_ui/xuan(3).png")
    xuan3:setSize(cc.size(40,35))
    xuan3:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xuan3)
    xuan3:setPositionInContainer(cc.p(841,31.5))
    table_xuanxiu["xuan3"] = xuan3

    local xing1 = fc.FExtensionsImage:create()
    xing1:setImage("batch_ui/xingxing.png")
    xing1:setSize(cc.size(20,19))
    xing1:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xing1)
    xing1:setPositionInContainer(cc.p(221,87.5))
    table_xuanxiu["xing1"] = xing1

    local xing2 = fc.FExtensionsImage:create()
    xing2:setImage("batch_ui/xingxing.png")
    xing2:setSize(cc.size(20,19))
    xing2:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xing2)
    xing2:setPositionInContainer(cc.p(543,85.5))
    table_xuanxiu["xing2"] = xing2

    local xing3 = fc.FExtensionsImage:create()
    xing3:setImage("batch_ui/xingxing.png")
    xing3:setSize(cc.size(20,19))
    xing3:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(xing3)
    xing3:setPositionInContainer(cc.p(862,85.5))
    table_xuanxiu["xing3"] = xing3

    local num_didi1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_didi1:setSize(cc.size(120,30))
    num_didi1:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(num_didi1)
    num_didi1:setPositionInContainer(cc.p(158,521))
    table_xuanxiu["num_didi1"] = num_didi1

    local yuanbao_num1 = fc.FLabel:createBMFont()
    yuanbao_num1:setSize(cc.size(50,30))
    yuanbao_num1:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num1:setFontSize(21)
    yuanbao_num1:setString("100")
    yuanbao_num1:setColor(cc.c3b(255,255,255))
    xuanxiu:appendComponent(yuanbao_num1)
    yuanbao_num1:setPositionInContainer(cc.p(178,517))
    table_xuanxiu["yuanbao_num1"] = yuanbao_num1

    local yuanbao1 = fc.FExtensionsImage:create()
    yuanbao1:setImage("batch_ui/yuanbao.png")
    yuanbao1:setSize(cc.size(40,30))
    yuanbao1:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(yuanbao1)
    yuanbao1:setPositionInContainer(cc.p(131,522))
    table_xuanxiu["yuanbao1"] = yuanbao1

    local num_didi2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_didi2:setSize(cc.size(120,30))
    num_didi2:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(num_didi2)
    num_didi2:setPositionInContainer(cc.p(483,521))
    table_xuanxiu["num_didi2"] = num_didi2

    local yuanbao_num2 = fc.FLabel:createBMFont()
    yuanbao_num2:setSize(cc.size(50,30))
    yuanbao_num2:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num2:setFontSize(21)
    yuanbao_num2:setString("00:00:00")
    yuanbao_num2:setColor(cc.c3b(255,255,255))
    xuanxiu:appendComponent(yuanbao_num2)
    yuanbao_num2:setPositionInContainer(cc.p(506,518))
    table_xuanxiu["yuanbao_num2"] = yuanbao_num2

    local num_didi3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_didi3:setSize(cc.size(120,30))
    num_didi3:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(num_didi3)
    num_didi3:setPositionInContainer(cc.p(802,521))
    table_xuanxiu["num_didi3"] = num_didi3

    local yuanbao2 = fc.FExtensionsImage:create()
    yuanbao2:setImage("batch_ui/yuanbao.png")
    yuanbao2:setSize(cc.size(40,30))
    yuanbao2:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(yuanbao2)
    yuanbao2:setPositionInContainer(cc.p(459,522))
    table_xuanxiu["yuanbao2"] = yuanbao2

    local yuanbao_num3 = fc.FLabel:createBMFont()
    yuanbao_num3:setSize(cc.size(50,30))
    yuanbao_num3:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num3:setFontSize(21)
    yuanbao_num3:setString("00:00:00")
    yuanbao_num3:setColor(cc.c3b(255,255,255))
    xuanxiu:appendComponent(yuanbao_num3)
    yuanbao_num3:setPositionInContainer(cc.p(821,518))
    table_xuanxiu["yuanbao_num3"] = yuanbao_num3

    local yuanbao3 = fc.FExtensionsImage:create()
    yuanbao3:setImage("batch_ui/yuanbao.png")
    yuanbao3:setSize(cc.size(40,30))
    yuanbao3:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(yuanbao3)
    yuanbao3:setPositionInContainer(cc.p(776,522))
    table_xuanxiu["yuanbao3"] = yuanbao3

    local meinv1 = fc.FExtensionsImage:create()
    meinv1:setImage("nobatch/xiangshimeinv.png")
    meinv1:setSize(cc.size(171,319))
    meinv1:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(meinv1)
    meinv1:setPositionInContainer(cc.p(160.5,255.5))
    table_xuanxiu["meinv1"] = meinv1

    local xx_mianfei1_label = fc.FLabel:createBMFont()
    xx_mianfei1_label:setSize(cc.size(140,30))
    xx_mianfei1_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_mianfei1_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_mianfei1_label:setString("今日免費次數")
    else
    	xx_mianfei1_label:setString("今日免费次数")
    end
    xx_mianfei1_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_mianfei1_label)
    xx_mianfei1_label:setPositionInContainer(cc.p(120,425))
    table_xuanxiu["xx_mianfei1_label"] = xx_mianfei1_label

    local xx_cishu1_num_label = fc.FLabel:createBMFont()
    xx_cishu1_num_label:setSize(cc.size(90,30))
    xx_cishu1_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_cishu1_num_label:setFontSize(21)
    xx_cishu1_num_label:setString("5/5")
    xx_cishu1_num_label:setColor(cc.c3b(0,255,0))
    xuanxiu:appendComponent(xx_cishu1_num_label)
    xx_cishu1_num_label:setPositionInContainer(cc.p(235,425))
    table_xuanxiu["xx_cishu1_num_label"] = xx_cishu1_num_label

    local xx_mianfei_time1_label = fc.FLabel:createBMFont()
    xx_mianfei_time1_label:setSize(cc.size(140,30))
    xx_mianfei_time1_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_mianfei_time1_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
    	xx_mianfei_time1_label:setString("距離下次還有:")
    else
    	xx_mianfei_time1_label:setString("距离下次还有:")
    end
   
    xx_mianfei_time1_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_mianfei_time1_label)
    xx_mianfei_time1_label:setPositionInContainer(cc.p(120,425))
    table_xuanxiu["xx_mianfei_time1_label"] = xx_mianfei_time1_label

    local value1 = fc.FLabel:createBMFont()
    value1:setSize(cc.size(90,30))
    value1:setAnchorPoint(cc.p(0.5,0.5))
    value1:setFontSize(21)
    value1:setString("00:00:00")
    value1:setColor(cc.c3b(0,255,0))
    xuanxiu:appendComponent(value1)
    value1:setPositionInContainer(cc.p(235,425))
    table_xuanxiu["value1"] = value1

    local meinv2 = fc.FExtensionsImage:create()
    meinv2:setImage("nobatch/huishimeinv.png")
    meinv2:setSize(cc.size(171,319))
    meinv2:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(meinv2)
    meinv2:setPositionInContainer(cc.p(487.5,255.5))
    table_xuanxiu["meinv2"] = meinv2

    local meinv3 = fc.FExtensionsImage:create()
    meinv3:setImage("nobatch/dianshimeinv.png")
    meinv3:setSize(cc.size(171,319))
    meinv3:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(meinv3)
    meinv3:setPositionInContainer(cc.p(805.5,255.5))
    table_xuanxiu["meinv3"] = meinv3

    local xx_mianfei2_label = fc.FLabel:createBMFont()
    xx_mianfei2_label:setSize(cc.size(140,30))
    xx_mianfei2_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_mianfei2_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_mianfei2_label:setString("今日免費次數")
    else
    	xx_mianfei2_label:setString("今日免费次数")
    end
    xx_mianfei2_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_mianfei2_label)
    xx_mianfei2_label:setPositionInContainer(cc.p(436,425))
    table_xuanxiu["xx_mianfei2_label"] = xx_mianfei2_label

    local xx_cishu2_num_label = fc.FLabel:createBMFont()
    xx_cishu2_num_label:setSize(cc.size(90,30))
    xx_cishu2_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_cishu2_num_label:setFontSize(21)
    xx_cishu2_num_label:setString("1/1")
    xx_cishu2_num_label:setColor(cc.c3b(0,255,0))
    xuanxiu:appendComponent(xx_cishu2_num_label)
    xx_cishu2_num_label:setPositionInContainer(cc.p(551,425))
    table_xuanxiu["xx_cishu2_num_label"] = xx_cishu2_num_label

    local xx_mianfei_time2_label = fc.FLabel:createBMFont()
    xx_mianfei_time2_label:setSize(cc.size(140,30))
    xx_mianfei_time2_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_mianfei_time2_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_mianfei_time2_label:setString("距離下次還有:")
    else
    	xx_mianfei_time2_label:setString("距离下次还有:")
    end
    
    xx_mianfei_time2_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_mianfei_time2_label)
    xx_mianfei_time2_label:setPositionInContainer(cc.p(435,425))
    table_xuanxiu["xx_mianfei_time2_label"] = xx_mianfei_time2_label

    local value2 = fc.FLabel:createBMFont()
    value2:setSize(cc.size(90,30))
    value2:setAnchorPoint(cc.p(0.5,0.5))
    value2:setFontSize(21)
    value2:setString("00:00:00")
    value2:setColor(cc.c3b(0,255,0))
    xuanxiu:appendComponent(value2)
    value2:setPositionInContainer(cc.p(550,425))
    table_xuanxiu["value2"] = value2

    local xx_mianfei3_label = fc.FLabel:createBMFont()
    xx_mianfei3_label:setSize(cc.size(140,30))
    xx_mianfei3_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_mianfei3_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_mianfei3_label:setString("今日免費次數")
    else
    	xx_mianfei3_label:setString("今日免费次数")
    end
    xx_mianfei3_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_mianfei3_label)
    xx_mianfei3_label:setPositionInContainer(cc.p(755,425))
    table_xuanxiu["xx_mianfei3_label"] = xx_mianfei3_label

    local xx_cishu3_num_label = fc.FLabel:createBMFont()
    xx_cishu3_num_label:setSize(cc.size(90,30))
    xx_cishu3_num_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_cishu3_num_label:setFontSize(21)
    xx_cishu3_num_label:setString("1/1")
    xx_cishu3_num_label:setColor(cc.c3b(0,255,0))
    xuanxiu:appendComponent(xx_cishu3_num_label)
    xx_cishu3_num_label:setPositionInContainer(cc.p(870,425))
    table_xuanxiu["xx_cishu3_num_label"] = xx_cishu3_num_label

    local xx_mianfei_time3_label = fc.FLabel:createBMFont()
    xx_mianfei_time3_label:setSize(cc.size(140,30))
    xx_mianfei_time3_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_mianfei_time3_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_mianfei_time3_label:setString("距離下次還有:")
    else
    	xx_mianfei_time3_label:setString("距离下次还有:")
    end
    xx_mianfei_time3_label:setColor(cc.c3b(250,255,165))
    xuanxiu:appendComponent(xx_mianfei_time3_label)
    xx_mianfei_time3_label:setPositionInContainer(cc.p(755,425))
    table_xuanxiu["xx_mianfei_time3_label"] = xx_mianfei_time3_label

    local value3 = fc.FLabel:createBMFont()
    value3:setSize(cc.size(90,30))
    value3:setAnchorPoint(cc.p(0.5,0.5))
    value3:setFontSize(21)
    value3:setString("00:00:00")
    value3:setColor(cc.c3b(0,255,0))
    xuanxiu:appendComponent(value3)
    value3:setPositionInContainer(cc.p(870,425))
    table_xuanxiu["value3"] = value3

    local bide_immage = fc.FExtensionsImage:create()
    bide_immage:setImage("nobatch/zaichoubide.png")
    bide_immage:setSize(cc.size(281,70))
    bide_immage:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu:appendComponent(bide_immage)
    bide_immage:setPositionInContainer(cc.p(798.5,380))
    table_xuanxiu["bide_immage"] = bide_immage

    local tip_left_num = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE))
    tip_left_num:setAnchorPoint(cc.p(0.5,0.5))
    tip_left_num:setSize(cc.size(28,20))
    tip_left_num:setAlignment(1)
    tip_left_num:setScale(0.8)
    xuanxiu:appendComponent(tip_left_num)
    tip_left_num:setPositionInContainer(cc.p(771,363))
    table_xuanxiu["tip_left_num"] = tip_left_num

    return table_xuanxiu

end

