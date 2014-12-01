function createzhuanpan()

    local table_zhuanpan = {}

    local zhuanpan = fc.FContainerPanel:create()
    zhuanpan:setSize(cc.size(960,680))
    table_zhuanpan["zhuanpan"] = zhuanpan

    local zp_bantouming_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    zp_bantouming_scale9:setSize(cc.size(960,680))
    zp_bantouming_scale9:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_bantouming_scale9)
    zp_bantouming_scale9:setPositionInContainer(cc.p(480,340))
    table_zhuanpan["zp_bantouming_scale9"] = zp_bantouming_scale9

    local zp_zhuanpan_panel = fc.FContainerPanel:create()
    zp_zhuanpan_panel:setSize(cc.size(680,680))
    zp_zhuanpan_panel:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_zhuanpan_panel)
    zp_zhuanpan_panel:setPositionInContainer(cc.p(478,340))
    table_zhuanpan["zp_zhuanpan_panel"] = zp_zhuanpan_panel

    local zp_zhuanpan1_image = fc.FExtensionsImage:create()
    zp_zhuanpan1_image:setImage("nobatch/zhuanpankuang_biankuang.png")
    zp_zhuanpan1_image:setSize(cc.size(330,330))
    zp_zhuanpan1_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_zhuanpan1_image)
    zp_zhuanpan1_image:setPositionInContainer(cc.p(175,175))
    table_zhuanpan["zp_zhuanpan1_image"] = zp_zhuanpan1_image

    local zp_zhuanpan2_image = fc.FExtensionsImage:create()
    zp_zhuanpan2_image:setImage("nobatch/zhuanpankuang_biankuang.png")
    zp_zhuanpan2_image:setSize(cc.size(330,330))
    zp_zhuanpan2_image:setFlipType(2)
    zp_zhuanpan2_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_zhuanpan2_image)
    zp_zhuanpan2_image:setPositionInContainer(cc.p(505,175))
    table_zhuanpan["zp_zhuanpan2_image"] = zp_zhuanpan2_image

    local zp_zhuanpan3_image = fc.FExtensionsImage:create()
    zp_zhuanpan3_image:setImage("nobatch/zhuanpankuang_biankuang.png")
    zp_zhuanpan3_image:setSize(cc.size(330,330))
    zp_zhuanpan3_image:setFlipType(8)
    zp_zhuanpan3_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_zhuanpan3_image)
    zp_zhuanpan3_image:setPositionInContainer(cc.p(505,505))
    table_zhuanpan["zp_zhuanpan3_image"] = zp_zhuanpan3_image

    local zp_zhuanpan4_image = fc.FExtensionsImage:create()
    zp_zhuanpan4_image:setImage("nobatch/zhuanpankuang_biankuang.png")
    zp_zhuanpan4_image:setSize(cc.size(330,330))
    zp_zhuanpan4_image:setFlipType(4)
    zp_zhuanpan4_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_zhuanpan4_image)
    zp_zhuanpan4_image:setPositionInContainer(cc.p(175,505))
    table_zhuanpan["zp_zhuanpan4_image"] = zp_zhuanpan4_image

    local zp_touxiang1_image = fc.FExtensionsImage:create()
    zp_touxiang1_image:setImage("batch_ui/zhuangbeisuipian_biankuang.png")
    zp_touxiang1_image:setSize(cc.size(220,201))
    zp_touxiang1_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_touxiang1_image)
    zp_touxiang1_image:setPositionInContainer(cc.p(368,202.5))
    table_zhuanpan["zp_touxiang1_image"] = zp_touxiang1_image

    local zp_touxiang2_image = fc.FExtensionsImage:create()
    zp_touxiang2_image:setImage("batch_ui/meinv_zhuanpan.png")
    zp_touxiang2_image:setSize(cc.size(220,201))
    zp_touxiang2_image:setRotation(90)
    zp_touxiang2_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_touxiang2_image)
    zp_touxiang2_image:setPositionInContainer(cc.p(490.5,340))
    table_zhuanpan["zp_touxiang2_image"] = zp_touxiang2_image

    local zp_touxiang3_image = fc.FExtensionsImage:create()
    zp_touxiang3_image:setImage("batch_ui/xueshi_biankuang.png")
    zp_touxiang3_image:setSize(cc.size(220,201))
    zp_touxiang3_image:setRotation(180)
    zp_touxiang3_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_touxiang3_image)
    zp_touxiang3_image:setPositionInContainer(cc.p(342,493.5))
    table_zhuanpan["zp_touxiang3_image"] = zp_touxiang3_image

    local zp_touxiang4_image = fc.FExtensionsImage:create()
    zp_touxiang4_image:setImage("batch_ui/huangzi_zhuanpan.png")
    zp_touxiang4_image:setSize(cc.size(220,201))
    zp_touxiang4_image:setRotation(270)
    zp_touxiang4_image:setAnchorPoint(cc.p(0.5,0.5))
    zp_zhuanpan_panel:appendComponent(zp_touxiang4_image)
    zp_touxiang4_image:setPositionInContainer(cc.p(188.5,340))
    table_zhuanpan["zp_touxiang4_image"] = zp_touxiang4_image

    local zp_jiazi1_image = fc.FExtensionsImage:create()
    zp_jiazi1_image:setImage("nobatch/zhuanpan_fengekuang.png")
    zp_jiazi1_image:setSize(cc.size(225,225))
    zp_jiazi1_image:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_jiazi1_image)
    zp_jiazi1_image:setPositionInContainer(cc.p(351.5,206.5))
    table_zhuanpan["zp_jiazi1_image"] = zp_jiazi1_image

    local zp_jiazi2_image = fc.FExtensionsImage:create()
    zp_jiazi2_image:setImage("nobatch/zhuanpan_fengekuang.png")
    zp_jiazi2_image:setSize(cc.size(225,225))
    zp_jiazi2_image:setFlipType(2)
    zp_jiazi2_image:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_jiazi2_image)
    zp_jiazi2_image:setPositionInContainer(cc.p(614.5,206.5))
    table_zhuanpan["zp_jiazi2_image"] = zp_jiazi2_image

    local zp_jiazi4_image = fc.FExtensionsImage:create()
    zp_jiazi4_image:setImage("nobatch/zhuanpan_fengekuang.png")
    zp_jiazi4_image:setSize(cc.size(225,225))
    zp_jiazi4_image:setFlipType(4)
    zp_jiazi4_image:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_jiazi4_image)
    zp_jiazi4_image:setPositionInContainer(cc.p(351.5,471.5))
    table_zhuanpan["zp_jiazi4_image"] = zp_jiazi4_image

    local zp_jiazi3_image = fc.FExtensionsImage:create()
    zp_jiazi3_image:setImage("nobatch/zhuanpan_fengekuang.png")
    zp_jiazi3_image:setSize(cc.size(225,225))
    zp_jiazi3_image:setFlipType(8)
    zp_jiazi3_image:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_jiazi3_image)
    zp_jiazi3_image:setPositionInContainer(cc.p(611.5,472.5))
    table_zhuanpan["zp_jiazi3_image"] = zp_jiazi3_image

    local zp_zhizhen_image = fc.FExtensionsImage:create()
    zp_zhizhen_image:setImage("batch_ui/zhizhen.png")
    zp_zhizhen_image:setSize(cc.size(191,215))
    zp_zhizhen_image:setAnchorPoint(cc.p(0.5,0.5))
    zhuanpan:appendComponent(zp_zhizhen_image)
    zp_zhizhen_image:setPositionInContainer(cc.p(484.5,327.5))
    table_zhuanpan["zp_zhizhen_image"] = zp_zhizhen_image

    return table_zhuanpan

end

