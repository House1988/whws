function createlevelRewardItem()

    local table_levelRewardItem = {}

    local levelRewardItem = fc.FContainerPanel:create()
    levelRewardItem:setSize(cc.size(900,160))
    table_levelRewardItem["levelRewardItem"] = levelRewardItem

    local downbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    downbg:setSize(cc.size(900,43))
    downbg:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(downbg)
    downbg:setPositionInContainer(cc.p(450,138.5))
    table_levelRewardItem["downbg"] = downbg

    local upbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    upbg:setSize(cc.size(900,117))
    upbg:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(upbg)
    upbg:setPositionInContainer(cc.p(450,58.5))
    table_levelRewardItem["upbg"] = upbg

    local item1 = fc.FExtensionsImage:create()
    item1:setImage("batch_ui/chengpinzhi_kuang.png")
    item1:setSize(cc.size(104,104))
    item1:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(item1)
    item1:setPositionInContainer(cc.p(209,61))
    table_levelRewardItem["item1"] = item1

    local label = fc.FExtensionsImage:create()
    label:setImage("batch_ui/yilingqu_huodong.png")
    label:setSize(cc.size(114,81))
    label:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(label)
    label:setPositionInContainer(cc.p(801,80.5))
    table_levelRewardItem["label"] = label

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(146,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/teshuanniu.png")
    levelRewardItem:appendComponent(btn)
    btn:setPositionInContainer(cc.p(801,100.5))
    table_levelRewardItem["btn"] = btn

    local ling = fc.FShaderExtensionsImage:create(0)
    ling:setAnchorPoint(cc.p(0.5,0.5))
    ling:setImage("batch_ui/ling_uizi.png")
    ling:setSize(cc.size(32,32))
    btn:appendComponent(ling)
    ling:setPositionInContainer(cc.p(47,27))
    table_levelRewardItem["ling"] = ling

    local qu = fc.FShaderExtensionsImage:create(0)
    qu:setAnchorPoint(cc.p(0.5,0.5))
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    btn:appendComponent(qu)
    qu:setPositionInContainer(cc.p(100,27))
    table_levelRewardItem["qu"] = qu

    local item2 = fc.FExtensionsImage:create()
    item2:setImage("batch_ui/chengpinzhi_kuang.png")
    item2:setSize(cc.size(104,104))
    item2:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(item2)
    item2:setPositionInContainer(cc.p(348,61))
    table_levelRewardItem["item2"] = item2

    local item3 = fc.FExtensionsImage:create()
    item3:setImage("batch_ui/chengpinzhi_kuang.png")
    item3:setSize(cc.size(104,104))
    item3:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(item3)
    item3:setPositionInContainer(cc.p(486,61))
    table_levelRewardItem["item3"] = item3

    local item4 = fc.FExtensionsImage:create()
    item4:setImage("batch_ui/chengpinzhi_kuang.png")
    item4:setSize(cc.size(104,104))
    item4:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(item4)
    item4:setPositionInContainer(cc.p(625,61))
    table_levelRewardItem["item4"] = item4

    local levelBG = fc.FExtensionsImage:create()
    levelBG:setImage("batch_ui/jibieditu_huodong.png")
    levelBG:setSize(cc.size(132,117))
    levelBG:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(levelBG)
    levelBG:setPositionInContainer(cc.p(71,63.5))
    table_levelRewardItem["levelBG"] = levelBG

    local textbg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg1:setSize(cc.size(100,30))
    textbg1:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(textbg1)
    textbg1:setPositionInContainer(cc.p(209,134))
    table_levelRewardItem["textbg1"] = textbg1

    local name1 = fc.FLabel:createBMFont()
    name1:setSize(cc.size(90,25))
    name1:setAnchorPoint(cc.p(0.5,0.5))
    name1:setFontSize(20)
    name1:setString("教育点")
    name1:setColor(cc.c3b(0,255,255))
    levelRewardItem:appendComponent(name1)
    name1:setPositionInContainer(cc.p(209,132.5))
    table_levelRewardItem["name1"] = name1

    local levelLabel = fc.FExtensionsImage:create()
    levelLabel:setImage("batch_ui/jibie_huodong.png")
    levelLabel:setSize(cc.size(44,41))
    levelLabel:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(levelLabel)
    levelLabel:setPositionInContainer(cc.p(74,30.5))
    table_levelRewardItem["levelLabel"] = levelLabel

    local textbg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg2:setSize(cc.size(100,30))
    textbg2:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(textbg2)
    textbg2:setPositionInContainer(cc.p(348,134))
    table_levelRewardItem["textbg2"] = textbg2

    local textbg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg3:setSize(cc.size(100,30))
    textbg3:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(textbg3)
    textbg3:setPositionInContainer(cc.p(486,134))
    table_levelRewardItem["textbg3"] = textbg3

    local textbg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg4:setSize(cc.size(100,30))
    textbg4:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(textbg4)
    textbg4:setPositionInContainer(cc.p(625,134))
    table_levelRewardItem["textbg4"] = textbg4

    local name2 = fc.FLabel:createBMFont()
    name2:setSize(cc.size(90,25))
    name2:setAnchorPoint(cc.p(0.5,0.5))
    name2:setFontSize(20)
    name2:setString("教育点")
    name2:setColor(cc.c3b(0,255,255))
    levelRewardItem:appendComponent(name2)
    name2:setPositionInContainer(cc.p(347,133.5))
    table_levelRewardItem["name2"] = name2

    local name3 = fc.FLabel:createBMFont()
    name3:setSize(cc.size(90,25))
    name3:setAnchorPoint(cc.p(0.5,0.5))
    name3:setFontSize(20)
    name3:setString("教育点")
    name3:setColor(cc.c3b(0,255,255))
    levelRewardItem:appendComponent(name3)
    name3:setPositionInContainer(cc.p(486,133.5))
    table_levelRewardItem["name3"] = name3

    local name4 = fc.FLabel:createBMFont()
    name4:setSize(cc.size(90,25))
    name4:setAnchorPoint(cc.p(0.5,0.5))
    name4:setFontSize(20)
    name4:setString("教育点")
    name4:setColor(cc.c3b(0,255,255))
    levelRewardItem:appendComponent(name4)
    name4:setPositionInContainer(cc.p(625,133.5))
    table_levelRewardItem["name4"] = name4

    local frame_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frame_bg:setSize(cc.size(900,160))
    frame_bg:setAnchorPoint(cc.p(0.5,0.5))
    levelRewardItem:appendComponent(frame_bg)
    frame_bg:setPositionInContainer(cc.p(450,80))
    table_levelRewardItem["frame_bg"] = frame_bg

    local number1 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number1:setAnchorPoint(cc.p(0.5,0.5))
    number1:setSize(cc.size(80,20))
    number1:setAlignment(2)
    number1:setScale(0.45)
    levelRewardItem:appendComponent(number1)
    number1:setPositionInContainer(cc.p(238,99))
    table_levelRewardItem["number1"] = number1

    local number2 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number2:setAnchorPoint(cc.p(0.5,0.5))
    number2:setSize(cc.size(80,20))
    number2:setAlignment(2)
    number2:setScale(0.45)
    levelRewardItem:appendComponent(number2)
    number2:setPositionInContainer(cc.p(377,99))
    table_levelRewardItem["number2"] = number2

    local number3 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number3:setAnchorPoint(cc.p(0.5,0.5))
    number3:setSize(cc.size(80,20))
    number3:setAlignment(2)
    number3:setScale(0.45)
    levelRewardItem:appendComponent(number3)
    number3:setPositionInContainer(cc.p(514,99))
    table_levelRewardItem["number3"] = number3

    local number4 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number4:setAnchorPoint(cc.p(0.5,0.5))
    number4:setSize(cc.size(80,20))
    number4:setAlignment(2)
    number4:setScale(0.45)
    levelRewardItem:appendComponent(number4)
    number4:setPositionInContainer(cc.p(655,99))
    table_levelRewardItem["number4"] = number4

    return table_levelRewardItem

end

