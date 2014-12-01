function createxinshouyindao_content()

    local table_xinshouyindao_content = {}

    local xinshouyindao_content = fc.FContainerPanel:create()
    xinshouyindao_content:setSize(cc.size(560,315))
    table_xinshouyindao_content["xinshouyindao_content"] = xinshouyindao_content

    local xsyd_zouzhang1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    xsyd_zouzhang1_scale9:setSize(cc.size(126,198))
    xsyd_zouzhang1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    xinshouyindao_content:appendComponent(xsyd_zouzhang1_scale9)
    xsyd_zouzhang1_scale9:setPositionInContainer(cc.p(178,210))
    table_xinshouyindao_content["xsyd_zouzhang1_scale9"] = xsyd_zouzhang1_scale9

    local xsyd_zouzhang2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    xsyd_zouzhang2_scale9:setSize(cc.size(197,187))
    xsyd_zouzhang2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    xinshouyindao_content:appendComponent(xsyd_zouzhang2_scale9)
    xsyd_zouzhang2_scale9:setPositionInContainer(cc.p(337.5,209.5))
    table_xinshouyindao_content["xsyd_zouzhang2_scale9"] = xsyd_zouzhang2_scale9

    local xsyd_zouzhang4_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    xsyd_zouzhang4_scale9:setSize(cc.size(126,198))
    xsyd_zouzhang4_scale9:setAnchorPoint(cc.p(0.5,0.5))
    xsyd_zouzhang4_scale9:setScaleX(-1)
    xinshouyindao_content:appendComponent(xsyd_zouzhang4_scale9)
    xsyd_zouzhang4_scale9:setPositionInContainer(cc.p(497,210))
    table_xinshouyindao_content["xsyd_zouzhang4_scale9"] = xsyd_zouzhang4_scale9

    local xsyd_content_label = fc.FLabel:createBMFont()
    xsyd_content_label:setSize(cc.size(320,120))
    xsyd_content_label:setWidth(340)
    xsyd_content_label:setAnchorPoint(cc.p(0.5,0.5))
    xsyd_content_label:setFontSize(20)
    xsyd_content_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步")
    xsyd_content_label:setColor(cc.c3b(104,36,1))
    xinshouyindao_content:appendComponent(xsyd_content_label)
    xsyd_content_label:setPositionInContainer(cc.p(374,205))
    table_xinshouyindao_content["xsyd_content_label"] = xsyd_content_label

    local xsyd_jiantou = fc.FExtensionsImage:create()
    xsyd_jiantou:setImage("batch_ui/jiantou_xinshouyindao.png")
    xsyd_jiantou:setSize(cc.size(58,38))
    xsyd_jiantou:setAnchorPoint(cc.p(0.5,0.5))
    xinshouyindao_content:appendComponent(xsyd_jiantou)
    xsyd_jiantou:setPositionInContainer(cc.p(519,279))
    table_xinshouyindao_content["xsyd_jiantou"] = xsyd_jiantou

    local yindao_person = fc.FExtensionsImage:create()
    yindao_person:setImage("nobatch/xiaotaijian.png")
    yindao_person:setSize(cc.size(204,315))
    yindao_person:setAnchorPoint(cc.p(0.5,0.5))
    xinshouyindao_content:appendComponent(yindao_person)
    yindao_person:setPositionInContainer(cc.p(102,157.5))
    table_xinshouyindao_content["yindao_person"] = yindao_person

    return table_xinshouyindao_content

end

