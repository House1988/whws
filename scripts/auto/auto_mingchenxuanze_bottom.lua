function createmingchenxuanze_bottom()

    local table_mingchenxuanze_bottom = {}

    local mingchenxuanze_bottom = fc.FContainerPanel:create()
    mingchenxuanze_bottom:setSize(cc.size(960,640))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom"] = mingchenxuanze_bottom

    local mingchenxuanze_details_button = fc.FScaleButton:create()
    mingchenxuanze_details_button:setSize(cc.size(144,53))
    mingchenxuanze_details_button:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_details_button:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_details_button)
    mingchenxuanze_details_button:setPositionInContainer(cc.p(683,602.5))
    table_mingchenxuanze_bottom["mingchenxuanze_details_button"] = mingchenxuanze_details_button

    local ui_cha = fc.FExtensionsImage:create()
    ui_cha:setImage("batch_ui/cha_uizi.png")
    ui_cha:setSize(cc.size(32,32))
    ui_cha:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_details_button:appendComponent(ui_cha)
    ui_cha:setPositionInContainer(cc.p(28,26))
    table_mingchenxuanze_bottom["ui_cha"] = ui_cha

    local ui_kan = fc.FExtensionsImage:create()
    ui_kan:setImage("batch_ui/kan_uizi.png")
    ui_kan:setSize(cc.size(32,32))
    ui_kan:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_details_button:appendComponent(ui_kan)
    ui_kan:setPositionInContainer(cc.p(57,26))
    table_mingchenxuanze_bottom["ui_kan"] = ui_kan

    local ui_xiang = fc.FExtensionsImage:create()
    ui_xiang:setImage("batch_ui/xiang_uizi.png")
    ui_xiang:setSize(cc.size(32,32))
    ui_xiang:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_details_button:appendComponent(ui_xiang)
    ui_xiang:setPositionInContainer(cc.p(87,26))
    table_mingchenxuanze_bottom["ui_xiang"] = ui_xiang

    local ui_qing = fc.FExtensionsImage:create()
    ui_qing:setImage("batch_ui/qing_uizi.png")
    ui_qing:setSize(cc.size(32,32))
    ui_qing:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_details_button:appendComponent(ui_qing)
    ui_qing:setPositionInContainer(cc.p(116,26))
    table_mingchenxuanze_bottom["ui_qing"] = ui_qing

    local mingchenxuanze_change_button = fc.FScaleButton:create()
    mingchenxuanze_change_button:setSize(cc.size(144,53))
    mingchenxuanze_change_button:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_change_button:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_change_button)
    mingchenxuanze_change_button:setPositionInContainer(cc.p(848,602.5))
    table_mingchenxuanze_bottom["mingchenxuanze_change_button"] = mingchenxuanze_change_button

    local ui_geng = fc.FExtensionsImage:create()
    ui_geng:setImage("batch_ui/geng_uizi.png")
    ui_geng:setSize(cc.size(32,32))
    ui_geng:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_change_button:appendComponent(ui_geng)
    ui_geng:setPositionInContainer(cc.p(48,26))
    table_mingchenxuanze_bottom["ui_geng"] = ui_geng

    local ui_huan = fc.FExtensionsImage:create()
    ui_huan:setImage("batch_ui/huan_uizi.png")
    ui_huan:setSize(cc.size(32,32))
    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_change_button:appendComponent(ui_huan)
    ui_huan:setPositionInContainer(cc.p(96,26))
    table_mingchenxuanze_bottom["ui_huan"] = ui_huan

    local mingchenxuanze_bottom_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    mingchenxuanze_bottom_di:setSize(cc.size(563,66))
    mingchenxuanze_bottom_di:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_di)
    mingchenxuanze_bottom_di:setPositionInContainer(cc.p(281.5,600))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_di"] = mingchenxuanze_bottom_di

    local mingchenxuanze_bottom_attack_label = fc.FLabel:createBMFont()
    mingchenxuanze_bottom_attack_label:setSize(cc.size(80,30))
    mingchenxuanze_bottom_attack_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom_attack_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    mingchenxuanze_bottom_attack_label:setString("總攻擊：")
    else
	    mingchenxuanze_bottom_attack_label:setString("总攻击：")
    end
    mingchenxuanze_bottom_attack_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_attack_label)
    mingchenxuanze_bottom_attack_label:setPositionInContainer(cc.p(63,601))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_attack_label"] = mingchenxuanze_bottom_attack_label

    local mingchenxuanze_bottom_xueliang_label = fc.FLabel:createBMFont()
    mingchenxuanze_bottom_xueliang_label:setSize(cc.size(80,30))
    mingchenxuanze_bottom_xueliang_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom_xueliang_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	 mingchenxuanze_bottom_xueliang_label:setString("總防禦：")
     else
     	 mingchenxuanze_bottom_xueliang_label:setString("总防御：")
     end	
    mingchenxuanze_bottom_xueliang_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_xueliang_label)
    mingchenxuanze_bottom_xueliang_label:setPositionInContainer(cc.p(263,602))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_xueliang_label"] = mingchenxuanze_bottom_xueliang_label

    local mingchenxuanze_bottom_zhenrong_label = fc.FLabel:createBMFont()
    mingchenxuanze_bottom_zhenrong_label:setSize(cc.size(80,30))
    mingchenxuanze_bottom_zhenrong_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom_zhenrong_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 mingchenxuanze_bottom_zhenrong_label:setString("陣容：")
    else
    	 mingchenxuanze_bottom_zhenrong_label:setString("阵容：")
    end
    mingchenxuanze_bottom_zhenrong_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_zhenrong_label)
    mingchenxuanze_bottom_zhenrong_label:setPositionInContainer(cc.p(455,602))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_zhenrong_label"] = mingchenxuanze_bottom_zhenrong_label

    local mingchenxuanze_bottom_zhenrong_num_label = fc.FLabel:createBMFont()
    mingchenxuanze_bottom_zhenrong_num_label:setSize(cc.size(60,30))
    mingchenxuanze_bottom_zhenrong_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom_zhenrong_num_label:setFontSize(21)
    mingchenxuanze_bottom_zhenrong_num_label:setString("5/5")
    mingchenxuanze_bottom_zhenrong_num_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_zhenrong_num_label)
    mingchenxuanze_bottom_zhenrong_num_label:setPositionInContainer(cc.p(503,602))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_zhenrong_num_label"] = mingchenxuanze_bottom_zhenrong_num_label

    local mingchenxuanze_bottom_attack_num_label = fc.FLabel:createBMFont()
    mingchenxuanze_bottom_attack_num_label:setSize(cc.size(60,30))
    mingchenxuanze_bottom_attack_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom_attack_num_label:setFontSize(21)
    mingchenxuanze_bottom_attack_num_label:setString("50")
    mingchenxuanze_bottom_attack_num_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_attack_num_label)
    mingchenxuanze_bottom_attack_num_label:setPositionInContainer(cc.p(134,601))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_attack_num_label"] = mingchenxuanze_bottom_attack_num_label

    local mingchenxuanze_bottom_xueliang_num_label = fc.FLabel:createBMFont()
    mingchenxuanze_bottom_xueliang_num_label:setSize(cc.size(80,30))
    mingchenxuanze_bottom_xueliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_bottom_xueliang_num_label:setFontSize(21)
    mingchenxuanze_bottom_xueliang_num_label:setString("80")
    mingchenxuanze_bottom_xueliang_num_label:setColor(cc.c3b(106,68,19))
    mingchenxuanze_bottom:appendComponent(mingchenxuanze_bottom_xueliang_num_label)
    mingchenxuanze_bottom_xueliang_num_label:setPositionInContainer(cc.p(326,602))
    table_mingchenxuanze_bottom["mingchenxuanze_bottom_xueliang_num_label"] = mingchenxuanze_bottom_xueliang_num_label

    return table_mingchenxuanze_bottom

end

