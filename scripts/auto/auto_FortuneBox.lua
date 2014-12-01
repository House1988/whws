function createFortuneBox()

    local table_FortuneBox = {}

    local FortuneBox = fc.FContainerPanel:create()
    FortuneBox:setSize(cc.size(960,640))
    table_FortuneBox["FortuneBox"] = FortuneBox

    local pos1 = fc.FContainerPanel:create()
    pos1:setSize(cc.size(220,221))
    pos1:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(pos1)
    pos1:setPositionInContainer(cc.p(383,286.5))
    table_FortuneBox["pos1"] = pos1

    local titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    titlebg:setSize(cc.size(665,40))
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    titlebg:setScaleY(-1)
    FortuneBox:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(620.5,154))
    table_FortuneBox["titlebg"] = titlebg

    local pos2 = fc.FContainerPanel:create()
    pos2:setSize(cc.size(220,221))
    pos2:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(pos2)
    pos2:setPositionInContainer(cc.p(613,286.5))
    table_FortuneBox["pos2"] = pos2

    local pos3 = fc.FContainerPanel:create()
    pos3:setSize(cc.size(220,221))
    pos3:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(pos3)
    pos3:setPositionInContainer(cc.p(843,286.5))
    table_FortuneBox["pos3"] = pos3

    local pos4 = fc.FContainerPanel:create()
    pos4:setSize(cc.size(220,221))
    pos4:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(pos4)
    pos4:setPositionInContainer(cc.p(383,512.5))
    table_FortuneBox["pos4"] = pos4

    local pos5 = fc.FContainerPanel:create()
    pos5:setSize(cc.size(220,221))
    pos5:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(pos5)
    pos5:setPositionInContainer(cc.p(613,512.5))
    table_FortuneBox["pos5"] = pos5

    local pos6 = fc.FContainerPanel:create()
    pos6:setSize(cc.size(220,221))
    pos6:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(pos6)
    pos6:setPositionInContainer(cc.p(843,512.5))
    table_FortuneBox["pos6"] = pos6

    local countDown = fc.FLabel:createBMFont()
    countDown:setSize(cc.size(200,30))
    countDown:setAnchorPoint(cc.p(0.5,0.5))
    countDown:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	countDown:setString("活動倒計時：")
    else
    	countDown:setString("活动倒计时：")
    end
    countDown:setColor(cc.c3b(0,255,0))
    FortuneBox:appendComponent(countDown)
    countDown:setPositionInContainer(cc.p(513,149))
    table_FortuneBox["countDown"] = countDown

    local countDownTimer = fc.FLabel:createBMFont()
    countDownTimer:setSize(cc.size(200,30))
    countDownTimer:setAnchorPoint(cc.p(0.5,0.5))
    countDownTimer:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	countDownTimer:setString("活動倒計時：")
    else
    	countDownTimer:setString("活动倒计时：")
    end
    countDownTimer:setColor(cc.c3b(0,255,0))
    FortuneBox:appendComponent(countDownTimer)
    countDownTimer:setPositionInContainer(cc.p(713,149))
    table_FortuneBox["countDownTimer"] = countDownTimer

    local beauty = fc.FExtensionsImage:create()
    beauty:setImage("beauty_card/xiayuhe01.png")
    beauty:setSize(cc.size(388,415))
    beauty:setAnchorPoint(cc.p(0.5,0.5))
    FortuneBox:appendComponent(beauty)
    beauty:setPositionInContainer(cc.p(120,421.5))
    table_FortuneBox["beauty"] = beauty

    local colum = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zhuzi.png",cc.rect(0,53,89,2))
    colum:setSize(cc.size(89,506))
    colum:setAnchorPoint(cc.p(0.5,0.5))
    colum:setScaleY(-1)
    FortuneBox:appendComponent(colum)
    colum:setPositionInContainer(cc.p(3.5,386))
    table_FortuneBox["colum"] = colum

    local bottombar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottombar:setSize(cc.size(960,13))
    bottombar:setAnchorPoint(cc.p(0.5,0.5))
    bottombar:setScaleY(-1)
    FortuneBox:appendComponent(bottombar)
    bottombar:setPositionInContainer(cc.p(480,633.5))
    table_FortuneBox["bottombar"] = bottombar

    local colum = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zhuzi.png",cc.rect(0,53,89,2))
    colum:setSize(cc.size(89,506))
    colum:setAnchorPoint(cc.p(0.5,0.5))
    colum:setScaleY(-1)
    FortuneBox:appendComponent(colum)
    colum:setPositionInContainer(cc.p(256.5,387))
    table_FortuneBox["colum"] = colum

    return table_FortuneBox

end

