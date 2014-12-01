function createpaibing_card_array_bottom()

    local table_paibing_card_array_bottom = {}

    local paibing_card_array_bottom = fc.FContainerPanel:create()
    paibing_card_array_bottom:setSize(cc.size(960,640))
    table_paibing_card_array_bottom["paibing_card_array_bottom"] = paibing_card_array_bottom

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(158.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(282.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(406.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(529.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(651.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(773.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bg_scale9:setSize(cc.size(127,131))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(896.5,561.5))
    table_paibing_card_array_bottom["bg_scale9"] = bg_scale9

    local paibing_card_array_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/tuopan2_paibingbuzhen.png",cc.rect(187,66,5,5))
    paibing_card_array_bg_image:setSize(cc.size(960,131))
    paibing_card_array_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(paibing_card_array_bg_image)
    paibing_card_array_bg_image:setPositionInContainer(cc.p(480,561.5))
    table_paibing_card_array_bottom["paibing_card_array_bg_image"] = paibing_card_array_bg_image

    local jiang_imag = fc.FExtensionsImage:create()
    jiang_imag:setImage("batch_ui/jiang_anniu.png")
    jiang_imag:setSize(cc.size(91,94))
    jiang_imag:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_bottom:appendComponent(jiang_imag)
    jiang_imag:setPositionInContainer(cc.p(76.5,563))
    table_paibing_card_array_bottom["jiang_imag"] = jiang_imag

    local paibing_card_array_huanzhen_button = fc.FScaleButton:create()
    paibing_card_array_huanzhen_button:setSize(cc.size(65,124))
    paibing_card_array_huanzhen_button:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_array_huanzhen_button:setButtonImage("batch_ui/huanzhen2_anniu.png")
    paibing_card_array_bottom:appendComponent(paibing_card_array_huanzhen_button)
    paibing_card_array_huanzhen_button:setPositionInContainer(cc.p(927.5,559))
    table_paibing_card_array_bottom["paibing_card_array_huanzhen_button"] = paibing_card_array_huanzhen_button

    local pb_huan_uizi = fc.FShaderExtensionsImage:create(0)
    pb_huan_uizi:setAnchorPoint(cc.p(0.5,0.5))
    pb_huan_uizi:setImage("batch_ui/huan_uizi.png")
    pb_huan_uizi:setSize(cc.size(32,32))
    paibing_card_array_huanzhen_button:appendComponent(pb_huan_uizi)
    pb_huan_uizi:setPositionInContainer(cc.p(49,40))
    table_paibing_card_array_bottom["pb_huan_uizi"] = pb_huan_uizi

    local pb_zhen_uizi = fc.FShaderExtensionsImage:create(0)
    pb_zhen_uizi:setAnchorPoint(cc.p(0.5,0.5))
    pb_zhen_uizi:setImage("batch_ui/zhen_uizi.png")
    pb_zhen_uizi:setSize(cc.size(32,32))
    paibing_card_array_huanzhen_button:appendComponent(pb_zhen_uizi)
    pb_zhen_uizi:setPositionInContainer(cc.p(49,82))
    table_paibing_card_array_bottom["pb_zhen_uizi"] = pb_zhen_uizi

    return table_paibing_card_array_bottom

end

