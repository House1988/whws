function createhougong_cefeng_card()

    local table_hougong_cefeng_card = {}

    local hougong_cefeng_card = fc.FContainerPanel:create()
    hougong_cefeng_card:setSize(cc.size(244,510))
    table_hougong_cefeng_card["hougong_cefeng_card"] = hougong_cefeng_card

    local hg_cf_card_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    hg_cf_card_bg:setSize(cc.size(208,420))
    hg_cf_card_bg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_card_bg)
    hg_cf_card_bg:setPositionInContainer(cc.p(122,226))
    table_hougong_cefeng_card["hg_cf_card_bg"] = hg_cf_card_bg

    local hg_cf_shanzi_image = fc.FExtensionsImage:create()
    hg_cf_shanzi_image:setImage("batch_ui/cheng_kunninggong.png")
    hg_cf_shanzi_image:setSize(cc.size(178,84))
    hg_cf_shanzi_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_shanzi_image)
    hg_cf_shanzi_image:setPositionInContainer(cc.p(122,78))
    table_hougong_cefeng_card["hg_cf_shanzi_image"] = hg_cf_shanzi_image

    local hg_cf_tiaojian_image = fc.FContainerPanel:create()
    hg_cf_tiaojian_image:setSize(cc.size(130,30))
    hg_cf_tiaojian_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_tiaojian_image)
    hg_cf_tiaojian_image:setPositionInContainer(cc.p(122,118))
    table_hougong_cefeng_card["hg_cf_tiaojian_image"] = hg_cf_tiaojian_image

    local hcc_ce = fc.FShaderExtensionsImage:create(0)
    hcc_ce:setAnchorPoint(cc.p(0.5,0.5))
    hcc_ce:setImage("batch_ui/ce_uizi.png")
    hcc_ce:setSize(cc.size(32,32))
    hg_cf_tiaojian_image:appendComponent(hcc_ce)
    hcc_ce:setPositionInContainer(cc.p(16,16))
    table_hougong_cefeng_card["hcc_ce"] = hcc_ce

    local hcc_feng = fc.FShaderExtensionsImage:create(0)
    hcc_feng:setAnchorPoint(cc.p(0.5,0.5))
    hcc_feng:setImage("batch_ui/feng1_uizi.png")
    hcc_feng:setSize(cc.size(32,32))
    hg_cf_tiaojian_image:appendComponent(hcc_feng)
    hcc_feng:setPositionInContainer(cc.p(49,16))
    table_hougong_cefeng_card["hcc_feng"] = hcc_feng

    local tiao = fc.FExtensionsImage:create()
    tiao:setImage("batch_ui/tiao2_uizi.png")
    tiao:setSize(cc.size(32,32))
    tiao:setAnchorPoint(cc.p(0.5,0.5))
    hg_cf_tiaojian_image:appendComponent(tiao)
    tiao:setPositionInContainer(cc.p(81,16))
    table_hougong_cefeng_card["tiao"] = tiao

    local jian = fc.FExtensionsImage:create()
    jian:setImage("batch_ui/jian2_uizi.png")
    jian:setSize(cc.size(32,32))
    jian:setAnchorPoint(cc.p(0.5,0.5))
    hg_cf_tiaojian_image:appendComponent(jian)
    jian:setPositionInContainer(cc.p(114,16))
    table_hougong_cefeng_card["jian"] = jian

    local hg_cf_yinliang_label = fc.FExtensionsImage:create()
    hg_cf_yinliang_label:setImage("batch_ui/yinliang_cefeng.png")
    hg_cf_yinliang_label:setSize(cc.size(73,66))
    hg_cf_yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_yinliang_label)
    hg_cf_yinliang_label:setPositionInContainer(cc.p(69.5,320))
    table_hougong_cefeng_card["hg_cf_yinliang_label"] = hg_cf_yinliang_label

    local hg_cf_yinliang_num_label = fc.FLabel:createBMFont()
    hg_cf_yinliang_num_label:setSize(cc.size(70,30))
    hg_cf_yinliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_cf_yinliang_num_label:setFontSize(21)
    hg_cf_yinliang_num_label:setString("9999")
    hg_cf_yinliang_num_label:setColor(cc.c3b(137, 32, 18))
    hougong_cefeng_card:appendComponent(hg_cf_yinliang_num_label)
    hg_cf_yinliang_num_label:setPositionInContainer(cc.p(157,326))
    table_hougong_cefeng_card["hg_cf_yinliang_num_label"] = hg_cf_yinliang_num_label

    local hg_cf_qinmidu_label = fc.FExtensionsImage:create()
    hg_cf_qinmidu_label:setImage("batch_ui/qinmidu_cefeng.png")
    hg_cf_qinmidu_label:setSize(cc.size(73,66))
    hg_cf_qinmidu_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_qinmidu_label)
    hg_cf_qinmidu_label:setPositionInContainer(cc.p(69.5,396))
    table_hougong_cefeng_card["hg_cf_qinmidu_label"] = hg_cf_qinmidu_label

    local hg_cf_card_tiaojian_image = fc.FExtensionsImage:create()
    hg_cf_card_tiaojian_image:setImage("batch_ui/tiaojianbuzu_cefeng.png")
    hg_cf_card_tiaojian_image:setSize(cc.size(119,56))
    hg_cf_card_tiaojian_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_card_tiaojian_image)
    hg_cf_card_tiaojian_image:setPositionInContainer(cc.p(159.5,268))
    table_hougong_cefeng_card["hg_cf_card_tiaojian_image"] = hg_cf_card_tiaojian_image

    local hg_cf_card_renyuan_image = fc.FExtensionsImage:create()
    hg_cf_card_renyuan_image:setImage("batch_ui/renyuanyiman_cefeng.png")
    hg_cf_card_renyuan_image:setSize(cc.size(119,56))
    hg_cf_card_renyuan_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_card_renyuan_image)
    hg_cf_card_renyuan_image:setPositionInContainer(cc.p(89.5,212))
    table_hougong_cefeng_card["hg_cf_card_renyuan_image"] = hg_cf_card_renyuan_image

    local hg_cf_card_dangqian_image = fc.FExtensionsImage:create()
    hg_cf_card_dangqian_image:setImage("batch_ui/dangqianfeiwei_cefeng.png")
    hg_cf_card_dangqian_image:setSize(cc.size(119,56))
    hg_cf_card_dangqian_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_cf_card_dangqian_image)
    hg_cf_card_dangqian_image:setPositionInContainer(cc.p(121.5,242))
    table_hougong_cefeng_card["hg_cf_card_dangqian_image"] = hg_cf_card_dangqian_image

    local hg_cf_qinmidu_num_label = fc.FLabel:createBMFont()
    hg_cf_qinmidu_num_label:setSize(cc.size(70,30))
    hg_cf_qinmidu_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_cf_qinmidu_num_label:setFontSize(21)
    hg_cf_qinmidu_num_label:setString("9999")
    hg_cf_qinmidu_num_label:setColor(cc.c3b(137, 32, 18))
    hougong_cefeng_card:appendComponent(hg_cf_qinmidu_num_label)
    hg_cf_qinmidu_num_label:setPositionInContainer(cc.p(157,396))
    table_hougong_cefeng_card["hg_cf_qinmidu_num_label"] = hg_cf_qinmidu_num_label

    local zi1 = fc.FExtensionsImage:create()
    zi1:setImage("batch_ui/jian2_uizi.png")
    zi1:setSize(cc.size(32,32))
    zi1:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(zi1)
    zi1:setPositionInContainer(cc.p(90,65))
    table_hougong_cefeng_card["zi1"] = zi1

    local zi2 = fc.FExtensionsImage:create()
    zi2:setImage("batch_ui/jian2_uizi.png")
    zi2:setSize(cc.size(32,32))
    zi2:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(zi2)
    zi2:setPositionInContainer(cc.p(122,65))
    table_hougong_cefeng_card["zi2"] = zi2

    local zi3 = fc.FExtensionsImage:create()
    zi3:setImage("batch_ui/jian2_uizi.png")
    zi3:setSize(cc.size(32,32))
    zi3:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(zi3)
    zi3:setPositionInContainer(cc.p(154,65))
    table_hougong_cefeng_card["zi3"] = zi3

    local zi4 = fc.FExtensionsImage:create()
    zi4:setImage("batch_ui/jian2_uizi.png")
    zi4:setSize(cc.size(32,32))
    zi4:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(zi4)
    zi4:setPositionInContainer(cc.p(106,65))
    table_hougong_cefeng_card["zi4"] = zi4

    local zi5 = fc.FExtensionsImage:create()
    zi5:setImage("batch_ui/jian2_uizi.png")
    zi5:setSize(cc.size(32,32))
    zi5:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(zi5)
    zi5:setPositionInContainer(cc.p(138,65))
    table_hougong_cefeng_card["zi5"] = zi5

    local hg_card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/touxiangdikuang_meinv2.png",cc.rect(53,54,5,2))
    hg_card_rect:setSize(cc.size(218,430))
    hg_card_rect:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(hg_card_rect)
    hg_card_rect:setPositionInContainer(cc.p(122,226))
    table_hougong_cefeng_card["hg_card_rect"] = hg_card_rect

    local hg_cf_cefeng_button = fc.FScaleButton:create()
    hg_cf_cefeng_button:setSize(cc.size(144,53))
    hg_cf_cefeng_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_cf_cefeng_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hougong_cefeng_card:appendComponent(hg_cf_cefeng_button)
    hg_cf_cefeng_button:setPositionInContainer(cc.p(122,483.5))
    table_hougong_cefeng_card["hg_cf_cefeng_button"] = hg_cf_cefeng_button

    local hcc_ce = fc.FShaderExtensionsImage:create(0)
    hcc_ce:setAnchorPoint(cc.p(0.5,0.5))
    hcc_ce:setImage("batch_ui/ce_uizi.png")
    hcc_ce:setSize(cc.size(32,32))
    hg_cf_cefeng_button:appendComponent(hcc_ce)
    hcc_ce:setPositionInContainer(cc.p(54,26))
    table_hougong_cefeng_card["hcc_ce"] = hcc_ce

    local hcc_feng = fc.FShaderExtensionsImage:create(0)
    hcc_feng:setAnchorPoint(cc.p(0.5,0.5))
    hcc_feng:setImage("batch_ui/feng1_uizi.png")
    hcc_feng:setSize(cc.size(32,32))
    hg_cf_cefeng_button:appendComponent(hcc_feng)
    hcc_feng:setPositionInContainer(cc.p(90,26))
    table_hougong_cefeng_card["hcc_feng"] = hcc_feng

    local effect_label = fc.FLabel:createBMFont()
    effect_label:setSize(cc.size(100,30))
    effect_label:setAnchorPoint(cc.p(0.5,0.5))
    effect_label:setFontSize(20)
    effect_label:setString("技能效果提升")
    effect_label:setColor(cc.c3b(91, 24, 6))
    hougong_cefeng_card:appendComponent(effect_label)
    effect_label:setPositionInContainer(cc.p(86,156))
    table_hougong_cefeng_card["effect_label"] = effect_label

    local textbg = fc.FExtensionsImage:create()
    textbg:setImage("batch_ui/shuruwenzi.png")
    textbg:setSize(cc.size(70,25))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_card:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(182,159.5))
    table_hougong_cefeng_card["textbg"] = textbg

    local effect_num = fc.FLabel:createBMFont()
    effect_num:setSize(cc.size(50,30))
    effect_num:setAnchorPoint(cc.p(0.5,0.5))
    effect_num:setFontSize(20)
    effect_num:setString("技能效果提升")
    effect_num:setColor(cc.c3b(139, 255, 240))
    hougong_cefeng_card:appendComponent(effect_num)
    effect_num:setPositionInContainer(cc.p(182,156))
    table_hougong_cefeng_card["effect_num"] = effect_num

    return table_hougong_cefeng_card

end

