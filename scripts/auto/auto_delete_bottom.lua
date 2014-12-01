function createdelete_bottom()

    local table_delete_bottom = {}

    local delete_bottom = fc.FContainerPanel:create()
    delete_bottom:setSize(cc.size(960,640))
    table_delete_bottom["delete_bottom"] = delete_bottom

    local gd_btm_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    gd_btm_bg_scale9:setSize(cc.size(735,80))
    gd_btm_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    delete_bottom:appendComponent(gd_btm_bg_scale9)
    gd_btm_bg_scale9:setPositionInContainer(cc.p(400.5,598))
    table_delete_bottom["gd_btm_bg_scale9"] = gd_btm_bg_scale9

    local gd_qiansan_button = fc.FScaleButton:create()
    gd_qiansan_button:setSize(cc.size(144,53))
    gd_qiansan_button:setAnchorPoint(cc.p(0.5,0.5))
    gd_qiansan_button:setButtonImage("batch_ui/putonganniu1_up.png")
    delete_bottom:appendComponent(gd_qiansan_button)
    gd_qiansan_button:setPositionInContainer(cc.p(881,590.5))
    table_delete_bottom["gd_qiansan_button"] = gd_qiansan_button

    local db_qian = fc.FShaderExtensionsImage:create(0)
    db_qian:setAnchorPoint(cc.p(0.5,0.5))
    db_qian:setImage("batch_ui/qian3_uizi.png")
    db_qian:setSize(cc.size(32,32))
    gd_qiansan_button:appendComponent(db_qian)
    db_qian:setPositionInContainer(cc.p(47,26))
    table_delete_bottom["db_qian"] = db_qian

    local db_san = fc.FShaderExtensionsImage:create(0)
    db_san:setAnchorPoint(cc.p(0.5,0.5))
    db_san:setImage("batch_ui/san_uizi.png")
    db_san:setSize(cc.size(32,32))
    gd_qiansan_button:appendComponent(db_san)
    db_san:setPositionInContainer(cc.p(95,26))
    table_delete_bottom["db_san"] = db_san

    local gd_quanxuan_checkbox = fc.FCheckBox:create()
    gd_quanxuan_checkbox:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    gd_quanxuan_checkbox:setSize(cc.size(47,47))
    gd_quanxuan_checkbox:setAnchorPoint(cc.p(0.5,0.5))
    delete_bottom:appendComponent(gd_quanxuan_checkbox)
    gd_quanxuan_checkbox:setPositionInContainer(cc.p(72.5,600.5))
    table_delete_bottom["gd_quanxuan_checkbox"] = gd_quanxuan_checkbox

    local bottom_label = fc.FLabel:createBMFont()
    bottom_label:setSize(cc.size(500,30))
    bottom_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_label:setFontSize(20)
    bottom_label:setString("张")
    bottom_label:setColor(cc.c3b(106,68,19))
    delete_bottom:appendComponent(bottom_label)
    bottom_label:setPositionInContainer(cc.p(455,597))
    table_delete_bottom["bottom_label"] = bottom_label

    local quan_xuan_label = fc.FContainerPanel:create()
    quan_xuan_label:setSize(cc.size(60,30))
    quan_xuan_label:setAnchorPoint(cc.p(0.5,0.5))
    delete_bottom:appendComponent(quan_xuan_label)
    quan_xuan_label:setPositionInContainer(cc.p(127,601))
    table_delete_bottom["quan_xuan_label"] = quan_xuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quan_xuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_delete_bottom["quan"] = quan

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    quan_xuan_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(44,16))
    table_delete_bottom["xuan"] = xuan

    return table_delete_bottom

end

