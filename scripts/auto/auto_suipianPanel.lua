function createsuipianPanel()

    local table_suipianPanel = {}

    local suipianPanel = fc.FContainerPanel:create()
    suipianPanel:setSize(cc.size(960,640))
    table_suipianPanel["suipianPanel"] = suipianPanel

    local btnDetial = fc.FScaleButton:create()
    btnDetial:setSize(cc.size(144,53))
    btnDetial:setAnchorPoint(cc.p(0.5,0.5))
    btnDetial:setButtonImage("batch_ui/putonganniu1_up.png")
    suipianPanel:appendComponent(btnDetial)
    btnDetial:setPositionInContainer(cc.p(644,606.5))
    table_suipianPanel["btnDetial"] = btnDetial

    local cha = fc.FExtensionsImage:create()
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    cha:setAnchorPoint(cc.p(0.5,0.5))
    btnDetial:appendComponent(cha)
    cha:setPositionInContainer(cc.p(31,26))
    table_suipianPanel["cha"] = cha

    local kan = fc.FExtensionsImage:create()
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    kan:setAnchorPoint(cc.p(0.5,0.5))
    btnDetial:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_suipianPanel["kan"] = kan

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    btnDetial:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(82,26))
    table_suipianPanel["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    btnDetial:appendComponent(qing)
    qing:setPositionInContainer(cc.p(108,26))
    table_suipianPanel["qing"] = qing

    local btnMerge = fc.FScaleButton:create()
    btnMerge:setSize(cc.size(144,53))
    btnMerge:setAnchorPoint(cc.p(0.5,0.5))
    btnMerge:setButtonImage("batch_ui/putonganniu1_up.png")
    suipianPanel:appendComponent(btnMerge)
    btnMerge:setPositionInContainer(cc.p(818,606.5))
    table_suipianPanel["btnMerge"] = btnMerge

    local he = fc.FExtensionsImage:create()
    he:setImage("batch_ui/he_uizi.png")
    he:setSize(cc.size(32,32))
    he:setAnchorPoint(cc.p(0.5,0.5))
    btnMerge:appendComponent(he)
    he:setPositionInContainer(cc.p(43,26))
    table_suipianPanel["he"] = he

    local cheng = fc.FExtensionsImage:create()
    cheng:setImage("batch_ui/cheng_uizi.png")
    cheng:setSize(cc.size(32,32))
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    btnMerge:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(98,26))
    table_suipianPanel["cheng"] = cheng

    local bottombg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    bottombg:setSize(cc.size(510,60))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    suipianPanel:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(301,603))
    table_suipianPanel["bottombg"] = bottombg

    local bottomText = fc.FLabel:createBMFont()
    bottomText:setSize(cc.size(300,30))
    bottomText:setAnchorPoint(cc.p(0.5,0.5))
    bottomText:setFontSize(20)
    bottomText:setString("名字五个字")
    bottomText:setColor(cc.c3b(91,24,6))
    suipianPanel:appendComponent(bottomText)
    bottomText:setPositionInContainer(cc.p(301,603))
    table_suipianPanel["bottomText"] = bottomText

    local btnZhaomu = fc.FScaleButton:create()
    btnZhaomu:setSize(cc.size(144,53))
    btnZhaomu:setAnchorPoint(cc.p(0.5,0.5))
    btnZhaomu:setButtonImage("batch_ui/putonganniu1_up.png")
    suipianPanel:appendComponent(btnZhaomu)
    btnZhaomu:setPositionInContainer(cc.p(818,606.5))
    table_suipianPanel["btnZhaomu"] = btnZhaomu

    local zhao = fc.FExtensionsImage:create()
    zhao:setImage("batch_ui/zhao_uizi.png")
    zhao:setSize(cc.size(32,32))
    zhao:setAnchorPoint(cc.p(0.5,0.5))
    btnZhaomu:appendComponent(zhao)
    zhao:setPositionInContainer(cc.p(43,26))
    table_suipianPanel["zhao"] = zhao

    local mu = fc.FExtensionsImage:create()
    mu:setImage("batch_ui/mu_uizi.png")
    mu:setSize(cc.size(32,32))
    mu:setAnchorPoint(cc.p(0.5,0.5))
    btnZhaomu:appendComponent(mu)
    mu:setPositionInContainer(cc.p(99,26))
    table_suipianPanel["mu"] = mu

    return table_suipianPanel

end

