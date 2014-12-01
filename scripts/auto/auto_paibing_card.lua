function createpaibing_card()

    local table_paibing_card = {}

    local paibing_card = fc.FContainerPanel:create()
    paibing_card:setSize(cc.size(742,430))
    table_paibing_card["paibing_card"] = paibing_card

    local item_panel_1 = fc.FContainerPanel:create()
    item_panel_1:setSize(cc.size(104,104))
    item_panel_1:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(item_panel_1)
    item_panel_1:setPositionInContainer(cc.p(70,107))
    table_paibing_card["item_panel_1"] = item_panel_1

    local public_icon_di = fc.FExtensionsImage:create()
    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
    public_icon_di:setSize(cc.size(104,104))
    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_1:appendComponent(public_icon_di)
    public_icon_di:setPositionInContainer(cc.p(52,52))
    table_paibing_card["public_icon_di"] = public_icon_di

    local item_bg_1 = fc.FExtensionsImage:create()
    item_bg_1:setImage("batch_ui/zhuangbei3_weikaiqi.png")
    item_bg_1:setSize(cc.size(90,90))
    item_bg_1:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_1:appendComponent(item_bg_1)
    item_bg_1:setPositionInContainer(cc.p(52,52))
    table_paibing_card["item_bg_1"] = item_bg_1

    local label_kezhuangbei1 = fc.FLabel:createBMFont()
    label_kezhuangbei1:setSize(cc.size(70,28))
    label_kezhuangbei1:setAnchorPoint(cc.p(0.5,0.5))
    label_kezhuangbei1:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	label_kezhuangbei1:setString("可裝備")
    else
    	label_kezhuangbei1:setString("可装备")
    end
   
    label_kezhuangbei1:setColor(cc.c3b(185,255,0))
    item_panel_1:appendComponent(label_kezhuangbei1)
    label_kezhuangbei1:setPositionInContainer(cc.p(46,77))
    table_paibing_card["label_kezhuangbei1"] = label_kezhuangbei1

    local plus_img_1 = fc.FExtensionsImage:create()
    plus_img_1:setImage("batch_ui/jiazhuangbei.png")
    plus_img_1:setSize(cc.size(36,37))
    plus_img_1:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_1:appendComponent(plus_img_1)
    plus_img_1:setPositionInContainer(cc.p(73,30.5))
    table_paibing_card["plus_img_1"] = plus_img_1

    local equip_frame1 = fc.FExtensionsImage:create()
    equip_frame1:setImage("batch_ui/baipinzhi_kuang.png")
    equip_frame1:setSize(cc.size(104,104))
    equip_frame1:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_1:appendComponent(equip_frame1)
    equip_frame1:setPositionInContainer(cc.p(52,52))
    table_paibing_card["equip_frame1"] = equip_frame1

    local item_1 = fc.FExtensionsImage:create()
    item_1:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_1:appendComponent(item_1)
    item_1:setPositionInContainer(cc.p(52,52))
    table_paibing_card["item_1"] = item_1

    local equipLV1 = fc.FLabel:createBMFont()
    equipLV1:setSize(cc.size(70,30))
    equipLV1:setAnchorPoint(cc.p(0.5,0.5))
    equipLV1:setFontSize(21)
    equipLV1:setString("100")
    equipLV1:setColor(cc.c3b(255,255,255))
    item_panel_1:appendComponent(equipLV1)
    equipLV1:setPositionInContainer(cc.p(62,82))
    table_paibing_card["equipLV1"] = equipLV1

    local item_panel_2 = fc.FContainerPanel:create()
    item_panel_2:setSize(cc.size(104,104))
    item_panel_2:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(item_panel_2)
    item_panel_2:setPositionInContainer(cc.p(70,222))
    table_paibing_card["item_panel_2"] = item_panel_2

    local public_icon_di = fc.FExtensionsImage:create()
    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
    public_icon_di:setSize(cc.size(104,104))
    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_2:appendComponent(public_icon_di)
    public_icon_di:setPositionInContainer(cc.p(52,52))
    table_paibing_card["public_icon_di"] = public_icon_di

    local item_bg_2 = fc.FExtensionsImage:create()
    item_bg_2:setImage("batch_ui/zhuangbei_weikaiqi.png")
    item_bg_2:setSize(cc.size(90,90))
    item_bg_2:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_2:appendComponent(item_bg_2)
    item_bg_2:setPositionInContainer(cc.p(52,52))
    table_paibing_card["item_bg_2"] = item_bg_2

    local label_kezhuangbei2 = fc.FLabel:createBMFont()
    label_kezhuangbei2:setSize(cc.size(70,28))
    label_kezhuangbei2:setAnchorPoint(cc.p(0.5,0.5))
    label_kezhuangbei2:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	label_kezhuangbei2:setString("可裝備")
    else
    	label_kezhuangbei2:setString("可装备")
    end
    label_kezhuangbei2:setColor(cc.c3b(185,255,0))
    item_panel_2:appendComponent(label_kezhuangbei2)
    label_kezhuangbei2:setPositionInContainer(cc.p(46,77))
    table_paibing_card["label_kezhuangbei2"] = label_kezhuangbei2

    local plus_img_2 = fc.FExtensionsImage:create()
    plus_img_2:setImage("batch_ui/jiazhuangbei.png")
    plus_img_2:setSize(cc.size(36,37))
    plus_img_2:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_2:appendComponent(plus_img_2)
    plus_img_2:setPositionInContainer(cc.p(73,30.5))
    table_paibing_card["plus_img_2"] = plus_img_2

    local equip_frame2 = fc.FExtensionsImage:create()
    equip_frame2:setImage("batch_ui/baipinzhi_kuang.png")
    equip_frame2:setSize(cc.size(104,104))
    equip_frame2:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_2:appendComponent(equip_frame2)
    equip_frame2:setPositionInContainer(cc.p(52,52))
    table_paibing_card["equip_frame2"] = equip_frame2

    local item_2 = fc.FExtensionsImage:create()
    item_2:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_2:appendComponent(item_2)
    item_2:setPositionInContainer(cc.p(52,52))
    table_paibing_card["item_2"] = item_2

    local equipLV2 = fc.FLabel:createBMFont()
    equipLV2:setSize(cc.size(70,30))
    equipLV2:setAnchorPoint(cc.p(0.5,0.5))
    equipLV2:setFontSize(21)
    equipLV2:setString("100")
    equipLV2:setColor(cc.c3b(255,255,255))
    item_panel_2:appendComponent(equipLV2)
    equipLV2:setPositionInContainer(cc.p(62,82))
    table_paibing_card["equipLV2"] = equipLV2

    local skill_panel_1 = fc.FContainerPanel:create()
    skill_panel_1:setSize(cc.size(104,104))
    skill_panel_1:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(skill_panel_1)
    skill_panel_1:setPositionInContainer(cc.p(465,107))
    table_paibing_card["skill_panel_1"] = skill_panel_1

    local public_icon_di = fc.FExtensionsImage:create()
    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
    public_icon_di:setSize(cc.size(104,104))
    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_1:appendComponent(public_icon_di)
    public_icon_di:setPositionInContainer(cc.p(52,52))
    table_paibing_card["public_icon_di"] = public_icon_di

    local skill_bg_1 = fc.FExtensionsImage:create()
    skill_bg_1:setImage("batch_ui/zhuangbei4_weikaiqi.png")
    skill_bg_1:setSize(cc.size(90,90))
    skill_bg_1:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_1:appendComponent(skill_bg_1)
    skill_bg_1:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_bg_1"] = skill_bg_1

    local skill_frame1 = fc.FExtensionsImage:create()
    skill_frame1:setImage("batch_ui/baipinzhi_kuang.png")
    skill_frame1:setSize(cc.size(104,104))
    skill_frame1:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_1:appendComponent(skill_frame1)
    skill_frame1:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_frame1"] = skill_frame1

    local skill_1 = fc.FExtensionsImage:create()
    skill_1:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_1:appendComponent(skill_1)
    skill_1:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_1"] = skill_1

    local skillLocak1 = fc.FLabel:createBMFont()
    skillLocak1:setSize(cc.size(59,19))
    skillLocak1:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak1:setFontSize(22)
    if LANGUAGE_TYPE == 3 then
    	skillLocak1:setString("天賦解鎖")
    else
    	skillLocak1:setString("天赋解锁")
    end
    skillLocak1:setColor(cc.c3b(0,255,0))
    skill_panel_1:appendComponent(skillLocak1)
    skillLocak1:setPositionInContainer(cc.p(51.5,82.5))
    table_paibing_card["skillLocak1"] = skillLocak1

    local skill_panel_2 = fc.FContainerPanel:create()
    skill_panel_2:setSize(cc.size(104,104))
    skill_panel_2:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(skill_panel_2)
    skill_panel_2:setPositionInContainer(cc.p(465,221))
    table_paibing_card["skill_panel_2"] = skill_panel_2

    local public_icon_di = fc.FExtensionsImage:create()
    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
    public_icon_di:setSize(cc.size(104,104))
    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_2:appendComponent(public_icon_di)
    public_icon_di:setPositionInContainer(cc.p(52,52))
    table_paibing_card["public_icon_di"] = public_icon_di

    local skill_bg_2 = fc.FExtensionsImage:create()
    skill_bg_2:setImage("batch_ui/zhuangbei4_weikaiqi.png")
    skill_bg_2:setSize(cc.size(90,90))
    skill_bg_2:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_2:appendComponent(skill_bg_2)
    skill_bg_2:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_bg_2"] = skill_bg_2

    local skill_frame2 = fc.FExtensionsImage:create()
    skill_frame2:setImage("batch_ui/baipinzhi_kuang.png")
    skill_frame2:setSize(cc.size(104,104))
    skill_frame2:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_2:appendComponent(skill_frame2)
    skill_frame2:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_frame2"] = skill_frame2

    local skill_2 = fc.FExtensionsImage:create()
    skill_2:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_2:appendComponent(skill_2)
    skill_2:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_2"] = skill_2

    local skillLocak2 = fc.FLabel:createBMFont()
    skillLocak2:setSize(cc.size(59,19))
    skillLocak2:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak2:setFontSize(22)
    if LANGUAGE_TYPE == 3 then
    	skillLocak2:setString("天賦解鎖")
    else
    	skillLocak2:setString("天赋解锁")
    end
    skillLocak2:setColor(cc.c3b(0,255,0))
    skill_panel_2:appendComponent(skillLocak2)
    skillLocak2:setPositionInContainer(cc.p(51.5,82.5))
    table_paibing_card["skillLocak2"] = skillLocak2

    local skill_panel_3 = fc.FContainerPanel:create()
    skill_panel_3:setSize(cc.size(104,104))
    skill_panel_3:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(skill_panel_3)
    skill_panel_3:setPositionInContainer(cc.p(465,335))
    table_paibing_card["skill_panel_3"] = skill_panel_3

    local public_icon_di = fc.FExtensionsImage:create()
    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
    public_icon_di:setSize(cc.size(104,104))
    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_3:appendComponent(public_icon_di)
    public_icon_di:setPositionInContainer(cc.p(52,52))
    table_paibing_card["public_icon_di"] = public_icon_di

    local skill_bg_3 = fc.FExtensionsImage:create()
    skill_bg_3:setImage("batch_ui/zhuangbei4_weikaiqi.png")
    skill_bg_3:setSize(cc.size(90,90))
    skill_bg_3:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_3:appendComponent(skill_bg_3)
    skill_bg_3:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_bg_3"] = skill_bg_3

    local skill_frame3 = fc.FExtensionsImage:create()
    skill_frame3:setImage("batch_ui/baipinzhi_kuang.png")
    skill_frame3:setSize(cc.size(104,104))
    skill_frame3:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_3:appendComponent(skill_frame3)
    skill_frame3:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_frame3"] = skill_frame3

    local skill_3 = fc.FExtensionsImage:create()
    skill_3:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel_3:appendComponent(skill_3)
    skill_3:setPositionInContainer(cc.p(52,52))
    table_paibing_card["skill_3"] = skill_3

    local skillLocak3 = fc.FLabel:createBMFont()
    skillLocak3:setSize(cc.size(59,19))
    skillLocak3:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak3:setFontSize(22)
    if LANGUAGE_TYPE == 3 then
    	skillLocak3:setString("天賦解鎖")
    else
    	skillLocak3:setString("天赋解锁")
    end
    skillLocak3:setColor(cc.c3b(0,255,0))
    skill_panel_3:appendComponent(skillLocak3)
    skillLocak3:setPositionInContainer(cc.p(51.5,82.5))
    table_paibing_card["skillLocak3"] = skillLocak3

    local item_panel_3 = fc.FContainerPanel:create()
    item_panel_3:setSize(cc.size(104,104))
    item_panel_3:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(item_panel_3)
    item_panel_3:setPositionInContainer(cc.p(70,337))
    table_paibing_card["item_panel_3"] = item_panel_3

    local public_icon_di = fc.FExtensionsImage:create()
    public_icon_di:setImage("batch_ui/baipinzhi_kuang.png")
    public_icon_di:setSize(cc.size(104,104))
    public_icon_di:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_3:appendComponent(public_icon_di)
    public_icon_di:setPositionInContainer(cc.p(52,52))
    table_paibing_card["public_icon_di"] = public_icon_di

    local item_bg_3 = fc.FExtensionsImage:create()
    item_bg_3:setImage("batch_ui/zhuangbei2_weikaiqi.png")
    item_bg_3:setSize(cc.size(90,90))
    item_bg_3:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_3:appendComponent(item_bg_3)
    item_bg_3:setPositionInContainer(cc.p(52,52))
    table_paibing_card["item_bg_3"] = item_bg_3

    local label_kezhuangbei3 = fc.FLabel:createBMFont()
    label_kezhuangbei3:setSize(cc.size(70,28))
    label_kezhuangbei3:setAnchorPoint(cc.p(0.5,0.5))
    label_kezhuangbei3:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	label_kezhuangbei3:setString("可裝備")
    else
    	label_kezhuangbei3:setString("可装备")
    end
    label_kezhuangbei3:setColor(cc.c3b(185,255,0))
    item_panel_3:appendComponent(label_kezhuangbei3)
    label_kezhuangbei3:setPositionInContainer(cc.p(46,77))
    table_paibing_card["label_kezhuangbei3"] = label_kezhuangbei3

    local plus_img_3 = fc.FExtensionsImage:create()
    plus_img_3:setImage("batch_ui/jiazhuangbei.png")
    plus_img_3:setSize(cc.size(36,37))
    plus_img_3:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_3:appendComponent(plus_img_3)
    plus_img_3:setPositionInContainer(cc.p(74,30.5))
    table_paibing_card["plus_img_3"] = plus_img_3

    local equip_frame3 = fc.FExtensionsImage:create()
    equip_frame3:setImage("batch_ui/chengpinzhi_kuang.png")
    equip_frame3:setSize(cc.size(104,104))
    equip_frame3:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_3:appendComponent(equip_frame3)
    equip_frame3:setPositionInContainer(cc.p(52,52))
    table_paibing_card["equip_frame3"] = equip_frame3

    local item_3 = fc.FExtensionsImage:create()
    item_3:setAnchorPoint(cc.p(0.5,0.5))
    item_panel_3:appendComponent(item_3)
    item_3:setPositionInContainer(cc.p(52,52))
    table_paibing_card["item_3"] = item_3

    local equipLV3 = fc.FLabel:createBMFont()
    equipLV3:setSize(cc.size(70,30))
    equipLV3:setAnchorPoint(cc.p(0.5,0.5))
    equipLV3:setFontSize(21)
    equipLV3:setString("100")
    equipLV3:setColor(cc.c3b(255,255,255))
    item_panel_3:appendComponent(equipLV3)
    equipLV3:setPositionInContainer(cc.p(62,82))
    table_paibing_card["equipLV3"] = equipLV3

    local kaiqi_text3 = fc.FLabel:createBMFont()
    kaiqi_text3:setSize(cc.size(70,28))
    kaiqi_text3:setAnchorPoint(cc.p(0.5,0.5))
    kaiqi_text3:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	kaiqi_text3:setString("可裝備")
    else
    	kaiqi_text3:setString("可装备")
    end
    
    kaiqi_text3:setColor(cc.c3b(255,255,255))
    item_panel_3:appendComponent(kaiqi_text3)
    kaiqi_text3:setPositionInContainer(cc.p(52,48))
    table_paibing_card["kaiqi_text3"] = kaiqi_text3

    local public_prop_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(11,9,3,3))
    public_prop_di:setSize(cc.size(190,227))
    public_prop_di:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(public_prop_di)
    public_prop_di:setPositionInContainer(cc.p(634,166.5))
    table_paibing_card["public_prop_di"] = public_prop_di

    local soldier_btn = fc.FScaleButton:create()
    soldier_btn:setSize(cc.size(49,49))
    soldier_btn:setAnchorPoint(cc.p(0.5,0.5))
    soldier_btn:setButtonImage("batch_ui/bu_bingzhong_anniu.png")
    paibing_card:appendComponent(soldier_btn)
    soldier_btn:setPositionInContainer(cc.p(714.5,59.5))
    table_paibing_card["soldier_btn"] = soldier_btn

    local flabel_card_name = fc.FLabel:createBMFont()
    flabel_card_name:setSize(cc.size(60,30))
    flabel_card_name:setAnchorPoint(cc.p(0.5,0.5))
    flabel_card_name:setFontSize(20)
    flabel_card_name:setString("")
    flabel_card_name:setColor(cc.c3b(139,255,240))
    paibing_card:appendComponent(flabel_card_name)
    flabel_card_name:setPositionInContainer(cc.p(665,92))
    table_paibing_card["flabel_card_name"] = flabel_card_name

    local xingming_label = fc.FLabel:createBMFont()
    xingming_label:setSize(cc.size(60,30))
    xingming_label:setAnchorPoint(cc.p(0.5,0.5))
    xingming_label:setFontSize(20)
    xingming_label:setString("姓名：")
    xingming_label:setColor(cc.c3b(255,255,255))
    paibing_card:appendComponent(xingming_label)
    xingming_label:setPositionInContainer(cc.p(591,92))
    table_paibing_card["xingming_label"] = xingming_label

    local level_label = fc.FLabel:createBMFont()
    level_label:setSize(cc.size(50,25))
    level_label:setAnchorPoint(cc.p(0.5,0.5))
    level_label:setFontSize(21)
    level_label:setString("LV：")
    level_label:setColor(cc.c3b(255,255,255))
    paibing_card:appendComponent(level_label)
    level_label:setPositionInContainer(cc.p(591,129.5))
    table_paibing_card["level_label"] = level_label

    local label_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    label_dikuang:setSize(cc.size(90,25))
    label_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(label_dikuang)
    label_dikuang:setPositionInContainer(cc.p(661,129.5))
    table_paibing_card["label_dikuang"] = label_dikuang

    local flabel_card_lv = fc.FLabel:createBMFont()
    flabel_card_lv:setSize(cc.size(50,25))
    flabel_card_lv:setAnchorPoint(cc.p(0.5,0.5))
    flabel_card_lv:setFontSize(20)
    flabel_card_lv:setString("100")
    flabel_card_lv:setColor(cc.c3b(139,255,240))
    paibing_card:appendComponent(flabel_card_lv)
    flabel_card_lv:setPositionInContainer(cc.p(661,126.5))
    table_paibing_card["flabel_card_lv"] = flabel_card_lv

    local atk_image = fc.FExtensionsImage:create()
    atk_image:setImage("batch_ui/gongji_tubiao.png")
    atk_image:setSize(cc.size(25,35))
    atk_image:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(atk_image)
    atk_image:setPositionInContainer(cc.p(590.5,162.5))
    table_paibing_card["atk_image"] = atk_image

    local def_image = fc.FExtensionsImage:create()
    def_image:setImage("batch_ui/fangyu_tubiao.png")
    def_image:setSize(cc.size(25,35))
    def_image:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(def_image)
    def_image:setPositionInContainer(cc.p(590.5,199.5))
    table_paibing_card["def_image"] = def_image

    local label_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    label_dikuang:setSize(cc.size(90,25))
    label_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(label_dikuang)
    label_dikuang:setPositionInContainer(cc.p(661,163.5))
    table_paibing_card["label_dikuang"] = label_dikuang

    local label_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    label_dikuang:setSize(cc.size(90,25))
    label_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(label_dikuang)
    label_dikuang:setPositionInContainer(cc.p(661,200.5))
    table_paibing_card["label_dikuang"] = label_dikuang

    local label_guanzhi = fc.FLabel:createBMFont()
    label_guanzhi:setSize(cc.size(50,25))
    label_guanzhi:setAnchorPoint(cc.p(0.5,0.5))
    label_guanzhi:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    label_guanzhi:setString("官職：")
    else
	    label_guanzhi:setString("官职：")
    end
    label_guanzhi:setColor(cc.c3b(255,255,255))
    paibing_card:appendComponent(label_guanzhi)
    label_guanzhi:setPositionInContainer(cc.p(591,246.5))
    table_paibing_card["label_guanzhi"] = label_guanzhi

    local guanzhi_diwen = fc.FExtensionsImage:create()
    guanzhi_diwen:setImage("batch_ui/guanzhi_ditu.png")
    guanzhi_diwen:setSize(cc.size(85,39))
    guanzhi_diwen:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(guanzhi_diwen)
    guanzhi_diwen:setPositionInContainer(cc.p(666.5,247.5))
    table_paibing_card["guanzhi_diwen"] = guanzhi_diwen

    local guanzhi = fc.FLabel:createBMFont()
    guanzhi:setSize(cc.size(70,30))
    guanzhi:setAnchorPoint(cc.p(0.5,0.5))
    guanzhi:setFontSize(20)
    guanzhi:setString("")
    guanzhi:setColor(cc.c3b(0,0,255))
    paibing_card:appendComponent(guanzhi)
    guanzhi:setPositionInContainer(cc.p(667,246))
    table_paibing_card["guanzhi"] = guanzhi

    local paibing_card_shengji_button = fc.FScaleButton:create()
    paibing_card_shengji_button:setSize(cc.size(144,53))
    paibing_card_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    paibing_card:appendComponent(paibing_card_shengji_button)
    paibing_card_shengji_button:setPositionInContainer(cc.p(637,316.5))
    table_paibing_card["paibing_card_shengji_button"] = paibing_card_shengji_button

    local sheng_uizi = fc.FShaderExtensionsImage:create(0)
    sheng_uizi:setAnchorPoint(cc.p(0.5,0.5))
    sheng_uizi:setImage("batch_ui/sheng1_uizi.png")
    sheng_uizi:setSize(cc.size(32,32))
    paibing_card_shengji_button:appendComponent(sheng_uizi)
    sheng_uizi:setPositionInContainer(cc.p(54,26))
    table_paibing_card["sheng_uizi"] = sheng_uizi

    local ji_uizi = fc.FShaderExtensionsImage:create(0)
    ji_uizi:setAnchorPoint(cc.p(0.5,0.5))
    ji_uizi:setImage("batch_ui/ji1_uizi.png")
    ji_uizi:setSize(cc.size(32,32))
    paibing_card_shengji_button:appendComponent(ji_uizi)
    ji_uizi:setPositionInContainer(cc.p(90,26))
    table_paibing_card["ji_uizi"] = ji_uizi

    local btn_advance = fc.FScaleButton:create()
    btn_advance:setSize(cc.size(144,53))
    btn_advance:setAnchorPoint(cc.p(0.5,0.5))
    btn_advance:setButtonImage("batch_ui/putonganniu1_up.png")
    paibing_card:appendComponent(btn_advance)
    btn_advance:setPositionInContainer(cc.p(637,379.5))
    table_paibing_card["btn_advance"] = btn_advance

    local ci_uizi = fc.FShaderExtensionsImage:create(0)
    ci_uizi:setAnchorPoint(cc.p(0.5,0.5))
    ci_uizi:setImage("batch_ui/ci_uizi.png")
    ci_uizi:setSize(cc.size(32,32))
    btn_advance:appendComponent(ci_uizi)
    ci_uizi:setPositionInContainer(cc.p(54,26))
    table_paibing_card["ci_uizi"] = ci_uizi

    local guan_uizi = fc.FShaderExtensionsImage:create(0)
    guan_uizi:setAnchorPoint(cc.p(0.5,0.5))
    guan_uizi:setImage("batch_ui/guan1_uizi.png")
    guan_uizi:setSize(cc.size(32,32))
    btn_advance:appendComponent(guan_uizi)
    guan_uizi:setPositionInContainer(cc.p(90,26))
    table_paibing_card["guan_uizi"] = guan_uizi

    local flabel_defense_num = fc.FLabel:createBMFont()
    flabel_defense_num:setSize(cc.size(70,30))
    flabel_defense_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_defense_num:setFontSize(21)
    flabel_defense_num:setString("0")
    flabel_defense_num:setColor(cc.c3b(139,255,240))
    paibing_card:appendComponent(flabel_defense_num)
    flabel_defense_num:setPositionInContainer(cc.p(661,196))
    table_paibing_card["flabel_defense_num"] = flabel_defense_num

    local add_2 = fc.FLabel:createBMFont()
    add_2:setSize(cc.size(70,30))
    add_2:setAnchorPoint(cc.p(0.5,0.5))
    add_2:setFontSize(21)
    add_2:setString("+100")
    add_2:setColor(cc.c3b(0,255,0))
    add_2:setAlignment(0)
    paibing_card:appendComponent(add_2)
    add_2:setPositionInContainer(cc.p(700,198))
    table_paibing_card["add_2"] = add_2

    local flabel_attack_num = fc.FLabel:createBMFont()
    flabel_attack_num:setSize(cc.size(70,30))
    flabel_attack_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_attack_num:setFontSize(21)
    flabel_attack_num:setString("")
    flabel_attack_num:setColor(cc.c3b(139,255,240))
    paibing_card:appendComponent(flabel_attack_num)
    flabel_attack_num:setPositionInContainer(cc.p(661,160))
    table_paibing_card["flabel_attack_num"] = flabel_attack_num

    local add_1 = fc.FLabel:createBMFont()
    add_1:setSize(cc.size(70,30))
    add_1:setAnchorPoint(cc.p(0.5,0.5))
    add_1:setFontSize(21)
    add_1:setString("+100")
    add_1:setColor(cc.c3b(0,255,0))
    add_1:setAlignment(0)
    paibing_card:appendComponent(add_1)
    add_1:setPositionInContainer(cc.p(699,163))
    table_paibing_card["add_1"] = add_1

    local paibing_card_panel = fc.FContainerPanel:create()
    paibing_card_panel:setSize(cc.size(406,429))
    paibing_card_panel:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card:appendComponent(paibing_card_panel)
    paibing_card_panel:setPositionInContainer(cc.p(266.5,215.5))
    table_paibing_card["paibing_card_panel"] = paibing_card_panel

    local card_diwen_panel = fc.FContainerPanel:create()
    card_diwen_panel:setSize(cc.size(266,365))
    card_diwen_panel:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(card_diwen_panel)
    card_diwen_panel:setPositionInContainer(cc.p(203,217.5))
    table_paibing_card["card_diwen_panel"] = card_diwen_panel

    local card_quality_diwen = fc.FScale9Image:createWithBatchUIFrame("batch_ui/diwen4_paibingbuzhen.png",cc.rect(1,1,1,1))
    card_quality_diwen:setSize(cc.size(266,365))
    card_quality_diwen:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(card_quality_diwen)
    card_quality_diwen:setPositionInContainer(cc.p(133,182.5))
    table_paibing_card["card_quality_diwen"] = card_quality_diwen

    local diwen_la = fc.FExtensionsImage:create()
    diwen_la:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_la:setSize(cc.size(50,50))
    diwen_la:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_la)
    diwen_la:setPositionInContainer(cc.p(25,25))
    table_paibing_card["diwen_la"] = diwen_la

    local diwen_lb = fc.FExtensionsImage:create()
    diwen_lb:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_lb:setSize(cc.size(50,50))
    diwen_lb:setFlipType(4)
    diwen_lb:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_lb)
    diwen_lb:setPositionInContainer(cc.p(25,340))
    table_paibing_card["diwen_lb"] = diwen_lb

    local diwen_ra = fc.FExtensionsImage:create()
    diwen_ra:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_ra:setSize(cc.size(50,50))
    diwen_ra:setFlipType(2)
    diwen_ra:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_ra)
    diwen_ra:setPositionInContainer(cc.p(241,25))
    table_paibing_card["diwen_ra"] = diwen_ra

    local diwen_rb = fc.FExtensionsImage:create()
    diwen_rb:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_rb:setSize(cc.size(50,50))
    diwen_rb:setFlipType(8)
    diwen_rb:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_rb)
    diwen_rb:setPositionInContainer(cc.p(241,340))
    table_paibing_card["diwen_rb"] = diwen_rb

    local shang_zuo = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    shang_zuo:setSize(cc.size(335,41))
    shang_zuo:setAnchorPoint(cc.p(0.5,0.5))
    shang_zuo:setScaleY(-1)
    paibing_card_panel:appendComponent(shang_zuo)
    shang_zuo:setPositionInContainer(cc.p(203.5,20.5))
    table_paibing_card["shang_zuo"] = shang_zuo

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(172,20.5))
    table_paibing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(204,20.5))
    table_paibing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(238,20.5))
    table_paibing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(270,20.5))
    table_paibing_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(138,20.5))
    table_paibing_card["star_dark"] = star_dark

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(20,19))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star1)
    star1:setPositionInContainer(cc.p(139,20.5))
    table_paibing_card["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(20,19))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star2)
    star2:setPositionInContainer(cc.p(172,20.5))
    table_paibing_card["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(20,19))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star3)
    star3:setPositionInContainer(cc.p(205,20.5))
    table_paibing_card["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(20,19))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star4)
    star4:setPositionInContainer(cc.p(238,20.5))
    table_paibing_card["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(20,19))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(star5)
    star5:setPositionInContainer(cc.p(271,20.5))
    table_paibing_card["star5"] = star5

    local card_gan = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang5_paibingbuzhen.png",cc.rect(6,24,2,2))
    card_gan:setSize(cc.size(7,360))
    card_gan:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(card_gan)
    card_gan:setPositionInContainer(cc.p(67.5,220))
    table_paibing_card["card_gan"] = card_gan

    local card_gan = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang5_paibingbuzhen.png",cc.rect(6,24,2,2))
    card_gan:setSize(cc.size(7,360))
    card_gan:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(card_gan)
    card_gan:setPositionInContainer(cc.p(337.5,220))
    table_paibing_card["card_gan"] = card_gan

    local card_image = fc.FExtensionsImage:create()
    card_image:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(card_image)
    card_image:setPositionInContainer(cc.p(203,236.5))
    table_paibing_card["card_image"] = card_image

    local di_zuo = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    di_zuo:setSize(cc.size(406,29))
    di_zuo:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_panel:appendComponent(di_zuo)
    di_zuo:setPositionInContainer(cc.p(203,414.5))
    table_paibing_card["di_zuo"] = di_zuo

    local flabel_paibing_zong_gongji_num = fc.FLabel:createBMFont()
    flabel_paibing_zong_gongji_num:setSize(cc.size(80,25))
    flabel_paibing_zong_gongji_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_paibing_zong_gongji_num:setFontSize(21)
    flabel_paibing_zong_gongji_num:setString("1000000")
    flabel_paibing_zong_gongji_num:setColor(cc.c3b(0,255,0))
    paibing_card_panel:appendComponent(flabel_paibing_zong_gongji_num)
    flabel_paibing_zong_gongji_num:setPositionInContainer(cc.p(166,412.5))
    table_paibing_card["flabel_paibing_zong_gongji_num"] = flabel_paibing_zong_gongji_num

    local flabel_paibing_zong_fangyu_num = fc.FLabel:createBMFont()
    flabel_paibing_zong_fangyu_num:setSize(cc.size(80,25))
    flabel_paibing_zong_fangyu_num:setAnchorPoint(cc.p(0.5,0.5))
    flabel_paibing_zong_fangyu_num:setFontSize(21)
    flabel_paibing_zong_fangyu_num:setString("1000000")
    flabel_paibing_zong_fangyu_num:setColor(cc.c3b(0,255,0))
    paibing_card_panel:appendComponent(flabel_paibing_zong_fangyu_num)
    flabel_paibing_zong_fangyu_num:setPositionInContainer(cc.p(318,412.5))
    table_paibing_card["flabel_paibing_zong_fangyu_num"] = flabel_paibing_zong_fangyu_num

    local zonggongji = fc.FLabel:createBMFont()
    zonggongji:setSize(cc.size(60,25))
    zonggongji:setAnchorPoint(cc.p(0.5,0.5))
    zonggongji:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	zonggongji:setString("總攻擊：")
    else
	    zonggongji:setString("总攻击：")
    end
    zonggongji:setColor(cc.c3b(139,255,240))
    paibing_card_panel:appendComponent(zonggongji)
    zonggongji:setPositionInContainer(cc.p(90,412.5))
    table_paibing_card["zonggongji"] = zonggongji

    local zongfangyu = fc.FLabel:createBMFont()
    zongfangyu:setSize(cc.size(60,25))
    zongfangyu:setAnchorPoint(cc.p(0.5,0.5))
    zongfangyu:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	zongfangyu:setString("總防禦：")
    else
    	zongfangyu:setString("总防御：")
    end
    zongfangyu:setColor(cc.c3b(139,255,240))
    zongfangyu:setAlignment(0)
    paibing_card_panel:appendComponent(zongfangyu)
    zongfangyu:setPositionInContainer(cc.p(236,412.5))
    table_paibing_card["zongfangyu"] = zongfangyu

    return table_paibing_card

end

