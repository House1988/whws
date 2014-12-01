function createmain_ui_right_bottom()

    local table_main_ui_right_bottom = {}

    local main_ui_right_bottom = fc.FContainerPanel:create()
    main_ui_right_bottom:setSize(cc.size(960,640))
    table_main_ui_right_bottom["main_ui_right_bottom"] = main_ui_right_bottom

    local right_bottom_bg_image = fc.FExtensionsImage:create()
    right_bottom_bg_image:setImage("batch_ui/huawenditu_shangcheng.png")
    right_bottom_bg_image:setSize(cc.size(217,48))
    right_bottom_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_right_bottom:appendComponent(right_bottom_bg_image)
    right_bottom_bg_image:setPositionInContainer(cc.p(851.5,616))
    table_main_ui_right_bottom["right_bottom_bg_image"] = right_bottom_bg_image

    local button_shangcheng = fc.FScaleButton:create()
    button_shangcheng:setSize(cc.size(102,102))
    button_shangcheng:setAnchorPoint(cc.p(0.5,0.5))
    button_shangcheng:setButtonImage("batch_ui/shangcheng_up.png")
    button_shangcheng:setIconImage("batch_ui/shangcheng2.png",cc.p(48,48))
    main_ui_right_bottom:appendComponent(button_shangcheng)
    button_shangcheng:setPositionInContainer(cc.p(901,579))
    table_main_ui_right_bottom["button_shangcheng"] = button_shangcheng

    local button_caidan = fc.FScaleButton:create()
    button_caidan:setSize(cc.size(96,96))
    button_caidan:setAnchorPoint(cc.p(0.5,0.5))
    button_caidan:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_caidan:setIconImage("batch_ui/candan_anniu.png",cc.p(44,52))
    main_ui_right_bottom:appendComponent(button_caidan)
    button_caidan:setPositionInContainer(cc.p(801,592))
    table_main_ui_right_bottom["button_caidan"] = button_caidan

    return table_main_ui_right_bottom

end

