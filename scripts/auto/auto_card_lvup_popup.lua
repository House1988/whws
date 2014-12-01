function createcard_lvup_popup()

    local table_card_lvup_popup = {}

    local card_lvup_popup = fc.FContainerPanel:create()
    card_lvup_popup:setSize(cc.size(960,640))
    table_card_lvup_popup["card_lvup_popup"] = card_lvup_popup

    local clp_bottom_panel = fc.FContainerPanel:create()
    clp_bottom_panel:setSize(cc.size(534,605))
    clp_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    card_lvup_popup:appendComponent(clp_bottom_panel)
    clp_bottom_panel:setPositionInContainer(cc.p(480,320.5))
    table_card_lvup_popup["clp_bottom_panel"] = clp_bottom_panel

    local clp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    clp_wen_la:setSize(cc.size(412,500))
    clp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_wen_la)
    clp_wen_la:setPositionInContainer(cc.p(267,320))
    table_card_lvup_popup["clp_wen_la"] = clp_wen_la

    local clp_zhou_up = fc.FExtensionsImage:create()
    clp_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    clp_zhou_up:setSize(cc.size(52,534))
    clp_zhou_up:setRotation(90)
    clp_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_zhou_up)
    clp_zhou_up:setPositionInContainer(cc.p(267,60))
    table_card_lvup_popup["clp_zhou_up"] = clp_zhou_up

    local clp_zhou_down = fc.FExtensionsImage:create()
    clp_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    clp_zhou_down:setSize(cc.size(52,534))
    clp_zhou_down:setRotation(90)
    clp_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_zhou_down)
    clp_zhou_down:setPositionInContainer(cc.p(267,577))
    table_card_lvup_popup["clp_zhou_down"] = clp_zhou_down

    local clp_close = fc.FScaleButton:create()
    clp_close:setSize(cc.size(34,33))
    clp_close:setAnchorPoint(cc.p(0.5,0.5))
    clp_close:setButtonImage("batch_ui/guanbi_anniu2.png")
    clp_bottom_panel:appendComponent(clp_close)
    clp_close:setPositionInContainer(cc.p(492,60.5))
    table_card_lvup_popup["clp_close"] = clp_close

    local clp_titleBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    clp_titleBg:setSize(cc.size(260,50))
    clp_titleBg:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_titleBg)
    clp_titleBg:setPositionInContainer(cc.p(277,59))
    table_card_lvup_popup["clp_titleBg"] = clp_titleBg

    local clp_ui_sheng = fc.FExtensionsImage:create()
    clp_ui_sheng:setImage("batch_ui/sheng1.png")
    clp_ui_sheng:setSize(cc.size(59,59))
    clp_ui_sheng:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_ui_sheng)
    clp_ui_sheng:setPositionInContainer(cc.p(232.5,60.5))
    table_card_lvup_popup["clp_ui_sheng"] = clp_ui_sheng

    local clp_ui_ji = fc.FExtensionsImage:create()
    clp_ui_ji:setImage("batch_ui/ji7.png")
    clp_ui_ji:setSize(cc.size(59,59))
    clp_ui_ji:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_ui_ji)
    clp_ui_ji:setPositionInContainer(cc.p(301.5,60.5))
    table_card_lvup_popup["clp_ui_ji"] = clp_ui_ji

    local clp_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    clp_rect1:setSize(cc.size(384,472))
    clp_rect1:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_rect1)
    clp_rect1:setPositionInContainer(cc.p(267,320))
    table_card_lvup_popup["clp_rect1"] = clp_rect1

    local clp_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    clp_rect2:setSize(cc.size(384,472))
    clp_rect2:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_rect2)
    clp_rect2:setPositionInContainer(cc.p(267,320))
    table_card_lvup_popup["clp_rect2"] = clp_rect2

    local clp_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    clp_rect3:setSize(cc.size(384,200))
    clp_rect3:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_rect3)
    clp_rect3:setPositionInContainer(cc.p(267,456))
    table_card_lvup_popup["clp_rect3"] = clp_rect3

    local clp_label_tiao1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    clp_label_tiao1:setSize(cc.size(380,200))
    clp_label_tiao1:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_label_tiao1)
    clp_label_tiao1:setPositionInContainer(cc.p(267,221))
    table_card_lvup_popup["clp_label_tiao1"] = clp_label_tiao1

    local clp_image_bg = fc.FExtensionsImage:create()
    clp_image_bg:setImage("batch_ui/teshutouxiangkuang.png")
    clp_image_bg:setSize(cc.size(172,172))
    clp_image_bg:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_image_bg)
    clp_image_bg:setPositionInContainer(cc.p(267,224))
    table_card_lvup_popup["clp_image_bg"] = clp_image_bg

    local clp_quality = fc.FExtensionsImage:create()
    clp_quality:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_quality)
    clp_quality:setPositionInContainer(cc.p(267,224))
    table_card_lvup_popup["clp_quality"] = clp_quality

    local clp_icon = fc.FExtensionsImage:create()
    clp_icon:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_icon)
    clp_icon:setPositionInContainer(cc.p(267,224))
    table_card_lvup_popup["clp_icon"] = clp_icon

    local label1 = fc.FLabel:createBMFont()
    label1:setSize(cc.size(100,30))
    label1:setAnchorPoint(cc.p(0.5,0.5))
    label1:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	label1:setString("啟稟皇上")
     else
     	label1:setString("启禀皇上")
     end
    label1:setColor(cc.c3b(106,68,19))
    clp_bottom_panel:appendComponent(label1)
    label1:setPositionInContainer(cc.p(142,102))
    table_card_lvup_popup["label1"] = label1

    local label2 = fc.FLabel:createBMFont()
    label2:setSize(cc.size(50,30))
    label2:setAnchorPoint(cc.p(0.5,0.5))
    label2:setFontSize(20)
    label2:setString("名臣")
    label2:setColor(cc.c3b(106,68,19))
    clp_bottom_panel:appendComponent(label2)
    label2:setPositionInContainer(cc.p(227,102))
    table_card_lvup_popup["label2"] = label2

    local label3 = fc.FLabel:createBMFont()
    label3:setSize(cc.size(100,30))
    label3:setAnchorPoint(cc.p(0.5,0.5))
    label3:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	label3:setString("啟稟皇上")
     else
     	label3:setString("启禀皇上")
     end
    label3:setColor(cc.c3b(206,53,0))
    clp_bottom_panel:appendComponent(label3)
    label3:setPositionInContainer(cc.p(312,102))
    table_card_lvup_popup["label3"] = label3

    local label4 = fc.FLabel:createBMFont()
    label4:setSize(cc.size(70,30))
    label4:setAnchorPoint(cc.p(0.5,0.5))
    label4:setFontSize(20)
    label4:setString("升级了！")
    label4:setColor(cc.c3b(106,68,19))
    clp_bottom_panel:appendComponent(label4)
    label4:setPositionInContainer(cc.p(407,102))
    table_card_lvup_popup["label4"] = label4

    local clp_label_tiao2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    clp_label_tiao2:setSize(cc.size(380,49))
    clp_label_tiao2:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_label_tiao2)
    clp_label_tiao2:setPositionInContainer(cc.p(267,406.5))
    table_card_lvup_popup["clp_label_tiao2"] = clp_label_tiao2

    local clp_label_tiao3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    clp_label_tiao3:setSize(cc.size(380,49))
    clp_label_tiao3:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(clp_label_tiao3)
    clp_label_tiao3:setPositionInContainer(cc.p(267,455.5))
    table_card_lvup_popup["clp_label_tiao3"] = clp_label_tiao3

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(197,329.5))
    table_card_lvup_popup["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(232,329.5))
    table_card_lvup_popup["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(267,329.5))
    table_card_lvup_popup["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(302,329.5))
    table_card_lvup_popup["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(337,329.5))
    table_card_lvup_popup["xing_dark"] = xing_dark

    local xing1 = fc.FExtensionsImage:create()
    xing1:setImage("batch_ui/xingxing.png")
    xing1:setSize(cc.size(20,19))
    xing1:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing1)
    xing1:setPositionInContainer(cc.p(197,329.5))
    table_card_lvup_popup["xing1"] = xing1

    local xing2 = fc.FExtensionsImage:create()
    xing2:setImage("batch_ui/xingxing.png")
    xing2:setSize(cc.size(20,19))
    xing2:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing2)
    xing2:setPositionInContainer(cc.p(232,329.5))
    table_card_lvup_popup["xing2"] = xing2

    local xing3 = fc.FExtensionsImage:create()
    xing3:setImage("batch_ui/xingxing.png")
    xing3:setSize(cc.size(20,19))
    xing3:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing3)
    xing3:setPositionInContainer(cc.p(267,329.5))
    table_card_lvup_popup["xing3"] = xing3

    local xing4 = fc.FExtensionsImage:create()
    xing4:setImage("batch_ui/xingxing.png")
    xing4:setSize(cc.size(20,19))
    xing4:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing4)
    xing4:setPositionInContainer(cc.p(302,329.5))
    table_card_lvup_popup["xing4"] = xing4

    local xing5 = fc.FExtensionsImage:create()
    xing5:setImage("batch_ui/xingxing.png")
    xing5:setSize(cc.size(20,19))
    xing5:setAnchorPoint(cc.p(0.5,0.5))
    clp_bottom_panel:appendComponent(xing5)
    xing5:setPositionInContainer(cc.p(337,329.5))
    table_card_lvup_popup["xing5"] = xing5

    local des1 = fc.FLabel:createBMFont()
    des1:setSize(cc.size(180,30))
    des1:setAnchorPoint(cc.p(0.5,0.5))
    des1:setFontSize(20)
    des1:setString("步兵步兵")
    des1:setColor(cc.c3b(106,68,19))
    clp_bottom_panel:appendComponent(des1)
    des1:setPositionInContainer(cc.p(267,407))
    table_card_lvup_popup["des1"] = des1

    local des2 = fc.FLabel:createBMFont()
    des2:setSize(cc.size(180,30))
    des2:setAnchorPoint(cc.p(0.5,0.5))
    des2:setFontSize(20)
    des2:setString("步兵步兵")
    des2:setColor(cc.c3b(106,68,19))
    clp_bottom_panel:appendComponent(des2)
    des2:setPositionInContainer(cc.p(267,456))
    table_card_lvup_popup["des2"] = des2

    local clp_queding = fc.FScaleButton:create()
    clp_queding:setSize(cc.size(144,53))
    clp_queding:setAnchorPoint(cc.p(0.5,0.5))
    clp_queding:setButtonImage("batch_ui/putonganniu1_up.png")
    clp_bottom_panel:appendComponent(clp_queding)
    clp_queding:setPositionInContainer(cc.p(267,516.5))
    table_card_lvup_popup["clp_queding"] = clp_queding

    local clp_que = fc.FShaderExtensionsImage:create(0)
    clp_que:setAnchorPoint(cc.p(0.5,0.5))
    clp_que:setImage("batch_ui/que_uizi.png")
    clp_que:setSize(cc.size(32,32))
    clp_queding:appendComponent(clp_que)
    clp_que:setPositionInContainer(cc.p(54,26))
    table_card_lvup_popup["clp_que"] = clp_que

    local clp_ding = fc.FShaderExtensionsImage:create(0)
    clp_ding:setAnchorPoint(cc.p(0.5,0.5))
    clp_ding:setImage("batch_ui/ding_uizi.png")
    clp_ding:setSize(cc.size(32,32))
    clp_queding:appendComponent(clp_ding)
    clp_ding:setPositionInContainer(cc.p(90,26))
    table_card_lvup_popup["clp_ding"] = clp_ding

    return table_card_lvup_popup

end

