function createpaibing_card_prop()

    local table_paibing_card_prop = {}

    local paibing_card_prop = fc.FContainerPanel:create()
    paibing_card_prop:setSize(cc.size(218,380))
    table_paibing_card_prop["paibing_card_prop"] = paibing_card_prop

    local paibing_card_huanjiang_button = fc.FScaleButton:create()
    paibing_card_huanjiang_button:setSize(cc.size(144,53))
    paibing_card_huanjiang_button:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_huanjiang_button:setButtonImage("batch_ui/putonganniu1_up.png")
    paibing_card_prop:appendComponent(paibing_card_huanjiang_button)
    paibing_card_huanjiang_button:setPositionInContainer(cc.p(109,352.5))
    table_paibing_card_prop["paibing_card_huanjiang_button"] = paibing_card_huanjiang_button

    local huan_uizi = fc.FShaderExtensionsImage:create(0)
    huan_uizi:setAnchorPoint(cc.p(0.5,0.5))
    huan_uizi:setImage("batch_ui/huan_uizi.png")
    huan_uizi:setSize(cc.size(32,32))
    paibing_card_huanjiang_button:appendComponent(huan_uizi)
    huan_uizi:setPositionInContainer(cc.p(54,26))
    table_paibing_card_prop["huan_uizi"] = huan_uizi

    local jiang_uizi = fc.FShaderExtensionsImage:create(0)
    jiang_uizi:setAnchorPoint(cc.p(0.5,0.5))
    jiang_uizi:setImage("batch_ui/jiang_uizi.png")
    jiang_uizi:setSize(cc.size(32,32))
    paibing_card_huanjiang_button:appendComponent(jiang_uizi)
    jiang_uizi:setPositionInContainer(cc.p(90,26))
    table_paibing_card_prop["jiang_uizi"] = jiang_uizi

    local paibing_card_detail_button = fc.FScaleButton:create()
    paibing_card_detail_button:setSize(cc.size(144,53))
    paibing_card_detail_button:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_detail_button:setButtonImage("batch_ui/putonganniu1_up.png")
    paibing_card_prop:appendComponent(paibing_card_detail_button)
    paibing_card_detail_button:setPositionInContainer(cc.p(109,289.5))
    table_paibing_card_prop["paibing_card_detail_button"] = paibing_card_detail_button

    local ming_uizi = fc.FShaderExtensionsImage:create(0)
    ming_uizi:setAnchorPoint(cc.p(0.5,0.5))
    ming_uizi:setImage("batch_ui/ming_uizi.png")
    ming_uizi:setSize(cc.size(32,32))
    paibing_card_detail_button:appendComponent(ming_uizi)
    ming_uizi:setPositionInContainer(cc.p(26,26))
    table_paibing_card_prop["ming_uizi"] = ming_uizi

    local chen_uizi = fc.FShaderExtensionsImage:create(0)
    chen_uizi:setAnchorPoint(cc.p(0.5,0.5))
    chen_uizi:setImage("batch_ui/chen_uizi.png")
    chen_uizi:setSize(cc.size(32,32))
    paibing_card_detail_button:appendComponent(chen_uizi)
    chen_uizi:setPositionInContainer(cc.p(58,26))
    table_paibing_card_prop["chen_uizi"] = chen_uizi

    local xiang_uizi = fc.FShaderExtensionsImage:create(0)
    xiang_uizi:setAnchorPoint(cc.p(0.5,0.5))
    xiang_uizi:setImage("batch_ui/xiang_uizi.png")
    xiang_uizi:setSize(cc.size(32,32))
    paibing_card_detail_button:appendComponent(xiang_uizi)
    xiang_uizi:setPositionInContainer(cc.p(88,26))
    table_paibing_card_prop["xiang_uizi"] = xiang_uizi

    local qing_uizi = fc.FShaderExtensionsImage:create(0)
    qing_uizi:setAnchorPoint(cc.p(0.5,0.5))
    qing_uizi:setImage("batch_ui/qing_uizi.png")
    qing_uizi:setSize(cc.size(32,32))
    paibing_card_detail_button:appendComponent(qing_uizi)
    qing_uizi:setPositionInContainer(cc.p(120,26))
    table_paibing_card_prop["qing_uizi"] = qing_uizi

    local label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    label_di:setSize(cc.size(184,29))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    paibing_card_prop:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(109,25.5))
    table_paibing_card_prop["label_di"] = label_di

    local label_biaoti = fc.FLabel:createBMFont()
    label_biaoti:setSize(cc.size(80,30))
    label_biaoti:setAnchorPoint(cc.p(0.5,0.5))
    label_biaoti:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	label_biaoti:setString("所屬組合")
    else
    	label_biaoti:setString("所属组合")
    end
    label_biaoti:setColor(cc.c3b(255,255,255))
    paibing_card_prop:appendComponent(label_biaoti)
    label_biaoti:setPositionInContainer(cc.p(109,22))
    table_paibing_card_prop["label_biaoti"] = label_biaoti

    return table_paibing_card_prop

end

