function createeffectPopup()

    local table_effectPopup = {}

    local effectPopup = fc.FContainerPanel:create()
    effectPopup:setSize(cc.size(960,640))
    table_effectPopup["effectPopup"] = effectPopup

    local blackBg = fc.FExtensionsImage:create()
    blackBg:setImage("batch_ui/blackBG.png")
    blackBg:setSize(cc.size(2000,2000))
    blackBg:setAnchorPoint(cc.p(0.5,0.5))
    effectPopup:appendComponent(blackBg)
    blackBg:setPositionInContainer(cc.p(480,320))
    table_effectPopup["blackBg"] = blackBg

    local blackBar = fc.FExtensionsImage:create()
    blackBar:setImage("batch_ui/blackBG.png")
    blackBar:setSize(cc.size(960,100))
    blackBar:setAnchorPoint(cc.p(0.5,0.5))
    effectPopup:appendComponent(blackBar)
    blackBar:setPositionInContainer(cc.p(480,290))
    table_effectPopup["blackBar"] = blackBar

    local position = fc.FContainerPanel:create()
    position:setSize(cc.size(200,80))
    position:setAnchorPoint(cc.p(0.5,0.5))
    effectPopup:appendComponent(position)
    position:setPositionInContainer(cc.p(473,290))
    table_effectPopup["position"] = position

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    effectPopup:appendComponent(close)
    close:setPositionInContainer(cc.p(934,34))
    table_effectPopup["close"] = close

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/chengpinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    effectPopup:appendComponent(frame)
    frame:setPositionInContainer(cc.p(240,217))
    table_effectPopup["frame"] = frame

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/chengpinzhi_kuang.png")
    image:setSize(cc.size(90,90))
    image:setAnchorPoint(cc.p(0.5,0.5))
    effectPopup:appendComponent(image)
    image:setPositionInContainer(cc.p(240,217))
    table_effectPopup["image"] = image

    return table_effectPopup

end

