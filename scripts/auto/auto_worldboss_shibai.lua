function createworldboss_shibai()

    local table_worldboss_shibai = {}

    local worldboss_shibai = fc.FContainerPanel:create()
    worldboss_shibai:setSize(cc.size(960,640))
    table_worldboss_shibai["worldboss_shibai"] = worldboss_shibai

    local shibai_bottom_panel = fc.FContainerPanel:create()
    shibai_bottom_panel:setSize(cc.size(700,600))
    shibai_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    worldboss_shibai:appendComponent(shibai_bottom_panel)
    shibai_bottom_panel:setPositionInContainer(cc.p(508,300))
    table_worldboss_shibai["shibai_bottom_panel"] = shibai_bottom_panel

    local shibai_bg_left = fc.FShaderExtensionsImage:create(0)
    shibai_bg_left:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bg_left:setImage("nobatch/shengli.png")
    shibai_bg_left:setSize(cc.size(202,488))
    shibai_bottom_panel:appendComponent(shibai_bg_left)
    shibai_bg_left:setPositionInContainer(cc.p(230,337))
    table_worldboss_shibai["shibai_bg_left"] = shibai_bg_left

    local shibai_bg_right = fc.FShaderExtensionsImage:create(0)
    shibai_bg_right:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bg_right:setImage("nobatch/shengli.png")
    shibai_bg_right:setSize(cc.size(202,488))
    shibai_bottom_panel:appendComponent(shibai_bg_right)
    shibai_bg_right:setPositionInContainer(cc.p(432,337))
    table_worldboss_shibai["shibai_bg_right"] = shibai_bg_right

    shibai_bg_right:setFlipType(2)
    local shibai_bg_image = fc.FShaderExtensionsImage:create(0)
    shibai_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bg_image:setImage("nobatch/shengli_biaotikuang.png")
    shibai_bg_image:setSize(cc.size(578,87))
    shibai_bottom_panel:appendComponent(shibai_bg_image)
    shibai_bg_image:setPositionInContainer(cc.p(327,84.5))
    table_worldboss_shibai["shibai_bg_image"] = shibai_bg_image

    local line_left = fc.FShaderExtensionsImage:create(0)
    line_left:setAnchorPoint(cc.p(0.5,0.5))
    line_left:setImage("batch_ui/sheng_shengli.png")
    line_left:setSize(cc.size(27,73))
    shibai_bottom_panel:appendComponent(line_left)
    line_left:setPositionInContainer(cc.p(182.5,36.5))
    table_worldboss_shibai["line_left"] = line_left

    local line_right = fc.FShaderExtensionsImage:create(0)
    line_right:setAnchorPoint(cc.p(0.5,0.5))
    line_right:setImage("batch_ui/sheng_shengli.png")
    line_right:setSize(cc.size(27,73))
    shibai_bottom_panel:appendComponent(line_right)
    line_right:setPositionInContainer(cc.p(488.5,36.5))
    table_worldboss_shibai["line_right"] = line_right

    local sui1 = fc.FShaderExtensionsImage:create(0)
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    shibai_bottom_panel:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(86,175.5))
    table_worldboss_shibai["sui1"] = sui1

    local sui2 = fc.FShaderExtensionsImage:create(0)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    shibai_bottom_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(574,175.5))
    table_worldboss_shibai["sui2"] = sui2

    sui2:setFlipType(2)
    local shibai_queding_button = fc.FScaleButton:create()
    shibai_queding_button:setSize(cc.size(144,53))
    shibai_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    shibai_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    shibai_bottom_panel:appendComponent(shibai_queding_button)
    shibai_queding_button:setPositionInContainer(cc.p(327,443.5))
    table_worldboss_shibai["shibai_queding_button"] = shibai_queding_button

    local shibai_que = fc.FShaderExtensionsImage:create(0)
    shibai_que:setAnchorPoint(cc.p(0.5,0.5))
    shibai_que:setImage("batch_ui/que_uizi.png")
    shibai_que:setSize(cc.size(32,32))
    shibai_queding_button:appendComponent(shibai_que)
    shibai_que:setPositionInContainer(cc.p(48,26))
    table_worldboss_shibai["shibai_que"] = shibai_que

    local shibai_ding = fc.FShaderExtensionsImage:create(0)
    shibai_ding:setAnchorPoint(cc.p(0.5,0.5))
    shibai_ding:setImage("batch_ui/ding_uizi.png")
    shibai_ding:setSize(cc.size(32,32))
    shibai_queding_button:appendComponent(shibai_ding)
    shibai_ding:setPositionInContainer(cc.p(96,26))
    table_worldboss_shibai["shibai_ding"] = shibai_ding

    local des1 = fc.FLabel:createBMFont()
    des1:setSize(cc.size(120,30))
    des1:setAnchorPoint(cc.p(0.5,0.5))
    des1:setFontSize(25)
    des1:setString("启奏皇上:")
    des1:setColor(cc.c3b(91,24,6))
    des1:setAlignment(0)
    shibai_bottom_panel:appendComponent(des1)
    des1:setPositionInContainer(cc.p(265,162))
    table_worldboss_shibai["des1"] = des1

    local des3 = fc.FLabel:createBMFont()
    des3:setSize(cc.size(240,30))
    des3:setAnchorPoint(cc.p(0.5,0.5))
    des3:setFontSize(25)
    des3:setString("本次挑战共计给BOSS")
    des3:setColor(cc.c3b(91,24,6))
    des3:setAlignment(0)
    shibai_bottom_panel:appendComponent(des3)
    des3:setPositionInContainer(cc.p(360,213))
    table_worldboss_shibai["des3"] = des3

    local des2 = fc.FLabel:createBMFont()
    des2:setSize(cc.size(120,30))
    des2:setAnchorPoint(cc.p(0.5,0.5))
    des2:setFontSize(25)
    des2:setString("造成伤害：")
    des2:setColor(cc.c3b(91,24,6))
    des2:setAlignment(0)
    shibai_bottom_panel:appendComponent(des2)
    des2:setPositionInContainer(cc.p(265,266))
    table_worldboss_shibai["des2"] = des2

    local hurt_shibai = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_RED_TYPE))
    hurt_shibai:setAnchorPoint(cc.p(0.5,0.5))
    hurt_shibai:setSize(cc.size(100,30))
    hurt_shibai:setAlignment(0)
    hurt_shibai:setScale(0.8)
    shibai_bottom_panel:appendComponent(hurt_shibai)
    hurt_shibai:setPositionInContainer(cc.p(328,316))
    table_worldboss_shibai["hurt_shibai"] = hurt_shibai

    local tip2 = fc.FLabel:createBMFont()
    tip2:setSize(cc.size(210,30))
    tip2:setAnchorPoint(cc.p(0.5,0.5))
    tip2:setFontSize(25)
    tip2:setString("本次获得的功绩值：")
    tip2:setColor(cc.c3b(91,24,6))
    tip2:setAlignment(0)
    shibai_bottom_panel:appendComponent(tip2)
    tip2:setPositionInContainer(cc.p(283,372))
    table_worldboss_shibai["tip2"] = tip2

    local tip2_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    tip2_di:setSize(cc.size(110,30))
    tip2_di:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(tip2_di)
    tip2_di:setPositionInContainer(cc.p(444,375))
    table_worldboss_shibai["tip2_di"] = tip2_di

    local reward_con2 = fc.FLabel:createBMFont()
    reward_con2:setSize(cc.size(80,30))
    reward_con2:setAnchorPoint(cc.p(0.5,0.5))
    reward_con2:setFontSize(21)
    reward_con2:setString("100000")
    reward_con2:setColor(cc.c3b(0,255,255))
    shibai_bottom_panel:appendComponent(reward_con2)
    reward_con2:setPositionInContainer(cc.p(445,370))
    table_worldboss_shibai["reward_con2"] = reward_con2

    return table_worldboss_shibai

end

