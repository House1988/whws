function createzhongfa_zhanyi()

    local table_zhongfa_zhanyi = {}

    local zhongfa_zhanyi = fc.FContainerPanel:create()
    zhongfa_zhanyi:setSize(cc.size(960,640))
    table_zhongfa_zhanyi["zhongfa_zhanyi"] = zhongfa_zhanyi

    local zf_zy_ditubg_image = fc.FExtensionsImage:create()
    zf_zy_ditubg_image:setImage("nobatch/sanfanzhiluan.png")
    zf_zy_ditubg_image:setSize(cc.size(701,443))
    zf_zy_ditubg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhongfa_zhanyi:appendComponent(zf_zy_ditubg_image)
    zf_zy_ditubg_image:setPositionInContainer(cc.p(480.5,346.5))
    table_zhongfa_zhanyi["zf_zy_ditubg_image"] = zf_zy_ditubg_image

    local small_battle_button4 = fc.FContainerPanel:create()
    small_battle_button4:setSize(cc.size(50,75))
    small_battle_button4:setAnchorPoint(cc.p(0.5,0.5))
    zhongfa_zhanyi:appendComponent(small_battle_button4)
    small_battle_button4:setPositionInContainer(cc.p(480,456.5))
    table_zhongfa_zhanyi["small_battle_button4"] = small_battle_button4

    local small_battle_button_label4 = fc.FLabel:createBMFont()
    small_battle_button_label4:setSize(cc.size(165,36))
    small_battle_button_label4:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label4:setFontSize(32)
    small_battle_button_label4:setString("兵")
    small_battle_button_label4:setColor(cc.c3b(41,3,0))
    zhongfa_zhanyi:appendComponent(small_battle_button_label4)
    small_battle_button_label4:setPositionInContainer(cc.p(472.5,503))
    table_zhongfa_zhanyi["small_battle_button_label4"] = small_battle_button_label4

    local small_battle_button5 = fc.FContainerPanel:create()
    small_battle_button5:setSize(cc.size(50,75))
    small_battle_button5:setAnchorPoint(cc.p(0.5,0.5))
    zhongfa_zhanyi:appendComponent(small_battle_button5)
    small_battle_button5:setPositionInContainer(cc.p(281,380.5))
    table_zhongfa_zhanyi["small_battle_button5"] = small_battle_button5

    local small_battle_button_label5 = fc.FLabel:createBMFont()
    small_battle_button_label5:setSize(cc.size(165,36))
    small_battle_button_label5:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label5:setFontSize(32)
    small_battle_button_label5:setString("兵")
    small_battle_button_label5:setColor(cc.c3b(41,3,0))
    zhongfa_zhanyi:appendComponent(small_battle_button_label5)
    small_battle_button_label5:setPositionInContainer(cc.p(212.5,400))
    table_zhongfa_zhanyi["small_battle_button_label5"] = small_battle_button_label5

    local small_battle_button3 = fc.FContainerPanel:create()
    small_battle_button3:setSize(cc.size(71,66))
    small_battle_button3:setAnchorPoint(cc.p(0.5,0.5))
    zhongfa_zhanyi:appendComponent(small_battle_button3)
    small_battle_button3:setPositionInContainer(cc.p(693.5,438))
    table_zhongfa_zhanyi["small_battle_button3"] = small_battle_button3

    local small_battle_button_label3 = fc.FLabel:createBMFont()
    small_battle_button_label3:setSize(cc.size(165,36))
    small_battle_button_label3:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label3:setFontSize(32)
    small_battle_button_label3:setString("兵")
    small_battle_button_label3:setColor(cc.c3b(41,3,0))
    zhongfa_zhanyi:appendComponent(small_battle_button_label3)
    small_battle_button_label3:setPositionInContainer(cc.p(691.5,395))
    table_zhongfa_zhanyi["small_battle_button_label3"] = small_battle_button_label3

    local small_battle_button2 = fc.FContainerPanel:create()
    small_battle_button2:setSize(cc.size(71,66))
    small_battle_button2:setAnchorPoint(cc.p(0.5,0.5))
    zhongfa_zhanyi:appendComponent(small_battle_button2)
    small_battle_button2:setPositionInContainer(cc.p(572.5,322))
    table_zhongfa_zhanyi["small_battle_button2"] = small_battle_button2

    local small_battle_button_label2 = fc.FLabel:createBMFont()
    small_battle_button_label2:setSize(cc.size(165,36))
    small_battle_button_label2:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label2:setFontSize(32)
    small_battle_button_label2:setString("兵")
    small_battle_button_label2:setColor(cc.c3b(41,3,0))
    zhongfa_zhanyi:appendComponent(small_battle_button_label2)
    small_battle_button_label2:setPositionInContainer(cc.p(560.5,279))
    table_zhongfa_zhanyi["small_battle_button_label2"] = small_battle_button_label2

    local small_battle_button1 = fc.FContainerPanel:create()
    small_battle_button1:setSize(cc.size(71,66))
    small_battle_button1:setAnchorPoint(cc.p(0.5,0.5))
    zhongfa_zhanyi:appendComponent(small_battle_button1)
    small_battle_button1:setPositionInContainer(cc.p(456.5,218))
    table_zhongfa_zhanyi["small_battle_button1"] = small_battle_button1

    local small_battle_button_label1 = fc.FLabel:createBMFont()
    small_battle_button_label1:setSize(cc.size(165,36))
    small_battle_button_label1:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_button_label1:setFontSize(32)
    small_battle_button_label1:setString("兵")
    small_battle_button_label1:setColor(cc.c3b(41,3,0))
    zhongfa_zhanyi:appendComponent(small_battle_button_label1)
    small_battle_button_label1:setPositionInContainer(cc.p(458.5,175))
    table_zhongfa_zhanyi["small_battle_button_label1"] = small_battle_button_label1

    return table_zhongfa_zhanyi

end

