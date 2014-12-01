function createelite_stage_card()

    local table_elite_stage_card = {}

    local elite_stage_card = fc.FContainerPanel:create()
    elite_stage_card:setSize(cc.size(231,394))
    table_elite_stage_card["elite_stage_card"] = elite_stage_card

    local card_bg = fc.FShaderExtensionsImage:create(0)
    card_bg:setAnchorPoint(cc.p(0.5,0.5))
    card_bg:setImage("batch_ui/meinvpinzhi_zi.png")
    card_bg:setSize(cc.size(200,364))
    elite_stage_card:appendComponent(card_bg)
    card_bg:setPositionInContainer(cc.p(116,197))
    table_elite_stage_card["card_bg"] = card_bg

    local down_di = fc.FExtensionsImage:create()
    down_di:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    down_di:setSize(cc.size(200,90))
    down_di:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(down_di)
    down_di:setPositionInContainer(cc.p(116,341))
    table_elite_stage_card["down_di"] = down_di

    local card_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(13,57,1,2))
    card_rect1:setSize(cc.size(25,372))
    card_rect1:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(card_rect1)
    card_rect1:setPositionInContainer(cc.p(17.5,201))
    table_elite_stage_card["card_rect1"] = card_rect1

    local stage_card = fc.FShaderExtensionsImage:create(0)
    stage_card:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(stage_card)
    stage_card:setPositionInContainer(cc.p(116,177))
    table_elite_stage_card["stage_card"] = stage_card

    local card_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(13,57,1,2))
    card_rect1:setSize(cc.size(25,372))
    card_rect1:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(card_rect1)
    card_rect1:setPositionInContainer(cc.p(215.5,201))
    table_elite_stage_card["card_rect1"] = card_rect1

    local up_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(72,15,3,3))
    up_di:setSize(cc.size(200,42))
    up_di:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(up_di)
    up_di:setPositionInContainer(cc.p(116,36))
    table_elite_stage_card["up_di"] = up_di

    local label_name = fc.FLabel:createSystemFont()
    label_name:setSize(cc.size(100,30))
    label_name:setAnchorPoint(cc.p(0.5,0.5))
    label_name:setFontSize(20)
    label_name:setString("路政哈哈哈")
    label_name:setColor(cc.c3b(250,255,165))
    elite_stage_card:appendComponent(label_name)
    label_name:setPositionInContainer(cc.p(116,35))
    table_elite_stage_card["label_name"] = label_name

    local stage_name = fc.FLabel:createBMFont()
    stage_name:setSize(cc.size(130,40))
    stage_name:setWidth(130)
    stage_name:setAnchorPoint(cc.p(0.5,0.5))
    stage_name:setFontSize(24)
    stage_name:setString("步兵步兵步兵步兵")
    stage_name:setColor(cc.c3b(250,255,165))
    elite_stage_card:appendComponent(stage_name)
    stage_name:setPositionInContainer(cc.p(142,346))
    table_elite_stage_card["stage_name"] = stage_name

    local card_down_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(64,15,3,3))
    card_down_rect:setSize(cc.size(200,29))
    card_down_rect:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(card_down_rect)
    card_down_rect:setPositionInContainer(cc.p(116,298.5))
    table_elite_stage_card["card_down_rect"] = card_down_rect

    local elite_stage_flag = fc.FExtensionsImage:create()
    elite_stage_flag:setImage("batch_ui/gongji_tubiao.png")
    elite_stage_flag:setSize(cc.size(43,60))
    elite_stage_flag:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(elite_stage_flag)
    elite_stage_flag:setPositionInContainer(cc.p(49.5,349))
    table_elite_stage_card["elite_stage_flag"] = elite_stage_flag

    local card_select_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang.png",cc.rect(44,44,8,8))
    card_select_rect:setSize(cc.size(233,386))
    card_select_rect:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage_card:appendComponent(card_select_rect)
    card_select_rect:setPositionInContainer(cc.p(116.5,201))
    table_elite_stage_card["card_select_rect"] = card_select_rect

    return table_elite_stage_card

end

