function createyapianzhanzheng_zhanyi()

    local table_yapianzhanzheng_zhanyi = {}

    local yapianzhanzheng_zhanyi = fc.FContainerPanel:create()
    yapianzhanzheng_zhanyi:setSize(cc.size(960,640))
    table_yapianzhanzheng_zhanyi["yapianzhanzheng_zhanyi"] = yapianzhanzheng_zhanyi

    local zf_zy_ditubg_image = fc.FExtensionsImage:create()
    zf_zy_ditubg_image:setImage("nobatch/yapianzhanzheng.png")
    zf_zy_ditubg_image:setSize(cc.size(701,443))
    zf_zy_ditubg_image:setAnchorPoint(cc.p(0.5,0.5))
    yapianzhanzheng_zhanyi:appendComponent(zf_zy_ditubg_image)
    zf_zy_ditubg_image:setPositionInContainer(cc.p(480.5,346.5))
    table_yapianzhanzheng_zhanyi["zf_zy_ditubg_image"] = zf_zy_ditubg_image

    local small_battle_button1 = fc.FContainerPanel:create()
    small_battle_button1:setSize(cc.size(50,75))
    small_battle_button1:setAnchorPoint(cc.p(0.5,0.5))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button1)
    small_battle_button1:setPositionInContainer(cc.p(343,468.5))
    table_yapianzhanzheng_zhanyi["small_battle_button1"] = small_battle_button1

    local small_battle_button_label1 = fc.FLabel:createBMFont()
    small_battle_button_label1:setSize(cc.size(165,36))
    small_battle_button_label1:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label1:setFontSize(32)
    small_battle_button_label1:setString("兵")
    small_battle_button_label1:setColor(cc.c3b(41,3,0))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button_label1)
    small_battle_button_label1:setPositionInContainer(cc.p(331.5,524))
    table_yapianzhanzheng_zhanyi["small_battle_button_label1"] = small_battle_button_label1

    local small_battle_button2 = fc.FContainerPanel:create()
    small_battle_button2:setSize(cc.size(50,75))
    small_battle_button2:setAnchorPoint(cc.p(0.5,0.5))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button2)
    small_battle_button2:setPositionInContainer(cc.p(506,392.5))
    table_yapianzhanzheng_zhanyi["small_battle_button2"] = small_battle_button2

    local small_battle_button_label2 = fc.FLabel:createBMFont()
    small_battle_button_label2:setSize(cc.size(165,36))
    small_battle_button_label2:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label2:setFontSize(32)
    small_battle_button_label2:setString("兵")
    small_battle_button_label2:setColor(cc.c3b(41,3,0))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button_label2)
    small_battle_button_label2:setPositionInContainer(cc.p(424.5,393))
    table_yapianzhanzheng_zhanyi["small_battle_button_label2"] = small_battle_button_label2

    local small_battle_button3 = fc.FContainerPanel:create()
    small_battle_button3:setSize(cc.size(50,75))
    small_battle_button3:setAnchorPoint(cc.p(0.5,0.5))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button3)
    small_battle_button3:setPositionInContainer(cc.p(635,400.5))
    table_yapianzhanzheng_zhanyi["small_battle_button3"] = small_battle_button3

    local small_battle_button_label3 = fc.FLabel:createBMFont()
    small_battle_button_label3:setSize(cc.size(165,36))
    small_battle_button_label3:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label3:setFontSize(32)
    small_battle_button_label3:setString("兵")
    small_battle_button_label3:setColor(cc.c3b(41,3,0))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button_label3)
    small_battle_button_label3:setPositionInContainer(cc.p(634.5,456))
    table_yapianzhanzheng_zhanyi["small_battle_button_label3"] = small_battle_button_label3

    local small_battle_button4 = fc.FContainerPanel:create()
    small_battle_button4:setSize(cc.size(50,75))
    small_battle_button4:setAnchorPoint(cc.p(0.5,0.5))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button4)
    small_battle_button4:setPositionInContainer(cc.p(596,234.5))
    table_yapianzhanzheng_zhanyi["small_battle_button4"] = small_battle_button4

    local small_battle_button_label4 = fc.FLabel:createBMFont()
    small_battle_button_label4:setSize(cc.size(165,36))
    small_battle_button_label4:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label4:setFontSize(32)
    small_battle_button_label4:setString("兵")
    small_battle_button_label4:setColor(cc.c3b(41,3,0))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button_label4)
    small_battle_button_label4:setPositionInContainer(cc.p(596.5,179))
    table_yapianzhanzheng_zhanyi["small_battle_button_label4"] = small_battle_button_label4

    local small_battle_button5 = fc.FContainerPanel:create()
    small_battle_button5:setSize(cc.size(50,75))
    small_battle_button5:setAnchorPoint(cc.p(0.5,0.5))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button5)
    small_battle_button5:setPositionInContainer(cc.p(513,307.5))
    table_yapianzhanzheng_zhanyi["small_battle_button5"] = small_battle_button5

    local small_battle_button_label5 = fc.FLabel:createBMFont()
    small_battle_button_label5:setSize(cc.size(165,36))
    small_battle_button_label5:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label5:setFontSize(32)
    small_battle_button_label5:setString("兵")
    small_battle_button_label5:setColor(cc.c3b(41,3,0))
    yapianzhanzheng_zhanyi:appendComponent(small_battle_button_label5)
    small_battle_button_label5:setPositionInContainer(cc.p(424.5,302))
    table_yapianzhanzheng_zhanyi["small_battle_button_label5"] = small_battle_button_label5

    return table_yapianzhanzheng_zhanyi

end

