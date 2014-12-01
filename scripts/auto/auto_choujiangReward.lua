function createchoujiangReward()

    local table_choujiangReward = {}

    local choujiangReward = fc.FContainerPanel:create()
    choujiangReward:setSize(cc.size(960,640))
    table_choujiangReward["choujiangReward"] = choujiangReward

    local blackbg = fc.FExtensionsImage:create()
    blackbg:setImage("batch_ui/blackBG.png")
    blackbg:setSize(cc.size(2000,2000))
    blackbg:setAnchorPoint(cc.p(0.5,0.5))
    choujiangReward:appendComponent(blackbg)
    blackbg:setPositionInContainer(cc.p(480,320))
    table_choujiangReward["blackbg"] = blackbg

    local box = fc.FContainerPanel:create()
    box:setSize(cc.size(100,100))
    box:setAnchorPoint(cc.p(0.5,0.5))
    choujiangReward:appendComponent(box)
    box:setPositionInContainer(cc.p(480,153))
    table_choujiangReward["box"] = box

    local item10s = fc.FContainerPanel:create()
    item10s:setSize(cc.size(100,100))
    item10s:setAnchorPoint(cc.p(0.5,0.5))
    choujiangReward:appendComponent(item10s)
    item10s:setPositionInContainer(cc.p(230,324))
    table_choujiangReward["item10s"] = item10s

    local item10e = fc.FContainerPanel:create()
    item10e:setSize(cc.size(100,100))
    item10e:setAnchorPoint(cc.p(0.5,0.5))
    choujiangReward:appendComponent(item10e)
    item10e:setPositionInContainer(cc.p(730,483))
    table_choujiangReward["item10e"] = item10e

    local item1 = fc.FContainerPanel:create()
    item1:setSize(cc.size(100,100))
    item1:setAnchorPoint(cc.p(0.5,0.5))
    choujiangReward:appendComponent(item1)
    item1:setPositionInContainer(cc.p(480,402))
    table_choujiangReward["item1"] = item1

    local btnOk = fc.FScaleButton:create()
    btnOk:setSize(cc.size(144,53))
    btnOk:setAnchorPoint(cc.p(0.5,0.5))
    btnOk:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiangReward:appendComponent(btnOk)
    btnOk:setPositionInContainer(cc.p(608,598.5))
    table_choujiangReward["btnOk"] = btnOk

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    btnOk:appendComponent(que)
    que:setPositionInContainer(cc.p(43,26))
    table_choujiangReward["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    btnOk:appendComponent(ding)
    ding:setPositionInContainer(cc.p(98,26))
    table_choujiangReward["ding"] = ding

    local btnAgain = fc.FScaleButton:create()
    btnAgain:setSize(cc.size(144,53))
    btnAgain:setAnchorPoint(cc.p(0.5,0.5))
    btnAgain:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiangReward:appendComponent(btnAgain)
    btnAgain:setPositionInContainer(cc.p(352,598.5))
    table_choujiangReward["btnAgain"] = btnAgain

    local zai = fc.FShaderExtensionsImage:create(0)
    zai:setAnchorPoint(cc.p(0.5,0.5))
    zai:setImage("batch_ui/zai_uizi (2).png")
    zai:setSize(cc.size(32,32))
    btnAgain:appendComponent(zai)
    zai:setPositionInContainer(cc.p(33,26))
    table_choujiangReward["zai"] = zai

    local chou = fc.FShaderExtensionsImage:create(0)
    chou:setAnchorPoint(cc.p(0.5,0.5))
    chou:setImage("batch_ui/chou_uizi.png")
    chou:setSize(cc.size(32,32))
    btnAgain:appendComponent(chou)
    chou:setPositionInContainer(cc.p(58,26))
    table_choujiangReward["chou"] = chou

    local yi = fc.FShaderExtensionsImage:create(0)
    yi:setAnchorPoint(cc.p(0.5,0.5))
    yi:setImage("batch_ui/yi_uizi.png")
    yi:setSize(cc.size(32,32))
    btnAgain:appendComponent(yi)
    yi:setPositionInContainer(cc.p(84,26))
    table_choujiangReward["yi"] = yi

    local ci = fc.FShaderExtensionsImage:create(0)
    ci:setAnchorPoint(cc.p(0.5,0.5))
    ci:setImage("batch_ui/ci_uizi (2).png")
    ci:setSize(cc.size(32,32))
    btnAgain:appendComponent(ci)
    ci:setPositionInContainer(cc.p(109,26))
    table_choujiangReward["ci"] = ci

    local btnMidOk = fc.FScaleButton:create()
    btnMidOk:setSize(cc.size(144,53))
    btnMidOk:setAnchorPoint(cc.p(0.5,0.5))
    btnMidOk:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiangReward:appendComponent(btnMidOk)
    btnMidOk:setPositionInContainer(cc.p(480,598.5))
    table_choujiangReward["btnMidOk"] = btnMidOk

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    btnMidOk:appendComponent(que)
    que:setPositionInContainer(cc.p(43,26))
    table_choujiangReward["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    btnMidOk:appendComponent(ding)
    ding:setPositionInContainer(cc.p(98,26))
    table_choujiangReward["ding"] = ding

    return table_choujiangReward

end

