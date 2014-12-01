function createrewardInfo()

    local table_rewardInfo = {}

    local rewardInfo = fc.FContainerPanel:create()
    rewardInfo:setSize(cc.size(960,640))
    table_rewardInfo["rewardInfo"] = rewardInfo

    local reward_bottom_panel = fc.FContainerPanel:create()
    reward_bottom_panel:setSize(cc.size(534,500))
    reward_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    rewardInfo:appendComponent(reward_bottom_panel)
    reward_bottom_panel:setPositionInContainer(cc.p(479,329))
    table_rewardInfo["reward_bottom_panel"] = reward_bottom_panel

    local juanzhou_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    juanzhou_la:setSize(cc.size(412,430))
    juanzhou_la:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(juanzhou_la)
    juanzhou_la:setPositionInContainer(cc.p(267,264))
    table_rewardInfo["juanzhou_la"] = juanzhou_la

    local juazhou_up = fc.FExtensionsImage:create()
    juazhou_up:setImage("nobatch/shengzhi_zhou.png")
    juazhou_up:setSize(cc.size(52,534))
    juazhou_up:setRotation(90)
    juazhou_up:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(juazhou_up)
    juazhou_up:setPositionInContainer(cc.p(267,44))
    table_rewardInfo["juazhou_up"] = juazhou_up

    local juazhou_down = fc.FExtensionsImage:create()
    juazhou_down:setImage("nobatch/shengzhi_zhou.png")
    juazhou_down:setSize(cc.size(52,534))
    juazhou_down:setRotation(90)
    juazhou_down:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(juazhou_down)
    juazhou_down:setPositionInContainer(cc.p(267,473))
    table_rewardInfo["juazhou_down"] = juazhou_down

    local title_bg_mg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg_mg:setSize(cc.size(260,50))
    title_bg_mg:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(title_bg_mg)
    title_bg_mg:setPositionInContainer(cc.p(267,41))
    table_rewardInfo["title_bg_mg"] = title_bg_mg

    local jiang_ui = fc.FExtensionsImage:create()
    jiang_ui:setImage("batch_ui/jiang.png")
    jiang_ui:setSize(cc.size(59,59))
    jiang_ui:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(jiang_ui)
    jiang_ui:setPositionInContainer(cc.p(233.5,32.5))
    table_rewardInfo["jiang_ui"] = jiang_ui

    local li_ui = fc.FExtensionsImage:create()
    li_ui:setImage("batch_ui/li1.png")
    li_ui:setSize(cc.size(59,59))
    li_ui:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(li_ui)
    li_ui:setPositionInContainer(cc.p(299.5,32.5))
    table_rewardInfo["li_ui"] = li_ui

    local ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    ui_rect3:setSize(cc.size(384,387))
    ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(ui_rect3)
    ui_rect3:setPositionInContainer(cc.p(267,259.5))
    table_rewardInfo["ui_rect3"] = ui_rect3

    local ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect1:setSize(cc.size(384,387))
    ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(ui_rect1)
    ui_rect1:setPositionInContainer(cc.p(267,259.5))
    table_rewardInfo["ui_rect1"] = ui_rect1

    local ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_rect2:setSize(cc.size(380,250))
    ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(ui_rect2)
    ui_rect2:setPositionInContainer(cc.p(267,259))
    table_rewardInfo["ui_rect2"] = ui_rect2

    local itemName = fc.FLabel:createBMFont()
    itemName:setSize(cc.size(120,30))
    itemName:setAnchorPoint(cc.p(0.5,0.5))
    itemName:setFontSize(21)
    itemName:setString("道具名字")
    itemName:setColor(cc.c3b(206,53,0))
    reward_bottom_panel:appendComponent(itemName)
    itemName:setPositionInContainer(cc.p(267,95))
    table_rewardInfo["itemName"] = itemName

    local icon_bg = fc.FExtensionsImage:create()
    icon_bg:setImage("batch_ui/teshutouxiangkuang.png")
    icon_bg:setSize(cc.size(172,172))
    icon_bg:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(icon_bg)
    icon_bg:setPositionInContainer(cc.p(267,250))
    table_rewardInfo["icon_bg"] = icon_bg

    local shouxia_btn = fc.FScaleButton:create()
    shouxia_btn:setSize(cc.size(144,53))
    shouxia_btn:setAnchorPoint(cc.p(0.5,0.5))
    shouxia_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    reward_bottom_panel:appendComponent(shouxia_btn)
    shouxia_btn:setPositionInContainer(cc.p(269,417.5))
    table_rewardInfo["shouxia_btn"] = shouxia_btn

    local ui_shou = fc.FShaderExtensionsImage:create(0)
    ui_shou:setAnchorPoint(cc.p(0.5,0.5))
    ui_shou:setImage("batch_ui/shou1_uizi.png")
    ui_shou:setSize(cc.size(32,32))
    shouxia_btn:appendComponent(ui_shou)
    ui_shou:setPositionInContainer(cc.p(54,26))
    table_rewardInfo["ui_shou"] = ui_shou

    local ui_xia = fc.FShaderExtensionsImage:create(0)
    ui_xia:setAnchorPoint(cc.p(0.5,0.5))
    ui_xia:setImage("batch_ui/xia_uizi.png")
    ui_xia:setSize(cc.size(32,32))
    shouxia_btn:appendComponent(ui_xia)
    ui_xia:setPositionInContainer(cc.p(90,26))
    table_rewardInfo["ui_xia"] = ui_xia

    local rewardIconQuality = fc.FExtensionsImage:create()
    rewardIconQuality:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(rewardIconQuality)
    rewardIconQuality:setPositionInContainer(cc.p(267,250))
    table_rewardInfo["rewardIconQuality"] = rewardIconQuality

    local rewardIcon = fc.FExtensionsImage:create()
    rewardIcon:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(rewardIcon)
    rewardIcon:setPositionInContainer(cc.p(267,250))
    table_rewardInfo["rewardIcon"] = rewardIcon

    local suipian_flag_image = fc.FExtensionsImage:create()
    suipian_flag_image:setAnchorPoint(cc.p(0.5,0.5))
    reward_bottom_panel:appendComponent(suipian_flag_image)
    suipian_flag_image:setPositionInContainer(cc.p(309,294))
    table_rewardInfo["suipian_flag_image"] = suipian_flag_image

    return table_rewardInfo

end

