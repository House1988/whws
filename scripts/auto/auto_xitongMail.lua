function createxitongMail()

    local table_xitongMail = {}

    local xitongMail = fc.FContainerPanel:create()
    xitongMail:setSize(cc.size(960,640))
    table_xitongMail["xitongMail"] = xitongMail

    local bgLT = fc.FExtensionsImage:create()
    bgLT:setImage("nobatch/banzidikuang_tongyong.png")
    bgLT:setSize(cc.size(480,320))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(240,160))
    table_xitongMail["bgLT"] = bgLT

    local bgLB = fc.FExtensionsImage:create()
    bgLB:setImage("nobatch/banzidikuang_tongyong.png")
    bgLB:setSize(cc.size(480,320))
    bgLB:setFlipType(4)
    bgLB:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(bgLB)
    bgLB:setPositionInContainer(cc.p(240,480))
    table_xitongMail["bgLB"] = bgLB

    local bgRT = fc.FExtensionsImage:create()
    bgRT:setImage("nobatch/banzidikuang_tongyong.png")
    bgRT:setSize(cc.size(480,320))
    bgRT:setFlipType(2)
    bgRT:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(bgRT)
    bgRT:setPositionInContainer(cc.p(720,160))
    table_xitongMail["bgRT"] = bgRT

    local bgRB = fc.FExtensionsImage:create()
    bgRB:setImage("nobatch/banzidikuang_tongyong.png")
    bgRB:setSize(cc.size(480,320))
    bgRB:setFlipType(8)
    bgRB:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(bgRB)
    bgRB:setPositionInContainer(cc.p(720,480))
    table_xitongMail["bgRB"] = bgRB

    local titleL = fc.FExtensionsImage:create()
    titleL:setImage("nobatch/title_mingchen_.png")
    titleL:setSize(cc.size(480,67))
    titleL:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(titleL)
    titleL:setPositionInContainer(cc.p(240,33.5))
    table_xitongMail["titleL"] = titleL

    local titleR = fc.FExtensionsImage:create()
    titleR:setImage("nobatch/title_mingchen_.png")
    titleR:setSize(cc.size(480,67))
    titleR:setFlipType(2)
    titleR:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(titleR)
    titleR:setPositionInContainer(cc.p(720,33.5))
    table_xitongMail["titleR"] = titleR

    local clothL = fc.FExtensionsImage:create()
    clothL:setImage("batch_ui/title_mingchen_2.png")
    clothL:setSize(cc.size(62,121))
    clothL:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(clothL)
    clothL:setPositionInContainer(cc.p(31,60.5))
    table_xitongMail["clothL"] = clothL

    local clothR = fc.FExtensionsImage:create()
    clothR:setImage("batch_ui/title_mingchen_2.png")
    clothR:setSize(cc.size(62,121))
    clothR:setFlipType(2)
    clothR:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(clothR)
    clothR:setPositionInContainer(cc.p(929,60.5))
    table_xitongMail["clothR"] = clothR

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    xitongMail:appendComponent(close)
    close:setPositionInContainer(cc.p(934,34))
    table_xitongMail["close"] = close

    local arrowL = fc.FScaleButton:create()
    arrowL:setSize(cc.size(38,60))
    arrowL:setAnchorPoint(cc.p(0.5,0.5))
    arrowL:setButtonImage("batch_ui/jiantou2.png")
    xitongMail:appendComponent(arrowL)
    arrowL:setPositionInContainer(cc.p(31,329))
    table_xitongMail["arrowL"] = arrowL

    local arrowR = fc.FScaleButton:create()
    arrowR:setSize(cc.size(38,60))
    arrowR:setAnchorPoint(cc.p(0.5,0.5))
    arrowR:setButtonImage("batch_ui/jiantou2.png")
    arrowR:setScaleX(-1)
    xitongMail:appendComponent(arrowR)
    arrowR:setPositionInContainer(cc.p(929,329))
    table_xitongMail["arrowR"] = arrowR

    local bottombg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    bottombg:setSize(cc.size(200,35))
    bottombg:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(bottombg)
    bottombg:setPositionInContainer(cc.p(480,622.5))
    table_xitongMail["bottombg"] = bottombg

    local downLabel = fc.FLabel:createSystemFont()
    downLabel:setSize(cc.size(100,40))
    downLabel:setAnchorPoint(cc.p(0.5,0.5))
    downLabel:setFontSize(21)
    downLabel:setString("aaaaaaaa")
    downLabel:setColor(cc.c3b(255,255,255))
    xitongMail:appendComponent(downLabel)
    downLabel:setPositionInContainer(cc.p(480,619))
    table_xitongMail["downLabel"] = downLabel

    local titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(66,0,2,29))
    titlebg:setSize(cc.size(800,29))
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    titlebg:setScaleY(-1)
    xitongMail:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(480,78.5))
    table_xitongMail["titlebg"] = titlebg

    local titleText = fc.FLabel:createSystemFont()
    titleText:setSize(cc.size(100,24))
    titleText:setAnchorPoint(cc.p(0.5,0.5))
    titleText:setFontSize(21)
    titleText:setString("aaaaaaaa")
    titleText:setColor(cc.c3b(250,255,165))
    xitongMail:appendComponent(titleText)
    titleText:setPositionInContainer(cc.p(480,74))
    table_xitongMail["titleText"] = titleText

    local xitongBtn = fc.FRadioButton:create()
    xitongBtn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    xitongBtn:setSize(cc.size(159,45))
    xitongBtn:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(xitongBtn)
    xitongBtn:setPositionInContainer(cc.p(347.5,33.5))
    table_xitongMail["xitongBtn"] = xitongBtn

    local xitong_label = fc.FContainerPanel:create()
    xitong_label:setSize(cc.size(80,30))
    xitong_label:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(xitong_label)
    xitong_label:setPositionInContainer(cc.p(348,34))
    table_xitongMail["xitong_label"] = xitong_label

    local xi = fc.FExtensionsImage:create()
    xi:setImage("batch_ui/xi3_uizi.png")
    xi:setSize(cc.size(32,32))
    xi:setAnchorPoint(cc.p(0.5,0.5))
    xitong_label:appendComponent(xi)
    xi:setPositionInContainer(cc.p(16,16))
    table_xitongMail["xi"] = xi

    local tong = fc.FExtensionsImage:create()
    tong:setImage("batch_ui/tong1_uizi.png")
    tong:setSize(cc.size(32,32))
    tong:setAnchorPoint(cc.p(0.5,0.5))
    xitong_label:appendComponent(tong)
    tong:setPositionInContainer(cc.p(64,16))
    table_xitongMail["tong"] = tong

    local pvpBtn = fc.FRadioButton:create()
    pvpBtn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    pvpBtn:setSize(cc.size(159,45))
    pvpBtn:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(pvpBtn)
    pvpBtn:setPositionInContainer(cc.p(618.5,33.5))
    table_xitongMail["pvpBtn"] = pvpBtn

    local pvp_label = fc.FContainerPanel:create()
    pvp_label:setSize(cc.size(80,30))
    pvp_label:setAnchorPoint(cc.p(0.5,0.5))
    xitongMail:appendComponent(pvp_label)
    pvp_label:setPositionInContainer(cc.p(618,34))
    table_xitongMail["pvp_label"] = pvp_label

    local zhan = fc.FExtensionsImage:create()
    zhan:setImage("batch_ui/zhan_uizi.png")
    zhan:setSize(cc.size(32,32))
    zhan:setAnchorPoint(cc.p(0.5,0.5))
    pvp_label:appendComponent(zhan)
    zhan:setPositionInContainer(cc.p(16,16))
    table_xitongMail["zhan"] = zhan

    local bao = fc.FExtensionsImage:create()
    bao:setImage("batch_ui/bao2_uizi.png")
    bao:setSize(cc.size(32,32))
    bao:setAnchorPoint(cc.p(0.5,0.5))
    pvp_label:appendComponent(bao)
    bao:setPositionInContainer(cc.p(64,16))
    table_xitongMail["bao"] = bao

    return table_xitongMail

end

