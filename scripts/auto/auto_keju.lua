function createkeju()

    local table_keju = {}

    local keju = fc.FContainerPanel:create()
    keju:setSize(cc.size(960,578))
    table_keju["keju"] = keju

    local keju_big_bg = fc.FExtensionsImage:create()
    keju_big_bg:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(keju_big_bg)
    keju_big_bg:setPositionInContainer(cc.p(512,512))
    table_keju["keju_big_bg"] = keju_big_bg

    local kj_mianfei1_label = fc.FLabel:createBMFont()
    kj_mianfei1_label:setSize(cc.size(140,30))
    kj_mianfei1_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_mianfei1_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 kj_mianfei1_label:setString("今日免費次數")
    else
    	 kj_mianfei1_label:setString("今日免费次数")
    end
   
    kj_mianfei1_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_mianfei1_label)
    kj_mianfei1_label:setPositionInContainer(cc.p(118,426))
    table_keju["kj_mianfei1_label"] = kj_mianfei1_label

    local kj_cishu1_num_label = fc.FLabel:createBMFont()
    kj_cishu1_num_label:setSize(cc.size(90,30))
    kj_cishu1_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_cishu1_num_label:setFontSize(21)
    kj_cishu1_num_label:setString("5/5")
    kj_cishu1_num_label:setColor(cc.c3b(0,255,0))
    keju:appendComponent(kj_cishu1_num_label)
    kj_cishu1_num_label:setPositionInContainer(cc.p(234,426))
    table_keju["kj_cishu1_num_label"] = kj_cishu1_num_label

    local kj_mianfei2_label = fc.FLabel:createBMFont()
    kj_mianfei2_label:setSize(cc.size(140,30))
    kj_mianfei2_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_mianfei2_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 kj_mianfei2_label:setString("今日免費次數")
    else
    	 kj_mianfei2_label:setString("今日免费次数")
    end
    kj_mianfei2_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_mianfei2_label)
    kj_mianfei2_label:setPositionInContainer(cc.p(436,426))
    table_keju["kj_mianfei2_label"] = kj_mianfei2_label

    local kj_cishu2_num_label = fc.FLabel:createBMFont()
    kj_cishu2_num_label:setSize(cc.size(90,30))
    kj_cishu2_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_cishu2_num_label:setFontSize(21)
    kj_cishu2_num_label:setString("1/1")
    kj_cishu2_num_label:setColor(cc.c3b(0,255,0))
    keju:appendComponent(kj_cishu2_num_label)
    kj_cishu2_num_label:setPositionInContainer(cc.p(551,426))
    table_keju["kj_cishu2_num_label"] = kj_cishu2_num_label

    local kj_mianfei3_label = fc.FLabel:createBMFont()
    kj_mianfei3_label:setSize(cc.size(140,30))
    kj_mianfei3_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_mianfei3_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kj_mianfei3_label:setString("今日免費次數")
    else
    	kj_mianfei3_label:setString("今日免费次数")
    end
    kj_mianfei3_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_mianfei3_label)
    kj_mianfei3_label:setPositionInContainer(cc.p(755,426))
    table_keju["kj_mianfei3_label"] = kj_mianfei3_label

    local kj_cishu3_num_label = fc.FLabel:createBMFont()
    kj_cishu3_num_label:setSize(cc.size(90,30))
    kj_cishu3_num_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_cishu3_num_label:setFontSize(21)
    kj_cishu3_num_label:setString("1/1")
    kj_cishu3_num_label:setColor(cc.c3b(0,255,0))
    keju:appendComponent(kj_cishu3_num_label)
    kj_cishu3_num_label:setPositionInContainer(cc.p(870,426))
    table_keju["kj_cishu3_num_label"] = kj_cishu3_num_label

    local kj_xiangshi_kehuode_label = fc.FLabel:createBMFont()
    kj_xiangshi_kehuode_label:setSize(cc.size(120,30))
    kj_xiangshi_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_xiangshi_kehuode_label:setFontSize(20)
    local str1 =  g_game.g_dictConfigManager:getLanTextById(147)
    kj_xiangshi_kehuode_label:setString(str1)
    kj_xiangshi_kehuode_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_xiangshi_kehuode_label)
    kj_xiangshi_kehuode_label:setPositionInContainer(cc.p(158,84))
    table_keju["kj_xiangshi_kehuode_label"] = kj_xiangshi_kehuode_label

    local kj_huishi_kehuode_label = fc.FLabel:createBMFont()
    kj_huishi_kehuode_label:setSize(cc.size(120,30))
    kj_huishi_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_huishi_kehuode_label:setFontSize(20)
    local str2 =  g_game.g_dictConfigManager:getLanTextById(148)
    kj_huishi_kehuode_label:setString(str2)
    kj_huishi_kehuode_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_huishi_kehuode_label)
    kj_huishi_kehuode_label:setPositionInContainer(cc.p(478,84))
    table_keju["kj_huishi_kehuode_label"] = kj_huishi_kehuode_label

    local kj_dianshi_kehuode_label = fc.FLabel:createBMFont()
    kj_dianshi_kehuode_label:setSize(cc.size(120,30))
    kj_dianshi_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_dianshi_kehuode_label:setFontSize(20)
    local str3 =  g_game.g_dictConfigManager:getLanTextById(149)
    kj_dianshi_kehuode_label:setString(str3)
    kj_dianshi_kehuode_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_dianshi_kehuode_label)
    kj_dianshi_kehuode_label:setPositionInContainer(cc.p(797,84))
    table_keju["kj_dianshi_kehuode_label"] = kj_dianshi_kehuode_label

    local kj_luo_xiang_button = fc.FScaleButton:create()
    kj_luo_xiang_button:setSize(cc.size(146,53))
    kj_luo_xiang_button:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_xiang_button:setButtonImage("batch_ui/teshuanniu.png")
    keju:appendComponent(kj_luo_xiang_button)
    kj_luo_xiang_button:setPositionInContainer(cc.p(158,474.5))
    table_keju["kj_luo_xiang_button"] = kj_luo_xiang_button

    local kai1 = fc.FExtensionsImage:create()
    kai1:setImage("batch_ui/kai_uizi.png")
    kai1:setSize(cc.size(32,32))
    kai1:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_xiang_button:appendComponent(kai1)
    kai1:setPositionInContainer(cc.p(52,26))
    table_keju["kai1"] = kai1

    local kao1 = fc.FExtensionsImage:create()
    kao1:setImage("batch_ui/kao.png")
    kao1:setSize(cc.size(32,32))
    kao1:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_xiang_button:appendComponent(kao1)
    kao1:setPositionInContainer(cc.p(94,26))
    table_keju["kao1"] = kao1

    local kj_luo_hui_button = fc.FScaleButton:create()
    kj_luo_hui_button:setSize(cc.size(146,53))
    kj_luo_hui_button:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_hui_button:setButtonImage("batch_ui/teshuanniu.png")
    keju:appendComponent(kj_luo_hui_button)
    kj_luo_hui_button:setPositionInContainer(cc.p(484,474.5))
    table_keju["kj_luo_hui_button"] = kj_luo_hui_button

    local kai2 = fc.FExtensionsImage:create()
    kai2:setImage("batch_ui/kai_uizi.png")
    kai2:setSize(cc.size(32,32))
    kai2:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_hui_button:appendComponent(kai2)
    kai2:setPositionInContainer(cc.p(51,26))
    table_keju["kai2"] = kai2

    local kao2 = fc.FExtensionsImage:create()
    kao2:setImage("batch_ui/kao.png")
    kao2:setSize(cc.size(32,32))
    kao2:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_hui_button:appendComponent(kao2)
    kao2:setPositionInContainer(cc.p(95,26))
    table_keju["kao2"] = kao2

    local kj_luo_dian_button = fc.FScaleButton:create()
    kj_luo_dian_button:setSize(cc.size(146,53))
    kj_luo_dian_button:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_dian_button:setButtonImage("batch_ui/teshuanniu.png")
    keju:appendComponent(kj_luo_dian_button)
    kj_luo_dian_button:setPositionInContainer(cc.p(801,474.5))
    table_keju["kj_luo_dian_button"] = kj_luo_dian_button

    local kai3 = fc.FExtensionsImage:create()
    kai3:setImage("batch_ui/kai_uizi.png")
    kai3:setSize(cc.size(32,32))
    kai3:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_dian_button:appendComponent(kai3)
    kai3:setPositionInContainer(cc.p(52,26))
    table_keju["kai3"] = kai3

    local kao3 = fc.FExtensionsImage:create()
    kao3:setImage("batch_ui/kao.png")
    kao3:setSize(cc.size(32,32))
    kao3:setAnchorPoint(cc.p(0.5,0.5))
    kj_luo_dian_button:appendComponent(kao3)
    kao3:setPositionInContainer(cc.p(94,26))
    table_keju["kao3"] = kao3

    local kj_mianfei_time1_label = fc.FLabel:createBMFont()
    kj_mianfei_time1_label:setSize(cc.size(140,30))
    kj_mianfei_time1_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_mianfei_time1_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kj_mianfei_time1_label:setString("距離下次還有:")
    else
    	kj_mianfei_time1_label:setString("距离下次还有:")
    end
    
    kj_mianfei_time1_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_mianfei_time1_label)
    kj_mianfei_time1_label:setPositionInContainer(cc.p(118,426))
    table_keju["kj_mianfei_time1_label"] = kj_mianfei_time1_label

    local value1 = fc.FLabel:createBMFont()
    value1:setSize(cc.size(90,30))
    value1:setAnchorPoint(cc.p(0.5,0.5))
    value1:setFontSize(21)
    value1:setString("00:00:00")
    value1:setColor(cc.c3b(0,255,0))
    keju:appendComponent(value1)
    value1:setPositionInContainer(cc.p(234,426))
    table_keju["value1"] = value1

    local kj_mianfei_time2_label = fc.FLabel:createBMFont()
    kj_mianfei_time2_label:setSize(cc.size(140,30))
    kj_mianfei_time2_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_mianfei_time2_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kj_mianfei_time2_label:setString("距離下次還有:")
    else
    	kj_mianfei_time2_label:setString("距离下次还有:")
    end
    kj_mianfei_time2_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_mianfei_time2_label)
    kj_mianfei_time2_label:setPositionInContainer(cc.p(435,426))
    table_keju["kj_mianfei_time2_label"] = kj_mianfei_time2_label

    local value2 = fc.FLabel:createBMFont()
    value2:setSize(cc.size(90,30))
    value2:setAnchorPoint(cc.p(0.5,0.5))
    value2:setFontSize(21)
    value2:setString("00:00:00")
    value2:setColor(cc.c3b(0,255,0))
    keju:appendComponent(value2)
    value2:setPositionInContainer(cc.p(550,426))
    table_keju["value2"] = value2

    local kj_mianfei_time3_label = fc.FLabel:createBMFont()
    kj_mianfei_time3_label:setSize(cc.size(140,30))
    kj_mianfei_time3_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_mianfei_time3_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kj_mianfei_time3_label:setString("距離下次還有:")
    else
    	kj_mianfei_time3_label:setString("距离下次还有:")
    end
    kj_mianfei_time3_label:setColor(cc.c3b(250,255,165))
    keju:appendComponent(kj_mianfei_time3_label)
    kj_mianfei_time3_label:setPositionInContainer(cc.p(755,426))
    table_keju["kj_mianfei_time3_label"] = kj_mianfei_time3_label

    local value3 = fc.FLabel:createBMFont()
    value3:setSize(cc.size(90,30))
    value3:setAnchorPoint(cc.p(0.5,0.5))
    value3:setFontSize(21)
    value3:setString("00:00:00")
    value3:setColor(cc.c3b(0,255,0))
    keju:appendComponent(value3)
    value3:setPositionInContainer(cc.p(870,426))
    table_keju["value3"] = value3

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang (2).png")
    xiang:setSize(cc.size(40,35))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(128,31.5))
    table_keju["xiang"] = xiang

    local num_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di2:setSize(cc.size(120,30))
    num_di2:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(num_di2)
    num_di2:setPositionInContainer(cc.p(484,521))
    table_keju["num_di2"] = num_di2

    local shi1 = fc.FExtensionsImage:create()
    shi1:setImage("batch_ui/shi(1).png")
    shi1:setSize(cc.size(40,35))
    shi1:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(shi1)
    shi1:setPositionInContainer(cc.p(200,31.5))
    table_keju["shi1"] = shi1

    local hui = fc.FExtensionsImage:create()
    hui:setImage("batch_ui/hui.png")
    hui:setSize(cc.size(40,35))
    hui:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(hui)
    hui:setPositionInContainer(cc.p(447,31.5))
    table_keju["hui"] = hui

    local shi2 = fc.FExtensionsImage:create()
    shi2:setImage("batch_ui/shi(2).png")
    shi2:setSize(cc.size(40,35))
    shi2:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(shi2)
    shi2:setPositionInContainer(cc.p(518,31.5))
    table_keju["shi2"] = shi2

    local dian = fc.FExtensionsImage:create()
    dian:setImage("batch_ui/dian (3).png")
    dian:setSize(cc.size(40,35))
    dian:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(dian)
    dian:setPositionInContainer(cc.p(769,31.5))
    table_keju["dian"] = dian

    local shi3 = fc.FExtensionsImage:create()
    shi3:setImage("batch_ui/shi(3).png")
    shi3:setSize(cc.size(40,35))
    shi3:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(shi3)
    shi3:setPositionInContainer(cc.p(838,31.5))
    table_keju["shi3"] = shi3

    local xing1 = fc.FExtensionsImage:create()
    xing1:setImage("batch_ui/xingxing.png")
    xing1:setSize(cc.size(20,19))
    xing1:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(xing1)
    xing1:setPositionInContainer(cc.p(222,86.5))
    table_keju["xing1"] = xing1

    local xing2 = fc.FExtensionsImage:create()
    xing2:setImage("batch_ui/xingxing.png")
    xing2:setSize(cc.size(20,19))
    xing2:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(xing2)
    xing2:setPositionInContainer(cc.p(544,86.5))
    table_keju["xing2"] = xing2

    local xing3 = fc.FExtensionsImage:create()
    xing3:setImage("batch_ui/xingxing.png")
    xing3:setSize(cc.size(20,19))
    xing3:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(xing3)
    xing3:setPositionInContainer(cc.p(864,86.5))
    table_keju["xing3"] = xing3

    local num_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di1:setSize(cc.size(120,30))
    num_di1:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(num_di1)
    num_di1:setPositionInContainer(cc.p(158,521))
    table_keju["num_di1"] = num_di1

    local yuanbao1 = fc.FExtensionsImage:create()
    yuanbao1:setImage("batch_ui/yuanbao.png")
    yuanbao1:setSize(cc.size(40,30))
    yuanbao1:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(yuanbao1)
    yuanbao1:setPositionInContainer(cc.p(130,522))
    table_keju["yuanbao1"] = yuanbao1

    local yuanbao_num1 = fc.FLabel:createBMFont()
    yuanbao_num1:setSize(cc.size(50,30))
    yuanbao_num1:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num1:setFontSize(21)
    yuanbao_num1:setString("100")
    yuanbao_num1:setColor(cc.c3b(255,255,255))
    keju:appendComponent(yuanbao_num1)
    yuanbao_num1:setPositionInContainer(cc.p(178,518))
    table_keju["yuanbao_num1"] = yuanbao_num1

    local yuanbao2 = fc.FExtensionsImage:create()
    yuanbao2:setImage("batch_ui/yuanbao.png")
    yuanbao2:setSize(cc.size(40,30))
    yuanbao2:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(yuanbao2)
    yuanbao2:setPositionInContainer(cc.p(459,522))
    table_keju["yuanbao2"] = yuanbao2

    local yuanbao_num2 = fc.FLabel:createBMFont()
    yuanbao_num2:setSize(cc.size(50,30))
    yuanbao_num2:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num2:setFontSize(21)
    yuanbao_num2:setString("00:00:00")
    yuanbao_num2:setColor(cc.c3b(255,255,255))
    keju:appendComponent(yuanbao_num2)
    yuanbao_num2:setPositionInContainer(cc.p(506,518))
    table_keju["yuanbao_num2"] = yuanbao_num2

    local num_di3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di3:setSize(cc.size(120,30))
    num_di3:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(num_di3)
    num_di3:setPositionInContainer(cc.p(803,521))
    table_keju["num_di3"] = num_di3

    local yuanbao_num3 = fc.FLabel:createBMFont()
    yuanbao_num3:setSize(cc.size(50,30))
    yuanbao_num3:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num3:setFontSize(21)
    yuanbao_num3:setString("00:00:00")
    yuanbao_num3:setColor(cc.c3b(255,255,255))
    keju:appendComponent(yuanbao_num3)
    yuanbao_num3:setPositionInContainer(cc.p(821,518))
    table_keju["yuanbao_num3"] = yuanbao_num3

    local yuanbao3 = fc.FExtensionsImage:create()
    yuanbao3:setImage("batch_ui/yuanbao.png")
    yuanbao3:setSize(cc.size(40,30))
    yuanbao3:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(yuanbao3)
    yuanbao3:setPositionInContainer(cc.p(776,522))
    table_keju["yuanbao3"] = yuanbao3

    local dachen1 = fc.FExtensionsImage:create()
    dachen1:setImage("nobatch/xiangshi.png")
    dachen1:setSize(cc.size(284,219))
    dachen1:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(dachen1)
    dachen1:setPositionInContainer(cc.p(165,305.5))
    table_keju["dachen1"] = dachen1

    local dachen2 = fc.FExtensionsImage:create()
    dachen2:setImage("nobatch/huishi.png")
    dachen2:setSize(cc.size(284,219))
    dachen2:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(dachen2)
    dachen2:setPositionInContainer(cc.p(483,305.5))
    table_keju["dachen2"] = dachen2

    local dachen3 = fc.FExtensionsImage:create()
    dachen3:setImage("nobatch/dianshi.png")
    dachen3:setSize(cc.size(284,219))
    dachen3:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(dachen3)
    dachen3:setPositionInContainer(cc.p(796,305.5))
    table_keju["dachen3"] = dachen3

    local bide_image = fc.FExtensionsImage:create()
    bide_image:setImage("nobatch/zaichoubide.png")
    bide_image:setSize(cc.size(281,70))
    bide_image:setAnchorPoint(cc.p(0.5,0.5))
    keju:appendComponent(bide_image)
    bide_image:setPositionInContainer(cc.p(796.5,380))
    table_keju["bide_image"] = bide_image

    local tip_left_num = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE))
    tip_left_num:setAnchorPoint(cc.p(0.5,0.5))
    tip_left_num:setSize(cc.size(28,20))
    tip_left_num:setAlignment(1)
    tip_left_num:setScale(0.8)
    keju:appendComponent(tip_left_num)
    tip_left_num:setPositionInContainer(cc.p(770,364))
    table_keju["tip_left_num"] = tip_left_num

    return table_keju

end

