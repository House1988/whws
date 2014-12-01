function creategenghuanzhenrong_bottom()

    local table_genghuanzhenrong_bottom = {}

    local genghuanzhenrong_bottom = fc.FContainerPanel:create()
    genghuanzhenrong_bottom:setSize(cc.size(960,640))
    table_genghuanzhenrong_bottom["genghuanzhenrong_bottom"] = genghuanzhenrong_bottom

    local bottom_infoditu_sacle9image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    bottom_infoditu_sacle9image:setSize(cc.size(563,66))
    bottom_infoditu_sacle9image:setAnchorPoint(cc.p(0.5,0.5))
    genghuanzhenrong_bottom:appendComponent(bottom_infoditu_sacle9image)
    bottom_infoditu_sacle9image:setPositionInContainer(cc.p(284.5,594))
    table_genghuanzhenrong_bottom["bottom_infoditu_sacle9image"] = bottom_infoditu_sacle9image

    local bottom_attack_label = fc.FLabel:createBMFont()
    bottom_attack_label:setSize(cc.size(80,30))
    bottom_attack_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_attack_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 bottom_attack_label:setString("總攻擊：")
    else
    	 bottom_attack_label:setString("总攻击：")
    end
    bottom_attack_label:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_bottom:appendComponent(bottom_attack_label)
    bottom_attack_label:setPositionInContainer(cc.p(64,595))
    table_genghuanzhenrong_bottom["bottom_attack_label"] = bottom_attack_label

    local bottom_zhenrong_label = fc.FLabel:createBMFont()
    bottom_zhenrong_label:setSize(cc.size(80,30))
    bottom_zhenrong_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_zhenrong_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	bottom_zhenrong_label:setString("陣容：")
    else
	    bottom_zhenrong_label:setString("阵容：")
    end
    bottom_zhenrong_label:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_bottom:appendComponent(bottom_zhenrong_label)
    bottom_zhenrong_label:setPositionInContainer(cc.p(412,595))
    table_genghuanzhenrong_bottom["bottom_zhenrong_label"] = bottom_zhenrong_label

    local bottom_xueliang_label = fc.FLabel:createBMFont()
    bottom_xueliang_label:setSize(cc.size(80,30))
    bottom_xueliang_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_xueliang_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
    	 bottom_xueliang_label:setString("總防禦：")
    else
    	bottom_xueliang_label:setString("总防御：")
    end
    
    bottom_xueliang_label:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_bottom:appendComponent(bottom_xueliang_label)
    bottom_xueliang_label:setPositionInContainer(cc.p(219,595))
    table_genghuanzhenrong_bottom["bottom_xueliang_label"] = bottom_xueliang_label

    local bottom_xueliang_num_label = fc.FLabel:createBMFont()
    bottom_xueliang_num_label:setSize(cc.size(80,30))
    bottom_xueliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_xueliang_num_label:setFontSize(21)
    bottom_xueliang_num_label:setString("999999")
    bottom_xueliang_num_label:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_bottom:appendComponent(bottom_xueliang_num_label)
    bottom_xueliang_num_label:setPositionInContainer(cc.p(294,595))
    table_genghuanzhenrong_bottom["bottom_xueliang_num_label"] = bottom_xueliang_num_label

    local bottom_attack_num_label = fc.FLabel:createBMFont()
    bottom_attack_num_label:setSize(cc.size(60,30))
    bottom_attack_num_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_attack_num_label:setFontSize(21)
    bottom_attack_num_label:setString("50")
    bottom_attack_num_label:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_bottom:appendComponent(bottom_attack_num_label)
    bottom_attack_num_label:setPositionInContainer(cc.p(124,595))
    table_genghuanzhenrong_bottom["bottom_attack_num_label"] = bottom_attack_num_label

    local bottom_zhenrong_num_label = fc.FLabel:createBMFont()
    bottom_zhenrong_num_label:setSize(cc.size(60,30))
    bottom_zhenrong_num_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_zhenrong_num_label:setFontSize(21)
    bottom_zhenrong_num_label:setString("5/5")
    bottom_zhenrong_num_label:setColor(cc.c3b(106,68,19))
    genghuanzhenrong_bottom:appendComponent(bottom_zhenrong_num_label)
    bottom_zhenrong_num_label:setPositionInContainer(cc.p(469,595))
    table_genghuanzhenrong_bottom["bottom_zhenrong_num_label"] = bottom_zhenrong_num_label

    local details_button = fc.FScaleButton:create()
    details_button:setSize(cc.size(144,53))
    details_button:setAnchorPoint(cc.p(0.5,0.5))
    details_button:setButtonImage("batch_ui/putonganniu1_up.png")
    genghuanzhenrong_bottom:appendComponent(details_button)
    details_button:setPositionInContainer(cc.p(680,594.5))
    table_genghuanzhenrong_bottom["details_button"] = details_button

    local ui_cha = fc.FExtensionsImage:create()
    ui_cha:setImage("batch_ui/cha_uizi.png")
    ui_cha:setSize(cc.size(32,32))
    ui_cha:setAnchorPoint(cc.p(0.5,0.5))
    details_button:appendComponent(ui_cha)
    ui_cha:setPositionInContainer(cc.p(32,27))
    table_genghuanzhenrong_bottom["ui_cha"] = ui_cha

    local ui_kan = fc.FExtensionsImage:create()
    ui_kan:setImage("batch_ui/kan_uizi.png")
    ui_kan:setSize(cc.size(32,32))
    ui_kan:setAnchorPoint(cc.p(0.5,0.5))
    details_button:appendComponent(ui_kan)
    ui_kan:setPositionInContainer(cc.p(58,27))
    table_genghuanzhenrong_bottom["ui_kan"] = ui_kan

    local ui_xiang = fc.FExtensionsImage:create()
    ui_xiang:setImage("batch_ui/xiang_uizi.png")
    ui_xiang:setSize(cc.size(32,32))
    ui_xiang:setAnchorPoint(cc.p(0.5,0.5))
    details_button:appendComponent(ui_xiang)
    ui_xiang:setPositionInContainer(cc.p(86,26))
    table_genghuanzhenrong_bottom["ui_xiang"] = ui_xiang

    local ui_qing = fc.FExtensionsImage:create()
    ui_qing:setImage("batch_ui/qing_uizi.png")
    ui_qing:setSize(cc.size(32,32))
    ui_qing:setAnchorPoint(cc.p(0.5,0.5))
    details_button:appendComponent(ui_qing)
    ui_qing:setPositionInContainer(cc.p(112,27))
    table_genghuanzhenrong_bottom["ui_qing"] = ui_qing

    local change_button = fc.FScaleButton:create()
    change_button:setSize(cc.size(144,53))
    change_button:setAnchorPoint(cc.p(0.5,0.5))
    change_button:setButtonImage("batch_ui/putonganniu1_up.png")
    genghuanzhenrong_bottom:appendComponent(change_button)
    change_button:setPositionInContainer(cc.p(863,594.5))
    table_genghuanzhenrong_bottom["change_button"] = change_button

    local ui_geng = fc.FExtensionsImage:create()
    ui_geng:setImage("batch_ui/geng_uizi.png")
    ui_geng:setSize(cc.size(32,32))
    ui_geng:setAnchorPoint(cc.p(0.5,0.5))
    change_button:appendComponent(ui_geng)
    ui_geng:setPositionInContainer(cc.p(42,26))
    table_genghuanzhenrong_bottom["ui_geng"] = ui_geng

    local ui_huan = fc.FExtensionsImage:create()
    ui_huan:setImage("batch_ui/huan_uizi.png")
    ui_huan:setSize(cc.size(32,32))
    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
    change_button:appendComponent(ui_huan)
    ui_huan:setPositionInContainer(cc.p(102,26))
    table_genghuanzhenrong_bottom["ui_huan"] = ui_huan

    return table_genghuanzhenrong_bottom

end

