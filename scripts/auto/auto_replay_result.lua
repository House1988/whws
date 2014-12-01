function createreplay_result()

    local table_replay_result = {}

    local replay_result = fc.FContainerPanel:create()
    replay_result:setSize(cc.size(960,640))
    table_replay_result["replay_result"] = replay_result

    local rr_panel = fc.FContainerPanel:create()
    rr_panel:setSize(cc.size(700,600))
    rr_panel:setAnchorPoint(cc.p(0.5,0.5))
    replay_result:appendComponent(rr_panel)
    rr_panel:setPositionInContainer(cc.p(480,320))
    table_replay_result["rr_panel"] = rr_panel

    local bgL = fc.FShaderExtensionsImage:create(0)
    bgL:setAnchorPoint(cc.p(0.5,0.5))
    bgL:setImage("nobatch/shengli.png")
    bgL:setSize(cc.size(202,488))
    rr_panel:appendComponent(bgL)
    bgL:setPositionInContainer(cc.p(249,330))
    table_replay_result["bgL"] = bgL

    local bgR = fc.FShaderExtensionsImage:create(0)
    bgR:setAnchorPoint(cc.p(0.5,0.5))
    bgR:setImage("nobatch/shengli.png")
    bgR:setSize(cc.size(202,488))
    rr_panel:appendComponent(bgR)
    bgR:setPositionInContainer(cc.p(451,330))
    table_replay_result["bgR"] = bgR

    bgR:setFlipType(2)
    local titlebg = fc.FShaderExtensionsImage:create(0)
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    titlebg:setImage("nobatch/shengli_biaotikuang.png")
    titlebg:setSize(cc.size(578,87))
    rr_panel:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(350,73.5))
    table_replay_result["titlebg"] = titlebg

    local lineL = fc.FShaderExtensionsImage:create(0)
    lineL:setAnchorPoint(cc.p(0.5,0.5))
    lineL:setImage("batch_ui/sheng_shengli.png")
    lineL:setSize(cc.size(27,73))
    rr_panel:appendComponent(lineL)
    lineL:setPositionInContainer(cc.p(211.5,36.5))
    table_replay_result["lineL"] = lineL

    local midOkBtn = fc.FScaleButton:create()
    midOkBtn:setSize(cc.size(144,53))
    midOkBtn:setAnchorPoint(cc.p(0.5,0.5))
    midOkBtn:setButtonImage("batch_ui/putonganniu1_up.png")
    rr_panel:appendComponent(midOkBtn)
    midOkBtn:setPositionInContainer(cc.p(350,408.5))
    table_replay_result["midOkBtn"] = midOkBtn

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    midOkBtn:appendComponent(que)
    que:setPositionInContainer(cc.p(45,26))
    table_replay_result["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    midOkBtn:appendComponent(ding)
    ding:setPositionInContainer(cc.p(94,26))
    table_replay_result["ding"] = ding

    local lineR = fc.FShaderExtensionsImage:create(0)
    lineR:setAnchorPoint(cc.p(0.5,0.5))
    lineR:setImage("batch_ui/sheng_shengli.png")
    lineR:setSize(cc.size(27,73))
    rr_panel:appendComponent(lineR)
    lineR:setPositionInContainer(cc.p(489.5,36.5))
    table_replay_result["lineR"] = lineR

    local sui1 = fc.FExtensionsImage:create()
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    rr_panel:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(108,166.5))
    table_replay_result["sui1"] = sui1

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    rr_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(592,166.5))
    table_replay_result["sui2"] = sui2

    local rr_label = fc.FLabel:createBMFont()
    rr_label:setSize(cc.size(80,30))
    rr_label:setAnchorPoint(cc.p(0.5,0.5))
    rr_label:setFontSize(21)
    rr_label:setString("+99999")
    rr_label:setColor(cc.c3b(91,24,6))
    rr_panel:appendComponent(rr_label)
    rr_label:setPositionInContainer(cc.p(350,210))
    table_replay_result["rr_label"] = rr_label

    return table_replay_result

end

