function createxunfangPopup()

    local table_xunfangPopup = {}

    local xunfangPopup = fc.FContainerPanel:create()
    xunfangPopup:setSize(cc.size(960,640))
    table_xunfangPopup["xunfangPopup"] = xunfangPopup

    local mailAttackmentBottom = fc.FContainerPanel:create()
    mailAttackmentBottom:setSize(cc.size(538,495))
    mailAttackmentBottom:setAnchorPoint(cc.p(0.5,0.5))
    xunfangPopup:appendComponent(mailAttackmentBottom)
    mailAttackmentBottom:setPositionInContainer(cc.p(480,319.5))
    table_xunfangPopup["mailAttackmentBottom"] = mailAttackmentBottom

    local bgLT = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bgLT:setSize(cc.size(412,420))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(268,250))
    table_xunfangPopup["bgLT"] = bgLT

    local juanzhou = fc.FExtensionsImage:create()
    juanzhou:setImage("nobatch/shengzhi_zhou.png")
    juanzhou:setSize(cc.size(52,534))
    juanzhou:setRotation(90)
    juanzhou:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(juanzhou)
    juanzhou:setPositionInContainer(cc.p(268,30))
    table_xunfangPopup["juanzhou"] = juanzhou

    local juanzhou = fc.FExtensionsImage:create()
    juanzhou:setImage("nobatch/shengzhi_zhou.png")
    juanzhou:setSize(cc.size(52,534))
    juanzhou:setRotation(90)
    juanzhou:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(juanzhou)
    juanzhou:setPositionInContainer(cc.p(268,464))
    table_xunfangPopup["juanzhou"] = juanzhou

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(34,33))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    mailAttackmentBottom:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(495,33.5))
    table_xunfangPopup["close_btn"] = close_btn

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg:setSize(cc.size(260,50))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(278,30))
    table_xunfangPopup["title_bg"] = title_bg

    local ui_ling = fc.FExtensionsImage:create()
    ui_ling:setImage("batch_ui/ling_uizi.png")
    ui_ling:setSize(cc.size(32,32))
    ui_ling:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_ling)
    ui_ling:setPositionInContainer(cc.p(222,30))
    table_xunfangPopup["ui_ling"] = ui_ling

    local ui_qu = fc.FExtensionsImage:create()
    ui_qu:setImage("batch_ui/qu_uizi.png")
    ui_qu:setSize(cc.size(32,32))
    ui_qu:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_qu)
    ui_qu:setPositionInContainer(cc.p(254,30))
    table_xunfangPopup["ui_qu"] = ui_qu

    local ui_jiang = fc.FExtensionsImage:create()
    ui_jiang:setImage("batch_ui/jiang2_uizi.png")
    ui_jiang:setSize(cc.size(32,32))
    ui_jiang:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_jiang)
    ui_jiang:setPositionInContainer(cc.p(286,30))
    table_xunfangPopup["ui_jiang"] = ui_jiang

    local ui_li = fc.FExtensionsImage:create()
    ui_li:setImage("batch_ui/li3_uizi.png")
    ui_li:setSize(cc.size(32,32))
    ui_li:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_li)
    ui_li:setPositionInContainer(cc.p(318,30))
    table_xunfangPopup["ui_li"] = ui_li

    local ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    ui_rect3:setSize(cc.size(384,390))
    ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_rect3)
    ui_rect3:setPositionInContainer(cc.p(268,249))
    table_xunfangPopup["ui_rect3"] = ui_rect3

    local ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect1:setSize(cc.size(384,390))
    ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_rect1)
    ui_rect1:setPositionInContainer(cc.p(268,249))
    table_xunfangPopup["ui_rect1"] = ui_rect1

    local ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_rect2:setSize(cc.size(380,260))
    ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    mailAttackmentBottom:appendComponent(ui_rect2)
    ui_rect2:setPositionInContainer(cc.p(268,230))
    table_xunfangPopup["ui_rect2"] = ui_rect2

    local title_label = fc.FLabel:createSystemFont()
    title_label:setSize(cc.size(100,25))
    title_label:setAnchorPoint(cc.p(0.5,0.5))
    title_label:setFontSize(20)
    title_label:setString("")
    title_label:setColor(cc.c3b(206, 53, 0))
    mailAttackmentBottom:appendComponent(title_label)
    title_label:setPositionInContainer(cc.p(267,77.5))
    table_xunfangPopup["title_label"] = title_label

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(144,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/putonganniu1_up.png")
    mailAttackmentBottom:appendComponent(btn)
    btn:setPositionInContainer(cc.p(176,400.5))
    table_xunfangPopup["btn"] = btn

    local ling = fc.FShaderExtensionsImage:create(0)
    ling:setAnchorPoint(cc.p(0.5,0.5))
    ling:setImage("batch_ui/ling_uizi.png")
    ling:setSize(cc.size(32,32))
    btn:appendComponent(ling)
    ling:setPositionInContainer(cc.p(54,26))
    table_xunfangPopup["ling"] = ling

    local qu = fc.FShaderExtensionsImage:create(0)
    qu:setAnchorPoint(cc.p(0.5,0.5))
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    btn:appendComponent(qu)
    qu:setPositionInContainer(cc.p(90,26))
    table_xunfangPopup["qu"] = qu

    local btn_onemore = fc.FScaleButton:create()
    btn_onemore:setSize(cc.size(144,53))
    btn_onemore:setAnchorPoint(cc.p(0.5,0.5))
    btn_onemore:setButtonImage("batch_ui/putonganniu1_up.png")
    mailAttackmentBottom:appendComponent(btn_onemore)
    btn_onemore:setPositionInContainer(cc.p(359,400.5))
    table_xunfangPopup["btn_onemore"] = btn_onemore

    local zai = fc.FShaderExtensionsImage:create(0)
    zai:setAnchorPoint(cc.p(0.5,0.5))
    zai:setImage("batch_ui/zai_uizi (2).png")
    zai:setSize(cc.size(32,32))
    btn_onemore:appendComponent(zai)
    zai:setPositionInContainer(cc.p(28,26))
    table_xunfangPopup["zai"] = zai

    local chou = fc.FShaderExtensionsImage:create(0)
    chou:setAnchorPoint(cc.p(0.5,0.5))
    chou:setImage("batch_ui/chou_uizi.png")
    chou:setSize(cc.size(32,32))
    btn_onemore:appendComponent(chou)
    chou:setPositionInContainer(cc.p(57,26))
    table_xunfangPopup["chou"] = chou

    local yi = fc.FShaderExtensionsImage:create(0)
    yi:setAnchorPoint(cc.p(0.5,0.5))
    yi:setImage("batch_ui/yi_uizi.png")
    yi:setSize(cc.size(32,32))
    btn_onemore:appendComponent(yi)
    yi:setPositionInContainer(cc.p(86,26))
    table_xunfangPopup["yi"] = yi

    local ci = fc.FShaderExtensionsImage:create(0)
    ci:setAnchorPoint(cc.p(0.5,0.5))
    ci:setImage("batch_ui/ci_uizi (2).png")
    ci:setSize(cc.size(32,32))
    btn_onemore:appendComponent(ci)
    ci:setPositionInContainer(cc.p(115,26))
    table_xunfangPopup["ci"] = ci

    local itempanel1 = fc.FContainerPanel:create()
    itempanel1:setSize(cc.size(200,200))
    itempanel1:setAnchorPoint(cc.p(0.5,0.5))
    xunfangPopup:appendComponent(itempanel1)
    itempanel1:setPositionInContainer(cc.p(502,293))
    table_xunfangPopup["itempanel1"] = itempanel1

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    bg:setSize(cc.size(150,200))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(bg)
    bg:setPositionInContainer(cc.p(75,100))
    table_xunfangPopup["bg"] = bg

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(frame)
    frame:setPositionInContainer(cc.p(75.5,75))
    table_xunfangPopup["frame"] = frame

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(114,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(line)
    line:setPositionInContainer(cc.p(75,139))
    table_xunfangPopup["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(114,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(line)
    line:setPositionInContainer(cc.p(75,181))
    table_xunfangPopup["line"] = line

    local name = fc.FLabel:createSystemFont()
    name:setSize(cc.size(100,25))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("")
    name:setColor(cc.c3b(0, 0, 0))
    itempanel1:appendComponent(name)
    name:setPositionInContainer(cc.p(75,156.5))
    table_xunfangPopup["name"] = name

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/baipinzhi_kuang.png")
    image:setSize(cc.size(90,90))
    image:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(image)
    image:setPositionInContainer(cc.p(75.5,75))
    table_xunfangPopup["image"] = image

    local suipianIcon = fc.FExtensionsImage:create()
    suipianIcon:setImage("batch_ui/suipian_junjichu.png")
    suipianIcon:setSize(cc.size(70,55))
    suipianIcon:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(suipianIcon)
    suipianIcon:setPositionInContainer(cc.p(148,113.5))
    table_xunfangPopup["suipianIcon"] = suipianIcon

    local hunpoIcon = fc.FExtensionsImage:create()
    hunpoIcon:setImage("batch_ui/hunpi_biaozhi.png")
    hunpoIcon:setSize(cc.size(42,61))
    hunpoIcon:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(hunpoIcon)
    hunpoIcon:setPositionInContainer(cc.p(129,110.5))
    table_xunfangPopup["hunpoIcon"] = hunpoIcon

    return table_xunfangPopup

end

