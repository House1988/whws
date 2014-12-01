function createzhanyi_ditu_bg()

    local table_zhanyi_ditu_bg = {}

    local zhanyi_ditu_bg = fc.FContainerPanel:create()
    zhanyi_ditu_bg:setSize(cc.size(960,640))
    table_zhanyi_ditu_bg["zhanyi_ditu_bg"] = zhanyi_ditu_bg

    local zy_dt_bg_image = fc.FExtensionsImage:create()
    zy_dt_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_ditu_bg:appendComponent(zy_dt_bg_image)
    zy_dt_bg_image:setPositionInContainer(cc.p(480,320))
    table_zhanyi_ditu_bg["zy_dt_bg_image"] = zy_dt_bg_image

    local zy_close_top_button = fc.FScaleButton:create()
    zy_close_top_button:setSize(cc.size(59,59))
    zy_close_top_button:setAnchorPoint(cc.p(0.5,0.5))
    zy_close_top_button:setButtonImage("batch_ui/guanbi_up.png")
    zhanyi_ditu_bg:appendComponent(zy_close_top_button)
    zy_close_top_button:setPositionInContainer(cc.p(930.5,29.5))
    table_zhanyi_ditu_bg["zy_close_top_button"] = zy_close_top_button

    return table_zhanyi_ditu_bg

end

