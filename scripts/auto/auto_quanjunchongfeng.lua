function createquanjunchongfeng()

    local table_quanjunchongfeng = {}

    local quanjunchongfeng = fc.FContainerPanel:create()
    quanjunchongfeng:setSize(cc.size(960,640))
    table_quanjunchongfeng["quanjunchongfeng"] = quanjunchongfeng

    local quanjun_bg_scale9image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/quanjunchongfeng_heiseditu.png",cc.rect(1,1,3,3))
    quanjun_bg_scale9image:setSize(cc.size(960,640))
    quanjun_bg_scale9image:setAnchorPoint(cc.p(0.5,0.5))
    quanjunchongfeng:appendComponent(quanjun_bg_scale9image)
    quanjun_bg_scale9image:setPositionInContainer(cc.p(480,320))
    table_quanjunchongfeng["quanjun_bg_scale9image"] = quanjun_bg_scale9image

    local quanjun_quan_image = fc.FExtensionsImage:create()
    quanjun_quan_image:setImage("batch_ui/quan.png")
    quanjun_quan_image:setSize(cc.size(186,234))
    quanjun_quan_image:setAnchorPoint(cc.p(0.5,0.5))
    quanjunchongfeng:appendComponent(quanjun_quan_image)
    quanjun_quan_image:setPositionInContainer(cc.p(235,320))
    table_quanjunchongfeng["quanjun_quan_image"] = quanjun_quan_image

    local quanjun_jun_image = fc.FExtensionsImage:create()
    quanjun_jun_image:setImage("batch_ui/jun.png")
    quanjun_jun_image:setSize(cc.size(156,234))
    quanjun_jun_image:setAnchorPoint(cc.p(0.5,0.5))
    quanjunchongfeng:appendComponent(quanjun_jun_image)
    quanjun_jun_image:setPositionInContainer(cc.p(403,320))
    table_quanjunchongfeng["quanjun_jun_image"] = quanjun_jun_image

    local quanjun_chong_image = fc.FExtensionsImage:create()
    quanjun_chong_image:setImage("batch_ui/chong.png")
    quanjun_chong_image:setSize(cc.size(170,234))
    quanjun_chong_image:setAnchorPoint(cc.p(0.5,0.5))
    quanjunchongfeng:appendComponent(quanjun_chong_image)
    quanjun_chong_image:setPositionInContainer(cc.p(561,320))
    table_quanjunchongfeng["quanjun_chong_image"] = quanjun_chong_image

    local quanjun_feng_image = fc.FExtensionsImage:create()
    quanjun_feng_image:setImage("batch_ui/feng.png")
    quanjun_feng_image:setSize(cc.size(174,234))
    quanjun_feng_image:setAnchorPoint(cc.p(0.5,0.5))
    quanjunchongfeng:appendComponent(quanjun_feng_image)
    quanjun_feng_image:setPositionInContainer(cc.p(722,320))
    table_quanjunchongfeng["quanjun_feng_image"] = quanjun_feng_image

    return table_quanjunchongfeng

end

