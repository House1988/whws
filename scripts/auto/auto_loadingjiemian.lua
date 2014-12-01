function createloadingjiemian()

    local table_loadingjiemian = {}

    local loadingjiemian = fc.FContainerPanel:create()
    loadingjiemian:setSize(cc.size(960,640))
    table_loadingjiemian["loadingjiemian"] = loadingjiemian

    local loading_meinv = fc.FExtensionsImage:create()
    loading_meinv:setAnchorPoint(cc.p(0.5,0.5))
    loadingjiemian:appendComponent(loading_meinv)
    loading_meinv:setPositionInContainer(cc.p(480,320))
    table_loadingjiemian["loading_meinv"] = loading_meinv

    local tip = fc.FLabel:createSystemFont()
    tip:setSize(cc.size(78,19))
    tip:setAnchorPoint(cc.p(0.5,0.5))
    tip:setFontSize(21)
    tip:setString("100/100")
    tip:setColor(cc.c3b(255,255,255))
    loadingjiemian:appendComponent(tip)
    tip:setPositionInContainer(cc.p(480,599.5))
    table_loadingjiemian["tip"] = tip

    local precent = fc.FLabel:createSystemFont()
    precent:setSize(cc.size(78,19))
    precent:setAnchorPoint(cc.p(0.5,0.5))
    precent:setFontSize(21)
    precent:setString("100/100")
    precent:setColor(cc.c3b(255,255,255))
    loadingjiemian:appendComponent(precent)
    precent:setPositionInContainer(cc.p(480,553.5))
    table_loadingjiemian["precent"] = precent

    return table_loadingjiemian

end

