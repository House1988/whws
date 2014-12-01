function createbingfaList()

    local table_bingfaList = {}

    local bingfaList = fc.FContainerPanel:create()
    bingfaList:setSize(cc.size(960,640))
    table_bingfaList["bingfaList"] = bingfaList

    local xuanzePanel = fc.FContainerPanel:create()
    xuanzePanel:setSize(cc.size(960,80))
    xuanzePanel:setAnchorPoint(cc.p(0.5,0.5))
    bingfaList:appendComponent(xuanzePanel)
    xuanzePanel:setPositionInContainer(cc.p(480,600))
    table_bingfaList["xuanzePanel"] = xuanzePanel

    local upgrade = fc.FScaleButton:create()
    upgrade:setSize(cc.size(144,53))
    upgrade:setAnchorPoint(cc.p(0.5,0.5))
    upgrade:setButtonImage("batch_ui/putonganniu1_up.png")
    xuanzePanel:appendComponent(upgrade)
    upgrade:setPositionInContainer(cc.p(866,40.5))
    table_bingfaList["upgrade"] = upgrade

    local sheng = fc.FExtensionsImage:create()
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    upgrade:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(47,26))
    table_bingfaList["sheng"] = sheng

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    upgrade:appendComponent(ji)
    ji:setPositionInContainer(cc.p(95,26))
    table_bingfaList["ji"] = ji

    local sell = fc.FScaleButton:create()
    sell:setSize(cc.size(144,53))
    sell:setAnchorPoint(cc.p(0.5,0.5))
    sell:setButtonImage("batch_ui/putonganniu1_up.png")
    xuanzePanel:appendComponent(sell)
    sell:setPositionInContainer(cc.p(130,40.5))
    table_bingfaList["sell"] = sell

    local chu = fc.FExtensionsImage:create()
    chu:setImage("batch_ui/chu1_uizi.png")
    chu:setSize(cc.size(32,32))
    chu:setAnchorPoint(cc.p(0.5,0.5))
    sell:appendComponent(chu)
    chu:setPositionInContainer(cc.p(48,26))
    table_bingfaList["chu"] = chu

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou_uizi.png")
    shou:setSize(cc.size(32,32))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    sell:appendComponent(shou)
    shou:setPositionInContainer(cc.p(96,26))
    table_bingfaList["shou"] = shou

    local detail = fc.FScaleButton:create()
    detail:setSize(cc.size(144,53))
    detail:setAnchorPoint(cc.p(0.5,0.5))
    detail:setButtonImage("batch_ui/putonganniu1_up.png")
    xuanzePanel:appendComponent(detail)
    detail:setPositionInContainer(cc.p(704,40.5))
    table_bingfaList["detail"] = detail

    local cha = fc.FExtensionsImage:create()
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    cha:setAnchorPoint(cc.p(0.5,0.5))
    detail:appendComponent(cha)
    cha:setPositionInContainer(cc.p(28,26))
    table_bingfaList["cha"] = cha

    local kan = fc.FExtensionsImage:create()
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    kan:setAnchorPoint(cc.p(0.5,0.5))
    detail:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_bingfaList["kan"] = kan

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    detail:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(87,26))
    table_bingfaList["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    detail:appendComponent(qing)
    qing:setPositionInContainer(cc.p(116,26))
    table_bingfaList["qing"] = qing

    local pagebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pagebg:setSize(cc.size(100,30))
    pagebg:setAnchorPoint(cc.p(0.5,0.5))
    xuanzePanel:appendComponent(pagebg)
    pagebg:setPositionInContainer(cc.p(480,41))
    table_bingfaList["pagebg"] = pagebg

    local pageText = fc.FLabel:createSystemFont()
    pageText:setSize(cc.size(100,25))
    pageText:setAnchorPoint(cc.p(0.5,0.5))
    pageText:setFontSize(20)
    pageText:setString("")
    pageText:setColor(cc.c3b(255, 255, 255))
    xuanzePanel:appendComponent(pageText)
    pageText:setPositionInContainer(cc.p(480,36.5))
    table_bingfaList["pageText"] = pageText

    local sellPanel = fc.FContainerPanel:create()
    sellPanel:setSize(cc.size(960,100))
    sellPanel:setAnchorPoint(cc.p(0.5,0.5))
    bingfaList:appendComponent(sellPanel)
    sellPanel:setPositionInContainer(cc.p(480,590))
    table_bingfaList["sellPanel"] = sellPanel

    local sellBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    sellBg:setSize(cc.size(750,80))
    sellBg:setAnchorPoint(cc.p(0.5,0.5))
    sellPanel:appendComponent(sellBg)
    sellBg:setPositionInContainer(cc.p(395,50))
    table_bingfaList["sellBg"] = sellBg

    local btnSell = fc.FScaleButton:create()
    btnSell:setSize(cc.size(144,53))
    btnSell:setAnchorPoint(cc.p(0.5,0.5))
    btnSell:setButtonImage("batch_ui/putonganniu1_up.png")
    sellPanel:appendComponent(btnSell)
    btnSell:setPositionInContainer(cc.p(852,50.5))
    table_bingfaList["btnSell"] = btnSell

    local chu = fc.FExtensionsImage:create()
    chu:setImage("batch_ui/chu1_uizi.png")
    chu:setSize(cc.size(32,32))
    chu:setAnchorPoint(cc.p(0.5,0.5))
    btnSell:appendComponent(chu)
    chu:setPositionInContainer(cc.p(48,26))
    table_bingfaList["chu"] = chu

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou_uizi.png")
    shou:setSize(cc.size(32,32))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    btnSell:appendComponent(shou)
    shou:setPositionInContainer(cc.p(96,26))
    table_bingfaList["shou"] = shou

    local sellCheck = fc.FCheckBox:create()
    sellCheck:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    sellCheck:setSize(cc.size(47,47))
    sellCheck:setAnchorPoint(cc.p(0.5,0.5))
    sellPanel:appendComponent(sellCheck)
    sellCheck:setPositionInContainer(cc.p(64.5,49.5))
    table_bingfaList["sellCheck"] = sellCheck

    local sellLabel = fc.FLabel:createBMFont()
    sellLabel:setSize(cc.size(150,30))
    sellLabel:setAnchorPoint(cc.p(0.5,0.5))
    sellLabel:setFontSize(20)
    sellLabel:setString("出售后可获得银两：")
    sellLabel:setColor(cc.c3b(91, 24, 6))
    sellPanel:appendComponent(sellLabel)
    sellLabel:setPositionInContainer(cc.p(371,50))
    table_bingfaList["sellLabel"] = sellLabel

    local quanxuan_label = fc.FContainerPanel:create()
    quanxuan_label:setSize(cc.size(60,30))
    quanxuan_label:setAnchorPoint(cc.p(0.5,0.5))
    sellPanel:appendComponent(quanxuan_label)
    quanxuan_label:setPositionInContainer(cc.p(117,50))
    table_bingfaList["quanxuan_label"] = quanxuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_bingfaList["quan"] = quan

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(44,16))
    table_bingfaList["xuan"] = xuan

    local shengjiPanel = fc.FContainerPanel:create()
    shengjiPanel:setSize(cc.size(960,100))
    shengjiPanel:setAnchorPoint(cc.p(0.5,0.5))
    bingfaList:appendComponent(shengjiPanel)
    shengjiPanel:setPositionInContainer(cc.p(480,590))
    table_bingfaList["shengjiPanel"] = shengjiPanel

    local sellBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    sellBg:setSize(cc.size(750,80))
    sellBg:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(sellBg)
    sellBg:setPositionInContainer(cc.p(395,50))
    table_bingfaList["sellBg"] = sellBg

    local btnUpgrade = fc.FScaleButton:create()
    btnUpgrade:setSize(cc.size(144,53))
    btnUpgrade:setAnchorPoint(cc.p(0.5,0.5))
    btnUpgrade:setButtonImage("batch_ui/putonganniu1_up.png")
    shengjiPanel:appendComponent(btnUpgrade)
    btnUpgrade:setPositionInContainer(cc.p(869,55.5))
    table_bingfaList["btnUpgrade"] = btnUpgrade

    local sheng = fc.FExtensionsImage:create()
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    btnUpgrade:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(47,26))
    table_bingfaList["sheng"] = sheng

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    btnUpgrade:appendComponent(ji)
    ji:setPositionInContainer(cc.p(95,26))
    table_bingfaList["ji"] = ji

    local shengjiCheck = fc.FCheckBox:create()
    shengjiCheck:setCheckBoxImage("batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/quanxuan_dikuang.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    shengjiCheck:setSize(cc.size(47,47))
    shengjiCheck:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(shengjiCheck)
    shengjiCheck:setPositionInContainer(cc.p(64.5,49.5))
    table_bingfaList["shengjiCheck"] = shengjiCheck

    local textBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBG:setSize(cc.size(100,30))
    textBG:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(textBG)
    textBG:setPositionInContainer(cc.p(359,36))
    table_bingfaList["textBG"] = textBG

    local xiaohaobingfa = fc.FLabel:createBMFont()
    xiaohaobingfa:setSize(cc.size(80,30))
    xiaohaobingfa:setAnchorPoint(cc.p(0.5,0.5))
    xiaohaobingfa:setFontSize(20)
    xiaohaobingfa:setString("消耗兵法：")
    xiaohaobingfa:setColor(cc.c3b(91, 24, 6))
    shengjiPanel:appendComponent(xiaohaobingfa)
    xiaohaobingfa:setPositionInContainer(cc.p(251,31))
    table_bingfaList["xiaohaobingfa"] = xiaohaobingfa

    local xiaohaobingfaText = fc.FLabel:createBMFont()
    xiaohaobingfaText:setSize(cc.size(80,30))
    xiaohaobingfaText:setAnchorPoint(cc.p(0.5,0.5))
    xiaohaobingfaText:setFontSize(20)
    xiaohaobingfaText:setString("消耗兵法：")
    xiaohaobingfaText:setColor(cc.c3b(139, 255, 240))
    shengjiPanel:appendComponent(xiaohaobingfaText)
    xiaohaobingfaText:setPositionInContainer(cc.p(359,32))
    table_bingfaList["xiaohaobingfaText"] = xiaohaobingfaText

    local textBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBG:setSize(cc.size(100,30))
    textBG:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(textBG)
    textBG:setPositionInContainer(cc.p(359,71))
    table_bingfaList["textBG"] = textBG

    local xuyaoyinliang = fc.FLabel:createBMFont()
    xuyaoyinliang:setSize(cc.size(80,30))
    xuyaoyinliang:setAnchorPoint(cc.p(0.5,0.5))
    xuyaoyinliang:setFontSize(20)
    xuyaoyinliang:setString("需要银两：")
    xuyaoyinliang:setColor(cc.c3b(91, 24, 6))
    shengjiPanel:appendComponent(xuyaoyinliang)
    xuyaoyinliang:setPositionInContainer(cc.p(251,66))
    table_bingfaList["xuyaoyinliang"] = xuyaoyinliang

    local xuyaoyinliangText = fc.FLabel:createBMFont()
    xuyaoyinliangText:setSize(cc.size(80,30))
    xuyaoyinliangText:setAnchorPoint(cc.p(0.5,0.5))
    xuyaoyinliangText:setFontSize(20)
    xuyaoyinliangText:setString("消耗兵法：")
    xuyaoyinliangText:setColor(cc.c3b(139, 255, 240))
    shengjiPanel:appendComponent(xuyaoyinliangText)
    xuyaoyinliangText:setPositionInContainer(cc.p(359,68))
    table_bingfaList["xuyaoyinliangText"] = xuyaoyinliangText

    local textBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBG:setSize(cc.size(100,30))
    textBG:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(textBG)
    textBG:setPositionInContainer(cc.p(643,34))
    table_bingfaList["textBG"] = textBG

    local textBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBG:setSize(cc.size(100,30))
    textBG:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(textBG)
    textBG:setPositionInContainer(cc.p(643,70))
    table_bingfaList["textBG"] = textBG

    local jingyan = fc.FLabel:createBMFont()
    jingyan:setSize(cc.size(80,30))
    jingyan:setAnchorPoint(cc.p(0.5,0.5))
    jingyan:setFontSize(20)
    jingyan:setString("可获得经验：")
    jingyan:setColor(cc.c3b(91, 24, 6))
    shengjiPanel:appendComponent(jingyan)
    jingyan:setPositionInContainer(cc.p(536,31))
    table_bingfaList["jingyan"] = jingyan

    local jingyanText = fc.FLabel:createBMFont()
    jingyanText:setSize(cc.size(80,30))
    jingyanText:setAnchorPoint(cc.p(0.5,0.5))
    jingyanText:setFontSize(20)
    jingyanText:setString("消耗兵法：")
    jingyanText:setColor(cc.c3b(139, 255, 240))
    shengjiPanel:appendComponent(jingyanText)
    jingyanText:setPositionInContainer(cc.p(643,31))
    table_bingfaList["jingyanText"] = jingyanText

    local dengji = fc.FLabel:createBMFont()
    dengji:setSize(cc.size(80,30))
    dengji:setAnchorPoint(cc.p(0.5,0.5))
    dengji:setFontSize(20)
    dengji:setString("可升至：")
    dengji:setColor(cc.c3b(91, 24, 6))
    shengjiPanel:appendComponent(dengji)
    dengji:setPositionInContainer(cc.p(536,66))
    table_bingfaList["dengji"] = dengji

    local dengjiText = fc.FLabel:createBMFont()
    dengjiText:setSize(cc.size(80,30))
    dengjiText:setAnchorPoint(cc.p(0.5,0.5))
    dengjiText:setFontSize(20)
    dengjiText:setString("消耗兵法：")
    dengjiText:setColor(cc.c3b(139, 255, 240))
    shengjiPanel:appendComponent(dengjiText)
    dengjiText:setPositionInContainer(cc.p(643,66))
    table_bingfaList["dengjiText"] = dengjiText

    local quanxuan_label = fc.FContainerPanel:create()
    quanxuan_label:setSize(cc.size(60,30))
    quanxuan_label:setAnchorPoint(cc.p(0.5,0.5))
    shengjiPanel:appendComponent(quanxuan_label)
    quanxuan_label:setPositionInContainer(cc.p(117,50))
    table_bingfaList["quanxuan_label"] = quanxuan_label

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan2_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(16,16))
    table_bingfaList["quan"] = quan

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    quanxuan_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(44,16))
    table_bingfaList["xuan"] = xuan

    local arrowL = fc.FScaleButton:create()
    arrowL:setSize(cc.size(38,60))
    arrowL:setAnchorPoint(cc.p(0.5,0.5))
    arrowL:setButtonImage("batch_ui/jiantou2.png")
    bingfaList:appendComponent(arrowL)
    arrowL:setPositionInContainer(cc.p(19,320))
    table_bingfaList["arrowL"] = arrowL

    local arrowR = fc.FScaleButton:create()
    arrowR:setSize(cc.size(38,60))
    arrowR:setAnchorPoint(cc.p(0.5,0.5))
    arrowR:setButtonImage("batch_ui/jiantou2.png")
    arrowR:setScaleX(-1)
    bingfaList:appendComponent(arrowR)
    arrowR:setPositionInContainer(cc.p(941,320))
    table_bingfaList["arrowR"] = arrowR

    return table_bingfaList

end

