function createlianhuaSelectPanel()

    local table_lianhuaSelectPanel = {}

    local lianhuaSelectPanel = fc.FContainerPanel:create()
    lianhuaSelectPanel:setSize(cc.size(960,640))
    table_lianhuaSelectPanel["lianhuaSelectPanel"] = lianhuaSelectPanel

    local jjc_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    jjc_bg_image:setSize(cc.size(960,640))
    jjc_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(jjc_bg_image)
    jjc_bg_image:setPositionInContainer(cc.p(480,320))
    table_lianhuaSelectPanel["jjc_bg_image"] = jjc_bg_image

    local jjc_title_bg_image = fc.FExtensionsImage:create()
    jjc_title_bg_image:setImage("nobatch/title_mingchen_.png")
    jjc_title_bg_image:setSize(cc.size(483,67))
    jjc_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(jjc_title_bg_image)
    jjc_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_lianhuaSelectPanel["jjc_title_bg_image"] = jjc_title_bg_image

    local jjc_title_bg_image2 = fc.FExtensionsImage:create()
    jjc_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    jjc_title_bg_image2:setSize(cc.size(483,67))
    jjc_title_bg_image2:setFlipType(2)
    jjc_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(jjc_title_bg_image2)
    jjc_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_lianhuaSelectPanel["jjc_title_bg_image2"] = jjc_title_bg_image2

    local wen_left = fc.FExtensionsImage:create()
    wen_left:setImage("nobatch/banzidikuang_tongyong.png")
    wen_left:setSize(cc.size(220,163))
    wen_left:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(wen_left)
    wen_left:setPositionInContainer(cc.p(110,148.5))
    table_lianhuaSelectPanel["wen_left"] = wen_left

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_lianhuaSelectPanel["lian_left"] = lian_left

    local wen_right = fc.FExtensionsImage:create()
    wen_right:setImage("nobatch/banzidikuang_tongyong.png")
    wen_right:setSize(cc.size(220,163))
    wen_right:setFlipType(2)
    wen_right:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(wen_right)
    wen_right:setPositionInContainer(cc.p(850,148.5))
    table_lianhuaSelectPanel["wen_right"] = wen_right

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,63.5))
    table_lianhuaSelectPanel["lian_right"] = lian_right

    local jjc_close_button = fc.FScaleButton:create()
    jjc_close_button:setSize(cc.size(52,52))
    jjc_close_button:setAnchorPoint(cc.p(0.5,0.5))
    jjc_close_button:setButtonImage("batch_ui/guanbi_up.png")
    lianhuaSelectPanel:appendComponent(jjc_close_button)
    jjc_close_button:setPositionInContainer(cc.p(929,37))
    table_lianhuaSelectPanel["jjc_close_button"] = jjc_close_button

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_lianhuaSelectPanel["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,557.5))
    table_lianhuaSelectPanel["wen_rb"] = wen_rb

    local gd_btm_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    gd_btm_bg_scale9:setSize(cc.size(735,80))
    gd_btm_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(gd_btm_bg_scale9)
    gd_btm_bg_scale9:setPositionInContainer(cc.p(400.5,598))
    table_lianhuaSelectPanel["gd_btm_bg_scale9"] = gd_btm_bg_scale9

    local gd_shengji_button = fc.FScaleButton:create()
    gd_shengji_button:setSize(cc.size(144,53))
    gd_shengji_button:setAnchorPoint(cc.p(0.5,0.5))
    gd_shengji_button:setButtonImage("batch_ui/putonganniu1_up.png")
    lianhuaSelectPanel:appendComponent(gd_shengji_button)
    gd_shengji_button:setPositionInContainer(cc.p(868,591.5))
    table_lianhuaSelectPanel["gd_shengji_button"] = gd_shengji_button

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    gd_shengji_button:appendComponent(que)
    que:setPositionInContainer(cc.p(46,26))
    table_lianhuaSelectPanel["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    gd_shengji_button:appendComponent(ding)
    ding:setPositionInContainer(cc.p(97,26))
    table_lianhuaSelectPanel["ding"] = ding

    local gd_quanxuan_checkbox = fc.FCheckBox:create()
    gd_quanxuan_checkbox:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    gd_quanxuan_checkbox:setSize(cc.size(47,47))
    gd_quanxuan_checkbox:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(gd_quanxuan_checkbox)
    gd_quanxuan_checkbox:setPositionInContainer(cc.p(72.5,600.5))
    table_lianhuaSelectPanel["gd_quanxuan_checkbox"] = gd_quanxuan_checkbox

    local quanxuan_label = fc.FContainerPanel:create()
    quanxuan_label:setSize(cc.size(60,30))
    quanxuan_label:setAnchorPoint(cc.p(0.5,0.5))
    lianhuaSelectPanel:appendComponent(quanxuan_label)
    quanxuan_label:setPositionInContainer(cc.p(126,601))
    table_lianhuaSelectPanel["quanxuan_label"] = quanxuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_lianhuaSelectPanel["quan"] = quan

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(44,16))
    table_lianhuaSelectPanel["xuan"] = xuan

    local bottomlabel = fc.FLabel:createBMFont()
    bottomlabel:setSize(cc.size(200,30))
    bottomlabel:setAnchorPoint(cc.p(0.5,0.5))
    bottomlabel:setFontSize(18)
    bottomlabel:setString("")
    bottomlabel:setColor(cc.c3b(91,24,6))
    lianhuaSelectPanel:appendComponent(bottomlabel)
    bottomlabel:setPositionInContainer(cc.p(400,595))
    table_lianhuaSelectPanel["bottomlabel"] = bottomlabel

    return table_lianhuaSelectPanel

end

