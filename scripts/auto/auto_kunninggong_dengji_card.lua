function createkunninggong_dengji_card()

    local table_kunninggong_dengji_card = {}

    local kunninggong_dengji_card = fc.FContainerPanel:create()
    kunninggong_dengji_card:setSize(cc.size(178,84))
    table_kunninggong_dengji_card["kunninggong_dengji_card"] = kunninggong_dengji_card

    local hg_cf_shanzi_image = fc.FExtensionsImage:create()
    hg_cf_shanzi_image:setImage("batch_ui/cheng_kunninggong.png")
    hg_cf_shanzi_image:setSize(cc.size(178,84))
    hg_cf_shanzi_image:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_dengji_card:appendComponent(hg_cf_shanzi_image)
    hg_cf_shanzi_image:setPositionInContainer(cc.p(89,42))
    table_kunninggong_dengji_card["hg_cf_shanzi_image"] = hg_cf_shanzi_image

    local zi1 = fc.FExtensionsImage:create()
    zi1:setImage("batch_ui/gong_uizi.png")
    zi1:setSize(cc.size(32,32))
    zi1:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_dengji_card:appendComponent(zi1)
    zi1:setPositionInContainer(cc.p(61,30))
    table_kunninggong_dengji_card["zi1"] = zi1

    local zi2 = fc.FExtensionsImage:create()
    zi2:setImage("batch_ui/gong_uizi.png")
    zi2:setSize(cc.size(32,32))
    zi2:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_dengji_card:appendComponent(zi2)
    zi2:setPositionInContainer(cc.p(89,30))
    table_kunninggong_dengji_card["zi2"] = zi2

    local zi3 = fc.FExtensionsImage:create()
    zi3:setImage("batch_ui/gong_uizi.png")
    zi3:setSize(cc.size(32,32))
    zi3:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_dengji_card:appendComponent(zi3)
    zi3:setPositionInContainer(cc.p(117,30))
    table_kunninggong_dengji_card["zi3"] = zi3

    local zi4 = fc.FExtensionsImage:create()
    zi4:setImage("batch_ui/gong_uizi.png")
    zi4:setSize(cc.size(32,32))
    zi4:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_dengji_card:appendComponent(zi4)
    zi4:setPositionInContainer(cc.p(68,30))
    table_kunninggong_dengji_card["zi4"] = zi4

    local zi5 = fc.FExtensionsImage:create()
    zi5:setImage("batch_ui/gong_uizi.png")
    zi5:setSize(cc.size(32,32))
    zi5:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_dengji_card:appendComponent(zi5)
    zi5:setPositionInContainer(cc.p(108,30))
    table_kunninggong_dengji_card["zi5"] = zi5

    return table_kunninggong_dengji_card

end

