function createhuangzidujun_array_bottom()

    local table_huangzidujun_array_bottom = {}

    local huangzidujun_array_bottom = fc.FContainerPanel:create()
    huangzidujun_array_bottom:setSize(cc.size(960,640))
    table_huangzidujun_array_bottom["huangzidujun_array_bottom"] = huangzidujun_array_bottom

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(156.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(280.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(404.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(527.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(649.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(773.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local scale_bg = fc.FExtensionsImage:create()
    scale_bg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    scale_bg:setSize(cc.size(127,131))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(896.5,561.5))
    table_huangzidujun_array_bottom["scale_bg"] = scale_bg

    local hzdj_array_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/tuopan2_paibingbuzhen.png",cc.rect(187,66,5,5))
    hzdj_array_bg_image:setSize(cc.size(960,131))
    hzdj_array_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(hzdj_array_bg_image)
    hzdj_array_bg_image:setPositionInContainer(cc.p(480,561.5))
    table_huangzidujun_array_bottom["hzdj_array_bg_image"] = hzdj_array_bg_image

    local btn_bg_image = fc.FScaleButton:create()
    btn_bg_image:setSize(cc.size(65,124))
    btn_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    btn_bg_image:setButtonImage("batch_ui/huanzhen2_anniu.png")
    huangzidujun_array_bottom:appendComponent(btn_bg_image)
    btn_bg_image:setPositionInContainer(cc.p(927.5,558))
    table_huangzidujun_array_bottom["btn_bg_image"] = btn_bg_image

    local zong_ui = fc.FShaderExtensionsImage:create(0)
    zong_ui:setAnchorPoint(cc.p(0.5,0.5))
    zong_ui:setImage("batch_ui/zong_uizi.png")
    zong_ui:setSize(cc.size(32,32))
    btn_bg_image:appendComponent(zong_ui)
    zong_ui:setPositionInContainer(cc.p(49,30))
    table_huangzidujun_array_bottom["zong_ui"] = zong_ui

    local jia_ui = fc.FShaderExtensionsImage:create(0)
    jia_ui:setAnchorPoint(cc.p(0.5,0.5))
    jia_ui:setImage("batch_ui/jia_uizi.png")
    jia_ui:setSize(cc.size(32,32))
    btn_bg_image:appendComponent(jia_ui)
    jia_ui:setPositionInContainer(cc.p(49,62))
    table_huangzidujun_array_bottom["jia_ui"] = jia_ui

    local cheng_ui = fc.FShaderExtensionsImage:create(0)
    cheng_ui:setAnchorPoint(cc.p(0.5,0.5))
    cheng_ui:setImage("batch_ui/cheng_uizi.png")
    cheng_ui:setSize(cc.size(32,32))
    btn_bg_image:appendComponent(cheng_ui)
    cheng_ui:setPositionInContainer(cc.p(49,94))
    table_huangzidujun_array_bottom["cheng_ui"] = cheng_ui

    local chu_image = fc.FExtensionsImage:create()
    chu_image:setImage("batch_ui/chu_anniu.png")
    chu_image:setSize(cc.size(111,114))
    chu_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_array_bottom:appendComponent(chu_image)
    chu_image:setPositionInContainer(cc.p(85.5,561))
    table_huangzidujun_array_bottom["chu_image"] = chu_image

    return table_huangzidujun_array_bottom

end

