function createzhandoujiemian_right_bottom()

    local table_zhandoujiemian_right_bottom = {}

    local zhandoujiemian_right_bottom = fc.FContainerPanel:create()
    zhandoujiemian_right_bottom:setSize(cc.size(960,640))
    table_zhandoujiemian_right_bottom["zhandoujiemian_right_bottom"] = zhandoujiemian_right_bottom

    local zhandou_right_bottom_skip_button = fc.FScaleButton:create()
    zhandou_right_bottom_skip_button:setSize(cc.size(144,53))
    zhandou_right_bottom_skip_button:setAnchorPoint(cc.p(0.5,0.5))
    zhandou_right_bottom_skip_button:setButtonImage("batch_ui/putonganniu1_up.png")
    zhandoujiemian_right_bottom:appendComponent(zhandou_right_bottom_skip_button)
    zhandou_right_bottom_skip_button:setPositionInContainer(cc.p(796,571.5))
    table_zhandoujiemian_right_bottom["zhandou_right_bottom_skip_button"] = zhandou_right_bottom_skip_button

    local zhandou_tiao = fc.FShaderExtensionsImage:create(0)
    zhandou_tiao:setAnchorPoint(cc.p(0.5,0.5))
    zhandou_tiao:setImage("batch_ui/tiao1_uizi.png")
    zhandou_tiao:setSize(cc.size(32,32))
    zhandou_right_bottom_skip_button:appendComponent(zhandou_tiao)
    zhandou_tiao:setPositionInContainer(cc.p(54,26))
    table_zhandoujiemian_right_bottom["zhandou_tiao"] = zhandou_tiao

    local zhandou_guo = fc.FShaderExtensionsImage:create(0)
    zhandou_guo:setAnchorPoint(cc.p(0.5,0.5))
    zhandou_guo:setImage("batch_ui/guo1_uizi.png")
    zhandou_guo:setSize(cc.size(32,32))
    zhandou_right_bottom_skip_button:appendComponent(zhandou_guo)
    zhandou_guo:setPositionInContainer(cc.p(90,26))
    table_zhandoujiemian_right_bottom["zhandou_guo"] = zhandou_guo

    return table_zhandoujiemian_right_bottom

end

