function createcanYeRound()

    local table_canYeRound = {}

    local canYeRound = fc.FContainerPanel:create()
    canYeRound:setSize(cc.size(76,76))
    table_canYeRound["canYeRound"] = canYeRound

    local itemBg = fc.FExtensionsImage:create()
    itemBg:setImage("batch_ui/tubiaokuang_baowuqiangduo.png")
    itemBg:setSize(cc.size(76,76))
    itemBg:setAnchorPoint(cc.p(0.5,0.5))
    canYeRound:appendComponent(itemBg)
    itemBg:setPositionInContainer(cc.p(38,38))
    table_canYeRound["itemBg"] = itemBg

    local itemIcon = fc.FShaderExtensionsImage:create(0)
    itemIcon:setAnchorPoint(cc.p(0.5,0.5))
    canYeRound:appendComponent(itemIcon)
    itemIcon:setPositionInContainer(cc.p(38,38))
    table_canYeRound["itemIcon"] = itemIcon

    local lueduoBtn = fc.FContainerPanel:create()
    lueduoBtn:setSize(cc.size(76,76))
    lueduoBtn:setAnchorPoint(cc.p(0.5,0.5))
    canYeRound:appendComponent(lueduoBtn)
    lueduoBtn:setPositionInContainer(cc.p(38,38))
    table_canYeRound["lueduoBtn"] = lueduoBtn

    local numberbg = fc.FExtensionsImage:create()
    numberbg:setImage("batch_ui/shuzi.png")
    numberbg:setSize(cc.size(25,25))
    numberbg:setAnchorPoint(cc.p(0.5,0.5))
    canYeRound:appendComponent(numberbg)
    numberbg:setPositionInContainer(cc.p(63.5,63.5))
    table_canYeRound["numberbg"] = numberbg

    local number_text = fc.FLabel:createBMFont()
    number_text:setSize(cc.size(20,24))
    number_text:setAnchorPoint(cc.p(0.5,0.5))
    number_text:setFontSize(21)
    number_text:setString("LV:")
    number_text:setColor(cc.c3b(255,255,0))
    canYeRound:appendComponent(number_text)
    number_text:setPositionInContainer(cc.p(63,60))
    table_canYeRound["number_text"] = number_text

    return table_canYeRound

end

