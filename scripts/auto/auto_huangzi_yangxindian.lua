function createhuangzi_yangxindian()

    local table_huangzi_yangxindian = {}

    local huangzi_yangxindian = fc.FContainerPanel:create()
    huangzi_yangxindian:setSize(cc.size(960,640))
    table_huangzi_yangxindian["huangzi_yangxindian"] = huangzi_yangxindian

    local hz_yxd_back_page_button = fc.FScaleButton:create()
    hz_yxd_back_page_button:setSize(cc.size(38,60))
    hz_yxd_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_yxd_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    hz_yxd_back_page_button:setScaleX(-1)
    huangzi_yangxindian:appendComponent(hz_yxd_back_page_button)
    hz_yxd_back_page_button:setPositionInContainer(cc.p(933,350))
    table_huangzi_yangxindian["hz_yxd_back_page_button"] = hz_yxd_back_page_button

    local hz_yxd_pre_page_button = fc.FScaleButton:create()
    hz_yxd_pre_page_button:setSize(cc.size(38,60))
    hz_yxd_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_yxd_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    huangzi_yangxindian:appendComponent(hz_yxd_pre_page_button)
    hz_yxd_pre_page_button:setPositionInContainer(cc.p(27,350))
    table_huangzi_yangxindian["hz_yxd_pre_page_button"] = hz_yxd_pre_page_button

    local hz_yxd_details_button = fc.FScaleButton:create()
    hz_yxd_details_button:setSize(cc.size(144,53))
    hz_yxd_details_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_yxd_details_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_yangxindian:appendComponent(hz_yxd_details_button)
    hz_yxd_details_button:setPositionInContainer(cc.p(274,595.5))
    table_huangzi_yangxindian["hz_yxd_details_button"] = hz_yxd_details_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    hz_yxd_details_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(32,26))
    table_huangzi_yangxindian["cha"] = cha

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    hz_yxd_details_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_huangzi_yangxindian["kan"] = kan

    local xiang = fc.FShaderExtensionsImage:create(0)
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    hz_yxd_details_button:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(83,26))
    table_huangzi_yangxindian["xiang"] = xiang

    local qing = fc.FShaderExtensionsImage:create(0)
    qing:setAnchorPoint(cc.p(0.5,0.5))
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    hz_yxd_details_button:appendComponent(qing)
    qing:setPositionInContainer(cc.p(108,26))
    table_huangzi_yangxindian["qing"] = qing

    local hz_yxd_yuelongmen_button = fc.FScaleButton:create()
    hz_yxd_yuelongmen_button:setSize(cc.size(144,53))
    hz_yxd_yuelongmen_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_yxd_yuelongmen_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_yangxindian:appendComponent(hz_yxd_yuelongmen_button)
    hz_yxd_yuelongmen_button:setPositionInContainer(cc.p(671,595.5))
    table_huangzi_yangxindian["hz_yxd_yuelongmen_button"] = hz_yxd_yuelongmen_button

    local yue = fc.FShaderExtensionsImage:create(0)
    yue:setAnchorPoint(cc.p(0.5,0.5))
    yue:setImage("batch_ui/yue_uizi.png")
    yue:setSize(cc.size(32,32))
    hz_yxd_yuelongmen_button:appendComponent(yue)
    yue:setPositionInContainer(cc.p(43,26))
    table_huangzi_yangxindian["yue"] = yue

    local long = fc.FShaderExtensionsImage:create(0)
    long:setAnchorPoint(cc.p(0.5,0.5))
    long:setImage("batch_ui/long_uizi.png")
    long:setSize(cc.size(32,32))
    hz_yxd_yuelongmen_button:appendComponent(long)
    long:setPositionInContainer(cc.p(72,26))
    table_huangzi_yangxindian["long"] = long

    local men = fc.FShaderExtensionsImage:create(0)
    men:setAnchorPoint(cc.p(0.5,0.5))
    men:setImage("batch_ui/men_uizi.png")
    men:setSize(cc.size(32,32))
    hz_yxd_yuelongmen_button:appendComponent(men)
    men:setPositionInContainer(cc.p(102,27))
    table_huangzi_yangxindian["men"] = men

    local hz_yxd_fengjue_button = fc.FScaleButton:create()
    hz_yxd_fengjue_button:setSize(cc.size(144,53))
    hz_yxd_fengjue_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_yxd_fengjue_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_yangxindian:appendComponent(hz_yxd_fengjue_button)
    hz_yxd_fengjue_button:setPositionInContainer(cc.p(833,595.5))
    table_huangzi_yangxindian["hz_yxd_fengjue_button"] = hz_yxd_fengjue_button

    local feng = fc.FShaderExtensionsImage:create(0)
    feng:setAnchorPoint(cc.p(0.5,0.5))
    feng:setImage("batch_ui/feng1_uizi.png")
    feng:setSize(cc.size(32,32))
    hz_yxd_fengjue_button:appendComponent(feng)
    feng:setPositionInContainer(cc.p(45,26))
    table_huangzi_yangxindian["feng"] = feng

    local jue = fc.FShaderExtensionsImage:create(0)
    jue:setAnchorPoint(cc.p(0.5,0.5))
    jue:setImage("batch_ui/jue_uizi.png")
    jue:setSize(cc.size(32,32))
    hz_yxd_fengjue_button:appendComponent(jue)
    jue:setPositionInContainer(cc.p(99,26))
    table_huangzi_yangxindian["jue"] = jue

    local hz_yxd_delete_button = fc.FScaleButton:create()
    hz_yxd_delete_button:setSize(cc.size(144,53))
    hz_yxd_delete_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_yxd_delete_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_yangxindian:appendComponent(hz_yxd_delete_button)
    hz_yxd_delete_button:setPositionInContainer(cc.p(113,595.5))
    table_huangzi_yangxindian["hz_yxd_delete_button"] = hz_yxd_delete_button

    local fei = fc.FShaderExtensionsImage:create(0)
    fei:setAnchorPoint(cc.p(0.5,0.5))
    fei:setImage("batch_ui/fei1_uizi.png")
    fei:setSize(cc.size(32,32))
    hz_yxd_delete_button:appendComponent(fei)
    fei:setPositionInContainer(cc.p(45,26))
    table_huangzi_yangxindian["fei"] = fei

    local chu = fc.FShaderExtensionsImage:create(0)
    chu:setAnchorPoint(cc.p(0.5,0.5))
    chu:setImage("batch_ui/chu4_uizi.png")
    chu:setSize(cc.size(32,32))
    hz_yxd_delete_button:appendComponent(chu)
    chu:setPositionInContainer(cc.p(99,26))
    table_huangzi_yangxindian["chu"] = chu

    local pagebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pagebg:setSize(cc.size(100,30))
    pagebg:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yangxindian:appendComponent(pagebg)
    pagebg:setPositionInContainer(cc.p(480,597))
    table_huangzi_yangxindian["pagebg"] = pagebg

    local pageText = fc.FLabel:createSystemFont()
    pageText:setSize(cc.size(100,25))
    pageText:setAnchorPoint(cc.p(0.5,0.5))
    pageText:setFontSize(20)
    pageText:setString("")
    pageText:setColor(cc.c3b(255, 255, 255))
    huangzi_yangxindian:appendComponent(pageText)
    pageText:setPositionInContainer(cc.p(480,592.5))
    table_huangzi_yangxindian["pageText"] = pageText

    return table_huangzi_yangxindian

end

