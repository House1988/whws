function createdailyReward()

    local table_dailyReward = {}

    local dailyReward = fc.FContainerPanel:create()
    dailyReward:setSize(cc.size(960,640))
    table_dailyReward["dailyReward"] = dailyReward

    local leftBG = fc.FExtensionsImage:create()
    leftBG:setImage("nobatch/ditu_denglujiangli.png")
    leftBG:setSize(cc.size(318,481))
    leftBG:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(leftBG)
    leftBG:setPositionInContainer(cc.p(167,384.5))
    table_dailyReward["leftBG"] = leftBG

    local leftLabel = fc.FExtensionsImage:create()
    leftLabel:setImage("nobatch/lianxusanshitianbujianduan_huodong.png")
    leftLabel:setSize(cc.size(128,449))
    leftLabel:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(leftLabel)
    leftLabel:setPositionInContainer(cc.p(97,384.5))
    table_dailyReward["leftLabel"] = leftLabel

    local item1 = fc.FExtensionsImage:create()
    item1:setImage("batch_ui/chengpinzhi_kuang.png")
    item1:setSize(cc.size(104,104))
    item1:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(item1)
    item1:setPositionInContainer(cc.p(232,238))
    table_dailyReward["item1"] = item1

    local item2 = fc.FExtensionsImage:create()
    item2:setImage("batch_ui/chengpinzhi_kuang.png")
    item2:setSize(cc.size(104,104))
    item2:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(item2)
    item2:setPositionInContainer(cc.p(234,387))
    table_dailyReward["item2"] = item2

    local item3 = fc.FExtensionsImage:create()
    item3:setImage("batch_ui/chengpinzhi_kuang.png")
    item3:setSize(cc.size(104,104))
    item3:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(item3)
    item3:setPositionInContainer(cc.p(234,535))
    table_dailyReward["item3"] = item3

    local name_label = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    name_label:setSize(cc.size(100,30))
    name_label:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(name_label)
    name_label:setPositionInContainer(cc.p(234,604))
    table_dailyReward["name_label"] = name_label

    local name_label = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    name_label:setSize(cc.size(100,30))
    name_label:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(name_label)
    name_label:setPositionInContainer(cc.p(234,456))
    table_dailyReward["name_label"] = name_label

    local name_label = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    name_label:setSize(cc.size(100,30))
    name_label:setAnchorPoint(cc.p(0.5,0.5))
    dailyReward:appendComponent(name_label)
    name_label:setPositionInContainer(cc.p(234,307))
    table_dailyReward["name_label"] = name_label

    local dr_name1 = fc.FLabel:createBMFont()
    dr_name1:setSize(cc.size(90,25))
    dr_name1:setAnchorPoint(cc.p(0.5,0.5))
    dr_name1:setFontSize(20)
    dr_name1:setString("教育点")
    dr_name1:setColor(cc.c3b(0,255,255))
    dailyReward:appendComponent(dr_name1)
    dr_name1:setPositionInContainer(cc.p(234,303.5))
    table_dailyReward["dr_name1"] = dr_name1

    local dr_name2 = fc.FLabel:createBMFont()
    dr_name2:setSize(cc.size(90,25))
    dr_name2:setAnchorPoint(cc.p(0.5,0.5))
    dr_name2:setFontSize(20)
    dr_name2:setString("教育点")
    dr_name2:setColor(cc.c3b(0,255,255))
    dailyReward:appendComponent(dr_name2)
    dr_name2:setPositionInContainer(cc.p(234,452.5))
    table_dailyReward["dr_name2"] = dr_name2

    local dr_name3 = fc.FLabel:createBMFont()
    dr_name3:setSize(cc.size(90,25))
    dr_name3:setAnchorPoint(cc.p(0.5,0.5))
    dr_name3:setFontSize(20)
    dr_name3:setString("教育点")
    dr_name3:setColor(cc.c3b(0,255,255))
    dailyReward:appendComponent(dr_name3)
    dr_name3:setPositionInContainer(cc.p(234,600.5))
    table_dailyReward["dr_name3"] = dr_name3

    return table_dailyReward

end

