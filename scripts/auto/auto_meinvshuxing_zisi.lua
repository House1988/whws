function createmeinvshuxing_zisi()

    local table_meinvshuxing_zisi = {}

    local meinvshuxing_zisi = fc.FContainerPanel:create()
    meinvshuxing_zisi:setSize(cc.size(960,174))
    table_meinvshuxing_zisi["meinvshuxing_zisi"] = meinvshuxing_zisi

    local bottombg = fc.FExtensionsImage:create()
    bottombg:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bottombg:setSize(cc.size(170,160))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(875,94))
    table_meinvshuxing_zisi["bottombg"] = bottombg

    local bottombg = fc.FExtensionsImage:create()
    bottombg:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bottombg:setSize(cc.size(170,160))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(705,94))
    table_meinvshuxing_zisi["bottombg"] = bottombg

    local bottombg = fc.FExtensionsImage:create()
    bottombg:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bottombg:setSize(cc.size(170,160))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(535,94))
    table_meinvshuxing_zisi["bottombg"] = bottombg

    local bottombg = fc.FExtensionsImage:create()
    bottombg:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bottombg:setSize(cc.size(170,160))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(365,94))
    table_meinvshuxing_zisi["bottombg"] = bottombg

    local bottombg = fc.FExtensionsImage:create()
    bottombg:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bottombg:setSize(cc.size(170,160))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(85,94))
    table_meinvshuxing_zisi["bottombg"] = bottombg

    local bottombg = fc.FExtensionsImage:create()
    bottombg:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bottombg:setSize(cc.size(170,160))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(195,94))
    table_meinvshuxing_zisi["bottombg"] = bottombg

    local mnsx_zisi_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/tuopan2_tangquanxinggong.png",cc.rect(190,0,2,143))
    mnsx_zisi_bg_scale9:setSize(cc.size(960,160))
    mnsx_zisi_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(mnsx_zisi_bg_scale9)
    mnsx_zisi_bg_scale9:setPositionInContainer(cc.p(480,94))
    table_meinvshuxing_zisi["mnsx_zisi_bg_scale9"] = mnsx_zisi_bg_scale9

    local si = fc.FExtensionsImage:create()
    si:setImage("batch_ui/si_anniu.png")
    si:setSize(cc.size(99,96))
    si:setAnchorPoint(cc.p(0.5,0.5))
    meinvshuxing_zisi:appendComponent(si)
    si:setPositionInContainer(cc.p(72.5,94))
    table_meinvshuxing_zisi["si"] = si

    return table_meinvshuxing_zisi

end

