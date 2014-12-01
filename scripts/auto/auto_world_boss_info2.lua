function createworld_boss_info2()

    local table_world_boss_info2 = {}

    local world_boss_info2 = fc.FContainerPanel:create()
    world_boss_info2:setSize(cc.size(470,30))
    table_world_boss_info2["world_boss_info2"] = world_boss_info2

    local animlabel1 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    animlabel1:setAnchorPoint(cc.p(0.5,0.5))
    animlabel1:setSize(cc.size(28,20))
    animlabel1:setAlignment(1)
    animlabel1:setScale(0.8)
    world_boss_info2:appendComponent(animlabel1)
    animlabel1:setPositionInContainer(cc.p(14,17))
    table_world_boss_info2["animlabel1"] = animlabel1

    local name_label1 = fc.FLabel:createBMFont()
    name_label1:setSize(cc.size(90,25))
    name_label1:setAnchorPoint(cc.p(0.5,0.5))
    name_label1:setFontSize(20)
    name_label1:setString("名字五个字")
    name_label1:setColor(cc.c3b(255,255,0))
    world_boss_info2:appendComponent(name_label1)
    name_label1:setPositionInContainer(cc.p(90,13.5))
    table_world_boss_info2["name_label1"] = name_label1

    local sub_label11 = fc.FLabel:createBMFont()
    sub_label11:setSize(cc.size(75,25))
    sub_label11:setAnchorPoint(cc.p(0.5,0.5))
    sub_label11:setFontSize(20)
    sub_label11:setString("999999999")
    sub_label11:setColor(cc.c3b(0,255,0))
    world_boss_info2:appendComponent(sub_label11)
    sub_label11:setPositionInContainer(cc.p(195.5,13.5))
    table_world_boss_info2["sub_label11"] = sub_label11

    local sub_label22 = fc.FLabel:createBMFont()
    sub_label22:setSize(cc.size(40,25))
    sub_label22:setAnchorPoint(cc.p(0.5,0.5))
    sub_label22:setFontSize(20)
    sub_label22:setString("（%99）")
    sub_label22:setColor(cc.c3b(0,255,255))
    sub_label22:setAlignment(0)
    world_boss_info2:appendComponent(sub_label22)
    sub_label22:setPositionInContainer(cc.p(252,13.5))
    table_world_boss_info2["sub_label22"] = sub_label22

    local sub_label33 = fc.FLabel:createBMFont()
    sub_label33:setSize(cc.size(60,25))
    sub_label33:setAnchorPoint(cc.p(0.5,0.5))
    sub_label33:setFontSize(20)
    sub_label33:setString("功绩值:")
    sub_label33:setColor(cc.c3b(0,255,255))
    world_boss_info2:appendComponent(sub_label33)
    sub_label33:setPositionInContainer(cc.p(351,13.5))
    table_world_boss_info2["sub_label33"] = sub_label33

    local cur_player_contri = fc.FLabel:createBMFont()
    cur_player_contri:setSize(cc.size(80,25))
    cur_player_contri:setAnchorPoint(cc.p(0.5,0.5))
    cur_player_contri:setFontSize(20)
    cur_player_contri:setString("10000")
    cur_player_contri:setColor(cc.c3b(0,255,255))
    cur_player_contri:setAlignment(0)
    world_boss_info2:appendComponent(cur_player_contri)
    cur_player_contri:setPositionInContainer(cc.p(426,13.5))
    table_world_boss_info2["cur_player_contri"] = cur_player_contri

    return table_world_boss_info2

end

