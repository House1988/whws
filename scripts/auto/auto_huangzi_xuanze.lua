function createhuangzi_xuanze()

    local table_huangzi_xuanze = {}

    local huangzi_xuanze = fc.FContainerPanel:create()
    huangzi_xuanze:setSize(cc.size(960,640))
    table_huangzi_xuanze["huangzi_xuanze"] = huangzi_xuanze

    local hz_xz_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    hz_xz_bg_image:setSize(cc.size(960,640))
    hz_xz_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(hz_xz_bg_image)
    hz_xz_bg_image:setPositionInContainer(cc.p(480,320))
    table_huangzi_xuanze["hz_xz_bg_image"] = hz_xz_bg_image

    local hz_xz_title_bg_image = fc.FExtensionsImage:create()
    hz_xz_title_bg_image:setImage("nobatch/title_mingchen_.png")
    hz_xz_title_bg_image:setSize(cc.size(483,67))
    hz_xz_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(hz_xz_title_bg_image)
    hz_xz_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_huangzi_xuanze["hz_xz_title_bg_image"] = hz_xz_title_bg_image

    local hz_xz_pre_page_button = fc.FScaleButton:create()
    hz_xz_pre_page_button:setSize(cc.size(38,60))
    hz_xz_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_xz_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    huangzi_xuanze:appendComponent(hz_xz_pre_page_button)
    hz_xz_pre_page_button:setPositionInContainer(cc.p(19,325))
    table_huangzi_xuanze["hz_xz_pre_page_button"] = hz_xz_pre_page_button

    local hz_xz_back_page_button = fc.FScaleButton:create()
    hz_xz_back_page_button:setSize(cc.size(38,60))
    hz_xz_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_xz_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    hz_xz_back_page_button:setScaleX(-1)
    huangzi_xuanze:appendComponent(hz_xz_back_page_button)
    hz_xz_back_page_button:setPositionInContainer(cc.p(936,325))
    table_huangzi_xuanze["hz_xz_back_page_button"] = hz_xz_back_page_button

    local hz_xz_title_bg_image2 = fc.FExtensionsImage:create()
    hz_xz_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    hz_xz_title_bg_image2:setSize(cc.size(483,67))
    hz_xz_title_bg_image2:setFlipType(2)
    hz_xz_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(hz_xz_title_bg_image2)
    hz_xz_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_huangzi_xuanze["hz_xz_title_bg_image2"] = hz_xz_title_bg_image2

    local hz_xz_title_image = fc.FExtensionsImage:create()
    hz_xz_title_image:setImage("nobatch/huangshangqingxuanzeyiweiagedujunzuozhanba.png")
    hz_xz_title_image:setSize(cc.size(536,36))
    hz_xz_title_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(hz_xz_title_image)
    hz_xz_title_image:setPositionInContainer(cc.p(480,34))
    table_huangzi_xuanze["hz_xz_title_image"] = hz_xz_title_image

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_huangzi_xuanze["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_huangzi_xuanze["wen_r"] = wen_r

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_huangzi_xuanze["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,557.5))
    table_huangzi_xuanze["wen_rb"] = wen_rb

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_huangzi_xuanze["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_huangzi_xuanze["lian_right"] = lian_right

    local hz_xz_close_button = fc.FScaleButton:create()
    hz_xz_close_button:setSize(cc.size(52,52))
    hz_xz_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_xz_close_button:setButtonImage("batch_ui/guanbi_up.png")
    huangzi_xuanze:appendComponent(hz_xz_close_button)
    hz_xz_close_button:setPositionInContainer(cc.p(931,33))
    table_huangzi_xuanze["hz_xz_close_button"] = hz_xz_close_button

    local hzxz_tishiditu_sacle9image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    hzxz_tishiditu_sacle9image:setSize(cc.size(563,66))
    hzxz_tishiditu_sacle9image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_xuanze:appendComponent(hzxz_tishiditu_sacle9image)
    hzxz_tishiditu_sacle9image:setPositionInContainer(cc.p(294.5,597))
    table_huangzi_xuanze["hzxz_tishiditu_sacle9image"] = hzxz_tishiditu_sacle9image

    local hz_xz_tishi_label = fc.FLabel:createBMFont()
    hz_xz_tishi_label:setSize(cc.size(466,30))
    hz_xz_tishi_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_xz_tishi_label:setFontSize(20)
    hz_xz_tishi_label:setString("皇上，5级以下的皇子太过年幼，不能上阵督军的哦")
    hz_xz_tishi_label:setColor(cc.c3b(106, 68, 19))
    huangzi_xuanze:appendComponent(hz_xz_tishi_label)
    hz_xz_tishi_label:setPositionInContainer(cc.p(279,598))
    table_huangzi_xuanze["hz_xz_tishi_label"] = hz_xz_tishi_label

    local hzxz_queding_button = fc.FScaleButton:create()
    hzxz_queding_button:setSize(cc.size(144,53))
    hzxz_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hzxz_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_xuanze:appendComponent(hzxz_queding_button)
    hzxz_queding_button:setPositionInContainer(cc.p(847,597.5))
    table_huangzi_xuanze["hzxz_queding_button"] = hzxz_queding_button

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    hzxz_queding_button:appendComponent(que)
    que:setPositionInContainer(cc.p(44,26))
    table_huangzi_xuanze["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    hzxz_queding_button:appendComponent(ding)
    ding:setPositionInContainer(cc.p(100,26))
    table_huangzi_xuanze["ding"] = ding

    local hz_xz_details_button = fc.FScaleButton:create()
    hz_xz_details_button:setSize(cc.size(144,53))
    hz_xz_details_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_xz_details_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_xuanze:appendComponent(hz_xz_details_button)
    hz_xz_details_button:setPositionInContainer(cc.p(677,597.5))
    table_huangzi_xuanze["hz_xz_details_button"] = hz_xz_details_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    hz_xz_details_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(32,26))
    table_huangzi_xuanze["cha"] = cha

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    hz_xz_details_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_huangzi_xuanze["kan"] = kan

    local xiang = fc.FShaderExtensionsImage:create(0)
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    hz_xz_details_button:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(83,26))
    table_huangzi_xuanze["xiang"] = xiang

    local qing = fc.FShaderExtensionsImage:create(0)
    qing:setAnchorPoint(cc.p(0.5,0.5))
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    hz_xz_details_button:appendComponent(qing)
    qing:setPositionInContainer(cc.p(108,26))
    table_huangzi_xuanze["qing"] = qing

    return table_huangzi_xuanze

end

