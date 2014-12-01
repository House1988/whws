function createmain_ui_top_right()

    local table_main_ui_top_right = {}

    local main_ui_top_right = fc.FContainerPanel:create()
    main_ui_top_right:setSize(cc.size(960,640))
    table_main_ui_top_right["main_ui_top_right"] = main_ui_top_right

    local top_right_bg_image = fc.FExtensionsImage:create()
    top_right_bg_image:setImage("batch_ui/huawenditu_huodong.png")
    top_right_bg_image:setSize(cc.size(142,76))
    top_right_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_top_right:appendComponent(top_right_bg_image)
    top_right_bg_image:setPositionInContainer(cc.p(889,38))
    table_main_ui_top_right["top_right_bg_image"] = top_right_bg_image

    local button_huodong = fc.FScaleButton:create()
    button_huodong:setSize(cc.size(96,96))
    button_huodong:setAnchorPoint(cc.p(0.5,0.5))
    button_huodong:setButtonImage("batch_ui/gongnenganniu_up.png")
    main_ui_top_right:appendComponent(button_huodong)
    button_huodong:setPositionInContainer(cc.p(908,59))
    table_main_ui_top_right["button_huodong"] = button_huodong

    return table_main_ui_top_right

end

