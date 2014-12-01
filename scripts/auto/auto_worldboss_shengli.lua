function createworldboss_shengli()

    local table_worldboss_shengli = {}

    local worldboss_shengli = fc.FContainerPanel:create()
    worldboss_shengli:setSize(cc.size(960,640))
    table_worldboss_shengli["worldboss_shengli"] = worldboss_shengli

    local bottom_panel = fc.FContainerPanel:create()
    bottom_panel:setSize(cc.size(700,600))
    bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    worldboss_shengli:appendComponent(bottom_panel)
    bottom_panel:setPositionInContainer(cc.p(505,301))
    table_worldboss_shengli["bottom_panel"] = bottom_panel

    local shengli_bg_left = fc.FExtensionsImage:create()
    shengli_bg_left:setImage("nobatch/shengli.png")
    shengli_bg_left:setSize(cc.size(202,488))
    shengli_bg_left:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_bg_left)
    shengli_bg_left:setPositionInContainer(cc.p(230,337))
    table_worldboss_shengli["shengli_bg_left"] = shengli_bg_left

    local shengli_bg_right = fc.FExtensionsImage:create()
    shengli_bg_right:setImage("nobatch/shengli.png")
    shengli_bg_right:setSize(cc.size(202,488))
    shengli_bg_right:setFlipType(2)
    shengli_bg_right:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_bg_right)
    shengli_bg_right:setPositionInContainer(cc.p(432,337))
    table_worldboss_shengli["shengli_bg_right"] = shengli_bg_right

    local hurt_des1 = fc.FLabel:createBMFont()
    hurt_des1:setSize(cc.size(120,30))
    hurt_des1:setAnchorPoint(cc.p(0.5,0.5))
    hurt_des1:setFontSize(25)
    hurt_des1:setString("启奏皇上:")
    hurt_des1:setColor(cc.c3b(91,24,6))
    hurt_des1:setAlignment(0)
    bottom_panel:appendComponent(hurt_des1)
    hurt_des1:setPositionInContainer(cc.p(235,159))
    table_worldboss_shengli["hurt_des1"] = hurt_des1

    local hurtdes2 = fc.FLabel:createBMFont()
    hurtdes2:setSize(cc.size(240,30))
    hurtdes2:setAnchorPoint(cc.p(0.5,0.5))
    hurtdes2:setFontSize(25)
    hurtdes2:setString("本次挑战共计给BOSS")
    hurtdes2:setColor(cc.c3b(91,24,6))
    hurtdes2:setAlignment(0)
    bottom_panel:appendComponent(hurtdes2)
    hurtdes2:setPositionInContainer(cc.p(367,208))
    table_worldboss_shengli["hurtdes2"] = hurtdes2

    local hurt_des3 = fc.FLabel:createBMFont()
    hurt_des3:setSize(cc.size(120,30))
    hurt_des3:setAnchorPoint(cc.p(0.5,0.5))
    hurt_des3:setFontSize(25)
    hurt_des3:setString("造成伤害：")
    hurt_des3:setColor(cc.c3b(91,24,6))
    hurt_des3:setAlignment(0)
    bottom_panel:appendComponent(hurt_des3)
    hurt_des3:setPositionInContainer(cc.p(235,258))
    table_worldboss_shengli["hurt_des3"] = hurt_des3

    local title_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/shengli_biaotikuang.png",cc.rect(233,30,5,5))
    title_bg_image:setSize(cc.size(578,87))
    title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(title_bg_image)
    title_bg_image:setPositionInContainer(cc.p(327,84.5))
    table_worldboss_shengli["title_bg_image"] = title_bg_image

    local line_l = fc.FExtensionsImage:create()
    line_l:setImage("batch_ui/sheng_shengli.png")
    line_l:setSize(cc.size(27,73))
    line_l:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(line_l)
    line_l:setPositionInContainer(cc.p(182.5,36.5))
    table_worldboss_shengli["line_l"] = line_l

    local line_r = fc.FExtensionsImage:create()
    line_r:setImage("batch_ui/sheng_shengli.png")
    line_r:setSize(cc.size(27,73))
    line_r:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(line_r)
    line_r:setPositionInContainer(cc.p(488.5,36.5))
    table_worldboss_shengli["line_r"] = line_r

    local sui = fc.FExtensionsImage:create()
    sui:setImage("batch_ui/sui_shengli.png")
    sui:setSize(cc.size(80,179))
    sui:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(sui)
    sui:setPositionInContainer(cc.p(86,175.5))
    table_worldboss_shengli["sui"] = sui

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(574,175.5))
    table_worldboss_shengli["sui2"] = sui2

    local shengli_queding_button = fc.FScaleButton:create()
    shengli_queding_button:setSize(cc.size(144,53))
    shengli_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    shengli_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(shengli_queding_button)
    shengli_queding_button:setPositionInContainer(cc.p(338,430.5))
    table_worldboss_shengli["shengli_queding_button"] = shengli_queding_button

    local que = fc.FExtensionsImage:create()
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    que:setAnchorPoint(cc.p(0.5,0.5))
    shengli_queding_button:appendComponent(que)
    que:setPositionInContainer(cc.p(46,26))
    table_worldboss_shengli["que"] = que

    local ding = fc.FExtensionsImage:create()
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    ding:setAnchorPoint(cc.p(0.5,0.5))
    shengli_queding_button:appendComponent(ding)
    ding:setPositionInContainer(cc.p(98,26))
    table_worldboss_shengli["ding"] = ding

    local hurt_label = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE))
    hurt_label:setAnchorPoint(cc.p(0.5,0.5))
    hurt_label:setSize(cc.size(100,30))
    hurt_label:setAlignment(0)
    hurt_label:setScale(0.8)
    bottom_panel:appendComponent(hurt_label)
    hurt_label:setPositionInContainer(cc.p(337,308))
    table_worldboss_shengli["hurt_label"] = hurt_label

    local tip1 = fc.FLabel:createBMFont()
    tip1:setSize(cc.size(210,30))
    tip1:setAnchorPoint(cc.p(0.5,0.5))
    tip1:setFontSize(25)
    tip1:setString("本次获得的功绩值：")
    tip1:setColor(cc.c3b(91,24,6))
    tip1:setAlignment(0)
    bottom_panel:appendComponent(tip1)
    tip1:setPositionInContainer(cc.p(280,362))
    table_worldboss_shengli["tip1"] = tip1

    local tip1_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    tip1_di:setSize(cc.size(110,30))
    tip1_di:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(tip1_di)
    tip1_di:setPositionInContainer(cc.p(440,363))
    table_worldboss_shengli["tip1_di"] = tip1_di

    local reward_contri = fc.FLabel:createBMFont()
    reward_contri:setSize(cc.size(80,30))
    reward_contri:setAnchorPoint(cc.p(0.5,0.5))
    reward_contri:setFontSize(21)
    reward_contri:setString("100000")
    reward_contri:setColor(cc.c3b(0,255,255))
    bottom_panel:appendComponent(reward_contri)
    reward_contri:setPositionInContainer(cc.p(439,359))
    table_worldboss_shengli["reward_contri"] = reward_contri

    return table_worldboss_shengli

end

