function createdailyRewardItem()

    local table_dailyRewardItem = {}

    local dailyRewardItem = fc.FContainerPanel:create()
    dailyRewardItem:setSize(cc.size(630,160))
    table_dailyRewardItem["dailyRewardItem"] = dailyRewardItem

    local bgDown = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    bgDown:setSize(cc.size(630,120))
    bgDown:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(bgDown)
    bgDown:setPositionInContainer(cc.p(315,100))
    table_dailyRewardItem["bgDown"] = bgDown

    local bgup = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    bgup:setSize(cc.size(630,40))
    bgup:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(bgup)
    bgup:setPositionInContainer(cc.p(315,20))
    table_dailyRewardItem["bgup"] = bgup

    local item1 = fc.FExtensionsImage:create()
    item1:setImage("batch_ui/chengpinzhi_kuang.png")
    item1:setSize(cc.size(80,80))
    item1:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(item1)
    item1:setPositionInContainer(cc.p(53,82))
    table_dailyRewardItem["item1"] = item1

    local item2 = fc.FExtensionsImage:create()
    item2:setImage("batch_ui/chengpinzhi_kuang.png")
    item2:setSize(cc.size(80,80))
    item2:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(item2)
    item2:setPositionInContainer(cc.p(167,82))
    table_dailyRewardItem["item2"] = item2

    local item3 = fc.FExtensionsImage:create()
    item3:setImage("batch_ui/chengpinzhi_kuang.png")
    item3:setSize(cc.size(80,80))
    item3:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(item3)
    item3:setPositionInContainer(cc.p(281,81))
    table_dailyRewardItem["item3"] = item3

    local item4 = fc.FExtensionsImage:create()
    item4:setImage("batch_ui/chengpinzhi_kuang.png")
    item4:setSize(cc.size(80,80))
    item4:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(item4)
    item4:setPositionInContainer(cc.p(395,81))
    table_dailyRewardItem["item4"] = item4

    local label = fc.FExtensionsImage:create()
    label:setImage("batch_ui/yilingqu_huodong.png")
    label:setSize(cc.size(114,81))
    label:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(label)
    label:setPositionInContainer(cc.p(536,85.5))
    table_dailyRewardItem["label"] = label

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(146,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/teshuanniu.png")
    dailyRewardItem:appendComponent(btn)
    btn:setPositionInContainer(cc.p(541,106.5))
    table_dailyRewardItem["btn"] = btn

    local ling = fc.FShaderExtensionsImage:create(0)
    ling:setAnchorPoint(cc.p(0.5,0.5))
    ling:setImage("batch_ui/ling_uizi.png")
    ling:setSize(cc.size(32,32))
    btn:appendComponent(ling)
    ling:setPositionInContainer(cc.p(47,27))
    table_dailyRewardItem["ling"] = ling

    local qu = fc.FShaderExtensionsImage:create(0)
    qu:setAnchorPoint(cc.p(0.5,0.5))
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    btn:appendComponent(qu)
    qu:setPositionInContainer(cc.p(100,27))
    table_dailyRewardItem["qu"] = qu

    local number1 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number1:setAnchorPoint(cc.p(0.5,0.5))
    number1:setSize(cc.size(60,20))
    number1:setAlignment(2)
    number1:setScale(0.3)
    dailyRewardItem:appendComponent(number1)
    number1:setPositionInContainer(cc.p(79,110))
    table_dailyRewardItem["number1"] = number1

    local number2 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number2:setAnchorPoint(cc.p(0.5,0.5))
    number2:setSize(cc.size(60,20))
    number2:setAlignment(2)
    number2:setScale(0.3)
    dailyRewardItem:appendComponent(number2)
    number2:setPositionInContainer(cc.p(193,110))
    table_dailyRewardItem["number2"] = number2

    local number3 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number3:setAnchorPoint(cc.p(0.5,0.5))
    number3:setSize(cc.size(60,20))
    number3:setAlignment(2)
    number3:setScale(0.3)
    dailyRewardItem:appendComponent(number3)
    number3:setPositionInContainer(cc.p(307,110))
    table_dailyRewardItem["number3"] = number3

    local number4 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    number4:setAnchorPoint(cc.p(0.5,0.5))
    number4:setSize(cc.size(60,20))
    number4:setAlignment(2)
    number4:setScale(0.3)
    dailyRewardItem:appendComponent(number4)
    number4:setPositionInContainer(cc.p(421,110))
    table_dailyRewardItem["number4"] = number4

    local titleBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    titleBG:setSize(cc.size(610,40))
    titleBG:setAnchorPoint(cc.p(0.5,0.5))
    titleBG:setScaleY(-1)
    dailyRewardItem:appendComponent(titleBG)
    titleBG:setPositionInContainer(cc.p(315,20))
    table_dailyRewardItem["titleBG"] = titleBG

    local titleLabel = fc.FContainerPanel:create()
    titleLabel:setSize(cc.size(244,25))
    titleLabel:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(titleLabel)
    titleLabel:setPositionInContainer(cc.p(312,16))
    table_dailyRewardItem["titleLabel"] = titleLabel

    local lian = fc.FExtensionsImage:create()
    lian:setImage("batch_ui/lian_uizi.png")
    lian:setSize(cc.size(32,32))
    lian:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:appendComponent(lian)
    lian:setPositionInContainer(cc.p(16,16))
    table_dailyRewardItem["lian"] = lian

    local xu = fc.FExtensionsImage:create()
    xu:setImage("batch_ui/xu_uizi.png")
    xu:setSize(cc.size(32,32))
    xu:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:appendComponent(xu)
    xu:setPositionInContainer(cc.p(51,16))
    table_dailyRewardItem["xu"] = xu

    local deng = fc.FExtensionsImage:create()
    deng:setImage("batch_ui/deng_uizi.png")
    deng:setSize(cc.size(32,32))
    deng:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:appendComponent(deng)
    deng:setPositionInContainer(cc.p(85,16))
    table_dailyRewardItem["deng"] = deng

    local lu = fc.FExtensionsImage:create()
    lu:setImage("batch_ui/lu_uizi.png")
    lu:setSize(cc.size(32,32))
    lu:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:appendComponent(lu)
    lu:setPositionInContainer(cc.p(120,16))
    table_dailyRewardItem["lu"] = lu

    local tian = fc.FExtensionsImage:create()
    tian:setImage("batch_ui/tian_uizi.png")
    tian:setSize(cc.size(32,32))
    tian:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:appendComponent(tian)
    tian:setPositionInContainer(cc.p(232,16))
    table_dailyRewardItem["tian"] = tian

    local text_tian = fc.FLabel:createBMFont()
    text_tian:setSize(cc.size(90,25))
    text_tian:setAnchorPoint(cc.p(0.5,0.5))
    text_tian:setFontSize(20)
    text_tian:setString("教育点")
    text_tian:setColor(cc.c3b(0,255,255))
    dailyRewardItem:appendComponent(text_tian)
    text_tian:setPositionInContainer(cc.p(365,15.5))
    table_dailyRewardItem["text_tian"] = text_tian

    local namebg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    namebg1:setSize(cc.size(80,25))
    namebg1:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(namebg1)
    namebg1:setPositionInContainer(cc.p(53,135.5))
    table_dailyRewardItem["namebg1"] = namebg1

    local namebg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    namebg2:setSize(cc.size(80,25))
    namebg2:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(namebg2)
    namebg2:setPositionInContainer(cc.p(167,135.5))
    table_dailyRewardItem["namebg2"] = namebg2

    local namebg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    namebg3:setSize(cc.size(80,25))
    namebg3:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(namebg3)
    namebg3:setPositionInContainer(cc.p(281,135.5))
    table_dailyRewardItem["namebg3"] = namebg3

    local namebg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    namebg4:setSize(cc.size(80,25))
    namebg4:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(namebg4)
    namebg4:setPositionInContainer(cc.p(395,135.5))
    table_dailyRewardItem["namebg4"] = namebg4

    local it_name1 = fc.FLabel:createBMFont()
    it_name1:setSize(cc.size(60,25))
    it_name1:setAnchorPoint(cc.p(0.5,0.5))
    it_name1:setFontSize(16)
    it_name1:setString("教育点")
    it_name1:setColor(cc.c3b(0,255,255))
    dailyRewardItem:appendComponent(it_name1)
    it_name1:setPositionInContainer(cc.p(53,132.5))
    table_dailyRewardItem["it_name1"] = it_name1

    local it_name2 = fc.FLabel:createBMFont()
    it_name2:setSize(cc.size(60,25))
    it_name2:setAnchorPoint(cc.p(0.5,0.5))
    it_name2:setFontSize(16)
    it_name2:setString("教育点")
    it_name2:setColor(cc.c3b(0,255,255))
    dailyRewardItem:appendComponent(it_name2)
    it_name2:setPositionInContainer(cc.p(167,132.5))
    table_dailyRewardItem["it_name2"] = it_name2

    local it_name3 = fc.FLabel:createBMFont()
    it_name3:setSize(cc.size(60,25))
    it_name3:setAnchorPoint(cc.p(0.5,0.5))
    it_name3:setFontSize(16)
    it_name3:setString("教育点")
    it_name3:setColor(cc.c3b(0,255,255))
    dailyRewardItem:appendComponent(it_name3)
    it_name3:setPositionInContainer(cc.p(281,132.5))
    table_dailyRewardItem["it_name3"] = it_name3

    local it_name4 = fc.FLabel:createBMFont()
    it_name4:setSize(cc.size(60,25))
    it_name4:setAnchorPoint(cc.p(0.5,0.5))
    it_name4:setFontSize(16)
    it_name4:setString("教育点")
    it_name4:setColor(cc.c3b(0,255,255))
    dailyRewardItem:appendComponent(it_name4)
    it_name4:setPositionInContainer(cc.p(395,132.5))
    table_dailyRewardItem["it_name4"] = it_name4

    local frame_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frame_bg:setSize(cc.size(630,160))
    frame_bg:setAnchorPoint(cc.p(0.5,0.5))
    dailyRewardItem:appendComponent(frame_bg)
    frame_bg:setPositionInContainer(cc.p(315,80))
    table_dailyRewardItem["frame_bg"] = frame_bg

    return table_dailyRewardItem

end

