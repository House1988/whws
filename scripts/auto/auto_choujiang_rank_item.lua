function createchoujiang_rank_item()

    local table_choujiang_rank_item = {}

    local choujiang_rank_item = fc.FContainerPanel:create()
    choujiang_rank_item:setSize(cc.size(370,35))
    table_choujiang_rank_item["choujiang_rank_item"] = choujiang_rank_item

    local darkbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    darkbg:setSize(cc.size(370,35))
    darkbg:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_rank_item:appendComponent(darkbg)
    darkbg:setPositionInContainer(cc.p(185,17.5))
    table_choujiang_rank_item["darkbg"] = darkbg

    local lightBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,2,2))
    lightBg:setSize(cc.size(370,35))
    lightBg:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_rank_item:appendComponent(lightBg)
    lightBg:setPositionInContainer(cc.p(185,17.5))
    table_choujiang_rank_item["lightBg"] = lightBg

    local rank_label = fc.FLabel:createBMFont()
    rank_label:setSize(cc.size(50,24))
    rank_label:setAnchorPoint(cc.p(0.5,0.5))
    rank_label:setFontSize(20)
    rank_label:setString("名次")
    rank_label:setColor(cc.c3b(91,24,6))
    choujiang_rank_item:appendComponent(rank_label)
    rank_label:setPositionInContainer(cc.p(32,16))
    table_choujiang_rank_item["rank_label"] = rank_label

    local name_label = fc.FLabel:createBMFont()
    name_label:setSize(cc.size(50,24))
    name_label:setAnchorPoint(cc.p(0.5,0.5))
    name_label:setFontSize(20)
    name_label:setString("名次")
    name_label:setColor(cc.c3b(91,24,6))
    choujiang_rank_item:appendComponent(name_label)
    name_label:setPositionInContainer(cc.p(159,16))
    table_choujiang_rank_item["name_label"] = name_label

    local labelbg = fc.FExtensionsImage:create()
    labelbg:setImage("batch_ui/shuruwenzi.png")
    labelbg:setSize(cc.size(100,25))
    labelbg:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_rank_item:appendComponent(labelbg)
    labelbg:setPositionInContainer(cc.p(316,18.5))
    table_choujiang_rank_item["labelbg"] = labelbg

    local jifen_label = fc.FLabel:createBMFont()
    jifen_label:setSize(cc.size(50,24))
    jifen_label:setAnchorPoint(cc.p(0.5,0.5))
    jifen_label:setFontSize(20)
    jifen_label:setString("名次")
    jifen_label:setColor(cc.c3b(91,24,6))
    choujiang_rank_item:appendComponent(jifen_label)
    jifen_label:setPositionInContainer(cc.p(316,16))
    table_choujiang_rank_item["jifen_label"] = jifen_label

    return table_choujiang_rank_item

end

