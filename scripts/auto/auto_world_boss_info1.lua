function createworld_boss_info1()

    local table_world_boss_info1 = {}

    local world_boss_info1 = fc.FContainerPanel:create()
    world_boss_info1:setSize(cc.size(290,30))
    table_world_boss_info1["world_boss_info1"] = world_boss_info1

    local animlabel = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    animlabel:setAnchorPoint(cc.p(0.5,0.5))
    animlabel:setSize(cc.size(28,20))
    animlabel:setAlignment(1)
    animlabel:setScale(0.8)
    world_boss_info1:appendComponent(animlabel)
    animlabel:setPositionInContainer(cc.p(25,17))
    table_world_boss_info1["animlabel"] = animlabel

    local name_label = fc.FLabel:createBMFont()
    name_label:setSize(cc.size(90,25))
    name_label:setAnchorPoint(cc.p(0.5,0.5))
    name_label:setFontSize(20)
    name_label:setString("名字五个字")
    name_label:setColor(cc.c3b(255,255,0))
    world_boss_info1:appendComponent(name_label)
    name_label:setPositionInContainer(cc.p(92,11.5))
    table_world_boss_info1["name_label"] = name_label

    local sub_label1 = fc.FLabel:createBMFont()
    sub_label1:setSize(cc.size(60,25))
    sub_label1:setAnchorPoint(cc.p(0.5,0.5))
    sub_label1:setFontSize(20)
    sub_label1:setString("99999")
    sub_label1:setColor(cc.c3b(0,255,0))
    sub_label1:setAlignment(0)
    world_boss_info1:appendComponent(sub_label1)
    sub_label1:setPositionInContainer(cc.p(175,11.5))
    table_world_boss_info1["sub_label1"] = sub_label1

    local sub_label2 = fc.FLabel:createBMFont()
    sub_label2:setSize(cc.size(40,25))
    sub_label2:setAnchorPoint(cc.p(0.5,0.5))
    sub_label2:setFontSize(20)
    sub_label2:setString("（%99）")
    sub_label2:setColor(cc.c3b(0,255,255))
    sub_label2:setAlignment(0)
    world_boss_info1:appendComponent(sub_label2)
    sub_label2:setPositionInContainer(cc.p(230,11.5))
    table_world_boss_info1["sub_label2"] = sub_label2

    return table_world_boss_info1

end

