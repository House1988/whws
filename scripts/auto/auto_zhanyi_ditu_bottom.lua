function createzhanyi_ditu_bottom()

    local table_zhanyi_ditu_bottom = {}

    local zhanyi_ditu_bottom = fc.FContainerPanel:create()
    zhanyi_ditu_bottom:setSize(cc.size(237,48))
    table_zhanyi_ditu_bottom["zhanyi_ditu_bottom"] = zhanyi_ditu_bottom

    local zy_name_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zhanyimingcheng.png",cc.rect(7,17,5,5))
    zy_name_bg_scale9:setSize(cc.size(237,48))
    zy_name_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_ditu_bottom:appendComponent(zy_name_bg_scale9)
    zy_name_bg_scale9:setPositionInContainer(cc.p(118.5,24))
    table_zhanyi_ditu_bottom["zy_name_bg_scale9"] = zy_name_bg_scale9

    local zy_name_label = fc.FLabel:createBMFont()
    zy_name_label:setSize(cc.size(135,24))
    zy_name_label:setAnchorPoint(cc.p(0.5,0.5))
    zy_name_label:setFontSize(32)
    zy_name_label:setString("兵")
    zy_name_label:setColor(cc.c3b(255,255,255))
    zhanyi_ditu_bottom:appendComponent(zy_name_label)
    zy_name_label:setPositionInContainer(cc.p(104.5,18))
    table_zhanyi_ditu_bottom["zy_name_label"] = zy_name_label

    return table_zhanyi_ditu_bottom

end

