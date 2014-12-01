function createelite_stage()

    local table_elite_stage = {}

    local elite_stage = fc.FContainerPanel:create()
    elite_stage:setSize(cc.size(960,640))
    table_elite_stage["elite_stage"] = elite_stage

    local scale_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/blackBG.png",cc.rect(1,1,1,1))
    scale_bg:setSize(cc.size(960,640))
    scale_bg:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage:appendComponent(scale_bg)
    scale_bg:setPositionInContainer(cc.p(480,320))
    table_elite_stage["scale_bg"] = scale_bg

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(480,930))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    wen_la:setRotation(90)
    elite_stage:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(487,320))
    table_elite_stage["wen_la"] = wen_la

    local stage_zhou_left = fc.FExtensionsImage:create()
    stage_zhou_left:setImage("nobatch/shengzhi_zhou.png")
    stage_zhou_left:setSize(cc.size(50,620))
    stage_zhou_left:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage:appendComponent(stage_zhou_left)
    stage_zhou_left:setPositionInContainer(cc.p(25,320))
    table_elite_stage["stage_zhou_left"] = stage_zhou_left

    local stage_zhou_right = fc.FExtensionsImage:create()
    stage_zhou_right:setImage("nobatch/shengzhi_zhou.png")
    stage_zhou_right:setSize(cc.size(50,620))
    stage_zhou_right:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage:appendComponent(stage_zhou_right)
    stage_zhou_right:setPositionInContainer(cc.p(935,320))
    table_elite_stage["stage_zhou_right"] = stage_zhou_right

    local elite_close = fc.FScaleButton:create()
    elite_close:setSize(cc.size(34,33))
    elite_close:setAnchorPoint(cc.p(0.5,0.5))
    elite_close:setButtonImage("batch_ui/guanbi_anniu2.png")
    elite_stage:appendComponent(elite_close)
    elite_close:setPositionInContainer(cc.p(933,62.5))
    table_elite_stage["elite_close"] = elite_close

    local es_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    es_label_di:setSize(cc.size(256,40))
    es_label_di:setAnchorPoint(cc.p(0.5,0.5))
    elite_stage:appendComponent(es_label_di)
    es_label_di:setPositionInContainer(cc.p(487,538))
    table_elite_stage["es_label_di"] = es_label_di

    local challenge_num = fc.FLabel:createBMFont()
    challenge_num:setSize(cc.size(200,27))
    challenge_num:setAnchorPoint(cc.p(0.5,0.5))
    challenge_num:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	 challenge_num:setString("今日剩餘挑戰次數")
    else
    	 challenge_num:setString("今日剩余挑战次数")
    end
   
    challenge_num:setColor(cc.c3b(250,255,165))
    elite_stage:appendComponent(challenge_num)
    challenge_num:setPositionInContainer(cc.p(487,535.5))
    table_elite_stage["challenge_num"] = challenge_num

    return table_elite_stage

end

