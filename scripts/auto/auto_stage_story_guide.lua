function createstage_story_guide()

    local table_stage_story_guide = {}

    local stage_story_guide = fc.FContainerPanel:create()
    stage_story_guide:setSize(cc.size(560,315))
    table_stage_story_guide["stage_story_guide"] = stage_story_guide

    local stage_story_guide_l = fc.FContainerPanel:create()
    stage_story_guide_l:setSize(cc.size(560,315))
    stage_story_guide_l:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide:appendComponent(stage_story_guide_l)
    stage_story_guide_l:setPositionInContainer(cc.p(280,157.5))
    table_stage_story_guide["stage_story_guide_l"] = stage_story_guide_l

    local xsyd_zouzhang1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    xsyd_zouzhang1_scale9:setSize(cc.size(126,198))
    xsyd_zouzhang1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_l:appendComponent(xsyd_zouzhang1_scale9)
    xsyd_zouzhang1_scale9:setPositionInContainer(cc.p(178,210))
    table_stage_story_guide["xsyd_zouzhang1_scale9"] = xsyd_zouzhang1_scale9

    local xsyd_zouzhang2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    xsyd_zouzhang2_scale9:setSize(cc.size(197,187))
    xsyd_zouzhang2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_l:appendComponent(xsyd_zouzhang2_scale9)
    xsyd_zouzhang2_scale9:setPositionInContainer(cc.p(337.5,209.5))
    table_stage_story_guide["xsyd_zouzhang2_scale9"] = xsyd_zouzhang2_scale9

    local xsyd_zouzhang4_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    xsyd_zouzhang4_scale9:setSize(cc.size(126,198))
    xsyd_zouzhang4_scale9:setAnchorPoint(cc.p(0.5,0.5))
    xsyd_zouzhang4_scale9:setScaleX(-1)
    stage_story_guide_l:appendComponent(xsyd_zouzhang4_scale9)
    xsyd_zouzhang4_scale9:setPositionInContainer(cc.p(497,210))
    table_stage_story_guide["xsyd_zouzhang4_scale9"] = xsyd_zouzhang4_scale9

    local xsyd_jiantou1 = fc.FExtensionsImage:create()
    xsyd_jiantou1:setImage("batch_ui/jiantou_xinshouyindao.png")
    xsyd_jiantou1:setSize(cc.size(58,38))
    xsyd_jiantou1:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_l:appendComponent(xsyd_jiantou1)
    xsyd_jiantou1:setPositionInContainer(cc.p(519,279))
    table_stage_story_guide["xsyd_jiantou1"] = xsyd_jiantou1

    local yindao_person1 = fc.FExtensionsImage:create()
    yindao_person1:setImage("nobatch/xiaotaijian.png")
    yindao_person1:setSize(cc.size(204,315))
    yindao_person1:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_l:appendComponent(yindao_person1)
    yindao_person1:setPositionInContainer(cc.p(102,157.5))
    table_stage_story_guide["yindao_person1"] = yindao_person1

    local label_title1 = fc.FLabel:createBMFont()
    label_title1:setSize(cc.size(100,30))
    label_title1:setWidth(340)
    label_title1:setAnchorPoint(cc.p(0.5,0.5))
    label_title1:setFontSize(20)
    label_title1:setString("步兵步兵步")
    label_title1:setColor(cc.c3b(206,53,0))
    stage_story_guide_l:appendComponent(label_title1)
    label_title1:setPositionInContainer(cc.p(338,131))
    table_stage_story_guide["label_title1"] = label_title1

    local xsyd_content_label1 = fc.FLabel:createBMFont()
    xsyd_content_label1:setSize(cc.size(320,120))
    xsyd_content_label1:setWidth(340)
    xsyd_content_label1:setAnchorPoint(cc.p(0.5,0.5))
    xsyd_content_label1:setFontSize(20)
    xsyd_content_label1:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步")
    xsyd_content_label1:setColor(cc.c3b(91,24,6))
    stage_story_guide_l:appendComponent(xsyd_content_label1)
    xsyd_content_label1:setPositionInContainer(cc.p(374,205))
    table_stage_story_guide["xsyd_content_label1"] = xsyd_content_label1

    local stage_story_guide_r = fc.FContainerPanel:create()
    stage_story_guide_r:setSize(cc.size(560,315))
    stage_story_guide_r:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide:appendComponent(stage_story_guide_r)
    stage_story_guide_r:setPositionInContainer(cc.p(280,157.5))
    table_stage_story_guide["stage_story_guide_r"] = stage_story_guide_r

    local zouzhang23 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    zouzhang23:setSize(cc.size(197,187))
    zouzhang23:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_r:appendComponent(zouzhang23)
    zouzhang23:setPositionInContainer(cc.p(219.5,211.5))
    table_stage_story_guide["zouzhang23"] = zouzhang23

    local zouzhang22 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    zouzhang22:setSize(cc.size(126,198))
    zouzhang22:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang22:setScaleX(-1)
    stage_story_guide_r:appendComponent(zouzhang22)
    zouzhang22:setPositionInContainer(cc.p(377,209))
    table_stage_story_guide["zouzhang22"] = zouzhang22

    local zouzhang21 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    zouzhang21:setSize(cc.size(126,198))
    zouzhang21:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_r:appendComponent(zouzhang21)
    zouzhang21:setPositionInContainer(cc.p(64,209))
    table_stage_story_guide["zouzhang21"] = zouzhang21

    local yindao_person2 = fc.FExtensionsImage:create()
    yindao_person2:setImage("nobatch/xiaotaijian.png")
    yindao_person2:setSize(cc.size(204,315))
    yindao_person2:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_r:appendComponent(yindao_person2)
    yindao_person2:setPositionInContainer(cc.p(458,157.5))
    table_stage_story_guide["yindao_person2"] = yindao_person2

    local xsyd_jiantou2 = fc.FExtensionsImage:create()
    xsyd_jiantou2:setImage("batch_ui/jiantou_xinshouyindao.png")
    xsyd_jiantou2:setSize(cc.size(58,38))
    xsyd_jiantou2:setAnchorPoint(cc.p(0.5,0.5))
    stage_story_guide_r:appendComponent(xsyd_jiantou2)
    xsyd_jiantou2:setPositionInContainer(cc.p(43,277))
    table_stage_story_guide["xsyd_jiantou2"] = xsyd_jiantou2

    local label_title2 = fc.FLabel:createBMFont()
    label_title2:setSize(cc.size(100,30))
    label_title2:setWidth(340)
    label_title2:setAnchorPoint(cc.p(0.5,0.5))
    label_title2:setFontSize(20)
    label_title2:setString("步兵步兵步")
    label_title2:setColor(cc.c3b(206,53,0))
    stage_story_guide_r:appendComponent(label_title2)
    label_title2:setPositionInContainer(cc.p(221,133))
    table_stage_story_guide["label_title2"] = label_title2

    local xsyd_content_label2 = fc.FLabel:createBMFont()
    xsyd_content_label2:setSize(cc.size(320,120))
    xsyd_content_label2:setWidth(340)
    xsyd_content_label2:setAnchorPoint(cc.p(0.5,0.5))
    xsyd_content_label2:setFontSize(20)
    xsyd_content_label2:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步")
    xsyd_content_label2:setColor(cc.c3b(91,24,6))
    stage_story_guide_r:appendComponent(xsyd_content_label2)
    xsyd_content_label2:setPositionInContainer(cc.p(186,202))
    table_stage_story_guide["xsyd_content_label2"] = xsyd_content_label2

    return table_stage_story_guide

end

