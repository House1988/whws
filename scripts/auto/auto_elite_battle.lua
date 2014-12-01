function createelite_battle()

    local table_elite_battle = {}

    local elite_battle = fc.FContainerPanel:create()
    elite_battle:setSize(cc.size(960,640))
    table_elite_battle["elite_battle"] = elite_battle

    local bottom_panel = fc.FContainerPanel:create()
    bottom_panel:setSize(cc.size(534,500))
    bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    elite_battle:appendComponent(bottom_panel)
    bottom_panel:setPositionInContainer(cc.p(480,320))
    table_elite_battle["bottom_panel"] = bottom_panel

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(412,400))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(267,253))
    table_elite_battle["wen_la"] = wen_la

    local zhou_l = fc.FExtensionsImage:create()
    zhou_l:setImage("nobatch/shengzhi_zhou.png")
    zhou_l:setSize(cc.size(52,534))
    zhou_l:setRotation(90)
    zhou_l:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(zhou_l)
    zhou_l:setPositionInContainer(cc.p(267,39))
    table_elite_battle["zhou_l"] = zhou_l

    local zhou_d = fc.FExtensionsImage:create()
    zhou_d:setImage("nobatch/shengzhi_zhou.png")
    zhou_d:setSize(cc.size(52,534))
    zhou_d:setRotation(90)
    zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(zhou_d)
    zhou_d:setPositionInContainer(cc.p(267,463))
    table_elite_battle["zhou_d"] = zhou_d

    local elite_close = fc.FScaleButton:create()
    elite_close:setSize(cc.size(34,33))
    elite_close:setAnchorPoint(cc.p(0.5,0.5))
    elite_close:setButtonImage("batch_ui/guanbi_anniu2.png")
    bottom_panel:appendComponent(elite_close)
    elite_close:setPositionInContainer(cc.p(500,38.5))
    table_elite_battle["elite_close"] = elite_close

    local title_image_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(66,18,2,2))
    title_image_bg:setSize(cc.size(240,50))
    title_image_bg:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(title_image_bg)
    title_image_bg:setPositionInContainer(cc.p(267,39))
    table_elite_battle["title_image_bg"] = title_image_bg

    local tiao_ui = fc.FExtensionsImage:create()
    tiao_ui:setImage("batch_ui/tiao1.png")
    tiao_ui:setSize(cc.size(59,59))
    tiao_ui:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(tiao_ui)
    tiao_ui:setPositionInContainer(cc.p(232.5,29.5))
    table_elite_battle["tiao_ui"] = tiao_ui

    local zhan_ui = fc.FExtensionsImage:create()
    zhan_ui:setImage("batch_ui/zhan.png")
    zhan_ui:setSize(cc.size(59,59))
    zhan_ui:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(zhan_ui)
    zhan_ui:setPositionInContainer(cc.p(301.5,29.5))
    table_elite_battle["zhan_ui"] = zhan_ui

    local bg_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    bg_rect3:setSize(cc.size(384,380))
    bg_rect3:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(bg_rect3)
    bg_rect3:setPositionInContainer(cc.p(267,253))
    table_elite_battle["bg_rect3"] = bg_rect3

    local bg_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    bg_rect1:setSize(cc.size(384,380))
    bg_rect1:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(bg_rect1)
    bg_rect1:setPositionInContainer(cc.p(266,253))
    table_elite_battle["bg_rect1"] = bg_rect1

    local title_label = fc.FLabel:createSystemFont()
    title_label:setSize(cc.size(100,25))
    title_label:setAnchorPoint(cc.p(0.5,0.5))
    title_label:setFontSize(24)
    title_label:setString("步兵步兵")
    title_label:setColor(cc.c3b(206, 53, 0))
    bottom_panel:appendComponent(title_label)
    title_label:setPositionInContainer(cc.p(271,82.5))
    table_elite_battle["title_label"] = title_label

    local battle_btn = fc.FScaleButton:create()
    battle_btn:setSize(cc.size(128,92))
    battle_btn:setAnchorPoint(cc.p(0.5,0.5))
    battle_btn:setButtonImage("batch_ui/kaizhan_anniu.png")
    bottom_panel:appendComponent(battle_btn)
    battle_btn:setPositionInContainer(cc.p(275,396))
    table_elite_battle["battle_btn"] = battle_btn

    local silver_label = fc.FLabel:createBMFont()
    silver_label:setSize(cc.size(80,30))
    silver_label:setAnchorPoint(cc.p(0.5,0.5))
    silver_label:setFontSize(21)
    silver_label:setString("+99999")
    silver_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(silver_label)
    silver_label:setPositionInContainer(cc.p(184,126))
    table_elite_battle["silver_label"] = silver_label

    local exp_label = fc.FLabel:createBMFont()
    exp_label:setSize(cc.size(80,30))
    exp_label:setAnchorPoint(cc.p(0.5,0.5))
    exp_label:setFontSize(21)
    exp_label:setString("+99999")
    exp_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(exp_label)
    exp_label:setPositionInContainer(cc.p(401,126))
    table_elite_battle["exp_label"] = exp_label

    local img1 = fc.FExtensionsImage:create()
    img1:setImage("batch_ui/yuanbao_da.png")
    img1:setSize(cc.size(58,43))
    img1:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(img1)
    img1:setPositionInContainer(cc.p(117,125.5))
    table_elite_battle["img1"] = img1

    local bg_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    bg_rect2:setSize(cc.size(380,190))
    bg_rect2:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(bg_rect2)
    bg_rect2:setPositionInContainer(cc.p(266,247))
    table_elite_battle["bg_rect2"] = bg_rect2

    local img3 = fc.FExtensionsImage:create()
    img3:setImage("batch_ui/jing2_uizi.png")
    img3:setSize(cc.size(32,32))
    img3:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(img3)
    img3:setPositionInContainer(cc.p(317,128))
    table_elite_battle["img3"] = img3

    local img2 = fc.FExtensionsImage:create()
    img2:setImage("batch_ui/yan_uizi.png")
    img2:setSize(cc.size(32,32))
    img2:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(img2)
    img2:setPositionInContainer(cc.p(343,128))
    table_elite_battle["img2"] = img2

    return table_elite_battle

end

