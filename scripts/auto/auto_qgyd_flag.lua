function createqgyd_flag()

    local table_qgyd_flag = {}

    local qgyd_flag = fc.FContainerPanel:create()
    qgyd_flag:setSize(cc.size(215,393))
    table_qgyd_flag["qgyd_flag"] = qgyd_flag

    local diyi_flag_dizuo_image = fc.FExtensionsImage:create()
    diyi_flag_dizuo_image:setImage("batch_ui/qigan.png")
    diyi_flag_dizuo_image:setSize(cc.size(111,196))
    diyi_flag_dizuo_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_flag:appendComponent(diyi_flag_dizuo_image)
    diyi_flag_dizuo_image:setPositionInContainer(cc.p(107.5,282))
    table_qgyd_flag["diyi_flag_dizuo_image"] = diyi_flag_dizuo_image

    local diyi_flag_image = fc.FScaleButton:create()
    diyi_flag_image:setSize(cc.size(215,240))
    diyi_flag_image:setAnchorPoint(cc.p(0.5,0.5))
    diyi_flag_image:setButtonImage("nobatch/diyiming_qianguyidi.png")
    qgyd_flag:appendComponent(diyi_flag_image)
    diyi_flag_image:setPositionInContainer(cc.p(107.5,120))
    table_qgyd_flag["diyi_flag_image"] = diyi_flag_image

    return table_qgyd_flag

end

