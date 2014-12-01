function createzouzang_reward_pop()

    local table_zouzang_reward_pop = {}

    local zouzang_reward_pop = fc.FContainerPanel:create()
    zouzang_reward_pop:setSize(cc.size(960,640))
    table_zouzang_reward_pop["zouzang_reward_pop"] = zouzang_reward_pop

    local panel_bg = fc.FContainerPanel:create()
    panel_bg:setSize(cc.size(534,500))
    panel_bg:setAnchorPoint(cc.p(0.5,0.5))
    zouzang_reward_pop:appendComponent(panel_bg)
    panel_bg:setPositionInContainer(cc.p(480,320))
    table_zouzang_reward_pop["panel_bg"] = panel_bg

    local image_bg_lu = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    image_bg_lu:setSize(cc.size(432,460))
    image_bg_lu:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(image_bg_lu)
    image_bg_lu:setPositionInContainer(cc.p(267,250))
    table_zouzang_reward_pop["image_bg_lu"] = image_bg_lu

    local image_bg_up = fc.FExtensionsImage:create()
    image_bg_up:setImage("nobatch/shengzhi_zhou.png")
    image_bg_up:setSize(cc.size(52,534))
    image_bg_up:setRotation(90)
    image_bg_up:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(image_bg_up)
    image_bg_up:setPositionInContainer(cc.p(267,26))
    table_zouzang_reward_pop["image_bg_up"] = image_bg_up

    local image_bg_bottom = fc.FExtensionsImage:create()
    image_bg_bottom:setImage("nobatch/shengzhi_zhou.png")
    image_bg_bottom:setSize(cc.size(52,534))
    image_bg_bottom:setRotation(90)
    image_bg_bottom:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(image_bg_bottom)
    image_bg_bottom:setPositionInContainer(cc.p(267,474))
    table_zouzang_reward_pop["image_bg_bottom"] = image_bg_bottom

    local rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    rect1:setSize(cc.size(384,400))
    rect1:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(rect1)
    rect1:setPositionInContainer(cc.p(267,250))
    table_zouzang_reward_pop["rect1"] = rect1

    local rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    rect2:setSize(cc.size(384,400))
    rect2:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(rect2)
    rect2:setPositionInContainer(cc.p(267,250))
    table_zouzang_reward_pop["rect2"] = rect2

    local head_bg_image = fc.FExtensionsImage:create()
    head_bg_image:setImage("batch_ui/teshutouxiangkuang.png")
    head_bg_image:setSize(cc.size(172,172))
    head_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(head_bg_image)
    head_bg_image:setPositionInContainer(cc.p(264,234))
    table_zouzang_reward_pop["head_bg_image"] = head_bg_image

    local item_q_bg = fc.FExtensionsImage:create()
    item_q_bg:setImage("batch_ui/lanpinzhi_kuang.png")
    item_q_bg:setSize(cc.size(104,104))
    item_q_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(item_q_bg)
    item_q_bg:setPositionInContainer(cc.p(265,234))
    table_zouzang_reward_pop["item_q_bg"] = item_q_bg

    local head_image = fc.FExtensionsImage:create()
    head_image:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(head_image)
    head_image:setPositionInContainer(cc.p(265,235))
    table_zouzang_reward_pop["head_image"] = head_image

    local reward_name_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    reward_name_bg:setSize(cc.size(120,32))
    reward_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(reward_name_bg)
    reward_name_bg:setPositionInContainer(cc.p(264,343))
    table_zouzang_reward_pop["reward_name_bg"] = reward_name_bg

    local reward_name_label = fc.FLabel:createBMFont()
    reward_name_label:setSize(cc.size(140,30))
    reward_name_label:setAnchorPoint(cc.p(0.5,0.5))
    reward_name_label:setFontSize(21)
    reward_name_label:setString("")
    reward_name_label:setColor(cc.c3b(236,223,185))
    panel_bg:appendComponent(reward_name_label)
    reward_name_label:setPositionInContainer(cc.p(264,343))
    table_zouzang_reward_pop["reward_name_label"] = reward_name_label

    local accept_btn = fc.FScaleButton:create()
    accept_btn:setSize(cc.size(144,53))
    accept_btn:setAnchorPoint(cc.p(0.5,0.5))
    accept_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    panel_bg:appendComponent(accept_btn)
    accept_btn:setPositionInContainer(cc.p(264,407.5))
    table_zouzang_reward_pop["accept_btn"] = accept_btn

    local shou_ui = fc.FExtensionsImage:create()
    shou_ui:setImage("batch_ui/shou1_uizi.png")
    shou_ui:setSize(cc.size(32,32))
    shou_ui:setAnchorPoint(cc.p(0.5,0.5))
    accept_btn:appendComponent(shou_ui)
    shou_ui:setPositionInContainer(cc.p(52,26))
    table_zouzang_reward_pop["shou_ui"] = shou_ui

    local xia_ui = fc.FExtensionsImage:create()
    xia_ui:setImage("batch_ui/xia_uizi.png")
    xia_ui:setSize(cc.size(32,32))
    xia_ui:setAnchorPoint(cc.p(0.5,0.5))
    accept_btn:appendComponent(xia_ui)
    xia_ui:setPositionInContainer(cc.p(94,26))
    table_zouzang_reward_pop["xia_ui"] = xia_ui

    local title_label = fc.FLabel:createBMFont()
    title_label:setSize(cc.size(354,60))
    title_label:setAnchorPoint(cc.p(0.5,0.5))
    title_label:setFontSize(21)
    title_label:setString("启奏皇上，各地番国感怀我朝国威浩荡，\n特前来进贡，请皇上过目：")
    title_label:setColor(cc.c3b(0,0,0))
    title_label:setAlignment(0)
    panel_bg:appendComponent(title_label)
    title_label:setPositionInContainer(cc.p(264,100))
    table_zouzang_reward_pop["title_label"] = title_label

    local zr_count_lbl = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    zr_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    zr_count_lbl:setSize(cc.size(80,20))
    zr_count_lbl:setAlignment(2)
    zr_count_lbl:setScale(0.45)
    panel_bg:appendComponent(zr_count_lbl)
    zr_count_lbl:setPositionInContainer(cc.p(293,272))
    table_zouzang_reward_pop["zr_count_lbl"] = zr_count_lbl

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg:setSize(cc.size(260,50))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(267,25))
    table_zouzang_reward_pop["title_bg"] = title_bg

    local jiang = fc.FExtensionsImage:create()
    jiang:setImage("batch_ui/jiang.png")
    jiang:setSize(cc.size(59,59))
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(232.5,29.5))
    table_zouzang_reward_pop["jiang"] = jiang

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li1.png")
    li:setSize(cc.size(59,59))
    li:setAnchorPoint(cc.p(0.5,0.5))
    panel_bg:appendComponent(li)
    li:setPositionInContainer(cc.p(301.5,31.5))
    table_zouzang_reward_pop["li"] = li

    return table_zouzang_reward_pop

end

