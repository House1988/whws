function createchoujiangRewardItem()

    local table_choujiangRewardItem = {}

    local choujiangRewardItem = fc.FContainerPanel:create()
    choujiangRewardItem:setSize(cc.size(104,134))
    table_choujiangRewardItem["choujiangRewardItem"] = choujiangRewardItem

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    choujiangRewardItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(52,52))
    table_choujiangRewardItem["frame"] = frame

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/baipinzhi_kuang.png")
    image:setSize(cc.size(90,90))
    image:setAnchorPoint(cc.p(0.5,0.5))
    choujiangRewardItem:appendComponent(image)
    image:setPositionInContainer(cc.p(52,52))
    table_choujiangRewardItem["image"] = image

    local num = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    num:setAnchorPoint(cc.p(0.5,0.5))
    num:setSize(cc.size(60,20))
    num:setScale(0.4)
    choujiangRewardItem:appendComponent(num)
    num:setPositionInContainer(cc.p(84,94))
    table_choujiangRewardItem["num"] = num

    local textbg = fc.FExtensionsImage:create()
    textbg:setImage("batch_ui/shuruwenzi.png")
    textbg:setSize(cc.size(100,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    choujiangRewardItem:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(52,119))
    table_choujiangRewardItem["textbg"] = textbg

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(100,25))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("消耗")
    name:setColor(cc.c3b(0,255,255))
    choujiangRewardItem:appendComponent(name)
    name:setPositionInContainer(cc.p(52,114.5))
    table_choujiangRewardItem["name"] = name

    return table_choujiangRewardItem

end

