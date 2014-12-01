function createzhanyi_13th_map()

    local table_zhanyi_13th_map = {}

    local zhanyi_13th_map = fc.FContainerPanel:create()
    zhanyi_13th_map:setSize(cc.size(960,640))
    table_zhanyi_13th_map["zhanyi_13th_map"] = zhanyi_13th_map

    local jwzr_zy_ditubg_image = fc.FExtensionsImage:create()
    jwzr_zy_ditubg_image:setImage("nobatch/zhengfuouzhou.png")
    jwzr_zy_ditubg_image:setSize(cc.size(701,443))
    jwzr_zy_ditubg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_13th_map:appendComponent(jwzr_zy_ditubg_image)
    jwzr_zy_ditubg_image:setPositionInContainer(cc.p(480.5,346.5))
    table_zhanyi_13th_map["jwzr_zy_ditubg_image"] = jwzr_zy_ditubg_image

    local small_battle_button_label5 = fc.FLabel:createBMFont()
    small_battle_button_label5:setSize(cc.size(165,36))
    small_battle_button_label5:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label5:setFontSize(32)
    small_battle_button_label5:setString("兵")
    small_battle_button_label5:setColor(cc.c3b(41,3,0))
    zhanyi_13th_map:appendComponent(small_battle_button_label5)
    small_battle_button_label5:setPositionInContainer(cc.p(324.5,246))
    table_zhanyi_13th_map["small_battle_button_label5"] = small_battle_button_label5

    local small_battle_button4 = fc.FContainerPanel:create()
    small_battle_button4:setSize(cc.size(50,75))
    small_battle_button4:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_13th_map:appendComponent(small_battle_button4)
    small_battle_button4:setPositionInContainer(cc.p(268,377.5))
    table_zhanyi_13th_map["small_battle_button4"] = small_battle_button4

    local small_battle_button_label4 = fc.FLabel:createBMFont()
    small_battle_button_label4:setSize(cc.size(165,36))
    small_battle_button_label4:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label4:setFontSize(32)
    small_battle_button_label4:setString("兵")
    small_battle_button_label4:setColor(cc.c3b(41,3,0))
    zhanyi_13th_map:appendComponent(small_battle_button_label4)
    small_battle_button_label4:setPositionInContainer(cc.p(261.5,430))
    table_zhanyi_13th_map["small_battle_button_label4"] = small_battle_button_label4

    local small_battle_button2 = fc.FContainerPanel:create()
    small_battle_button2:setSize(cc.size(71,66))
    small_battle_button2:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_13th_map:appendComponent(small_battle_button2)
    small_battle_button2:setPositionInContainer(cc.p(383.5,466))
    table_zhanyi_13th_map["small_battle_button2"] = small_battle_button2

    local small_battle_button_label2 = fc.FLabel:createBMFont()
    small_battle_button_label2:setSize(cc.size(165,36))
    small_battle_button_label2:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label2:setFontSize(32)
    small_battle_button_label2:setString("兵")
    small_battle_button_label2:setColor(cc.c3b(41,3,0))
    zhanyi_13th_map:appendComponent(small_battle_button_label2)
    small_battle_button_label2:setPositionInContainer(cc.p(383.5,509))
    table_zhanyi_13th_map["small_battle_button_label2"] = small_battle_button_label2

    local small_battle_button1 = fc.FContainerPanel:create()
    small_battle_button1:setSize(cc.size(71,66))
    small_battle_button1:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_13th_map:appendComponent(small_battle_button1)
    small_battle_button1:setPositionInContainer(cc.p(643.5,365))
    table_zhanyi_13th_map["small_battle_button1"] = small_battle_button1

    local small_battle_button_label1 = fc.FLabel:createBMFont()
    small_battle_button_label1:setSize(cc.size(165,36))
    small_battle_button_label1:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label1:setFontSize(32)
    small_battle_button_label1:setString("兵")
    small_battle_button_label1:setColor(cc.c3b(41,3,0))
    zhanyi_13th_map:appendComponent(small_battle_button_label1)
    small_battle_button_label1:setPositionInContainer(cc.p(646.5,316))
    table_zhanyi_13th_map["small_battle_button_label1"] = small_battle_button_label1

    local small_battle_button3 = fc.FContainerPanel:create()
    small_battle_button3:setSize(cc.size(71,66))
    small_battle_button3:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_13th_map:appendComponent(small_battle_button3)
    small_battle_button3:setPositionInContainer(cc.p(417.5,337))
    table_zhanyi_13th_map["small_battle_button3"] = small_battle_button3

    local small_battle_button_label3 = fc.FLabel:createBMFont()
    small_battle_button_label3:setSize(cc.size(165,36))
    small_battle_button_label3:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label3:setFontSize(32)
    small_battle_button_label3:setString("兵")
    small_battle_button_label3:setColor(cc.c3b(41,3,0))
    zhanyi_13th_map:appendComponent(small_battle_button_label3)
    small_battle_button_label3:setPositionInContainer(cc.p(417.5,287))
    table_zhanyi_13th_map["small_battle_button_label3"] = small_battle_button_label3

    local small_battle_button5 = fc.FContainerPanel:create()
    small_battle_button5:setSize(cc.size(50,75))
    small_battle_button5:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_13th_map:appendComponent(small_battle_button5)
    small_battle_button5:setPositionInContainer(cc.p(217,251.5))
    table_zhanyi_13th_map["small_battle_button5"] = small_battle_button5

    return table_zhanyi_13th_map

end

