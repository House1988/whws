function createmain_ui_top_left()

    local table_main_ui_top_left = {}

    local main_ui_top_left = fc.FContainerPanel:create()
    main_ui_top_left:setSize(cc.size(960,640))
    table_main_ui_top_left["main_ui_top_left"] = main_ui_top_left

    local silver_bg_image = fc.FExtensionsImage:create()
    silver_bg_image:setImage("batch_ui/xuetiaoditu.png")
    silver_bg_image:setSize(cc.size(160,27))
    silver_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(silver_bg_image)
    silver_bg_image:setPositionInContainer(cc.p(487,22.5))
    table_main_ui_top_left["silver_bg_image"] = silver_bg_image

    local gold_bg_image = fc.FExtensionsImage:create()
    gold_bg_image:setImage("batch_ui/xuetiaoditu.png")
    gold_bg_image:setSize(cc.size(160,27))
    gold_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(gold_bg_image)
    gold_bg_image:setPositionInContainer(cc.p(487,49.5))
    table_main_ui_top_left["gold_bg_image"] = gold_bg_image

    local silver_image = fc.FExtensionsImage:create()
    silver_image:setImage("batch_ui/yinliang_tubiao.png")
    silver_image:setSize(cc.size(29,24))
    silver_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(silver_image)
    silver_image:setPositionInContainer(cc.p(435.5,24))
    table_main_ui_top_left["silver_image"] = silver_image

    local gold_image = fc.FExtensionsImage:create()
    gold_image:setImage("batch_ui/yuanbao_tubiao.png")
    gold_image:setSize(cc.size(28,23))
    gold_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(gold_image)
    gold_image:setPositionInContainer(cc.p(435,50.5))
    table_main_ui_top_left["gold_image"] = gold_image

    local tili_bg_image = fc.FExtensionsImage:create()
    tili_bg_image:setImage("batch_ui/xuetiaoditu.png")
    tili_bg_image:setSize(cc.size(209,27))
    tili_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(tili_bg_image)
    tili_bg_image:setPositionInContainer(cc.p(680.5,22.5))
    table_main_ui_top_left["tili_bg_image"] = tili_bg_image

    local jingli_bg_image = fc.FExtensionsImage:create()
    jingli_bg_image:setImage("batch_ui/xuetiaoditu.png")
    jingli_bg_image:setSize(cc.size(209,27))
    jingli_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(jingli_bg_image)
    jingli_bg_image:setPositionInContainer(cc.p(681.5,49.5))
    table_main_ui_top_left["jingli_bg_image"] = jingli_bg_image

    local jingli_loading_bar = fc.FLoadingBar:create()
   jingli_loading_bar:setLoadingBarBgImage("batch_ui/xuetiaokuang.png")
    jingli_loading_bar:setLoadingBarImage("batch_ui/jinglitiao.png")
    jingli_loading_bar:setSize(cc.size(112,12))
    jingli_loading_bar:setAnchorPoint(cc.p(0.5,0.5))
    jingli_loading_bar:setPercent(70)
    main_ui_top_left:appendComponent(jingli_loading_bar)
    jingli_loading_bar:setPositionInContainer(cc.p(705,50))
    table_main_ui_top_left["jingli_loading_bar"] = jingli_loading_bar

    local tili_loading_bar = fc.FLoadingBar:create()
   tili_loading_bar:setLoadingBarBgImage("batch_ui/xuetiaokuang.png")
    tili_loading_bar:setLoadingBarImage("batch_ui/tilitiao.png")
    tili_loading_bar:setSize(cc.size(112,12))
    tili_loading_bar:setAnchorPoint(cc.p(0.5,0.5))
    tili_loading_bar:setPercent(70)
    main_ui_top_left:appendComponent(tili_loading_bar)
    tili_loading_bar:setPositionInContainer(cc.p(705,24))
    table_main_ui_top_left["tili_loading_bar"] = tili_loading_bar

    local user_info_up_left_image = fc.FExtensionsImage:create()
    user_info_up_left_image:setImage("batch_ui/touxiangkuang.png")
    user_info_up_left_image:setSize(cc.size(309,122))
    user_info_up_left_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(user_info_up_left_image)
    user_info_up_left_image:setPositionInContainer(cc.p(154.5,61))
    table_main_ui_top_left["user_info_up_left_image"] = user_info_up_left_image

    local user_exp_bar = fc.FLoadingBar:create()
    user_exp_bar:setLoadingBarImage("batch_ui/jingyantiao.png")
    user_exp_bar:setSize(cc.size(90,34))
    user_exp_bar:setAnchorPoint(cc.p(0.5,0.5))
    user_exp_bar:setPercent(50)
    main_ui_top_left:appendComponent(user_exp_bar)
    user_exp_bar:setPositionInContainer(cc.p(53,90))
    table_main_ui_top_left["user_exp_bar"] = user_exp_bar

    local flabel_exp = fc.FLabel:createBMFont()
    flabel_exp:setSize(cc.size(50,20))
    flabel_exp:setAnchorPoint(cc.p(0.5,0.5))
    flabel_exp:setFontSize(16)
    flabel_exp:setString("15/100")
    flabel_exp:setColor(cc.c3b(255, 255, 0))
    main_ui_top_left:appendComponent(flabel_exp)
    flabel_exp:setPositionInContainer(cc.p(50,106))
    table_main_ui_top_left["flabel_exp"] = flabel_exp

    local flabel_lv = fc.FLabel:createBMFont()
    flabel_lv:setSize(cc.size(40,20))
    flabel_lv:setAnchorPoint(cc.p(0.5,0.5))
    flabel_lv:setFontSize(16)
    flabel_lv:setString("Lv.15")
    flabel_lv:setColor(cc.c3b(255, 255, 0))
    main_ui_top_left:appendComponent(flabel_lv)
    flabel_lv:setPositionInContainer(cc.p(123,72))
    table_main_ui_top_left["flabel_lv"] = flabel_lv

    local flabel_user_name = fc.FLabel:createSystemFont()
    flabel_user_name:setSize(cc.size(120,20))
    flabel_user_name:setAnchorPoint(cc.p(0.5,0.5))
    flabel_user_name:setFontSize(20)
    flabel_user_name:setString("鲍飞")
    flabel_user_name:setColor(cc.c3b(255, 255, 0))
    main_ui_top_left:appendComponent(flabel_user_name)
    flabel_user_name:setPositionInContainer(cc.p(186,19))
    table_main_ui_top_left["flabel_user_name"] = flabel_user_name

    local flabel_attack = fc.FLabel:createBMFont()
    flabel_attack:setSize(cc.size(60,18))
    flabel_attack:setAnchorPoint(cc.p(0.5,0.5))
    flabel_attack:setFontSize(16)
    flabel_attack:setString("15/100")
    flabel_attack:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_attack)
    flabel_attack:setPositionInContainer(cc.p(159,45))
    table_main_ui_top_left["flabel_attack"] = flabel_attack

    local flabel_defense = fc.FLabel:createBMFont()
    flabel_defense:setSize(cc.size(60,18))
    flabel_defense:setAnchorPoint(cc.p(0.5,0.5))
    flabel_defense:setFontSize(16)
    flabel_defense:setString("15/100")
    flabel_defense:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_defense)
    flabel_defense:setPositionInContainer(cc.p(254,45))
    table_main_ui_top_left["flabel_defense"] = flabel_defense

    local flabel_silver = fc.FLabel:createBMFont()
    flabel_silver:setSize(cc.size(60,18))
    flabel_silver:setAnchorPoint(cc.p(0.5,0.5))
    flabel_silver:setFontSize(16)
    flabel_silver:setString("1009999")
    flabel_silver:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_silver)
    flabel_silver:setPositionInContainer(cc.p(495,20))
    table_main_ui_top_left["flabel_silver"] = flabel_silver

    local flabel_gold = fc.FLabel:createBMFont()
    flabel_gold:setSize(cc.size(60,18))
    flabel_gold:setAnchorPoint(cc.p(0.5,0.5))
    flabel_gold:setFontSize(16)
    flabel_gold:setString("1009999")
    flabel_gold:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_gold)
    flabel_gold:setPositionInContainer(cc.p(495,48))
    table_main_ui_top_left["flabel_gold"] = flabel_gold

    local flabel_tili = fc.FLabel:createBMFont()
    flabel_tili:setSize(cc.size(40,20))
    flabel_tili:setAnchorPoint(cc.p(0.5,0.5))
    flabel_tili:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 flabel_tili:setString("糧草")
    else
    	 flabel_tili:setString("粮草")
    end
   
    flabel_tili:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_tili)
    flabel_tili:setPositionInContainer(cc.p(626,20))
    table_main_ui_top_left["flabel_tili"] = flabel_tili

    local flabel_jingli = fc.FLabel:createBMFont()
    flabel_jingli:setSize(cc.size(40,20))
    flabel_jingli:setAnchorPoint(cc.p(0.5,0.5))
    flabel_jingli:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	flabel_jingli:setString("軍令")
    else	
    	flabel_jingli:setString("军令")
    end
    
    flabel_jingli:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_jingli)
    flabel_jingli:setPositionInContainer(cc.p(626,47))
    table_main_ui_top_left["flabel_jingli"] = flabel_jingli

    local flabel_tili_num = fc.FLabel:createBMFont()
    flabel_tili_num:setSize(cc.size(70,20))
    flabel_tili_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_tili_num:setFontSize(16)
    flabel_tili_num:setString("10/100")
    flabel_tili_num:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_tili_num)
    flabel_tili_num:setPositionInContainer(cc.p(716,21))
    table_main_ui_top_left["flabel_tili_num"] = flabel_tili_num

    local flabel_jingli_num = fc.FLabel:createBMFont()
    flabel_jingli_num:setSize(cc.size(70,20))
    flabel_jingli_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_jingli_num:setFontSize(16)
    flabel_jingli_num:setString("10/100")
    flabel_jingli_num:setColor(cc.c3b(255, 255, 255))
    main_ui_top_left:appendComponent(flabel_jingli_num)
    flabel_jingli_num:setPositionInContainer(cc.p(716,47))
    table_main_ui_top_left["flabel_jingli_num"] = flabel_jingli_num

    local emperor_btn = fc.FScaleButton:create()
    emperor_btn:setSize(cc.size(84,99))
    emperor_btn:setAnchorPoint(cc.p(0.5,0.5))
    emperor_btn:setButtonImage("batch_ui/touxiangkuang_huangguan.png")
    main_ui_top_left:appendComponent(emperor_btn)
    emperor_btn:setPositionInContainer(cc.p(47,42.5))
    table_main_ui_top_left["emperor_btn"] = emperor_btn

    local user_vip_image = fc.FExtensionsImage:create()
    user_vip_image:setImage("batch_ui/vip_zhujiemian.png")
    user_vip_image:setSize(cc.size(42,23))
    user_vip_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_left:appendComponent(user_vip_image)
    user_vip_image:setPositionInContainer(cc.p(183,77.5))
    table_main_ui_top_left["user_vip_image"] = user_vip_image

    local chongzhi_btn = fc.FScaleButton:create()
    chongzhi_btn:setSize(cc.size(81,79))
    chongzhi_btn:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi_btn:setButtonImage("batch_ui/chongzhi_anniu1.png")
    main_ui_top_left:appendComponent(chongzhi_btn)
    chongzhi_btn:setPositionInContainer(cc.p(357.5,43.5))
    table_main_ui_top_left["chongzhi_btn"] = chongzhi_btn

    return table_main_ui_top_left

end

