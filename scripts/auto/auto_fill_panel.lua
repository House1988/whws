function createfill_panel()

    local table_fill_panel = {}

    local fill_panel = fc.FContainerPanel:create()
    fill_panel:setSize(cc.size(960,640))
    table_fill_panel["fill_panel"] = fill_panel

    local fillTop1_image = fc.FExtensionsImage:create()
    fillTop1_image:setImage("nobatch/tiechong.png")
    fillTop1_image:setSize(cc.size(480,75))
    fillTop1_image:setAnchorPoint(cc.p(0.5,0.5))
    fill_panel:appendComponent(fillTop1_image)
    fillTop1_image:setPositionInContainer(cc.p(240,38))
    table_fill_panel["fillTop1_image"] = fillTop1_image

    local fillTop2_image = fc.FExtensionsImage:create()
    fillTop2_image:setImage("nobatch/tiechong.png")
    fillTop2_image:setSize(cc.size(480,75))
    fillTop2_image:setAnchorPoint(cc.p(0.5,0.5))
    fill_panel:appendComponent(fillTop2_image)
    fillTop2_image:setPositionInContainer(cc.p(720,38))
    table_fill_panel["fillTop2_image"] = fillTop2_image

    local fillBottom1_image = fc.FExtensionsImage:create()
    fillBottom1_image:setImage("nobatch/tiechong.png")
    fillBottom1_image:setSize(cc.size(480,75))
    fillBottom1_image:setAnchorPoint(cc.p(0.5,0.5))
    fill_panel:appendComponent(fillBottom1_image)
    fillBottom1_image:setPositionInContainer(cc.p(240,602))
    table_fill_panel["fillBottom1_image"] = fillBottom1_image

    local fillBottom2_image = fc.FExtensionsImage:create()
    fillBottom2_image:setImage("nobatch/tiechong.png")
    fillBottom2_image:setSize(cc.size(480,75))
    fillBottom2_image:setAnchorPoint(cc.p(0.5,0.5))
    fill_panel:appendComponent(fillBottom2_image)
    fillBottom2_image:setPositionInContainer(cc.p(720,602))
    table_fill_panel["fillBottom2_image"] = fillBottom2_image

    local fillLeft_image = fc.FExtensionsImage:create()
    fillLeft_image:setImage("nobatch/tiechong.png")
    fillLeft_image:setSize(cc.size(490,75))
    fillLeft_image:setRotation(90)
    fillLeft_image:setAnchorPoint(cc.p(0.5,0.5))
    fill_panel:appendComponent(fillLeft_image)
    fillLeft_image:setPositionInContainer(cc.p(38,320))
    table_fill_panel["fillLeft_image"] = fillLeft_image

    local fillRight_image = fc.FExtensionsImage:create()
    fillRight_image:setImage("nobatch/tiechong.png")
    fillRight_image:setSize(cc.size(490,75))
    fillRight_image:setRotation(90)
    fillRight_image:setAnchorPoint(cc.p(0.5,0.5))
    fill_panel:appendComponent(fillRight_image)
    fillRight_image:setPositionInContainer(cc.p(922,320))
    table_fill_panel["fillRight_image"] = fillRight_image

    return table_fill_panel

end

