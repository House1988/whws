function createzhanyi_14th_map()

    local table_zhanyi_14th_map = {}

    local zhanyi_14th_map = fc.FContainerPanel:create()
    zhanyi_14th_map:setSize(cc.size(960,640))
    table_zhanyi_14th_map["zhanyi_14th_map"] = zhanyi_14th_map

    local sfxj_zy_ditubg_image = fc.FExtensionsImage:create()
    sfxj_zy_ditubg_image:setImage("nobatch/zhengfumeizhou.png")
    sfxj_zy_ditubg_image:setSize(cc.size(701,443))
    sfxj_zy_ditubg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_14th_map:appendComponent(sfxj_zy_ditubg_image)
    sfxj_zy_ditubg_image:setPositionInContainer(cc.p(480.5,346.5))
    table_zhanyi_14th_map["sfxj_zy_ditubg_image"] = sfxj_zy_ditubg_image

    local small_battle_button5 = fc.FContainerPanel:create()
    small_battle_button5:setSize(cc.size(50,75))
    small_battle_button5:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_14th_map:appendComponent(small_battle_button5)
    small_battle_button5:setPositionInContainer(cc.p(284,245.5))
    table_zhanyi_14th_map["small_battle_button5"] = small_battle_button5

    local small_battle_button_label5 = fc.FLabel:createBMFont()
    small_battle_button_label5:setSize(cc.size(165,36))
    small_battle_button_label5:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label5:setFontSize(32)
    small_battle_button_label5:setString("兵")
    small_battle_button_label5:setColor(cc.c3b(41,3,0))
    zhanyi_14th_map:appendComponent(small_battle_button_label5)
    small_battle_button_label5:setPositionInContainer(cc.p(174.5,245))
    table_zhanyi_14th_map["small_battle_button_label5"] = small_battle_button_label5

    local small_battle_button4 = fc.FContainerPanel:create()
    small_battle_button4:setSize(cc.size(50,75))
    small_battle_button4:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_14th_map:appendComponent(small_battle_button4)
    small_battle_button4:setPositionInContainer(cc.p(393,299.5))
    table_zhanyi_14th_map["small_battle_button4"] = small_battle_button4

    local small_battle_button_label4 = fc.FLabel:createBMFont()
    small_battle_button_label4:setSize(cc.size(165,36))
    small_battle_button_label4:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label4:setFontSize(32)
    small_battle_button_label4:setString("兵")
    small_battle_button_label4:setColor(cc.c3b(41,3,0))
    zhanyi_14th_map:appendComponent(small_battle_button_label4)
    small_battle_button_label4:setPositionInContainer(cc.p(396.5,358))
    table_zhanyi_14th_map["small_battle_button_label4"] = small_battle_button_label4

    local small_battle_button3 = fc.FContainerPanel:create()
    small_battle_button3:setSize(cc.size(71,66))
    small_battle_button3:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_14th_map:appendComponent(small_battle_button3)
    small_battle_button3:setPositionInContainer(cc.p(543.5,248))
    table_zhanyi_14th_map["small_battle_button3"] = small_battle_button3

    local small_battle_button_label3 = fc.FLabel:createBMFont()
    small_battle_button_label3:setSize(cc.size(165,36))
    small_battle_button_label3:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label3:setFontSize(32)
    small_battle_button_label3:setString("兵")
    small_battle_button_label3:setColor(cc.c3b(41,3,0))
    zhanyi_14th_map:appendComponent(small_battle_button_label3)
    small_battle_button_label3:setPositionInContainer(cc.p(549.5,197))
    table_zhanyi_14th_map["small_battle_button_label3"] = small_battle_button_label3

    local small_battle_button2 = fc.FContainerPanel:create()
    small_battle_button2:setSize(cc.size(71,66))
    small_battle_button2:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_14th_map:appendComponent(small_battle_button2)
    small_battle_button2:setPositionInContainer(cc.p(646.5,338))
    table_zhanyi_14th_map["small_battle_button2"] = small_battle_button2

    local small_battle_button_label2 = fc.FLabel:createBMFont()
    small_battle_button_label2:setSize(cc.size(165,36))
    small_battle_button_label2:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label2:setFontSize(32)
    small_battle_button_label2:setString("兵")
    small_battle_button_label2:setColor(cc.c3b(41,3,0))
    zhanyi_14th_map:appendComponent(small_battle_button_label2)
    small_battle_button_label2:setPositionInContainer(cc.p(741.5,294))
    table_zhanyi_14th_map["small_battle_button_label2"] = small_battle_button_label2

    local small_battle_button1 = fc.FContainerPanel:create()
    small_battle_button1:setSize(cc.size(71,66))
    small_battle_button1:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_14th_map:appendComponent(small_battle_button1)
    small_battle_button1:setPositionInContainer(cc.p(724.5,476))
    table_zhanyi_14th_map["small_battle_button1"] = small_battle_button1

    local small_battle_button_label1 = fc.FLabel:createBMFont()
    small_battle_button_label1:setSize(cc.size(165,36))
    small_battle_button_label1:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label1:setFontSize(32)
    small_battle_button_label1:setString("兵")
    small_battle_button_label1:setColor(cc.c3b(41,3,0))
    zhanyi_14th_map:appendComponent(small_battle_button_label1)
    small_battle_button_label1:setPositionInContainer(cc.p(728.5,526))
    table_zhanyi_14th_map["small_battle_button_label1"] = small_battle_button_label1

    return table_zhanyi_14th_map

end

