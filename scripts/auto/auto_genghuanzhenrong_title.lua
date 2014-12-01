function creategenghuanzhenrong_title()

    local table_genghuanzhenrong_title = {}

    local genghuanzhenrong_title = fc.FContainerPanel:create()
    genghuanzhenrong_title:setSize(cc.size(960,640))
    table_genghuanzhenrong_title["genghuanzhenrong_title"] = genghuanzhenrong_title

    local genghuan_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    genghuan_bg_image:setSize(cc.size(960,640))
    genghuan_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(genghuan_bg_image)
    genghuan_bg_image:setPositionInContainer(cc.p(480,320))
    table_genghuanzhenrong_title["genghuan_bg_image"] = genghuan_bg_image

    local top_bg_image = fc.FExtensionsImage:create()
    top_bg_image:setImage("nobatch/title_mingchen_.png")
    top_bg_image:setSize(cc.size(483,67))
    top_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(top_bg_image)
    top_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_genghuanzhenrong_title["top_bg_image"] = top_bg_image

    local top_bg_image1 = fc.FExtensionsImage:create()
    top_bg_image1:setImage("nobatch/title_mingchen_.png")
    top_bg_image1:setSize(cc.size(483,67))
    top_bg_image1:setFlipType(2)
    top_bg_image1:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(top_bg_image1)
    top_bg_image1:setPositionInContainer(cc.p(718.5,33.5))
    table_genghuanzhenrong_title["top_bg_image1"] = top_bg_image1

    local huawen_left = fc.FExtensionsImage:create()
    huawen_left:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_left:setSize(cc.size(220,163))
    huawen_left:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(huawen_left)
    huawen_left:setPositionInContainer(cc.p(110,148.5))
    table_genghuanzhenrong_title["huawen_left"] = huawen_left

    local huawen_right = fc.FExtensionsImage:create()
    huawen_right:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_right:setSize(cc.size(220,163))
    huawen_right:setFlipType(2)
    huawen_right:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(huawen_right)
    huawen_right:setPositionInContainer(cc.p(848,149.5))
    table_genghuanzhenrong_title["huawen_right"] = huawen_right

    local huawen_leftbottom = fc.FExtensionsImage:create()
    huawen_leftbottom:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_leftbottom:setSize(cc.size(220,163))
    huawen_leftbottom:setFlipType(4)
    huawen_leftbottom:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(huawen_leftbottom)
    huawen_leftbottom:setPositionInContainer(cc.p(116,558.5))
    table_genghuanzhenrong_title["huawen_leftbottom"] = huawen_leftbottom

    local huawen_rightbottom = fc.FExtensionsImage:create()
    huawen_rightbottom:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_rightbottom:setSize(cc.size(220,163))
    huawen_rightbottom:setFlipType(8)
    huawen_rightbottom:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(huawen_rightbottom)
    huawen_rightbottom:setPositionInContainer(cc.p(850,558.5))
    table_genghuanzhenrong_title["huawen_rightbottom"] = huawen_rightbottom

    local gh_lian_left = fc.FExtensionsImage:create()
    gh_lian_left:setImage("batch_ui/title_mingchen_2.png")
    gh_lian_left:setSize(cc.size(62,121))
    gh_lian_left:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(gh_lian_left)
    gh_lian_left:setPositionInContainer(cc.p(31,60.5))
    table_genghuanzhenrong_title["gh_lian_left"] = gh_lian_left

    local gh_lian_right = fc.FExtensionsImage:create()
    gh_lian_right:setImage("batch_ui/title_mingchen_2.png")
    gh_lian_right:setSize(cc.size(62,121))
    gh_lian_right:setFlipType(2)
    gh_lian_right:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(gh_lian_right)
    gh_lian_right:setPositionInContainer(cc.p(929,60.5))
    table_genghuanzhenrong_title["gh_lian_right"] = gh_lian_right

    local top_close_image = fc.FScaleButton:create()
    top_close_image:setSize(cc.size(52,52))
    top_close_image:setAnchorPoint(cc.p(0.5,0.5))
    top_close_image:setButtonImage("batch_ui/guanbi_up.png")
    genghuanzhenrong_title:appendComponent(top_close_image)
    top_close_image:setPositionInContainer(cc.p(932,32))
    table_genghuanzhenrong_title["top_close_image"] = top_close_image

    local zhenrong1_button = fc.FRadioButton:create()
    zhenrong1_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    zhenrong1_button:setSize(cc.size(159,45))
    zhenrong1_button:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(zhenrong1_button)
    zhenrong1_button:setPositionInContainer(cc.p(395.5,38.5))
    table_genghuanzhenrong_title["zhenrong1_button"] = zhenrong1_button

    local ui_zhen = fc.FExtensionsImage:create()
    ui_zhen:setImage("batch_ui/zhen_uizi.png")
    ui_zhen:setSize(cc.size(32,32))
    ui_zhen:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(ui_zhen)
    ui_zhen:setPositionInContainer(cc.p(368,39))
    table_genghuanzhenrong_title["ui_zhen"] = ui_zhen

    local ui_rong = fc.FExtensionsImage:create()
    ui_rong:setImage("batch_ui/rong_uizi.png")
    ui_rong:setSize(cc.size(32,32))
    ui_rong:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(ui_rong)
    ui_rong:setPositionInContainer(cc.p(396,38))
    table_genghuanzhenrong_title["ui_rong"] = ui_rong

    local ui_yi = fc.FExtensionsImage:create()
    ui_yi:setImage("batch_ui/yi_uizi.png")
    ui_yi:setSize(cc.size(32,32))
    ui_yi:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(ui_yi)
    ui_yi:setPositionInContainer(cc.p(424,38))
    table_genghuanzhenrong_title["ui_yi"] = ui_yi

    local arr2_top_btn_panel = fc.FContainerPanel:create()
    arr2_top_btn_panel:setSize(cc.size(159,45))
    arr2_top_btn_panel:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(arr2_top_btn_panel)
    arr2_top_btn_panel:setPositionInContainer(cc.p(561.5,38.5))
    table_genghuanzhenrong_title["arr2_top_btn_panel"] = arr2_top_btn_panel

    local zhenrong2_button = fc.FRadioButton:create()
    zhenrong2_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    zhenrong2_button:setSize(cc.size(159,45))
    zhenrong2_button:setAnchorPoint(cc.p(0.5,0.5))
    arr2_top_btn_panel:appendComponent(zhenrong2_button)
    zhenrong2_button:setPositionInContainer(cc.p(79.5,22.5))
    table_genghuanzhenrong_title["zhenrong2_button"] = zhenrong2_button

    local ui_zhen = fc.FExtensionsImage:create()
    ui_zhen:setImage("batch_ui/zhen_uizi.png")
    ui_zhen:setSize(cc.size(32,32))
    ui_zhen:setAnchorPoint(cc.p(0.5,0.5))
    arr2_top_btn_panel:appendComponent(ui_zhen)
    ui_zhen:setPositionInContainer(cc.p(51,23))
    table_genghuanzhenrong_title["ui_zhen"] = ui_zhen

    local ui_rong = fc.FExtensionsImage:create()
    ui_rong:setImage("batch_ui/rong_uizi.png")
    ui_rong:setSize(cc.size(32,32))
    ui_rong:setAnchorPoint(cc.p(0.5,0.5))
    arr2_top_btn_panel:appendComponent(ui_rong)
    ui_rong:setPositionInContainer(cc.p(79,22))
    table_genghuanzhenrong_title["ui_rong"] = ui_rong

    local ui_er = fc.FExtensionsImage:create()
    ui_er:setImage("batch_ui/er_uizi.png")
    ui_er:setSize(cc.size(32,32))
    ui_er:setAnchorPoint(cc.p(0.5,0.5))
    arr2_top_btn_panel:appendComponent(ui_er)
    ui_er:setPositionInContainer(cc.p(108,22))
    table_genghuanzhenrong_title["ui_er"] = ui_er

    local top_already_use2_image = fc.FExtensionsImage:create()
    top_already_use2_image:setImage("batch_ui/shiyongzhong.png")
    top_already_use2_image:setSize(cc.size(73,44))
    top_already_use2_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(top_already_use2_image)
    top_already_use2_image:setPositionInContainer(cc.p(632.5,22))
    table_genghuanzhenrong_title["top_already_use2_image"] = top_already_use2_image

    local top_already_use1_image = fc.FExtensionsImage:create()
    top_already_use1_image:setImage("batch_ui/shiyongzhong.png")
    top_already_use1_image:setSize(cc.size(73,44))
    top_already_use1_image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_title:appendComponent(top_already_use1_image)
    top_already_use1_image:setPositionInContainer(cc.p(455.5,22))
    table_genghuanzhenrong_title["top_already_use1_image"] = top_already_use1_image

    return table_genghuanzhenrong_title

end

