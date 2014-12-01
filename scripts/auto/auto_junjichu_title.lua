function createjunjichu_title()

    local table_junjichu_title = {}

    local junjichu_title = fc.FContainerPanel:create()
    junjichu_title:setSize(cc.size(960,640))
    table_junjichu_title["junjichu_title"] = junjichu_title

    local jjc_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    jjc_bg_image:setSize(cc.size(960,640))
    jjc_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(jjc_bg_image)
    jjc_bg_image:setPositionInContainer(cc.p(480,320))
    table_junjichu_title["jjc_bg_image"] = jjc_bg_image

    local jjc_title_bg_image = fc.FExtensionsImage:create()
    jjc_title_bg_image:setImage("nobatch/title_mingchen_.png")
    jjc_title_bg_image:setSize(cc.size(483,67))
    jjc_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(jjc_title_bg_image)
    jjc_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_junjichu_title["jjc_title_bg_image"] = jjc_title_bg_image

    local jjc_pre_page_button = fc.FScaleButton:create()
    jjc_pre_page_button:setSize(cc.size(38,60))
    jjc_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    junjichu_title:appendComponent(jjc_pre_page_button)
    jjc_pre_page_button:setPositionInContainer(cc.p(19,325))
    table_junjichu_title["jjc_pre_page_button"] = jjc_pre_page_button

    local jjc_back_page_button = fc.FScaleButton:create()
    jjc_back_page_button:setSize(cc.size(38,60))
    jjc_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    jjc_back_page_button:setScaleX(-1)
    junjichu_title:appendComponent(jjc_back_page_button)
    jjc_back_page_button:setPositionInContainer(cc.p(936,325))
    table_junjichu_title["jjc_back_page_button"] = jjc_back_page_button

    local jjc_title_bg_image2 = fc.FExtensionsImage:create()
    jjc_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    jjc_title_bg_image2:setSize(cc.size(483,67))
    jjc_title_bg_image2:setFlipType(2)
    jjc_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(jjc_title_bg_image2)
    jjc_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_junjichu_title["jjc_title_bg_image2"] = jjc_title_bg_image2

    local wen_left = fc.FExtensionsImage:create()
    wen_left:setImage("nobatch/banzidikuang_tongyong.png")
    wen_left:setSize(cc.size(220,163))
    wen_left:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(wen_left)
    wen_left:setPositionInContainer(cc.p(110,148.5))
    table_junjichu_title["wen_left"] = wen_left

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_junjichu_title["lian_left"] = lian_left

    local wen_right = fc.FExtensionsImage:create()
    wen_right:setImage("nobatch/banzidikuang_tongyong.png")
    wen_right:setSize(cc.size(220,163))
    wen_right:setFlipType(2)
    wen_right:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(wen_right)
    wen_right:setPositionInContainer(cc.p(850,148.5))
    table_junjichu_title["wen_right"] = wen_right

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,63.5))
    table_junjichu_title["lian_right"] = lian_right

    local jjc_close_button = fc.FScaleButton:create()
    jjc_close_button:setSize(cc.size(52,52))
    jjc_close_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_close_button:setButtonImage("batch_ui/guanbi_up.png")
    junjichu_title:appendComponent(jjc_close_button)
    jjc_close_button:setPositionInContainer(cc.p(929,37))
    table_junjichu_title["jjc_close_button"] = jjc_close_button

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_junjichu_title["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,557.5))
    table_junjichu_title["wen_rb"] = wen_rb

    local jjc_details_button = fc.FScaleButton:create()
    jjc_details_button:setSize(cc.size(144,53))
    jjc_details_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_details_button:setButtonImage("batch_ui/putonganniu1_up.png")
    junjichu_title:appendComponent(jjc_details_button)
    jjc_details_button:setPositionInContainer(cc.p(656,591.5))
    table_junjichu_title["jjc_details_button"] = jjc_details_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    jjc_details_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(31,26))
    table_junjichu_title["cha"] = cha

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    jjc_details_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_junjichu_title["kan"] = kan

    local xiang = fc.FShaderExtensionsImage:create(0)
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    jjc_details_button:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(83,26))
    table_junjichu_title["xiang"] = xiang

    local qing = fc.FShaderExtensionsImage:create(0)
    qing:setAnchorPoint(cc.p(0.5,0.5))
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    jjc_details_button:appendComponent(qing)
    qing:setPositionInContainer(cc.p(109,26))
    table_junjichu_title["qing"] = qing

    local jjc_shengji_button = fc.FScaleButton:create()
    jjc_shengji_button:setSize(cc.size(144,53))
    jjc_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    junjichu_title:appendComponent(jjc_shengji_button)
    jjc_shengji_button:setPositionInContainer(cc.p(842,591.5))
    table_junjichu_title["jjc_shengji_button"] = jjc_shengji_button

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    jjc_shengji_button:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(44,26))
    table_junjichu_title["sheng"] = sheng

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    jjc_shengji_button:appendComponent(ji)
    ji:setPositionInContainer(cc.p(99,26))
    table_junjichu_title["ji"] = ji

    local jjc_delete_button = fc.FScaleButton:create()
    jjc_delete_button:setSize(cc.size(144,53))
    jjc_delete_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_delete_button:setButtonImage("batch_ui/putonganniu1_up.png")
    junjichu_title:appendComponent(jjc_delete_button)
    jjc_delete_button:setPositionInContainer(cc.p(117,591.5))
    table_junjichu_title["jjc_delete_button"] = jjc_delete_button

    local qian = fc.FShaderExtensionsImage:create(0)
    qian:setAnchorPoint(cc.p(0.5,0.5))
    qian:setImage("batch_ui/qian3_uizi.png")
    qian:setSize(cc.size(32,32))
    jjc_delete_button:appendComponent(qian)
    qian:setPositionInContainer(cc.p(42,26))
    table_junjichu_title["qian"] = qian

    local san = fc.FShaderExtensionsImage:create(0)
    san:setAnchorPoint(cc.p(0.5,0.5))
    san:setImage("batch_ui/san_uizi.png")
    san:setSize(cc.size(32,32))
    jjc_delete_button:appendComponent(san)
    san:setPositionInContainer(cc.p(100,26))
    table_junjichu_title["san"] = san

    local pageBtn1 = fc.FRadioButton:create()
    pageBtn1:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    pageBtn1:setSize(cc.size(159,45))
    pageBtn1:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(pageBtn1)
    pageBtn1:setPositionInContainer(cc.p(382.5,32.5))
    table_junjichu_title["pageBtn1"] = pageBtn1

    local pageBtn2 = fc.FRadioButton:create()
    pageBtn2:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    pageBtn2:setSize(cc.size(159,45))
    pageBtn2:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(pageBtn2)
    pageBtn2:setPositionInContainer(cc.p(572.5,32.5))
    table_junjichu_title["pageBtn2"] = pageBtn2

    local hunpo_label = fc.FContainerPanel:create()
    hunpo_label:setSize(cc.size(80,30))
    hunpo_label:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(hunpo_label)
    hunpo_label:setPositionInContainer(cc.p(572,32))
    table_junjichu_title["hunpo_label"] = hunpo_label

    local hun = fc.FExtensionsImage:create()
    hun:setImage("batch_ui/hun_uizi.png")
    hun:setSize(cc.size(32,32))
    hun:setAnchorPoint(cc.p(0.5,0.5))
    hunpo_label:appendComponent(hun)
    hun:setPositionInContainer(cc.p(16,16))
    table_junjichu_title["hun"] = hun

    local po = fc.FExtensionsImage:create()
    po:setImage("batch_ui/po_uizi.png")
    po:setSize(cc.size(32,32))
    po:setAnchorPoint(cc.p(0.5,0.5))
    hunpo_label:appendComponent(po)
    po:setPositionInContainer(cc.p(64,16))
    table_junjichu_title["po"] = po

    local kapai_label = fc.FContainerPanel:create()
    kapai_label:setSize(cc.size(80,30))
    kapai_label:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(kapai_label)
    kapai_label:setPositionInContainer(cc.p(382,32))
    table_junjichu_title["kapai_label"] = kapai_label

    local ka = fc.FExtensionsImage:create()
    ka:setImage("batch_ui/ka_uizi.png")
    ka:setSize(cc.size(32,32))
    ka:setAnchorPoint(cc.p(0.5,0.5))
    kapai_label:appendComponent(ka)
    ka:setPositionInContainer(cc.p(16,16))
    table_junjichu_title["ka"] = ka

    local pai = fc.FExtensionsImage:create()
    pai:setImage("batch_ui/pai1_uizi.png")
    pai:setSize(cc.size(32,32))
    pai:setAnchorPoint(cc.p(0.5,0.5))
    kapai_label:appendComponent(pai)
    pai:setPositionInContainer(cc.p(64,16))
    table_junjichu_title["pai"] = pai

    local ciguan_button = fc.FScaleButton:create()
    ciguan_button:setSize(cc.size(144,53))
    ciguan_button:setAnchorPoint(cc.p(0.5,0.5))
    ciguan_button:setButtonImage("batch_ui/putonganniu1_up.png")
    junjichu_title:appendComponent(ciguan_button)
    ciguan_button:setPositionInContainer(cc.p(296,591.5))
    table_junjichu_title["ciguan_button"] = ciguan_button

    local ci = fc.FShaderExtensionsImage:create(0)
    ci:setAnchorPoint(cc.p(0.5,0.5))
    ci:setImage("batch_ui/ci_uizi.png")
    ci:setSize(cc.size(32,32))
    ciguan_button:appendComponent(ci)
    ci:setPositionInContainer(cc.p(44,26))
    table_junjichu_title["ci"] = ci

    local guan = fc.FShaderExtensionsImage:create(0)
    guan:setAnchorPoint(cc.p(0.5,0.5))
    guan:setImage("batch_ui/guan1_uizi.png")
    guan:setSize(cc.size(32,32))
    ciguan_button:appendComponent(guan)
    guan:setPositionInContainer(cc.p(97,26))
    table_junjichu_title["guan"] = guan

    local pagebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pagebg:setSize(cc.size(100,30))
    pagebg:setAnchorPoint(cc.p(0.5,0.5))
    junjichu_title:appendComponent(pagebg)
    pagebg:setPositionInContainer(cc.p(480,592))
    table_junjichu_title["pagebg"] = pagebg

    local pageText = fc.FLabel:createSystemFont()
    pageText:setSize(cc.size(100,25))
    pageText:setAnchorPoint(cc.p(0.5,0.5))
    pageText:setFontSize(20)
    pageText:setString("")
    pageText:setColor(cc.c3b(255, 255, 255))
    junjichu_title:appendComponent(pageText)
    pageText:setPositionInContainer(cc.p(480,587.5))
    table_junjichu_title["pageText"] = pageText

    return table_junjichu_title

end

