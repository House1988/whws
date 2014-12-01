function createCanyeLueduo()

    local table_CanyeLueduo = {}

    local CanyeLueduo = fc.FContainerPanel:create()
    CanyeLueduo:setSize(cc.size(960,640))
    table_CanyeLueduo["CanyeLueduo"] = CanyeLueduo

    local bgLT = fc.FExtensionsImage:create()
    bgLT:setImage("nobatch/banzidikuang_tongyong.png")
    bgLT:setSize(cc.size(480,320))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(240,160))
    table_CanyeLueduo["bgLT"] = bgLT

    local bgLB = fc.FExtensionsImage:create()
    bgLB:setImage("nobatch/banzidikuang_tongyong.png")
    bgLB:setSize(cc.size(480,320))
    bgLB:setFlipType(4)
    bgLB:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(bgLB)
    bgLB:setPositionInContainer(cc.p(240,480))
    table_CanyeLueduo["bgLB"] = bgLB

    local bgRT = fc.FExtensionsImage:create()
    bgRT:setImage("nobatch/banzidikuang_tongyong.png")
    bgRT:setSize(cc.size(480,320))
    bgRT:setFlipType(2)
    bgRT:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(bgRT)
    bgRT:setPositionInContainer(cc.p(720,160))
    table_CanyeLueduo["bgRT"] = bgRT

    local bgRB = fc.FExtensionsImage:create()
    bgRB:setImage("nobatch/banzidikuang_tongyong.png")
    bgRB:setSize(cc.size(480,320))
    bgRB:setFlipType(8)
    bgRB:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(bgRB)
    bgRB:setPositionInContainer(cc.p(720,480))
    table_CanyeLueduo["bgRB"] = bgRB

    local titleL = fc.FExtensionsImage:create()
    titleL:setImage("nobatch/title_mingchen_.png")
    titleL:setSize(cc.size(480,67))
    titleL:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(titleL)
    titleL:setPositionInContainer(cc.p(240,33.5))
    table_CanyeLueduo["titleL"] = titleL

    local titleR = fc.FExtensionsImage:create()
    titleR:setImage("nobatch/title_mingchen_.png")
    titleR:setSize(cc.size(480,67))
    titleR:setFlipType(2)
    titleR:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(titleR)
    titleR:setPositionInContainer(cc.p(720,33.5))
    table_CanyeLueduo["titleR"] = titleR

    local clothL = fc.FExtensionsImage:create()
    clothL:setImage("batch_ui/title_mingchen_2.png")
    clothL:setSize(cc.size(62,121))
    clothL:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(clothL)
    clothL:setPositionInContainer(cc.p(31,60.5))
    table_CanyeLueduo["clothL"] = clothL

    local clothR = fc.FExtensionsImage:create()
    clothR:setImage("batch_ui/title_mingchen_2.png")
    clothR:setSize(cc.size(62,121))
    clothR:setFlipType(2)
    clothR:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(clothR)
    clothR:setPositionInContainer(cc.p(929,60.5))
    table_CanyeLueduo["clothR"] = clothR

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    CanyeLueduo:appendComponent(close)
    close:setPositionInContainer(cc.p(934,34))
    table_CanyeLueduo["close"] = close

    local labelBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    labelBg:setSize(cc.size(130,40))
    labelBg:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(labelBg)
    labelBg:setPositionInContainer(cc.p(806,34))
    table_CanyeLueduo["labelBg"] = labelBg

    local labelJunling = fc.FLabel:createBMFont()
    labelJunling:setSize(cc.size(50,44))
    labelJunling:setAnchorPoint(cc.p(0.5,0.5))
    labelJunling:setFontSize(20)
    labelJunling:setString("军令：")
    labelJunling:setColor(cc.c3b(139,255,240))
    CanyeLueduo:appendComponent(labelJunling)
    labelJunling:setPositionInContainer(cc.p(769,33))
    table_CanyeLueduo["labelJunling"] = labelJunling

    local junLingValue = fc.FLabel:createBMFont()
    junLingValue:setSize(cc.size(50,44))
    junLingValue:setAnchorPoint(cc.p(0.5,0.5))
    junLingValue:setFontSize(20)
    junLingValue:setString("军令：")
    junLingValue:setColor(cc.c3b(139,255,240))
    CanyeLueduo:appendComponent(junLingValue)
    junLingValue:setPositionInContainer(cc.p(837,33))
    table_CanyeLueduo["junLingValue"] = junLingValue

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(180,30))
    title:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(title)
    title:setPositionInContainer(cc.p(480,34))
    table_CanyeLueduo["title"] = title

    local can = fc.FExtensionsImage:create()
    can:setImage("batch_ui/can.png")
    can:setSize(cc.size(40,40))
    can:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(can)
    can:setPositionInContainer(cc.p(20,20))
    table_CanyeLueduo["can"] = can

    local ye = fc.FExtensionsImage:create()
    ye:setImage("batch_ui/ye.png")
    ye:setSize(cc.size(40,40))
    ye:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(ye)
    ye:setPositionInContainer(cc.p(67,20))
    table_CanyeLueduo["ye"] = ye

    local lue = fc.FExtensionsImage:create()
    lue:setImage("batch_ui/lue.png")
    lue:setSize(cc.size(40,40))
    lue:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(lue)
    lue:setPositionInContainer(cc.p(113,20))
    table_CanyeLueduo["lue"] = lue

    local duo = fc.FExtensionsImage:create()
    duo:setImage("batch_ui/duo.png")
    duo:setSize(cc.size(40,40))
    duo:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(duo)
    duo:setPositionInContainer(cc.p(160,20))
    table_CanyeLueduo["duo"] = duo

    local bottomBg = fc.FExtensionsImage:create()
    bottomBg:setImage("nobatch/banzidikuang_tongyong.png")
    bottomBg:setSize(cc.size(960,640))
    bottomBg:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(bottomBg)
    bottomBg:setPositionInContainer(cc.p(480,889))
    table_CanyeLueduo["bottomBg"] = bottomBg

    local bottomBgFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    bottomBgFrame:setSize(cc.size(960,400))
    bottomBgFrame:setAnchorPoint(cc.p(0.5,0.5))
    CanyeLueduo:appendComponent(bottomBgFrame)
    bottomBgFrame:setPositionInContainer(cc.p(480,769))
    table_CanyeLueduo["bottomBgFrame"] = bottomBgFrame

    local changeBtn = fc.FScaleButton:create()
    changeBtn:setSize(cc.size(144,53))
    changeBtn:setAnchorPoint(cc.p(0.5,0.5))
    changeBtn:setButtonImage("batch_ui/putonganniu1_up.png")
    CanyeLueduo:appendComponent(changeBtn)
    changeBtn:setPositionInContainer(cc.p(480,610.5))
    table_CanyeLueduo["changeBtn"] = changeBtn

    local btn_huan = fc.FShaderExtensionsImage:create(0)
    btn_huan:setAnchorPoint(cc.p(0.5,0.5))
    btn_huan:setImage("batch_ui/huan_uizi.png")
    btn_huan:setSize(cc.size(32,32))
    changeBtn:appendComponent(btn_huan)
    btn_huan:setPositionInContainer(cc.p(19,26))
    table_CanyeLueduo["btn_huan"] = btn_huan

    local btn_yi = fc.FShaderExtensionsImage:create(0)
    btn_yi:setAnchorPoint(cc.p(0.5,0.5))
    btn_yi:setImage("batch_ui/yi_uizi.png")
    btn_yi:setSize(cc.size(32,32))
    changeBtn:appendComponent(btn_yi)
    btn_yi:setPositionInContainer(cc.p(45,26))
    table_CanyeLueduo["btn_yi"] = btn_yi

    local btn_pi = fc.FShaderExtensionsImage:create(0)
    btn_pi:setAnchorPoint(cc.p(0.5,0.5))
    btn_pi:setImage("batch_ui/pi_uizi.png")
    btn_pi:setSize(cc.size(32,32))
    changeBtn:appendComponent(btn_pi)
    btn_pi:setPositionInContainer(cc.p(71,26))
    table_CanyeLueduo["btn_pi"] = btn_pi

    local btn_dui = fc.FShaderExtensionsImage:create(0)
    btn_dui:setAnchorPoint(cc.p(0.5,0.5))
    btn_dui:setImage("batch_ui/dui_uizi.png")
    btn_dui:setSize(cc.size(32,32))
    changeBtn:appendComponent(btn_dui)
    btn_dui:setPositionInContainer(cc.p(99,26))
    table_CanyeLueduo["btn_dui"] = btn_dui

    local btn_shou = fc.FShaderExtensionsImage:create(0)
    btn_shou:setAnchorPoint(cc.p(0.5,0.5))
    btn_shou:setImage("batch_ui/shou2_uizi.png")
    btn_shou:setSize(cc.size(32,32))
    changeBtn:appendComponent(btn_shou)
    btn_shou:setPositionInContainer(cc.p(124,26))
    table_CanyeLueduo["btn_shou"] = btn_shou

    local disBtn = fc.FScaleButton:create()
    disBtn:setSize(cc.size(144,53))
    disBtn:setAnchorPoint(cc.p(0.5,0.5))
    disBtn:setButtonImage("batch_ui/putonganniu1_up.png")
    CanyeLueduo:appendComponent(disBtn)
    disBtn:setPositionInContainer(cc.p(480,610.5))
    table_CanyeLueduo["disBtn"] = disBtn

    local disLabel = fc.FLabel:createBMFont()
    disLabel:setSize(cc.size(50,44))
    disLabel:setAnchorPoint(cc.p(0.5,0.5))
    disLabel:setFontSize(20)
    disLabel:setString("军令：")
    disLabel:setColor(cc.c3b(91,24,6))
    CanyeLueduo:appendComponent(disLabel)
    disLabel:setPositionInContainer(cc.p(480,607))
    table_CanyeLueduo["disLabel"] = disLabel

    return table_CanyeLueduo

end

