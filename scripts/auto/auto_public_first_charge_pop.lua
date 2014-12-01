function createpublic_first_charge_pop()

    local table_public_first_charge_pop = {}

    local public_first_charge_pop = fc.FContainerPanel:create()
    public_first_charge_pop:setSize(cc.size(960,640))
    table_public_first_charge_pop["public_first_charge_pop"] = public_first_charge_pop

    local pf_bottom_panel = fc.FContainerPanel:create()
    pf_bottom_panel:setSize(cc.size(559,579))
    pf_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_first_charge_pop:appendComponent(pf_bottom_panel)
    pf_bottom_panel:setPositionInContainer(cc.p(479.5,312.5))
    table_public_first_charge_pop["pf_bottom_panel"] = pf_bottom_panel

    local bg_image_l = fc.FExtensionsImage:create()
    bg_image_l:setImage("nobatch/ditu_shouchongtankuang.png")
    bg_image_l:setSize(cc.size(210,495))
    bg_image_l:setFlipType(2)
    bg_image_l:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(bg_image_l)
    bg_image_l:setPositionInContainer(cc.p(174,291.5))
    table_public_first_charge_pop["bg_image_l"] = bg_image_l

    local bg_image_r = fc.FExtensionsImage:create()
    bg_image_r:setImage("nobatch/ditu_shouchongtankuang.png")
    bg_image_r:setSize(cc.size(210,495))
    bg_image_r:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(bg_image_r)
    bg_image_r:setPositionInContainer(cc.p(384,291.5))
    table_public_first_charge_pop["bg_image_r"] = bg_image_r

    local scjl_zhou_up = fc.FExtensionsImage:create()
    scjl_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    scjl_zhou_up:setSize(cc.size(52,534))
    scjl_zhou_up:setRotation(90)
    scjl_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(scjl_zhou_up)
    scjl_zhou_up:setPositionInContainer(cc.p(279,26))
    table_public_first_charge_pop["scjl_zhou_up"] = scjl_zhou_up

    local lingqu_btn = fc.FScaleButton:create()
    lingqu_btn:setSize(cc.size(146,53))
    lingqu_btn:setAnchorPoint(cc.p(0.5,0.5))
    lingqu_btn:setButtonImage("batch_ui/teshuanniu.png")
    pf_bottom_panel:appendComponent(lingqu_btn)
    lingqu_btn:setPositionInContainer(cc.p(175,485.5))
    table_public_first_charge_pop["lingqu_btn"] = lingqu_btn

    local scjl_ui_ling = fc.FShaderExtensionsImage:create(0)
    scjl_ui_ling:setAnchorPoint(cc.p(0.5,0.5))
    scjl_ui_ling:setImage("batch_ui/ling_uizi.png")
    scjl_ui_ling:setSize(cc.size(32,32))
    lingqu_btn:appendComponent(scjl_ui_ling)
    scjl_ui_ling:setPositionInContainer(cc.p(43,26))
    table_public_first_charge_pop["scjl_ui_ling"] = scjl_ui_ling

    local scjl_ui_qu = fc.FShaderExtensionsImage:create(0)
    scjl_ui_qu:setAnchorPoint(cc.p(0.5,0.5))
    scjl_ui_qu:setImage("batch_ui/qu_uizi.png")
    scjl_ui_qu:setSize(cc.size(32,32))
    lingqu_btn:appendComponent(scjl_ui_qu)
    scjl_ui_qu:setPositionInContainer(cc.p(103,26))
    table_public_first_charge_pop["scjl_ui_qu"] = scjl_ui_qu

    local scjl_label_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    scjl_label_di1:setSize(cc.size(104,30))
    scjl_label_di1:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(scjl_label_di1)
    scjl_label_di1:setPositionInContainer(cc.p(193,270))
    table_public_first_charge_pop["scjl_label_di1"] = scjl_label_di1

    local label1 = fc.FLabel:createBMFont()
    label1:setSize(cc.size(100,25))
    label1:setAnchorPoint(cc.p(0.5,0.5))
    label1:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	label1:setString("元寶翻倍")
    else
    	label1:setString("元宝翻倍")
    end
    label1:setColor(cc.c3b(139,255,240))
    pf_bottom_panel:appendComponent(label1)
    label1:setPositionInContainer(cc.p(191,266.5))
    table_public_first_charge_pop["label1"] = label1

    local scjl_label_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    scjl_label_di2:setSize(cc.size(104,30))
    scjl_label_di2:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(scjl_label_di2)
    scjl_label_di2:setPositionInContainer(cc.p(366,270))
    table_public_first_charge_pop["scjl_label_di2"] = scjl_label_di2

    local label2 = fc.FLabel:createBMFont()
    label2:setSize(cc.size(100,25))
    label2:setAnchorPoint(cc.p(0.5,0.5))
    label2:setFontSize(20)
    label2:setString("物品2")
    label2:setColor(cc.c3b(139,255,240))
    pf_bottom_panel:appendComponent(label2)
    label2:setPositionInContainer(cc.p(365,266.5))
    table_public_first_charge_pop["label2"] = label2

    local scjl_label_di3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    scjl_label_di3:setSize(cc.size(104,30))
    scjl_label_di3:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(scjl_label_di3)
    scjl_label_di3:setPositionInContainer(cc.p(193,434))
    table_public_first_charge_pop["scjl_label_di3"] = scjl_label_di3

    local label3 = fc.FLabel:createBMFont()
    label3:setSize(cc.size(100,25))
    label3:setAnchorPoint(cc.p(0.5,0.5))
    label3:setFontSize(20)
    label3:setString("物品3")
    label3:setColor(cc.c3b(139,255,240))
    pf_bottom_panel:appendComponent(label3)
    label3:setPositionInContainer(cc.p(191,430.5))
    table_public_first_charge_pop["label3"] = label3

    local scjl_label_di4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    scjl_label_di4:setSize(cc.size(104,30))
    scjl_label_di4:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(scjl_label_di4)
    scjl_label_di4:setPositionInContainer(cc.p(366,434))
    table_public_first_charge_pop["scjl_label_di4"] = scjl_label_di4

    local label4 = fc.FLabel:createBMFont()
    label4:setSize(cc.size(100,25))
    label4:setAnchorPoint(cc.p(0.5,0.5))
    label4:setFontSize(20)
    label4:setString("物品4")
    label4:setColor(cc.c3b(139,255,240))
    pf_bottom_panel:appendComponent(label4)
    label4:setPositionInContainer(cc.p(365,430.5))
    table_public_first_charge_pop["label4"] = label4

    local scjl_zhou_down = fc.FExtensionsImage:create()
    scjl_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    scjl_zhou_down:setSize(cc.size(52,534))
    scjl_zhou_down:setRotation(90)
    scjl_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(scjl_zhou_down)
    scjl_zhou_down:setPositionInContainer(cc.p(279,545))
    table_public_first_charge_pop["scjl_zhou_down"] = scjl_zhou_down

    local scjl_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    scjl_title_bg:setSize(cc.size(350,50))
    scjl_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    scjl_title_bg:setScaleY(-1)
    pf_bottom_panel:appendComponent(scjl_title_bg)
    scjl_title_bg:setPositionInContainer(cc.p(279,25))
    table_public_first_charge_pop["scjl_title_bg"] = scjl_title_bg

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou.png")
    shou:setSize(cc.size(59,59))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(shou)
    shou:setPositionInContainer(cc.p(196.5,23.5))
    table_public_first_charge_pop["shou"] = shou

    local chong = fc.FExtensionsImage:create()
    chong:setImage("batch_ui/chong1.png")
    chong:setSize(cc.size(59,59))
    chong:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(chong)
    chong:setPositionInContainer(cc.p(251.5,23.5))
    table_public_first_charge_pop["chong"] = chong

    local fan = fc.FExtensionsImage:create()
    fan:setImage("batch_ui/fan1.png")
    fan:setSize(cc.size(59,59))
    fan:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(fan)
    fan:setPositionInContainer(cc.p(306.5,23.5))
    table_public_first_charge_pop["fan"] = fan

    local bei = fc.FExtensionsImage:create()
    bei:setImage("batch_ui/bei1.png")
    bei:setSize(cc.size(59,59))
    bei:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(bei)
    bei:setPositionInContainer(cc.p(361.5,23.5))
    table_public_first_charge_pop["bei"] = bei

    local fc_close_btn = fc.FScaleButton:create()
    fc_close_btn:setSize(cc.size(35,35))
    fc_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    fc_close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    pf_bottom_panel:appendComponent(fc_close_btn)
    fc_close_btn:setPositionInContainer(cc.p(498.5,26.5))
    table_public_first_charge_pop["fc_close_btn"] = fc_close_btn

    local chongzhi_btn = fc.FScaleButton:create()
    chongzhi_btn:setSize(cc.size(146,53))
    chongzhi_btn:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi_btn:setButtonImage("batch_ui/teshuanniu.png")
    pf_bottom_panel:appendComponent(chongzhi_btn)
    chongzhi_btn:setPositionInContainer(cc.p(383,485.5))
    table_public_first_charge_pop["chongzhi_btn"] = chongzhi_btn

    local chong_uu = fc.FExtensionsImage:create()
    chong_uu:setImage("batch_ui/chong_uizi.png")
    chong_uu:setSize(cc.size(32,32))
    chong_uu:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi_btn:appendComponent(chong_uu)
    chong_uu:setPositionInContainer(cc.p(44,26))
    table_public_first_charge_pop["chong_uu"] = chong_uu

    local zhi_uu = fc.FExtensionsImage:create()
    zhi_uu:setImage("batch_ui/zhi_uizi.png")
    zhi_uu:setSize(cc.size(32,32))
    zhi_uu:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi_btn:appendComponent(zhi_uu)
    zhi_uu:setPositionInContainer(cc.p(102,26))
    table_public_first_charge_pop["zhi_uu"] = zhi_uu

    local btn1 = fc.FContainerPanel:create()
    btn1:setSize(cc.size(104,104))
    btn1:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(btn1)
    btn1:setPositionInContainer(cc.p(193,195))
    table_public_first_charge_pop["btn1"] = btn1

    local btn2 = fc.FContainerPanel:create()
    btn2:setSize(cc.size(104,104))
    btn2:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(btn2)
    btn2:setPositionInContainer(cc.p(366,195))
    table_public_first_charge_pop["btn2"] = btn2

    local btn3 = fc.FContainerPanel:create()
    btn3:setSize(cc.size(104,104))
    btn3:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(btn3)
    btn3:setPositionInContainer(cc.p(193,356))
    table_public_first_charge_pop["btn3"] = btn3

    local btn4 = fc.FContainerPanel:create()
    btn4:setSize(cc.size(104,104))
    btn4:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(btn4)
    btn4:setPositionInContainer(cc.p(366,357))
    table_public_first_charge_pop["btn4"] = btn4

    local reward_item1 = fc.FExtensionsImage:create()
    reward_item1:setImage("batch_ui/baipinzhi_kuang.png")
    reward_item1:setSize(cc.size(104,104))
    reward_item1:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(reward_item1)
    reward_item1:setPositionInContainer(cc.p(193,195))
    table_public_first_charge_pop["reward_item1"] = reward_item1

    local reward_item2 = fc.FExtensionsImage:create()
    reward_item2:setImage("batch_ui/baipinzhi_kuang.png")
    reward_item2:setSize(cc.size(104,104))
    reward_item2:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(reward_item2)
    reward_item2:setPositionInContainer(cc.p(366,195))
    table_public_first_charge_pop["reward_item2"] = reward_item2

    local reward_item3 = fc.FExtensionsImage:create()
    reward_item3:setImage("batch_ui/baipinzhi_kuang.png")
    reward_item3:setSize(cc.size(104,104))
    reward_item3:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(reward_item3)
    reward_item3:setPositionInContainer(cc.p(193,357))
    table_public_first_charge_pop["reward_item3"] = reward_item3

    local reward_item4 = fc.FExtensionsImage:create()
    reward_item4:setImage("batch_ui/baipinzhi_kuang.png")
    reward_item4:setSize(cc.size(104,104))
    reward_item4:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(reward_item4)
    reward_item4:setPositionInContainer(cc.p(366,357))
    table_public_first_charge_pop["reward_item4"] = reward_item4

    local item1 = fc.FExtensionsImage:create()
    item1:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(item1)
    item1:setPositionInContainer(cc.p(193,195))
    table_public_first_charge_pop["item1"] = item1

    local item2 = fc.FExtensionsImage:create()
    item2:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(item2)
    item2:setPositionInContainer(cc.p(366,195))
    table_public_first_charge_pop["item2"] = item2

    local item3 = fc.FExtensionsImage:create()
    item3:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(item3)
    item3:setPositionInContainer(cc.p(193,357))
    table_public_first_charge_pop["item3"] = item3

    local item4 = fc.FExtensionsImage:create()
    item4:setAnchorPoint(cc.p(0.5,0.5))
    pf_bottom_panel:appendComponent(item4)
    item4:setPositionInContainer(cc.p(366,357))
    table_public_first_charge_pop["item4"] = item4

    local fc_item_count2 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    fc_item_count2:setAnchorPoint(cc.p(0.5,0.5))
    fc_item_count2:setSize(cc.size(80,20))
    fc_item_count2:setAlignment(2)
    fc_item_count2:setScale(0.45)
    public_first_charge_pop:appendComponent(fc_item_count2)
    fc_item_count2:setPositionInContainer(cc.p(594,254))
    table_public_first_charge_pop["fc_item_count2"] = fc_item_count2

    local fc_item_count3 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    fc_item_count3:setAnchorPoint(cc.p(0.5,0.5))
    fc_item_count3:setSize(cc.size(80,20))
    fc_item_count3:setAlignment(2)
    fc_item_count3:setScale(0.45)
    public_first_charge_pop:appendComponent(fc_item_count3)
    fc_item_count3:setPositionInContainer(cc.p(423,418))
    table_public_first_charge_pop["fc_item_count3"] = fc_item_count3

    local fc_item_count4 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    fc_item_count4:setAnchorPoint(cc.p(0.5,0.5))
    fc_item_count4:setSize(cc.size(80,20))
    fc_item_count4:setAlignment(2)
    fc_item_count4:setScale(0.45)
    public_first_charge_pop:appendComponent(fc_item_count4)
    fc_item_count4:setPositionInContainer(cc.p(594,418))
    table_public_first_charge_pop["fc_item_count4"] = fc_item_count4

    return table_public_first_charge_pop

end

