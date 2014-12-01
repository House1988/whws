function createzhandoujiemian_left_top()

    local table_zhandoujiemian_left_top = {}

    local zhandoujiemian_left_top = fc.FContainerPanel:create()
    zhandoujiemian_left_top:setSize(cc.size(960,640))
    table_zhandoujiemian_left_top["zhandoujiemian_left_top"] = zhandoujiemian_left_top

    local kezhi_image = fc.FExtensionsImage:create()
    kezhi_image:setImage("batch_ui/kezhi.png")
    kezhi_image:setSize(cc.size(189,186))
    kezhi_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_top:appendComponent(kezhi_image)
    kezhi_image:setPositionInContainer(cc.p(94.5,93))
    table_zhandoujiemian_left_top["kezhi_image"] = kezhi_image

    return table_zhandoujiemian_left_top

end

