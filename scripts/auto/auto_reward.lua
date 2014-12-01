function createreward()

    local table_reward = {}

    local reward = fc.FContainerPanel:create()
    reward:setSize(cc.size(960,640))
    table_reward["reward"] = reward

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,4,4))
    bg:setSize(cc.size(960,540))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(bg)
    bg:setPositionInContainer(cc.p(480,370))
    table_reward["bg"] = bg

    local titleBGLT = fc.FExtensionsImage:create()
    titleBGLT:setImage("nobatch/title_hougong.png")
    titleBGLT:setSize(cc.size(480,67))
    titleBGLT:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(titleBGLT)
    titleBGLT:setPositionInContainer(cc.p(240,33.5))
    table_reward["titleBGLT"] = titleBGLT

    local titleBGRT = fc.FExtensionsImage:create()
    titleBGRT:setImage("nobatch/title_hougong.png")
    titleBGRT:setSize(cc.size(480,67))
    titleBGRT:setFlipType(2)
    titleBGRT:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(titleBGRT)
    titleBGRT:setPositionInContainer(cc.p(720,33.5))
    table_reward["titleBGRT"] = titleBGRT

    local titleBGLB = fc.FExtensionsImage:create()
    titleBGLB:setImage("nobatch/title_hougong.png")
    titleBGLB:setSize(cc.size(480,67))
    titleBGLB:setFlipType(4)
    titleBGLB:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(titleBGLB)
    titleBGLB:setPositionInContainer(cc.p(240,100.5))
    table_reward["titleBGLB"] = titleBGLB

    local titleBGRB = fc.FExtensionsImage:create()
    titleBGRB:setImage("nobatch/title_hougong.png")
    titleBGRB:setSize(cc.size(480,67))
    titleBGRB:setFlipType(8)
    titleBGRB:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(titleBGRB)
    titleBGRB:setPositionInContainer(cc.p(720,100.5))
    table_reward["titleBGRB"] = titleBGRB

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/banzidikuangmeinv2_tongyong.png")
    titleBg:setSize(cc.size(960,120))
    titleBg:setFlipType(2)
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(480,67))
    table_reward["titleBg"] = titleBg

    local wen_la = fc.FExtensionsImage:create()
    wen_la:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_la:setSize(cc.size(220,163))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(110,215.5))
    table_reward["wen_la"] = wen_la

    local wen_ra = fc.FExtensionsImage:create()
    wen_ra:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_ra:setSize(cc.size(220,163))
    wen_ra:setFlipType(2)
    wen_ra:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(wen_ra)
    wen_ra:setPositionInContainer(cc.p(850,215.5))
    table_reward["wen_ra"] = wen_ra

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_reward["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_reward["wen_rb"] = wen_rb

    local btnList = fc.FContainerList:create(2)
    btnList:setSize(cc.size(800,110))
    btnList:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(btnList)
    btnList:setPositionInContainer(cc.p(480,72))
    table_reward["btnList"] = btnList

    local clothL = fc.FExtensionsImage:create()
    clothL:setImage("batch_ui/title_mingchen_2.png")
    clothL:setSize(cc.size(62,121))
    clothL:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(clothL)
    clothL:setPositionInContainer(cc.p(31,68.5))
    table_reward["clothL"] = clothL

    local clothR = fc.FExtensionsImage:create()
    clothR:setImage("batch_ui/title_mingchen_2.png")
    clothR:setSize(cc.size(62,121))
    clothR:setFlipType(2)
    clothR:setAnchorPoint(cc.p(0.5,0.5))
    reward:appendComponent(clothR)
    clothR:setPositionInContainer(cc.p(929,68.5))
    table_reward["clothR"] = clothR

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    reward:appendComponent(close)
    close:setPositionInContainer(cc.p(933,27))
    table_reward["close"] = close

    return table_reward

end

