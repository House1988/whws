function createbingfaCanYe()

    local table_bingfaCanYe = {}

    local bingfaCanYe = fc.FContainerPanel:create()
    bingfaCanYe:setSize(cc.size(960,640))
    table_bingfaCanYe["bingfaCanYe"] = bingfaCanYe

    local canYebglt = fc.FExtensionsImage:create()
    canYebglt:setImage("nobatch/dikuang1_baowuqiangduo.png")
    canYebglt:setSize(cc.size(271,200))
    canYebglt:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYebglt)
    canYebglt:setPositionInContainer(cc.p(175.5,170))
    table_bingfaCanYe["canYebglt"] = canYebglt

    local canYebgrt = fc.FExtensionsImage:create()
    canYebgrt:setImage("nobatch/dikuang1_baowuqiangduo.png")
    canYebgrt:setSize(cc.size(271,200))
    canYebgrt:setFlipType(2)
    canYebgrt:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYebgrt)
    canYebgrt:setPositionInContainer(cc.p(446.5,170))
    table_bingfaCanYe["canYebgrt"] = canYebgrt

    local canYebglb = fc.FExtensionsImage:create()
    canYebglb:setImage("nobatch/dikuang1_baowuqiangduo.png")
    canYebglb:setSize(cc.size(271,200))
    canYebglb:setFlipType(4)
    canYebglb:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYebglb)
    canYebglb:setPositionInContainer(cc.p(175.5,370))
    table_bingfaCanYe["canYebglb"] = canYebglb

    local canYebgrb = fc.FExtensionsImage:create()
    canYebgrb:setImage("nobatch/dikuang1_baowuqiangduo.png")
    canYebgrb:setSize(cc.size(271,200))
    canYebgrb:setFlipType(8)
    canYebgrb:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYebgrb)
    canYebgrb:setPositionInContainer(cc.p(446.5,370))
    table_bingfaCanYe["canYebgrb"] = canYebgrb

    local canYeFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    canYeFrame:setSize(cc.size(542,400))
    canYeFrame:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYeFrame)
    canYeFrame:setPositionInContainer(cc.p(311,270))
    table_bingfaCanYe["canYeFrame"] = canYeFrame

    local canYeRoundlt = fc.FExtensionsImage:create()
    canYeRoundlt:setImage("nobatch/dikuang4_baowuqiangduo.png")
    canYeRoundlt:setSize(cc.size(181,181))
    canYeRoundlt:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYeRoundlt)
    canYeRoundlt:setPositionInContainer(cc.p(220.5,179.5))
    table_bingfaCanYe["canYeRoundlt"] = canYeRoundlt

    local canYeRoundrt = fc.FExtensionsImage:create()
    canYeRoundrt:setImage("nobatch/dikuang4_baowuqiangduo.png")
    canYeRoundrt:setSize(cc.size(181,181))
    canYeRoundrt:setFlipType(2)
    canYeRoundrt:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYeRoundrt)
    canYeRoundrt:setPositionInContainer(cc.p(401.5,179.5))
    table_bingfaCanYe["canYeRoundrt"] = canYeRoundrt

    local canYeRoundlb = fc.FExtensionsImage:create()
    canYeRoundlb:setImage("nobatch/dikuang4_baowuqiangduo.png")
    canYeRoundlb:setSize(cc.size(181,181))
    canYeRoundlb:setFlipType(4)
    canYeRoundlb:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYeRoundlb)
    canYeRoundlb:setPositionInContainer(cc.p(220.5,360.5))
    table_bingfaCanYe["canYeRoundlb"] = canYeRoundlb

    local canYeRoundrb = fc.FExtensionsImage:create()
    canYeRoundrb:setImage("nobatch/dikuang4_baowuqiangduo.png")
    canYeRoundrb:setSize(cc.size(181,181))
    canYeRoundrb:setFlipType(8)
    canYeRoundrb:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYeRoundrb)
    canYeRoundrb:setPositionInContainer(cc.p(401.5,360.5))
    table_bingfaCanYe["canYeRoundrb"] = canYeRoundrb

    local canYeZhuanpan = fc.FExtensionsImage:create()
    canYeZhuanpan:setImage("nobatch/dikuang2_baowuqiangduo.png")
    canYeZhuanpan:setSize(cc.size(200,200))
    canYeZhuanpan:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(canYeZhuanpan)
    canYeZhuanpan:setPositionInContainer(cc.p(311,270))
    table_bingfaCanYe["canYeZhuanpan"] = canYeZhuanpan

    local rightBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    rightBg:setSize(cc.size(320,380))
    rightBg:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(rightBg)
    rightBg:setPositionInContainer(cc.p(760,270))
    table_bingfaCanYe["rightBg"] = rightBg

    local downBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    downBg:setSize(cc.size(880,140))
    downBg:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(downBg)
    downBg:setPositionInContainer(cc.p(480,555))
    table_bingfaCanYe["downBg"] = downBg

    local downFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    downFrame:setSize(cc.size(880,160))
    downFrame:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(downFrame)
    downFrame:setPositionInContainer(cc.p(480,555))
    table_bingfaCanYe["downFrame"] = downFrame

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(144,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/putonganniu1_up.png")
    bingfaCanYe:appendComponent(btn)
    btn:setPositionInContainer(cc.p(760,424.5))
    table_bingfaCanYe["btn"] = btn

    local he = fc.FShaderExtensionsImage:create(0)
    he:setAnchorPoint(cc.p(0.5,0.5))
    he:setImage("batch_ui/he_uizi.png")
    he:setSize(cc.size(32,32))
    btn:appendComponent(he)
    he:setPositionInContainer(cc.p(42,26))
    table_bingfaCanYe["he"] = he

    local cheng = fc.FShaderExtensionsImage:create(0)
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    cheng:setImage("batch_ui/cheng_uizi.png")
    cheng:setSize(cc.size(32,32))
    btn:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(96,26))
    table_bingfaCanYe["cheng"] = cheng

    local attackLabel = fc.FLabel:createBMFont()
    attackLabel:setSize(cc.size(100,40))
    attackLabel:setAnchorPoint(cc.p(0.5,0.5))
    attackLabel:setFontSize(20)
    attackLabel:setString("军令：")
    attackLabel:setColor(cc.c3b(125,1,1))
    bingfaCanYe:appendComponent(attackLabel)
    attackLabel:setPositionInContainer(cc.p(760,149))
    table_bingfaCanYe["attackLabel"] = attackLabel

    local des = fc.FLabel:createBMFont()
    des:setSize(cc.size(250,40))
    des:setWidth(250)
    des:setAnchorPoint(cc.p(0.5,0.5))
    des:setFontSize(20)
    des:setString("军令：")
    des:setColor(cc.c3b(125,1,1))
    bingfaCanYe:appendComponent(des)
    des:setPositionInContainer(cc.p(760,270))
    table_bingfaCanYe["des"] = des

    local centerFrame = fc.FExtensionsImage:create()
    centerFrame:setImage("batch_ui/baipinzhi_kuang.png")
    centerFrame:setSize(cc.size(104,104))
    centerFrame:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(centerFrame)
    centerFrame:setPositionInContainer(cc.p(311,270))
    table_bingfaCanYe["centerFrame"] = centerFrame

    local centerIcon = fc.FExtensionsImage:create()
    centerIcon:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(centerIcon)
    centerIcon:setPositionInContainer(cc.p(311,270))
    table_bingfaCanYe["centerIcon"] = centerIcon

    local titleBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    titleBG:setSize(cc.size(300,42))
    titleBG:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(titleBG)
    titleBG:setPositionInContainer(cc.p(760,102))
    table_bingfaCanYe["titleBG"] = titleBG

    local titleLabel = fc.FLabel:createBMFont()
    titleLabel:setSize(cc.size(100,40))
    titleLabel:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:setFontSize(32)
    titleLabel:setString("军令：")
    titleLabel:setColor(cc.c3b(255,255,255))
    bingfaCanYe:appendComponent(titleLabel)
    titleLabel:setPositionInContainer(cc.p(760,99))
    table_bingfaCanYe["titleLabel"] = titleLabel

    local rightFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    rightFrame:setSize(cc.size(320,400))
    rightFrame:setAnchorPoint(cc.p(0.5,0.5))
    bingfaCanYe:appendComponent(rightFrame)
    rightFrame:setPositionInContainer(cc.p(1130,251))
    table_bingfaCanYe["rightFrame"] = rightFrame

    return table_bingfaCanYe

end

